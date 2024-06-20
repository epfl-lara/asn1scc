; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4772 () Bool)

(assert start!4772)

(declare-fun res!16523 () Bool)

(declare-fun e!12318 () Bool)

(assert (=> start!4772 (=> (not res!16523) (not e!12318))))

(declare-datatypes ((array!1335 0))(
  ( (array!1336 (arr!1005 (Array (_ BitVec 32) (_ BitVec 8))) (size!564 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1335)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4772 (= res!16523 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!564 srcBuffer!2))))))))

(assert (=> start!4772 e!12318))

(assert (=> start!4772 true))

(declare-fun array_inv!534 (array!1335) Bool)

(assert (=> start!4772 (array_inv!534 srcBuffer!2)))

(declare-datatypes ((BitStream!962 0))(
  ( (BitStream!963 (buf!864 array!1335) (currentByte!2135 (_ BitVec 32)) (currentBit!2130 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!962)

(declare-fun e!12316 () Bool)

(declare-fun inv!12 (BitStream!962) Bool)

(assert (=> start!4772 (and (inv!12 thiss!1379) e!12316)))

(declare-fun b!18883 () Bool)

(declare-fun e!12313 () Bool)

(declare-fun e!12315 () Bool)

(assert (=> b!18883 (= e!12313 e!12315)))

(declare-fun res!16521 () Bool)

(assert (=> b!18883 (=> res!16521 e!12315)))

(declare-fun lt!26959 () (_ BitVec 32))

(assert (=> b!18883 (= res!16521 (or (bvslt lt!26959 #b00000000000000000000000000000000) (bvsge lt!26959 #b00000000000000000000000000001000)))))

(assert (=> b!18883 (= lt!26959 ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!18884 () Bool)

(declare-fun res!16520 () Bool)

(assert (=> b!18884 (=> (not res!16520) (not e!12318))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18884 (= res!16520 (validate_offset_bits!1 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18885 () Bool)

(assert (=> b!18885 (= e!12316 (array_inv!534 (buf!864 thiss!1379)))))

(declare-fun b!18886 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18886 (= e!12315 (validate_offset_bit!0 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379))))))

(declare-fun b!18887 () Bool)

(assert (=> b!18887 (= e!12318 (not e!12313))))

(declare-fun res!16522 () Bool)

(assert (=> b!18887 (=> res!16522 e!12313)))

(assert (=> b!18887 (= res!16522 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!962 BitStream!962) Bool)

(assert (=> b!18887 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1672 0))(
  ( (Unit!1673) )
))
(declare-fun lt!26958 () Unit!1672)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!962) Unit!1672)

(assert (=> b!18887 (= lt!26958 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!26957 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18887 (= lt!26957 (bitIndex!0 (size!564 (buf!864 thiss!1379)) (currentByte!2135 thiss!1379) (currentBit!2130 thiss!1379)))))

(assert (= (and start!4772 res!16523) b!18884))

(assert (= (and b!18884 res!16520) b!18887))

(assert (= (and b!18887 (not res!16522)) b!18883))

(assert (= (and b!18883 (not res!16521)) b!18886))

(assert (= start!4772 b!18885))

(declare-fun m!25355 () Bool)

(assert (=> b!18887 m!25355))

(declare-fun m!25357 () Bool)

(assert (=> b!18887 m!25357))

(declare-fun m!25359 () Bool)

(assert (=> b!18887 m!25359))

(declare-fun m!25361 () Bool)

(assert (=> b!18884 m!25361))

(declare-fun m!25363 () Bool)

(assert (=> start!4772 m!25363))

(declare-fun m!25365 () Bool)

(assert (=> start!4772 m!25365))

(declare-fun m!25367 () Bool)

(assert (=> b!18886 m!25367))

(declare-fun m!25369 () Bool)

(assert (=> b!18885 m!25369))

(push 1)

(assert (not b!18885))

(assert (not start!4772))

(assert (not b!18884))

(assert (not b!18886))

(assert (not b!18887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6290 () Bool)

(declare-fun res!16556 () Bool)

(declare-fun e!12338 () Bool)

(assert (=> d!6290 (=> (not res!16556) (not e!12338))))

(assert (=> d!6290 (= res!16556 (= (size!564 (buf!864 thiss!1379)) (size!564 (buf!864 thiss!1379))))))

(assert (=> d!6290 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!12338)))

(declare-fun b!18918 () Bool)

(declare-fun res!16554 () Bool)

(assert (=> b!18918 (=> (not res!16554) (not e!12338))))

(assert (=> b!18918 (= res!16554 (bvsle (bitIndex!0 (size!564 (buf!864 thiss!1379)) (currentByte!2135 thiss!1379) (currentBit!2130 thiss!1379)) (bitIndex!0 (size!564 (buf!864 thiss!1379)) (currentByte!2135 thiss!1379) (currentBit!2130 thiss!1379))))))

(declare-fun b!18919 () Bool)

(declare-fun e!12339 () Bool)

(assert (=> b!18919 (= e!12338 e!12339)))

(declare-fun res!16555 () Bool)

(assert (=> b!18919 (=> res!16555 e!12339)))

(assert (=> b!18919 (= res!16555 (= (size!564 (buf!864 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!18920 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1335 array!1335 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18920 (= e!12339 (arrayBitRangesEq!0 (buf!864 thiss!1379) (buf!864 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!564 (buf!864 thiss!1379)) (currentByte!2135 thiss!1379) (currentBit!2130 thiss!1379))))))

(assert (= (and d!6290 res!16556) b!18918))

(assert (= (and b!18918 res!16554) b!18919))

(assert (= (and b!18919 (not res!16555)) b!18920))

(assert (=> b!18918 m!25359))

(assert (=> b!18918 m!25359))

(assert (=> b!18920 m!25359))

(assert (=> b!18920 m!25359))

(declare-fun m!25385 () Bool)

(assert (=> b!18920 m!25385))

(assert (=> b!18887 d!6290))

(declare-fun d!6292 () Bool)

(assert (=> d!6292 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!26998 () Unit!1672)

(declare-fun choose!11 (BitStream!962) Unit!1672)

(assert (=> d!6292 (= lt!26998 (choose!11 thiss!1379))))

(assert (=> d!6292 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!26998)))

(declare-fun bs!1820 () Bool)

(assert (= bs!1820 d!6292))

(assert (=> bs!1820 m!25355))

(declare-fun m!25387 () Bool)

(assert (=> bs!1820 m!25387))

(assert (=> b!18887 d!6292))

(declare-fun d!6294 () Bool)

(declare-fun e!12345 () Bool)

(assert (=> d!6294 e!12345))

(declare-fun res!16568 () Bool)

(assert (=> d!6294 (=> (not res!16568) (not e!12345))))

(declare-fun lt!27017 () (_ BitVec 64))

(declare-fun lt!27020 () (_ BitVec 64))

(declare-fun lt!27019 () (_ BitVec 64))

(assert (=> d!6294 (= res!16568 (= lt!27019 (bvsub lt!27020 lt!27017)))))

(assert (=> d!6294 (or (= (bvand lt!27020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27020 lt!27017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6294 (= lt!27017 (remainingBits!0 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379))))))

(declare-fun lt!27022 () (_ BitVec 64))

(declare-fun lt!27018 () (_ BitVec 64))

(assert (=> d!6294 (= lt!27020 (bvmul lt!27022 lt!27018))))

(assert (=> d!6294 (or (= lt!27022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!27018 (bvsdiv (bvmul lt!27022 lt!27018) lt!27022)))))

(assert (=> d!6294 (= lt!27018 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6294 (= lt!27022 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))))))

(assert (=> d!6294 (= lt!27019 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2135 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2130 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6294 (invariant!0 (currentBit!2130 thiss!1379) (currentByte!2135 thiss!1379) (size!564 (buf!864 thiss!1379)))))

(assert (=> d!6294 (= (bitIndex!0 (size!564 (buf!864 thiss!1379)) (currentByte!2135 thiss!1379) (currentBit!2130 thiss!1379)) lt!27019)))

(declare-fun b!18931 () Bool)

(declare-fun res!16567 () Bool)

(assert (=> b!18931 (=> (not res!16567) (not e!12345))))

(assert (=> b!18931 (= res!16567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!27019))))

(declare-fun b!18932 () Bool)

(declare-fun lt!27021 () (_ BitVec 64))

(assert (=> b!18932 (= e!12345 (bvsle lt!27019 (bvmul lt!27021 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!18932 (or (= lt!27021 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!27021 #b0000000000000000000000000000000000000000000000000000000000001000) lt!27021)))))

(assert (=> b!18932 (= lt!27021 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))))))

(assert (= (and d!6294 res!16568) b!18931))

(assert (= (and b!18931 res!16567) b!18932))

(declare-fun m!25391 () Bool)

(assert (=> d!6294 m!25391))

(declare-fun m!25393 () Bool)

(assert (=> d!6294 m!25393))

(assert (=> b!18887 d!6294))

(declare-fun d!6302 () Bool)

(assert (=> d!6302 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1823 () Bool)

(assert (= bs!1823 d!6302))

(assert (=> bs!1823 m!25391))

(assert (=> b!18886 d!6302))

(declare-fun d!6304 () Bool)

(assert (=> d!6304 (= (array_inv!534 srcBuffer!2) (bvsge (size!564 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4772 d!6304))

(declare-fun d!6306 () Bool)

(assert (=> d!6306 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2130 thiss!1379) (currentByte!2135 thiss!1379) (size!564 (buf!864 thiss!1379))))))

(declare-fun bs!1824 () Bool)

(assert (= bs!1824 d!6306))

(assert (=> bs!1824 m!25393))

(assert (=> start!4772 d!6306))

(declare-fun d!6308 () Bool)

(assert (=> d!6308 (= (array_inv!534 (buf!864 thiss!1379)) (bvsge (size!564 (buf!864 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!18885 d!6308))

(declare-fun d!6310 () Bool)

(assert (=> d!6310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!564 (buf!864 thiss!1379))) ((_ sign_extend 32) (currentByte!2135 thiss!1379)) ((_ sign_extend 32) (currentBit!2130 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1825 () Bool)

(assert (= bs!1825 d!6310))

(assert (=> bs!1825 m!25391))

(assert (=> b!18884 d!6310))

(push 1)

(assert (not d!6306))

(assert (not d!6292))

(assert (not b!18918))

(assert (not d!6294))

(assert (not d!6302))

(assert (not b!18920))

(assert (not d!6310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

