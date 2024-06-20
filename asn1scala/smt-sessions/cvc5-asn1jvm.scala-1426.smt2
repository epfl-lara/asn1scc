; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39104 () Bool)

(assert start!39104)

(declare-fun b!175955 () Bool)

(declare-fun e!122687 () Bool)

(declare-datatypes ((array!9500 0))(
  ( (array!9501 (arr!5122 (Array (_ BitVec 32) (_ BitVec 8))) (size!4192 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7492 0))(
  ( (BitStream!7493 (buf!4635 array!9500) (currentByte!8770 (_ BitVec 32)) (currentBit!8765 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12698 0))(
  ( (Unit!12699) )
))
(declare-datatypes ((tuple2!15136 0))(
  ( (tuple2!15137 (_1!8213 Unit!12698) (_2!8213 BitStream!7492)) )
))
(declare-fun lt!271251 () tuple2!15136)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175955 (= e!122687 (not (invariant!0 (currentBit!8765 (_2!8213 lt!271251)) (currentByte!8770 (_2!8213 lt!271251)) (size!4192 (buf!4635 (_2!8213 lt!271251))))))))

(declare-fun e!122686 () Bool)

(assert (=> b!175955 e!122686))

(declare-fun res!145706 () Bool)

(assert (=> b!175955 (=> (not res!145706) (not e!122686))))

(declare-fun thiss!1204 () BitStream!7492)

(assert (=> b!175955 (= res!145706 (= (size!4192 (buf!4635 thiss!1204)) (size!4192 (buf!4635 (_2!8213 lt!271251)))))))

(declare-fun lt!271250 () Bool)

(declare-fun appendBit!0 (BitStream!7492 Bool) tuple2!15136)

(assert (=> b!175955 (= lt!271251 (appendBit!0 thiss!1204 lt!271250))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!175955 (= lt!271250 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175956 () Bool)

(declare-fun res!145707 () Bool)

(assert (=> b!175956 (=> (not res!145707) (not e!122687))))

(assert (=> b!175956 (= res!145707 (invariant!0 (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204) (size!4192 (buf!4635 thiss!1204))))))

(declare-fun b!175957 () Bool)

(declare-fun e!122684 () Bool)

(declare-fun e!122689 () Bool)

(assert (=> b!175957 (= e!122684 e!122689)))

(declare-fun res!145709 () Bool)

(assert (=> b!175957 (=> (not res!145709) (not e!122689))))

(declare-datatypes ((tuple2!15138 0))(
  ( (tuple2!15139 (_1!8214 BitStream!7492) (_2!8214 Bool)) )
))
(declare-fun lt!271249 () tuple2!15138)

(assert (=> b!175957 (= res!145709 (and (= (_2!8214 lt!271249) lt!271250) (= (_1!8214 lt!271249) (_2!8213 lt!271251))))))

(declare-fun readBitPure!0 (BitStream!7492) tuple2!15138)

(declare-fun readerFrom!0 (BitStream!7492 (_ BitVec 32) (_ BitVec 32)) BitStream!7492)

(assert (=> b!175957 (= lt!271249 (readBitPure!0 (readerFrom!0 (_2!8213 lt!271251) (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204))))))

(declare-fun b!175958 () Bool)

(declare-fun res!145708 () Bool)

(assert (=> b!175958 (=> (not res!145708) (not e!122684))))

(declare-fun isPrefixOf!0 (BitStream!7492 BitStream!7492) Bool)

(assert (=> b!175958 (= res!145708 (isPrefixOf!0 thiss!1204 (_2!8213 lt!271251)))))

(declare-fun b!175959 () Bool)

(declare-fun lt!271252 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175959 (= e!122689 (= (bitIndex!0 (size!4192 (buf!4635 (_1!8214 lt!271249))) (currentByte!8770 (_1!8214 lt!271249)) (currentBit!8765 (_1!8214 lt!271249))) lt!271252))))

(declare-fun b!175960 () Bool)

(declare-fun e!122685 () Bool)

(declare-fun array_inv!3933 (array!9500) Bool)

(assert (=> b!175960 (= e!122685 (array_inv!3933 (buf!4635 thiss!1204)))))

(declare-fun b!175961 () Bool)

(declare-fun res!145711 () Bool)

(assert (=> b!175961 (=> (not res!145711) (not e!122687))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175961 (= res!145711 (validate_offset_bits!1 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))) ((_ sign_extend 32) (currentByte!8770 thiss!1204)) ((_ sign_extend 32) (currentBit!8765 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175962 () Bool)

(assert (=> b!175962 (= e!122686 e!122684)))

(declare-fun res!145713 () Bool)

(assert (=> b!175962 (=> (not res!145713) (not e!122684))))

(declare-fun lt!271253 () (_ BitVec 64))

(assert (=> b!175962 (= res!145713 (= lt!271252 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!271253)))))

(assert (=> b!175962 (= lt!271252 (bitIndex!0 (size!4192 (buf!4635 (_2!8213 lt!271251))) (currentByte!8770 (_2!8213 lt!271251)) (currentBit!8765 (_2!8213 lt!271251))))))

(assert (=> b!175962 (= lt!271253 (bitIndex!0 (size!4192 (buf!4635 thiss!1204)) (currentByte!8770 thiss!1204) (currentBit!8765 thiss!1204)))))

(declare-fun res!145712 () Bool)

(assert (=> start!39104 (=> (not res!145712) (not e!122687))))

(assert (=> start!39104 (= res!145712 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39104 e!122687))

(assert (=> start!39104 true))

(declare-fun inv!12 (BitStream!7492) Bool)

(assert (=> start!39104 (and (inv!12 thiss!1204) e!122685)))

(declare-fun b!175954 () Bool)

(declare-fun res!145710 () Bool)

(assert (=> b!175954 (=> (not res!145710) (not e!122687))))

(assert (=> b!175954 (= res!145710 (not (= i!590 nBits!348)))))

(assert (= (and start!39104 res!145712) b!175961))

(assert (= (and b!175961 res!145711) b!175956))

(assert (= (and b!175956 res!145707) b!175954))

(assert (= (and b!175954 res!145710) b!175955))

(assert (= (and b!175955 res!145706) b!175962))

(assert (= (and b!175962 res!145713) b!175958))

(assert (= (and b!175958 res!145708) b!175957))

(assert (= (and b!175957 res!145709) b!175959))

(assert (= start!39104 b!175960))

(declare-fun m!276151 () Bool)

(assert (=> b!175960 m!276151))

(declare-fun m!276153 () Bool)

(assert (=> b!175955 m!276153))

(declare-fun m!276155 () Bool)

(assert (=> b!175955 m!276155))

(declare-fun m!276157 () Bool)

(assert (=> b!175959 m!276157))

(declare-fun m!276159 () Bool)

(assert (=> b!175956 m!276159))

(declare-fun m!276161 () Bool)

(assert (=> start!39104 m!276161))

(declare-fun m!276163 () Bool)

(assert (=> b!175958 m!276163))

(declare-fun m!276165 () Bool)

(assert (=> b!175957 m!276165))

(assert (=> b!175957 m!276165))

(declare-fun m!276167 () Bool)

(assert (=> b!175957 m!276167))

(declare-fun m!276169 () Bool)

(assert (=> b!175962 m!276169))

(declare-fun m!276171 () Bool)

(assert (=> b!175962 m!276171))

(declare-fun m!276173 () Bool)

(assert (=> b!175961 m!276173))

(push 1)

(assert (not b!175961))

(assert (not b!175960))

(assert (not b!175956))

(assert (not b!175958))

(assert (not b!175957))

(assert (not b!175955))

(assert (not b!175962))

(assert (not start!39104))

(assert (not b!175959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!62077 () Bool)

(declare-fun e!122747 () Bool)

(assert (=> d!62077 e!122747))

(declare-fun res!145802 () Bool)

(assert (=> d!62077 (=> (not res!145802) (not e!122747))))

(declare-fun lt!271376 () (_ BitVec 64))

(declare-fun lt!271375 () (_ BitVec 64))

(declare-fun lt!271377 () (_ BitVec 64))

(assert (=> d!62077 (= res!145802 (= lt!271375 (bvsub lt!271376 lt!271377)))))

(assert (=> d!62077 (or (= (bvand lt!271376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271376 lt!271377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!62077 (= lt!271377 (remainingBits!0 ((_ sign_extend 32) (size!4192 (buf!4635 (_1!8214 lt!271249)))) ((_ sign_extend 32) (currentByte!8770 (_1!8214 lt!271249))) ((_ sign_extend 32) (currentBit!8765 (_1!8214 lt!271249)))))))

(declare-fun lt!271378 () (_ BitVec 64))

(declare-fun lt!271373 () (_ BitVec 64))

(assert (=> d!62077 (= lt!271376 (bvmul lt!271378 lt!271373))))

(assert (=> d!62077 (or (= lt!271378 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271373 (bvsdiv (bvmul lt!271378 lt!271373) lt!271378)))))

(assert (=> d!62077 (= lt!271373 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62077 (= lt!271378 ((_ sign_extend 32) (size!4192 (buf!4635 (_1!8214 lt!271249)))))))

(assert (=> d!62077 (= lt!271375 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8770 (_1!8214 lt!271249))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8765 (_1!8214 lt!271249)))))))

(assert (=> d!62077 (invariant!0 (currentBit!8765 (_1!8214 lt!271249)) (currentByte!8770 (_1!8214 lt!271249)) (size!4192 (buf!4635 (_1!8214 lt!271249))))))

(assert (=> d!62077 (= (bitIndex!0 (size!4192 (buf!4635 (_1!8214 lt!271249))) (currentByte!8770 (_1!8214 lt!271249)) (currentBit!8765 (_1!8214 lt!271249))) lt!271375)))

(declare-fun b!176057 () Bool)

(declare-fun res!145803 () Bool)

(assert (=> b!176057 (=> (not res!145803) (not e!122747))))

(assert (=> b!176057 (= res!145803 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271375))))

(declare-fun b!176058 () Bool)

(declare-fun lt!271374 () (_ BitVec 64))

(assert (=> b!176058 (= e!122747 (bvsle lt!271375 (bvmul lt!271374 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176058 (or (= lt!271374 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271374 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271374)))))

(assert (=> b!176058 (= lt!271374 ((_ sign_extend 32) (size!4192 (buf!4635 (_1!8214 lt!271249)))))))

(assert (= (and d!62077 res!145802) b!176057))

(assert (= (and b!176057 res!145803) b!176058))

(declare-fun m!276259 () Bool)

(assert (=> d!62077 m!276259))

(declare-fun m!276261 () Bool)

(assert (=> d!62077 m!276261))

(assert (=> b!175959 d!62077))

(declare-fun d!62097 () Bool)

(declare-fun res!145824 () Bool)

(declare-fun e!122762 () Bool)

(assert (=> d!62097 (=> (not res!145824) (not e!122762))))

(assert (=> d!62097 (= res!145824 (= (size!4192 (buf!4635 thiss!1204)) (size!4192 (buf!4635 (_2!8213 lt!271251)))))))

(assert (=> d!62097 (= (isPrefixOf!0 thiss!1204 (_2!8213 lt!271251)) e!122762)))

(declare-fun b!176077 () Bool)

(declare-fun res!145823 () Bool)

(assert (=> b!176077 (=> (not res!145823) (not e!122762))))

(assert (=> b!176077 (= res!145823 (bvsle (bitIndex!0 (size!4192 (buf!4635 thiss!1204)) (currentByte!8770 thiss!1204) (currentBit!8765 thiss!1204)) (bitIndex!0 (size!4192 (buf!4635 (_2!8213 lt!271251))) (currentByte!8770 (_2!8213 lt!271251)) (currentBit!8765 (_2!8213 lt!271251)))))))

(declare-fun b!176078 () Bool)

(declare-fun e!122761 () Bool)

(assert (=> b!176078 (= e!122762 e!122761)))

(declare-fun res!145825 () Bool)

(assert (=> b!176078 (=> res!145825 e!122761)))

(assert (=> b!176078 (= res!145825 (= (size!4192 (buf!4635 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!176079 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9500 array!9500 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!176079 (= e!122761 (arrayBitRangesEq!0 (buf!4635 thiss!1204) (buf!4635 (_2!8213 lt!271251)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4192 (buf!4635 thiss!1204)) (currentByte!8770 thiss!1204) (currentBit!8765 thiss!1204))))))

(assert (= (and d!62097 res!145824) b!176077))

(assert (= (and b!176077 res!145823) b!176078))

(assert (= (and b!176078 (not res!145825)) b!176079))

(assert (=> b!176077 m!276171))

(assert (=> b!176077 m!276169))

(assert (=> b!176079 m!276171))

(assert (=> b!176079 m!276171))

(declare-fun m!276267 () Bool)

(assert (=> b!176079 m!276267))

(assert (=> b!175958 d!62097))

(declare-fun d!62107 () Bool)

(assert (=> d!62107 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204) (size!4192 (buf!4635 thiss!1204))))))

(declare-fun bs!15500 () Bool)

(assert (= bs!15500 d!62107))

(assert (=> bs!15500 m!276159))

(assert (=> start!39104 d!62107))

(declare-fun d!62109 () Bool)

(assert (=> d!62109 (= (invariant!0 (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204) (size!4192 (buf!4635 thiss!1204))) (and (bvsge (currentBit!8765 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8765 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8770 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8770 thiss!1204) (size!4192 (buf!4635 thiss!1204))) (and (= (currentBit!8765 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8770 thiss!1204) (size!4192 (buf!4635 thiss!1204)))))))))

(assert (=> b!175956 d!62109))

(declare-fun d!62111 () Bool)

(declare-fun e!122763 () Bool)

(assert (=> d!62111 e!122763))

(declare-fun res!145826 () Bool)

(assert (=> d!62111 (=> (not res!145826) (not e!122763))))

(declare-fun lt!271383 () (_ BitVec 64))

(declare-fun lt!271382 () (_ BitVec 64))

(declare-fun lt!271384 () (_ BitVec 64))

(assert (=> d!62111 (= res!145826 (= lt!271382 (bvsub lt!271383 lt!271384)))))

(assert (=> d!62111 (or (= (bvand lt!271383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271384 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271383 lt!271384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62111 (= lt!271384 (remainingBits!0 ((_ sign_extend 32) (size!4192 (buf!4635 (_2!8213 lt!271251)))) ((_ sign_extend 32) (currentByte!8770 (_2!8213 lt!271251))) ((_ sign_extend 32) (currentBit!8765 (_2!8213 lt!271251)))))))

(declare-fun lt!271385 () (_ BitVec 64))

(declare-fun lt!271380 () (_ BitVec 64))

(assert (=> d!62111 (= lt!271383 (bvmul lt!271385 lt!271380))))

(assert (=> d!62111 (or (= lt!271385 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271380 (bvsdiv (bvmul lt!271385 lt!271380) lt!271385)))))

(assert (=> d!62111 (= lt!271380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62111 (= lt!271385 ((_ sign_extend 32) (size!4192 (buf!4635 (_2!8213 lt!271251)))))))

(assert (=> d!62111 (= lt!271382 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8770 (_2!8213 lt!271251))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8765 (_2!8213 lt!271251)))))))

(assert (=> d!62111 (invariant!0 (currentBit!8765 (_2!8213 lt!271251)) (currentByte!8770 (_2!8213 lt!271251)) (size!4192 (buf!4635 (_2!8213 lt!271251))))))

(assert (=> d!62111 (= (bitIndex!0 (size!4192 (buf!4635 (_2!8213 lt!271251))) (currentByte!8770 (_2!8213 lt!271251)) (currentBit!8765 (_2!8213 lt!271251))) lt!271382)))

(declare-fun b!176080 () Bool)

(declare-fun res!145827 () Bool)

(assert (=> b!176080 (=> (not res!145827) (not e!122763))))

(assert (=> b!176080 (= res!145827 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271382))))

(declare-fun b!176081 () Bool)

(declare-fun lt!271381 () (_ BitVec 64))

(assert (=> b!176081 (= e!122763 (bvsle lt!271382 (bvmul lt!271381 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176081 (or (= lt!271381 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271381 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271381)))))

(assert (=> b!176081 (= lt!271381 ((_ sign_extend 32) (size!4192 (buf!4635 (_2!8213 lt!271251)))))))

(assert (= (and d!62111 res!145826) b!176080))

(assert (= (and b!176080 res!145827) b!176081))

(declare-fun m!276269 () Bool)

(assert (=> d!62111 m!276269))

(assert (=> d!62111 m!276153))

(assert (=> b!175962 d!62111))

(declare-fun d!62113 () Bool)

(declare-fun e!122764 () Bool)

(assert (=> d!62113 e!122764))

(declare-fun res!145828 () Bool)

(assert (=> d!62113 (=> (not res!145828) (not e!122764))))

(declare-fun lt!271389 () (_ BitVec 64))

(declare-fun lt!271390 () (_ BitVec 64))

(declare-fun lt!271388 () (_ BitVec 64))

(assert (=> d!62113 (= res!145828 (= lt!271388 (bvsub lt!271389 lt!271390)))))

(assert (=> d!62113 (or (= (bvand lt!271389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271389 lt!271390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62113 (= lt!271390 (remainingBits!0 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))) ((_ sign_extend 32) (currentByte!8770 thiss!1204)) ((_ sign_extend 32) (currentBit!8765 thiss!1204))))))

(declare-fun lt!271391 () (_ BitVec 64))

(declare-fun lt!271386 () (_ BitVec 64))

(assert (=> d!62113 (= lt!271389 (bvmul lt!271391 lt!271386))))

(assert (=> d!62113 (or (= lt!271391 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!271386 (bvsdiv (bvmul lt!271391 lt!271386) lt!271391)))))

(assert (=> d!62113 (= lt!271386 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!62113 (= lt!271391 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))))))

(assert (=> d!62113 (= lt!271388 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8770 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8765 thiss!1204))))))

(assert (=> d!62113 (invariant!0 (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204) (size!4192 (buf!4635 thiss!1204)))))

(assert (=> d!62113 (= (bitIndex!0 (size!4192 (buf!4635 thiss!1204)) (currentByte!8770 thiss!1204) (currentBit!8765 thiss!1204)) lt!271388)))

(declare-fun b!176082 () Bool)

(declare-fun res!145829 () Bool)

(assert (=> b!176082 (=> (not res!145829) (not e!122764))))

(assert (=> b!176082 (= res!145829 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!271388))))

(declare-fun b!176083 () Bool)

(declare-fun lt!271387 () (_ BitVec 64))

(assert (=> b!176083 (= e!122764 (bvsle lt!271388 (bvmul lt!271387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!176083 (or (= lt!271387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!271387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!271387)))))

(assert (=> b!176083 (= lt!271387 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))))))

(assert (= (and d!62113 res!145828) b!176082))

(assert (= (and b!176082 res!145829) b!176083))

(declare-fun m!276271 () Bool)

(assert (=> d!62113 m!276271))

(assert (=> d!62113 m!276159))

(assert (=> b!175962 d!62113))

(declare-fun d!62115 () Bool)

(declare-datatypes ((tuple2!15152 0))(
  ( (tuple2!15153 (_1!8221 Bool) (_2!8221 BitStream!7492)) )
))
(declare-fun lt!271394 () tuple2!15152)

(declare-fun readBit!0 (BitStream!7492) tuple2!15152)

(assert (=> d!62115 (= lt!271394 (readBit!0 (readerFrom!0 (_2!8213 lt!271251) (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204))))))

(assert (=> d!62115 (= (readBitPure!0 (readerFrom!0 (_2!8213 lt!271251) (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204))) (tuple2!15139 (_2!8221 lt!271394) (_1!8221 lt!271394)))))

(declare-fun bs!15501 () Bool)

(assert (= bs!15501 d!62115))

(assert (=> bs!15501 m!276165))

(declare-fun m!276273 () Bool)

(assert (=> bs!15501 m!276273))

(assert (=> b!175957 d!62115))

(declare-fun d!62117 () Bool)

(declare-fun e!122767 () Bool)

(assert (=> d!62117 e!122767))

(declare-fun res!145833 () Bool)

(assert (=> d!62117 (=> (not res!145833) (not e!122767))))

(assert (=> d!62117 (= res!145833 (invariant!0 (currentBit!8765 (_2!8213 lt!271251)) (currentByte!8770 (_2!8213 lt!271251)) (size!4192 (buf!4635 (_2!8213 lt!271251)))))))

(assert (=> d!62117 (= (readerFrom!0 (_2!8213 lt!271251) (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204)) (BitStream!7493 (buf!4635 (_2!8213 lt!271251)) (currentByte!8770 thiss!1204) (currentBit!8765 thiss!1204)))))

(declare-fun b!176086 () Bool)

(assert (=> b!176086 (= e!122767 (invariant!0 (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204) (size!4192 (buf!4635 (_2!8213 lt!271251)))))))

(assert (= (and d!62117 res!145833) b!176086))

(assert (=> d!62117 m!276153))

(declare-fun m!276275 () Bool)

(assert (=> b!176086 m!276275))

(assert (=> b!175957 d!62117))

(declare-fun d!62119 () Bool)

(assert (=> d!62119 (= (array_inv!3933 (buf!4635 thiss!1204)) (bvsge (size!4192 (buf!4635 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175960 d!62119))

(declare-fun d!62121 () Bool)

(assert (=> d!62121 (= (invariant!0 (currentBit!8765 (_2!8213 lt!271251)) (currentByte!8770 (_2!8213 lt!271251)) (size!4192 (buf!4635 (_2!8213 lt!271251)))) (and (bvsge (currentBit!8765 (_2!8213 lt!271251)) #b00000000000000000000000000000000) (bvslt (currentBit!8765 (_2!8213 lt!271251)) #b00000000000000000000000000001000) (bvsge (currentByte!8770 (_2!8213 lt!271251)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8770 (_2!8213 lt!271251)) (size!4192 (buf!4635 (_2!8213 lt!271251)))) (and (= (currentBit!8765 (_2!8213 lt!271251)) #b00000000000000000000000000000000) (= (currentByte!8770 (_2!8213 lt!271251)) (size!4192 (buf!4635 (_2!8213 lt!271251))))))))))

(assert (=> b!175955 d!62121))

(declare-fun b!176119 () Bool)

(declare-fun res!145865 () Bool)

(declare-fun e!122785 () Bool)

(assert (=> b!176119 (=> (not res!145865) (not e!122785))))

(declare-fun lt!271416 () tuple2!15136)

(assert (=> b!176119 (= res!145865 (isPrefixOf!0 thiss!1204 (_2!8213 lt!271416)))))

(declare-fun b!176118 () Bool)

(declare-fun res!145863 () Bool)

(assert (=> b!176118 (=> (not res!145863) (not e!122785))))

(declare-fun lt!271417 () (_ BitVec 64))

(declare-fun lt!271415 () (_ BitVec 64))

(assert (=> b!176118 (= res!145863 (= (bitIndex!0 (size!4192 (buf!4635 (_2!8213 lt!271416))) (currentByte!8770 (_2!8213 lt!271416)) (currentBit!8765 (_2!8213 lt!271416))) (bvadd lt!271417 lt!271415)))))

(assert (=> b!176118 (or (not (= (bvand lt!271417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271415 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271417 lt!271415) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!176118 (= lt!271415 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!176118 (= lt!271417 (bitIndex!0 (size!4192 (buf!4635 thiss!1204)) (currentByte!8770 thiss!1204) (currentBit!8765 thiss!1204)))))

(declare-fun b!176120 () Bool)

(declare-fun e!122784 () Bool)

(assert (=> b!176120 (= e!122785 e!122784)))

(declare-fun res!145864 () Bool)

(assert (=> b!176120 (=> (not res!145864) (not e!122784))))

(declare-fun lt!271418 () tuple2!15138)

(assert (=> b!176120 (= res!145864 (and (= (_2!8214 lt!271418) lt!271250) (= (_1!8214 lt!271418) (_2!8213 lt!271416))))))

(assert (=> b!176120 (= lt!271418 (readBitPure!0 (readerFrom!0 (_2!8213 lt!271416) (currentBit!8765 thiss!1204) (currentByte!8770 thiss!1204))))))

(declare-fun b!176121 () Bool)

(assert (=> b!176121 (= e!122784 (= (bitIndex!0 (size!4192 (buf!4635 (_1!8214 lt!271418))) (currentByte!8770 (_1!8214 lt!271418)) (currentBit!8765 (_1!8214 lt!271418))) (bitIndex!0 (size!4192 (buf!4635 (_2!8213 lt!271416))) (currentByte!8770 (_2!8213 lt!271416)) (currentBit!8765 (_2!8213 lt!271416)))))))

(declare-fun d!62123 () Bool)

(assert (=> d!62123 e!122785))

(declare-fun res!145866 () Bool)

(assert (=> d!62123 (=> (not res!145866) (not e!122785))))

(assert (=> d!62123 (= res!145866 (= (size!4192 (buf!4635 thiss!1204)) (size!4192 (buf!4635 (_2!8213 lt!271416)))))))

(declare-fun choose!16 (BitStream!7492 Bool) tuple2!15136)

(assert (=> d!62123 (= lt!271416 (choose!16 thiss!1204 lt!271250))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!62123 (validate_offset_bit!0 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))) ((_ sign_extend 32) (currentByte!8770 thiss!1204)) ((_ sign_extend 32) (currentBit!8765 thiss!1204)))))

(assert (=> d!62123 (= (appendBit!0 thiss!1204 lt!271250) lt!271416)))

(assert (= (and d!62123 res!145866) b!176118))

(assert (= (and b!176118 res!145863) b!176119))

(assert (= (and b!176119 res!145865) b!176120))

(assert (= (and b!176120 res!145864) b!176121))

(declare-fun m!276293 () Bool)

(assert (=> d!62123 m!276293))

(declare-fun m!276295 () Bool)

(assert (=> d!62123 m!276295))

(declare-fun m!276297 () Bool)

(assert (=> b!176121 m!276297))

(declare-fun m!276299 () Bool)

(assert (=> b!176121 m!276299))

(assert (=> b!176118 m!276299))

(assert (=> b!176118 m!276171))

(declare-fun m!276301 () Bool)

(assert (=> b!176119 m!276301))

(declare-fun m!276303 () Bool)

(assert (=> b!176120 m!276303))

(assert (=> b!176120 m!276303))

(declare-fun m!276305 () Bool)

(assert (=> b!176120 m!276305))

(assert (=> b!175955 d!62123))

(declare-fun d!62133 () Bool)

(assert (=> d!62133 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))) ((_ sign_extend 32) (currentByte!8770 thiss!1204)) ((_ sign_extend 32) (currentBit!8765 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4192 (buf!4635 thiss!1204))) ((_ sign_extend 32) (currentByte!8770 thiss!1204)) ((_ sign_extend 32) (currentBit!8765 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!15504 () Bool)

(assert (= bs!15504 d!62133))

(assert (=> bs!15504 m!276271))

(assert (=> b!175961 d!62133))

(push 1)

(assert (not d!62077))

(assert (not d!62115))

(assert (not b!176118))

(assert (not d!62107))

(assert (not d!62117))

(assert (not b!176079))

(assert (not b!176120))

(assert (not b!176121))

(assert (not b!176119))

(assert (not d!62111))

(assert (not b!176086))

(assert (not d!62113))

(assert (not d!62123))

(assert (not b!176077))

(assert (not d!62133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

