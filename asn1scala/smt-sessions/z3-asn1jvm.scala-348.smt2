; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8202 () Bool)

(assert start!8202)

(declare-fun b!41057 () Bool)

(declare-fun e!27152 () Bool)

(declare-fun e!27157 () Bool)

(assert (=> b!41057 (= e!27152 (not e!27157))))

(declare-fun res!34945 () Bool)

(assert (=> b!41057 (=> res!34945 e!27157)))

(declare-fun lt!62211 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41057 (= res!34945 (or (bvslt i!635 to!314) (not (= lt!62211 (bvsub (bvadd lt!62211 to!314) i!635)))))))

(declare-datatypes ((array!2050 0))(
  ( (array!2051 (arr!1425 (Array (_ BitVec 32) (_ BitVec 8))) (size!926 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1596 0))(
  ( (BitStream!1597 (buf!1254 array!2050) (currentByte!2688 (_ BitVec 32)) (currentBit!2683 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1596)

(declare-fun isPrefixOf!0 (BitStream!1596 BitStream!1596) Bool)

(assert (=> b!41057 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2897 0))(
  ( (Unit!2898) )
))
(declare-fun lt!62210 () Unit!2897)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1596) Unit!2897)

(assert (=> b!41057 (= lt!62210 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41057 (= lt!62211 (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)))))

(declare-fun b!41058 () Bool)

(declare-fun res!34946 () Bool)

(assert (=> b!41058 (=> res!34946 e!27157)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41058 (= res!34946 (not (invariant!0 (currentBit!2683 thiss!1379) (currentByte!2688 thiss!1379) (size!926 (buf!1254 thiss!1379)))))))

(declare-fun res!34944 () Bool)

(assert (=> start!8202 (=> (not res!34944) (not e!27152))))

(declare-fun srcBuffer!2 () array!2050)

(assert (=> start!8202 (= res!34944 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!926 srcBuffer!2))))))))

(assert (=> start!8202 e!27152))

(assert (=> start!8202 true))

(declare-fun array_inv!851 (array!2050) Bool)

(assert (=> start!8202 (array_inv!851 srcBuffer!2)))

(declare-fun e!27154 () Bool)

(declare-fun inv!12 (BitStream!1596) Bool)

(assert (=> start!8202 (and (inv!12 thiss!1379) e!27154)))

(declare-fun b!41059 () Bool)

(assert (=> b!41059 (= e!27154 (array_inv!851 (buf!1254 thiss!1379)))))

(declare-fun b!41060 () Bool)

(declare-fun res!34943 () Bool)

(assert (=> b!41060 (=> (not res!34943) (not e!27152))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41060 (= res!34943 (validate_offset_bits!1 ((_ sign_extend 32) (size!926 (buf!1254 thiss!1379))) ((_ sign_extend 32) (currentByte!2688 thiss!1379)) ((_ sign_extend 32) (currentBit!2683 thiss!1379)) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!3930 0))(
  ( (tuple2!3931 (_1!2052 BitStream!1596) (_2!2052 BitStream!1596)) )
))
(declare-fun lt!62212 () tuple2!3930)

(declare-fun e!27155 () Bool)

(declare-fun b!41061 () Bool)

(assert (=> b!41061 (= e!27155 (validate_offset_bits!1 ((_ sign_extend 32) (size!926 (buf!1254 (_1!2052 lt!62212)))) ((_ sign_extend 32) (currentByte!2688 (_1!2052 lt!62212))) ((_ sign_extend 32) (currentBit!2683 (_1!2052 lt!62212))) (bvsub to!314 i!635)))))

(declare-fun b!41062 () Bool)

(assert (=> b!41062 (= e!27157 e!27155)))

(declare-fun res!34947 () Bool)

(assert (=> b!41062 (=> res!34947 e!27155)))

(assert (=> b!41062 (= res!34947 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun reader!0 (BitStream!1596 BitStream!1596) tuple2!3930)

(assert (=> b!41062 (= lt!62212 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!8202 res!34944) b!41060))

(assert (= (and b!41060 res!34943) b!41057))

(assert (= (and b!41057 (not res!34945)) b!41058))

(assert (= (and b!41058 (not res!34946)) b!41062))

(assert (= (and b!41062 (not res!34947)) b!41061))

(assert (= start!8202 b!41059))

(declare-fun m!62703 () Bool)

(assert (=> b!41057 m!62703))

(declare-fun m!62705 () Bool)

(assert (=> b!41057 m!62705))

(declare-fun m!62707 () Bool)

(assert (=> b!41057 m!62707))

(declare-fun m!62709 () Bool)

(assert (=> b!41061 m!62709))

(declare-fun m!62711 () Bool)

(assert (=> b!41058 m!62711))

(declare-fun m!62713 () Bool)

(assert (=> start!8202 m!62713))

(declare-fun m!62715 () Bool)

(assert (=> start!8202 m!62715))

(declare-fun m!62717 () Bool)

(assert (=> b!41062 m!62717))

(declare-fun m!62719 () Bool)

(assert (=> b!41059 m!62719))

(declare-fun m!62721 () Bool)

(assert (=> b!41060 m!62721))

(check-sat (not b!41057) (not b!41058) (not b!41061) (not b!41060) (not start!8202) (not b!41059) (not b!41062))
(check-sat)
(get-model)

(declare-fun d!12036 () Bool)

(assert (=> d!12036 (= (array_inv!851 srcBuffer!2) (bvsge (size!926 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8202 d!12036))

(declare-fun d!12038 () Bool)

(assert (=> d!12038 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2683 thiss!1379) (currentByte!2688 thiss!1379) (size!926 (buf!1254 thiss!1379))))))

(declare-fun bs!3208 () Bool)

(assert (= bs!3208 d!12038))

(assert (=> bs!3208 m!62711))

(assert (=> start!8202 d!12038))

(declare-fun d!12040 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!926 (buf!1254 (_1!2052 lt!62212)))) ((_ sign_extend 32) (currentByte!2688 (_1!2052 lt!62212))) ((_ sign_extend 32) (currentBit!2683 (_1!2052 lt!62212))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!926 (buf!1254 (_1!2052 lt!62212)))) ((_ sign_extend 32) (currentByte!2688 (_1!2052 lt!62212))) ((_ sign_extend 32) (currentBit!2683 (_1!2052 lt!62212)))) (bvsub to!314 i!635)))))

(declare-fun bs!3209 () Bool)

(assert (= bs!3209 d!12040))

(declare-fun m!62743 () Bool)

(assert (=> bs!3209 m!62743))

(assert (=> b!41061 d!12040))

(declare-fun b!41147 () Bool)

(declare-fun e!27210 () Unit!2897)

(declare-fun Unit!2903 () Unit!2897)

(assert (=> b!41147 (= e!27210 Unit!2903)))

(declare-fun b!41148 () Bool)

(declare-fun res!35013 () Bool)

(declare-fun e!27209 () Bool)

(assert (=> b!41148 (=> (not res!35013) (not e!27209))))

(declare-fun lt!62433 () tuple2!3930)

(assert (=> b!41148 (= res!35013 (isPrefixOf!0 (_2!2052 lt!62433) thiss!1379))))

(declare-fun lt!62430 () (_ BitVec 64))

(declare-fun lt!62426 () (_ BitVec 64))

(declare-fun b!41149 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1596 (_ BitVec 64)) BitStream!1596)

(assert (=> b!41149 (= e!27209 (= (_1!2052 lt!62433) (withMovedBitIndex!0 (_2!2052 lt!62433) (bvsub lt!62426 lt!62430))))))

(assert (=> b!41149 (or (= (bvand lt!62426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62430 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62426 lt!62430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41149 (= lt!62430 (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)))))

(assert (=> b!41149 (= lt!62426 (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)))))

(declare-fun b!41150 () Bool)

(declare-fun res!35014 () Bool)

(assert (=> b!41150 (=> (not res!35014) (not e!27209))))

(assert (=> b!41150 (= res!35014 (isPrefixOf!0 (_1!2052 lt!62433) thiss!1379))))

(declare-fun b!41151 () Bool)

(declare-fun lt!62421 () Unit!2897)

(assert (=> b!41151 (= e!27210 lt!62421)))

(declare-fun lt!62422 () (_ BitVec 64))

(assert (=> b!41151 (= lt!62422 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!62435 () (_ BitVec 64))

(assert (=> b!41151 (= lt!62435 (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2050 array!2050 (_ BitVec 64) (_ BitVec 64)) Unit!2897)

(assert (=> b!41151 (= lt!62421 (arrayBitRangesEqSymmetric!0 (buf!1254 thiss!1379) (buf!1254 thiss!1379) lt!62422 lt!62435))))

(declare-fun arrayBitRangesEq!0 (array!2050 array!2050 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41151 (arrayBitRangesEq!0 (buf!1254 thiss!1379) (buf!1254 thiss!1379) lt!62422 lt!62435)))

(declare-fun d!12042 () Bool)

(assert (=> d!12042 e!27209))

(declare-fun res!35015 () Bool)

(assert (=> d!12042 (=> (not res!35015) (not e!27209))))

(assert (=> d!12042 (= res!35015 (isPrefixOf!0 (_1!2052 lt!62433) (_2!2052 lt!62433)))))

(declare-fun lt!62431 () BitStream!1596)

(assert (=> d!12042 (= lt!62433 (tuple2!3931 lt!62431 thiss!1379))))

(declare-fun lt!62419 () Unit!2897)

(declare-fun lt!62424 () Unit!2897)

(assert (=> d!12042 (= lt!62419 lt!62424)))

(assert (=> d!12042 (isPrefixOf!0 lt!62431 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1596 BitStream!1596 BitStream!1596) Unit!2897)

(assert (=> d!12042 (= lt!62424 (lemmaIsPrefixTransitive!0 lt!62431 thiss!1379 thiss!1379))))

(declare-fun lt!62420 () Unit!2897)

(declare-fun lt!62429 () Unit!2897)

(assert (=> d!12042 (= lt!62420 lt!62429)))

(assert (=> d!12042 (isPrefixOf!0 lt!62431 thiss!1379)))

(assert (=> d!12042 (= lt!62429 (lemmaIsPrefixTransitive!0 lt!62431 thiss!1379 thiss!1379))))

(declare-fun lt!62416 () Unit!2897)

(assert (=> d!12042 (= lt!62416 e!27210)))

(declare-fun c!2760 () Bool)

(assert (=> d!12042 (= c!2760 (not (= (size!926 (buf!1254 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!62428 () Unit!2897)

(declare-fun lt!62434 () Unit!2897)

(assert (=> d!12042 (= lt!62428 lt!62434)))

(assert (=> d!12042 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12042 (= lt!62434 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62427 () Unit!2897)

(declare-fun lt!62418 () Unit!2897)

(assert (=> d!12042 (= lt!62427 lt!62418)))

(assert (=> d!12042 (= lt!62418 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62417 () Unit!2897)

(declare-fun lt!62425 () Unit!2897)

(assert (=> d!12042 (= lt!62417 lt!62425)))

(assert (=> d!12042 (isPrefixOf!0 lt!62431 lt!62431)))

(assert (=> d!12042 (= lt!62425 (lemmaIsPrefixRefl!0 lt!62431))))

(declare-fun lt!62432 () Unit!2897)

(declare-fun lt!62423 () Unit!2897)

(assert (=> d!12042 (= lt!62432 lt!62423)))

(assert (=> d!12042 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12042 (= lt!62423 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12042 (= lt!62431 (BitStream!1597 (buf!1254 thiss!1379) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)))))

(assert (=> d!12042 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12042 (= (reader!0 thiss!1379 thiss!1379) lt!62433)))

(assert (= (and d!12042 c!2760) b!41151))

(assert (= (and d!12042 (not c!2760)) b!41147))

(assert (= (and d!12042 res!35015) b!41150))

(assert (= (and b!41150 res!35014) b!41148))

(assert (= (and b!41148 res!35013) b!41149))

(declare-fun m!62799 () Bool)

(assert (=> b!41150 m!62799))

(declare-fun m!62801 () Bool)

(assert (=> b!41149 m!62801))

(assert (=> b!41149 m!62707))

(assert (=> b!41149 m!62707))

(declare-fun m!62803 () Bool)

(assert (=> b!41148 m!62803))

(assert (=> d!12042 m!62703))

(assert (=> d!12042 m!62703))

(declare-fun m!62805 () Bool)

(assert (=> d!12042 m!62805))

(assert (=> d!12042 m!62705))

(declare-fun m!62807 () Bool)

(assert (=> d!12042 m!62807))

(declare-fun m!62809 () Bool)

(assert (=> d!12042 m!62809))

(declare-fun m!62811 () Bool)

(assert (=> d!12042 m!62811))

(assert (=> d!12042 m!62705))

(declare-fun m!62813 () Bool)

(assert (=> d!12042 m!62813))

(assert (=> d!12042 m!62805))

(assert (=> d!12042 m!62703))

(assert (=> b!41151 m!62707))

(declare-fun m!62815 () Bool)

(assert (=> b!41151 m!62815))

(declare-fun m!62817 () Bool)

(assert (=> b!41151 m!62817))

(assert (=> b!41062 d!12042))

(declare-fun d!12076 () Bool)

(declare-fun res!35028 () Bool)

(declare-fun e!27216 () Bool)

(assert (=> d!12076 (=> (not res!35028) (not e!27216))))

(assert (=> d!12076 (= res!35028 (= (size!926 (buf!1254 thiss!1379)) (size!926 (buf!1254 thiss!1379))))))

(assert (=> d!12076 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27216)))

(declare-fun b!41162 () Bool)

(declare-fun res!35027 () Bool)

(assert (=> b!41162 (=> (not res!35027) (not e!27216))))

(assert (=> b!41162 (= res!35027 (bvsle (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)) (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379))))))

(declare-fun b!41163 () Bool)

(declare-fun e!27217 () Bool)

(assert (=> b!41163 (= e!27216 e!27217)))

(declare-fun res!35026 () Bool)

(assert (=> b!41163 (=> res!35026 e!27217)))

(assert (=> b!41163 (= res!35026 (= (size!926 (buf!1254 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!41164 () Bool)

(assert (=> b!41164 (= e!27217 (arrayBitRangesEq!0 (buf!1254 thiss!1379) (buf!1254 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379))))))

(assert (= (and d!12076 res!35028) b!41162))

(assert (= (and b!41162 res!35027) b!41163))

(assert (= (and b!41163 (not res!35026)) b!41164))

(assert (=> b!41162 m!62707))

(assert (=> b!41162 m!62707))

(assert (=> b!41164 m!62707))

(assert (=> b!41164 m!62707))

(declare-fun m!62821 () Bool)

(assert (=> b!41164 m!62821))

(assert (=> b!41057 d!12076))

(declare-fun d!12082 () Bool)

(assert (=> d!12082 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62446 () Unit!2897)

(declare-fun choose!11 (BitStream!1596) Unit!2897)

(assert (=> d!12082 (= lt!62446 (choose!11 thiss!1379))))

(assert (=> d!12082 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62446)))

(declare-fun bs!3221 () Bool)

(assert (= bs!3221 d!12082))

(assert (=> bs!3221 m!62703))

(declare-fun m!62823 () Bool)

(assert (=> bs!3221 m!62823))

(assert (=> b!41057 d!12082))

(declare-fun d!12084 () Bool)

(declare-fun e!27220 () Bool)

(assert (=> d!12084 e!27220))

(declare-fun res!35033 () Bool)

(assert (=> d!12084 (=> (not res!35033) (not e!27220))))

(declare-fun lt!62464 () (_ BitVec 64))

(declare-fun lt!62461 () (_ BitVec 64))

(declare-fun lt!62459 () (_ BitVec 64))

(assert (=> d!12084 (= res!35033 (= lt!62461 (bvsub lt!62464 lt!62459)))))

(assert (=> d!12084 (or (= (bvand lt!62464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62464 lt!62459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12084 (= lt!62459 (remainingBits!0 ((_ sign_extend 32) (size!926 (buf!1254 thiss!1379))) ((_ sign_extend 32) (currentByte!2688 thiss!1379)) ((_ sign_extend 32) (currentBit!2683 thiss!1379))))))

(declare-fun lt!62460 () (_ BitVec 64))

(declare-fun lt!62462 () (_ BitVec 64))

(assert (=> d!12084 (= lt!62464 (bvmul lt!62460 lt!62462))))

(assert (=> d!12084 (or (= lt!62460 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62462 (bvsdiv (bvmul lt!62460 lt!62462) lt!62460)))))

(assert (=> d!12084 (= lt!62462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12084 (= lt!62460 ((_ sign_extend 32) (size!926 (buf!1254 thiss!1379))))))

(assert (=> d!12084 (= lt!62461 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2688 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2683 thiss!1379))))))

(assert (=> d!12084 (invariant!0 (currentBit!2683 thiss!1379) (currentByte!2688 thiss!1379) (size!926 (buf!1254 thiss!1379)))))

(assert (=> d!12084 (= (bitIndex!0 (size!926 (buf!1254 thiss!1379)) (currentByte!2688 thiss!1379) (currentBit!2683 thiss!1379)) lt!62461)))

(declare-fun b!41169 () Bool)

(declare-fun res!35034 () Bool)

(assert (=> b!41169 (=> (not res!35034) (not e!27220))))

(assert (=> b!41169 (= res!35034 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62461))))

(declare-fun b!41170 () Bool)

(declare-fun lt!62463 () (_ BitVec 64))

(assert (=> b!41170 (= e!27220 (bvsle lt!62461 (bvmul lt!62463 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!41170 (or (= lt!62463 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62463 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62463)))))

(assert (=> b!41170 (= lt!62463 ((_ sign_extend 32) (size!926 (buf!1254 thiss!1379))))))

(assert (= (and d!12084 res!35033) b!41169))

(assert (= (and b!41169 res!35034) b!41170))

(declare-fun m!62825 () Bool)

(assert (=> d!12084 m!62825))

(assert (=> d!12084 m!62711))

(assert (=> b!41057 d!12084))

(declare-fun d!12086 () Bool)

(assert (=> d!12086 (= (invariant!0 (currentBit!2683 thiss!1379) (currentByte!2688 thiss!1379) (size!926 (buf!1254 thiss!1379))) (and (bvsge (currentBit!2683 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2683 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2688 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2688 thiss!1379) (size!926 (buf!1254 thiss!1379))) (and (= (currentBit!2683 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2688 thiss!1379) (size!926 (buf!1254 thiss!1379)))))))))

(assert (=> b!41058 d!12086))

(declare-fun d!12088 () Bool)

(assert (=> d!12088 (= (array_inv!851 (buf!1254 thiss!1379)) (bvsge (size!926 (buf!1254 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!41059 d!12088))

(declare-fun d!12090 () Bool)

(assert (=> d!12090 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!926 (buf!1254 thiss!1379))) ((_ sign_extend 32) (currentByte!2688 thiss!1379)) ((_ sign_extend 32) (currentBit!2683 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!926 (buf!1254 thiss!1379))) ((_ sign_extend 32) (currentByte!2688 thiss!1379)) ((_ sign_extend 32) (currentBit!2683 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3222 () Bool)

(assert (= bs!3222 d!12090))

(assert (=> bs!3222 m!62825))

(assert (=> b!41060 d!12090))

(check-sat (not d!12038) (not b!41151) (not d!12042) (not b!41148) (not d!12090) (not b!41149) (not b!41164) (not d!12082) (not b!41162) (not b!41150) (not d!12040) (not d!12084))
(check-sat)
