; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50412 () Bool)

(assert start!50412)

(declare-fun res!197509 () Bool)

(declare-fun e!163374 () Bool)

(assert (=> start!50412 (=> (not res!197509) (not e!163374))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50412 (= res!197509 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50412 e!163374))

(assert (=> start!50412 true))

(declare-datatypes ((array!12527 0))(
  ( (array!12528 (arr!6489 (Array (_ BitVec 32) (_ BitVec 8))) (size!5502 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9968 0))(
  ( (BitStream!9969 (buf!5977 array!12527) (currentByte!11106 (_ BitVec 32)) (currentBit!11101 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9968)

(declare-fun e!163375 () Bool)

(declare-fun inv!12 (BitStream!9968) Bool)

(assert (=> start!50412 (and (inv!12 thiss!1830) e!163375)))

(declare-fun b!236318 () Bool)

(declare-fun res!197514 () Bool)

(assert (=> b!236318 (=> (not res!197514) (not e!163374))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236318 (= res!197514 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236319 () Bool)

(declare-fun e!163373 () Bool)

(assert (=> b!236319 (= e!163374 e!163373)))

(declare-fun res!197513 () Bool)

(assert (=> b!236319 (=> (not res!197513) (not e!163373))))

(assert (=> b!236319 (= res!197513 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((tuple2!19932 0))(
  ( (tuple2!19933 (_1!10870 Bool) (_2!10870 BitStream!9968)) )
))
(declare-fun lt!371586 () tuple2!19932)

(declare-fun readBit!0 (BitStream!9968) tuple2!19932)

(assert (=> b!236319 (= lt!371586 (readBit!0 thiss!1830))))

(declare-fun b!236320 () Bool)

(declare-fun array_inv!5243 (array!12527) Bool)

(assert (=> b!236320 (= e!163375 (array_inv!5243 (buf!5977 thiss!1830)))))

(declare-fun b!236321 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236321 (= e!163373 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10870 lt!371586)))) ((_ sign_extend 32) (currentByte!11106 (_2!10870 lt!371586))) ((_ sign_extend 32) (currentBit!11101 (_2!10870 lt!371586))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))))

(declare-fun b!236322 () Bool)

(declare-fun res!197510 () Bool)

(assert (=> b!236322 (=> (not res!197510) (not e!163374))))

(assert (=> b!236322 (= res!197510 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236323 () Bool)

(declare-fun res!197511 () Bool)

(assert (=> b!236323 (=> (not res!197511) (not e!163374))))

(assert (=> b!236323 (= res!197511 (validate_offset_bits!1 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236324 () Bool)

(declare-fun res!197512 () Bool)

(assert (=> b!236324 (=> (not res!197512) (not e!163374))))

(assert (=> b!236324 (= res!197512 (not (= nBits!581 i!752)))))

(assert (= (and start!50412 res!197509) b!236323))

(assert (= (and b!236323 res!197511) b!236318))

(assert (= (and b!236318 res!197514) b!236322))

(assert (= (and b!236322 res!197510) b!236324))

(assert (= (and b!236324 res!197512) b!236319))

(assert (= (and b!236319 res!197513) b!236321))

(assert (= start!50412 b!236320))

(declare-fun m!358849 () Bool)

(assert (=> b!236322 m!358849))

(declare-fun m!358851 () Bool)

(assert (=> b!236320 m!358851))

(declare-fun m!358853 () Bool)

(assert (=> b!236318 m!358853))

(declare-fun m!358855 () Bool)

(assert (=> b!236319 m!358855))

(declare-fun m!358857 () Bool)

(assert (=> b!236323 m!358857))

(declare-fun m!358859 () Bool)

(assert (=> b!236321 m!358859))

(declare-fun m!358861 () Bool)

(assert (=> start!50412 m!358861))

(push 1)

(assert (not b!236322))

(assert (not b!236321))

(assert (not b!236318))

(assert (not b!236319))

(assert (not b!236320))

(assert (not b!236323))

(assert (not start!50412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79734 () Bool)

(assert (=> d!79734 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236322 d!79734))

(declare-fun d!79736 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79736 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10870 lt!371586)))) ((_ sign_extend 32) (currentByte!11106 (_2!10870 lt!371586))) ((_ sign_extend 32) (currentBit!11101 (_2!10870 lt!371586))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10870 lt!371586)))) ((_ sign_extend 32) (currentByte!11106 (_2!10870 lt!371586))) ((_ sign_extend 32) (currentBit!11101 (_2!10870 lt!371586)))) ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))))

(declare-fun bs!19914 () Bool)

(assert (= bs!19914 d!79736))

(declare-fun m!358865 () Bool)

(assert (=> bs!19914 m!358865))

(assert (=> b!236321 d!79736))

(declare-fun d!79738 () Bool)

(declare-fun e!163397 () Bool)

(assert (=> d!79738 e!163397))

(declare-fun res!197523 () Bool)

(assert (=> d!79738 (=> (not res!197523) (not e!163397))))

(declare-datatypes ((Unit!17355 0))(
  ( (Unit!17356) )
))
(declare-datatypes ((tuple2!19938 0))(
  ( (tuple2!19939 (_1!10873 Unit!17355) (_2!10873 BitStream!9968)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9968) tuple2!19938)

(assert (=> d!79738 (= res!197523 (= (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830))) (buf!5977 thiss!1830)))))

(declare-fun lt!371646 () Bool)

(assert (=> d!79738 (= lt!371646 (not (= (bvand ((_ sign_extend 24) (select (arr!6489 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11101 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371644 () tuple2!19932)

(assert (=> d!79738 (= lt!371644 (tuple2!19933 (not (= (bvand ((_ sign_extend 24) (select (arr!6489 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11101 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10873 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79738 (validate_offset_bit!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830)))))

(assert (=> d!79738 (= (readBit!0 thiss!1830) lt!371644)))

(declare-fun b!236333 () Bool)

(declare-fun lt!371647 () (_ BitVec 64))

(declare-fun lt!371649 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236333 (= e!163397 (= (bitIndex!0 (size!5502 (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830)))) (currentByte!11106 (_2!10873 (increaseBitIndex!0 thiss!1830))) (currentBit!11101 (_2!10873 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371649 lt!371647)))))

(assert (=> b!236333 (or (not (= (bvand lt!371649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371647 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371649 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371649 lt!371647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236333 (= lt!371647 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236333 (= lt!371649 (bitIndex!0 (size!5502 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830) (currentBit!11101 thiss!1830)))))

(declare-fun lt!371643 () Bool)

(assert (=> b!236333 (= lt!371643 (not (= (bvand ((_ sign_extend 24) (select (arr!6489 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11101 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371645 () Bool)

(assert (=> b!236333 (= lt!371645 (not (= (bvand ((_ sign_extend 24) (select (arr!6489 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11101 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371648 () Bool)

(assert (=> b!236333 (= lt!371648 (not (= (bvand ((_ sign_extend 24) (select (arr!6489 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11101 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79738 res!197523) b!236333))

(declare-fun m!358901 () Bool)

(assert (=> d!79738 m!358901))

(declare-fun m!358903 () Bool)

(assert (=> d!79738 m!358903))

(declare-fun m!358905 () Bool)

(assert (=> d!79738 m!358905))

(declare-fun m!358907 () Bool)

(assert (=> d!79738 m!358907))

(declare-fun m!358909 () Bool)

(assert (=> b!236333 m!358909))

(assert (=> b!236333 m!358901))

(assert (=> b!236333 m!358903))

(declare-fun m!358911 () Bool)

(assert (=> b!236333 m!358911))

(assert (=> b!236333 m!358905))

(assert (=> b!236319 d!79738))

(declare-fun d!79760 () Bool)

(assert (=> d!79760 (= (array_inv!5243 (buf!5977 thiss!1830)) (bvsge (size!5502 (buf!5977 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236320 d!79760))

(declare-fun d!79762 () Bool)

(assert (=> d!79762 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236318 d!79762))

(declare-fun d!79764 () Bool)

(assert (=> d!79764 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19920 () Bool)

(assert (= bs!19920 d!79764))

(declare-fun m!358913 () Bool)

(assert (=> bs!19920 m!358913))

(assert (=> b!236323 d!79764))

(declare-fun d!79766 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79766 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11101 thiss!1830) (currentByte!11106 thiss!1830) (size!5502 (buf!5977 thiss!1830))))))

(declare-fun bs!19921 () Bool)

(assert (= bs!19921 d!79766))

(declare-fun m!358915 () Bool)

(assert (=> bs!19921 m!358915))

(assert (=> start!50412 d!79766))

(push 1)

(assert (not d!79764))

(assert (not b!236333))

(assert (not d!79766))

(assert (not d!79736))

(assert (not d!79738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79796 () Bool)

(assert (=> d!79796 (= (invariant!0 (currentBit!11101 thiss!1830) (currentByte!11106 thiss!1830) (size!5502 (buf!5977 thiss!1830))) (and (bvsge (currentBit!11101 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11101 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11106 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11106 thiss!1830) (size!5502 (buf!5977 thiss!1830))) (and (= (currentBit!11101 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11106 thiss!1830) (size!5502 (buf!5977 thiss!1830)))))))))

(assert (=> d!79766 d!79796))

(declare-fun d!79798 () Bool)

(declare-fun e!163414 () Bool)

(assert (=> d!79798 e!163414))

(declare-fun res!197556 () Bool)

(assert (=> d!79798 (=> (not res!197556) (not e!163414))))

(declare-fun lt!371743 () (_ BitVec 64))

(declare-fun lt!371744 () (_ BitVec 64))

(declare-fun lt!371740 () (_ BitVec 64))

(assert (=> d!79798 (= res!197556 (= lt!371743 (bvsub lt!371744 lt!371740)))))

(assert (=> d!79798 (or (= (bvand lt!371744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371744 lt!371740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79798 (= lt!371740 (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830))))) ((_ sign_extend 32) (currentByte!11106 (_2!10873 (increaseBitIndex!0 thiss!1830)))) ((_ sign_extend 32) (currentBit!11101 (_2!10873 (increaseBitIndex!0 thiss!1830))))))))

(declare-fun lt!371741 () (_ BitVec 64))

(declare-fun lt!371742 () (_ BitVec 64))

(assert (=> d!79798 (= lt!371744 (bvmul lt!371741 lt!371742))))

(assert (=> d!79798 (or (= lt!371741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371742 (bvsdiv (bvmul lt!371741 lt!371742) lt!371741)))))

(assert (=> d!79798 (= lt!371742 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79798 (= lt!371741 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79798 (= lt!371743 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11106 (_2!10873 (increaseBitIndex!0 thiss!1830)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11101 (_2!10873 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79798 (invariant!0 (currentBit!11101 (_2!10873 (increaseBitIndex!0 thiss!1830))) (currentByte!11106 (_2!10873 (increaseBitIndex!0 thiss!1830))) (size!5502 (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830)))))))

(assert (=> d!79798 (= (bitIndex!0 (size!5502 (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830)))) (currentByte!11106 (_2!10873 (increaseBitIndex!0 thiss!1830))) (currentBit!11101 (_2!10873 (increaseBitIndex!0 thiss!1830)))) lt!371743)))

(declare-fun b!236366 () Bool)

(declare-fun res!197557 () Bool)

(assert (=> b!236366 (=> (not res!197557) (not e!163414))))

(assert (=> b!236366 (= res!197557 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371743))))

(declare-fun b!236367 () Bool)

(declare-fun lt!371745 () (_ BitVec 64))

(assert (=> b!236367 (= e!163414 (bvsle lt!371743 (bvmul lt!371745 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236367 (or (= lt!371745 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371745 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371745)))))

(assert (=> b!236367 (= lt!371745 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10873 (increaseBitIndex!0 thiss!1830))))))))

(assert (= (and d!79798 res!197556) b!236366))

(assert (= (and b!236366 res!197557) b!236367))

(declare-fun m!358933 () Bool)

(assert (=> d!79798 m!358933))

(declare-fun m!358935 () Bool)

(assert (=> d!79798 m!358935))

(assert (=> b!236333 d!79798))

(declare-fun d!79800 () Bool)

(declare-fun e!163417 () Bool)

(assert (=> d!79800 e!163417))

(declare-fun res!197562 () Bool)

(assert (=> d!79800 (=> (not res!197562) (not e!163417))))

(declare-fun lt!371759 () (_ BitVec 64))

(declare-fun lt!371758 () tuple2!19938)

(declare-fun lt!371756 () (_ BitVec 64))

(assert (=> d!79800 (= res!197562 (= (bvadd lt!371759 lt!371756) (bitIndex!0 (size!5502 (buf!5977 (_2!10873 lt!371758))) (currentByte!11106 (_2!10873 lt!371758)) (currentBit!11101 (_2!10873 lt!371758)))))))

(assert (=> d!79800 (or (not (= (bvand lt!371759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371756 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371759 lt!371756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79800 (= lt!371756 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79800 (= lt!371759 (bitIndex!0 (size!5502 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830) (currentBit!11101 thiss!1830)))))

(declare-fun Unit!17361 () Unit!17355)

(declare-fun Unit!17362 () Unit!17355)

(assert (=> d!79800 (= lt!371758 (ite (bvslt (currentBit!11101 thiss!1830) #b00000000000000000000000000000111) (tuple2!19939 Unit!17361 (BitStream!9969 (buf!5977 thiss!1830) (currentByte!11106 thiss!1830) (bvadd (currentBit!11101 thiss!1830) #b00000000000000000000000000000001))) (tuple2!19939 Unit!17362 (BitStream!9969 (buf!5977 thiss!1830) (bvadd (currentByte!11106 thiss!1830) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79800 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79800 (= (increaseBitIndex!0 thiss!1830) lt!371758)))

(declare-fun b!236372 () Bool)

(declare-fun res!197563 () Bool)

(assert (=> b!236372 (=> (not res!197563) (not e!163417))))

(declare-fun lt!371757 () (_ BitVec 64))

(declare-fun lt!371760 () (_ BitVec 64))

(assert (=> b!236372 (= res!197563 (= (bvsub lt!371757 lt!371760) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!236372 (or (= (bvand lt!371757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371757 lt!371760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236372 (= lt!371760 (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10873 lt!371758)))) ((_ sign_extend 32) (currentByte!11106 (_2!10873 lt!371758))) ((_ sign_extend 32) (currentBit!11101 (_2!10873 lt!371758)))))))

(assert (=> b!236372 (= lt!371757 (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))))))

(declare-fun b!236373 () Bool)

(assert (=> b!236373 (= e!163417 (= (size!5502 (buf!5977 thiss!1830)) (size!5502 (buf!5977 (_2!10873 lt!371758)))))))

(assert (= (and d!79800 res!197562) b!236372))

(assert (= (and b!236372 res!197563) b!236373))

(declare-fun m!358937 () Bool)

(assert (=> d!79800 m!358937))

(assert (=> d!79800 m!358911))

(assert (=> d!79800 m!358913))

(declare-fun m!358939 () Bool)

(assert (=> b!236372 m!358939))

(assert (=> b!236372 m!358913))

(assert (=> b!236333 d!79800))

(declare-fun d!79802 () Bool)

(declare-fun e!163418 () Bool)

(assert (=> d!79802 e!163418))

(declare-fun res!197564 () Bool)

(assert (=> d!79802 (=> (not res!197564) (not e!163418))))

(declare-fun lt!371761 () (_ BitVec 64))

(declare-fun lt!371765 () (_ BitVec 64))

(declare-fun lt!371764 () (_ BitVec 64))

(assert (=> d!79802 (= res!197564 (= lt!371764 (bvsub lt!371765 lt!371761)))))

(assert (=> d!79802 (or (= (bvand lt!371765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!371765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!371765 lt!371761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79802 (= lt!371761 (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))))))

(declare-fun lt!371762 () (_ BitVec 64))

(declare-fun lt!371763 () (_ BitVec 64))

(assert (=> d!79802 (= lt!371765 (bvmul lt!371762 lt!371763))))

(assert (=> d!79802 (or (= lt!371762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!371763 (bvsdiv (bvmul lt!371762 lt!371763) lt!371762)))))

(assert (=> d!79802 (= lt!371763 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79802 (= lt!371762 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))))))

(assert (=> d!79802 (= lt!371764 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11106 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11101 thiss!1830))))))

(assert (=> d!79802 (invariant!0 (currentBit!11101 thiss!1830) (currentByte!11106 thiss!1830) (size!5502 (buf!5977 thiss!1830)))))

(assert (=> d!79802 (= (bitIndex!0 (size!5502 (buf!5977 thiss!1830)) (currentByte!11106 thiss!1830) (currentBit!11101 thiss!1830)) lt!371764)))

(declare-fun b!236374 () Bool)

(declare-fun res!197565 () Bool)

(assert (=> b!236374 (=> (not res!197565) (not e!163418))))

(assert (=> b!236374 (= res!197565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!371764))))

(declare-fun b!236375 () Bool)

(declare-fun lt!371766 () (_ BitVec 64))

(assert (=> b!236375 (= e!163418 (bvsle lt!371764 (bvmul lt!371766 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236375 (or (= lt!371766 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!371766 #b0000000000000000000000000000000000000000000000000000000000001000) lt!371766)))))

(assert (=> b!236375 (= lt!371766 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))))))

(assert (= (and d!79802 res!197564) b!236374))

(assert (= (and b!236374 res!197565) b!236375))

(assert (=> d!79802 m!358913))

(assert (=> d!79802 m!358915))

(assert (=> b!236333 d!79802))

(assert (=> d!79738 d!79800))

(declare-fun d!79804 () Bool)

(assert (=> d!79804 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19924 () Bool)

(assert (= bs!19924 d!79804))

(assert (=> bs!19924 m!358913))

(assert (=> d!79738 d!79804))

(declare-fun d!79806 () Bool)

(assert (=> d!79806 (= (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) ((_ sign_extend 32) (currentByte!11106 thiss!1830)) ((_ sign_extend 32) (currentBit!11101 thiss!1830))) (bvsub (bvmul ((_ sign_extend 32) (size!5502 (buf!5977 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11106 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11101 thiss!1830)))))))

(assert (=> d!79764 d!79806))

(declare-fun d!79808 () Bool)

(assert (=> d!79808 (= (remainingBits!0 ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10870 lt!371586)))) ((_ sign_extend 32) (currentByte!11106 (_2!10870 lt!371586))) ((_ sign_extend 32) (currentBit!11101 (_2!10870 lt!371586)))) (bvsub (bvmul ((_ sign_extend 32) (size!5502 (buf!5977 (_2!10870 lt!371586)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11106 (_2!10870 lt!371586))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11101 (_2!10870 lt!371586))))))))

(assert (=> d!79736 d!79808))

(push 1)

(assert (not d!79804))

(assert (not d!79802))

(assert (not b!236372))

(assert (not d!79798))

(assert (not d!79800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

