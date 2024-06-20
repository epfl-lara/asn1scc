; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50846 () Bool)

(assert start!50846)

(declare-fun b!238112 () Bool)

(declare-fun e!164485 () Bool)

(declare-fun e!164489 () Bool)

(assert (=> b!238112 (= e!164485 e!164489)))

(declare-fun res!199028 () Bool)

(assert (=> b!238112 (=> (not res!199028) (not e!164489))))

(declare-datatypes ((array!12691 0))(
  ( (array!12692 (arr!6562 (Array (_ BitVec 32) (_ BitVec 8))) (size!5575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10114 0))(
  ( (BitStream!10115 (buf!6050 array!12691) (currentByte!11230 (_ BitVec 32)) (currentBit!11225 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10114)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun acc!170 () (_ BitVec 64))

(declare-datatypes ((tuple2!20082 0))(
  ( (tuple2!20083 (_1!10945 Bool) (_2!10945 BitStream!10114)) )
))
(declare-fun lt!372968 () tuple2!20082)

(declare-datatypes ((tuple2!20084 0))(
  ( (tuple2!20085 (_1!10946 (_ BitVec 64)) (_2!10946 BitStream!10114)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20084)

(assert (=> b!238112 (= res!199028 (= (buf!6050 (_2!10946 (readNLeastSignificantBitsLoop!0 (_2!10945 lt!372968) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10945 lt!372968) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (buf!6050 thiss!1830)))))

(declare-fun readBit!0 (BitStream!10114) tuple2!20082)

(assert (=> b!238112 (= lt!372968 (readBit!0 thiss!1830))))

(declare-fun res!199027 () Bool)

(declare-fun e!164487 () Bool)

(assert (=> start!50846 (=> (not res!199027) (not e!164487))))

(assert (=> start!50846 (= res!199027 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50846 e!164487))

(assert (=> start!50846 true))

(declare-fun e!164488 () Bool)

(declare-fun inv!12 (BitStream!10114) Bool)

(assert (=> start!50846 (and (inv!12 thiss!1830) e!164488)))

(declare-fun b!238113 () Bool)

(assert (=> b!238113 (= e!164487 e!164485)))

(declare-fun res!199026 () Bool)

(assert (=> b!238113 (=> (not res!199026) (not e!164485))))

(declare-fun lt!372967 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238113 (= res!199026 (validate_offset_bits!1 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))) ((_ sign_extend 32) (currentByte!11230 thiss!1830)) ((_ sign_extend 32) (currentBit!11225 thiss!1830)) lt!372967))))

(assert (=> b!238113 (= lt!372967 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!238114 () Bool)

(declare-fun array_inv!5316 (array!12691) Bool)

(assert (=> b!238114 (= e!164488 (array_inv!5316 (buf!6050 thiss!1830)))))

(declare-fun b!238115 () Bool)

(declare-fun res!199029 () Bool)

(assert (=> b!238115 (=> (not res!199029) (not e!164485))))

(assert (=> b!238115 (= res!199029 (not (= nBits!581 i!752)))))

(declare-fun b!238116 () Bool)

(declare-fun res!199024 () Bool)

(assert (=> b!238116 (=> (not res!199024) (not e!164485))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238116 (= res!199024 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238117 () Bool)

(declare-fun res!199025 () Bool)

(assert (=> b!238117 (=> (not res!199025) (not e!164485))))

(assert (=> b!238117 (= res!199025 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!238118 () Bool)

(declare-fun lt!372969 () (_ BitVec 64))

(declare-fun lt!372966 () (_ BitVec 64))

(assert (=> b!238118 (= e!164489 (and (= lt!372969 (bvand lt!372967 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!372969 (bvand (bvadd lt!372966 lt!372967) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!238118 (= lt!372969 (bvand lt!372966 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238118 (= lt!372966 (bitIndex!0 (size!5575 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830) (currentBit!11225 thiss!1830)))))

(assert (= (and start!50846 res!199027) b!238113))

(assert (= (and b!238113 res!199026) b!238116))

(assert (= (and b!238116 res!199024) b!238117))

(assert (= (and b!238117 res!199025) b!238115))

(assert (= (and b!238115 res!199029) b!238112))

(assert (= (and b!238112 res!199028) b!238118))

(assert (= start!50846 b!238114))

(declare-fun m!360327 () Bool)

(assert (=> b!238116 m!360327))

(declare-fun m!360329 () Bool)

(assert (=> b!238112 m!360329))

(declare-fun m!360331 () Bool)

(assert (=> b!238112 m!360331))

(declare-fun m!360333 () Bool)

(assert (=> b!238114 m!360333))

(declare-fun m!360335 () Bool)

(assert (=> b!238118 m!360335))

(declare-fun m!360337 () Bool)

(assert (=> b!238113 m!360337))

(declare-fun m!360339 () Bool)

(assert (=> b!238117 m!360339))

(declare-fun m!360341 () Bool)

(assert (=> start!50846 m!360341))

(push 1)

(assert (not b!238113))

(assert (not b!238112))

(assert (not b!238118))

(assert (not b!238114))

(assert (not b!238116))

(assert (not b!238117))

(assert (not start!50846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80192 () Bool)

(declare-fun e!164535 () Bool)

(assert (=> d!80192 e!164535))

(declare-fun res!199086 () Bool)

(assert (=> d!80192 (=> (not res!199086) (not e!164535))))

(declare-fun lt!373036 () (_ BitVec 64))

(declare-fun lt!373038 () (_ BitVec 64))

(declare-fun lt!373033 () (_ BitVec 64))

(assert (=> d!80192 (= res!199086 (= lt!373038 (bvsub lt!373036 lt!373033)))))

(assert (=> d!80192 (or (= (bvand lt!373036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373033 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!373036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!373036 lt!373033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80192 (= lt!373033 (remainingBits!0 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))) ((_ sign_extend 32) (currentByte!11230 thiss!1830)) ((_ sign_extend 32) (currentBit!11225 thiss!1830))))))

(declare-fun lt!373034 () (_ BitVec 64))

(declare-fun lt!373037 () (_ BitVec 64))

(assert (=> d!80192 (= lt!373036 (bvmul lt!373034 lt!373037))))

(assert (=> d!80192 (or (= lt!373034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!373037 (bvsdiv (bvmul lt!373034 lt!373037) lt!373034)))))

(assert (=> d!80192 (= lt!373037 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!80192 (= lt!373034 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))))))

(assert (=> d!80192 (= lt!373038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11230 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11225 thiss!1830))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80192 (invariant!0 (currentBit!11225 thiss!1830) (currentByte!11230 thiss!1830) (size!5575 (buf!6050 thiss!1830)))))

(assert (=> d!80192 (= (bitIndex!0 (size!5575 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830) (currentBit!11225 thiss!1830)) lt!373038)))

(declare-fun b!238186 () Bool)

(declare-fun res!199085 () Bool)

(assert (=> b!238186 (=> (not res!199085) (not e!164535))))

(assert (=> b!238186 (= res!199085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!373038))))

(declare-fun b!238187 () Bool)

(declare-fun lt!373035 () (_ BitVec 64))

(assert (=> b!238187 (= e!164535 (bvsle lt!373038 (bvmul lt!373035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!238187 (or (= lt!373035 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!373035 #b0000000000000000000000000000000000000000000000000000000000001000) lt!373035)))))

(assert (=> b!238187 (= lt!373035 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))))))

(assert (= (and d!80192 res!199086) b!238186))

(assert (= (and b!238186 res!199085) b!238187))

(declare-fun m!360387 () Bool)

(assert (=> d!80192 m!360387))

(declare-fun m!360389 () Bool)

(assert (=> d!80192 m!360389))

(assert (=> b!238118 d!80192))

(declare-fun d!80196 () Bool)

(assert (=> d!80196 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))) ((_ sign_extend 32) (currentByte!11230 thiss!1830)) ((_ sign_extend 32) (currentBit!11225 thiss!1830)) lt!372967) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))) ((_ sign_extend 32) (currentByte!11230 thiss!1830)) ((_ sign_extend 32) (currentBit!11225 thiss!1830))) lt!372967))))

(declare-fun bs!20049 () Bool)

(assert (= bs!20049 d!80196))

(assert (=> bs!20049 m!360387))

(assert (=> b!238113 d!80196))

(declare-fun d!80198 () Bool)

(assert (=> d!80198 (= (array_inv!5316 (buf!6050 thiss!1830)) (bvsge (size!5575 (buf!6050 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!238114 d!80198))

(declare-fun d!80200 () Bool)

(assert (=> d!80200 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!238116 d!80200))

(declare-fun d!80202 () Bool)

(assert (=> d!80202 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11225 thiss!1830) (currentByte!11230 thiss!1830) (size!5575 (buf!6050 thiss!1830))))))

(declare-fun bs!20050 () Bool)

(assert (= bs!20050 d!80202))

(assert (=> bs!20050 m!360389))

(assert (=> start!50846 d!80202))

(declare-fun b!238241 () Bool)

(declare-fun res!199133 () Bool)

(declare-fun e!164569 () Bool)

(assert (=> b!238241 (=> (not res!199133) (not e!164569))))

(declare-fun lt!373165 () (_ BitVec 64))

(declare-fun lt!373166 () tuple2!20084)

(declare-fun lt!373167 () (_ BitVec 64))

(assert (=> b!238241 (= res!199133 (= (bitIndex!0 (size!5575 (buf!6050 (_2!10946 lt!373166))) (currentByte!11230 (_2!10946 lt!373166)) (currentBit!11225 (_2!10946 lt!373166))) (bvadd lt!373165 lt!373167)))))

(assert (=> b!238241 (or (not (= (bvand lt!373165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373167 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373165 lt!373167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238241 (= lt!373167 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238241 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238241 (= lt!373165 (bitIndex!0 (size!5575 (buf!6050 (_2!10945 lt!372968))) (currentByte!11230 (_2!10945 lt!372968)) (currentBit!11225 (_2!10945 lt!372968))))))

(declare-fun b!238242 () Bool)

(declare-fun e!164568 () Bool)

(declare-fun lt!373164 () (_ BitVec 64))

(declare-datatypes ((tuple2!20102 0))(
  ( (tuple2!20103 (_1!10955 BitStream!10114) (_2!10955 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10114) tuple2!20102)

(assert (=> b!238242 (= e!164568 (= (= (bvand (bvlshr (_1!10946 lt!373166) lt!373164) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10955 (readBitPure!0 (_2!10945 lt!372968)))))))

(assert (=> b!238242 (and (bvsge lt!373164 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373164 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!373169 () (_ BitVec 32))

(assert (=> b!238242 (= lt!373164 ((_ sign_extend 32) (bvsub lt!373169 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238242 (or (= (bvand lt!373169 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand lt!373169 #b10000000000000000000000000000000) (bvand (bvsub lt!373169 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238242 (= lt!373169 (bvsub nBits!581 #b00000000000000000000000000000001))))

(assert (=> b!238242 (or (= (bvand nBits!581 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!238243 () Bool)

(assert (=> b!238243 (= e!164569 e!164568)))

(declare-fun res!199131 () Bool)

(assert (=> b!238243 (=> res!199131 e!164568)))

(assert (=> b!238243 (= res!199131 (bvsge (bvadd #b00000000000000000000000000000001 i!752) nBits!581))))

(declare-fun e!164567 () tuple2!20084)

(declare-fun b!238244 () Bool)

(assert (=> b!238244 (= e!164567 (tuple2!20085 (bvor acc!170 (ite (_1!10945 lt!372968) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!10945 lt!372968)))))

(declare-fun d!80204 () Bool)

(assert (=> d!80204 e!164569))

(declare-fun res!199132 () Bool)

(assert (=> d!80204 (=> (not res!199132) (not e!164569))))

(assert (=> d!80204 (= res!199132 (= (buf!6050 (_2!10946 lt!373166)) (buf!6050 (_2!10945 lt!372968))))))

(assert (=> d!80204 (= lt!373166 e!164567)))

(declare-fun c!11359 () Bool)

(assert (=> d!80204 (= c!11359 (= nBits!581 (bvadd #b00000000000000000000000000000001 i!752)))))

(assert (=> d!80204 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!752)) (bvsle (bvadd #b00000000000000000000000000000001 i!752) nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000))))

(assert (=> d!80204 (= (readNLeastSignificantBitsLoop!0 (_2!10945 lt!372968) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10945 lt!372968) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!373166)))

(declare-fun b!238245 () Bool)

(declare-fun res!199130 () Bool)

(assert (=> b!238245 (=> (not res!199130) (not e!164569))))

(assert (=> b!238245 (= res!199130 (= (bvand (_1!10946 lt!373166) (onesLSBLong!0 nBits!581)) (_1!10946 lt!373166)))))

(declare-fun b!238246 () Bool)

(declare-fun lt!373163 () tuple2!20084)

(assert (=> b!238246 (= e!164567 (tuple2!20085 (_1!10946 lt!373163) (_2!10946 lt!373163)))))

(declare-fun lt!373168 () tuple2!20082)

(assert (=> b!238246 (= lt!373168 (readBit!0 (_2!10945 lt!372968)))))

(assert (=> b!238246 (= lt!373163 (readNLeastSignificantBitsLoop!0 (_2!10945 lt!373168) nBits!581 (bvadd #b00000000000000000000000000000001 i!752 #b00000000000000000000000000000001) (bvor (bvor acc!170 (ite (_1!10945 lt!372968) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!10945 lt!373168) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!752)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238247 () Bool)

(declare-fun res!199134 () Bool)

(assert (=> b!238247 (=> (not res!199134) (not e!164569))))

(declare-fun lt!373170 () (_ BitVec 64))

(declare-fun lt!373162 () (_ BitVec 64))

(assert (=> b!238247 (= res!199134 (= (bvlshr (_1!10946 lt!373166) lt!373170) (bvlshr (bvor acc!170 (ite (_1!10945 lt!372968) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!373162)))))

(assert (=> b!238247 (and (bvsge lt!373162 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373162 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238247 (= lt!373162 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238247 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (=> b!238247 (and (bvsge lt!373170 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!373170 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!238247 (= lt!373170 ((_ sign_extend 32) (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752))))))

(assert (=> b!238247 (or (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!752) #b10000000000000000000000000000000)) (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 (bvadd #b00000000000000000000000000000001 i!752)) #b10000000000000000000000000000000)))))

(assert (= (and d!80204 c!11359) b!238244))

(assert (= (and d!80204 (not c!11359)) b!238246))

(assert (= (and d!80204 res!199132) b!238241))

(assert (= (and b!238241 res!199133) b!238247))

(assert (= (and b!238247 res!199134) b!238245))

(assert (= (and b!238245 res!199130) b!238243))

(assert (= (and b!238243 (not res!199131)) b!238242))

(declare-fun m!360427 () Bool)

(assert (=> b!238241 m!360427))

(declare-fun m!360429 () Bool)

(assert (=> b!238241 m!360429))

(declare-fun m!360431 () Bool)

(assert (=> b!238242 m!360431))

(assert (=> b!238245 m!360339))

(declare-fun m!360433 () Bool)

(assert (=> b!238246 m!360433))

(declare-fun m!360435 () Bool)

(assert (=> b!238246 m!360435))

(assert (=> b!238112 d!80204))

(declare-fun d!80224 () Bool)

(declare-fun e!164576 () Bool)

(assert (=> d!80224 e!164576))

(declare-fun res!199137 () Bool)

(assert (=> d!80224 (=> (not res!199137) (not e!164576))))

(declare-datatypes ((Unit!17399 0))(
  ( (Unit!17400) )
))
(declare-datatypes ((tuple2!20104 0))(
  ( (tuple2!20105 (_1!10956 Unit!17399) (_2!10956 BitStream!10114)) )
))
(declare-fun increaseBitIndex!0 (BitStream!10114) tuple2!20104)

(assert (=> d!80224 (= res!199137 (= (buf!6050 (_2!10956 (increaseBitIndex!0 thiss!1830))) (buf!6050 thiss!1830)))))

(declare-fun lt!373188 () Bool)

(assert (=> d!80224 (= lt!373188 (not (= (bvand ((_ sign_extend 24) (select (arr!6562 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11225 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373187 () tuple2!20082)

(assert (=> d!80224 (= lt!373187 (tuple2!20083 (not (= (bvand ((_ sign_extend 24) (select (arr!6562 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11225 thiss!1830)))) #b00000000000000000000000000000000)) (_2!10956 (increaseBitIndex!0 thiss!1830))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!80224 (validate_offset_bit!0 ((_ sign_extend 32) (size!5575 (buf!6050 thiss!1830))) ((_ sign_extend 32) (currentByte!11230 thiss!1830)) ((_ sign_extend 32) (currentBit!11225 thiss!1830)))))

(assert (=> d!80224 (= (readBit!0 thiss!1830) lt!373187)))

(declare-fun lt!373186 () (_ BitVec 64))

(declare-fun b!238250 () Bool)

(declare-fun lt!373189 () (_ BitVec 64))

(assert (=> b!238250 (= e!164576 (= (bitIndex!0 (size!5575 (buf!6050 (_2!10956 (increaseBitIndex!0 thiss!1830)))) (currentByte!11230 (_2!10956 (increaseBitIndex!0 thiss!1830))) (currentBit!11225 (_2!10956 (increaseBitIndex!0 thiss!1830)))) (bvadd lt!373189 lt!373186)))))

(assert (=> b!238250 (or (not (= (bvand lt!373189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!373186 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!373189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!373189 lt!373186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!238250 (= lt!373186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!238250 (= lt!373189 (bitIndex!0 (size!5575 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830) (currentBit!11225 thiss!1830)))))

(declare-fun lt!373185 () Bool)

(assert (=> b!238250 (= lt!373185 (not (= (bvand ((_ sign_extend 24) (select (arr!6562 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11225 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373191 () Bool)

(assert (=> b!238250 (= lt!373191 (not (= (bvand ((_ sign_extend 24) (select (arr!6562 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11225 thiss!1830)))) #b00000000000000000000000000000000)))))

(declare-fun lt!373190 () Bool)

(assert (=> b!238250 (= lt!373190 (not (= (bvand ((_ sign_extend 24) (select (arr!6562 (buf!6050 thiss!1830)) (currentByte!11230 thiss!1830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!11225 thiss!1830)))) #b00000000000000000000000000000000)))))

(assert (= (and d!80224 res!199137) b!238250))

(declare-fun m!360437 () Bool)

(assert (=> d!80224 m!360437))

(declare-fun m!360439 () Bool)

(assert (=> d!80224 m!360439))

(declare-fun m!360441 () Bool)

(assert (=> d!80224 m!360441))

(declare-fun m!360443 () Bool)

(assert (=> d!80224 m!360443))

(assert (=> b!238250 m!360335))

(assert (=> b!238250 m!360439))

(assert (=> b!238250 m!360437))

(assert (=> b!238250 m!360441))

(declare-fun m!360445 () Bool)

(assert (=> b!238250 m!360445))

(assert (=> b!238112 d!80224))

(declare-fun d!80226 () Bool)

(assert (=> d!80226 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!238117 d!80226))

(push 1)

(assert (not d!80192))

(assert (not b!238241))

(assert (not d!80224))

(assert (not b!238245))

(assert (not b!238246))

(assert (not d!80202))

(assert (not b!238242))

(assert (not b!238250))

(assert (not d!80196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

