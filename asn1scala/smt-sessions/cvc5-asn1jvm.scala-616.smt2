; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17470 () Bool)

(assert start!17470)

(declare-fun b!84199 () Bool)

(declare-datatypes ((Unit!5641 0))(
  ( (Unit!5642) )
))
(declare-datatypes ((array!3987 0))(
  ( (array!3988 (arr!2442 (Array (_ BitVec 32) (_ BitVec 8))) (size!1805 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3172 0))(
  ( (BitStream!3173 (buf!2195 array!3987) (currentByte!4353 (_ BitVec 32)) (currentBit!4348 (_ BitVec 32))) )
))
(declare-datatypes ((tuple3!358 0))(
  ( (tuple3!359 (_1!3817 Unit!5641) (_2!3817 BitStream!3172) (_3!203 (_ BitVec 32))) )
))
(declare-fun e!56297 () tuple3!358)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-fun thiss!1136 () BitStream!3172)

(declare-fun v!176 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3172 (_ BitVec 64) BitStream!3172 (_ BitVec 32)) tuple3!358)

(assert (=> b!84199 (= e!56297 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84200 () Bool)

(declare-fun e!56294 () Bool)

(declare-fun array_inv!1651 (array!3987) Bool)

(assert (=> b!84200 (= e!56294 (array_inv!1651 (buf!2195 thiss!1136)))))

(declare-fun b!84201 () Bool)

(declare-fun e!56296 () Bool)

(declare-fun e!56298 () Bool)

(assert (=> b!84201 (= e!56296 e!56298)))

(declare-fun res!69124 () Bool)

(assert (=> b!84201 (=> (not res!69124) (not e!56298))))

(declare-fun lt!134172 () tuple3!358)

(assert (=> b!84201 (= res!69124 (= (size!1805 (buf!2195 (_2!3817 lt!134172))) (size!1805 (buf!2195 thiss!1136))))))

(assert (=> b!84201 (= lt!134172 e!56297)))

(declare-fun c!5789 () Bool)

(assert (=> b!84201 (= c!5789 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84202 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84202 (= e!56298 (not (invariant!0 (currentBit!4348 (_2!3817 lt!134172)) (currentByte!4353 (_2!3817 lt!134172)) (size!1805 (buf!2195 (_2!3817 lt!134172))))))))

(declare-fun res!69122 () Bool)

(assert (=> start!17470 (=> (not res!69122) (not e!56296))))

(assert (=> start!17470 (= res!69122 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17470 e!56296))

(assert (=> start!17470 true))

(declare-fun inv!12 (BitStream!3172) Bool)

(assert (=> start!17470 (and (inv!12 thiss!1136) e!56294)))

(declare-fun b!84203 () Bool)

(declare-fun Unit!5643 () Unit!5641)

(assert (=> b!84203 (= e!56297 (tuple3!359 Unit!5643 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84204 () Bool)

(declare-fun res!69123 () Bool)

(assert (=> b!84204 (=> (not res!69123) (not e!56296))))

(assert (=> b!84204 (= res!69123 (invariant!0 (currentBit!4348 thiss!1136) (currentByte!4353 thiss!1136) (size!1805 (buf!2195 thiss!1136))))))

(declare-fun b!84205 () Bool)

(declare-fun res!69121 () Bool)

(assert (=> b!84205 (=> (not res!69121) (not e!56296))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84205 (= res!69121 (validate_offset_bits!1 ((_ sign_extend 32) (size!1805 (buf!2195 thiss!1136))) ((_ sign_extend 32) (currentByte!4353 thiss!1136)) ((_ sign_extend 32) (currentBit!4348 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(assert (= (and start!17470 res!69122) b!84205))

(assert (= (and b!84205 res!69121) b!84204))

(assert (= (and b!84204 res!69123) b!84201))

(assert (= (and b!84201 c!5789) b!84199))

(assert (= (and b!84201 (not c!5789)) b!84203))

(assert (= (and b!84201 res!69124) b!84202))

(assert (= start!17470 b!84200))

(declare-fun m!130877 () Bool)

(assert (=> b!84202 m!130877))

(declare-fun m!130879 () Bool)

(assert (=> b!84199 m!130879))

(declare-fun m!130881 () Bool)

(assert (=> b!84204 m!130881))

(declare-fun m!130883 () Bool)

(assert (=> b!84205 m!130883))

(declare-fun m!130885 () Bool)

(assert (=> b!84200 m!130885))

(declare-fun m!130887 () Bool)

(assert (=> start!17470 m!130887))

(push 1)

(assert (not start!17470))

(assert (not b!84204))

(assert (not b!84202))

(assert (not b!84205))

(assert (not b!84199))

(assert (not b!84200))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27106 () Bool)

(assert (=> d!27106 (= (invariant!0 (currentBit!4348 (_2!3817 lt!134172)) (currentByte!4353 (_2!3817 lt!134172)) (size!1805 (buf!2195 (_2!3817 lt!134172)))) (and (bvsge (currentBit!4348 (_2!3817 lt!134172)) #b00000000000000000000000000000000) (bvslt (currentBit!4348 (_2!3817 lt!134172)) #b00000000000000000000000000001000) (bvsge (currentByte!4353 (_2!3817 lt!134172)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4353 (_2!3817 lt!134172)) (size!1805 (buf!2195 (_2!3817 lt!134172)))) (and (= (currentBit!4348 (_2!3817 lt!134172)) #b00000000000000000000000000000000) (= (currentByte!4353 (_2!3817 lt!134172)) (size!1805 (buf!2195 (_2!3817 lt!134172))))))))))

(assert (=> b!84202 d!27106))

(declare-fun d!27112 () Bool)

(assert (=> d!27112 (= (array_inv!1651 (buf!2195 thiss!1136)) (bvsge (size!1805 (buf!2195 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84200 d!27112))

(declare-fun d!27114 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27114 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1805 (buf!2195 thiss!1136))) ((_ sign_extend 32) (currentByte!4353 thiss!1136)) ((_ sign_extend 32) (currentBit!4348 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1805 (buf!2195 thiss!1136))) ((_ sign_extend 32) (currentByte!4353 thiss!1136)) ((_ sign_extend 32) (currentBit!4348 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6708 () Bool)

(assert (= bs!6708 d!27114))

(declare-fun m!130913 () Bool)

(assert (=> bs!6708 m!130913))

(assert (=> b!84205 d!27114))

(declare-fun d!27120 () Bool)

(assert (=> d!27120 (= (invariant!0 (currentBit!4348 thiss!1136) (currentByte!4353 thiss!1136) (size!1805 (buf!2195 thiss!1136))) (and (bvsge (currentBit!4348 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4348 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4353 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4353 thiss!1136) (size!1805 (buf!2195 thiss!1136))) (and (= (currentBit!4348 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4353 thiss!1136) (size!1805 (buf!2195 thiss!1136)))))))))

(assert (=> b!84204 d!27120))

(declare-fun b!84360 () Bool)

(declare-fun e!56368 () Bool)

(declare-fun e!56364 () Bool)

(assert (=> b!84360 (= e!56368 e!56364)))

(declare-fun res!69249 () Bool)

(assert (=> b!84360 (=> (not res!69249) (not e!56364))))

(declare-datatypes ((tuple2!7232 0))(
  ( (tuple2!7233 (_1!3822 BitStream!3172) (_2!3822 Bool)) )
))
(declare-fun lt!134240 () tuple2!7232)

(declare-datatypes ((tuple2!7236 0))(
  ( (tuple2!7237 (_1!3824 Unit!5641) (_2!3824 BitStream!3172)) )
))
(declare-fun lt!134235 () tuple2!7236)

(declare-fun lt!134237 () Bool)

(assert (=> b!84360 (= res!69249 (and (= (_2!3822 lt!134240) lt!134237) (= (_1!3822 lt!134240) (_2!3824 lt!134235))))))

(declare-fun readBitPure!0 (BitStream!3172) tuple2!7232)

(declare-fun readerFrom!0 (BitStream!3172 (_ BitVec 32) (_ BitVec 32)) BitStream!3172)

(assert (=> b!84360 (= lt!134240 (readBitPure!0 (readerFrom!0 (_2!3824 lt!134235) (currentBit!4348 thiss!1136) (currentByte!4353 thiss!1136))))))

(declare-fun b!84361 () Bool)

(declare-fun res!69248 () Bool)

(declare-fun e!56365 () Bool)

(assert (=> b!84361 (=> (not res!69248) (not e!56365))))

(declare-fun lt!134243 () tuple3!358)

(assert (=> b!84361 (= res!69248 (validate_offset_bits!1 ((_ sign_extend 32) (size!1805 (buf!2195 (_2!3817 lt!134243)))) ((_ sign_extend 32) (currentByte!4353 (_2!3817 lt!134243))) ((_ sign_extend 32) (currentBit!4348 (_2!3817 lt!134243))) ((_ sign_extend 32) (bvsub nBits!333 (_3!203 lt!134243)))))))

(assert (=> b!84361 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!203 lt!134243) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!203 lt!134243)) #b10000000000000000000000000000000)))))

(declare-fun b!84362 () Bool)

(declare-fun e!56367 () tuple3!358)

(declare-fun lt!134236 () tuple2!7236)

(declare-fun lt!134239 () (_ BitVec 32))

(declare-fun Unit!5651 () Unit!5641)

(assert (=> b!84362 (= e!56367 (tuple3!359 Unit!5651 (_2!3824 lt!134236) lt!134239))))

(declare-fun b!84364 () Bool)

(assert (=> b!84364 (= e!56367 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3824 lt!134236) lt!134239))))

(declare-fun b!84365 () Bool)

(declare-fun res!69250 () Bool)

(assert (=> b!84365 (=> (not res!69250) (not e!56365))))

(assert (=> b!84365 (= res!69250 (invariant!0 (currentBit!4348 (_2!3817 lt!134243)) (currentByte!4353 (_2!3817 lt!134243)) (size!1805 (buf!2195 (_2!3817 lt!134243)))))))

(declare-fun d!27122 () Bool)

(assert (=> d!27122 e!56365))

(declare-fun res!69262 () Bool)

(assert (=> d!27122 (=> (not res!69262) (not e!56365))))

(assert (=> d!27122 (= res!69262 (bvsge (_3!203 lt!134243) #b00000000000000000000000000000000))))

(assert (=> d!27122 (= lt!134243 e!56367)))

(declare-fun c!5803 () Bool)

(assert (=> d!27122 (= c!5803 (bvslt lt!134239 nBits!333))))

(assert (=> d!27122 (= lt!134239 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27122 (= lt!134236 lt!134235)))

(assert (=> d!27122 e!56368))

(declare-fun res!69254 () Bool)

(assert (=> d!27122 (=> (not res!69254) (not e!56368))))

(assert (=> d!27122 (= res!69254 (= (size!1805 (buf!2195 thiss!1136)) (size!1805 (buf!2195 (_2!3824 lt!134235)))))))

(declare-fun appendBit!0 (BitStream!3172 Bool) tuple2!7236)

(assert (=> d!27122 (= lt!134235 (appendBit!0 thiss!1136 lt!134237))))

(assert (=> d!27122 (= lt!134237 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!56366 () Bool)

(assert (=> d!27122 e!56366))

(declare-fun res!69247 () Bool)

(assert (=> d!27122 (=> (not res!69247) (not e!56366))))

(assert (=> d!27122 (= res!69247 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27122 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134243)))

(declare-fun b!84363 () Bool)

(declare-fun res!69256 () Bool)

(assert (=> b!84363 (=> (not res!69256) (not e!56368))))

(declare-fun isPrefixOf!0 (BitStream!3172 BitStream!3172) Bool)

(assert (=> b!84363 (= res!69256 (isPrefixOf!0 thiss!1136 (_2!3824 lt!134235)))))

(declare-fun b!84366 () Bool)

(declare-fun res!69255 () Bool)

(assert (=> b!84366 (=> (not res!69255) (not e!56365))))

(assert (=> b!84366 (= res!69255 (and (bvsle (_3!203 lt!134243) nBits!333) (= (size!1805 (buf!2195 (_2!3817 lt!134243))) (size!1805 (buf!2195 thiss!1136)))))))

(declare-fun b!84367 () Bool)

(declare-fun res!69251 () Bool)

(assert (=> b!84367 (=> (not res!69251) (not e!56368))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84367 (= res!69251 (= (bitIndex!0 (size!1805 (buf!2195 (_2!3824 lt!134235))) (currentByte!4353 (_2!3824 lt!134235)) (currentBit!4348 (_2!3824 lt!134235))) (bvadd (bitIndex!0 (size!1805 (buf!2195 thiss!1136)) (currentByte!4353 thiss!1136) (currentBit!4348 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84368 () Bool)

(declare-fun res!69253 () Bool)

(assert (=> b!84368 (=> (not res!69253) (not e!56366))))

(assert (=> b!84368 (= res!69253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1805 (buf!2195 thiss!1136))) ((_ sign_extend 32) (currentByte!4353 thiss!1136)) ((_ sign_extend 32) (currentBit!4348 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun b!84369 () Bool)

(assert (=> b!84369 (= e!56365 (bvsge (_3!203 lt!134243) nBits!333))))

(declare-fun b!84370 () Bool)

(declare-fun res!69257 () Bool)

(assert (=> b!84370 (=> (not res!69257) (not e!56366))))

(assert (=> b!84370 (= res!69257 (= (bitIndex!0 (size!1805 (buf!2195 thiss!1136)) (currentByte!4353 thiss!1136) (currentBit!4348 thiss!1136)) (bvadd (bitIndex!0 (size!1805 (buf!2195 thiss!1136)) (currentByte!4353 thiss!1136) (currentBit!4348 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84371 () Bool)

(declare-fun res!69260 () Bool)

(assert (=> b!84371 (=> (not res!69260) (not e!56366))))

(assert (=> b!84371 (= res!69260 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1805 (buf!2195 thiss!1136)) (size!1805 (buf!2195 thiss!1136)))))))

(declare-fun b!84372 () Bool)

(assert (=> b!84372 (= e!56364 (= (bitIndex!0 (size!1805 (buf!2195 (_1!3822 lt!134240))) (currentByte!4353 (_1!3822 lt!134240)) (currentBit!4348 (_1!3822 lt!134240))) (bitIndex!0 (size!1805 (buf!2195 (_2!3824 lt!134235))) (currentByte!4353 (_2!3824 lt!134235)) (currentBit!4348 (_2!3824 lt!134235)))))))

(declare-fun b!84373 () Bool)

(declare-fun res!69252 () Bool)

(assert (=> b!84373 (=> (not res!69252) (not e!56365))))

(declare-fun lt!134238 () (_ BitVec 64))

(declare-fun lt!134241 () (_ BitVec 64))

(assert (=> b!84373 (= res!69252 (= (bitIndex!0 (size!1805 (buf!2195 (_2!3817 lt!134243))) (currentByte!4353 (_2!3817 lt!134243)) (currentBit!4348 (_2!3817 lt!134243))) (bvadd lt!134241 lt!134238)))))

(assert (=> b!84373 (or (not (= (bvand lt!134241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134238 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134241 lt!134238) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84373 (= lt!134238 ((_ sign_extend 32) (_3!203 lt!134243)))))

(assert (=> b!84373 (= lt!134241 (bitIndex!0 (size!1805 (buf!2195 thiss!1136)) (currentByte!4353 thiss!1136) (currentBit!4348 thiss!1136)))))

(declare-fun b!84374 () Bool)

(assert (=> b!84374 (= e!56366 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84375 () Bool)

(declare-fun res!69258 () Bool)

(assert (=> b!84375 (=> (not res!69258) (not e!56366))))

(assert (=> b!84375 (= res!69258 (invariant!0 (currentBit!4348 thiss!1136) (currentByte!4353 thiss!1136) (size!1805 (buf!2195 thiss!1136))))))

(assert (= (and d!27122 res!69247) b!84375))

(assert (= (and b!84375 res!69258) b!84371))

(assert (= (and b!84371 res!69260) b!84370))

(assert (= (and b!84370 res!69257) b!84368))

(assert (= (and b!84368 res!69253) b!84374))

(assert (= (and d!27122 res!69254) b!84367))

(assert (= (and b!84367 res!69251) b!84363))

(assert (= (and b!84363 res!69256) b!84360))

(assert (= (and b!84360 res!69249) b!84372))

(assert (= (and d!27122 c!5803) b!84364))

(assert (= (and d!27122 (not c!5803)) b!84362))

(assert (= (and d!27122 res!69262) b!84365))

(assert (= (and b!84365 res!69250) b!84366))

(assert (= (and b!84366 res!69255) b!84373))

(assert (= (and b!84373 res!69252) b!84361))

(assert (= (and b!84361 res!69248) b!84369))

(declare-fun m!130943 () Bool)

(assert (=> b!84364 m!130943))

(declare-fun m!130947 () Bool)

(assert (=> d!27122 m!130947))

(declare-fun m!130949 () Bool)

(assert (=> b!84363 m!130949))

(declare-fun m!130953 () Bool)

(assert (=> b!84365 m!130953))

(declare-fun m!130957 () Bool)

(assert (=> b!84361 m!130957))

(declare-fun m!130963 () Bool)

(assert (=> b!84368 m!130963))

(assert (=> b!84375 m!130881))

(declare-fun m!130967 () Bool)

(assert (=> b!84360 m!130967))

(assert (=> b!84360 m!130967))

(declare-fun m!130969 () Bool)

(assert (=> b!84360 m!130969))

(declare-fun m!130975 () Bool)

(assert (=> b!84373 m!130975))

(declare-fun m!130977 () Bool)

(assert (=> b!84373 m!130977))

(declare-fun m!130979 () Bool)

(assert (=> b!84367 m!130979))

(assert (=> b!84367 m!130977))

(assert (=> b!84370 m!130977))

(assert (=> b!84370 m!130977))

(declare-fun m!130987 () Bool)

(assert (=> b!84372 m!130987))

(assert (=> b!84372 m!130979))

(assert (=> b!84199 d!27122))

(declare-fun d!27138 () Bool)

(assert (=> d!27138 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4348 thiss!1136) (currentByte!4353 thiss!1136) (size!1805 (buf!2195 thiss!1136))))))

(declare-fun bs!6712 () Bool)

(assert (= bs!6712 d!27138))

(assert (=> bs!6712 m!130881))

(assert (=> start!17470 d!27138))

(push 1)

(assert (not b!84373))

(assert (not d!27138))

(assert (not b!84360))

(assert (not b!84375))

(assert (not b!84364))

(assert (not d!27122))

(assert (not b!84363))

(assert (not b!84365))

(assert (not b!84372))

(assert (not b!84361))

(assert (not b!84367))

(assert (not b!84368))

