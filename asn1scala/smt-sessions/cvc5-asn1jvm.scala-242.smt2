; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4768 () Bool)

(assert start!4768)

(declare-fun res!16496 () Bool)

(declare-fun e!12281 () Bool)

(assert (=> start!4768 (=> (not res!16496) (not e!12281))))

(declare-datatypes ((array!1331 0))(
  ( (array!1332 (arr!1003 (Array (_ BitVec 32) (_ BitVec 8))) (size!562 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1331)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4768 (= res!16496 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!562 srcBuffer!2))))))))

(assert (=> start!4768 e!12281))

(assert (=> start!4768 true))

(declare-fun array_inv!532 (array!1331) Bool)

(assert (=> start!4768 (array_inv!532 srcBuffer!2)))

(declare-datatypes ((BitStream!958 0))(
  ( (BitStream!959 (buf!862 array!1331) (currentByte!2133 (_ BitVec 32)) (currentBit!2128 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!958)

(declare-fun e!12282 () Bool)

(declare-fun inv!12 (BitStream!958) Bool)

(assert (=> start!4768 (and (inv!12 thiss!1379) e!12282)))

(declare-fun b!18853 () Bool)

(assert (=> b!18853 (= e!12282 (array_inv!532 (buf!862 thiss!1379)))))

(declare-fun b!18854 () Bool)

(declare-fun e!12280 () Bool)

(declare-fun e!12278 () Bool)

(assert (=> b!18854 (= e!12280 e!12278)))

(declare-fun res!16499 () Bool)

(assert (=> b!18854 (=> res!16499 e!12278)))

(declare-fun lt!26941 () (_ BitVec 32))

(assert (=> b!18854 (= res!16499 (or (bvslt lt!26941 #b00000000000000000000000000000000) (bvsge lt!26941 #b00000000000000000000000000001000)))))

(assert (=> b!18854 (= lt!26941 ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!18855 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18855 (= e!12278 (validate_offset_bit!0 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379))))))

(declare-fun b!18856 () Bool)

(assert (=> b!18856 (= e!12281 (not e!12280))))

(declare-fun res!16498 () Bool)

(assert (=> b!18856 (=> res!16498 e!12280)))

(assert (=> b!18856 (= res!16498 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!958 BitStream!958) Bool)

(assert (=> b!18856 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1668 0))(
  ( (Unit!1669) )
))
(declare-fun lt!26939 () Unit!1668)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!958) Unit!1668)

(assert (=> b!18856 (= lt!26939 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!26940 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18856 (= lt!26940 (bitIndex!0 (size!562 (buf!862 thiss!1379)) (currentByte!2133 thiss!1379) (currentBit!2128 thiss!1379)))))

(declare-fun b!18857 () Bool)

(declare-fun res!16497 () Bool)

(assert (=> b!18857 (=> (not res!16497) (not e!12281))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18857 (= res!16497 (validate_offset_bits!1 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4768 res!16496) b!18857))

(assert (= (and b!18857 res!16497) b!18856))

(assert (= (and b!18856 (not res!16498)) b!18854))

(assert (= (and b!18854 (not res!16499)) b!18855))

(assert (= start!4768 b!18853))

(declare-fun m!25323 () Bool)

(assert (=> b!18856 m!25323))

(declare-fun m!25325 () Bool)

(assert (=> b!18856 m!25325))

(declare-fun m!25327 () Bool)

(assert (=> b!18856 m!25327))

(declare-fun m!25329 () Bool)

(assert (=> b!18857 m!25329))

(declare-fun m!25331 () Bool)

(assert (=> b!18853 m!25331))

(declare-fun m!25333 () Bool)

(assert (=> start!4768 m!25333))

(declare-fun m!25335 () Bool)

(assert (=> start!4768 m!25335))

(declare-fun m!25337 () Bool)

(assert (=> b!18855 m!25337))

(push 1)

(assert (not start!4768))

(assert (not b!18856))

(assert (not b!18855))

(assert (not b!18857))

(assert (not b!18853))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6272 () Bool)

(assert (=> d!6272 (= (array_inv!532 (buf!862 thiss!1379)) (bvsge (size!562 (buf!862 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!18853 d!6272))

(declare-fun d!6276 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6276 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1814 () Bool)

(assert (= bs!1814 d!6276))

(declare-fun m!25379 () Bool)

(assert (=> bs!1814 m!25379))

(assert (=> b!18857 d!6276))

(declare-fun d!6280 () Bool)

(declare-fun res!16546 () Bool)

(declare-fun e!12332 () Bool)

(assert (=> d!6280 (=> (not res!16546) (not e!12332))))

(assert (=> d!6280 (= res!16546 (= (size!562 (buf!862 thiss!1379)) (size!562 (buf!862 thiss!1379))))))

(assert (=> d!6280 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!12332)))

(declare-fun b!18909 () Bool)

(declare-fun res!16547 () Bool)

(assert (=> b!18909 (=> (not res!16547) (not e!12332))))

(assert (=> b!18909 (= res!16547 (bvsle (bitIndex!0 (size!562 (buf!862 thiss!1379)) (currentByte!2133 thiss!1379) (currentBit!2128 thiss!1379)) (bitIndex!0 (size!562 (buf!862 thiss!1379)) (currentByte!2133 thiss!1379) (currentBit!2128 thiss!1379))))))

(declare-fun b!18910 () Bool)

(declare-fun e!12333 () Bool)

(assert (=> b!18910 (= e!12332 e!12333)))

(declare-fun res!16545 () Bool)

(assert (=> b!18910 (=> res!16545 e!12333)))

(assert (=> b!18910 (= res!16545 (= (size!562 (buf!862 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!18911 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1331 array!1331 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18911 (= e!12333 (arrayBitRangesEq!0 (buf!862 thiss!1379) (buf!862 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!562 (buf!862 thiss!1379)) (currentByte!2133 thiss!1379) (currentBit!2128 thiss!1379))))))

(assert (= (and d!6280 res!16546) b!18909))

(assert (= (and b!18909 res!16547) b!18910))

(assert (= (and b!18910 (not res!16545)) b!18911))

(assert (=> b!18909 m!25327))

(assert (=> b!18909 m!25327))

(assert (=> b!18911 m!25327))

(assert (=> b!18911 m!25327))

(declare-fun m!25381 () Bool)

(assert (=> b!18911 m!25381))

(assert (=> b!18856 d!6280))

(declare-fun d!6286 () Bool)

(assert (=> d!6286 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!26983 () Unit!1668)

(declare-fun choose!11 (BitStream!958) Unit!1668)

(assert (=> d!6286 (= lt!26983 (choose!11 thiss!1379))))

(assert (=> d!6286 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!26983)))

(declare-fun bs!1818 () Bool)

(assert (= bs!1818 d!6286))

(assert (=> bs!1818 m!25323))

(declare-fun m!25383 () Bool)

(assert (=> bs!1818 m!25383))

(assert (=> b!18856 d!6286))

(declare-fun d!6288 () Bool)

(declare-fun e!12342 () Bool)

(assert (=> d!6288 e!12342))

(declare-fun res!16562 () Bool)

(assert (=> d!6288 (=> (not res!16562) (not e!12342))))

(declare-fun lt!27004 () (_ BitVec 64))

(declare-fun lt!27000 () (_ BitVec 64))

(declare-fun lt!27002 () (_ BitVec 64))

(assert (=> d!6288 (= res!16562 (= lt!27000 (bvsub lt!27002 lt!27004)))))

(assert (=> d!6288 (or (= (bvand lt!27002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27004 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27002 lt!27004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6288 (= lt!27004 (remainingBits!0 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379))))))

(declare-fun lt!27003 () (_ BitVec 64))

(declare-fun lt!26999 () (_ BitVec 64))

(assert (=> d!6288 (= lt!27002 (bvmul lt!27003 lt!26999))))

(assert (=> d!6288 (or (= lt!27003 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!26999 (bvsdiv (bvmul lt!27003 lt!26999) lt!27003)))))

(assert (=> d!6288 (= lt!26999 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6288 (= lt!27003 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))))))

(assert (=> d!6288 (= lt!27000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2133 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2128 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6288 (invariant!0 (currentBit!2128 thiss!1379) (currentByte!2133 thiss!1379) (size!562 (buf!862 thiss!1379)))))

(assert (=> d!6288 (= (bitIndex!0 (size!562 (buf!862 thiss!1379)) (currentByte!2133 thiss!1379) (currentBit!2128 thiss!1379)) lt!27000)))

(declare-fun b!18925 () Bool)

(declare-fun res!16561 () Bool)

(assert (=> b!18925 (=> (not res!16561) (not e!12342))))

(assert (=> b!18925 (= res!16561 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!27000))))

(declare-fun b!18926 () Bool)

(declare-fun lt!27001 () (_ BitVec 64))

(assert (=> b!18926 (= e!12342 (bvsle lt!27000 (bvmul lt!27001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!18926 (or (= lt!27001 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!27001 #b0000000000000000000000000000000000000000000000000000000000001000) lt!27001)))))

(assert (=> b!18926 (= lt!27001 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))))))

(assert (= (and d!6288 res!16562) b!18925))

(assert (= (and b!18925 res!16561) b!18926))

(assert (=> d!6288 m!25379))

(declare-fun m!25389 () Bool)

(assert (=> d!6288 m!25389))

(assert (=> b!18856 d!6288))

(declare-fun d!6296 () Bool)

(assert (=> d!6296 (= (array_inv!532 srcBuffer!2) (bvsge (size!562 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4768 d!6296))

(declare-fun d!6298 () Bool)

(assert (=> d!6298 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2128 thiss!1379) (currentByte!2133 thiss!1379) (size!562 (buf!862 thiss!1379))))))

(declare-fun bs!1821 () Bool)

(assert (= bs!1821 d!6298))

(assert (=> bs!1821 m!25389))

(assert (=> start!4768 d!6298))

(declare-fun d!6300 () Bool)

(assert (=> d!6300 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!562 (buf!862 thiss!1379))) ((_ sign_extend 32) (currentByte!2133 thiss!1379)) ((_ sign_extend 32) (currentBit!2128 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1822 () Bool)

(assert (= bs!1822 d!6300))

(assert (=> bs!1822 m!25379))

(assert (=> b!18855 d!6300))

(push 1)

(assert (not b!18909))

(assert (not d!6276))

(assert (not d!6298))

(assert (not d!6288))

(assert (not d!6300))

(assert (not d!6286))

(assert (not b!18911))

(check-sat)

(pop 1)

(push 1)

(check-sat)

