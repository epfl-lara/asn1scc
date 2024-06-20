; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50680 () Bool)

(assert start!50680)

(declare-fun b!236999 () Bool)

(declare-fun res!198096 () Bool)

(declare-fun e!163843 () Bool)

(assert (=> b!236999 (=> (not res!198096) (not e!163843))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236999 (= res!198096 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237000 () Bool)

(declare-fun e!163844 () Bool)

(declare-datatypes ((array!12576 0))(
  ( (array!12577 (arr!6506 (Array (_ BitVec 32) (_ BitVec 8))) (size!5519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10002 0))(
  ( (BitStream!10003 (buf!5994 array!12576) (currentByte!11165 (_ BitVec 32)) (currentBit!11160 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10002)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237000 (= e!163844 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830)))))))

(declare-fun b!237001 () Bool)

(declare-fun res!198101 () Bool)

(assert (=> b!237001 (=> (not res!198101) (not e!163844))))

(declare-fun lt!372521 () (_ BitVec 64))

(declare-fun lt!372522 () (_ BitVec 64))

(declare-datatypes ((tuple2!20024 0))(
  ( (tuple2!20025 (_1!10916 (_ BitVec 64)) (_2!10916 BitStream!10002)) )
))
(declare-fun lt!372520 () tuple2!20024)

(assert (=> b!237001 (= res!198101 (and (= (bvlshr (_1!10916 lt!372520) lt!372521) (bvlshr acc!170 lt!372521)) (= (bvand (_1!10916 lt!372520) lt!372522) (_1!10916 lt!372520)) (bvslt i!752 nBits!581)))))

(declare-fun b!237002 () Bool)

(declare-fun e!163846 () Bool)

(declare-fun array_inv!5260 (array!12576) Bool)

(assert (=> b!237002 (= e!163846 (array_inv!5260 (buf!5994 thiss!1830)))))

(declare-fun b!237003 () Bool)

(declare-fun e!163842 () Bool)

(assert (=> b!237003 (= e!163842 e!163843)))

(declare-fun res!198098 () Bool)

(assert (=> b!237003 (=> (not res!198098) (not e!163843))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237003 (= res!198098 (validate_offset_bits!1 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830)) lt!372521))))

(assert (=> b!237003 (= lt!372521 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237004 () Bool)

(declare-fun e!163847 () Bool)

(assert (=> b!237004 (= e!163843 e!163847)))

(declare-fun res!198097 () Bool)

(assert (=> b!237004 (=> (not res!198097) (not e!163847))))

(assert (=> b!237004 (= res!198097 (and (= (bvand acc!170 lt!372522) acc!170) (not (= nBits!581 i!752))))))

(assert (=> b!237004 (= lt!372522 (onesLSBLong!0 nBits!581))))

(declare-fun b!237005 () Bool)

(assert (=> b!237005 (= e!163847 e!163844)))

(declare-fun res!198099 () Bool)

(assert (=> b!237005 (=> (not res!198099) (not e!163844))))

(assert (=> b!237005 (= res!198099 (= (buf!5994 (_2!10916 lt!372520)) (buf!5994 thiss!1830)))))

(declare-datatypes ((tuple2!20026 0))(
  ( (tuple2!20027 (_1!10917 Bool) (_2!10917 BitStream!10002)) )
))
(declare-fun lt!372519 () tuple2!20026)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20024)

(assert (=> b!237005 (= lt!372520 (readNLeastSignificantBitsLoop!0 (_2!10917 lt!372519) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10917 lt!372519) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10002) tuple2!20026)

(assert (=> b!237005 (= lt!372519 (readBit!0 thiss!1830))))

(declare-fun res!198102 () Bool)

(assert (=> start!50680 (=> (not res!198102) (not e!163842))))

(assert (=> start!50680 (= res!198102 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50680 e!163842))

(assert (=> start!50680 true))

(declare-fun inv!12 (BitStream!10002) Bool)

(assert (=> start!50680 (and (inv!12 thiss!1830) e!163846)))

(declare-fun b!236998 () Bool)

(declare-fun res!198100 () Bool)

(assert (=> b!236998 (=> (not res!198100) (not e!163844))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236998 (= res!198100 (= (bitIndex!0 (size!5519 (buf!5994 (_2!10916 lt!372520))) (currentByte!11165 (_2!10916 lt!372520)) (currentBit!11160 (_2!10916 lt!372520))) (bvadd (bitIndex!0 (size!5519 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830) (currentBit!11160 thiss!1830)) lt!372521)))))

(assert (= (and start!50680 res!198102) b!237003))

(assert (= (and b!237003 res!198098) b!236999))

(assert (= (and b!236999 res!198096) b!237004))

(assert (= (and b!237004 res!198097) b!237005))

(assert (= (and b!237005 res!198099) b!236998))

(assert (= (and b!236998 res!198100) b!237001))

(assert (= (and b!237001 res!198101) b!237000))

(assert (= start!50680 b!237002))

(declare-fun m!359573 () Bool)

(assert (=> b!237004 m!359573))

(declare-fun m!359575 () Bool)

(assert (=> start!50680 m!359575))

(declare-fun m!359577 () Bool)

(assert (=> b!237002 m!359577))

(declare-fun m!359579 () Bool)

(assert (=> b!236998 m!359579))

(declare-fun m!359581 () Bool)

(assert (=> b!236998 m!359581))

(declare-fun m!359583 () Bool)

(assert (=> b!237003 m!359583))

(declare-fun m!359585 () Bool)

(assert (=> b!237005 m!359585))

(declare-fun m!359587 () Bool)

(assert (=> b!237005 m!359587))

(declare-fun m!359589 () Bool)

(assert (=> b!236999 m!359589))

(declare-fun m!359591 () Bool)

(assert (=> b!237000 m!359591))

(check-sat (not b!237002) (not start!50680) (not b!237005) (not b!236998) (not b!237003) (not b!237004) (not b!236999) (not b!237000))
(check-sat)
(get-model)

(declare-fun d!80080 () Bool)

(assert (=> d!80080 (= (array_inv!5260 (buf!5994 thiss!1830)) (bvsge (size!5519 (buf!5994 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!237002 d!80080))

(declare-fun d!80082 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830)) lt!372521) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830))) lt!372521))))

(declare-fun bs!19979 () Bool)

(assert (= bs!19979 d!80082))

(declare-fun m!359613 () Bool)

(assert (=> bs!19979 m!359613))

(assert (=> b!237003 d!80082))

(declare-fun d!80084 () Bool)

(declare-fun e!163868 () Bool)

(assert (=> d!80084 e!163868))

(declare-fun res!198129 () Bool)

(assert (=> d!80084 (=> (not res!198129) (not e!163868))))

(declare-fun lt!372548 () (_ BitVec 64))

(declare-fun lt!372551 () (_ BitVec 64))

(declare-fun lt!372550 () (_ BitVec 64))

(assert (=> d!80084 (= res!198129 (= lt!372551 (bvsub lt!372548 lt!372550)))))

(assert (=> d!80084 (or (= (bvand lt!372548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372550 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372548 lt!372550) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80084 (= lt!372550 (remainingBits!0 ((_ sign_extend 32) (size!5519 (buf!5994 (_2!10916 lt!372520)))) ((_ sign_extend 32) (currentByte!11165 (_2!10916 lt!372520))) ((_ sign_extend 32) (currentBit!11160 (_2!10916 lt!372520)))))))

(declare-fun lt!372552 () (_ BitVec 64))

(declare-fun lt!372547 () (_ BitVec 64))

(assert (=> d!80084 (= lt!372548 (bvmul lt!372552 lt!372547))))

(assert (=> d!80084 (or (= lt!372552 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372547 (bvsdiv (bvmul lt!372552 lt!372547) lt!372552)))))

(assert (=> d!80084 (= lt!372547 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80084 (= lt!372552 ((_ sign_extend 32) (size!5519 (buf!5994 (_2!10916 lt!372520)))))))

(assert (=> d!80084 (= lt!372551 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11165 (_2!10916 lt!372520))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11160 (_2!10916 lt!372520)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80084 (invariant!0 (currentBit!11160 (_2!10916 lt!372520)) (currentByte!11165 (_2!10916 lt!372520)) (size!5519 (buf!5994 (_2!10916 lt!372520))))))

(assert (=> d!80084 (= (bitIndex!0 (size!5519 (buf!5994 (_2!10916 lt!372520))) (currentByte!11165 (_2!10916 lt!372520)) (currentBit!11160 (_2!10916 lt!372520))) lt!372551)))

(declare-fun b!237034 () Bool)

(declare-fun res!198128 () Bool)

(assert (=> b!237034 (=> (not res!198128) (not e!163868))))

(assert (=> b!237034 (= res!198128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372551))))

(declare-fun b!237035 () Bool)

(declare-fun lt!372549 () (_ BitVec 64))

(assert (=> b!237035 (= e!163868 (bvsle lt!372551 (bvmul lt!372549 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!237035 (or (= lt!372549 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372549 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372549)))))

(assert (=> b!237035 (= lt!372549 ((_ sign_extend 32) (size!5519 (buf!5994 (_2!10916 lt!372520)))))))

(assert (= (and d!80084 res!198129) b!237034))

(assert (= (and b!237034 res!198128) b!237035))

(declare-fun m!359615 () Bool)

(assert (=> d!80084 m!359615))

(declare-fun m!359617 () Bool)

(assert (=> d!80084 m!359617))

(assert (=> b!236998 d!80084))

(declare-fun d!80086 () Bool)

(declare-fun e!163869 () Bool)

(assert (=> d!80086 e!163869))

(declare-fun res!198131 () Bool)

(assert (=> d!80086 (=> (not res!198131) (not e!163869))))

(declare-fun lt!372554 () (_ BitVec 64))

(declare-fun lt!372557 () (_ BitVec 64))

(declare-fun lt!372556 () (_ BitVec 64))

(assert (=> d!80086 (= res!198131 (= lt!372557 (bvsub lt!372554 lt!372556)))))

(assert (=> d!80086 (or (= (bvand lt!372554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372554 lt!372556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80086 (= lt!372556 (remainingBits!0 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830))))))

(declare-fun lt!372558 () (_ BitVec 64))

(declare-fun lt!372553 () (_ BitVec 64))

(assert (=> d!80086 (= lt!372554 (bvmul lt!372558 lt!372553))))

(assert (=> d!80086 (or (= lt!372558 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372553 (bvsdiv (bvmul lt!372558 lt!372553) lt!372558)))))

(assert (=> d!80086 (= lt!372553 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80086 (= lt!372558 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))))))

(assert (=> d!80086 (= lt!372557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11165 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11160 thiss!1830))))))

(assert (=> d!80086 (invariant!0 (currentBit!11160 thiss!1830) (currentByte!11165 thiss!1830) (size!5519 (buf!5994 thiss!1830)))))

(assert (=> d!80086 (= (bitIndex!0 (size!5519 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830) (currentBit!11160 thiss!1830)) lt!372557)))

(declare-fun b!237036 () Bool)

(declare-fun res!198130 () Bool)

(assert (=> b!237036 (=> (not res!198130) (not e!163869))))

(assert (=> b!237036 (= res!198130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372557))))

(declare-fun b!237037 () Bool)

(declare-fun lt!372555 () (_ BitVec 64))

(assert (=> b!237037 (= e!163869 (bvsle lt!372557 (bvmul lt!372555 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!237037 (or (= lt!372555 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372555 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372555)))))

(assert (=> b!237037 (= lt!372555 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))))))

(assert (= (and d!80086 res!198131) b!237036))

(assert (= (and b!237036 res!198130) b!237037))

(assert (=> d!80086 m!359613))

(declare-fun m!359619 () Bool)

(assert (=> d!80086 m!359619))

(assert (=> b!236998 d!80086))

(declare-fun d!80088 () Bool)

(assert (=> d!80088 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!237004 d!80088))

(declare-fun d!80090 () Bool)

(assert (=> d!80090 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236999 d!80090))

(declare-fun d!80092 () Bool)

(assert (=> d!80092 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11160 thiss!1830) (currentByte!11165 thiss!1830) (size!5519 (buf!5994 thiss!1830))))))

(declare-fun bs!19980 () Bool)

(assert (= bs!19980 d!80092))

(assert (=> bs!19980 m!359619))

(assert (=> start!50680 d!80092))

(declare-fun b!237052 () Bool)

(declare-fun e!163876 () tuple2!20024)

(declare-fun lt!372577 () tuple2!20024)

(assert (=> b!237052 (= e!163876 (tuple2!20025 (_1!10916 lt!372577) (_2!10916 lt!372577)))))

(declare-fun lt!372585 () tuple2!20026)

(assert (=> b!237052 (= lt!372585 (readBit!0 (_2!10917 lt!372519)))))

(assert (=> b!237052 (= lt!372577 (readNLeastSignificantBitsLoop!0 (_2!10917 lt!372585) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10917 lt!372519) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10917 lt!372585) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237053 () Bool)

(declare-fun res!198145 () Bool)

(declare-fun e!163878 () Bool)

(assert (=> b!237053 (=> (not res!198145) (not e!163878))))

(declare-fun lt!372582 () (_ BitVec 64))

(declare-fun lt!372583 () (_ BitVec 64))

(declare-fun lt!372581 () tuple2!20024)

(assert (=> b!237053 (= res!198145 (= (bvlshr (_1!10916 lt!372581) lt!372583) (bvlshr (bvor acc!170 (ite (_1!10917 lt!372519) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!372582)))))

(assert (=> b!237053 (and (bvsge lt!372582 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372582 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!237053 (= lt!372582 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237053 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!237053 (and (bvsge lt!372583 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372583 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!237053 (= lt!372583 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237053 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(declare-fun d!80094 () Bool)

(assert (=> d!80094 e!163878))

(declare-fun res!198146 () Bool)

(assert (=> d!80094 (=> (not res!198146) (not e!163878))))

(assert (=> d!80094 (= res!198146 (= (buf!5994 (_2!10916 lt!372581)) (buf!5994 (_2!10917 lt!372519))))))

(assert (=> d!80094 (= lt!372581 e!163876)))

(declare-fun c!11344 () Bool)

(assert (=> d!80094 (= c!11344 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80094 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80094 (= (readNLeastSignificantBitsLoop!0 (_2!10917 lt!372519) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10917 lt!372519) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!372581)))

(declare-fun b!237054 () Bool)

(assert (=> b!237054 (= e!163876 (tuple2!20025 (bvor acc!170 (ite (_1!10917 lt!372519) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10917 lt!372519)))))

(declare-fun b!237055 () Bool)

(declare-fun e!163877 () Bool)

(assert (=> b!237055 (= e!163878 e!163877)))

(declare-fun res!198142 () Bool)

(assert (=> b!237055 (=> res!198142 e!163877)))

(assert (=> b!237055 (= res!198142 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun b!237056 () Bool)

(declare-fun res!198144 () Bool)

(assert (=> b!237056 (=> (not res!198144) (not e!163878))))

(declare-fun lt!372580 () (_ BitVec 64))

(declare-fun lt!372578 () (_ BitVec 64))

(assert (=> b!237056 (= res!198144 (= (bitIndex!0 (size!5519 (buf!5994 (_2!10916 lt!372581))) (currentByte!11165 (_2!10916 lt!372581)) (currentBit!11160 (_2!10916 lt!372581))) (bvadd lt!372578 lt!372580)))))

(assert (=> b!237056 (or (not (= (bvand lt!372578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372580 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372578 lt!372580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237056 (= lt!372580 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237056 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!237056 (= lt!372578 (bitIndex!0 (size!5519 (buf!5994 (_2!10917 lt!372519))) (currentByte!11165 (_2!10917 lt!372519)) (currentBit!11160 (_2!10917 lt!372519))))))

(declare-fun b!237057 () Bool)

(declare-fun res!198143 () Bool)

(assert (=> b!237057 (=> (not res!198143) (not e!163878))))

(assert (=> b!237057 (= res!198143 (= (bvand (_1!10916 lt!372581) (onesLSBLong!0 nBits!581)) (_1!10916 lt!372581)))))

(declare-fun lt!372584 () (_ BitVec 64))

(declare-fun b!237058 () Bool)

(declare-datatypes ((tuple2!20032 0))(
  ( (tuple2!20033 (_1!10920 BitStream!10002) (_2!10920 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10002) tuple2!20032)

(assert (=> b!237058 (= e!163877 (= (= (bvand (bvlshr (_1!10916 lt!372581) lt!372584) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10920 (readBitPure!0 (_2!10917 lt!372519)))))))

(assert (=> b!237058 (and (bvsge lt!372584 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!372584 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!372579 () (_ BitVec 32))

(assert (=> b!237058 (= lt!372584 ((_ sign_extend 32) (bvsub lt!372579 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!237058 (or (= (bvand lt!372579 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!372579 #b10000000000000000000000000000000) (bvand (bvsub lt!372579 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!237058 (= lt!372579 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!237058 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!80094 c!11344) b!237054))

(assert (= (and d!80094 (not c!11344)) b!237052))

(assert (= (and d!80094 res!198146) b!237056))

(assert (= (and b!237056 res!198144) b!237053))

(assert (= (and b!237053 res!198145) b!237057))

(assert (= (and b!237057 res!198143) b!237055))

(assert (= (and b!237055 (not res!198142)) b!237058))

(declare-fun m!359625 () Bool)

(assert (=> b!237052 m!359625))

(declare-fun m!359627 () Bool)

(assert (=> b!237052 m!359627))

(declare-fun m!359629 () Bool)

(assert (=> b!237056 m!359629))

(declare-fun m!359631 () Bool)

(assert (=> b!237056 m!359631))

(assert (=> b!237057 m!359573))

(declare-fun m!359633 () Bool)

(assert (=> b!237058 m!359633))

(assert (=> b!237005 d!80094))

(declare-fun d!80106 () Bool)

(declare-fun e!163885 () Bool)

(assert (=> d!80106 e!163885))

(declare-fun res!198149 () Bool)

(assert (=> d!80106 (=> (not res!198149) (not e!163885))))

(declare-datatypes ((Unit!17391 0))(
  ( (Unit!17392) )
))
(declare-datatypes ((tuple2!20034 0))(
  ( (tuple2!20035 (_1!10921 Unit!17391) (_2!10921 BitStream!10002)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10002) tuple2!20034)

(assert (=> d!80106 (= res!198149 (= (buf!5994 (_2!10921 (increaseBitIndex!0 thiss!1830))) (buf!5994 thiss!1830)))))

(declare-fun lt!372601 () Bool)

(assert (=> d!80106 (= lt!372601 (not (= (bvand ((_ sign_extend 24) (select (arr!6506 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11160 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372605 () tuple2!20026)

(assert (=> d!80106 (= lt!372605 (tuple2!20027 (not (= (bvand ((_ sign_extend 24) (select (arr!6506 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11160 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10921 (increaseBitIndex!0 thiss!1830))))))

(assert (=> d!80106 (validate_offset_bit!0 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830)))))

(assert (=> d!80106 (= (readBit!0 thiss!1830) lt!372605)))

(declare-fun lt!372602 () (_ BitVec 64))

(declare-fun lt!372606 () (_ BitVec 64))

(declare-fun b!237061 () Bool)

(assert (=> b!237061 (= e!163885 (= (bitIndex!0 (size!5519 (buf!5994 (_2!10921 (increaseBitIndex!0 thiss!1830)))) (currentByte!11165 (_2!10921 (increaseBitIndex!0 thiss!1830))) (currentBit!11160 (_2!10921 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!372606 lt!372602)))))

(assert (=> b!237061 (or (not (= (bvand lt!372606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372602 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!372606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!372606 lt!372602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237061 (= lt!372602 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!237061 (= lt!372606 (bitIndex!0 (size!5519 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830) (currentBit!11160 thiss!1830)))))

(declare-fun lt!372603 () Bool)

(assert (=> b!237061 (= lt!372603 (not (= (bvand ((_ sign_extend 24) (select (arr!6506 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11160 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372600 () Bool)

(assert (=> b!237061 (= lt!372600 (not (= (bvand ((_ sign_extend 24) (select (arr!6506 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11160 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!372604 () Bool)

(assert (=> b!237061 (= lt!372604 (not (= (bvand ((_ sign_extend 24) (select (arr!6506 (buf!5994 thiss!1830)) (currentByte!11165 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11160 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80106 res!198149) b!237061))

(declare-fun m!359635 () Bool)

(assert (=> d!80106 m!359635))

(declare-fun m!359637 () Bool)

(assert (=> d!80106 m!359637))

(declare-fun m!359639 () Bool)

(assert (=> d!80106 m!359639))

(assert (=> d!80106 m!359591))

(assert (=> b!237061 m!359637))

(assert (=> b!237061 m!359639))

(assert (=> b!237061 m!359581))

(assert (=> b!237061 m!359635))

(declare-fun m!359641 () Bool)

(assert (=> b!237061 m!359641))

(assert (=> b!237005 d!80106))

(declare-fun d!80108 () Bool)

(assert (=> d!80108 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5519 (buf!5994 thiss!1830))) ((_ sign_extend 32) (currentByte!11165 thiss!1830)) ((_ sign_extend 32) (currentBit!11160 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19984 () Bool)

(assert (= bs!19984 d!80108))

(assert (=> bs!19984 m!359613))

(assert (=> b!237000 d!80108))

(check-sat (not d!80084) (not b!237058) (not b!237056) (not d!80108) (not d!80106) (not b!237061) (not b!237057) (not d!80092) (not b!237052) (not d!80086) (not d!80082))
