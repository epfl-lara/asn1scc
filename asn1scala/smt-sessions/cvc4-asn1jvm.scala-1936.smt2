; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50478 () Bool)

(assert start!50478)

(declare-fun res!197624 () Bool)

(declare-fun e!163460 () Bool)

(assert (=> start!50478 (=> (not res!197624) (not e!163460))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50478 (= res!197624 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50478 e!163460))

(assert (=> start!50478 true))

(declare-datatypes ((array!12536 0))(
  ( (array!12537 (arr!6492 (Array (_ BitVec 32) (_ BitVec 8))) (size!5505 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9974 0))(
  ( (BitStream!9975 (buf!5980 array!12536) (currentByte!11124 (_ BitVec 32)) (currentBit!11119 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9974)

(declare-fun e!163463 () Bool)

(declare-fun inv!12 (BitStream!9974) Bool)

(assert (=> start!50478 (and (inv!12 thiss!1830) e!163463)))

(declare-fun b!236440 () Bool)

(declare-fun res!197626 () Bool)

(assert (=> b!236440 (=> (not res!197626) (not e!163460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236440 (= res!197626 (validate_offset_bits!1 ((_ sign_extend 32) (size!5505 (buf!5980 thiss!1830))) ((_ sign_extend 32) (currentByte!11124 thiss!1830)) ((_ sign_extend 32) (currentBit!11119 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236441 () Bool)

(declare-fun res!197628 () Bool)

(assert (=> b!236441 (=> (not res!197628) (not e!163460))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236441 (= res!197628 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236442 () Bool)

(declare-fun res!197627 () Bool)

(assert (=> b!236442 (=> (not res!197627) (not e!163460))))

(assert (=> b!236442 (= res!197627 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236443 () Bool)

(declare-fun array_inv!5246 (array!12536) Bool)

(assert (=> b!236443 (= e!163463 (array_inv!5246 (buf!5980 thiss!1830)))))

(declare-fun b!236444 () Bool)

(declare-fun res!197623 () Bool)

(assert (=> b!236444 (=> (not res!197623) (not e!163460))))

(assert (=> b!236444 (= res!197623 (not (= nBits!581 i!752)))))

(declare-fun b!236445 () Bool)

(declare-fun e!163459 () Bool)

(assert (=> b!236445 (= e!163460 e!163459)))

(declare-fun res!197625 () Bool)

(assert (=> b!236445 (=> (not res!197625) (not e!163459))))

(assert (=> b!236445 (= res!197625 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581)))))

(declare-datatypes ((tuple2!19944 0))(
  ( (tuple2!19945 (_1!10876 Bool) (_2!10876 BitStream!9974)) )
))
(declare-fun lt!371784 () tuple2!19944)

(declare-fun readBit!0 (BitStream!9974) tuple2!19944)

(assert (=> b!236445 (= lt!371784 (readBit!0 thiss!1830))))

(declare-fun b!236446 () Bool)

(declare-fun e!163462 () Bool)

(assert (=> b!236446 (= e!163459 e!163462)))

(declare-fun res!197622 () Bool)

(assert (=> b!236446 (=> (not res!197622) (not e!163462))))

(declare-fun lt!371783 () (_ BitVec 32))

(assert (=> b!236446 (= res!197622 (validate_offset_bits!1 ((_ sign_extend 32) (size!5505 (buf!5980 (_2!10876 lt!371784)))) ((_ sign_extend 32) (currentByte!11124 (_2!10876 lt!371784))) ((_ sign_extend 32) (currentBit!11119 (_2!10876 lt!371784))) ((_ sign_extend 32) lt!371783)))))

(assert (=> b!236446 (= lt!371783 (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(declare-fun b!236447 () Bool)

(assert (=> b!236447 (= e!163462 (not (= (bvand (bvor acc!170 (ite (_1!10876 lt!371784) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 lt!371783)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!50478 res!197624) b!236440))

(assert (= (and b!236440 res!197626) b!236441))

(assert (= (and b!236441 res!197628) b!236442))

(assert (= (and b!236442 res!197627) b!236444))

(assert (= (and b!236444 res!197623) b!236445))

(assert (= (and b!236445 res!197625) b!236446))

(assert (= (and b!236446 res!197622) b!236447))

(assert (= start!50478 b!236443))

(declare-fun m!358973 () Bool)

(assert (=> b!236442 m!358973))

(declare-fun m!358975 () Bool)

(assert (=> b!236443 m!358975))

(declare-fun m!358977 () Bool)

(assert (=> b!236447 m!358977))

(declare-fun m!358979 () Bool)

(assert (=> b!236445 m!358979))

(declare-fun m!358981 () Bool)

(assert (=> start!50478 m!358981))

(declare-fun m!358983 () Bool)

(assert (=> b!236441 m!358983))

(declare-fun m!358985 () Bool)

(assert (=> b!236446 m!358985))

(declare-fun m!358987 () Bool)

(assert (=> b!236440 m!358987))

(push 1)

(assert (not b!236442))

(assert (not b!236446))

(assert (not b!236447))

(assert (not b!236445))

(assert (not b!236441))

(assert (not b!236443))

(assert (not start!50478))

(assert (not b!236440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79842 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79842 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5505 (buf!5980 (_2!10876 lt!371784)))) ((_ sign_extend 32) (currentByte!11124 (_2!10876 lt!371784))) ((_ sign_extend 32) (currentBit!11119 (_2!10876 lt!371784))) ((_ sign_extend 32) lt!371783)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5505 (buf!5980 (_2!10876 lt!371784)))) ((_ sign_extend 32) (currentByte!11124 (_2!10876 lt!371784))) ((_ sign_extend 32) (currentBit!11119 (_2!10876 lt!371784)))) ((_ sign_extend 32) lt!371783)))))

(declare-fun bs!19933 () Bool)

(assert (= bs!19933 d!79842))

(declare-fun m!359011 () Bool)

(assert (=> bs!19933 m!359011))

(assert (=> b!236446 d!79842))

(declare-fun d!79844 () Bool)

(assert (=> d!79844 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236441 d!79844))

(declare-fun d!79846 () Bool)

(assert (=> d!79846 (= (onesLSBLong!0 lt!371783) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 lt!371783))))))

(assert (=> b!236447 d!79846))

(declare-fun d!79848 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79848 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11119 thiss!1830) (currentByte!11124 thiss!1830) (size!5505 (buf!5980 thiss!1830))))))

(declare-fun bs!19934 () Bool)

(assert (= bs!19934 d!79848))

(declare-fun m!359013 () Bool)

(assert (=> bs!19934 m!359013))

(assert (=> start!50478 d!79848))

(declare-fun d!79850 () Bool)

(declare-fun e!163484 () Bool)

(assert (=> d!79850 e!163484))

(declare-fun res!197637 () Bool)

(assert (=> d!79850 (=> (not res!197637) (not e!163484))))

(declare-datatypes ((Unit!17367 0))(
  ( (Unit!17368) )
))
(declare-datatypes ((tuple2!19950 0))(
  ( (tuple2!19951 (_1!10879 Unit!17367) (_2!10879 BitStream!9974)) )
))
(declare-fun increaseBitIndex!0 (BitStream!9974) tuple2!19950)

(assert (=> d!79850 (= res!197637 (= (buf!5980 (_2!10879 (increaseBitIndex!0 thiss!1830))) (buf!5980 thiss!1830)))))

(declare-fun lt!371845 () Bool)

(assert (=> d!79850 (= lt!371845 (not (= (bvand ((_ sign_extend 24) (select (arr!6492 (buf!5980 thiss!1830)) (currentByte!11124 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11119 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371846 () tuple2!19944)

(assert (=> d!79850 (= lt!371846 (tuple2!19945 (not (= (bvand ((_ sign_extend 24) (select (arr!6492 (buf!5980 thiss!1830)) (currentByte!11124 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11119 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10879 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!79850 (validate_offset_bit!0 ((_ sign_extend 32) (size!5505 (buf!5980 thiss!1830))) ((_ sign_extend 32) (currentByte!11124 thiss!1830)) ((_ sign_extend 32) (currentBit!11119 thiss!1830)))))

(assert (=> d!79850 (= (readBit!0 thiss!1830) lt!371846)))

(declare-fun b!236456 () Bool)

(declare-fun lt!371847 () (_ BitVec 64))

(declare-fun lt!371841 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236456 (= e!163484 (= (bitIndex!0 (size!5505 (buf!5980 (_2!10879 (increaseBitIndex!0 thiss!1830)))) (currentByte!11124 (_2!10879 (increaseBitIndex!0 thiss!1830))) (currentBit!11119 (_2!10879 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!371847 lt!371841)))))

(assert (=> b!236456 (or (not (= (bvand lt!371847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!371841 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!371847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!371847 lt!371841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236456 (= lt!371841 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!236456 (= lt!371847 (bitIndex!0 (size!5505 (buf!5980 thiss!1830)) (currentByte!11124 thiss!1830) (currentBit!11119 thiss!1830)))))

(declare-fun lt!371843 () Bool)

(assert (=> b!236456 (= lt!371843 (not (= (bvand ((_ sign_extend 24) (select (arr!6492 (buf!5980 thiss!1830)) (currentByte!11124 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11119 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371844 () Bool)

(assert (=> b!236456 (= lt!371844 (not (= (bvand ((_ sign_extend 24) (select (arr!6492 (buf!5980 thiss!1830)) (currentByte!11124 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11119 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!371842 () Bool)

(assert (=> b!236456 (= lt!371842 (not (= (bvand ((_ sign_extend 24) (select (arr!6492 (buf!5980 thiss!1830)) (currentByte!11124 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11119 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!79850 res!197637) b!236456))

(declare-fun m!359029 () Bool)

(assert (=> d!79850 m!359029))

(declare-fun m!359031 () Bool)

(assert (=> d!79850 m!359031))

(declare-fun m!359033 () Bool)

(assert (=> d!79850 m!359033))

(declare-fun m!359035 () Bool)

(assert (=> d!79850 m!359035))

(declare-fun m!359037 () Bool)

(assert (=> b!236456 m!359037))

(declare-fun m!359039 () Bool)

(assert (=> b!236456 m!359039))

(assert (=> b!236456 m!359033))

(assert (=> b!236456 m!359029))

(assert (=> b!236456 m!359031))

(assert (=> b!236445 d!79850))

(declare-fun d!79854 () Bool)

(assert (=> d!79854 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5505 (buf!5980 thiss!1830))) ((_ sign_extend 32) (currentByte!11124 thiss!1830)) ((_ sign_extend 32) (currentBit!11119 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5505 (buf!5980 thiss!1830))) ((_ sign_extend 32) (currentByte!11124 thiss!1830)) ((_ sign_extend 32) (currentBit!11119 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19936 () Bool)

(assert (= bs!19936 d!79854))

(declare-fun m!359041 () Bool)

(assert (=> bs!19936 m!359041))

(assert (=> b!236440 d!79854))

(declare-fun d!79856 () Bool)

(assert (=> d!79856 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236442 d!79856))

(declare-fun d!79858 () Bool)

(assert (=> d!79858 (= (array_inv!5246 (buf!5980 thiss!1830)) (bvsge (size!5505 (buf!5980 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236443 d!79858))

(push 1)

(assert (not d!79842))

(assert (not b!236456))

(assert (not d!79850))

(assert (not d!79854))

(assert (not d!79848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

