; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8140 () Bool)

(assert start!8140)

(declare-fun res!34799 () Bool)

(declare-fun e!26982 () Bool)

(assert (=> start!8140 (=> (not res!34799) (not e!26982))))

(declare-datatypes ((array!2027 0))(
  ( (array!2028 (arr!1415 (Array (_ BitVec 32) (_ BitVec 8))) (size!916 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2027)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8140 (= res!34799 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!916 srcBuffer!2))))))))

(assert (=> start!8140 e!26982))

(assert (=> start!8140 true))

(declare-fun array_inv!841 (array!2027) Bool)

(assert (=> start!8140 (array_inv!841 srcBuffer!2)))

(declare-datatypes ((BitStream!1576 0))(
  ( (BitStream!1577 (buf!1244 array!2027) (currentByte!2669 (_ BitVec 32)) (currentBit!2664 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1576)

(declare-fun e!26979 () Bool)

(declare-fun inv!12 (BitStream!1576) Bool)

(assert (=> start!8140 (and (inv!12 thiss!1379) e!26979)))

(declare-fun b!40885 () Bool)

(assert (=> b!40885 (= e!26979 (array_inv!841 (buf!1244 thiss!1379)))))

(declare-fun b!40883 () Bool)

(declare-fun e!26983 () Bool)

(assert (=> b!40883 (= e!26982 (not e!26983))))

(declare-fun res!34798 () Bool)

(assert (=> b!40883 (=> res!34798 e!26983)))

(assert (=> b!40883 (= res!34798 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1576 BitStream!1576) Bool)

(assert (=> b!40883 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2877 0))(
  ( (Unit!2878) )
))
(declare-fun lt!62073 () Unit!2877)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1576) Unit!2877)

(assert (=> b!40883 (= lt!62073 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62074 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40883 (= lt!62074 (bitIndex!0 (size!916 (buf!1244 thiss!1379)) (currentByte!2669 thiss!1379) (currentBit!2664 thiss!1379)))))

(declare-fun b!40884 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40884 (= e!26983 (invariant!0 (currentBit!2664 thiss!1379) (currentByte!2669 thiss!1379) (size!916 (buf!1244 thiss!1379))))))

(declare-fun b!40882 () Bool)

(declare-fun res!34800 () Bool)

(assert (=> b!40882 (=> (not res!34800) (not e!26982))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40882 (= res!34800 (validate_offset_bits!1 ((_ sign_extend 32) (size!916 (buf!1244 thiss!1379))) ((_ sign_extend 32) (currentByte!2669 thiss!1379)) ((_ sign_extend 32) (currentBit!2664 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8140 res!34799) b!40882))

(assert (= (and b!40882 res!34800) b!40883))

(assert (= (and b!40883 (not res!34798)) b!40884))

(assert (= start!8140 b!40885))

(declare-fun m!62521 () Bool)

(assert (=> b!40882 m!62521))

(declare-fun m!62523 () Bool)

(assert (=> b!40884 m!62523))

(declare-fun m!62525 () Bool)

(assert (=> start!8140 m!62525))

(declare-fun m!62527 () Bool)

(assert (=> start!8140 m!62527))

(declare-fun m!62529 () Bool)

(assert (=> b!40883 m!62529))

(declare-fun m!62531 () Bool)

(assert (=> b!40883 m!62531))

(declare-fun m!62533 () Bool)

(assert (=> b!40883 m!62533))

(declare-fun m!62535 () Bool)

(assert (=> b!40885 m!62535))

(push 1)

(assert (not b!40883))

(assert (not b!40882))

(assert (not start!8140))

(assert (not b!40885))

(assert (not b!40884))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11978 () Bool)

(declare-fun res!34826 () Bool)

(declare-fun e!27019 () Bool)

(assert (=> d!11978 (=> (not res!34826) (not e!27019))))

(assert (=> d!11978 (= res!34826 (= (size!916 (buf!1244 thiss!1379)) (size!916 (buf!1244 thiss!1379))))))

(assert (=> d!11978 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!27019)))

(declare-fun b!40916 () Bool)

(declare-fun res!34827 () Bool)

(assert (=> b!40916 (=> (not res!34827) (not e!27019))))

(assert (=> b!40916 (= res!34827 (bvsle (bitIndex!0 (size!916 (buf!1244 thiss!1379)) (currentByte!2669 thiss!1379) (currentBit!2664 thiss!1379)) (bitIndex!0 (size!916 (buf!1244 thiss!1379)) (currentByte!2669 thiss!1379) (currentBit!2664 thiss!1379))))))

(declare-fun b!40917 () Bool)

(declare-fun e!27018 () Bool)

(assert (=> b!40917 (= e!27019 e!27018)))

(declare-fun res!34825 () Bool)

(assert (=> b!40917 (=> res!34825 e!27018)))

(assert (=> b!40917 (= res!34825 (= (size!916 (buf!1244 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!40918 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2027 array!2027 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40918 (= e!27018 (arrayBitRangesEq!0 (buf!1244 thiss!1379) (buf!1244 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!916 (buf!1244 thiss!1379)) (currentByte!2669 thiss!1379) (currentBit!2664 thiss!1379))))))

(assert (= (and d!11978 res!34826) b!40916))

(assert (= (and b!40916 res!34827) b!40917))

(assert (= (and b!40917 (not res!34825)) b!40918))

(assert (=> b!40916 m!62533))

(assert (=> b!40916 m!62533))

(assert (=> b!40918 m!62533))

(assert (=> b!40918 m!62533))

(declare-fun m!62571 () Bool)

(assert (=> b!40918 m!62571))

(assert (=> b!40883 d!11978))

(declare-fun d!11992 () Bool)

(assert (=> d!11992 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!62089 () Unit!2877)

(declare-fun choose!11 (BitStream!1576) Unit!2877)

(assert (=> d!11992 (= lt!62089 (choose!11 thiss!1379))))

(assert (=> d!11992 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!62089)))

(declare-fun bs!3190 () Bool)

(assert (= bs!3190 d!11992))

(assert (=> bs!3190 m!62529))

(declare-fun m!62573 () Bool)

(assert (=> bs!3190 m!62573))

(assert (=> b!40883 d!11992))

(declare-fun d!11994 () Bool)

(declare-fun e!27034 () Bool)

(assert (=> d!11994 e!27034))

(declare-fun res!34851 () Bool)

(assert (=> d!11994 (=> (not res!34851) (not e!27034))))

(declare-fun lt!62112 () (_ BitVec 64))

(declare-fun lt!62110 () (_ BitVec 64))

(declare-fun lt!62109 () (_ BitVec 64))

(assert (=> d!11994 (= res!34851 (= lt!62112 (bvsub lt!62109 lt!62110)))))

(assert (=> d!11994 (or (= (bvand lt!62109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!62110 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!62109 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!62109 lt!62110) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11994 (= lt!62110 (remainingBits!0 ((_ sign_extend 32) (size!916 (buf!1244 thiss!1379))) ((_ sign_extend 32) (currentByte!2669 thiss!1379)) ((_ sign_extend 32) (currentBit!2664 thiss!1379))))))

(declare-fun lt!62113 () (_ BitVec 64))

(declare-fun lt!62108 () (_ BitVec 64))

(assert (=> d!11994 (= lt!62109 (bvmul lt!62113 lt!62108))))

(assert (=> d!11994 (or (= lt!62113 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!62108 (bvsdiv (bvmul lt!62113 lt!62108) lt!62113)))))

(assert (=> d!11994 (= lt!62108 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11994 (= lt!62113 ((_ sign_extend 32) (size!916 (buf!1244 thiss!1379))))))

(assert (=> d!11994 (= lt!62112 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2669 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2664 thiss!1379))))))

(assert (=> d!11994 (invariant!0 (currentBit!2664 thiss!1379) (currentByte!2669 thiss!1379) (size!916 (buf!1244 thiss!1379)))))

(assert (=> d!11994 (= (bitIndex!0 (size!916 (buf!1244 thiss!1379)) (currentByte!2669 thiss!1379) (currentBit!2664 thiss!1379)) lt!62112)))

(declare-fun b!40941 () Bool)

(declare-fun res!34850 () Bool)

(assert (=> b!40941 (=> (not res!34850) (not e!27034))))

(assert (=> b!40941 (= res!34850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!62112))))

(declare-fun b!40942 () Bool)

(declare-fun lt!62111 () (_ BitVec 64))

(assert (=> b!40942 (= e!27034 (bvsle lt!62112 (bvmul lt!62111 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!40942 (or (= lt!62111 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!62111 #b0000000000000000000000000000000000000000000000000000000000001000) lt!62111)))))

(assert (=> b!40942 (= lt!62111 ((_ sign_extend 32) (size!916 (buf!1244 thiss!1379))))))

(assert (= (and d!11994 res!34851) b!40941))

(assert (= (and b!40941 res!34850) b!40942))

(declare-fun m!62583 () Bool)

(assert (=> d!11994 m!62583))

(assert (=> d!11994 m!62523))

(assert (=> b!40883 d!11994))

(declare-fun d!12004 () Bool)

(assert (=> d!12004 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!916 (buf!1244 thiss!1379))) ((_ sign_extend 32) (currentByte!2669 thiss!1379)) ((_ sign_extend 32) (currentBit!2664 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!916 (buf!1244 thiss!1379))) ((_ sign_extend 32) (currentByte!2669 thiss!1379)) ((_ sign_extend 32) (currentBit!2664 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3195 () Bool)

(assert (= bs!3195 d!12004))

(assert (=> bs!3195 m!62583))

(assert (=> b!40882 d!12004))

(declare-fun d!12006 () Bool)

(assert (=> d!12006 (= (invariant!0 (currentBit!2664 thiss!1379) (currentByte!2669 thiss!1379) (size!916 (buf!1244 thiss!1379))) (and (bvsge (currentBit!2664 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2664 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2669 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2669 thiss!1379) (size!916 (buf!1244 thiss!1379))) (and (= (currentBit!2664 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2669 thiss!1379) (size!916 (buf!1244 thiss!1379)))))))))

(assert (=> b!40884 d!12006))

(declare-fun d!12008 () Bool)

(assert (=> d!12008 (= (array_inv!841 srcBuffer!2) (bvsge (size!916 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8140 d!12008))

(declare-fun d!12010 () Bool)

(assert (=> d!12010 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2664 thiss!1379) (currentByte!2669 thiss!1379) (size!916 (buf!1244 thiss!1379))))))

(declare-fun bs!3196 () Bool)

(assert (= bs!3196 d!12010))

(assert (=> bs!3196 m!62523))

(assert (=> start!8140 d!12010))

(declare-fun d!12012 () Bool)

(assert (=> d!12012 (= (array_inv!841 (buf!1244 thiss!1379)) (bvsge (size!916 (buf!1244 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!40885 d!12012))

(push 1)

(assert (not d!11992))

(assert (not b!40918))

(assert (not b!40916))

(assert (not d!12010))

(assert (not d!12004))

(assert (not d!11994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

