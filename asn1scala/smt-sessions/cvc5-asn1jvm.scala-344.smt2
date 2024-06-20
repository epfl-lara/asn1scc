; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8096 () Bool)

(assert start!8096)

(declare-fun b!40803 () Bool)

(declare-fun e!26907 () Bool)

(declare-datatypes ((array!2018 0))(
  ( (array!2019 (arr!1412 (Array (_ BitVec 32) (_ BitVec 8))) (size!913 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1570 0))(
  ( (BitStream!1571 (buf!1241 array!2018) (currentByte!2659 (_ BitVec 32)) (currentBit!2654 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1570)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40803 (= e!26907 (invariant!0 (currentBit!2654 thiss!1379) (currentByte!2659 thiss!1379) (size!913 (buf!1241 thiss!1379))))))

(declare-fun b!40802 () Bool)

(declare-fun e!26911 () Bool)

(assert (=> b!40802 (= e!26911 (not e!26907))))

(declare-fun res!34726 () Bool)

(assert (=> b!40802 (=> res!34726 e!26907)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!40802 (= res!34726 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1570 BitStream!1570) Bool)

(assert (=> b!40802 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2871 0))(
  ( (Unit!2872) )
))
(declare-fun lt!61993 () Unit!2871)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1570) Unit!2871)

(assert (=> b!40802 (= lt!61993 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!61992 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40802 (= lt!61992 (bitIndex!0 (size!913 (buf!1241 thiss!1379)) (currentByte!2659 thiss!1379) (currentBit!2654 thiss!1379)))))

(declare-fun b!40804 () Bool)

(declare-fun e!26908 () Bool)

(declare-fun array_inv!838 (array!2018) Bool)

(assert (=> b!40804 (= e!26908 (array_inv!838 (buf!1241 thiss!1379)))))

(declare-fun res!34727 () Bool)

(assert (=> start!8096 (=> (not res!34727) (not e!26911))))

(declare-fun srcBuffer!2 () array!2018)

(assert (=> start!8096 (= res!34727 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!913 srcBuffer!2))))))))

(assert (=> start!8096 e!26911))

(assert (=> start!8096 true))

(assert (=> start!8096 (array_inv!838 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1570) Bool)

(assert (=> start!8096 (and (inv!12 thiss!1379) e!26908)))

(declare-fun b!40801 () Bool)

(declare-fun res!34728 () Bool)

(assert (=> b!40801 (=> (not res!34728) (not e!26911))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40801 (= res!34728 (validate_offset_bits!1 ((_ sign_extend 32) (size!913 (buf!1241 thiss!1379))) ((_ sign_extend 32) (currentByte!2659 thiss!1379)) ((_ sign_extend 32) (currentBit!2654 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8096 res!34727) b!40801))

(assert (= (and b!40801 res!34728) b!40802))

(assert (= (and b!40802 (not res!34726)) b!40803))

(assert (= start!8096 b!40804))

(declare-fun m!62457 () Bool)

(assert (=> start!8096 m!62457))

(declare-fun m!62459 () Bool)

(assert (=> start!8096 m!62459))

(declare-fun m!62461 () Bool)

(assert (=> b!40804 m!62461))

(declare-fun m!62463 () Bool)

(assert (=> b!40802 m!62463))

(declare-fun m!62465 () Bool)

(assert (=> b!40802 m!62465))

(declare-fun m!62467 () Bool)

(assert (=> b!40802 m!62467))

(declare-fun m!62469 () Bool)

(assert (=> b!40803 m!62469))

(declare-fun m!62471 () Bool)

(assert (=> b!40801 m!62471))

(push 1)

(assert (not b!40804))

(assert (not b!40801))

(assert (not b!40803))

(assert (not b!40802))

(assert (not start!8096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11936 () Bool)

(assert (=> d!11936 (= (array_inv!838 srcBuffer!2) (bvsge (size!913 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8096 d!11936))

(declare-fun d!11940 () Bool)

(assert (=> d!11940 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2654 thiss!1379) (currentByte!2659 thiss!1379) (size!913 (buf!1241 thiss!1379))))))

(declare-fun bs!3175 () Bool)

(assert (= bs!3175 d!11940))

(assert (=> bs!3175 m!62469))

(assert (=> start!8096 d!11940))

(declare-fun d!11942 () Bool)

(assert (=> d!11942 (= (array_inv!838 (buf!1241 thiss!1379)) (bvsge (size!913 (buf!1241 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!40804 d!11942))

(declare-fun d!11944 () Bool)

(declare-fun res!34762 () Bool)

(declare-fun e!26952 () Bool)

(assert (=> d!11944 (=> (not res!34762) (not e!26952))))

(assert (=> d!11944 (= res!34762 (= (size!913 (buf!1241 thiss!1379)) (size!913 (buf!1241 thiss!1379))))))

(assert (=> d!11944 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!26952)))

(declare-fun b!40844 () Bool)

(declare-fun res!34763 () Bool)

(assert (=> b!40844 (=> (not res!34763) (not e!26952))))

(assert (=> b!40844 (= res!34763 (bvsle (bitIndex!0 (size!913 (buf!1241 thiss!1379)) (currentByte!2659 thiss!1379) (currentBit!2654 thiss!1379)) (bitIndex!0 (size!913 (buf!1241 thiss!1379)) (currentByte!2659 thiss!1379) (currentBit!2654 thiss!1379))))))

(declare-fun b!40845 () Bool)

(declare-fun e!26953 () Bool)

(assert (=> b!40845 (= e!26952 e!26953)))

(declare-fun res!34764 () Bool)

(assert (=> b!40845 (=> res!34764 e!26953)))

(assert (=> b!40845 (= res!34764 (= (size!913 (buf!1241 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!40846 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2018 array!2018 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40846 (= e!26953 (arrayBitRangesEq!0 (buf!1241 thiss!1379) (buf!1241 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!913 (buf!1241 thiss!1379)) (currentByte!2659 thiss!1379) (currentBit!2654 thiss!1379))))))

(assert (= (and d!11944 res!34762) b!40844))

(assert (= (and b!40844 res!34763) b!40845))

(assert (= (and b!40845 (not res!34764)) b!40846))

(assert (=> b!40844 m!62467))

(assert (=> b!40844 m!62467))

(assert (=> b!40846 m!62467))

(assert (=> b!40846 m!62467))

(declare-fun m!62509 () Bool)

(assert (=> b!40846 m!62509))

(assert (=> b!40802 d!11944))

(declare-fun d!11946 () Bool)

(assert (=> d!11946 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62013 () Unit!2871)

(declare-fun choose!11 (BitStream!1570) Unit!2871)

(assert (=> d!11946 (= lt!62013 (choose!11 thiss!1379))))

(assert (=> d!11946 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62013)))

(declare-fun bs!3177 () Bool)

(assert (= bs!3177 d!11946))

(assert (=> bs!3177 m!62463))

(declare-fun m!62511 () Bool)

(assert (=> bs!3177 m!62511))

(assert (=> b!40802 d!11946))

(declare-fun d!11948 () Bool)

(declare-fun e!26959 () Bool)

(assert (=> d!11948 e!26959))

(declare-fun res!34775 () Bool)

(assert (=> d!11948 (=> (not res!34775) (not e!26959))))

(declare-fun lt!62047 () (_ BitVec 64))

(declare-fun lt!62044 () (_ BitVec 64))

(declare-fun lt!62042 () (_ BitVec 64))

(assert (=> d!11948 (= res!34775 (= lt!62044 (bvsub lt!62042 lt!62047)))))

(assert (=> d!11948 (or (= (bvand lt!62042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62042 lt!62047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11948 (= lt!62047 (remainingBits!0 ((_ sign_extend 32) (size!913 (buf!1241 thiss!1379))) ((_ sign_extend 32) (currentByte!2659 thiss!1379)) ((_ sign_extend 32) (currentBit!2654 thiss!1379))))))

(declare-fun lt!62046 () (_ BitVec 64))

(declare-fun lt!62045 () (_ BitVec 64))

(assert (=> d!11948 (= lt!62042 (bvmul lt!62046 lt!62045))))

(assert (=> d!11948 (or (= lt!62046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62045 (bvsdiv (bvmul lt!62046 lt!62045) lt!62046)))))

(assert (=> d!11948 (= lt!62045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11948 (= lt!62046 ((_ sign_extend 32) (size!913 (buf!1241 thiss!1379))))))

(assert (=> d!11948 (= lt!62044 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2659 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2654 thiss!1379))))))

(assert (=> d!11948 (invariant!0 (currentBit!2654 thiss!1379) (currentByte!2659 thiss!1379) (size!913 (buf!1241 thiss!1379)))))

(assert (=> d!11948 (= (bitIndex!0 (size!913 (buf!1241 thiss!1379)) (currentByte!2659 thiss!1379) (currentBit!2654 thiss!1379)) lt!62044)))

(declare-fun b!40857 () Bool)

(declare-fun res!34776 () Bool)

(assert (=> b!40857 (=> (not res!34776) (not e!26959))))

(assert (=> b!40857 (= res!34776 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62044))))

(declare-fun b!40858 () Bool)

(declare-fun lt!62043 () (_ BitVec 64))

(assert (=> b!40858 (= e!26959 (bvsle lt!62044 (bvmul lt!62043 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!40858 (or (= lt!62043 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62043 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62043)))))

(assert (=> b!40858 (= lt!62043 ((_ sign_extend 32) (size!913 (buf!1241 thiss!1379))))))

(assert (= (and d!11948 res!34775) b!40857))

(assert (= (and b!40857 res!34776) b!40858))

(declare-fun m!62515 () Bool)

(assert (=> d!11948 m!62515))

(assert (=> d!11948 m!62469))

(assert (=> b!40802 d!11948))

(declare-fun d!11962 () Bool)

(assert (=> d!11962 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!913 (buf!1241 thiss!1379))) ((_ sign_extend 32) (currentByte!2659 thiss!1379)) ((_ sign_extend 32) (currentBit!2654 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!913 (buf!1241 thiss!1379))) ((_ sign_extend 32) (currentByte!2659 thiss!1379)) ((_ sign_extend 32) (currentBit!2654 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3180 () Bool)

(assert (= bs!3180 d!11962))

(assert (=> bs!3180 m!62515))

(assert (=> b!40801 d!11962))

(declare-fun d!11964 () Bool)

(assert (=> d!11964 (= (invariant!0 (currentBit!2654 thiss!1379) (currentByte!2659 thiss!1379) (size!913 (buf!1241 thiss!1379))) (and (bvsge (currentBit!2654 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2654 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2659 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2659 thiss!1379) (size!913 (buf!1241 thiss!1379))) (and (= (currentBit!2654 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2659 thiss!1379) (size!913 (buf!1241 thiss!1379)))))))))

(assert (=> b!40803 d!11964))

(push 1)

(assert (not d!11948))

(assert (not b!40844))

(assert (not b!40846))

(assert (not d!11940))

(assert (not d!11946))

(assert (not d!11962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

