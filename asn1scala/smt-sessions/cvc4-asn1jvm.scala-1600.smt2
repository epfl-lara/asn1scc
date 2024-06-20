; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45422 () Bool)

(assert start!45422)

(declare-fun b!220178 () Bool)

(declare-fun res!185483 () Bool)

(declare-fun e!149531 () Bool)

(assert (=> b!220178 (=> (not res!185483) (not e!149531))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220178 (= res!185483 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun res!185482 () Bool)

(assert (=> start!45422 (=> (not res!185482) (not e!149531))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45422 (= res!185482 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45422 e!149531))

(assert (=> start!45422 true))

(declare-datatypes ((array!10730 0))(
  ( (array!10731 (arr!5643 (Array (_ BitVec 32) (_ BitVec 8))) (size!4713 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8534 0))(
  ( (BitStream!8535 (buf!5260 array!10730) (currentByte!9869 (_ BitVec 32)) (currentBit!9864 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8534)

(declare-fun e!149532 () Bool)

(declare-fun inv!12 (BitStream!8534) Bool)

(assert (=> start!45422 (and (inv!12 bs!62) e!149532)))

(declare-fun b!220179 () Bool)

(declare-fun res!185480 () Bool)

(assert (=> b!220179 (=> (not res!185480) (not e!149531))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220179 (= res!185480 (validate_offset_bits!1 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) ((_ sign_extend 32) (currentByte!9869 bs!62)) ((_ sign_extend 32) (currentBit!9864 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220180 () Bool)

(declare-fun array_inv!4454 (array!10730) Bool)

(assert (=> b!220180 (= e!149532 (array_inv!4454 (buf!5260 bs!62)))))

(declare-fun b!220181 () Bool)

(declare-fun res!185481 () Bool)

(assert (=> b!220181 (=> (not res!185481) (not e!149531))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220181 (= res!185481 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220182 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!8534 (_ BitVec 64)) Bool)

(assert (=> b!220182 (= e!149531 (not (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!18802 0))(
  ( (tuple2!18803 (_1!10059 BitStream!8534) (_2!10059 Bool)) )
))
(declare-fun lt!347924 () tuple2!18802)

(declare-fun readBitPure!0 (BitStream!8534) tuple2!18802)

(assert (=> b!220182 (= lt!347924 (readBitPure!0 bs!62))))

(declare-datatypes ((tuple2!18804 0))(
  ( (tuple2!18805 (_1!10060 BitStream!8534) (_2!10060 (_ BitVec 64))) )
))
(declare-fun lt!347923 () tuple2!18804)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18804)

(assert (=> b!220182 (= lt!347923 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(assert (= (and start!45422 res!185482) b!220179))

(assert (= (and b!220179 res!185480) b!220181))

(assert (= (and b!220181 res!185481) b!220178))

(assert (= (and b!220178 res!185483) b!220182))

(assert (= start!45422 b!220180))

(declare-fun m!338897 () Bool)

(assert (=> b!220180 m!338897))

(declare-fun m!338899 () Bool)

(assert (=> b!220179 m!338899))

(declare-fun m!338901 () Bool)

(assert (=> start!45422 m!338901))

(declare-fun m!338903 () Bool)

(assert (=> b!220181 m!338903))

(declare-fun m!338905 () Bool)

(assert (=> b!220182 m!338905))

(declare-fun m!338907 () Bool)

(assert (=> b!220182 m!338907))

(declare-fun m!338909 () Bool)

(assert (=> b!220182 m!338909))

(push 1)

(assert (not b!220179))

(assert (not b!220180))

(assert (not b!220181))

(assert (not b!220182))

(assert (not start!45422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74107 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74107 (= (inv!12 bs!62) (invariant!0 (currentBit!9864 bs!62) (currentByte!9869 bs!62) (size!4713 (buf!5260 bs!62))))))

(declare-fun bs!18123 () Bool)

(assert (= bs!18123 d!74107))

(declare-fun m!338913 () Bool)

(assert (=> bs!18123 m!338913))

(assert (=> start!45422 d!74107))

(declare-fun d!74109 () Bool)

(declare-fun res!185489 () Bool)

(declare-fun e!149538 () Bool)

(assert (=> d!74109 (=> (not res!185489) (not e!149538))))

(assert (=> d!74109 (= res!185489 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62)))))))))

(assert (=> d!74109 (= (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) e!149538)))

(declare-fun b!220190 () Bool)

(declare-fun lt!347936 () (_ BitVec 64))

(assert (=> b!220190 (= e!149538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!347936) (bvsle lt!347936 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220190 (= lt!347936 (bvadd (bitIndex!0 (size!4713 (buf!5260 bs!62)) (currentByte!9869 bs!62) (currentBit!9864 bs!62)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!74109 res!185489) b!220190))

(declare-fun m!338921 () Bool)

(assert (=> b!220190 m!338921))

(assert (=> b!220182 d!74109))

(declare-fun d!74123 () Bool)

(declare-datatypes ((tuple2!18810 0))(
  ( (tuple2!18811 (_1!10063 Bool) (_2!10063 BitStream!8534)) )
))
(declare-fun lt!347939 () tuple2!18810)

(declare-fun readBit!0 (BitStream!8534) tuple2!18810)

(assert (=> d!74123 (= lt!347939 (readBit!0 bs!62))))

(assert (=> d!74123 (= (readBitPure!0 bs!62) (tuple2!18803 (_2!10063 lt!347939) (_1!10063 lt!347939)))))

(declare-fun bs!18128 () Bool)

(assert (= bs!18128 d!74123))

(declare-fun m!338927 () Bool)

(assert (=> bs!18128 m!338927))

(assert (=> b!220182 d!74123))

(declare-datatypes ((tuple2!18812 0))(
  ( (tuple2!18813 (_1!10064 (_ BitVec 64)) (_2!10064 BitStream!8534)) )
))
(declare-fun lt!347942 () tuple2!18812)

(declare-fun d!74127 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8534 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18812)

(assert (=> d!74127 (= lt!347942 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74127 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18805 (_2!10064 lt!347942) (_1!10064 lt!347942)))))

(declare-fun bs!18129 () Bool)

(assert (= bs!18129 d!74127))

(declare-fun m!338929 () Bool)

(assert (=> bs!18129 m!338929))

(assert (=> b!220182 d!74127))

(declare-fun d!74129 () Bool)

(assert (=> d!74129 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220181 d!74129))

(declare-fun d!74131 () Bool)

(assert (=> d!74131 (= (array_inv!4454 (buf!5260 bs!62)) (bvsge (size!4713 (buf!5260 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220180 d!74131))

(declare-fun d!74135 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74135 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) ((_ sign_extend 32) (currentByte!9869 bs!62)) ((_ sign_extend 32) (currentBit!9864 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) ((_ sign_extend 32) (currentByte!9869 bs!62)) ((_ sign_extend 32) (currentBit!9864 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18130 () Bool)

(assert (= bs!18130 d!74135))

(declare-fun m!338933 () Bool)

(assert (=> bs!18130 m!338933))

(assert (=> b!220179 d!74135))

(push 1)

(assert (not d!74123))

(assert (not b!220190))

(assert (not d!74107))

(assert (not d!74135))

(assert (not d!74127))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74151 () Bool)

(assert (=> d!74151 (= (invariant!0 (currentBit!9864 bs!62) (currentByte!9869 bs!62) (size!4713 (buf!5260 bs!62))) (and (bvsge (currentBit!9864 bs!62) #b00000000000000000000000000000000) (bvslt (currentBit!9864 bs!62) #b00000000000000000000000000001000) (bvsge (currentByte!9869 bs!62) #b00000000000000000000000000000000) (or (bvslt (currentByte!9869 bs!62) (size!4713 (buf!5260 bs!62))) (and (= (currentBit!9864 bs!62) #b00000000000000000000000000000000) (= (currentByte!9869 bs!62) (size!4713 (buf!5260 bs!62)))))))))

(assert (=> d!74107 d!74151))

(declare-fun d!74153 () Bool)

(assert (=> d!74153 (= (remainingBits!0 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) ((_ sign_extend 32) (currentByte!9869 bs!62)) ((_ sign_extend 32) (currentBit!9864 bs!62))) (bvsub (bvmul ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!9869 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9864 bs!62)))))))

(assert (=> d!74135 d!74153))

(declare-fun d!74155 () Bool)

(declare-fun e!149559 () Bool)

(assert (=> d!74155 e!149559))

(declare-fun res!185524 () Bool)

(assert (=> d!74155 (=> (not res!185524) (not e!149559))))

(declare-fun lt!348022 () (_ BitVec 64))

(declare-fun lt!348023 () (_ BitVec 64))

(declare-fun lt!348019 () (_ BitVec 64))

(assert (=> d!74155 (= res!185524 (= lt!348023 (bvsub lt!348019 lt!348022)))))

(assert (=> d!74155 (or (= (bvand lt!348019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348022 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!348019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!348019 lt!348022) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74155 (= lt!348022 (remainingBits!0 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) ((_ sign_extend 32) (currentByte!9869 bs!62)) ((_ sign_extend 32) (currentBit!9864 bs!62))))))

(declare-fun lt!348021 () (_ BitVec 64))

(declare-fun lt!348020 () (_ BitVec 64))

(assert (=> d!74155 (= lt!348019 (bvmul lt!348021 lt!348020))))

(assert (=> d!74155 (or (= lt!348021 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!348020 (bvsdiv (bvmul lt!348021 lt!348020) lt!348021)))))

(assert (=> d!74155 (= lt!348020 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!74155 (= lt!348021 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))))))

(assert (=> d!74155 (= lt!348023 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9869 bs!62)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9864 bs!62))))))

(assert (=> d!74155 (invariant!0 (currentBit!9864 bs!62) (currentByte!9869 bs!62) (size!4713 (buf!5260 bs!62)))))

(assert (=> d!74155 (= (bitIndex!0 (size!4713 (buf!5260 bs!62)) (currentByte!9869 bs!62) (currentBit!9864 bs!62)) lt!348023)))

(declare-fun b!220232 () Bool)

(declare-fun res!185525 () Bool)

(assert (=> b!220232 (=> (not res!185525) (not e!149559))))

(assert (=> b!220232 (= res!185525 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!348023))))

(declare-fun b!220233 () Bool)

(declare-fun lt!348018 () (_ BitVec 64))

(assert (=> b!220233 (= e!149559 (bvsle lt!348023 (bvmul lt!348018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!220233 (or (= lt!348018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!348018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!348018)))))

(assert (=> b!220233 (= lt!348018 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))))))

(assert (= (and d!74155 res!185524) b!220232))

(assert (= (and b!220232 res!185525) b!220233))

(assert (=> d!74155 m!338933))

(assert (=> d!74155 m!338913))

(assert (=> b!220190 d!74155))

(declare-fun d!74161 () Bool)

(declare-fun e!149581 () Bool)

(assert (=> d!74161 e!149581))

(declare-fun res!185545 () Bool)

(assert (=> d!74161 (=> (not res!185545) (not e!149581))))

(declare-datatypes ((Unit!15581 0))(
  ( (Unit!15582) )
))
(declare-datatypes ((tuple2!18822 0))(
  ( (tuple2!18823 (_1!10069 Unit!15581) (_2!10069 BitStream!8534)) )
))
(declare-fun increaseBitIndex!0 (BitStream!8534) tuple2!18822)

(assert (=> d!74161 (= res!185545 (= (buf!5260 (_2!10069 (increaseBitIndex!0 bs!62))) (buf!5260 bs!62)))))

(declare-fun lt!348073 () Bool)

(assert (=> d!74161 (= lt!348073 (not (= (bvand ((_ sign_extend 24) (select (arr!5643 (buf!5260 bs!62)) (currentByte!9869 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9864 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348075 () tuple2!18810)

(assert (=> d!74161 (= lt!348075 (tuple2!18811 (not (= (bvand ((_ sign_extend 24) (select (arr!5643 (buf!5260 bs!62)) (currentByte!9869 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9864 bs!62)))) #b00000000000000000000000000000000)) (_2!10069 (increaseBitIndex!0 bs!62))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!74161 (validate_offset_bit!0 ((_ sign_extend 32) (size!4713 (buf!5260 bs!62))) ((_ sign_extend 32) (currentByte!9869 bs!62)) ((_ sign_extend 32) (currentBit!9864 bs!62)))))

(assert (=> d!74161 (= (readBit!0 bs!62) lt!348075)))

(declare-fun lt!348076 () (_ BitVec 64))

(declare-fun b!220259 () Bool)

(declare-fun lt!348070 () (_ BitVec 64))

(assert (=> b!220259 (= e!149581 (= (bitIndex!0 (size!4713 (buf!5260 (_2!10069 (increaseBitIndex!0 bs!62)))) (currentByte!9869 (_2!10069 (increaseBitIndex!0 bs!62))) (currentBit!9864 (_2!10069 (increaseBitIndex!0 bs!62)))) (bvadd lt!348070 lt!348076)))))

(assert (=> b!220259 (or (not (= (bvand lt!348070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348076 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348070 lt!348076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220259 (= lt!348076 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!220259 (= lt!348070 (bitIndex!0 (size!4713 (buf!5260 bs!62)) (currentByte!9869 bs!62) (currentBit!9864 bs!62)))))

(declare-fun lt!348071 () Bool)

(assert (=> b!220259 (= lt!348071 (not (= (bvand ((_ sign_extend 24) (select (arr!5643 (buf!5260 bs!62)) (currentByte!9869 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9864 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348074 () Bool)

(assert (=> b!220259 (= lt!348074 (not (= (bvand ((_ sign_extend 24) (select (arr!5643 (buf!5260 bs!62)) (currentByte!9869 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9864 bs!62)))) #b00000000000000000000000000000000)))))

(declare-fun lt!348072 () Bool)

(assert (=> b!220259 (= lt!348072 (not (= (bvand ((_ sign_extend 24) (select (arr!5643 (buf!5260 bs!62)) (currentByte!9869 bs!62))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!9864 bs!62)))) #b00000000000000000000000000000000)))))

(assert (= (and d!74161 res!185545) b!220259))

(declare-fun m!338957 () Bool)

(assert (=> d!74161 m!338957))

(declare-fun m!338959 () Bool)

(assert (=> d!74161 m!338959))

(declare-fun m!338961 () Bool)

(assert (=> d!74161 m!338961))

(declare-fun m!338963 () Bool)

(assert (=> d!74161 m!338963))

(assert (=> b!220259 m!338957))

(declare-fun m!338965 () Bool)

(assert (=> b!220259 m!338965))

(assert (=> b!220259 m!338961))

(assert (=> b!220259 m!338921))

(assert (=> b!220259 m!338959))

(assert (=> d!74123 d!74161))

(declare-fun b!220278 () Bool)

(declare-fun e!149598 () tuple2!18812)

(declare-fun lt!348118 () tuple2!18812)

(assert (=> b!220278 (= e!149598 (tuple2!18813 (_1!10064 lt!348118) (_2!10064 lt!348118)))))

(declare-fun lt!348119 () tuple2!18810)

(assert (=> b!220278 (= lt!348119 (readBit!0 bs!62))))

(assert (=> b!220278 (= lt!348118 (readNBitsLSBFirstsLoop!0 (_2!10063 lt!348119) nBits!265 (bvadd i!541 #b00000000000000000000000000000001) (bvor acc!113 (ite (_1!10063 lt!348119) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!74165 () Bool)

(declare-fun e!149597 () Bool)

(assert (=> d!74165 e!149597))

(declare-fun res!185563 () Bool)

(assert (=> d!74165 (=> (not res!185563) (not e!149597))))

(declare-fun lt!348122 () tuple2!18812)

(assert (=> d!74165 (= res!185563 (= (buf!5260 (_2!10064 lt!348122)) (buf!5260 bs!62)))))

(assert (=> d!74165 (= lt!348122 e!149598)))

(declare-fun c!10667 () Bool)

(assert (=> d!74165 (= c!10667 (= nBits!265 i!541))))

(assert (=> d!74165 (and (bvsle #b00000000000000000000000000000000 i!541) (bvsle i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000))))

(assert (=> d!74165 (= (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113) lt!348122)))

(declare-fun b!220279 () Bool)

(declare-fun res!185561 () Bool)

(assert (=> b!220279 (=> (not res!185561) (not e!149597))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220279 (= res!185561 (= (bvand (_1!10064 lt!348122) (onesLSBLong!0 nBits!265)) (_1!10064 lt!348122)))))

(declare-fun b!220280 () Bool)

(assert (=> b!220280 (= e!149598 (tuple2!18813 acc!113 bs!62))))

(declare-fun b!220281 () Bool)

(declare-fun res!185564 () Bool)

(assert (=> b!220281 (=> (not res!185564) (not e!149597))))

(declare-fun lt!348120 () (_ BitVec 64))

(declare-fun lt!348121 () (_ BitVec 64))

(assert (=> b!220281 (= res!185564 (= (bitIndex!0 (size!4713 (buf!5260 (_2!10064 lt!348122))) (currentByte!9869 (_2!10064 lt!348122)) (currentBit!9864 (_2!10064 lt!348122))) (bvadd lt!348121 lt!348120)))))

(assert (=> b!220281 (or (not (= (bvand lt!348121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!348120 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348121 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348121 lt!348120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!220281 (= lt!348120 ((_ sign_extend 32) (bvsub nBits!265 i!541)))))

(assert (=> b!220281 (or (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand i!541 #b10000000000000000000000000000000)) (= (bvand nBits!265 #b10000000000000000000000000000000) (bvand (bvsub nBits!265 i!541) #b10000000000000000000000000000000)))))

(assert (=> b!220281 (= lt!348121 (bitIndex!0 (size!4713 (buf!5260 bs!62)) (currentByte!9869 bs!62) (currentBit!9864 bs!62)))))

(declare-fun b!220282 () Bool)

(declare-fun res!185562 () Bool)

(assert (=> b!220282 (=> (not res!185562) (not e!149597))))

(assert (=> b!220282 (= res!185562 (= (bvand (_1!10064 lt!348122) (onesLSBLong!0 i!541)) (bvand acc!113 (onesLSBLong!0 i!541))))))

(declare-fun b!220283 () Bool)

(declare-fun lt!348117 () (_ BitVec 64))

(declare-fun e!149596 () Bool)

(assert (=> b!220283 (= e!149596 (= (= (bvand (bvlshr (_1!10064 lt!348122) lt!348117) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!10059 (readBitPure!0 bs!62))))))

(assert (=> b!220283 (and (bvsge lt!348117 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!348117 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!220283 (= lt!348117 ((_ sign_extend 32) i!541))))

(declare-fun b!220284 () Bool)

(assert (=> b!220284 (= e!149597 e!149596)))

(declare-fun res!185560 () Bool)

(assert (=> b!220284 (=> res!185560 e!149596)))

(assert (=> b!220284 (= res!185560 (not (bvslt i!541 nBits!265)))))

(assert (= (and d!74165 c!10667) b!220280))

(assert (= (and d!74165 (not c!10667)) b!220278))

(assert (= (and d!74165 res!185563) b!220281))

(assert (= (and b!220281 res!185564) b!220282))

(assert (= (and b!220282 res!185562) b!220279))

(assert (= (and b!220279 res!185561) b!220284))

(assert (= (and b!220284 (not res!185560)) b!220283))

(assert (=> b!220283 m!338907))

(declare-fun m!338987 () Bool)

(assert (=> b!220282 m!338987))

(declare-fun m!338989 () Bool)

(assert (=> b!220279 m!338989))

(declare-fun m!338991 () Bool)

(assert (=> b!220281 m!338991))

(assert (=> b!220281 m!338921))

(assert (=> b!220278 m!338927))

(declare-fun m!338993 () Bool)

(assert (=> b!220278 m!338993))

(assert (=> d!74127 d!74165))

(push 1)

(assert (not b!220281))

(assert (not b!220278))

(assert (not b!220282))

(assert (not b!220283))

(assert (not b!220279))

(assert (not d!74161))

(assert (not b!220259))

(assert (not d!74155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

