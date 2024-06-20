; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48192 () Bool)

(assert start!48192)

(declare-fun b!228894 () Bool)

(declare-fun res!191940 () Bool)

(declare-fun e!157032 () Bool)

(assert (=> b!228894 (=> (not res!191940) (not e!157032))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11604 0))(
  ( (array!11605 (arr!6081 (Array (_ BitVec 32) (_ BitVec 8))) (size!5094 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9284 0))(
  ( (BitStream!9285 (buf!5635 array!11604) (currentByte!10500 (_ BitVec 32)) (currentBit!10495 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9284)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228894 (= res!191940 (bvsle bits!86 (bitIndex!0 (size!5094 (buf!5635 b2!99)) (currentByte!10500 b2!99) (currentBit!10495 b2!99))))))

(declare-fun b!228896 () Bool)

(declare-fun e!157030 () Bool)

(declare-fun b1!101 () BitStream!9284)

(declare-fun array_inv!4835 (array!11604) Bool)

(assert (=> b!228896 (= e!157030 (array_inv!4835 (buf!5635 b1!101)))))

(declare-fun b!228897 () Bool)

(declare-fun e!157029 () Bool)

(assert (=> b!228897 (= e!157029 (array_inv!4835 (buf!5635 b2!99)))))

(declare-fun b!228895 () Bool)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!228895 (= e!157032 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5094 (buf!5635 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10500 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10495 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5094 (buf!5635 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!10500 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!10495 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!191941 () Bool)

(assert (=> start!48192 (=> (not res!191941) (not e!157032))))

(assert (=> start!48192 (= res!191941 (and (= (size!5094 (buf!5635 b1!101)) (size!5094 (buf!5635 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48192 e!157032))

(declare-fun inv!12 (BitStream!9284) Bool)

(assert (=> start!48192 (and (inv!12 b1!101) e!157030)))

(assert (=> start!48192 (and (inv!12 b2!99) e!157029)))

(assert (=> start!48192 true))

(assert (= (and start!48192 res!191941) b!228894))

(assert (= (and b!228894 res!191940) b!228895))

(assert (= start!48192 b!228896))

(assert (= start!48192 b!228897))

(declare-fun m!352689 () Bool)

(assert (=> b!228894 m!352689))

(declare-fun m!352691 () Bool)

(assert (=> b!228896 m!352691))

(declare-fun m!352693 () Bool)

(assert (=> b!228897 m!352693))

(declare-fun m!352695 () Bool)

(assert (=> start!48192 m!352695))

(declare-fun m!352697 () Bool)

(assert (=> start!48192 m!352697))

(push 1)

(assert (not b!228894))

(assert (not b!228896))

(assert (not start!48192))

(assert (not b!228897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77614 () Bool)

(declare-fun e!157042 () Bool)

(assert (=> d!77614 e!157042))

(declare-fun res!191958 () Bool)

(assert (=> d!77614 (=> (not res!191958) (not e!157042))))

(declare-fun lt!367033 () (_ BitVec 64))

(declare-fun lt!367035 () (_ BitVec 64))

(declare-fun lt!367031 () (_ BitVec 64))

(assert (=> d!77614 (= res!191958 (= lt!367033 (bvsub lt!367035 lt!367031)))))

(assert (=> d!77614 (or (= (bvand lt!367035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367031 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367035 lt!367031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77614 (= lt!367031 (remainingBits!0 ((_ sign_extend 32) (size!5094 (buf!5635 b2!99))) ((_ sign_extend 32) (currentByte!10500 b2!99)) ((_ sign_extend 32) (currentBit!10495 b2!99))))))

(declare-fun lt!367034 () (_ BitVec 64))

(declare-fun lt!367032 () (_ BitVec 64))

(assert (=> d!77614 (= lt!367035 (bvmul lt!367034 lt!367032))))

(assert (=> d!77614 (or (= lt!367034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367032 (bvsdiv (bvmul lt!367034 lt!367032) lt!367034)))))

(assert (=> d!77614 (= lt!367032 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77614 (= lt!367034 ((_ sign_extend 32) (size!5094 (buf!5635 b2!99))))))

(assert (=> d!77614 (= lt!367033 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10500 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10495 b2!99))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77614 (invariant!0 (currentBit!10495 b2!99) (currentByte!10500 b2!99) (size!5094 (buf!5635 b2!99)))))

(assert (=> d!77614 (= (bitIndex!0 (size!5094 (buf!5635 b2!99)) (currentByte!10500 b2!99) (currentBit!10495 b2!99)) lt!367033)))

(declare-fun b!228914 () Bool)

(declare-fun res!191959 () Bool)

(assert (=> b!228914 (=> (not res!191959) (not e!157042))))

(assert (=> b!228914 (= res!191959 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367033))))

(declare-fun b!228915 () Bool)

(declare-fun lt!367030 () (_ BitVec 64))

(assert (=> b!228915 (= e!157042 (bvsle lt!367033 (bvmul lt!367030 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228915 (or (= lt!367030 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367030 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367030)))))

(assert (=> b!228915 (= lt!367030 ((_ sign_extend 32) (size!5094 (buf!5635 b2!99))))))

(assert (= (and d!77614 res!191958) b!228914))

(assert (= (and b!228914 res!191959) b!228915))

(declare-fun m!352711 () Bool)

(assert (=> d!77614 m!352711))

(declare-fun m!352713 () Bool)

(assert (=> d!77614 m!352713))

(assert (=> b!228894 d!77614))

(declare-fun d!77624 () Bool)

(assert (=> d!77624 (= (array_inv!4835 (buf!5635 b1!101)) (bvsge (size!5094 (buf!5635 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228896 d!77624))

(declare-fun d!77626 () Bool)

(assert (=> d!77626 (= (inv!12 b1!101) (invariant!0 (currentBit!10495 b1!101) (currentByte!10500 b1!101) (size!5094 (buf!5635 b1!101))))))

(declare-fun bs!19009 () Bool)

(assert (= bs!19009 d!77626))

(declare-fun m!352715 () Bool)

(assert (=> bs!19009 m!352715))

(assert (=> start!48192 d!77626))

(declare-fun d!77628 () Bool)

(assert (=> d!77628 (= (inv!12 b2!99) (invariant!0 (currentBit!10495 b2!99) (currentByte!10500 b2!99) (size!5094 (buf!5635 b2!99))))))

(declare-fun bs!19010 () Bool)

(assert (= bs!19010 d!77628))

(assert (=> bs!19010 m!352713))

(assert (=> start!48192 d!77628))

(declare-fun d!77630 () Bool)

(assert (=> d!77630 (= (array_inv!4835 (buf!5635 b2!99)) (bvsge (size!5094 (buf!5635 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228897 d!77630))

(push 1)

(assert (not d!77626))

(assert (not d!77614))

(assert (not d!77628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

