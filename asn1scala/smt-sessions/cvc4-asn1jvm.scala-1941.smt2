; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50682 () Bool)

(assert start!50682)

(declare-fun b!237022 () Bool)

(declare-fun e!163864 () Bool)

(declare-fun e!163863 () Bool)

(assert (=> b!237022 (= e!163864 e!163863)))

(declare-fun res!198118 () Bool)

(assert (=> b!237022 (=> (not res!198118) (not e!163863))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun lt!372533 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> b!237022 (= res!198118 (and (= (bvand acc!170 lt!372533) acc!170) (not (= nBits!581 i!752))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237022 (= lt!372533 (onesLSBLong!0 nBits!581))))

(declare-fun b!237023 () Bool)

(declare-fun res!198123 () Bool)

(assert (=> b!237023 (=> (not res!198123) (not e!163864))))

(assert (=> b!237023 (= res!198123 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237024 () Bool)

(declare-fun e!163860 () Bool)

(assert (=> b!237024 (= e!163860 e!163864)))

(declare-fun res!198120 () Bool)

(assert (=> b!237024 (=> (not res!198120) (not e!163864))))

(declare-datatypes ((array!12578 0))(
  ( (array!12579 (arr!6507 (Array (_ BitVec 32) (_ BitVec 8))) (size!5520 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10004 0))(
  ( (BitStream!10005 (buf!5995 array!12578) (currentByte!11166 (_ BitVec 32)) (currentBit!11161 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10004)

(declare-fun lt!372531 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237024 (= res!198120 (validate_offset_bits!1 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830)) lt!372531))))

(assert (=> b!237024 (= lt!372531 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237025 () Bool)

(declare-fun e!163862 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237025 (= e!163862 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830)))))))

(declare-fun b!237026 () Bool)

(declare-fun res!198117 () Bool)

(assert (=> b!237026 (=> (not res!198117) (not e!163862))))

(declare-datatypes ((tuple2!20028 0))(
  ( (tuple2!20029 (_1!10918 (_ BitVec 64)) (_2!10918 BitStream!10004)) )
))
(declare-fun lt!372534 () tuple2!20028)

(assert (=> b!237026 (= res!198117 (and (= (bvlshr (_1!10918 lt!372534) lt!372531) (bvlshr acc!170 lt!372531)) (= (bvand (_1!10918 lt!372534) lt!372533) (_1!10918 lt!372534)) (bvslt i!752 nBits!581)))))

(declare-fun b!237027 () Bool)

(assert (=> b!237027 (= e!163863 e!163862)))

(declare-fun res!198122 () Bool)

(assert (=> b!237027 (=> (not res!198122) (not e!163862))))

(assert (=> b!237027 (= res!198122 (= (buf!5995 (_2!10918 lt!372534)) (buf!5995 thiss!1830)))))

(declare-datatypes ((tuple2!20030 0))(
  ( (tuple2!20031 (_1!10919 Bool) (_2!10919 BitStream!10004)) )
))
(declare-fun lt!372532 () tuple2!20030)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10004 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20028)

(assert (=> b!237027 (= lt!372534 (readNLeastSignificantBitsLoop!0 (_2!10919 lt!372532) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10919 lt!372532) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10004) tuple2!20030)

(assert (=> b!237027 (= lt!372532 (readBit!0 thiss!1830))))

(declare-fun res!198119 () Bool)

(assert (=> start!50682 (=> (not res!198119) (not e!163860))))

(assert (=> start!50682 (= res!198119 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50682 e!163860))

(assert (=> start!50682 true))

(declare-fun e!163865 () Bool)

(declare-fun inv!12 (BitStream!10004) Bool)

(assert (=> start!50682 (and (inv!12 thiss!1830) e!163865)))

(declare-fun b!237028 () Bool)

(declare-fun array_inv!5261 (array!12578) Bool)

(assert (=> b!237028 (= e!163865 (array_inv!5261 (buf!5995 thiss!1830)))))

(declare-fun b!237029 () Bool)

(declare-fun res!198121 () Bool)

(assert (=> b!237029 (=> (not res!198121) (not e!163862))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237029 (= res!198121 (= (bitIndex!0 (size!5520 (buf!5995 (_2!10918 lt!372534))) (currentByte!11166 (_2!10918 lt!372534)) (currentBit!11161 (_2!10918 lt!372534))) (bvadd (bitIndex!0 (size!5520 (buf!5995 thiss!1830)) (currentByte!11166 thiss!1830) (currentBit!11161 thiss!1830)) lt!372531)))))

(assert (= (and start!50682 res!198119) b!237024))

(assert (= (and b!237024 res!198120) b!237023))

(assert (= (and b!237023 res!198123) b!237022))

(assert (= (and b!237022 res!198118) b!237027))

(assert (= (and b!237027 res!198122) b!237029))

(assert (= (and b!237029 res!198121) b!237026))

(assert (= (and b!237026 res!198117) b!237025))

(assert (= start!50682 b!237028))

(declare-fun m!359593 () Bool)

(assert (=> b!237022 m!359593))

(declare-fun m!359595 () Bool)

(assert (=> b!237028 m!359595))

(declare-fun m!359597 () Bool)

(assert (=> b!237025 m!359597))

(declare-fun m!359599 () Bool)

(assert (=> b!237024 m!359599))

(declare-fun m!359601 () Bool)

(assert (=> b!237029 m!359601))

(declare-fun m!359603 () Bool)

(assert (=> b!237029 m!359603))

(declare-fun m!359605 () Bool)

(assert (=> b!237027 m!359605))

(declare-fun m!359607 () Bool)

(assert (=> b!237027 m!359607))

(declare-fun m!359609 () Bool)

(assert (=> start!50682 m!359609))

(declare-fun m!359611 () Bool)

(assert (=> b!237023 m!359611))

(push 1)

(assert (not b!237025))

(assert (not b!237028))

(assert (not b!237023))

(assert (not b!237022))

(assert (not b!237024))

(assert (not b!237027))

(assert (not start!50682))

(assert (not b!237029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80110 () Bool)

(assert (=> d!80110 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!237022 d!80110))

(declare-fun d!80112 () Bool)

(assert (=> d!80112 (= (array_inv!5261 (buf!5995 thiss!1830)) (bvsge (size!5520 (buf!5995 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!237028 d!80112))

(declare-fun d!80114 () Bool)

(assert (=> d!80114 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!237023 d!80114))

(declare-fun d!80116 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80116 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11161 thiss!1830) (currentByte!11166 thiss!1830) (size!5520 (buf!5995 thiss!1830))))))

(declare-fun bs!19985 () Bool)

(assert (= bs!19985 d!80116))

(declare-fun m!359643 () Bool)

(assert (=> bs!19985 m!359643))

(assert (=> start!50682 d!80116))

(declare-fun d!80118 () Bool)

(declare-fun e!163897 () Bool)

(assert (=> d!80118 e!163897))

(declare-fun res!198169 () Bool)

(assert (=> d!80118 (=> (not res!198169) (not e!163897))))

(declare-fun lt!372646 () (_ BitVec 64))

(declare-fun lt!372648 () (_ BitVec 64))

(declare-fun lt!372647 () (_ BitVec 64))

(assert (=> d!80118 (= res!198169 (= lt!372646 (bvsub lt!372647 lt!372648)))))

(assert (=> d!80118 (or (= (bvand lt!372647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372648 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372647 lt!372648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80118 (= lt!372648 (remainingBits!0 ((_ sign_extend 32) (size!5520 (buf!5995 (_2!10918 lt!372534)))) ((_ sign_extend 32) (currentByte!11166 (_2!10918 lt!372534))) ((_ sign_extend 32) (currentBit!11161 (_2!10918 lt!372534)))))))

(declare-fun lt!372650 () (_ BitVec 64))

(declare-fun lt!372651 () (_ BitVec 64))

(assert (=> d!80118 (= lt!372647 (bvmul lt!372650 lt!372651))))

(assert (=> d!80118 (or (= lt!372650 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372651 (bvsdiv (bvmul lt!372650 lt!372651) lt!372650)))))

(assert (=> d!80118 (= lt!372651 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80118 (= lt!372650 ((_ sign_extend 32) (size!5520 (buf!5995 (_2!10918 lt!372534)))))))

(assert (=> d!80118 (= lt!372646 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11166 (_2!10918 lt!372534))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11161 (_2!10918 lt!372534)))))))

(assert (=> d!80118 (invariant!0 (currentBit!11161 (_2!10918 lt!372534)) (currentByte!11166 (_2!10918 lt!372534)) (size!5520 (buf!5995 (_2!10918 lt!372534))))))

(assert (=> d!80118 (= (bitIndex!0 (size!5520 (buf!5995 (_2!10918 lt!372534))) (currentByte!11166 (_2!10918 lt!372534)) (currentBit!11161 (_2!10918 lt!372534))) lt!372646)))

(declare-fun b!237087 () Bool)

(declare-fun res!198170 () Bool)

(assert (=> b!237087 (=> (not res!198170) (not e!163897))))

(assert (=> b!237087 (= res!198170 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372646))))

(declare-fun b!237088 () Bool)

(declare-fun lt!372649 () (_ BitVec 64))

(assert (=> b!237088 (= e!163897 (bvsle lt!372646 (bvmul lt!372649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!237088 (or (= lt!372649 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372649 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372649)))))

(assert (=> b!237088 (= lt!372649 ((_ sign_extend 32) (size!5520 (buf!5995 (_2!10918 lt!372534)))))))

(assert (= (and d!80118 res!198169) b!237087))

(assert (= (and b!237087 res!198170) b!237088))

(declare-fun m!359655 () Bool)

(assert (=> d!80118 m!359655))

(declare-fun m!359657 () Bool)

(assert (=> d!80118 m!359657))

(assert (=> b!237029 d!80118))

(declare-fun d!80122 () Bool)

(declare-fun e!163898 () Bool)

(assert (=> d!80122 e!163898))

(declare-fun res!198171 () Bool)

(assert (=> d!80122 (=> (not res!198171) (not e!163898))))

(declare-fun lt!372653 () (_ BitVec 64))

(declare-fun lt!372652 () (_ BitVec 64))

(declare-fun lt!372654 () (_ BitVec 64))

(assert (=> d!80122 (= res!198171 (= lt!372652 (bvsub lt!372653 lt!372654)))))

(assert (=> d!80122 (or (= (bvand lt!372653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!372654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!372653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!372653 lt!372654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!80122 (= lt!372654 (remainingBits!0 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830))))))

(declare-fun lt!372656 () (_ BitVec 64))

(declare-fun lt!372657 () (_ BitVec 64))

(assert (=> d!80122 (= lt!372653 (bvmul lt!372656 lt!372657))))

(assert (=> d!80122 (or (= lt!372656 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!372657 (bvsdiv (bvmul lt!372656 lt!372657) lt!372656)))))

(assert (=> d!80122 (= lt!372657 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80122 (= lt!372656 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))))))

(assert (=> d!80122 (= lt!372652 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11166 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11161 thiss!1830))))))

(assert (=> d!80122 (invariant!0 (currentBit!11161 thiss!1830) (currentByte!11166 thiss!1830) (size!5520 (buf!5995 thiss!1830)))))

(assert (=> d!80122 (= (bitIndex!0 (size!5520 (buf!5995 thiss!1830)) (currentByte!11166 thiss!1830) (currentBit!11161 thiss!1830)) lt!372652)))

(declare-fun b!237089 () Bool)

(declare-fun res!198172 () Bool)

(assert (=> b!237089 (=> (not res!198172) (not e!163898))))

(assert (=> b!237089 (= res!198172 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!372652))))

(declare-fun b!237090 () Bool)

(declare-fun lt!372655 () (_ BitVec 64))

(assert (=> b!237090 (= e!163898 (bvsle lt!372652 (bvmul lt!372655 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!237090 (or (= lt!372655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!372655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!372655)))))

(assert (=> b!237090 (= lt!372655 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))))))

(assert (= (and d!80122 res!198171) b!237089))

(assert (= (and b!237089 res!198172) b!237090))

(declare-fun m!359659 () Bool)

(assert (=> d!80122 m!359659))

(assert (=> d!80122 m!359643))

(assert (=> b!237029 d!80122))

(declare-fun d!80124 () Bool)

(assert (=> d!80124 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830)) lt!372531) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830))) lt!372531))))

(declare-fun bs!19986 () Bool)

(assert (= bs!19986 d!80124))

(assert (=> bs!19986 m!359659))

(assert (=> b!237024 d!80124))

(declare-fun d!80126 () Bool)

(assert (=> d!80126 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5520 (buf!5995 thiss!1830))) ((_ sign_extend 32) (currentByte!11166 thiss!1830)) ((_ sign_extend 32) (currentBit!11161 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

