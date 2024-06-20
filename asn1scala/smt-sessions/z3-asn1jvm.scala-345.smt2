; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8142 () Bool)

(assert start!8142)

(declare-fun b!40895 () Bool)

(declare-fun e!26998 () Bool)

(declare-fun e!26994 () Bool)

(assert (=> b!40895 (= e!26998 (not e!26994))))

(declare-fun res!34809 () Bool)

(assert (=> b!40895 (=> res!34809 e!26994)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!40895 (= res!34809 (bvslt i!635 to!314))))

(declare-datatypes ((array!2029 0))(
  ( (array!2030 (arr!1416 (Array (_ BitVec 32) (_ BitVec 8))) (size!917 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1578 0))(
  ( (BitStream!1579 (buf!1245 array!2029) (currentByte!2670 (_ BitVec 32)) (currentBit!2665 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1578)

(declare-fun isPrefixOf!0 (BitStream!1578 BitStream!1578) Bool)

(assert (=> b!40895 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2879 0))(
  ( (Unit!2880) )
))
(declare-fun lt!62079 () Unit!2879)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1578) Unit!2879)

(assert (=> b!40895 (= lt!62079 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62080 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40895 (= lt!62080 (bitIndex!0 (size!917 (buf!1245 thiss!1379)) (currentByte!2670 thiss!1379) (currentBit!2665 thiss!1379)))))

(declare-fun b!40897 () Bool)

(declare-fun e!26995 () Bool)

(declare-fun array_inv!842 (array!2029) Bool)

(assert (=> b!40897 (= e!26995 (array_inv!842 (buf!1245 thiss!1379)))))

(declare-fun res!34808 () Bool)

(assert (=> start!8142 (=> (not res!34808) (not e!26998))))

(declare-fun srcBuffer!2 () array!2029)

(assert (=> start!8142 (= res!34808 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!917 srcBuffer!2))))))))

(assert (=> start!8142 e!26998))

(assert (=> start!8142 true))

(assert (=> start!8142 (array_inv!842 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1578) Bool)

(assert (=> start!8142 (and (inv!12 thiss!1379) e!26995)))

(declare-fun b!40896 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40896 (= e!26994 (invariant!0 (currentBit!2665 thiss!1379) (currentByte!2670 thiss!1379) (size!917 (buf!1245 thiss!1379))))))

(declare-fun b!40894 () Bool)

(declare-fun res!34807 () Bool)

(assert (=> b!40894 (=> (not res!34807) (not e!26998))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40894 (= res!34807 (validate_offset_bits!1 ((_ sign_extend 32) (size!917 (buf!1245 thiss!1379))) ((_ sign_extend 32) (currentByte!2670 thiss!1379)) ((_ sign_extend 32) (currentBit!2665 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8142 res!34808) b!40894))

(assert (= (and b!40894 res!34807) b!40895))

(assert (= (and b!40895 (not res!34809)) b!40896))

(assert (= start!8142 b!40897))

(declare-fun m!62537 () Bool)

(assert (=> b!40897 m!62537))

(declare-fun m!62539 () Bool)

(assert (=> start!8142 m!62539))

(declare-fun m!62541 () Bool)

(assert (=> start!8142 m!62541))

(declare-fun m!62543 () Bool)

(assert (=> b!40894 m!62543))

(declare-fun m!62545 () Bool)

(assert (=> b!40896 m!62545))

(declare-fun m!62547 () Bool)

(assert (=> b!40895 m!62547))

(declare-fun m!62549 () Bool)

(assert (=> b!40895 m!62549))

(declare-fun m!62551 () Bool)

(assert (=> b!40895 m!62551))

(check-sat (not b!40895) (not start!8142) (not b!40896) (not b!40897) (not b!40894))
(check-sat)
(get-model)

(declare-fun d!11980 () Bool)

(assert (=> d!11980 (= (array_inv!842 srcBuffer!2) (bvsge (size!917 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8142 d!11980))

(declare-fun d!11982 () Bool)

(assert (=> d!11982 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2665 thiss!1379) (currentByte!2670 thiss!1379) (size!917 (buf!1245 thiss!1379))))))

(declare-fun bs!3187 () Bool)

(assert (= bs!3187 d!11982))

(assert (=> bs!3187 m!62545))

(assert (=> start!8142 d!11982))

(declare-fun d!11986 () Bool)

(assert (=> d!11986 (= (array_inv!842 (buf!1245 thiss!1379)) (bvsge (size!917 (buf!1245 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!40897 d!11986))

(declare-fun d!11988 () Bool)

(declare-fun res!34844 () Bool)

(declare-fun e!27030 () Bool)

(assert (=> d!11988 (=> (not res!34844) (not e!27030))))

(assert (=> d!11988 (= res!34844 (= (size!917 (buf!1245 thiss!1379)) (size!917 (buf!1245 thiss!1379))))))

(assert (=> d!11988 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27030)))

(declare-fun b!40934 () Bool)

(declare-fun res!34843 () Bool)

(assert (=> b!40934 (=> (not res!34843) (not e!27030))))

(assert (=> b!40934 (= res!34843 (bvsle (bitIndex!0 (size!917 (buf!1245 thiss!1379)) (currentByte!2670 thiss!1379) (currentBit!2665 thiss!1379)) (bitIndex!0 (size!917 (buf!1245 thiss!1379)) (currentByte!2670 thiss!1379) (currentBit!2665 thiss!1379))))))

(declare-fun b!40935 () Bool)

(declare-fun e!27031 () Bool)

(assert (=> b!40935 (= e!27030 e!27031)))

(declare-fun res!34845 () Bool)

(assert (=> b!40935 (=> res!34845 e!27031)))

(assert (=> b!40935 (= res!34845 (= (size!917 (buf!1245 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!40936 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2029 array!2029 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40936 (= e!27031 (arrayBitRangesEq!0 (buf!1245 thiss!1379) (buf!1245 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!917 (buf!1245 thiss!1379)) (currentByte!2670 thiss!1379) (currentBit!2665 thiss!1379))))))

(assert (= (and d!11988 res!34844) b!40934))

(assert (= (and b!40934 res!34843) b!40935))

(assert (= (and b!40935 (not res!34845)) b!40936))

(assert (=> b!40934 m!62551))

(assert (=> b!40934 m!62551))

(assert (=> b!40936 m!62551))

(assert (=> b!40936 m!62551))

(declare-fun m!62579 () Bool)

(assert (=> b!40936 m!62579))

(assert (=> b!40895 d!11988))

(declare-fun d!12000 () Bool)

(assert (=> d!12000 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62095 () Unit!2879)

(declare-fun choose!11 (BitStream!1578) Unit!2879)

(assert (=> d!12000 (= lt!62095 (choose!11 thiss!1379))))

(assert (=> d!12000 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62095)))

(declare-fun bs!3194 () Bool)

(assert (= bs!3194 d!12000))

(assert (=> bs!3194 m!62547))

(declare-fun m!62581 () Bool)

(assert (=> bs!3194 m!62581))

(assert (=> b!40895 d!12000))

(declare-fun d!12002 () Bool)

(declare-fun e!27040 () Bool)

(assert (=> d!12002 e!27040))

(declare-fun res!34862 () Bool)

(assert (=> d!12002 (=> (not res!34862) (not e!27040))))

(declare-fun lt!62146 () (_ BitVec 64))

(declare-fun lt!62145 () (_ BitVec 64))

(declare-fun lt!62147 () (_ BitVec 64))

(assert (=> d!12002 (= res!34862 (= lt!62147 (bvsub lt!62146 lt!62145)))))

(assert (=> d!12002 (or (= (bvand lt!62146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62146 lt!62145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12002 (= lt!62145 (remainingBits!0 ((_ sign_extend 32) (size!917 (buf!1245 thiss!1379))) ((_ sign_extend 32) (currentByte!2670 thiss!1379)) ((_ sign_extend 32) (currentBit!2665 thiss!1379))))))

(declare-fun lt!62148 () (_ BitVec 64))

(declare-fun lt!62149 () (_ BitVec 64))

(assert (=> d!12002 (= lt!62146 (bvmul lt!62148 lt!62149))))

(assert (=> d!12002 (or (= lt!62148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62149 (bvsdiv (bvmul lt!62148 lt!62149) lt!62148)))))

(assert (=> d!12002 (= lt!62149 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12002 (= lt!62148 ((_ sign_extend 32) (size!917 (buf!1245 thiss!1379))))))

(assert (=> d!12002 (= lt!62147 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2670 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2665 thiss!1379))))))

(assert (=> d!12002 (invariant!0 (currentBit!2665 thiss!1379) (currentByte!2670 thiss!1379) (size!917 (buf!1245 thiss!1379)))))

(assert (=> d!12002 (= (bitIndex!0 (size!917 (buf!1245 thiss!1379)) (currentByte!2670 thiss!1379) (currentBit!2665 thiss!1379)) lt!62147)))

(declare-fun b!40953 () Bool)

(declare-fun res!34863 () Bool)

(assert (=> b!40953 (=> (not res!34863) (not e!27040))))

(assert (=> b!40953 (= res!34863 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62147))))

(declare-fun b!40954 () Bool)

(declare-fun lt!62144 () (_ BitVec 64))

(assert (=> b!40954 (= e!27040 (bvsle lt!62147 (bvmul lt!62144 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!40954 (or (= lt!62144 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62144 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62144)))))

(assert (=> b!40954 (= lt!62144 ((_ sign_extend 32) (size!917 (buf!1245 thiss!1379))))))

(assert (= (and d!12002 res!34862) b!40953))

(assert (= (and b!40953 res!34863) b!40954))

(declare-fun m!62585 () Bool)

(assert (=> d!12002 m!62585))

(assert (=> d!12002 m!62545))

(assert (=> b!40895 d!12002))

(declare-fun d!12022 () Bool)

(assert (=> d!12022 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!917 (buf!1245 thiss!1379))) ((_ sign_extend 32) (currentByte!2670 thiss!1379)) ((_ sign_extend 32) (currentBit!2665 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!917 (buf!1245 thiss!1379))) ((_ sign_extend 32) (currentByte!2670 thiss!1379)) ((_ sign_extend 32) (currentBit!2665 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3198 () Bool)

