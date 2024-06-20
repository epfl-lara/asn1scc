; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43116 () Bool)

(assert start!43116)

(declare-fun b!203248 () Bool)

(declare-fun e!139290 () Bool)

(declare-datatypes ((array!10307 0))(
  ( (array!10308 (arr!5464 (Array (_ BitVec 32) (_ BitVec 8))) (size!4534 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8176 0))(
  ( (BitStream!8177 (buf!5039 array!10307) (currentByte!9497 (_ BitVec 32)) (currentBit!9492 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8176)

(declare-fun array_inv!4275 (array!10307) Bool)

(assert (=> b!203248 (= e!139290 (array_inv!4275 (buf!5039 thiss!1204)))))

(declare-fun b!203249 () Bool)

(declare-fun e!139287 () Bool)

(declare-fun e!139291 () Bool)

(assert (=> b!203249 (= e!139287 e!139291)))

(declare-fun res!170260 () Bool)

(assert (=> b!203249 (=> (not res!170260) (not e!139291))))

(declare-fun lt!317105 () Bool)

(declare-datatypes ((tuple2!17390 0))(
  ( (tuple2!17391 (_1!9347 BitStream!8176) (_2!9347 Bool)) )
))
(declare-fun lt!317109 () tuple2!17390)

(declare-datatypes ((Unit!14460 0))(
  ( (Unit!14461) )
))
(declare-datatypes ((tuple2!17392 0))(
  ( (tuple2!17393 (_1!9348 Unit!14460) (_2!9348 BitStream!8176)) )
))
(declare-fun lt!317103 () tuple2!17392)

(assert (=> b!203249 (= res!170260 (and (= (_2!9347 lt!317109) lt!317105) (= (_1!9347 lt!317109) (_2!9348 lt!317103))))))

(declare-fun readBitPure!0 (BitStream!8176) tuple2!17390)

(declare-fun readerFrom!0 (BitStream!8176 (_ BitVec 32) (_ BitVec 32)) BitStream!8176)

(assert (=> b!203249 (= lt!317109 (readBitPure!0 (readerFrom!0 (_2!9348 lt!317103) (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204))))))

(declare-fun b!203250 () Bool)

(declare-fun res!170262 () Bool)

(declare-fun e!139289 () Bool)

(assert (=> b!203250 (=> (not res!170262) (not e!139289))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203250 (= res!170262 (invariant!0 (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204) (size!4534 (buf!5039 thiss!1204))))))

(declare-fun b!203251 () Bool)

(declare-fun res!170265 () Bool)

(assert (=> b!203251 (=> (not res!170265) (not e!139289))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203251 (= res!170265 (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))) ((_ sign_extend 32) (currentByte!9497 thiss!1204)) ((_ sign_extend 32) (currentBit!9492 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!203252 () Bool)

(declare-fun lt!317106 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203252 (= e!139291 (= (bitIndex!0 (size!4534 (buf!5039 (_1!9347 lt!317109))) (currentByte!9497 (_1!9347 lt!317109)) (currentBit!9492 (_1!9347 lt!317109))) lt!317106))))

(declare-fun b!203253 () Bool)

(declare-fun res!170264 () Bool)

(assert (=> b!203253 (=> (not res!170264) (not e!139287))))

(declare-fun isPrefixOf!0 (BitStream!8176 BitStream!8176) Bool)

(assert (=> b!203253 (= res!170264 (isPrefixOf!0 thiss!1204 (_2!9348 lt!317103)))))

(declare-fun b!203254 () Bool)

(declare-fun e!139292 () Bool)

(assert (=> b!203254 (= e!139292 e!139287)))

(declare-fun res!170263 () Bool)

(assert (=> b!203254 (=> (not res!170263) (not e!139287))))

(declare-fun lt!317102 () (_ BitVec 64))

(assert (=> b!203254 (= res!170263 (= lt!317106 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317102)))))

(assert (=> b!203254 (= lt!317106 (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))))))

(assert (=> b!203254 (= lt!317102 (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)))))

(declare-fun b!203255 () Bool)

(declare-fun e!139288 () Bool)

(assert (=> b!203255 (= e!139289 (not e!139288))))

(declare-fun res!170261 () Bool)

(assert (=> b!203255 (=> res!170261 e!139288)))

(declare-fun lt!317107 () (_ BitVec 64))

(declare-fun lt!317104 () (_ BitVec 64))

(assert (=> b!203255 (= res!170261 (not (= lt!317107 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!317104))))))

(assert (=> b!203255 (= lt!317107 (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))))))

(assert (=> b!203255 (= lt!317104 (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)))))

(assert (=> b!203255 e!139292))

(declare-fun res!170259 () Bool)

(assert (=> b!203255 (=> (not res!170259) (not e!139292))))

(assert (=> b!203255 (= res!170259 (= (size!4534 (buf!5039 thiss!1204)) (size!4534 (buf!5039 (_2!9348 lt!317103)))))))

(declare-fun appendBit!0 (BitStream!8176 Bool) tuple2!17392)

(assert (=> b!203255 (= lt!317103 (appendBit!0 thiss!1204 lt!317105))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!203255 (= lt!317105 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203256 () Bool)

(declare-fun lt!317111 () (_ BitVec 64))

(declare-fun lt!317108 () (_ BitVec 64))

(assert (=> b!203256 (= e!139288 (or (= lt!317111 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317111 (bvand (bvsub lt!317108 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!203256 (= lt!317111 (bvand lt!317108 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!203256 (= lt!317108 (bvsub (bvadd lt!317107 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))

(declare-fun lt!317101 () tuple2!17392)

(assert (=> b!203256 (isPrefixOf!0 thiss!1204 (_2!9348 lt!317101))))

(declare-fun lt!317110 () Unit!14460)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8176 BitStream!8176 BitStream!8176) Unit!14460)

(assert (=> b!203256 (= lt!317110 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9348 lt!317103) (_2!9348 lt!317101)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17392)

(assert (=> b!203256 (= lt!317101 (appendBitsLSBFirstLoopTR!0 (_2!9348 lt!317103) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!170266 () Bool)

(assert (=> start!43116 (=> (not res!170266) (not e!139289))))

(assert (=> start!43116 (= res!170266 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43116 e!139289))

(assert (=> start!43116 true))

(declare-fun inv!12 (BitStream!8176) Bool)

(assert (=> start!43116 (and (inv!12 thiss!1204) e!139290)))

(declare-fun b!203247 () Bool)

(declare-fun res!170267 () Bool)

(assert (=> b!203247 (=> (not res!170267) (not e!139289))))

(assert (=> b!203247 (= res!170267 (not (= i!590 nBits!348)))))

(assert (= (and start!43116 res!170266) b!203251))

(assert (= (and b!203251 res!170265) b!203250))

(assert (= (and b!203250 res!170262) b!203247))

(assert (= (and b!203247 res!170267) b!203255))

(assert (= (and b!203255 res!170259) b!203254))

(assert (= (and b!203254 res!170263) b!203253))

(assert (= (and b!203253 res!170264) b!203249))

(assert (= (and b!203249 res!170260) b!203252))

(assert (= (and b!203255 (not res!170261)) b!203256))

(assert (= start!43116 b!203248))

(declare-fun m!314049 () Bool)

(assert (=> b!203250 m!314049))

(declare-fun m!314051 () Bool)

(assert (=> b!203249 m!314051))

(assert (=> b!203249 m!314051))

(declare-fun m!314053 () Bool)

(assert (=> b!203249 m!314053))

(declare-fun m!314055 () Bool)

(assert (=> b!203253 m!314055))

(declare-fun m!314057 () Bool)

(assert (=> b!203254 m!314057))

(declare-fun m!314059 () Bool)

(assert (=> b!203254 m!314059))

(assert (=> b!203255 m!314057))

(assert (=> b!203255 m!314059))

(declare-fun m!314061 () Bool)

(assert (=> b!203255 m!314061))

(declare-fun m!314063 () Bool)

(assert (=> b!203252 m!314063))

(declare-fun m!314065 () Bool)

(assert (=> b!203251 m!314065))

(declare-fun m!314067 () Bool)

(assert (=> b!203248 m!314067))

(declare-fun m!314069 () Bool)

(assert (=> start!43116 m!314069))

(declare-fun m!314071 () Bool)

(assert (=> b!203256 m!314071))

(declare-fun m!314073 () Bool)

(assert (=> b!203256 m!314073))

(declare-fun m!314075 () Bool)

(assert (=> b!203256 m!314075))

(push 1)

(assert (not b!203255))

(assert (not b!203249))

(assert (not b!203252))

(assert (not b!203253))

(assert (not b!203251))

(assert (not b!203254))

(assert (not b!203256))

(assert (not b!203248))

(assert (not b!203250))

(assert (not start!43116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69473 () Bool)

(declare-fun e!139347 () Bool)

(assert (=> d!69473 e!139347))

(declare-fun res!170339 () Bool)

(assert (=> d!69473 (=> (not res!170339) (not e!139347))))

(declare-fun lt!317197 () (_ BitVec 64))

(declare-fun lt!317201 () (_ BitVec 64))

(declare-fun lt!317200 () (_ BitVec 64))

(assert (=> d!69473 (= res!170339 (= lt!317200 (bvsub lt!317201 lt!317197)))))

(assert (=> d!69473 (or (= (bvand lt!317201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317197 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317201 lt!317197) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69473 (= lt!317197 (remainingBits!0 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317103)))) ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317103))) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317103)))))))

(declare-fun lt!317198 () (_ BitVec 64))

(declare-fun lt!317196 () (_ BitVec 64))

(assert (=> d!69473 (= lt!317201 (bvmul lt!317198 lt!317196))))

(assert (=> d!69473 (or (= lt!317198 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317196 (bvsdiv (bvmul lt!317198 lt!317196) lt!317198)))))

(assert (=> d!69473 (= lt!317196 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69473 (= lt!317198 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317103)))))))

(assert (=> d!69473 (= lt!317200 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317103))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317103)))))))

(assert (=> d!69473 (invariant!0 (currentBit!9492 (_2!9348 lt!317103)) (currentByte!9497 (_2!9348 lt!317103)) (size!4534 (buf!5039 (_2!9348 lt!317103))))))

(assert (=> d!69473 (= (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))) lt!317200)))

(declare-fun b!203333 () Bool)

(declare-fun res!170340 () Bool)

(assert (=> b!203333 (=> (not res!170340) (not e!139347))))

(assert (=> b!203333 (= res!170340 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317200))))

(declare-fun b!203334 () Bool)

(declare-fun lt!317199 () (_ BitVec 64))

(assert (=> b!203334 (= e!139347 (bvsle lt!317200 (bvmul lt!317199 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203334 (or (= lt!317199 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317199 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317199)))))

(assert (=> b!203334 (= lt!317199 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317103)))))))

(assert (= (and d!69473 res!170339) b!203333))

(assert (= (and b!203333 res!170340) b!203334))

(declare-fun m!314145 () Bool)

(assert (=> d!69473 m!314145))

(declare-fun m!314147 () Bool)

(assert (=> d!69473 m!314147))

(assert (=> b!203254 d!69473))

(declare-fun d!69475 () Bool)

(declare-fun e!139348 () Bool)

(assert (=> d!69475 e!139348))

(declare-fun res!170341 () Bool)

(assert (=> d!69475 (=> (not res!170341) (not e!139348))))

(declare-fun lt!317207 () (_ BitVec 64))

(declare-fun lt!317206 () (_ BitVec 64))

(declare-fun lt!317203 () (_ BitVec 64))

(assert (=> d!69475 (= res!170341 (= lt!317206 (bvsub lt!317207 lt!317203)))))

(assert (=> d!69475 (or (= (bvand lt!317207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317203 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317207 lt!317203) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69475 (= lt!317203 (remainingBits!0 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))) ((_ sign_extend 32) (currentByte!9497 thiss!1204)) ((_ sign_extend 32) (currentBit!9492 thiss!1204))))))

(declare-fun lt!317204 () (_ BitVec 64))

(declare-fun lt!317202 () (_ BitVec 64))

(assert (=> d!69475 (= lt!317207 (bvmul lt!317204 lt!317202))))

(assert (=> d!69475 (or (= lt!317204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317202 (bvsdiv (bvmul lt!317204 lt!317202) lt!317204)))))

(assert (=> d!69475 (= lt!317202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69475 (= lt!317204 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))))))

(assert (=> d!69475 (= lt!317206 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9497 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9492 thiss!1204))))))

(assert (=> d!69475 (invariant!0 (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204) (size!4534 (buf!5039 thiss!1204)))))

(assert (=> d!69475 (= (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)) lt!317206)))

(declare-fun b!203335 () Bool)

(declare-fun res!170342 () Bool)

(assert (=> b!203335 (=> (not res!170342) (not e!139348))))

(assert (=> b!203335 (= res!170342 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317206))))

(declare-fun b!203336 () Bool)

(declare-fun lt!317205 () (_ BitVec 64))

(assert (=> b!203336 (= e!139348 (bvsle lt!317206 (bvmul lt!317205 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203336 (or (= lt!317205 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317205 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317205)))))

(assert (=> b!203336 (= lt!317205 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))))))

(assert (= (and d!69475 res!170341) b!203335))

(assert (= (and b!203335 res!170342) b!203336))

(declare-fun m!314149 () Bool)

(assert (=> d!69475 m!314149))

(assert (=> d!69475 m!314049))

(assert (=> b!203254 d!69475))

(declare-fun d!69477 () Bool)

(assert (=> d!69477 (= (array_inv!4275 (buf!5039 thiss!1204)) (bvsge (size!4534 (buf!5039 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203248 d!69477))

(declare-fun d!69479 () Bool)

(declare-fun res!170351 () Bool)

(declare-fun e!139354 () Bool)

(assert (=> d!69479 (=> (not res!170351) (not e!139354))))

(assert (=> d!69479 (= res!170351 (= (size!4534 (buf!5039 thiss!1204)) (size!4534 (buf!5039 (_2!9348 lt!317103)))))))

(assert (=> d!69479 (= (isPrefixOf!0 thiss!1204 (_2!9348 lt!317103)) e!139354)))

(declare-fun b!203343 () Bool)

(declare-fun res!170350 () Bool)

(assert (=> b!203343 (=> (not res!170350) (not e!139354))))

(assert (=> b!203343 (= res!170350 (bvsle (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)) (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103)))))))

(declare-fun b!203344 () Bool)

(declare-fun e!139353 () Bool)

(assert (=> b!203344 (= e!139354 e!139353)))

(declare-fun res!170349 () Bool)

(assert (=> b!203344 (=> res!170349 e!139353)))

(assert (=> b!203344 (= res!170349 (= (size!4534 (buf!5039 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203345 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10307 array!10307 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203345 (= e!139353 (arrayBitRangesEq!0 (buf!5039 thiss!1204) (buf!5039 (_2!9348 lt!317103)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204))))))

(assert (= (and d!69479 res!170351) b!203343))

(assert (= (and b!203343 res!170350) b!203344))

(assert (= (and b!203344 (not res!170349)) b!203345))

(assert (=> b!203343 m!314059))

(assert (=> b!203343 m!314057))

(assert (=> b!203345 m!314059))

(assert (=> b!203345 m!314059))

(declare-fun m!314151 () Bool)

(assert (=> b!203345 m!314151))

(assert (=> b!203253 d!69479))

(declare-fun d!69481 () Bool)

(assert (=> d!69481 (= (invariant!0 (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204) (size!4534 (buf!5039 thiss!1204))) (and (bvsge (currentBit!9492 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9492 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9497 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9497 thiss!1204) (size!4534 (buf!5039 thiss!1204))) (and (= (currentBit!9492 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9497 thiss!1204) (size!4534 (buf!5039 thiss!1204)))))))))

(assert (=> b!203250 d!69481))

(assert (=> b!203255 d!69473))

(assert (=> b!203255 d!69475))

(declare-fun b!203355 () Bool)

(declare-fun res!170362 () Bool)

(declare-fun e!139360 () Bool)

(assert (=> b!203355 (=> (not res!170362) (not e!139360))))

(declare-fun lt!317218 () tuple2!17392)

(declare-fun lt!317217 () (_ BitVec 64))

(declare-fun lt!317216 () (_ BitVec 64))

(assert (=> b!203355 (= res!170362 (= (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317218))) (currentByte!9497 (_2!9348 lt!317218)) (currentBit!9492 (_2!9348 lt!317218))) (bvadd lt!317217 lt!317216)))))

(assert (=> b!203355 (or (not (= (bvand lt!317217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317216 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317217 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317217 lt!317216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203355 (= lt!317216 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!203355 (= lt!317217 (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)))))

(declare-fun b!203358 () Bool)

(declare-fun e!139359 () Bool)

(declare-fun lt!317219 () tuple2!17390)

(assert (=> b!203358 (= e!139359 (= (bitIndex!0 (size!4534 (buf!5039 (_1!9347 lt!317219))) (currentByte!9497 (_1!9347 lt!317219)) (currentBit!9492 (_1!9347 lt!317219))) (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317218))) (currentByte!9497 (_2!9348 lt!317218)) (currentBit!9492 (_2!9348 lt!317218)))))))

(declare-fun b!203356 () Bool)

(declare-fun res!170360 () Bool)

(assert (=> b!203356 (=> (not res!170360) (not e!139360))))

(assert (=> b!203356 (= res!170360 (isPrefixOf!0 thiss!1204 (_2!9348 lt!317218)))))

(declare-fun b!203357 () Bool)

(assert (=> b!203357 (= e!139360 e!139359)))

(declare-fun res!170361 () Bool)

(assert (=> b!203357 (=> (not res!170361) (not e!139359))))

(assert (=> b!203357 (= res!170361 (and (= (_2!9347 lt!317219) lt!317105) (= (_1!9347 lt!317219) (_2!9348 lt!317218))))))

(assert (=> b!203357 (= lt!317219 (readBitPure!0 (readerFrom!0 (_2!9348 lt!317218) (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204))))))

(declare-fun d!69483 () Bool)

(assert (=> d!69483 e!139360))

(declare-fun res!170363 () Bool)

(assert (=> d!69483 (=> (not res!170363) (not e!139360))))

(assert (=> d!69483 (= res!170363 (= (size!4534 (buf!5039 thiss!1204)) (size!4534 (buf!5039 (_2!9348 lt!317218)))))))

(declare-fun choose!16 (BitStream!8176 Bool) tuple2!17392)

(assert (=> d!69483 (= lt!317218 (choose!16 thiss!1204 lt!317105))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69483 (validate_offset_bit!0 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))) ((_ sign_extend 32) (currentByte!9497 thiss!1204)) ((_ sign_extend 32) (currentBit!9492 thiss!1204)))))

(assert (=> d!69483 (= (appendBit!0 thiss!1204 lt!317105) lt!317218)))

(assert (= (and d!69483 res!170363) b!203355))

(assert (= (and b!203355 res!170362) b!203356))

(assert (= (and b!203356 res!170360) b!203357))

(assert (= (and b!203357 res!170361) b!203358))

(declare-fun m!314153 () Bool)

(assert (=> b!203357 m!314153))

(assert (=> b!203357 m!314153))

(declare-fun m!314155 () Bool)

(assert (=> b!203357 m!314155))

(declare-fun m!314157 () Bool)

(assert (=> b!203355 m!314157))

(assert (=> b!203355 m!314059))

(declare-fun m!314159 () Bool)

(assert (=> b!203358 m!314159))

(assert (=> b!203358 m!314157))

(declare-fun m!314161 () Bool)

(assert (=> b!203356 m!314161))

(declare-fun m!314163 () Bool)

(assert (=> d!69483 m!314163))

(declare-fun m!314165 () Bool)

(assert (=> d!69483 m!314165))

(assert (=> b!203255 d!69483))

(declare-fun d!69487 () Bool)

(declare-datatypes ((tuple2!17408 0))(
  ( (tuple2!17409 (_1!9356 Bool) (_2!9356 BitStream!8176)) )
))
(declare-fun lt!317222 () tuple2!17408)

(declare-fun readBit!0 (BitStream!8176) tuple2!17408)

(assert (=> d!69487 (= lt!317222 (readBit!0 (readerFrom!0 (_2!9348 lt!317103) (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204))))))

(assert (=> d!69487 (= (readBitPure!0 (readerFrom!0 (_2!9348 lt!317103) (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204))) (tuple2!17391 (_2!9356 lt!317222) (_1!9356 lt!317222)))))

(declare-fun bs!17127 () Bool)

(assert (= bs!17127 d!69487))

(assert (=> bs!17127 m!314051))

(declare-fun m!314167 () Bool)

(assert (=> bs!17127 m!314167))

(assert (=> b!203249 d!69487))

(declare-fun d!69493 () Bool)

(declare-fun e!139363 () Bool)

(assert (=> d!69493 e!139363))

(declare-fun res!170367 () Bool)

(assert (=> d!69493 (=> (not res!170367) (not e!139363))))

(assert (=> d!69493 (= res!170367 (invariant!0 (currentBit!9492 (_2!9348 lt!317103)) (currentByte!9497 (_2!9348 lt!317103)) (size!4534 (buf!5039 (_2!9348 lt!317103)))))))

(assert (=> d!69493 (= (readerFrom!0 (_2!9348 lt!317103) (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204)) (BitStream!8177 (buf!5039 (_2!9348 lt!317103)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)))))

(declare-fun b!203361 () Bool)

(assert (=> b!203361 (= e!139363 (invariant!0 (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204) (size!4534 (buf!5039 (_2!9348 lt!317103)))))))

(assert (= (and d!69493 res!170367) b!203361))

(assert (=> d!69493 m!314147))

(declare-fun m!314169 () Bool)

(assert (=> b!203361 m!314169))

(assert (=> b!203249 d!69493))

(declare-fun d!69495 () Bool)

(assert (=> d!69495 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))) ((_ sign_extend 32) (currentByte!9497 thiss!1204)) ((_ sign_extend 32) (currentBit!9492 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4534 (buf!5039 thiss!1204))) ((_ sign_extend 32) (currentByte!9497 thiss!1204)) ((_ sign_extend 32) (currentBit!9492 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17128 () Bool)

(assert (= bs!17128 d!69495))

(assert (=> bs!17128 m!314149))

(assert (=> b!203251 d!69495))

(declare-fun d!69497 () Bool)

(declare-fun res!170370 () Bool)

(declare-fun e!139365 () Bool)

(assert (=> d!69497 (=> (not res!170370) (not e!139365))))

(assert (=> d!69497 (= res!170370 (= (size!4534 (buf!5039 thiss!1204)) (size!4534 (buf!5039 (_2!9348 lt!317101)))))))

(assert (=> d!69497 (= (isPrefixOf!0 thiss!1204 (_2!9348 lt!317101)) e!139365)))

(declare-fun b!203362 () Bool)

(declare-fun res!170369 () Bool)

(assert (=> b!203362 (=> (not res!170369) (not e!139365))))

(assert (=> b!203362 (= res!170369 (bvsle (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204)) (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317101))) (currentByte!9497 (_2!9348 lt!317101)) (currentBit!9492 (_2!9348 lt!317101)))))))

(declare-fun b!203363 () Bool)

(declare-fun e!139364 () Bool)

(assert (=> b!203363 (= e!139365 e!139364)))

(declare-fun res!170368 () Bool)

(assert (=> b!203363 (=> res!170368 e!139364)))

(assert (=> b!203363 (= res!170368 (= (size!4534 (buf!5039 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!203364 () Bool)

(assert (=> b!203364 (= e!139364 (arrayBitRangesEq!0 (buf!5039 thiss!1204) (buf!5039 (_2!9348 lt!317101)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4534 (buf!5039 thiss!1204)) (currentByte!9497 thiss!1204) (currentBit!9492 thiss!1204))))))

(assert (= (and d!69497 res!170370) b!203362))

(assert (= (and b!203362 res!170369) b!203363))

(assert (= (and b!203363 (not res!170368)) b!203364))

(assert (=> b!203362 m!314059))

(declare-fun m!314171 () Bool)

(assert (=> b!203362 m!314171))

(assert (=> b!203364 m!314059))

(assert (=> b!203364 m!314059))

(declare-fun m!314173 () Bool)

(assert (=> b!203364 m!314173))

(assert (=> b!203256 d!69497))

(declare-fun d!69499 () Bool)

(assert (=> d!69499 (isPrefixOf!0 thiss!1204 (_2!9348 lt!317101))))

(declare-fun lt!317225 () Unit!14460)

(declare-fun choose!30 (BitStream!8176 BitStream!8176 BitStream!8176) Unit!14460)

(assert (=> d!69499 (= lt!317225 (choose!30 thiss!1204 (_2!9348 lt!317103) (_2!9348 lt!317101)))))

(assert (=> d!69499 (isPrefixOf!0 thiss!1204 (_2!9348 lt!317103))))

(assert (=> d!69499 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9348 lt!317103) (_2!9348 lt!317101)) lt!317225)))

(declare-fun bs!17129 () Bool)

(assert (= bs!17129 d!69499))

(assert (=> bs!17129 m!314071))

(declare-fun m!314175 () Bool)

(assert (=> bs!17129 m!314175))

(assert (=> bs!17129 m!314055))

(assert (=> b!203256 d!69499))

(declare-fun b!203475 () Bool)

(declare-fun e!139431 () (_ BitVec 64))

(assert (=> b!203475 (= e!139431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!69501 () Bool)

(declare-fun e!139429 () Bool)

(assert (=> d!69501 e!139429))

(declare-fun res!170471 () Bool)

(assert (=> d!69501 (=> (not res!170471) (not e!139429))))

(declare-fun lt!317588 () tuple2!17392)

(assert (=> d!69501 (= res!170471 (invariant!0 (currentBit!9492 (_2!9348 lt!317588)) (currentByte!9497 (_2!9348 lt!317588)) (size!4534 (buf!5039 (_2!9348 lt!317588)))))))

(declare-fun e!139435 () tuple2!17392)

(assert (=> d!69501 (= lt!317588 e!139435)))

(declare-fun c!10090 () Bool)

(assert (=> d!69501 (= c!10090 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69501 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69501 (= (appendBitsLSBFirstLoopTR!0 (_2!9348 lt!317103) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!317588)))

(declare-fun b!203476 () Bool)

(declare-fun Unit!14468 () Unit!14460)

(assert (=> b!203476 (= e!139435 (tuple2!17393 Unit!14468 (_2!9348 lt!317103)))))

(declare-fun lt!317583 () Unit!14460)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8176) Unit!14460)

(assert (=> b!203476 (= lt!317583 (lemmaIsPrefixRefl!0 (_2!9348 lt!317103)))))

(declare-fun call!3213 () Bool)

(assert (=> b!203476 call!3213))

(declare-fun lt!317589 () Unit!14460)

(assert (=> b!203476 (= lt!317589 lt!317583)))

(declare-fun b!203477 () Bool)

(assert (=> b!203477 (= e!139431 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun bm!3210 () Bool)

(declare-fun lt!317595 () tuple2!17392)

(assert (=> bm!3210 (= call!3213 (isPrefixOf!0 (_2!9348 lt!317103) (ite c!10090 (_2!9348 lt!317103) (_2!9348 lt!317595))))))

(declare-fun b!203478 () Bool)

(declare-fun e!139437 () Bool)

(declare-fun lt!317568 () tuple2!17390)

(declare-fun lt!317610 () tuple2!17390)

(assert (=> b!203478 (= e!139437 (= (_2!9347 lt!317568) (_2!9347 lt!317610)))))

(declare-fun b!203479 () Bool)

(declare-fun res!170472 () Bool)

(assert (=> b!203479 (=> (not res!170472) (not e!139429))))

(declare-fun lt!317609 () (_ BitVec 64))

(declare-fun lt!317586 () (_ BitVec 64))

(assert (=> b!203479 (= res!170472 (= (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317588))) (currentByte!9497 (_2!9348 lt!317588)) (currentBit!9492 (_2!9348 lt!317588))) (bvsub lt!317609 lt!317586)))))

(assert (=> b!203479 (or (= (bvand lt!317609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317586 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317609 lt!317586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203479 (= lt!317586 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!317574 () (_ BitVec 64))

(declare-fun lt!317580 () (_ BitVec 64))

(assert (=> b!203479 (= lt!317609 (bvadd lt!317574 lt!317580))))

(assert (=> b!203479 (or (not (= (bvand lt!317574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317580 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!317574 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!317574 lt!317580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203479 (= lt!317580 ((_ sign_extend 32) nBits!348))))

(assert (=> b!203479 (= lt!317574 (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))))))

(declare-fun b!203480 () Bool)

(declare-fun e!139436 () Bool)

(declare-datatypes ((tuple2!17410 0))(
  ( (tuple2!17411 (_1!9357 BitStream!8176) (_2!9357 (_ BitVec 64))) )
))
(declare-fun lt!317590 () tuple2!17410)

(declare-datatypes ((tuple2!17412 0))(
  ( (tuple2!17413 (_1!9358 BitStream!8176) (_2!9358 BitStream!8176)) )
))
(declare-fun lt!317606 () tuple2!17412)

(assert (=> b!203480 (= e!139436 (= (_1!9357 lt!317590) (_2!9358 lt!317606)))))

(declare-fun b!203481 () Bool)

(assert (=> b!203481 (= e!139429 e!139436)))

(declare-fun res!170469 () Bool)

(assert (=> b!203481 (=> (not res!170469) (not e!139436))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203481 (= res!170469 (= (_2!9357 lt!317590) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17410)

(assert (=> b!203481 (= lt!317590 (readNBitsLSBFirstsLoopPure!0 (_1!9358 lt!317606) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!317585 () Unit!14460)

(declare-fun lt!317593 () Unit!14460)

(assert (=> b!203481 (= lt!317585 lt!317593)))

(declare-fun lt!317573 () (_ BitVec 64))

(assert (=> b!203481 (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317588)))) ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317103))) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317103))) lt!317573)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8176 array!10307 (_ BitVec 64)) Unit!14460)

(assert (=> b!203481 (= lt!317593 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9348 lt!317103) (buf!5039 (_2!9348 lt!317588)) lt!317573))))

(declare-fun e!139430 () Bool)

(assert (=> b!203481 e!139430))

(declare-fun res!170470 () Bool)

(assert (=> b!203481 (=> (not res!170470) (not e!139430))))

(assert (=> b!203481 (= res!170470 (and (= (size!4534 (buf!5039 (_2!9348 lt!317103))) (size!4534 (buf!5039 (_2!9348 lt!317588)))) (bvsge lt!317573 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203481 (= lt!317573 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!203481 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8176 BitStream!8176) tuple2!17412)

(assert (=> b!203481 (= lt!317606 (reader!0 (_2!9348 lt!317103) (_2!9348 lt!317588)))))

(declare-fun b!203482 () Bool)

(declare-fun e!139433 () Bool)

(declare-fun lt!317581 () tuple2!17390)

(assert (=> b!203482 (= e!139433 (= (bitIndex!0 (size!4534 (buf!5039 (_1!9347 lt!317581))) (currentByte!9497 (_1!9347 lt!317581)) (currentBit!9492 (_1!9347 lt!317581))) (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317595))) (currentByte!9497 (_2!9348 lt!317595)) (currentBit!9492 (_2!9348 lt!317595)))))))

(declare-fun b!203483 () Bool)

(assert (=> b!203483 (= lt!317581 (readBitPure!0 (readerFrom!0 (_2!9348 lt!317595) (currentBit!9492 (_2!9348 lt!317103)) (currentByte!9497 (_2!9348 lt!317103)))))))

(declare-fun res!170463 () Bool)

(declare-fun lt!317575 () Bool)

(assert (=> b!203483 (= res!170463 (and (= (_2!9347 lt!317581) lt!317575) (= (_1!9347 lt!317581) (_2!9348 lt!317595))))))

(assert (=> b!203483 (=> (not res!170463) (not e!139433))))

(declare-fun e!139434 () Bool)

(assert (=> b!203483 (= e!139434 e!139433)))

(declare-fun b!203484 () Bool)

(assert (=> b!203484 (= e!139430 (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317103)))) ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317103))) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317103))) lt!317573))))

(declare-fun b!203485 () Bool)

(declare-fun res!170467 () Bool)

(assert (=> b!203485 (= res!170467 call!3213)))

(assert (=> b!203485 (=> (not res!170467) (not e!139434))))

(declare-fun b!203486 () Bool)

(declare-fun lt!317612 () tuple2!17392)

(assert (=> b!203486 (= e!139435 (tuple2!17393 (_1!9348 lt!317612) (_2!9348 lt!317612)))))

(assert (=> b!203486 (= lt!317575 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!203486 (= lt!317595 (appendBit!0 (_2!9348 lt!317103) lt!317575))))

(declare-fun res!170462 () Bool)

(assert (=> b!203486 (= res!170462 (= (size!4534 (buf!5039 (_2!9348 lt!317103))) (size!4534 (buf!5039 (_2!9348 lt!317595)))))))

(assert (=> b!203486 (=> (not res!170462) (not e!139434))))

(assert (=> b!203486 e!139434))

(declare-fun lt!317584 () tuple2!17392)

(assert (=> b!203486 (= lt!317584 lt!317595)))

(assert (=> b!203486 (= lt!317612 (appendBitsLSBFirstLoopTR!0 (_2!9348 lt!317584) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!317602 () Unit!14460)

(assert (=> b!203486 (= lt!317602 (lemmaIsPrefixTransitive!0 (_2!9348 lt!317103) (_2!9348 lt!317584) (_2!9348 lt!317612)))))

(assert (=> b!203486 (isPrefixOf!0 (_2!9348 lt!317103) (_2!9348 lt!317612))))

(declare-fun lt!317572 () Unit!14460)

(assert (=> b!203486 (= lt!317572 lt!317602)))

(assert (=> b!203486 (invariant!0 (currentBit!9492 (_2!9348 lt!317103)) (currentByte!9497 (_2!9348 lt!317103)) (size!4534 (buf!5039 (_2!9348 lt!317584))))))

(declare-fun lt!317618 () BitStream!8176)

(assert (=> b!203486 (= lt!317618 (BitStream!8177 (buf!5039 (_2!9348 lt!317584)) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))))))

(assert (=> b!203486 (invariant!0 (currentBit!9492 lt!317618) (currentByte!9497 lt!317618) (size!4534 (buf!5039 (_2!9348 lt!317612))))))

(declare-fun lt!317615 () BitStream!8176)

(assert (=> b!203486 (= lt!317615 (BitStream!8177 (buf!5039 (_2!9348 lt!317612)) (currentByte!9497 lt!317618) (currentBit!9492 lt!317618)))))

(assert (=> b!203486 (= lt!317568 (readBitPure!0 lt!317618))))

(assert (=> b!203486 (= lt!317610 (readBitPure!0 lt!317615))))

(declare-fun lt!317619 () Unit!14460)

(declare-fun readBitPrefixLemma!0 (BitStream!8176 BitStream!8176) Unit!14460)

(assert (=> b!203486 (= lt!317619 (readBitPrefixLemma!0 lt!317618 (_2!9348 lt!317612)))))

(declare-fun res!170465 () Bool)

(assert (=> b!203486 (= res!170465 (= (bitIndex!0 (size!4534 (buf!5039 (_1!9347 lt!317568))) (currentByte!9497 (_1!9347 lt!317568)) (currentBit!9492 (_1!9347 lt!317568))) (bitIndex!0 (size!4534 (buf!5039 (_1!9347 lt!317610))) (currentByte!9497 (_1!9347 lt!317610)) (currentBit!9492 (_1!9347 lt!317610)))))))

(assert (=> b!203486 (=> (not res!170465) (not e!139437))))

(assert (=> b!203486 e!139437))

(declare-fun lt!317576 () Unit!14460)

(assert (=> b!203486 (= lt!317576 lt!317619)))

(declare-fun lt!317577 () tuple2!17412)

(assert (=> b!203486 (= lt!317577 (reader!0 (_2!9348 lt!317103) (_2!9348 lt!317612)))))

(declare-fun lt!317616 () tuple2!17412)

(assert (=> b!203486 (= lt!317616 (reader!0 (_2!9348 lt!317584) (_2!9348 lt!317612)))))

(declare-fun lt!317569 () tuple2!17390)

(assert (=> b!203486 (= lt!317569 (readBitPure!0 (_1!9358 lt!317577)))))

(assert (=> b!203486 (= (_2!9347 lt!317569) lt!317575)))

(declare-fun lt!317608 () Unit!14460)

(declare-fun Unit!14478 () Unit!14460)

(assert (=> b!203486 (= lt!317608 Unit!14478)))

(declare-fun lt!317599 () (_ BitVec 64))

(assert (=> b!203486 (= lt!317599 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317594 () (_ BitVec 64))

(assert (=> b!203486 (= lt!317594 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317613 () Unit!14460)

(assert (=> b!203486 (= lt!317613 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9348 lt!317103) (buf!5039 (_2!9348 lt!317612)) lt!317594))))

(assert (=> b!203486 (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317612)))) ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317103))) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317103))) lt!317594)))

(declare-fun lt!317566 () Unit!14460)

(assert (=> b!203486 (= lt!317566 lt!317613)))

(declare-fun lt!317603 () tuple2!17410)

(assert (=> b!203486 (= lt!317603 (readNBitsLSBFirstsLoopPure!0 (_1!9358 lt!317577) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317599))))

(declare-fun lt!317596 () (_ BitVec 64))

(assert (=> b!203486 (= lt!317596 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!317598 () Unit!14460)

(assert (=> b!203486 (= lt!317598 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9348 lt!317584) (buf!5039 (_2!9348 lt!317612)) lt!317596))))

(assert (=> b!203486 (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317612)))) ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317584))) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317584))) lt!317596)))

(declare-fun lt!317617 () Unit!14460)

(assert (=> b!203486 (= lt!317617 lt!317598)))

(declare-fun lt!317578 () tuple2!17410)

(assert (=> b!203486 (= lt!317578 (readNBitsLSBFirstsLoopPure!0 (_1!9358 lt!317616) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317599 (ite (_2!9347 lt!317569) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!317587 () tuple2!17410)

(assert (=> b!203486 (= lt!317587 (readNBitsLSBFirstsLoopPure!0 (_1!9358 lt!317577) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317599))))

(declare-fun c!10091 () Bool)

(assert (=> b!203486 (= c!10091 (_2!9347 (readBitPure!0 (_1!9358 lt!317577))))))

(declare-fun lt!317605 () tuple2!17410)

(declare-fun withMovedBitIndex!0 (BitStream!8176 (_ BitVec 64)) BitStream!8176)

(assert (=> b!203486 (= lt!317605 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9358 lt!317577) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!317599 e!139431)))))

(declare-fun lt!317620 () Unit!14460)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14460)

(assert (=> b!203486 (= lt!317620 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9358 lt!317577) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!317599))))

(assert (=> b!203486 (and (= (_2!9357 lt!317587) (_2!9357 lt!317605)) (= (_1!9357 lt!317587) (_1!9357 lt!317605)))))

(declare-fun lt!317570 () Unit!14460)

(assert (=> b!203486 (= lt!317570 lt!317620)))

(assert (=> b!203486 (= (_1!9358 lt!317577) (withMovedBitIndex!0 (_2!9358 lt!317577) (bvsub (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))) (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317612))) (currentByte!9497 (_2!9348 lt!317612)) (currentBit!9492 (_2!9348 lt!317612))))))))

(declare-fun lt!317582 () Unit!14460)

(declare-fun Unit!14479 () Unit!14460)

(assert (=> b!203486 (= lt!317582 Unit!14479)))

(assert (=> b!203486 (= (_1!9358 lt!317616) (withMovedBitIndex!0 (_2!9358 lt!317616) (bvsub (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317584))) (currentByte!9497 (_2!9348 lt!317584)) (currentBit!9492 (_2!9348 lt!317584))) (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317612))) (currentByte!9497 (_2!9348 lt!317612)) (currentBit!9492 (_2!9348 lt!317612))))))))

(declare-fun lt!317592 () Unit!14460)

(declare-fun Unit!14480 () Unit!14460)

(assert (=> b!203486 (= lt!317592 Unit!14480)))

(assert (=> b!203486 (= (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))) (bvsub (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317584))) (currentByte!9497 (_2!9348 lt!317584)) (currentBit!9492 (_2!9348 lt!317584))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!317614 () Unit!14460)

(declare-fun Unit!14481 () Unit!14460)

(assert (=> b!203486 (= lt!317614 Unit!14481)))

(assert (=> b!203486 (= (_2!9357 lt!317603) (_2!9357 lt!317578))))

(declare-fun lt!317611 () Unit!14460)

(declare-fun Unit!14482 () Unit!14460)

(assert (=> b!203486 (= lt!317611 Unit!14482)))

(assert (=> b!203486 (invariant!0 (currentBit!9492 (_2!9348 lt!317612)) (currentByte!9497 (_2!9348 lt!317612)) (size!4534 (buf!5039 (_2!9348 lt!317612))))))

(declare-fun lt!317607 () Unit!14460)

(declare-fun Unit!14483 () Unit!14460)

(assert (=> b!203486 (= lt!317607 Unit!14483)))

(assert (=> b!203486 (= (size!4534 (buf!5039 (_2!9348 lt!317103))) (size!4534 (buf!5039 (_2!9348 lt!317612))))))

(declare-fun lt!317571 () Unit!14460)

(declare-fun Unit!14484 () Unit!14460)

(assert (=> b!203486 (= lt!317571 Unit!14484)))

(assert (=> b!203486 (= (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317612))) (currentByte!9497 (_2!9348 lt!317612)) (currentBit!9492 (_2!9348 lt!317612))) (bvsub (bvadd (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317621 () Unit!14460)

(declare-fun Unit!14485 () Unit!14460)

(assert (=> b!203486 (= lt!317621 Unit!14485)))

(declare-fun lt!317591 () Unit!14460)

(declare-fun Unit!14486 () Unit!14460)

(assert (=> b!203486 (= lt!317591 Unit!14486)))

(declare-fun lt!317567 () tuple2!17412)

(assert (=> b!203486 (= lt!317567 (reader!0 (_2!9348 lt!317103) (_2!9348 lt!317612)))))

(declare-fun lt!317601 () (_ BitVec 64))

(assert (=> b!203486 (= lt!317601 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!317579 () Unit!14460)

(assert (=> b!203486 (= lt!317579 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9348 lt!317103) (buf!5039 (_2!9348 lt!317612)) lt!317601))))

(assert (=> b!203486 (validate_offset_bits!1 ((_ sign_extend 32) (size!4534 (buf!5039 (_2!9348 lt!317612)))) ((_ sign_extend 32) (currentByte!9497 (_2!9348 lt!317103))) ((_ sign_extend 32) (currentBit!9492 (_2!9348 lt!317103))) lt!317601)))

(declare-fun lt!317604 () Unit!14460)

(assert (=> b!203486 (= lt!317604 lt!317579)))

(declare-fun lt!317597 () tuple2!17410)

(assert (=> b!203486 (= lt!317597 (readNBitsLSBFirstsLoopPure!0 (_1!9358 lt!317567) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!170464 () Bool)

(assert (=> b!203486 (= res!170464 (= (_2!9357 lt!317597) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139432 () Bool)

(assert (=> b!203486 (=> (not res!170464) (not e!139432))))

(assert (=> b!203486 e!139432))

(declare-fun lt!317600 () Unit!14460)

(declare-fun Unit!14487 () Unit!14460)

(assert (=> b!203486 (= lt!317600 Unit!14487)))

(declare-fun b!203487 () Bool)

(assert (=> b!203487 (= e!139432 (= (_1!9357 lt!317597) (_2!9358 lt!317567)))))

(declare-fun b!203488 () Bool)

(declare-fun res!170473 () Bool)

(assert (=> b!203488 (= res!170473 (= (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317595))) (currentByte!9497 (_2!9348 lt!317595)) (currentBit!9492 (_2!9348 lt!317595))) (bvadd (bitIndex!0 (size!4534 (buf!5039 (_2!9348 lt!317103))) (currentByte!9497 (_2!9348 lt!317103)) (currentBit!9492 (_2!9348 lt!317103))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!203488 (=> (not res!170473) (not e!139434))))

(declare-fun b!203489 () Bool)

(declare-fun res!170468 () Bool)

(assert (=> b!203489 (=> (not res!170468) (not e!139429))))

(assert (=> b!203489 (= res!170468 (= (size!4534 (buf!5039 (_2!9348 lt!317103))) (size!4534 (buf!5039 (_2!9348 lt!317588)))))))

(declare-fun b!203490 () Bool)

(declare-fun res!170466 () Bool)

(assert (=> b!203490 (=> (not res!170466) (not e!139429))))

(assert (=> b!203490 (= res!170466 (isPrefixOf!0 (_2!9348 lt!317103) (_2!9348 lt!317588)))))

(assert (= (and d!69501 c!10090) b!203476))

(assert (= (and d!69501 (not c!10090)) b!203486))

(assert (= (and b!203486 res!170462) b!203488))

(assert (= (and b!203488 res!170473) b!203485))

(assert (= (and b!203485 res!170467) b!203483))

(assert (= (and b!203483 res!170463) b!203482))

(assert (= (and b!203486 res!170465) b!203478))

(assert (= (and b!203486 c!10091) b!203477))

(assert (= (and b!203486 (not c!10091)) b!203475))

(assert (= (and b!203486 res!170464) b!203487))

(assert (= (or b!203476 b!203485) bm!3210))

(assert (= (and d!69501 res!170471) b!203489))

(assert (= (and b!203489 res!170468) b!203479))

(assert (= (and b!203479 res!170472) b!203490))

(assert (= (and b!203490 res!170466) b!203481))

(assert (= (and b!203481 res!170470) b!203484))

(assert (= (and b!203481 res!170469) b!203480))

(declare-fun m!314295 () Bool)

(assert (=> b!203483 m!314295))

(assert (=> b!203483 m!314295))

(declare-fun m!314297 () Bool)

(assert (=> b!203483 m!314297))

(declare-fun m!314299 () Bool)

(assert (=> b!203476 m!314299))

(declare-fun m!314301 () Bool)

(assert (=> b!203479 m!314301))

(assert (=> b!203479 m!314057))

(declare-fun m!314303 () Bool)

(assert (=> b!203482 m!314303))

(declare-fun m!314305 () Bool)

(assert (=> b!203482 m!314305))

(declare-fun m!314307 () Bool)

(assert (=> bm!3210 m!314307))

(declare-fun m!314309 () Bool)

(assert (=> b!203484 m!314309))

(declare-fun m!314311 () Bool)

(assert (=> b!203481 m!314311))

(declare-fun m!314313 () Bool)

(assert (=> b!203481 m!314313))

(declare-fun m!314315 () Bool)

(assert (=> b!203481 m!314315))

(declare-fun m!314317 () Bool)

(assert (=> b!203481 m!314317))

(declare-fun m!314319 () Bool)

(assert (=> b!203481 m!314319))

(declare-fun m!314321 () Bool)

(assert (=> b!203481 m!314321))

(declare-fun m!314323 () Bool)

(assert (=> d!69501 m!314323))

(declare-fun m!314325 () Bool)

(assert (=> b!203490 m!314325))

(assert (=> b!203488 m!314305))

(assert (=> b!203488 m!314057))

(declare-fun m!314327 () Bool)

(assert (=> b!203486 m!314327))

(declare-fun m!314329 () Bool)

(assert (=> b!203486 m!314329))

(declare-fun m!314331 () Bool)

(assert (=> b!203486 m!314331))

(declare-fun m!314333 () Bool)

(assert (=> b!203486 m!314333))

(declare-fun m!314335 () Bool)

(assert (=> b!203486 m!314335))

(declare-fun m!314337 () Bool)

(assert (=> b!203486 m!314337))

(declare-fun m!314339 () Bool)

(assert (=> b!203486 m!314339))

(declare-fun m!314341 () Bool)

(assert (=> b!203486 m!314341))

(declare-fun m!314343 () Bool)

(assert (=> b!203486 m!314343))

(declare-fun m!314345 () Bool)

(assert (=> b!203486 m!314345))

(assert (=> b!203486 m!314339))

(declare-fun m!314347 () Bool)

(assert (=> b!203486 m!314347))

(declare-fun m!314349 () Bool)

(assert (=> b!203486 m!314349))

(declare-fun m!314351 () Bool)

(assert (=> b!203486 m!314351))

(declare-fun m!314353 () Bool)

(assert (=> b!203486 m!314353))

(declare-fun m!314355 () Bool)

(assert (=> b!203486 m!314355))

(assert (=> b!203486 m!314057))

(declare-fun m!314357 () Bool)

(assert (=> b!203486 m!314357))

(declare-fun m!314359 () Bool)

(assert (=> b!203486 m!314359))

(assert (=> b!203486 m!314315))

(declare-fun m!314361 () Bool)

(assert (=> b!203486 m!314361))

(declare-fun m!314363 () Bool)

(assert (=> b!203486 m!314363))

(declare-fun m!314365 () Bool)

(assert (=> b!203486 m!314365))

(declare-fun m!314367 () Bool)

(assert (=> b!203486 m!314367))

(declare-fun m!314369 () Bool)

(assert (=> b!203486 m!314369))

(declare-fun m!314371 () Bool)

(assert (=> b!203486 m!314371))

(declare-fun m!314373 () Bool)

(assert (=> b!203486 m!314373))

(assert (=> b!203486 m!314317))

(declare-fun m!314375 () Bool)

(assert (=> b!203486 m!314375))

(declare-fun m!314377 () Bool)

(assert (=> b!203486 m!314377))

(declare-fun m!314379 () Bool)

(assert (=> b!203486 m!314379))

(declare-fun m!314381 () Bool)

(assert (=> b!203486 m!314381))

(declare-fun m!314383 () Bool)

(assert (=> b!203486 m!314383))

(declare-fun m!314385 () Bool)

(assert (=> b!203486 m!314385))

(declare-fun m!314387 () Bool)

(assert (=> b!203486 m!314387))

(assert (=> b!203256 d!69501))

(declare-fun d!69525 () Bool)

(declare-fun e!139438 () Bool)

(assert (=> d!69525 e!139438))

(declare-fun res!170474 () Bool)

(assert (=> d!69525 (=> (not res!170474) (not e!139438))))

(declare-fun lt!317626 () (_ BitVec 64))

(declare-fun lt!317627 () (_ BitVec 64))

(declare-fun lt!317623 () (_ BitVec 64))

(assert (=> d!69525 (= res!170474 (= lt!317626 (bvsub lt!317627 lt!317623)))))

(assert (=> d!69525 (or (= (bvand lt!317627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!317623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!317627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!317627 lt!317623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69525 (= lt!317623 (remainingBits!0 ((_ sign_extend 32) (size!4534 (buf!5039 (_1!9347 lt!317109)))) ((_ sign_extend 32) (currentByte!9497 (_1!9347 lt!317109))) ((_ sign_extend 32) (currentBit!9492 (_1!9347 lt!317109)))))))

(declare-fun lt!317624 () (_ BitVec 64))

(declare-fun lt!317622 () (_ BitVec 64))

(assert (=> d!69525 (= lt!317627 (bvmul lt!317624 lt!317622))))

(assert (=> d!69525 (or (= lt!317624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!317622 (bvsdiv (bvmul lt!317624 lt!317622) lt!317624)))))

(assert (=> d!69525 (= lt!317622 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69525 (= lt!317624 ((_ sign_extend 32) (size!4534 (buf!5039 (_1!9347 lt!317109)))))))

(assert (=> d!69525 (= lt!317626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9497 (_1!9347 lt!317109))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9492 (_1!9347 lt!317109)))))))

(assert (=> d!69525 (invariant!0 (currentBit!9492 (_1!9347 lt!317109)) (currentByte!9497 (_1!9347 lt!317109)) (size!4534 (buf!5039 (_1!9347 lt!317109))))))

(assert (=> d!69525 (= (bitIndex!0 (size!4534 (buf!5039 (_1!9347 lt!317109))) (currentByte!9497 (_1!9347 lt!317109)) (currentBit!9492 (_1!9347 lt!317109))) lt!317626)))

(declare-fun b!203491 () Bool)

(declare-fun res!170475 () Bool)

(assert (=> b!203491 (=> (not res!170475) (not e!139438))))

(assert (=> b!203491 (= res!170475 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!317626))))

(declare-fun b!203492 () Bool)

(declare-fun lt!317625 () (_ BitVec 64))

(assert (=> b!203492 (= e!139438 (bvsle lt!317626 (bvmul lt!317625 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!203492 (or (= lt!317625 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!317625 #b0000000000000000000000000000000000000000000000000000000000001000) lt!317625)))))

(assert (=> b!203492 (= lt!317625 ((_ sign_extend 32) (size!4534 (buf!5039 (_1!9347 lt!317109)))))))

(assert (= (and d!69525 res!170474) b!203491))

(assert (= (and b!203491 res!170475) b!203492))

(declare-fun m!314389 () Bool)

(assert (=> d!69525 m!314389))

(declare-fun m!314391 () Bool)

(assert (=> d!69525 m!314391))

(assert (=> b!203252 d!69525))

(declare-fun d!69527 () Bool)

(assert (=> d!69527 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9492 thiss!1204) (currentByte!9497 thiss!1204) (size!4534 (buf!5039 thiss!1204))))))

(declare-fun bs!17133 () Bool)

(assert (= bs!17133 d!69527))

(assert (=> bs!17133 m!314049))

(assert (=> start!43116 d!69527))

(push 1)

(assert (not d!69483))

(assert (not d!69527))

(assert (not b!203364))

(assert (not d!69475))

(assert (not b!203482))

(assert (not d!69473))

(assert (not b!203343))

(assert (not b!203357))

(assert (not b!203358))

(assert (not b!203362))

(assert (not b!203361))

(assert (not bm!3210))

(assert (not b!203488))

(assert (not b!203486))

(assert (not b!203481))

(assert (not b!203483))

(assert (not b!203484))

(assert (not b!203490))

(assert (not b!203356))

(assert (not b!203355))

(assert (not d!69487))

(assert (not b!203476))

(assert (not d!69495))

(assert (not b!203479))

(assert (not d!69525))

(assert (not b!203345))

(assert (not d!69501))

(assert (not d!69499))

(assert (not d!69493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

