; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20020 () Bool)

(assert start!20020)

(declare-fun b!100155 () Bool)

(declare-fun e!65544 () Bool)

(declare-fun e!65549 () Bool)

(assert (=> b!100155 (= e!65544 e!65549)))

(declare-fun res!82241 () Bool)

(assert (=> b!100155 (=> (not res!82241) (not e!65549))))

(declare-fun lt!144815 () (_ BitVec 64))

(declare-fun lt!144816 () (_ BitVec 64))

(assert (=> b!100155 (= res!82241 (= lt!144815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144816)))))

(declare-datatypes ((array!4719 0))(
  ( (array!4720 (arr!2748 (Array (_ BitVec 32) (_ BitVec 8))) (size!2155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3784 0))(
  ( (BitStream!3785 (buf!2512 array!4719) (currentByte!4958 (_ BitVec 32)) (currentBit!4953 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6137 0))(
  ( (Unit!6138) )
))
(declare-datatypes ((tuple2!8086 0))(
  ( (tuple2!8087 (_1!4298 Unit!6137) (_2!4298 BitStream!3784)) )
))
(declare-fun lt!144821 () tuple2!8086)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100155 (= lt!144815 (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))))))

(declare-fun thiss!1305 () BitStream!3784)

(assert (=> b!100155 (= lt!144816 (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(declare-fun res!82244 () Bool)

(declare-fun e!65545 () Bool)

(assert (=> start!20020 (=> (not res!82244) (not e!65545))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20020 (= res!82244 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20020 e!65545))

(assert (=> start!20020 true))

(declare-fun e!65550 () Bool)

(declare-fun inv!12 (BitStream!3784) Bool)

(assert (=> start!20020 (and (inv!12 thiss!1305) e!65550)))

(declare-fun b!100156 () Bool)

(declare-fun res!82236 () Bool)

(declare-fun e!65547 () Bool)

(assert (=> b!100156 (=> (not res!82236) (not e!65547))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100156 (= res!82236 (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(declare-fun b!100157 () Bool)

(declare-fun lt!144825 () tuple2!8086)

(assert (=> b!100157 (= e!65547 (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144825)))))))

(declare-fun b!100158 () Bool)

(declare-fun res!82239 () Bool)

(assert (=> b!100158 (=> (not res!82239) (not e!65545))))

(assert (=> b!100158 (= res!82239 (bvslt i!615 nBits!396))))

(declare-fun b!100159 () Bool)

(declare-fun res!82237 () Bool)

(assert (=> b!100159 (=> (not res!82237) (not e!65545))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100159 (= res!82237 (validate_offset_bits!1 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))) ((_ sign_extend 32) (currentByte!4958 thiss!1305)) ((_ sign_extend 32) (currentBit!4953 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100160 () Bool)

(declare-fun res!82234 () Bool)

(assert (=> b!100160 (=> (not res!82234) (not e!65549))))

(declare-fun isPrefixOf!0 (BitStream!3784 BitStream!3784) Bool)

(assert (=> b!100160 (= res!82234 (isPrefixOf!0 thiss!1305 (_2!4298 lt!144821)))))

(declare-fun b!100161 () Bool)

(declare-fun e!65548 () Bool)

(declare-datatypes ((tuple2!8088 0))(
  ( (tuple2!8089 (_1!4299 BitStream!3784) (_2!4299 Bool)) )
))
(declare-fun lt!144817 () tuple2!8088)

(assert (=> b!100161 (= e!65548 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!144817))) (currentByte!4958 (_1!4299 lt!144817)) (currentBit!4953 (_1!4299 lt!144817))) lt!144815))))

(declare-fun b!100162 () Bool)

(assert (=> b!100162 (= e!65545 (not (isPrefixOf!0 (_2!4298 lt!144821) (_2!4298 lt!144825))))))

(declare-datatypes ((tuple2!8090 0))(
  ( (tuple2!8091 (_1!4300 BitStream!3784) (_2!4300 BitStream!3784)) )
))
(declare-fun lt!144818 () tuple2!8090)

(declare-fun reader!0 (BitStream!3784 BitStream!3784) tuple2!8090)

(assert (=> b!100162 (= lt!144818 (reader!0 thiss!1305 (_2!4298 lt!144825)))))

(declare-fun e!65543 () Bool)

(assert (=> b!100162 e!65543))

(declare-fun res!82242 () Bool)

(assert (=> b!100162 (=> (not res!82242) (not e!65543))))

(declare-fun lt!144820 () tuple2!8088)

(declare-fun lt!144824 () tuple2!8088)

(assert (=> b!100162 (= res!82242 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!144820))) (currentByte!4958 (_1!4299 lt!144820)) (currentBit!4953 (_1!4299 lt!144820))) (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!144824))) (currentByte!4958 (_1!4299 lt!144824)) (currentBit!4953 (_1!4299 lt!144824)))))))

(declare-fun lt!144823 () Unit!6137)

(declare-fun lt!144822 () BitStream!3784)

(declare-fun readBitPrefixLemma!0 (BitStream!3784 BitStream!3784) Unit!6137)

(assert (=> b!100162 (= lt!144823 (readBitPrefixLemma!0 lt!144822 (_2!4298 lt!144825)))))

(declare-fun readBitPure!0 (BitStream!3784) tuple2!8088)

(assert (=> b!100162 (= lt!144824 (readBitPure!0 (BitStream!3785 (buf!2512 (_2!4298 lt!144825)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305))))))

(assert (=> b!100162 (= lt!144820 (readBitPure!0 lt!144822))))

(assert (=> b!100162 (= lt!144822 (BitStream!3785 (buf!2512 (_2!4298 lt!144821)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(assert (=> b!100162 e!65547))

(declare-fun res!82240 () Bool)

(assert (=> b!100162 (=> (not res!82240) (not e!65547))))

(assert (=> b!100162 (= res!82240 (isPrefixOf!0 thiss!1305 (_2!4298 lt!144825)))))

(declare-fun lt!144826 () Unit!6137)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3784 BitStream!3784 BitStream!3784) Unit!6137)

(assert (=> b!100162 (= lt!144826 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4298 lt!144821) (_2!4298 lt!144825)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3784 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8086)

(assert (=> b!100162 (= lt!144825 (appendNLeastSignificantBitsLoop!0 (_2!4298 lt!144821) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!100162 e!65544))

(declare-fun res!82238 () Bool)

(assert (=> b!100162 (=> (not res!82238) (not e!65544))))

(assert (=> b!100162 (= res!82238 (= (size!2155 (buf!2512 thiss!1305)) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(declare-fun lt!144819 () Bool)

(declare-fun appendBit!0 (BitStream!3784 Bool) tuple2!8086)

(assert (=> b!100162 (= lt!144821 (appendBit!0 thiss!1305 lt!144819))))

(assert (=> b!100162 (= lt!144819 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100163 () Bool)

(declare-fun array_inv!1957 (array!4719) Bool)

(assert (=> b!100163 (= e!65550 (array_inv!1957 (buf!2512 thiss!1305)))))

(declare-fun b!100164 () Bool)

(assert (=> b!100164 (= e!65549 e!65548)))

(declare-fun res!82243 () Bool)

(assert (=> b!100164 (=> (not res!82243) (not e!65548))))

(assert (=> b!100164 (= res!82243 (and (= (_2!4299 lt!144817) lt!144819) (= (_1!4299 lt!144817) (_2!4298 lt!144821))))))

(declare-fun readerFrom!0 (BitStream!3784 (_ BitVec 32) (_ BitVec 32)) BitStream!3784)

(assert (=> b!100164 (= lt!144817 (readBitPure!0 (readerFrom!0 (_2!4298 lt!144821) (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305))))))

(declare-fun b!100165 () Bool)

(assert (=> b!100165 (= e!65543 (= (_2!4299 lt!144820) (_2!4299 lt!144824)))))

(declare-fun b!100166 () Bool)

(declare-fun res!82235 () Bool)

(assert (=> b!100166 (=> (not res!82235) (not e!65545))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100166 (= res!82235 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!20020 res!82244) b!100159))

(assert (= (and b!100159 res!82237) b!100166))

(assert (= (and b!100166 res!82235) b!100158))

(assert (= (and b!100158 res!82239) b!100162))

(assert (= (and b!100162 res!82238) b!100155))

(assert (= (and b!100155 res!82241) b!100160))

(assert (= (and b!100160 res!82234) b!100164))

(assert (= (and b!100164 res!82243) b!100161))

(assert (= (and b!100162 res!82240) b!100156))

(assert (= (and b!100156 res!82236) b!100157))

(assert (= (and b!100162 res!82242) b!100165))

(assert (= start!20020 b!100163))

(declare-fun m!145525 () Bool)

(assert (=> b!100155 m!145525))

(declare-fun m!145527 () Bool)

(assert (=> b!100155 m!145527))

(declare-fun m!145529 () Bool)

(assert (=> b!100161 m!145529))

(declare-fun m!145531 () Bool)

(assert (=> b!100166 m!145531))

(declare-fun m!145533 () Bool)

(assert (=> b!100162 m!145533))

(declare-fun m!145535 () Bool)

(assert (=> b!100162 m!145535))

(declare-fun m!145537 () Bool)

(assert (=> b!100162 m!145537))

(declare-fun m!145539 () Bool)

(assert (=> b!100162 m!145539))

(declare-fun m!145541 () Bool)

(assert (=> b!100162 m!145541))

(declare-fun m!145543 () Bool)

(assert (=> b!100162 m!145543))

(declare-fun m!145545 () Bool)

(assert (=> b!100162 m!145545))

(declare-fun m!145547 () Bool)

(assert (=> b!100162 m!145547))

(declare-fun m!145549 () Bool)

(assert (=> b!100162 m!145549))

(declare-fun m!145551 () Bool)

(assert (=> b!100162 m!145551))

(declare-fun m!145553 () Bool)

(assert (=> b!100162 m!145553))

(declare-fun m!145555 () Bool)

(assert (=> b!100163 m!145555))

(declare-fun m!145557 () Bool)

(assert (=> b!100159 m!145557))

(declare-fun m!145559 () Bool)

(assert (=> b!100160 m!145559))

(declare-fun m!145561 () Bool)

(assert (=> start!20020 m!145561))

(declare-fun m!145563 () Bool)

(assert (=> b!100156 m!145563))

(declare-fun m!145565 () Bool)

(assert (=> b!100164 m!145565))

(assert (=> b!100164 m!145565))

(declare-fun m!145567 () Bool)

(assert (=> b!100164 m!145567))

(declare-fun m!145569 () Bool)

(assert (=> b!100157 m!145569))

(push 1)

(assert (not b!100164))

(assert (not b!100156))

(assert (not b!100160))

(assert (not b!100162))

(assert (not b!100159))

(assert (not b!100163))

(assert (not b!100161))

(assert (not b!100155))

(assert (not b!100166))

(assert (not start!20020))

(assert (not b!100157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31398 () Bool)

(assert (=> d!31398 (= (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144825)))) (and (bvsge (currentBit!4953 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4953 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4958 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144825)))) (and (= (currentBit!4953 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144825))))))))))

(assert (=> b!100157 d!31398))

(declare-fun d!31400 () Bool)

(assert (=> d!31400 (= (array_inv!1957 (buf!2512 thiss!1305)) (bvsge (size!2155 (buf!2512 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!100163 d!31400))

(declare-fun d!31402 () Bool)

(assert (=> d!31402 (= (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144821)))) (and (bvsge (currentBit!4953 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4953 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4958 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144821)))) (and (= (currentBit!4953 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144821))))))))))

(assert (=> b!100156 d!31402))

(declare-fun d!31404 () Bool)

(declare-fun e!65611 () Bool)

(assert (=> d!31404 e!65611))

(declare-fun res!82330 () Bool)

(assert (=> d!31404 (=> (not res!82330) (not e!65611))))

(declare-fun lt!144955 () (_ BitVec 64))

(declare-fun lt!144950 () (_ BitVec 64))

(declare-fun lt!144954 () (_ BitVec 64))

(assert (=> d!31404 (= res!82330 (= lt!144954 (bvsub lt!144950 lt!144955)))))

(assert (=> d!31404 (or (= (bvand lt!144950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144955 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144950 lt!144955) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31404 (= lt!144955 (remainingBits!0 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144817)))) ((_ sign_extend 32) (currentByte!4958 (_1!4299 lt!144817))) ((_ sign_extend 32) (currentBit!4953 (_1!4299 lt!144817)))))))

(declare-fun lt!144952 () (_ BitVec 64))

(declare-fun lt!144951 () (_ BitVec 64))

(assert (=> d!31404 (= lt!144950 (bvmul lt!144952 lt!144951))))

(assert (=> d!31404 (or (= lt!144952 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144951 (bvsdiv (bvmul lt!144952 lt!144951) lt!144952)))))

(assert (=> d!31404 (= lt!144951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31404 (= lt!144952 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144817)))))))

(assert (=> d!31404 (= lt!144954 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4958 (_1!4299 lt!144817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4953 (_1!4299 lt!144817)))))))

(assert (=> d!31404 (invariant!0 (currentBit!4953 (_1!4299 lt!144817)) (currentByte!4958 (_1!4299 lt!144817)) (size!2155 (buf!2512 (_1!4299 lt!144817))))))

(assert (=> d!31404 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!144817))) (currentByte!4958 (_1!4299 lt!144817)) (currentBit!4953 (_1!4299 lt!144817))) lt!144954)))

(declare-fun b!100257 () Bool)

(declare-fun res!82331 () Bool)

(assert (=> b!100257 (=> (not res!82331) (not e!65611))))

(assert (=> b!100257 (= res!82331 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144954))))

(declare-fun b!100258 () Bool)

(declare-fun lt!144953 () (_ BitVec 64))

(assert (=> b!100258 (= e!65611 (bvsle lt!144954 (bvmul lt!144953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100258 (or (= lt!144953 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144953 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144953)))))

(assert (=> b!100258 (= lt!144953 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144817)))))))

(assert (= (and d!31404 res!82330) b!100257))

(assert (= (and b!100257 res!82331) b!100258))

(declare-fun m!145685 () Bool)

(assert (=> d!31404 m!145685))

(declare-fun m!145687 () Bool)

(assert (=> d!31404 m!145687))

(assert (=> b!100161 d!31404))

(declare-fun d!31414 () Bool)

(assert (=> d!31414 (isPrefixOf!0 thiss!1305 (_2!4298 lt!144825))))

(declare-fun lt!144958 () Unit!6137)

(declare-fun choose!30 (BitStream!3784 BitStream!3784 BitStream!3784) Unit!6137)

(assert (=> d!31414 (= lt!144958 (choose!30 thiss!1305 (_2!4298 lt!144821) (_2!4298 lt!144825)))))

(assert (=> d!31414 (isPrefixOf!0 thiss!1305 (_2!4298 lt!144821))))

(assert (=> d!31414 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4298 lt!144821) (_2!4298 lt!144825)) lt!144958)))

(declare-fun bs!7709 () Bool)

(assert (= bs!7709 d!31414))

(assert (=> bs!7709 m!145539))

(declare-fun m!145689 () Bool)

(assert (=> bs!7709 m!145689))

(assert (=> bs!7709 m!145559))

(assert (=> b!100162 d!31414))

(declare-fun b!100343 () Bool)

(declare-fun res!82408 () Bool)

(declare-fun e!65663 () Bool)

(assert (=> b!100343 (=> (not res!82408) (not e!65663))))

(declare-fun lt!145183 () tuple2!8086)

(declare-fun lt!145181 () (_ BitVec 64))

(declare-fun lt!145204 () (_ BitVec 64))

(assert (=> b!100343 (= res!82408 (= (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145183))) (currentByte!4958 (_2!4298 lt!145183)) (currentBit!4953 (_2!4298 lt!145183))) (bvadd lt!145204 lt!145181)))))

(assert (=> b!100343 (or (not (= (bvand lt!145204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145181 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!145204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!145204 lt!145181) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100343 (= lt!145181 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100343 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100343 (= lt!145204 (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))))))

(declare-fun b!100344 () Bool)

(declare-fun e!65659 () Bool)

(declare-fun lt!145195 () tuple2!8088)

(declare-fun lt!145196 () tuple2!8086)

(assert (=> b!100344 (= e!65659 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!145195))) (currentByte!4958 (_1!4299 lt!145195)) (currentBit!4953 (_1!4299 lt!145195))) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145196))) (currentByte!4958 (_2!4298 lt!145196)) (currentBit!4953 (_2!4298 lt!145196)))))))

(declare-fun b!100345 () Bool)

(declare-fun res!82406 () Bool)

(assert (=> b!100345 (= res!82406 (= (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145196))) (currentByte!4958 (_2!4298 lt!145196)) (currentBit!4953 (_2!4298 lt!145196))) (bvadd (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!65657 () Bool)

(assert (=> b!100345 (=> (not res!82406) (not e!65657))))

(declare-fun b!100346 () Bool)

(declare-fun e!65661 () Bool)

(declare-fun lt!145209 () (_ BitVec 64))

(assert (=> b!100346 (= e!65661 (validate_offset_bits!1 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!144821)))) ((_ sign_extend 32) (currentByte!4958 (_2!4298 lt!144821))) ((_ sign_extend 32) (currentBit!4953 (_2!4298 lt!144821))) lt!145209))))

(declare-datatypes ((tuple2!8104 0))(
  ( (tuple2!8105 (_1!4307 BitStream!3784) (_2!4307 (_ BitVec 64))) )
))
(declare-fun lt!145184 () tuple2!8104)

(declare-fun b!100347 () Bool)

(declare-fun lt!145208 () tuple2!8090)

(assert (=> b!100347 (= e!65663 (and (= (_2!4307 lt!145184) v!199) (= (_1!4307 lt!145184) (_2!4300 lt!145208))))))

(declare-fun lt!145206 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8104)

(assert (=> b!100347 (= lt!145184 (readNLeastSignificantBitsLoopPure!0 (_1!4300 lt!145208) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145206))))

(declare-fun lt!145213 () Unit!6137)

(declare-fun lt!145197 () Unit!6137)

(assert (=> b!100347 (= lt!145213 lt!145197)))

(assert (=> b!100347 (validate_offset_bits!1 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!145183)))) ((_ sign_extend 32) (currentByte!4958 (_2!4298 lt!144821))) ((_ sign_extend 32) (currentBit!4953 (_2!4298 lt!144821))) lt!145209)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3784 array!4719 (_ BitVec 64)) Unit!6137)

(assert (=> b!100347 (= lt!145197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4298 lt!144821) (buf!2512 (_2!4298 lt!145183)) lt!145209))))

(assert (=> b!100347 e!65661))

(declare-fun res!82402 () Bool)

(assert (=> b!100347 (=> (not res!82402) (not e!65661))))

(assert (=> b!100347 (= res!82402 (and (= (size!2155 (buf!2512 (_2!4298 lt!144821))) (size!2155 (buf!2512 (_2!4298 lt!145183)))) (bvsge lt!145209 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100347 (= lt!145209 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100347 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100347 (= lt!145206 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!100347 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100347 (= lt!145208 (reader!0 (_2!4298 lt!144821) (_2!4298 lt!145183)))))

(declare-fun b!100348 () Bool)

(declare-fun e!65660 () tuple2!8086)

(declare-fun lt!145194 () Unit!6137)

(assert (=> b!100348 (= e!65660 (tuple2!8087 lt!145194 (_2!4298 lt!144821)))))

(declare-fun lt!145193 () BitStream!3784)

(assert (=> b!100348 (= lt!145193 (_2!4298 lt!144821))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3784) Unit!6137)

(assert (=> b!100348 (= lt!145194 (lemmaIsPrefixRefl!0 lt!145193))))

(declare-fun call!1249 () Bool)

(assert (=> b!100348 call!1249))

(declare-fun d!31416 () Bool)

(assert (=> d!31416 e!65663))

(declare-fun res!82403 () Bool)

(assert (=> d!31416 (=> (not res!82403) (not e!65663))))

(assert (=> d!31416 (= res!82403 (= (size!2155 (buf!2512 (_2!4298 lt!144821))) (size!2155 (buf!2512 (_2!4298 lt!145183)))))))

(assert (=> d!31416 (= lt!145183 e!65660)))

(declare-fun c!6277 () Bool)

(assert (=> d!31416 (= c!6277 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31416 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31416 (= (appendNLeastSignificantBitsLoop!0 (_2!4298 lt!144821) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!145183)))

(declare-fun b!100349 () Bool)

(declare-fun e!65662 () (_ BitVec 64))

(assert (=> b!100349 (= e!65662 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!100350 () Bool)

(declare-fun e!65658 () Bool)

(declare-fun lt!145212 () tuple2!8088)

(declare-fun lt!145216 () tuple2!8088)

(assert (=> b!100350 (= e!65658 (= (_2!4299 lt!145212) (_2!4299 lt!145216)))))

(declare-fun b!100351 () Bool)

(declare-fun res!82409 () Bool)

(assert (=> b!100351 (=> (not res!82409) (not e!65663))))

(assert (=> b!100351 (= res!82409 (isPrefixOf!0 (_2!4298 lt!144821) (_2!4298 lt!145183)))))

(declare-fun lt!145203 () tuple2!8086)

(declare-fun bm!1246 () Bool)

(assert (=> bm!1246 (= call!1249 (isPrefixOf!0 (ite c!6277 (_2!4298 lt!144821) lt!145193) (ite c!6277 (_2!4298 lt!145203) lt!145193)))))

(declare-fun b!100352 () Bool)

(declare-fun res!82401 () Bool)

(assert (=> b!100352 (= res!82401 (isPrefixOf!0 (_2!4298 lt!144821) (_2!4298 lt!145196)))))

(assert (=> b!100352 (=> (not res!82401) (not e!65657))))

(declare-fun b!100353 () Bool)

(declare-fun Unit!6143 () Unit!6137)

(assert (=> b!100353 (= e!65660 (tuple2!8087 Unit!6143 (_2!4298 lt!145203)))))

(declare-fun lt!145189 () Bool)

(assert (=> b!100353 (= lt!145189 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100353 (= lt!145196 (appendBit!0 (_2!4298 lt!144821) lt!145189))))

(declare-fun res!82405 () Bool)

(assert (=> b!100353 (= res!82405 (= (size!2155 (buf!2512 (_2!4298 lt!144821))) (size!2155 (buf!2512 (_2!4298 lt!145196)))))))

(assert (=> b!100353 (=> (not res!82405) (not e!65657))))

(assert (=> b!100353 e!65657))

(declare-fun lt!145180 () tuple2!8086)

(assert (=> b!100353 (= lt!145180 lt!145196)))

(assert (=> b!100353 (= lt!145203 (appendNLeastSignificantBitsLoop!0 (_2!4298 lt!145180) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!145177 () Unit!6137)

(assert (=> b!100353 (= lt!145177 (lemmaIsPrefixTransitive!0 (_2!4298 lt!144821) (_2!4298 lt!145180) (_2!4298 lt!145203)))))

(assert (=> b!100353 call!1249))

(declare-fun lt!145176 () Unit!6137)

(assert (=> b!100353 (= lt!145176 lt!145177)))

(assert (=> b!100353 (invariant!0 (currentBit!4953 (_2!4298 lt!144821)) (currentByte!4958 (_2!4298 lt!144821)) (size!2155 (buf!2512 (_2!4298 lt!145180))))))

(declare-fun lt!145199 () BitStream!3784)

(assert (=> b!100353 (= lt!145199 (BitStream!3785 (buf!2512 (_2!4298 lt!145180)) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))))))

(assert (=> b!100353 (invariant!0 (currentBit!4953 lt!145199) (currentByte!4958 lt!145199) (size!2155 (buf!2512 (_2!4298 lt!145203))))))

(declare-fun lt!145217 () BitStream!3784)

(assert (=> b!100353 (= lt!145217 (BitStream!3785 (buf!2512 (_2!4298 lt!145203)) (currentByte!4958 lt!145199) (currentBit!4953 lt!145199)))))

(assert (=> b!100353 (= lt!145212 (readBitPure!0 lt!145199))))

(assert (=> b!100353 (= lt!145216 (readBitPure!0 lt!145217))))

(declare-fun lt!145178 () Unit!6137)

(assert (=> b!100353 (= lt!145178 (readBitPrefixLemma!0 lt!145199 (_2!4298 lt!145203)))))

(declare-fun res!82404 () Bool)

(assert (=> b!100353 (= res!82404 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!145212))) (currentByte!4958 (_1!4299 lt!145212)) (currentBit!4953 (_1!4299 lt!145212))) (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!145216))) (currentByte!4958 (_1!4299 lt!145216)) (currentBit!4953 (_1!4299 lt!145216)))))))

(assert (=> b!100353 (=> (not res!82404) (not e!65658))))

(assert (=> b!100353 e!65658))

(declare-fun lt!145202 () Unit!6137)

(assert (=> b!100353 (= lt!145202 lt!145178)))

(declare-fun lt!145198 () tuple2!8090)

(assert (=> b!100353 (= lt!145198 (reader!0 (_2!4298 lt!144821) (_2!4298 lt!145203)))))

(declare-fun lt!145173 () tuple2!8090)

(assert (=> b!100353 (= lt!145173 (reader!0 (_2!4298 lt!145180) (_2!4298 lt!145203)))))

(declare-fun lt!145211 () tuple2!8088)

(assert (=> b!100353 (= lt!145211 (readBitPure!0 (_1!4300 lt!145198)))))

(assert (=> b!100353 (= (_2!4299 lt!145211) lt!145189)))

(declare-fun lt!145174 () Unit!6137)

(declare-fun Unit!6144 () Unit!6137)

(assert (=> b!100353 (= lt!145174 Unit!6144)))

(declare-fun lt!145200 () (_ BitVec 64))

(assert (=> b!100353 (= lt!145200 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!145175 () (_ BitVec 64))

(assert (=> b!100353 (= lt!145175 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!145187 () Unit!6137)

(assert (=> b!100353 (= lt!145187 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4298 lt!144821) (buf!2512 (_2!4298 lt!145203)) lt!145175))))

(assert (=> b!100353 (validate_offset_bits!1 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!145203)))) ((_ sign_extend 32) (currentByte!4958 (_2!4298 lt!144821))) ((_ sign_extend 32) (currentBit!4953 (_2!4298 lt!144821))) lt!145175)))

(declare-fun lt!145179 () Unit!6137)

(assert (=> b!100353 (= lt!145179 lt!145187)))

(declare-fun lt!145214 () tuple2!8104)

(assert (=> b!100353 (= lt!145214 (readNLeastSignificantBitsLoopPure!0 (_1!4300 lt!145198) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145200))))

(declare-fun lt!145185 () (_ BitVec 64))

(assert (=> b!100353 (= lt!145185 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!145182 () Unit!6137)

(assert (=> b!100353 (= lt!145182 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4298 lt!145180) (buf!2512 (_2!4298 lt!145203)) lt!145185))))

(assert (=> b!100353 (validate_offset_bits!1 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!145203)))) ((_ sign_extend 32) (currentByte!4958 (_2!4298 lt!145180))) ((_ sign_extend 32) (currentBit!4953 (_2!4298 lt!145180))) lt!145185)))

(declare-fun lt!145186 () Unit!6137)

(assert (=> b!100353 (= lt!145186 lt!145182)))

(declare-fun lt!145188 () tuple2!8104)

(assert (=> b!100353 (= lt!145188 (readNLeastSignificantBitsLoopPure!0 (_1!4300 lt!145173) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!145200 (ite (_2!4299 lt!145211) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!145201 () tuple2!8104)

(assert (=> b!100353 (= lt!145201 (readNLeastSignificantBitsLoopPure!0 (_1!4300 lt!145198) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145200))))

(declare-fun c!6278 () Bool)

(assert (=> b!100353 (= c!6278 (_2!4299 (readBitPure!0 (_1!4300 lt!145198))))))

(declare-fun lt!145207 () tuple2!8104)

(declare-fun withMovedBitIndex!0 (BitStream!3784 (_ BitVec 64)) BitStream!3784)

(assert (=> b!100353 (= lt!145207 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4300 lt!145198) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!145200 e!65662)))))

(declare-fun lt!145191 () Unit!6137)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6137)

(assert (=> b!100353 (= lt!145191 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4300 lt!145198) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145200))))

(assert (=> b!100353 (and (= (_2!4307 lt!145201) (_2!4307 lt!145207)) (= (_1!4307 lt!145201) (_1!4307 lt!145207)))))

(declare-fun lt!145192 () Unit!6137)

(assert (=> b!100353 (= lt!145192 lt!145191)))

(assert (=> b!100353 (= (_1!4300 lt!145198) (withMovedBitIndex!0 (_2!4300 lt!145198) (bvsub (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145203))) (currentByte!4958 (_2!4298 lt!145203)) (currentBit!4953 (_2!4298 lt!145203))))))))

(declare-fun lt!145215 () Unit!6137)

(declare-fun Unit!6145 () Unit!6137)

(assert (=> b!100353 (= lt!145215 Unit!6145)))

(assert (=> b!100353 (= (_1!4300 lt!145173) (withMovedBitIndex!0 (_2!4300 lt!145173) (bvsub (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145180))) (currentByte!4958 (_2!4298 lt!145180)) (currentBit!4953 (_2!4298 lt!145180))) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145203))) (currentByte!4958 (_2!4298 lt!145203)) (currentBit!4953 (_2!4298 lt!145203))))))))

(declare-fun lt!145190 () Unit!6137)

(declare-fun Unit!6146 () Unit!6137)

(assert (=> b!100353 (= lt!145190 Unit!6146)))

(assert (=> b!100353 (= (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))) (bvsub (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145180))) (currentByte!4958 (_2!4298 lt!145180)) (currentBit!4953 (_2!4298 lt!145180))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!145210 () Unit!6137)

(declare-fun Unit!6147 () Unit!6137)

(assert (=> b!100353 (= lt!145210 Unit!6147)))

(assert (=> b!100353 (= (_2!4307 lt!145214) (_2!4307 lt!145188))))

(declare-fun lt!145205 () Unit!6137)

(declare-fun Unit!6148 () Unit!6137)

(assert (=> b!100353 (= lt!145205 Unit!6148)))

(assert (=> b!100353 (= (_1!4307 lt!145214) (_2!4300 lt!145198))))

(declare-fun b!100354 () Bool)

(assert (=> b!100354 (= e!65662 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!100355 () Bool)

(assert (=> b!100355 (= lt!145195 (readBitPure!0 (readerFrom!0 (_2!4298 lt!145196) (currentBit!4953 (_2!4298 lt!144821)) (currentByte!4958 (_2!4298 lt!144821)))))))

(declare-fun res!82407 () Bool)

(assert (=> b!100355 (= res!82407 (and (= (_2!4299 lt!145195) lt!145189) (= (_1!4299 lt!145195) (_2!4298 lt!145196))))))

(assert (=> b!100355 (=> (not res!82407) (not e!65659))))

(assert (=> b!100355 (= e!65657 e!65659)))

(assert (= (and d!31416 c!6277) b!100353))

(assert (= (and d!31416 (not c!6277)) b!100348))

(assert (= (and b!100353 res!82405) b!100345))

(assert (= (and b!100345 res!82406) b!100352))

(assert (= (and b!100352 res!82401) b!100355))

(assert (= (and b!100355 res!82407) b!100344))

(assert (= (and b!100353 res!82404) b!100350))

(assert (= (and b!100353 c!6278) b!100354))

(assert (= (and b!100353 (not c!6278)) b!100349))

(assert (= (or b!100353 b!100348) bm!1246))

(assert (= (and d!31416 res!82403) b!100343))

(assert (= (and b!100343 res!82408) b!100351))

(assert (= (and b!100351 res!82409) b!100347))

(assert (= (and b!100347 res!82402) b!100346))

(declare-fun m!145771 () Bool)

(assert (=> b!100353 m!145771))

(declare-fun m!145773 () Bool)

(assert (=> b!100353 m!145773))

(declare-fun m!145775 () Bool)

(assert (=> b!100353 m!145775))

(declare-fun m!145777 () Bool)

(assert (=> b!100353 m!145777))

(declare-fun m!145779 () Bool)

(assert (=> b!100353 m!145779))

(assert (=> b!100353 m!145525))

(declare-fun m!145781 () Bool)

(assert (=> b!100353 m!145781))

(declare-fun m!145783 () Bool)

(assert (=> b!100353 m!145783))

(declare-fun m!145785 () Bool)

(assert (=> b!100353 m!145785))

(declare-fun m!145787 () Bool)

(assert (=> b!100353 m!145787))

(declare-fun m!145789 () Bool)

(assert (=> b!100353 m!145789))

(declare-fun m!145791 () Bool)

(assert (=> b!100353 m!145791))

(declare-fun m!145793 () Bool)

(assert (=> b!100353 m!145793))

(declare-fun m!145795 () Bool)

(assert (=> b!100353 m!145795))

(declare-fun m!145797 () Bool)

(assert (=> b!100353 m!145797))

(declare-fun m!145799 () Bool)

(assert (=> b!100353 m!145799))

(declare-fun m!145801 () Bool)

(assert (=> b!100353 m!145801))

(declare-fun m!145803 () Bool)

(assert (=> b!100353 m!145803))

(declare-fun m!145805 () Bool)

(assert (=> b!100353 m!145805))

(declare-fun m!145807 () Bool)

(assert (=> b!100353 m!145807))

(declare-fun m!145809 () Bool)

(assert (=> b!100353 m!145809))

(declare-fun m!145811 () Bool)

(assert (=> b!100353 m!145811))

(declare-fun m!145813 () Bool)

(assert (=> b!100353 m!145813))

(declare-fun m!145815 () Bool)

(assert (=> b!100353 m!145815))

(declare-fun m!145817 () Bool)

(assert (=> b!100353 m!145817))

(declare-fun m!145819 () Bool)

(assert (=> b!100353 m!145819))

(declare-fun m!145821 () Bool)

(assert (=> b!100353 m!145821))

(assert (=> b!100353 m!145801))

(declare-fun m!145823 () Bool)

(assert (=> b!100353 m!145823))

(declare-fun m!145825 () Bool)

(assert (=> bm!1246 m!145825))

(declare-fun m!145827 () Bool)

(assert (=> b!100343 m!145827))

(assert (=> b!100343 m!145525))

(declare-fun m!145829 () Bool)

(assert (=> b!100347 m!145829))

(declare-fun m!145831 () Bool)

(assert (=> b!100347 m!145831))

(assert (=> b!100347 m!145807))

(declare-fun m!145833 () Bool)

(assert (=> b!100347 m!145833))

(declare-fun m!145835 () Bool)

(assert (=> b!100347 m!145835))

(declare-fun m!145837 () Bool)

(assert (=> b!100345 m!145837))

(assert (=> b!100345 m!145525))

(declare-fun m!145839 () Bool)

(assert (=> b!100355 m!145839))

(assert (=> b!100355 m!145839))

(declare-fun m!145841 () Bool)

(assert (=> b!100355 m!145841))

(declare-fun m!145843 () Bool)

(assert (=> b!100346 m!145843))

(declare-fun m!145845 () Bool)

(assert (=> b!100344 m!145845))

(assert (=> b!100344 m!145837))

(declare-fun m!145847 () Bool)

(assert (=> b!100352 m!145847))

(declare-fun m!145849 () Bool)

(assert (=> b!100351 m!145849))

(declare-fun m!145851 () Bool)

(assert (=> b!100348 m!145851))

(assert (=> b!100162 d!31416))

(declare-fun d!31448 () Bool)

(declare-fun res!82427 () Bool)

(declare-fun e!65679 () Bool)

(assert (=> d!31448 (=> (not res!82427) (not e!65679))))

(assert (=> d!31448 (= res!82427 (= (size!2155 (buf!2512 (_2!4298 lt!144821))) (size!2155 (buf!2512 (_2!4298 lt!144825)))))))

(assert (=> d!31448 (= (isPrefixOf!0 (_2!4298 lt!144821) (_2!4298 lt!144825)) e!65679)))

(declare-fun b!100380 () Bool)

(declare-fun res!82426 () Bool)

(assert (=> b!100380 (=> (not res!82426) (not e!65679))))

(assert (=> b!100380 (= res!82426 (bvsle (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144825))) (currentByte!4958 (_2!4298 lt!144825)) (currentBit!4953 (_2!4298 lt!144825)))))))

(declare-fun b!100381 () Bool)

(declare-fun e!65678 () Bool)

(assert (=> b!100381 (= e!65679 e!65678)))

(declare-fun res!82428 () Bool)

(assert (=> b!100381 (=> res!82428 e!65678)))

(assert (=> b!100381 (= res!82428 (= (size!2155 (buf!2512 (_2!4298 lt!144821))) #b00000000000000000000000000000000))))

(declare-fun b!100382 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4719 array!4719 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100382 (= e!65678 (arrayBitRangesEq!0 (buf!2512 (_2!4298 lt!144821)) (buf!2512 (_2!4298 lt!144825)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821)))))))

(assert (= (and d!31448 res!82427) b!100380))

(assert (= (and b!100380 res!82426) b!100381))

(assert (= (and b!100381 (not res!82428)) b!100382))

(assert (=> b!100380 m!145525))

(declare-fun m!145853 () Bool)

(assert (=> b!100380 m!145853))

(assert (=> b!100382 m!145525))

(assert (=> b!100382 m!145525))

(declare-fun m!145855 () Bool)

(assert (=> b!100382 m!145855))

(assert (=> b!100162 d!31448))

(declare-fun b!100426 () Bool)

(declare-fun res!82465 () Bool)

(declare-fun e!65703 () Bool)

(assert (=> b!100426 (=> (not res!82465) (not e!65703))))

(declare-fun lt!145413 () tuple2!8090)

(assert (=> b!100426 (= res!82465 (isPrefixOf!0 (_1!4300 lt!145413) thiss!1305))))

(declare-fun b!100427 () Bool)

(declare-fun e!65704 () Unit!6137)

(declare-fun Unit!6153 () Unit!6137)

(assert (=> b!100427 (= e!65704 Unit!6153)))

(declare-fun b!100428 () Bool)

(declare-fun res!82464 () Bool)

(assert (=> b!100428 (=> (not res!82464) (not e!65703))))

(assert (=> b!100428 (= res!82464 (isPrefixOf!0 (_2!4300 lt!145413) (_2!4298 lt!144825)))))

(declare-fun d!31450 () Bool)

(assert (=> d!31450 e!65703))

(declare-fun res!82466 () Bool)

(assert (=> d!31450 (=> (not res!82466) (not e!65703))))

(assert (=> d!31450 (= res!82466 (isPrefixOf!0 (_1!4300 lt!145413) (_2!4300 lt!145413)))))

(declare-fun lt!145398 () BitStream!3784)

(assert (=> d!31450 (= lt!145413 (tuple2!8091 lt!145398 (_2!4298 lt!144825)))))

(declare-fun lt!145406 () Unit!6137)

(declare-fun lt!145396 () Unit!6137)

(assert (=> d!31450 (= lt!145406 lt!145396)))

(assert (=> d!31450 (isPrefixOf!0 lt!145398 (_2!4298 lt!144825))))

(assert (=> d!31450 (= lt!145396 (lemmaIsPrefixTransitive!0 lt!145398 (_2!4298 lt!144825) (_2!4298 lt!144825)))))

(declare-fun lt!145411 () Unit!6137)

(declare-fun lt!145401 () Unit!6137)

(assert (=> d!31450 (= lt!145411 lt!145401)))

(assert (=> d!31450 (isPrefixOf!0 lt!145398 (_2!4298 lt!144825))))

(assert (=> d!31450 (= lt!145401 (lemmaIsPrefixTransitive!0 lt!145398 thiss!1305 (_2!4298 lt!144825)))))

(declare-fun lt!145415 () Unit!6137)

(assert (=> d!31450 (= lt!145415 e!65704)))

(declare-fun c!6287 () Bool)

(assert (=> d!31450 (= c!6287 (not (= (size!2155 (buf!2512 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!145405 () Unit!6137)

(declare-fun lt!145399 () Unit!6137)

(assert (=> d!31450 (= lt!145405 lt!145399)))

(assert (=> d!31450 (isPrefixOf!0 (_2!4298 lt!144825) (_2!4298 lt!144825))))

(assert (=> d!31450 (= lt!145399 (lemmaIsPrefixRefl!0 (_2!4298 lt!144825)))))

(declare-fun lt!145397 () Unit!6137)

(declare-fun lt!145404 () Unit!6137)

(assert (=> d!31450 (= lt!145397 lt!145404)))

(assert (=> d!31450 (= lt!145404 (lemmaIsPrefixRefl!0 (_2!4298 lt!144825)))))

(declare-fun lt!145410 () Unit!6137)

(declare-fun lt!145403 () Unit!6137)

(assert (=> d!31450 (= lt!145410 lt!145403)))

(assert (=> d!31450 (isPrefixOf!0 lt!145398 lt!145398)))

(assert (=> d!31450 (= lt!145403 (lemmaIsPrefixRefl!0 lt!145398))))

(declare-fun lt!145409 () Unit!6137)

(declare-fun lt!145414 () Unit!6137)

(assert (=> d!31450 (= lt!145409 lt!145414)))

(assert (=> d!31450 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31450 (= lt!145414 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31450 (= lt!145398 (BitStream!3785 (buf!2512 (_2!4298 lt!144825)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(assert (=> d!31450 (isPrefixOf!0 thiss!1305 (_2!4298 lt!144825))))

(assert (=> d!31450 (= (reader!0 thiss!1305 (_2!4298 lt!144825)) lt!145413)))

(declare-fun b!100429 () Bool)

(declare-fun lt!145408 () (_ BitVec 64))

(declare-fun lt!145402 () (_ BitVec 64))

(assert (=> b!100429 (= e!65703 (= (_1!4300 lt!145413) (withMovedBitIndex!0 (_2!4300 lt!145413) (bvsub lt!145402 lt!145408))))))

(assert (=> b!100429 (or (= (bvand lt!145402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145402 lt!145408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100429 (= lt!145408 (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144825))) (currentByte!4958 (_2!4298 lt!144825)) (currentBit!4953 (_2!4298 lt!144825))))))

(assert (=> b!100429 (= lt!145402 (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(declare-fun b!100430 () Bool)

(declare-fun lt!145407 () Unit!6137)

(assert (=> b!100430 (= e!65704 lt!145407)))

(declare-fun lt!145400 () (_ BitVec 64))

(assert (=> b!100430 (= lt!145400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!145412 () (_ BitVec 64))

(assert (=> b!100430 (= lt!145412 (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4719 array!4719 (_ BitVec 64) (_ BitVec 64)) Unit!6137)

(assert (=> b!100430 (= lt!145407 (arrayBitRangesEqSymmetric!0 (buf!2512 thiss!1305) (buf!2512 (_2!4298 lt!144825)) lt!145400 lt!145412))))

(assert (=> b!100430 (arrayBitRangesEq!0 (buf!2512 (_2!4298 lt!144825)) (buf!2512 thiss!1305) lt!145400 lt!145412)))

(assert (= (and d!31450 c!6287) b!100430))

(assert (= (and d!31450 (not c!6287)) b!100427))

(assert (= (and d!31450 res!82466) b!100426))

(assert (= (and b!100426 res!82465) b!100428))

(assert (= (and b!100428 res!82464) b!100429))

(declare-fun m!145951 () Bool)

(assert (=> b!100429 m!145951))

(assert (=> b!100429 m!145853))

(assert (=> b!100429 m!145527))

(declare-fun m!145953 () Bool)

(assert (=> b!100428 m!145953))

(declare-fun m!145955 () Bool)

(assert (=> b!100426 m!145955))

(declare-fun m!145957 () Bool)

(assert (=> d!31450 m!145957))

(declare-fun m!145959 () Bool)

(assert (=> d!31450 m!145959))

(declare-fun m!145961 () Bool)

(assert (=> d!31450 m!145961))

(declare-fun m!145963 () Bool)

(assert (=> d!31450 m!145963))

(declare-fun m!145967 () Bool)

(assert (=> d!31450 m!145967))

(assert (=> d!31450 m!145539))

(declare-fun m!145971 () Bool)

(assert (=> d!31450 m!145971))

(declare-fun m!145973 () Bool)

(assert (=> d!31450 m!145973))

(declare-fun m!145975 () Bool)

(assert (=> d!31450 m!145975))

(declare-fun m!145977 () Bool)

(assert (=> d!31450 m!145977))

(declare-fun m!145979 () Bool)

(assert (=> d!31450 m!145979))

(assert (=> b!100430 m!145527))

(declare-fun m!145981 () Bool)

(assert (=> b!100430 m!145981))

(declare-fun m!145983 () Bool)

(assert (=> b!100430 m!145983))

(assert (=> b!100162 d!31450))

(declare-fun d!31464 () Bool)

(declare-fun e!65707 () Bool)

(assert (=> d!31464 e!65707))

(declare-fun res!82471 () Bool)

(assert (=> d!31464 (=> (not res!82471) (not e!65707))))

(declare-fun lt!145433 () (_ BitVec 64))

(declare-fun lt!145432 () (_ BitVec 64))

(declare-fun lt!145428 () (_ BitVec 64))

(assert (=> d!31464 (= res!82471 (= lt!145432 (bvsub lt!145428 lt!145433)))))

(assert (=> d!31464 (or (= (bvand lt!145428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145428 lt!145433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31464 (= lt!145433 (remainingBits!0 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144820)))) ((_ sign_extend 32) (currentByte!4958 (_1!4299 lt!144820))) ((_ sign_extend 32) (currentBit!4953 (_1!4299 lt!144820)))))))

(declare-fun lt!145430 () (_ BitVec 64))

(declare-fun lt!145429 () (_ BitVec 64))

(assert (=> d!31464 (= lt!145428 (bvmul lt!145430 lt!145429))))

(assert (=> d!31464 (or (= lt!145430 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145429 (bvsdiv (bvmul lt!145430 lt!145429) lt!145430)))))

(assert (=> d!31464 (= lt!145429 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31464 (= lt!145430 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144820)))))))

(assert (=> d!31464 (= lt!145432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4958 (_1!4299 lt!144820))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4953 (_1!4299 lt!144820)))))))

(assert (=> d!31464 (invariant!0 (currentBit!4953 (_1!4299 lt!144820)) (currentByte!4958 (_1!4299 lt!144820)) (size!2155 (buf!2512 (_1!4299 lt!144820))))))

(assert (=> d!31464 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!144820))) (currentByte!4958 (_1!4299 lt!144820)) (currentBit!4953 (_1!4299 lt!144820))) lt!145432)))

(declare-fun b!100435 () Bool)

(declare-fun res!82472 () Bool)

(assert (=> b!100435 (=> (not res!82472) (not e!65707))))

(assert (=> b!100435 (= res!82472 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145432))))

(declare-fun b!100436 () Bool)

(declare-fun lt!145431 () (_ BitVec 64))

(assert (=> b!100436 (= e!65707 (bvsle lt!145432 (bvmul lt!145431 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100436 (or (= lt!145431 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145431 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145431)))))

(assert (=> b!100436 (= lt!145431 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144820)))))))

(assert (= (and d!31464 res!82471) b!100435))

(assert (= (and b!100435 res!82472) b!100436))

(declare-fun m!145985 () Bool)

(assert (=> d!31464 m!145985))

(declare-fun m!145987 () Bool)

(assert (=> d!31464 m!145987))

(assert (=> b!100162 d!31464))

(declare-fun d!31466 () Bool)

(declare-fun res!82474 () Bool)

(declare-fun e!65709 () Bool)

(assert (=> d!31466 (=> (not res!82474) (not e!65709))))

(assert (=> d!31466 (= res!82474 (= (size!2155 (buf!2512 thiss!1305)) (size!2155 (buf!2512 (_2!4298 lt!144825)))))))

(assert (=> d!31466 (= (isPrefixOf!0 thiss!1305 (_2!4298 lt!144825)) e!65709)))

(declare-fun b!100437 () Bool)

(declare-fun res!82473 () Bool)

(assert (=> b!100437 (=> (not res!82473) (not e!65709))))

(assert (=> b!100437 (= res!82473 (bvsle (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144825))) (currentByte!4958 (_2!4298 lt!144825)) (currentBit!4953 (_2!4298 lt!144825)))))))

(declare-fun b!100438 () Bool)

(declare-fun e!65708 () Bool)

(assert (=> b!100438 (= e!65709 e!65708)))

(declare-fun res!82475 () Bool)

(assert (=> b!100438 (=> res!82475 e!65708)))

(assert (=> b!100438 (= res!82475 (= (size!2155 (buf!2512 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100439 () Bool)

(assert (=> b!100439 (= e!65708 (arrayBitRangesEq!0 (buf!2512 thiss!1305) (buf!2512 (_2!4298 lt!144825)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305))))))

(assert (= (and d!31466 res!82474) b!100437))

(assert (= (and b!100437 res!82473) b!100438))

(assert (= (and b!100438 (not res!82475)) b!100439))

(assert (=> b!100437 m!145527))

(assert (=> b!100437 m!145853))

(assert (=> b!100439 m!145527))

(assert (=> b!100439 m!145527))

(declare-fun m!145989 () Bool)

(assert (=> b!100439 m!145989))

(assert (=> b!100162 d!31466))

(declare-fun d!31468 () Bool)

(declare-fun e!65722 () Bool)

(assert (=> d!31468 e!65722))

(declare-fun res!82488 () Bool)

(assert (=> d!31468 (=> (not res!82488) (not e!65722))))

(declare-fun lt!145503 () tuple2!8088)

(declare-fun lt!145502 () tuple2!8088)

(assert (=> d!31468 (= res!82488 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!145503))) (currentByte!4958 (_1!4299 lt!145503)) (currentBit!4953 (_1!4299 lt!145503))) (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!145502))) (currentByte!4958 (_1!4299 lt!145502)) (currentBit!4953 (_1!4299 lt!145502)))))))

(declare-fun lt!145505 () BitStream!3784)

(declare-fun lt!145504 () Unit!6137)

(declare-fun choose!50 (BitStream!3784 BitStream!3784 BitStream!3784 tuple2!8088 tuple2!8088 BitStream!3784 Bool tuple2!8088 tuple2!8088 BitStream!3784 Bool) Unit!6137)

(assert (=> d!31468 (= lt!145504 (choose!50 lt!144822 (_2!4298 lt!144825) lt!145505 lt!145503 (tuple2!8089 (_1!4299 lt!145503) (_2!4299 lt!145503)) (_1!4299 lt!145503) (_2!4299 lt!145503) lt!145502 (tuple2!8089 (_1!4299 lt!145502) (_2!4299 lt!145502)) (_1!4299 lt!145502) (_2!4299 lt!145502)))))

(assert (=> d!31468 (= lt!145502 (readBitPure!0 lt!145505))))

(assert (=> d!31468 (= lt!145503 (readBitPure!0 lt!144822))))

(assert (=> d!31468 (= lt!145505 (BitStream!3785 (buf!2512 (_2!4298 lt!144825)) (currentByte!4958 lt!144822) (currentBit!4953 lt!144822)))))

(assert (=> d!31468 (invariant!0 (currentBit!4953 lt!144822) (currentByte!4958 lt!144822) (size!2155 (buf!2512 (_2!4298 lt!144825))))))

(assert (=> d!31468 (= (readBitPrefixLemma!0 lt!144822 (_2!4298 lt!144825)) lt!145504)))

(declare-fun b!100460 () Bool)

(assert (=> b!100460 (= e!65722 (= (_2!4299 lt!145503) (_2!4299 lt!145502)))))

(assert (= (and d!31468 res!82488) b!100460))

(declare-fun m!145991 () Bool)

(assert (=> d!31468 m!145991))

(declare-fun m!145993 () Bool)

(assert (=> d!31468 m!145993))

(declare-fun m!145995 () Bool)

(assert (=> d!31468 m!145995))

(assert (=> d!31468 m!145549))

(declare-fun m!145997 () Bool)

(assert (=> d!31468 m!145997))

(declare-fun m!145999 () Bool)

(assert (=> d!31468 m!145999))

(assert (=> b!100162 d!31468))

(declare-fun d!31470 () Bool)

(declare-fun e!65723 () Bool)

(assert (=> d!31470 e!65723))

(declare-fun res!82489 () Bool)

(assert (=> d!31470 (=> (not res!82489) (not e!65723))))

(declare-fun lt!145514 () (_ BitVec 64))

(declare-fun lt!145519 () (_ BitVec 64))

(declare-fun lt!145518 () (_ BitVec 64))

(assert (=> d!31470 (= res!82489 (= lt!145518 (bvsub lt!145514 lt!145519)))))

(assert (=> d!31470 (or (= (bvand lt!145514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145514 lt!145519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31470 (= lt!145519 (remainingBits!0 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144824)))) ((_ sign_extend 32) (currentByte!4958 (_1!4299 lt!144824))) ((_ sign_extend 32) (currentBit!4953 (_1!4299 lt!144824)))))))

(declare-fun lt!145516 () (_ BitVec 64))

(declare-fun lt!145515 () (_ BitVec 64))

(assert (=> d!31470 (= lt!145514 (bvmul lt!145516 lt!145515))))

(assert (=> d!31470 (or (= lt!145516 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145515 (bvsdiv (bvmul lt!145516 lt!145515) lt!145516)))))

(assert (=> d!31470 (= lt!145515 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31470 (= lt!145516 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144824)))))))

(assert (=> d!31470 (= lt!145518 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4958 (_1!4299 lt!144824))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4953 (_1!4299 lt!144824)))))))

(assert (=> d!31470 (invariant!0 (currentBit!4953 (_1!4299 lt!144824)) (currentByte!4958 (_1!4299 lt!144824)) (size!2155 (buf!2512 (_1!4299 lt!144824))))))

(assert (=> d!31470 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!144824))) (currentByte!4958 (_1!4299 lt!144824)) (currentBit!4953 (_1!4299 lt!144824))) lt!145518)))

(declare-fun b!100461 () Bool)

(declare-fun res!82490 () Bool)

(assert (=> b!100461 (=> (not res!82490) (not e!65723))))

(assert (=> b!100461 (= res!82490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145518))))

(declare-fun b!100462 () Bool)

(declare-fun lt!145517 () (_ BitVec 64))

(assert (=> b!100462 (= e!65723 (bvsle lt!145518 (bvmul lt!145517 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100462 (or (= lt!145517 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145517 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145517)))))

(assert (=> b!100462 (= lt!145517 ((_ sign_extend 32) (size!2155 (buf!2512 (_1!4299 lt!144824)))))))

(assert (= (and d!31470 res!82489) b!100461))

(assert (= (and b!100461 res!82490) b!100462))

(declare-fun m!146001 () Bool)

(assert (=> d!31470 m!146001))

(declare-fun m!146003 () Bool)

(assert (=> d!31470 m!146003))

(assert (=> b!100162 d!31470))

(declare-fun d!31472 () Bool)

(declare-datatypes ((tuple2!8112 0))(
  ( (tuple2!8113 (_1!4311 Bool) (_2!4311 BitStream!3784)) )
))
(declare-fun lt!145528 () tuple2!8112)

(declare-fun readBit!0 (BitStream!3784) tuple2!8112)

(assert (=> d!31472 (= lt!145528 (readBit!0 (BitStream!3785 (buf!2512 (_2!4298 lt!144825)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305))))))

(assert (=> d!31472 (= (readBitPure!0 (BitStream!3785 (buf!2512 (_2!4298 lt!144825)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305))) (tuple2!8089 (_2!4311 lt!145528) (_1!4311 lt!145528)))))

(declare-fun bs!7714 () Bool)

(assert (= bs!7714 d!31472))

(declare-fun m!146005 () Bool)

(assert (=> bs!7714 m!146005))

(assert (=> b!100162 d!31472))

(declare-fun b!100506 () Bool)

(declare-fun res!82531 () Bool)

(declare-fun e!65745 () Bool)

(assert (=> b!100506 (=> (not res!82531) (not e!65745))))

(declare-fun lt!145612 () (_ BitVec 64))

(declare-fun lt!145611 () (_ BitVec 64))

(declare-fun lt!145610 () tuple2!8086)

(assert (=> b!100506 (= res!82531 (= (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145610))) (currentByte!4958 (_2!4298 lt!145610)) (currentBit!4953 (_2!4298 lt!145610))) (bvadd lt!145611 lt!145612)))))

(assert (=> b!100506 (or (not (= (bvand lt!145611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145612 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!145611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!145611 lt!145612) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100506 (= lt!145612 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!100506 (= lt!145611 (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(declare-fun b!100509 () Bool)

(declare-fun e!65746 () Bool)

(declare-fun lt!145613 () tuple2!8088)

(assert (=> b!100509 (= e!65746 (= (bitIndex!0 (size!2155 (buf!2512 (_1!4299 lt!145613))) (currentByte!4958 (_1!4299 lt!145613)) (currentBit!4953 (_1!4299 lt!145613))) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!145610))) (currentByte!4958 (_2!4298 lt!145610)) (currentBit!4953 (_2!4298 lt!145610)))))))

(declare-fun b!100507 () Bool)

(declare-fun res!82529 () Bool)

(assert (=> b!100507 (=> (not res!82529) (not e!65745))))

(assert (=> b!100507 (= res!82529 (isPrefixOf!0 thiss!1305 (_2!4298 lt!145610)))))

(declare-fun b!100508 () Bool)

(assert (=> b!100508 (= e!65745 e!65746)))

(declare-fun res!82530 () Bool)

(assert (=> b!100508 (=> (not res!82530) (not e!65746))))

(assert (=> b!100508 (= res!82530 (and (= (_2!4299 lt!145613) lt!144819) (= (_1!4299 lt!145613) (_2!4298 lt!145610))))))

(assert (=> b!100508 (= lt!145613 (readBitPure!0 (readerFrom!0 (_2!4298 lt!145610) (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305))))))

(declare-fun d!31474 () Bool)

(assert (=> d!31474 e!65745))

(declare-fun res!82528 () Bool)

(assert (=> d!31474 (=> (not res!82528) (not e!65745))))

(assert (=> d!31474 (= res!82528 (= (size!2155 (buf!2512 thiss!1305)) (size!2155 (buf!2512 (_2!4298 lt!145610)))))))

(declare-fun choose!16 (BitStream!3784 Bool) tuple2!8086)

(assert (=> d!31474 (= lt!145610 (choose!16 thiss!1305 lt!144819))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31474 (validate_offset_bit!0 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))) ((_ sign_extend 32) (currentByte!4958 thiss!1305)) ((_ sign_extend 32) (currentBit!4953 thiss!1305)))))

(assert (=> d!31474 (= (appendBit!0 thiss!1305 lt!144819) lt!145610)))

(assert (= (and d!31474 res!82528) b!100506))

(assert (= (and b!100506 res!82531) b!100507))

(assert (= (and b!100507 res!82529) b!100508))

(assert (= (and b!100508 res!82530) b!100509))

(declare-fun m!146087 () Bool)

(assert (=> b!100506 m!146087))

(assert (=> b!100506 m!145527))

(declare-fun m!146093 () Bool)

(assert (=> d!31474 m!146093))

(declare-fun m!146097 () Bool)

(assert (=> d!31474 m!146097))

(declare-fun m!146101 () Bool)

(assert (=> b!100507 m!146101))

(declare-fun m!146103 () Bool)

(assert (=> b!100508 m!146103))

(assert (=> b!100508 m!146103))

(declare-fun m!146107 () Bool)

(assert (=> b!100508 m!146107))

(declare-fun m!146111 () Bool)

(assert (=> b!100509 m!146111))

(assert (=> b!100509 m!146087))

(assert (=> b!100162 d!31474))

(declare-fun d!31478 () Bool)

(declare-fun lt!145614 () tuple2!8112)

(assert (=> d!31478 (= lt!145614 (readBit!0 lt!144822))))

(assert (=> d!31478 (= (readBitPure!0 lt!144822) (tuple2!8089 (_2!4311 lt!145614) (_1!4311 lt!145614)))))

(declare-fun bs!7715 () Bool)

(assert (= bs!7715 d!31478))

(declare-fun m!146117 () Bool)

(assert (=> bs!7715 m!146117))

(assert (=> b!100162 d!31478))

(declare-fun d!31482 () Bool)

(declare-fun res!82533 () Bool)

(declare-fun e!65748 () Bool)

(assert (=> d!31482 (=> (not res!82533) (not e!65748))))

(assert (=> d!31482 (= res!82533 (= (size!2155 (buf!2512 thiss!1305)) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(assert (=> d!31482 (= (isPrefixOf!0 thiss!1305 (_2!4298 lt!144821)) e!65748)))

(declare-fun b!100510 () Bool)

(declare-fun res!82532 () Bool)

(assert (=> b!100510 (=> (not res!82532) (not e!65748))))

(assert (=> b!100510 (= res!82532 (bvsle (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)) (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821)))))))

(declare-fun b!100511 () Bool)

(declare-fun e!65747 () Bool)

(assert (=> b!100511 (= e!65748 e!65747)))

(declare-fun res!82534 () Bool)

(assert (=> b!100511 (=> res!82534 e!65747)))

(assert (=> b!100511 (= res!82534 (= (size!2155 (buf!2512 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100512 () Bool)

(assert (=> b!100512 (= e!65747 (arrayBitRangesEq!0 (buf!2512 thiss!1305) (buf!2512 (_2!4298 lt!144821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305))))))

(assert (= (and d!31482 res!82533) b!100510))

(assert (= (and b!100510 res!82532) b!100511))

(assert (= (and b!100511 (not res!82534)) b!100512))

(assert (=> b!100510 m!145527))

(assert (=> b!100510 m!145525))

(assert (=> b!100512 m!145527))

(assert (=> b!100512 m!145527))

(declare-fun m!146119 () Bool)

(assert (=> b!100512 m!146119))

(assert (=> b!100160 d!31482))

(declare-fun d!31484 () Bool)

(assert (=> d!31484 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!100166 d!31484))

(declare-fun d!31486 () Bool)

(declare-fun e!65749 () Bool)

(assert (=> d!31486 e!65749))

(declare-fun res!82535 () Bool)

(assert (=> d!31486 (=> (not res!82535) (not e!65749))))

(declare-fun lt!145619 () (_ BitVec 64))

(declare-fun lt!145615 () (_ BitVec 64))

(declare-fun lt!145620 () (_ BitVec 64))

(assert (=> d!31486 (= res!82535 (= lt!145619 (bvsub lt!145615 lt!145620)))))

(assert (=> d!31486 (or (= (bvand lt!145615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145615 lt!145620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31486 (= lt!145620 (remainingBits!0 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!144821)))) ((_ sign_extend 32) (currentByte!4958 (_2!4298 lt!144821))) ((_ sign_extend 32) (currentBit!4953 (_2!4298 lt!144821)))))))

(declare-fun lt!145617 () (_ BitVec 64))

(declare-fun lt!145616 () (_ BitVec 64))

(assert (=> d!31486 (= lt!145615 (bvmul lt!145617 lt!145616))))

(assert (=> d!31486 (or (= lt!145617 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145616 (bvsdiv (bvmul lt!145617 lt!145616) lt!145617)))))

(assert (=> d!31486 (= lt!145616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31486 (= lt!145617 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(assert (=> d!31486 (= lt!145619 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4958 (_2!4298 lt!144821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4953 (_2!4298 lt!144821)))))))

(assert (=> d!31486 (invariant!0 (currentBit!4953 (_2!4298 lt!144821)) (currentByte!4958 (_2!4298 lt!144821)) (size!2155 (buf!2512 (_2!4298 lt!144821))))))

(assert (=> d!31486 (= (bitIndex!0 (size!2155 (buf!2512 (_2!4298 lt!144821))) (currentByte!4958 (_2!4298 lt!144821)) (currentBit!4953 (_2!4298 lt!144821))) lt!145619)))

(declare-fun b!100513 () Bool)

(declare-fun res!82536 () Bool)

(assert (=> b!100513 (=> (not res!82536) (not e!65749))))

(assert (=> b!100513 (= res!82536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145619))))

(declare-fun b!100514 () Bool)

(declare-fun lt!145618 () (_ BitVec 64))

(assert (=> b!100514 (= e!65749 (bvsle lt!145619 (bvmul lt!145618 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100514 (or (= lt!145618 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145618 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145618)))))

(assert (=> b!100514 (= lt!145618 ((_ sign_extend 32) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(assert (= (and d!31486 res!82535) b!100513))

(assert (= (and b!100513 res!82536) b!100514))

(declare-fun m!146121 () Bool)

(assert (=> d!31486 m!146121))

(declare-fun m!146123 () Bool)

(assert (=> d!31486 m!146123))

(assert (=> b!100155 d!31486))

(declare-fun d!31488 () Bool)

(declare-fun e!65750 () Bool)

(assert (=> d!31488 e!65750))

(declare-fun res!82537 () Bool)

(assert (=> d!31488 (=> (not res!82537) (not e!65750))))

(declare-fun lt!145621 () (_ BitVec 64))

(declare-fun lt!145626 () (_ BitVec 64))

(declare-fun lt!145625 () (_ BitVec 64))

(assert (=> d!31488 (= res!82537 (= lt!145625 (bvsub lt!145621 lt!145626)))))

(assert (=> d!31488 (or (= (bvand lt!145621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145621 lt!145626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31488 (= lt!145626 (remainingBits!0 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))) ((_ sign_extend 32) (currentByte!4958 thiss!1305)) ((_ sign_extend 32) (currentBit!4953 thiss!1305))))))

(declare-fun lt!145623 () (_ BitVec 64))

(declare-fun lt!145622 () (_ BitVec 64))

(assert (=> d!31488 (= lt!145621 (bvmul lt!145623 lt!145622))))

(assert (=> d!31488 (or (= lt!145623 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145622 (bvsdiv (bvmul lt!145623 lt!145622) lt!145623)))))

(assert (=> d!31488 (= lt!145622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31488 (= lt!145623 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))))))

(assert (=> d!31488 (= lt!145625 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4958 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4953 thiss!1305))))))

(assert (=> d!31488 (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 thiss!1305)))))

(assert (=> d!31488 (= (bitIndex!0 (size!2155 (buf!2512 thiss!1305)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)) lt!145625)))

(declare-fun b!100515 () Bool)

(declare-fun res!82538 () Bool)

(assert (=> b!100515 (=> (not res!82538) (not e!65750))))

(assert (=> b!100515 (= res!82538 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145625))))

(declare-fun b!100516 () Bool)

(declare-fun lt!145624 () (_ BitVec 64))

(assert (=> b!100516 (= e!65750 (bvsle lt!145625 (bvmul lt!145624 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100516 (or (= lt!145624 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145624 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145624)))))

(assert (=> b!100516 (= lt!145624 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))))))

(assert (= (and d!31488 res!82537) b!100515))

(assert (= (and b!100515 res!82538) b!100516))

(declare-fun m!146125 () Bool)

(assert (=> d!31488 m!146125))

(declare-fun m!146127 () Bool)

(assert (=> d!31488 m!146127))

(assert (=> b!100155 d!31488))

(declare-fun d!31490 () Bool)

(declare-fun lt!145629 () tuple2!8112)

(assert (=> d!31490 (= lt!145629 (readBit!0 (readerFrom!0 (_2!4298 lt!144821) (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305))))))

(assert (=> d!31490 (= (readBitPure!0 (readerFrom!0 (_2!4298 lt!144821) (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305))) (tuple2!8089 (_2!4311 lt!145629) (_1!4311 lt!145629)))))

(declare-fun bs!7716 () Bool)

(assert (= bs!7716 d!31490))

(assert (=> bs!7716 m!145565))

(declare-fun m!146129 () Bool)

(assert (=> bs!7716 m!146129))

(assert (=> b!100164 d!31490))

(declare-fun d!31492 () Bool)

(declare-fun e!65754 () Bool)

(assert (=> d!31492 e!65754))

(declare-fun res!82545 () Bool)

(assert (=> d!31492 (=> (not res!82545) (not e!65754))))

(assert (=> d!31492 (= res!82545 (invariant!0 (currentBit!4953 (_2!4298 lt!144821)) (currentByte!4958 (_2!4298 lt!144821)) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(assert (=> d!31492 (= (readerFrom!0 (_2!4298 lt!144821) (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305)) (BitStream!3785 (buf!2512 (_2!4298 lt!144821)) (currentByte!4958 thiss!1305) (currentBit!4953 thiss!1305)))))

(declare-fun b!100521 () Bool)

(assert (=> b!100521 (= e!65754 (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 (_2!4298 lt!144821)))))))

(assert (= (and d!31492 res!82545) b!100521))

(assert (=> d!31492 m!146123))

(assert (=> b!100521 m!145563))

(assert (=> b!100164 d!31492))

(declare-fun d!31502 () Bool)

(assert (=> d!31502 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4953 thiss!1305) (currentByte!4958 thiss!1305) (size!2155 (buf!2512 thiss!1305))))))

(declare-fun bs!7719 () Bool)

(assert (= bs!7719 d!31502))

(assert (=> bs!7719 m!146127))

(assert (=> start!20020 d!31502))

(declare-fun d!31504 () Bool)

(assert (=> d!31504 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))) ((_ sign_extend 32) (currentByte!4958 thiss!1305)) ((_ sign_extend 32) (currentBit!4953 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2155 (buf!2512 thiss!1305))) ((_ sign_extend 32) (currentByte!4958 thiss!1305)) ((_ sign_extend 32) (currentBit!4953 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7720 () Bool)

(assert (= bs!7720 d!31504))

(assert (=> bs!7720 m!146125))

(assert (=> b!100159 d!31504))

(push 1)

(assert (not d!31488))

(assert (not b!100428))

(assert (not d!31470))

(assert (not d!31502))

(assert (not b!100348))

(assert (not b!100351))

(assert (not b!100509))

(assert (not b!100429))

(assert (not b!100507))

(assert (not d!31468))

(assert (not b!100352))

(assert (not b!100437))

(assert (not d!31474))

(assert (not d!31478))

(assert (not d!31492))

(assert (not b!100346))

(assert (not d!31450))

(assert (not b!100439))

(assert (not d!31404))

(assert (not b!100508))

(assert (not b!100345))

(assert (not b!100506))

(assert (not bm!1246))

(assert (not b!100512))

(assert (not d!31486))

(assert (not b!100343))

(assert (not d!31472))

(assert (not b!100430))

(assert (not b!100521))

(assert (not b!100344))

(assert (not b!100347))

(assert (not b!100355))

(assert (not d!31504))

(assert (not d!31414))

(assert (not d!31490))

(assert (not d!31464))

(assert (not b!100426))

(assert (not b!100382))

(assert (not b!100380))

(assert (not b!100510))

(assert (not b!100353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

