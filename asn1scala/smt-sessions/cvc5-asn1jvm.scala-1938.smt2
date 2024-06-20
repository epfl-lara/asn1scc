; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50546 () Bool)

(assert start!50546)

(declare-fun b!236552 () Bool)

(declare-fun e!163569 () Bool)

(declare-fun e!163570 () Bool)

(assert (=> b!236552 (= e!163569 e!163570)))

(declare-fun res!197726 () Bool)

(assert (=> b!236552 (=> (not res!197726) (not e!163570))))

(declare-datatypes ((array!12550 0))(
  ( (array!12551 (arr!6496 (Array (_ BitVec 32) (_ BitVec 8))) (size!5509 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9982 0))(
  ( (BitStream!9983 (buf!5984 array!12550) (currentByte!11134 (_ BitVec 32)) (currentBit!11129 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!19964 0))(
  ( (tuple2!19965 (_1!10886 (_ BitVec 64)) (_2!10886 BitStream!9982)) )
))
(declare-fun lt!371951 () tuple2!19964)

(declare-fun thiss!1830 () BitStream!9982)

(assert (=> b!236552 (= res!197726 (= (buf!5984 (_2!10886 lt!371951)) (buf!5984 thiss!1830)))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!19966 0))(
  ( (tuple2!19967 (_1!10887 Bool) (_2!10887 BitStream!9982)) )
))
(declare-fun lt!371952 () tuple2!19966)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!9982 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!19964)

(assert (=> b!236552 (= lt!371951 (readNLeastSignificantBitsLoop!0 (_2!10887 lt!371952) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!9982) tuple2!19966)

(assert (=> b!236552 (= lt!371952 (readBit!0 thiss!1830))))

(declare-fun b!236553 () Bool)

(declare-fun res!197723 () Bool)

(assert (=> b!236553 (=> (not res!197723) (not e!163569))))

(assert (=> b!236553 (= res!197723 (not (= nBits!581 i!752)))))

(declare-fun b!236554 () Bool)

(declare-fun res!197727 () Bool)

(assert (=> b!236554 (=> (not res!197727) (not e!163569))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236554 (= res!197727 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236555 () Bool)

(declare-fun res!197724 () Bool)

(assert (=> b!236555 (=> (not res!197724) (not e!163569))))

(assert (=> b!236555 (= res!197724 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun res!197725 () Bool)

(assert (=> start!50546 (=> (not res!197725) (not e!163569))))

(assert (=> start!50546 (= res!197725 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50546 e!163569))

(assert (=> start!50546 true))

(declare-fun e!163568 () Bool)

(declare-fun inv!12 (BitStream!9982) Bool)

(assert (=> start!50546 (and (inv!12 thiss!1830) e!163568)))

(declare-fun b!236556 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!236556 (= e!163570 (not (invariant!0 (currentBit!11129 (_2!10886 lt!371951)) (currentByte!11134 (_2!10886 lt!371951)) (size!5509 (buf!5984 (_2!10886 lt!371951))))))))

(declare-fun b!236557 () Bool)

(declare-fun array_inv!5250 (array!12550) Bool)

(assert (=> b!236557 (= e!163568 (array_inv!5250 (buf!5984 thiss!1830)))))

(declare-fun b!236558 () Bool)

(declare-fun res!197722 () Bool)

(assert (=> b!236558 (=> (not res!197722) (not e!163569))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236558 (= res!197722 (validate_offset_bits!1 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(assert (= (and start!50546 res!197725) b!236558))

(assert (= (and b!236558 res!197722) b!236554))

(assert (= (and b!236554 res!197727) b!236555))

(assert (= (and b!236555 res!197724) b!236553))

(assert (= (and b!236553 res!197723) b!236552))

(assert (= (and b!236552 res!197726) b!236556))

(assert (= start!50546 b!236557))

(declare-fun m!359145 () Bool)

(assert (=> b!236555 m!359145))

(declare-fun m!359147 () Bool)

(assert (=> start!50546 m!359147))

(declare-fun m!359149 () Bool)

(assert (=> b!236556 m!359149))

(declare-fun m!359151 () Bool)

(assert (=> b!236552 m!359151))

(declare-fun m!359153 () Bool)

(assert (=> b!236552 m!359153))

(declare-fun m!359155 () Bool)

(assert (=> b!236554 m!359155))

(declare-fun m!359157 () Bool)

(assert (=> b!236557 m!359157))

(declare-fun m!359159 () Bool)

(assert (=> b!236558 m!359159))

(push 1)

(assert (not b!236557))

(assert (not b!236558))

(assert (not start!50546))

(assert (not b!236556))

(assert (not b!236555))

(assert (not b!236552))

(assert (not b!236554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79920 () Bool)

(assert (=> d!79920 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236555 d!79920))

(declare-fun d!79922 () Bool)

(assert (=> d!79922 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11129 thiss!1830) (currentByte!11134 thiss!1830) (size!5509 (buf!5984 thiss!1830))))))

(declare-fun bs!19953 () Bool)

(assert (= bs!19953 d!79922))

(declare-fun m!359195 () Bool)

(assert (=> bs!19953 m!359195))

(assert (=> start!50546 d!79922))

(declare-fun d!79924 () Bool)

(assert (=> d!79924 (= (invariant!0 (currentBit!11129 (_2!10886 lt!371951)) (currentByte!11134 (_2!10886 lt!371951)) (size!5509 (buf!5984 (_2!10886 lt!371951)))) (and (bvsge (currentBit!11129 (_2!10886 lt!371951)) #b00000000000000000000000000000000) (bvslt (currentBit!11129 (_2!10886 lt!371951)) #b00000000000000000000000000001000) (bvsge (currentByte!11134 (_2!10886 lt!371951)) #b00000000000000000000000000000000) (or (bvslt (currentByte!11134 (_2!10886 lt!371951)) (size!5509 (buf!5984 (_2!10886 lt!371951)))) (and (= (currentBit!11129 (_2!10886 lt!371951)) #b00000000000000000000000000000000) (= (currentByte!11134 (_2!10886 lt!371951)) (size!5509 (buf!5984 (_2!10886 lt!371951))))))))))

(assert (=> b!236556 d!79924))

(declare-fun d!79926 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79926 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19954 () Bool)

(assert (= bs!19954 d!79926))

(declare-fun m!359197 () Bool)

(assert (=> bs!19954 m!359197))

(assert (=> b!236558 d!79926))

(declare-fun b!236636 () Bool)

(declare-fun res!197791 () Bool)

(declare-fun e!163617 () Bool)

(assert (=> b!236636 (=> (not res!197791) (not e!163617))))

(declare-fun lt!372017 () tuple2!19964)

(declare-fun lt!372011 () (_ BitVec 64))

(declare-fun lt!372014 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236636 (= res!197791 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10886 lt!372017))) (currentByte!11134 (_2!10886 lt!372017)) (currentBit!11129 (_2!10886 lt!372017))) (bvadd lt!372014 lt!372011)))))

(assert (=> b!236636 (or (not (= (bvand lt!372014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372011 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372014 lt!372011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236636 (= lt!372011 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236636 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236636 (= lt!372014 (bitIndex!0 (size!5509 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)) (currentBit!11129 (_2!10887 lt!371952))))))

(declare-fun b!236637 () Bool)

(declare-fun res!197790 () Bool)

(assert (=> b!236637 (=> (not res!197790) (not e!163617))))

(declare-fun lt!372012 () (_ BitVec 64))

(declare-fun lt!372013 () (_ BitVec 64))

(assert (=> b!236637 (= res!197790 (= (bvlshr (_1!10886 lt!372017) lt!372012) (bvlshr (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372013)))))

(assert (=> b!236637 (and (bvsge lt!372013 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372013 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236637 (= lt!372013 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236637 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236637 (and (bvsge lt!372012 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372012 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236637 (= lt!372012 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236637 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun b!236638 () Bool)

(declare-fun e!163615 () tuple2!19964)

(assert (=> b!236638 (= e!163615 (tuple2!19965 (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10887 lt!371952)))))

(declare-fun b!236639 () Bool)

(declare-fun lt!372015 () tuple2!19964)

(assert (=> b!236639 (= e!163615 (tuple2!19965 (_1!10886 lt!372015) (_2!10886 lt!372015)))))

(declare-fun lt!372010 () tuple2!19966)

(assert (=> b!236639 (= lt!372010 (readBit!0 (_2!10887 lt!371952)))))

(assert (=> b!236639 (= lt!372015 (readNLeastSignificantBitsLoop!0 (_2!10887 lt!372010) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10887 lt!372010) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!79928 () Bool)

(assert (=> d!79928 e!163617))

(declare-fun res!197792 () Bool)

(assert (=> d!79928 (=> (not res!197792) (not e!163617))))

(assert (=> d!79928 (= res!197792 (= (buf!5984 (_2!10886 lt!372017)) (buf!5984 (_2!10887 lt!371952))))))

(assert (=> d!79928 (= lt!372017 e!163615)))

(declare-fun c!11326 () Bool)

(assert (=> d!79928 (= c!11326 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!79928 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!79928 (= (readNLeastSignificantBitsLoop!0 (_2!10887 lt!371952) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372017)))

(declare-fun b!236640 () Bool)

(declare-fun res!197793 () Bool)

(assert (=> b!236640 (=> (not res!197793) (not e!163617))))

(assert (=> b!236640 (= res!197793 (= (bvand (_1!10886 lt!372017) (onesLSBLong!0 nBits!581)) (_1!10886 lt!372017)))))

(declare-fun e!163616 () Bool)

(declare-fun b!236641 () Bool)

(declare-fun lt!372018 () (_ BitVec 64))

(declare-datatypes ((tuple2!19980 0))(
  ( (tuple2!19981 (_1!10894 BitStream!9982) (_2!10894 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!9982) tuple2!19980)

(assert (=> b!236641 (= e!163616 (= (= (bvand (bvlshr (_1!10886 lt!372017) lt!372018) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10894 (readBitPure!0 (_2!10887 lt!371952)))))))

(assert (=> b!236641 (and (bvsge lt!372018 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372018 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372016 () (_ BitVec 32))

(assert (=> b!236641 (= lt!372018 ((_ sign_extend 32) (bvsub lt!372016 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!236641 (or (= (bvand lt!372016 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!372016 #b10000000000000000000000000000000) (bvand (bvsub lt!372016 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!236641 (= lt!372016 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236641 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236642 () Bool)

(assert (=> b!236642 (= e!163617 e!163616)))

(declare-fun res!197789 () Bool)

(assert (=> b!236642 (=> res!197789 e!163616)))

(assert (=> b!236642 (= res!197789 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(assert (= (and d!79928 c!11326) b!236638))

(assert (= (and d!79928 (not c!11326)) b!236639))

(assert (= (and d!79928 res!197792) b!236636))

(assert (= (and b!236636 res!197791) b!236637))

(assert (= (and b!236637 res!197790) b!236640))

(assert (= (and b!236640 res!197793) b!236642))

(assert (= (and b!236642 (not res!197789)) b!236641))

(declare-fun m!359211 () Bool)

(assert (=> b!236636 m!359211))

(declare-fun m!359213 () Bool)

(assert (=> b!236636 m!359213))

(declare-fun m!359215 () Bool)

(assert (=> b!236639 m!359215))

(declare-fun m!359217 () Bool)

(assert (=> b!236639 m!359217))

(assert (=> b!236640 m!359145))

(declare-fun m!359219 () Bool)

(assert (=> b!236641 m!359219))

(assert (=> b!236552 d!79928))

(declare-fun d!79940 () Bool)

(declare-fun e!163627 () Bool)

(assert (=> d!79940 e!163627))

(declare-fun res!197799 () Bool)

(assert (=> d!79940 (=> (not res!197799) (not e!163627))))

(declare-datatypes ((Unit!17377 0))(
  ( (Unit!17378) )
))
(declare-datatypes ((tuple2!19982 0))(
  ( (tuple2!19983 (_1!10895 Unit!17377) (_2!10895 BitStream!9982)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9982) tuple2!19982)

(assert (=> d!79940 (= res!197799 (= (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830))) (buf!5984 thiss!1830)))))

(declare-fun lt!372060 () Bool)

(assert (=> d!79940 (= lt!372060 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372056 () tuple2!19966)

(assert (=> d!79940 (= lt!372056 (tuple2!19967 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10895 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79940 (validate_offset_bit!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830)))))

(assert (=> d!79940 (= (readBit!0 thiss!1830) lt!372056)))

(declare-fun b!236648 () Bool)

(declare-fun lt!372057 () (_ BitVec 64))

(declare-fun lt!372055 () (_ BitVec 64))

(assert (=> b!236648 (= e!163627 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830)))) (currentByte!11134 (_2!10895 (increaseBitIndex!0 thiss!1830))) (currentBit!11129 (_2!10895 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372055 lt!372057)))))

(assert (=> b!236648 (or (not (= (bvand lt!372055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372057 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372055 lt!372057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236648 (= lt!372057 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236648 (= lt!372055 (bitIndex!0 (size!5509 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830) (currentBit!11129 thiss!1830)))))

(declare-fun lt!372054 () Bool)

(assert (=> b!236648 (= lt!372054 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372058 () Bool)

(assert (=> b!236648 (= lt!372058 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372059 () Bool)

(assert (=> b!236648 (= lt!372059 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79940 res!197799) b!236648))

(declare-fun m!359235 () Bool)

(assert (=> d!79940 m!359235))

(declare-fun m!359237 () Bool)

(assert (=> d!79940 m!359237))

(declare-fun m!359239 () Bool)

(assert (=> d!79940 m!359239))

(declare-fun m!359241 () Bool)

(assert (=> d!79940 m!359241))

(assert (=> b!236648 m!359235))

(assert (=> b!236648 m!359237))

(declare-fun m!359243 () Bool)

(assert (=> b!236648 m!359243))

(assert (=> b!236648 m!359239))

(declare-fun m!359245 () Bool)

(assert (=> b!236648 m!359245))

(assert (=> b!236552 d!79940))

(declare-fun d!79948 () Bool)

(assert (=> d!79948 (= (array_inv!5250 (buf!5984 thiss!1830)) (bvsge (size!5509 (buf!5984 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236557 d!79948))

(declare-fun d!79950 () Bool)

(assert (=> d!79950 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236554 d!79950))

(push 1)

(assert (not b!236640))

(assert (not d!79940))

(assert (not b!236641))

(assert (not d!79922))

(assert (not d!79926))

(assert (not b!236639))

(assert (not b!236648))

(assert (not b!236636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79982 () Bool)

(assert (=> d!79982 (= (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))) (bvsub (bvmul ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11134 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11129 thiss!1830)))))))

(assert (=> d!79926 d!79982))

(declare-fun d!79984 () Bool)

(declare-fun e!163659 () Bool)

(assert (=> d!79984 e!163659))

(declare-fun res!197846 () Bool)

(assert (=> d!79984 (=> (not res!197846) (not e!163659))))

(declare-fun lt!372193 () (_ BitVec 64))

(declare-fun lt!372194 () (_ BitVec 64))

(declare-fun lt!372191 () (_ BitVec 64))

(assert (=> d!79984 (= res!197846 (= lt!372191 (bvsub lt!372193 lt!372194)))))

(assert (=> d!79984 (or (= (bvand lt!372193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372193 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372193 lt!372194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79984 (= lt!372194 (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10886 lt!372017)))) ((_ sign_extend 32) (currentByte!11134 (_2!10886 lt!372017))) ((_ sign_extend 32) (currentBit!11129 (_2!10886 lt!372017)))))))

(declare-fun lt!372195 () (_ BitVec 64))

(declare-fun lt!372196 () (_ BitVec 64))

(assert (=> d!79984 (= lt!372193 (bvmul lt!372195 lt!372196))))

(assert (=> d!79984 (or (= lt!372195 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372196 (bvsdiv (bvmul lt!372195 lt!372196) lt!372195)))))

(assert (=> d!79984 (= lt!372196 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79984 (= lt!372195 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10886 lt!372017)))))))

(assert (=> d!79984 (= lt!372191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11134 (_2!10886 lt!372017))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11129 (_2!10886 lt!372017)))))))

(assert (=> d!79984 (invariant!0 (currentBit!11129 (_2!10886 lt!372017)) (currentByte!11134 (_2!10886 lt!372017)) (size!5509 (buf!5984 (_2!10886 lt!372017))))))

(assert (=> d!79984 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10886 lt!372017))) (currentByte!11134 (_2!10886 lt!372017)) (currentBit!11129 (_2!10886 lt!372017))) lt!372191)))

(declare-fun b!236703 () Bool)

(declare-fun res!197847 () Bool)

(assert (=> b!236703 (=> (not res!197847) (not e!163659))))

(assert (=> b!236703 (= res!197847 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372191))))

(declare-fun b!236704 () Bool)

(declare-fun lt!372192 () (_ BitVec 64))

(assert (=> b!236704 (= e!163659 (bvsle lt!372191 (bvmul lt!372192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236704 (or (= lt!372192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372192)))))

(assert (=> b!236704 (= lt!372192 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10886 lt!372017)))))))

(assert (= (and d!79984 res!197846) b!236703))

(assert (= (and b!236703 res!197847) b!236704))

(declare-fun m!359307 () Bool)

(assert (=> d!79984 m!359307))

(declare-fun m!359309 () Bool)

(assert (=> d!79984 m!359309))

(assert (=> b!236636 d!79984))

(declare-fun d!79986 () Bool)

(declare-fun e!163660 () Bool)

(assert (=> d!79986 e!163660))

(declare-fun res!197848 () Bool)

(assert (=> d!79986 (=> (not res!197848) (not e!163660))))

(declare-fun lt!372200 () (_ BitVec 64))

(declare-fun lt!372197 () (_ BitVec 64))

(declare-fun lt!372199 () (_ BitVec 64))

(assert (=> d!79986 (= res!197848 (= lt!372197 (bvsub lt!372199 lt!372200)))))

(assert (=> d!79986 (or (= (bvand lt!372199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372199 lt!372200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79986 (= lt!372200 (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10887 lt!371952)))) ((_ sign_extend 32) (currentByte!11134 (_2!10887 lt!371952))) ((_ sign_extend 32) (currentBit!11129 (_2!10887 lt!371952)))))))

(declare-fun lt!372201 () (_ BitVec 64))

(declare-fun lt!372202 () (_ BitVec 64))

(assert (=> d!79986 (= lt!372199 (bvmul lt!372201 lt!372202))))

(assert (=> d!79986 (or (= lt!372201 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372202 (bvsdiv (bvmul lt!372201 lt!372202) lt!372201)))))

(assert (=> d!79986 (= lt!372202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79986 (= lt!372201 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10887 lt!371952)))))))

(assert (=> d!79986 (= lt!372197 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11134 (_2!10887 lt!371952))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11129 (_2!10887 lt!371952)))))))

(assert (=> d!79986 (invariant!0 (currentBit!11129 (_2!10887 lt!371952)) (currentByte!11134 (_2!10887 lt!371952)) (size!5509 (buf!5984 (_2!10887 lt!371952))))))

(assert (=> d!79986 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)) (currentBit!11129 (_2!10887 lt!371952))) lt!372197)))

(declare-fun b!236705 () Bool)

(declare-fun res!197849 () Bool)

(assert (=> b!236705 (=> (not res!197849) (not e!163660))))

(assert (=> b!236705 (= res!197849 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372197))))

(declare-fun b!236706 () Bool)

(declare-fun lt!372198 () (_ BitVec 64))

(assert (=> b!236706 (= e!163660 (bvsle lt!372197 (bvmul lt!372198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236706 (or (= lt!372198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372198)))))

(assert (=> b!236706 (= lt!372198 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10887 lt!371952)))))))

(assert (= (and d!79986 res!197848) b!236705))

(assert (= (and b!236705 res!197849) b!236706))

(declare-fun m!359311 () Bool)

(assert (=> d!79986 m!359311))

(declare-fun m!359313 () Bool)

(assert (=> d!79986 m!359313))

(assert (=> b!236636 d!79986))

(assert (=> b!236640 d!79920))

(declare-fun d!79988 () Bool)

(declare-fun e!163663 () Bool)

(assert (=> d!79988 e!163663))

(declare-fun res!197854 () Bool)

(assert (=> d!79988 (=> (not res!197854) (not e!163663))))

(declare-fun lt!372216 () tuple2!19982)

(declare-fun lt!372217 () (_ BitVec 64))

(declare-fun lt!372215 () (_ BitVec 64))

(assert (=> d!79988 (= res!197854 (= (bvadd lt!372215 lt!372217) (bitIndex!0 (size!5509 (buf!5984 (_2!10895 lt!372216))) (currentByte!11134 (_2!10895 lt!372216)) (currentBit!11129 (_2!10895 lt!372216)))))))

(assert (=> d!79988 (or (not (= (bvand lt!372215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372217 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372215 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372215 lt!372217) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79988 (= lt!372217 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!79988 (= lt!372215 (bitIndex!0 (size!5509 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830) (currentBit!11129 thiss!1830)))))

(declare-fun Unit!17383 () Unit!17377)

(declare-fun Unit!17384 () Unit!17377)

(assert (=> d!79988 (= lt!372216 (ite (bvslt (currentBit!11129 thiss!1830) #b00000000000000000000000000000111) (tuple2!19983 Unit!17383 (BitStream!9983 (buf!5984 thiss!1830) (currentByte!11134 thiss!1830) (bvadd (currentBit!11129 thiss!1830) #b00000000000000000000000000000001))) (tuple2!19983 Unit!17384 (BitStream!9983 (buf!5984 thiss!1830) (bvadd (currentByte!11134 thiss!1830) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!79988 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!79988 (= (increaseBitIndex!0 thiss!1830) lt!372216)))

(declare-fun b!236711 () Bool)

(declare-fun res!197855 () Bool)

(assert (=> b!236711 (=> (not res!197855) (not e!163663))))

(declare-fun lt!372214 () (_ BitVec 64))

(declare-fun lt!372213 () (_ BitVec 64))

(assert (=> b!236711 (= res!197855 (= (bvsub lt!372214 lt!372213) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!236711 (or (= (bvand lt!372214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372214 lt!372213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236711 (= lt!372213 (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10895 lt!372216)))) ((_ sign_extend 32) (currentByte!11134 (_2!10895 lt!372216))) ((_ sign_extend 32) (currentBit!11129 (_2!10895 lt!372216)))))))

(assert (=> b!236711 (= lt!372214 (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))))))

(declare-fun b!236712 () Bool)

(assert (=> b!236712 (= e!163663 (= (size!5509 (buf!5984 thiss!1830)) (size!5509 (buf!5984 (_2!10895 lt!372216)))))))

(assert (= (and d!79988 res!197854) b!236711))

(assert (= (and b!236711 res!197855) b!236712))

(declare-fun m!359315 () Bool)

(assert (=> d!79988 m!359315))

(assert (=> d!79988 m!359243))

(assert (=> d!79988 m!359197))

(declare-fun m!359317 () Bool)

(assert (=> b!236711 m!359317))

(assert (=> b!236711 m!359197))

(assert (=> d!79940 d!79988))

(declare-fun d!79990 () Bool)

(assert (=> d!79990 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19960 () Bool)

(assert (= bs!19960 d!79990))

(assert (=> bs!19960 m!359197))

(assert (=> d!79940 d!79990))

(declare-fun d!79992 () Bool)

(assert (=> d!79992 (= (invariant!0 (currentBit!11129 thiss!1830) (currentByte!11134 thiss!1830) (size!5509 (buf!5984 thiss!1830))) (and (bvsge (currentBit!11129 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11129 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11134 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11134 thiss!1830) (size!5509 (buf!5984 thiss!1830))) (and (= (currentBit!11129 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11134 thiss!1830) (size!5509 (buf!5984 thiss!1830)))))))))

(assert (=> d!79922 d!79992))

(declare-fun d!79994 () Bool)

(declare-fun lt!372220 () tuple2!19966)

(assert (=> d!79994 (= lt!372220 (readBit!0 (_2!10887 lt!371952)))))

(assert (=> d!79994 (= (readBitPure!0 (_2!10887 lt!371952)) (tuple2!19981 (_2!10887 lt!372220) (_1!10887 lt!372220)))))

(declare-fun bs!19961 () Bool)

(assert (= bs!19961 d!79994))

(assert (=> bs!19961 m!359215))

(assert (=> b!236641 d!79994))

(declare-fun d!79996 () Bool)

(declare-fun e!163664 () Bool)

(assert (=> d!79996 e!163664))

(declare-fun res!197856 () Bool)

(assert (=> d!79996 (=> (not res!197856) (not e!163664))))

(declare-fun lt!372224 () (_ BitVec 64))

(declare-fun lt!372223 () (_ BitVec 64))

(declare-fun lt!372221 () (_ BitVec 64))

(assert (=> d!79996 (= res!197856 (= lt!372221 (bvsub lt!372223 lt!372224)))))

(assert (=> d!79996 (or (= (bvand lt!372223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372223 lt!372224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79996 (= lt!372224 (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830))))) ((_ sign_extend 32) (currentByte!11134 (_2!10895 (increaseBitIndex!0 thiss!1830)))) ((_ sign_extend 32) (currentBit!11129 (_2!10895 (increaseBitIndex!0 thiss!1830))))))))

(declare-fun lt!372225 () (_ BitVec 64))

(declare-fun lt!372226 () (_ BitVec 64))

(assert (=> d!79996 (= lt!372223 (bvmul lt!372225 lt!372226))))

(assert (=> d!79996 (or (= lt!372225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372226 (bvsdiv (bvmul lt!372225 lt!372226) lt!372225)))))

(assert (=> d!79996 (= lt!372226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79996 (= lt!372225 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79996 (= lt!372221 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11134 (_2!10895 (increaseBitIndex!0 thiss!1830)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11129 (_2!10895 (increaseBitIndex!0 thiss!1830))))))))

(assert (=> d!79996 (invariant!0 (currentBit!11129 (_2!10895 (increaseBitIndex!0 thiss!1830))) (currentByte!11134 (_2!10895 (increaseBitIndex!0 thiss!1830))) (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830)))))))

(assert (=> d!79996 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830)))) (currentByte!11134 (_2!10895 (increaseBitIndex!0 thiss!1830))) (currentBit!11129 (_2!10895 (increaseBitIndex!0 thiss!1830)))) lt!372221)))

(declare-fun b!236713 () Bool)

(declare-fun res!197857 () Bool)

(assert (=> b!236713 (=> (not res!197857) (not e!163664))))

(assert (=> b!236713 (= res!197857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372221))))

(declare-fun b!236714 () Bool)

(declare-fun lt!372222 () (_ BitVec 64))

(assert (=> b!236714 (= e!163664 (bvsle lt!372221 (bvmul lt!372222 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236714 (or (= lt!372222 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372222 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372222)))))

(assert (=> b!236714 (= lt!372222 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 thiss!1830))))))))

(assert (= (and d!79996 res!197856) b!236713))

(assert (= (and b!236713 res!197857) b!236714))

(declare-fun m!359319 () Bool)

(assert (=> d!79996 m!359319))

(declare-fun m!359321 () Bool)

(assert (=> d!79996 m!359321))

(assert (=> b!236648 d!79996))

(assert (=> b!236648 d!79988))

(declare-fun d!79998 () Bool)

(declare-fun e!163665 () Bool)

(assert (=> d!79998 e!163665))

(declare-fun res!197858 () Bool)

(assert (=> d!79998 (=> (not res!197858) (not e!163665))))

(declare-fun lt!372230 () (_ BitVec 64))

(declare-fun lt!372227 () (_ BitVec 64))

(declare-fun lt!372229 () (_ BitVec 64))

(assert (=> d!79998 (= res!197858 (= lt!372227 (bvsub lt!372229 lt!372230)))))

(assert (=> d!79998 (or (= (bvand lt!372229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372229 lt!372230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!79998 (= lt!372230 (remainingBits!0 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))) ((_ sign_extend 32) (currentByte!11134 thiss!1830)) ((_ sign_extend 32) (currentBit!11129 thiss!1830))))))

(declare-fun lt!372231 () (_ BitVec 64))

(declare-fun lt!372232 () (_ BitVec 64))

(assert (=> d!79998 (= lt!372229 (bvmul lt!372231 lt!372232))))

(assert (=> d!79998 (or (= lt!372231 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372232 (bvsdiv (bvmul lt!372231 lt!372232) lt!372231)))))

(assert (=> d!79998 (= lt!372232 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!79998 (= lt!372231 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))))))

(assert (=> d!79998 (= lt!372227 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11134 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11129 thiss!1830))))))

(assert (=> d!79998 (invariant!0 (currentBit!11129 thiss!1830) (currentByte!11134 thiss!1830) (size!5509 (buf!5984 thiss!1830)))))

(assert (=> d!79998 (= (bitIndex!0 (size!5509 (buf!5984 thiss!1830)) (currentByte!11134 thiss!1830) (currentBit!11129 thiss!1830)) lt!372227)))

(declare-fun b!236715 () Bool)

(declare-fun res!197859 () Bool)

(assert (=> b!236715 (=> (not res!197859) (not e!163665))))

(assert (=> b!236715 (= res!197859 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372227))))

(declare-fun b!236716 () Bool)

(declare-fun lt!372228 () (_ BitVec 64))

(assert (=> b!236716 (= e!163665 (bvsle lt!372227 (bvmul lt!372228 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!236716 (or (= lt!372228 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372228 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372228)))))

(assert (=> b!236716 (= lt!372228 ((_ sign_extend 32) (size!5509 (buf!5984 thiss!1830))))))

(assert (= (and d!79998 res!197858) b!236715))

(assert (= (and b!236715 res!197859) b!236716))

(assert (=> d!79998 m!359197))

(assert (=> d!79998 m!359195))

(assert (=> b!236648 d!79998))

(declare-fun d!80000 () Bool)

(declare-fun e!163666 () Bool)

(assert (=> d!80000 e!163666))

(declare-fun res!197860 () Bool)

(assert (=> d!80000 (=> (not res!197860) (not e!163666))))

(assert (=> d!80000 (= res!197860 (= (buf!5984 (_2!10895 (increaseBitIndex!0 (_2!10887 lt!371952)))) (buf!5984 (_2!10887 lt!371952))))))

(declare-fun lt!372239 () Bool)

(assert (=> d!80000 (= lt!372239 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 (_2!10887 lt!371952))))) #b00000000000000000000000000000000)))))

(declare-fun lt!372235 () tuple2!19966)

(assert (=> d!80000 (= lt!372235 (tuple2!19967 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 (_2!10887 lt!371952))))) #b00000000000000000000000000000000)) (_2!10895 (increaseBitIndex!0 (_2!10887 lt!371952)))))))

(assert (=> d!80000 (validate_offset_bit!0 ((_ sign_extend 32) (size!5509 (buf!5984 (_2!10887 lt!371952)))) ((_ sign_extend 32) (currentByte!11134 (_2!10887 lt!371952))) ((_ sign_extend 32) (currentBit!11129 (_2!10887 lt!371952))))))

(assert (=> d!80000 (= (readBit!0 (_2!10887 lt!371952)) lt!372235)))

(declare-fun lt!372234 () (_ BitVec 64))

(declare-fun b!236717 () Bool)

(declare-fun lt!372236 () (_ BitVec 64))

(assert (=> b!236717 (= e!163666 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10895 (increaseBitIndex!0 (_2!10887 lt!371952))))) (currentByte!11134 (_2!10895 (increaseBitIndex!0 (_2!10887 lt!371952)))) (currentBit!11129 (_2!10895 (increaseBitIndex!0 (_2!10887 lt!371952))))) (bvadd lt!372234 lt!372236)))))

(assert (=> b!236717 (or (not (= (bvand lt!372234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372236 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372234 lt!372236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236717 (= lt!372236 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236717 (= lt!372234 (bitIndex!0 (size!5509 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)) (currentBit!11129 (_2!10887 lt!371952))))))

(declare-fun lt!372233 () Bool)

(assert (=> b!236717 (= lt!372233 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 (_2!10887 lt!371952))))) #b00000000000000000000000000000000)))))

(declare-fun lt!372237 () Bool)

(assert (=> b!236717 (= lt!372237 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 (_2!10887 lt!371952))))) #b00000000000000000000000000000000)))))

(declare-fun lt!372238 () Bool)

(assert (=> b!236717 (= lt!372238 (not (= (bvand ((_ sign_extend 24) (select (arr!6496 (buf!5984 (_2!10887 lt!371952))) (currentByte!11134 (_2!10887 lt!371952)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11129 (_2!10887 lt!371952))))) #b00000000000000000000000000000000)))))

(assert (= (and d!80000 res!197860) b!236717))

(declare-fun m!359323 () Bool)

(assert (=> d!80000 m!359323))

(declare-fun m!359325 () Bool)

(assert (=> d!80000 m!359325))

(declare-fun m!359327 () Bool)

(assert (=> d!80000 m!359327))

(declare-fun m!359329 () Bool)

(assert (=> d!80000 m!359329))

(assert (=> b!236717 m!359323))

(assert (=> b!236717 m!359325))

(assert (=> b!236717 m!359213))

(assert (=> b!236717 m!359327))

(declare-fun m!359331 () Bool)

(assert (=> b!236717 m!359331))

(assert (=> b!236639 d!80000))

(declare-fun b!236718 () Bool)

(declare-fun res!197863 () Bool)

(declare-fun e!163669 () Bool)

(assert (=> b!236718 (=> (not res!197863) (not e!163669))))

(declare-fun lt!372241 () (_ BitVec 64))

(declare-fun lt!372247 () tuple2!19964)

(declare-fun lt!372244 () (_ BitVec 64))

(assert (=> b!236718 (= res!197863 (= (bitIndex!0 (size!5509 (buf!5984 (_2!10886 lt!372247))) (currentByte!11134 (_2!10886 lt!372247)) (currentBit!11129 (_2!10886 lt!372247))) (bvadd lt!372244 lt!372241)))))

(assert (=> b!236718 (or (not (= (bvand lt!372244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372241 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372244 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372244 lt!372241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236718 (= lt!372241 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236718 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!236718 (= lt!372244 (bitIndex!0 (size!5509 (buf!5984 (_2!10887 lt!372010))) (currentByte!11134 (_2!10887 lt!372010)) (currentBit!11129 (_2!10887 lt!372010))))))

(declare-fun b!236719 () Bool)

(declare-fun res!197862 () Bool)

(assert (=> b!236719 (=> (not res!197862) (not e!163669))))

(declare-fun lt!372242 () (_ BitVec 64))

(declare-fun lt!372243 () (_ BitVec 64))

(assert (=> b!236719 (= res!197862 (= (bvlshr (_1!10886 lt!372247) lt!372242) (bvlshr (bvor (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10887 lt!372010) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372243)))))

(assert (=> b!236719 (and (bvsge lt!372243 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372243 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236719 (= lt!372243 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236719 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!236719 (and (bvsge lt!372242 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372242 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!236719 (= lt!372242 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236719 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(declare-fun b!236720 () Bool)

(declare-fun e!163667 () tuple2!19964)

(assert (=> b!236720 (= e!163667 (tuple2!19965 (bvor (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10887 lt!372010) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10887 lt!372010)))))

(declare-fun b!236721 () Bool)

(declare-fun lt!372245 () tuple2!19964)

(assert (=> b!236721 (= e!163667 (tuple2!19965 (_1!10886 lt!372245) (_2!10886 lt!372245)))))

(declare-fun lt!372240 () tuple2!19966)

(assert (=> b!236721 (= lt!372240 (readBit!0 (_2!10887 lt!372010)))))

(assert (=> b!236721 (= lt!372245 (readNLeastSignificantBitsLoop!0 (_2!10887 lt!372240) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10887 lt!372010) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10887 lt!372240) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!80002 () Bool)

(assert (=> d!80002 e!163669))

(declare-fun res!197864 () Bool)

(assert (=> d!80002 (=> (not res!197864) (not e!163669))))

(assert (=> d!80002 (= res!197864 (= (buf!5984 (_2!10886 lt!372247)) (buf!5984 (_2!10887 lt!372010))))))

(assert (=> d!80002 (= lt!372247 e!163667)))

(declare-fun c!11331 () Bool)

(assert (=> d!80002 (= c!11331 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)))))

(assert (=> d!80002 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80002 (= (readNLeastSignificantBitsLoop!0 (_2!10887 lt!372010) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10887 lt!371952) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10887 lt!372010) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372247)))

(declare-fun b!236722 () Bool)

(declare-fun res!197865 () Bool)

(assert (=> b!236722 (=> (not res!197865) (not e!163669))))

(assert (=> b!236722 (= res!197865 (= (bvand (_1!10886 lt!372247) (onesLSBLong!0 nBits!581)) (_1!10886 lt!372247)))))

(declare-fun b!236723 () Bool)

(declare-fun lt!372248 () (_ BitVec 64))

(declare-fun e!163668 () Bool)

(assert (=> b!236723 (= e!163668 (= (= (bvand (bvlshr (_1!10886 lt!372247) lt!372248) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10894 (readBitPure!0 (_2!10887 lt!372010)))))))

(assert (=> b!236723 (and (bvsge lt!372248 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372248 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372246 () (_ BitVec 32))

(assert (=> b!236723 (= lt!372248 ((_ sign_extend 32) (bvsub lt!372246 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001))))))

(assert (=> b!236723 (or (= (bvand lt!372246 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand lt!372246 #b10000000000000000000000000000000) (bvand (bvsub lt!372246 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!236723 (= lt!372246 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!236723 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!236724 () Bool)

(assert (=> b!236724 (= e!163669 e!163668)))

(declare-fun res!197861 () Bool)

(assert (=> b!236724 (=> res!197861 e!163668)))

(assert (=> b!236724 (= res!197861 (bvsge (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) nBits!581))))

(assert (= (and d!80002 c!11331) b!236720))

(assert (= (and d!80002 (not c!11331)) b!236721))

(assert (= (and d!80002 res!197864) b!236718))

(assert (= (and b!236718 res!197863) b!236719))

(assert (= (and b!236719 res!197862) b!236722))

(assert (= (and b!236722 res!197865) b!236724))

(assert (= (and b!236724 (not res!197861)) b!236723))

(declare-fun m!359333 () Bool)

(assert (=> b!236718 m!359333))

(declare-fun m!359335 () Bool)

(assert (=> b!236718 m!359335))

(declare-fun m!359337 () Bool)

(assert (=> b!236721 m!359337))

(declare-fun m!359339 () Bool)

(assert (=> b!236721 m!359339))

(assert (=> b!236722 m!359145))

(declare-fun m!359341 () Bool)

(assert (=> b!236723 m!359341))

(assert (=> b!236639 d!80002))

(push 1)

(assert (not d!79986))

(assert (not b!236711))

(assert (not d!79994))

(assert (not b!236717))

(assert (not b!236723))

(assert (not b!236722))

(assert (not b!236718))

(assert (not d!79998))

(assert (not d!79996))

(assert (not b!236721))

(assert (not d!79984))

(assert (not d!79988))

(assert (not d!79990))

(assert (not d!80000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

