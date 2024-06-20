; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17474 () Bool)

(assert start!17474)

(declare-fun b!84241 () Bool)

(declare-fun res!69145 () Bool)

(declare-fun e!56328 () Bool)

(assert (=> b!84241 (=> (not res!69145) (not e!56328))))

(declare-datatypes ((array!3991 0))(
  ( (array!3992 (arr!2444 (Array (_ BitVec 32) (_ BitVec 8))) (size!1807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3176 0))(
  ( (BitStream!3177 (buf!2197 array!3991) (currentByte!4355 (_ BitVec 32)) (currentBit!4350 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3176)

(declare-fun nBits!333 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84241 (= res!69145 (validate_offset_bits!1 ((_ sign_extend 32) (size!1807 (buf!2197 thiss!1136))) ((_ sign_extend 32) (currentByte!4355 thiss!1136)) ((_ sign_extend 32) (currentBit!4350 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun res!69146 () Bool)

(assert (=> start!17474 (=> (not res!69146) (not e!56328))))

(assert (=> start!17474 (= res!69146 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17474 e!56328))

(assert (=> start!17474 true))

(declare-fun e!56327 () Bool)

(declare-fun inv!12 (BitStream!3176) Bool)

(assert (=> start!17474 (and (inv!12 thiss!1136) e!56327)))

(declare-fun b!84242 () Bool)

(declare-fun e!56326 () Bool)

(declare-datatypes ((Unit!5647 0))(
  ( (Unit!5648) )
))
(declare-datatypes ((tuple3!362 0))(
  ( (tuple3!363 (_1!3819 Unit!5647) (_2!3819 BitStream!3176) (_3!205 (_ BitVec 32))) )
))
(declare-fun lt!134178 () tuple3!362)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84242 (= e!56326 (not (invariant!0 (currentBit!4350 (_2!3819 lt!134178)) (currentByte!4355 (_2!3819 lt!134178)) (size!1807 (buf!2197 (_2!3819 lt!134178))))))))

(declare-fun b!84243 () Bool)

(declare-fun e!56324 () tuple3!362)

(declare-fun Unit!5649 () Unit!5647)

(assert (=> b!84243 (= e!56324 (tuple3!363 Unit!5649 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84244 () Bool)

(declare-fun res!69148 () Bool)

(assert (=> b!84244 (=> (not res!69148) (not e!56328))))

(assert (=> b!84244 (= res!69148 (invariant!0 (currentBit!4350 thiss!1136) (currentByte!4355 thiss!1136) (size!1807 (buf!2197 thiss!1136))))))

(declare-fun v!176 () (_ BitVec 64))

(declare-fun b!84245 () Bool)

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3176 (_ BitVec 64) BitStream!3176 (_ BitVec 32)) tuple3!362)

(assert (=> b!84245 (= e!56324 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000))))

(declare-fun b!84246 () Bool)

(assert (=> b!84246 (= e!56328 e!56326)))

(declare-fun res!69147 () Bool)

(assert (=> b!84246 (=> (not res!69147) (not e!56326))))

(assert (=> b!84246 (= res!69147 (= (size!1807 (buf!2197 (_2!3819 lt!134178))) (size!1807 (buf!2197 thiss!1136))))))

(assert (=> b!84246 (= lt!134178 e!56324)))

(declare-fun c!5795 () Bool)

(assert (=> b!84246 (= c!5795 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84247 () Bool)

(declare-fun array_inv!1653 (array!3991) Bool)

(assert (=> b!84247 (= e!56327 (array_inv!1653 (buf!2197 thiss!1136)))))

(assert (= (and start!17474 res!69146) b!84241))

(assert (= (and b!84241 res!69145) b!84244))

(assert (= (and b!84244 res!69148) b!84246))

(assert (= (and b!84246 c!5795) b!84245))

(assert (= (and b!84246 (not c!5795)) b!84243))

(assert (= (and b!84246 res!69147) b!84242))

(assert (= start!17474 b!84247))

(declare-fun m!130901 () Bool)

(assert (=> start!17474 m!130901))

(declare-fun m!130903 () Bool)

(assert (=> b!84241 m!130903))

(declare-fun m!130905 () Bool)

(assert (=> b!84247 m!130905))

(declare-fun m!130907 () Bool)

(assert (=> b!84244 m!130907))

(declare-fun m!130909 () Bool)

(assert (=> b!84242 m!130909))

(declare-fun m!130911 () Bool)

(assert (=> b!84245 m!130911))

(push 1)

(assert (not b!84241))

(assert (not b!84242))

(assert (not b!84244))

(assert (not b!84245))

(assert (not start!17474))

(assert (not b!84247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27126 () Bool)

(assert (=> d!27126 (= (invariant!0 (currentBit!4350 (_2!3819 lt!134178)) (currentByte!4355 (_2!3819 lt!134178)) (size!1807 (buf!2197 (_2!3819 lt!134178)))) (and (bvsge (currentBit!4350 (_2!3819 lt!134178)) #b00000000000000000000000000000000) (bvslt (currentBit!4350 (_2!3819 lt!134178)) #b00000000000000000000000000001000) (bvsge (currentByte!4355 (_2!3819 lt!134178)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4355 (_2!3819 lt!134178)) (size!1807 (buf!2197 (_2!3819 lt!134178)))) (and (= (currentBit!4350 (_2!3819 lt!134178)) #b00000000000000000000000000000000) (= (currentByte!4355 (_2!3819 lt!134178)) (size!1807 (buf!2197 (_2!3819 lt!134178))))))))))

(assert (=> b!84242 d!27126))

(declare-fun d!27128 () Bool)

(assert (=> d!27128 (= (array_inv!1653 (buf!2197 thiss!1136)) (bvsge (size!1807 (buf!2197 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84247 d!27128))

(declare-fun d!27130 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27130 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1807 (buf!2197 thiss!1136))) ((_ sign_extend 32) (currentByte!4355 thiss!1136)) ((_ sign_extend 32) (currentBit!4350 thiss!1136)) ((_ sign_extend 32) nBits!333)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1807 (buf!2197 thiss!1136))) ((_ sign_extend 32) (currentByte!4355 thiss!1136)) ((_ sign_extend 32) (currentBit!4350 thiss!1136))) ((_ sign_extend 32) nBits!333)))))

(declare-fun bs!6710 () Bool)

(assert (= bs!6710 d!27130))

(declare-fun m!130917 () Bool)

(assert (=> bs!6710 m!130917))

(assert (=> b!84241 d!27130))

(declare-fun d!27132 () Bool)

(assert (=> d!27132 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4350 thiss!1136) (currentByte!4355 thiss!1136) (size!1807 (buf!2197 thiss!1136))))))

(declare-fun bs!6711 () Bool)

(assert (= bs!6711 d!27132))

(assert (=> bs!6711 m!130907))

(assert (=> start!17474 d!27132))

(declare-fun b!84280 () Bool)

(declare-fun res!69181 () Bool)

(declare-fun e!56342 () Bool)

(assert (=> b!84280 (=> (not res!69181) (not e!56342))))

(declare-datatypes ((tuple2!7228 0))(
  ( (tuple2!7229 (_1!3820 Unit!5647) (_2!3820 BitStream!3176)) )
))
(declare-fun lt!134197 () tuple2!7228)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84280 (= res!69181 (= (bitIndex!0 (size!1807 (buf!2197 (_2!3820 lt!134197))) (currentByte!4355 (_2!3820 lt!134197)) (currentBit!4350 (_2!3820 lt!134197))) (bvadd (bitIndex!0 (size!1807 (buf!2197 thiss!1136)) (currentByte!4355 thiss!1136) (currentBit!4350 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!84281 () Bool)

(declare-fun e!56340 () tuple3!362)

(declare-fun lt!134198 () tuple2!7228)

(declare-fun lt!134200 () (_ BitVec 32))

(declare-fun Unit!5650 () Unit!5647)

(assert (=> b!84281 (= e!56340 (tuple3!363 Unit!5650 (_2!3820 lt!134198) lt!134200))))

(declare-fun b!84282 () Bool)

(declare-fun e!56339 () Bool)

(assert (=> b!84282 (= e!56342 e!56339)))

(declare-fun res!69183 () Bool)

(assert (=> b!84282 (=> (not res!69183) (not e!56339))))

(declare-fun lt!134195 () Bool)

(declare-datatypes ((tuple2!7230 0))(
  ( (tuple2!7231 (_1!3821 BitStream!3176) (_2!3821 Bool)) )
))
(declare-fun lt!134199 () tuple2!7230)

(assert (=> b!84282 (= res!69183 (and (= (_2!3821 lt!134199) lt!134195) (= (_1!3821 lt!134199) (_2!3820 lt!134197))))))

(declare-fun readBitPure!0 (BitStream!3176) tuple2!7230)

(declare-fun readerFrom!0 (BitStream!3176 (_ BitVec 32) (_ BitVec 32)) BitStream!3176)

(assert (=> b!84282 (= lt!134199 (readBitPure!0 (readerFrom!0 (_2!3820 lt!134197) (currentBit!4350 thiss!1136) (currentByte!4355 thiss!1136))))))

(declare-fun b!84283 () Bool)

(declare-fun res!69187 () Bool)

(assert (=> b!84283 (=> (not res!69187) (not e!56342))))

(declare-fun isPrefixOf!0 (BitStream!3176 BitStream!3176) Bool)

(assert (=> b!84283 (= res!69187 (isPrefixOf!0 thiss!1136 (_2!3820 lt!134197)))))

(declare-fun b!84284 () Bool)

(declare-fun res!69190 () Bool)

(declare-fun e!56341 () Bool)

(assert (=> b!84284 (=> (not res!69190) (not e!56341))))

(assert (=> b!84284 (= res!69190 (validate_offset_bits!1 ((_ sign_extend 32) (size!1807 (buf!2197 thiss!1136))) ((_ sign_extend 32) (currentByte!4355 thiss!1136)) ((_ sign_extend 32) (currentBit!4350 thiss!1136)) ((_ sign_extend 32) (bvsub nBits!333 #b00000000000000000000000000000000))))))

(declare-fun d!27134 () Bool)

(declare-fun e!56343 () Bool)

(assert (=> d!27134 e!56343))

(declare-fun res!69178 () Bool)

(assert (=> d!27134 (=> (not res!69178) (not e!56343))))

(declare-fun lt!134201 () tuple3!362)

(assert (=> d!27134 (= res!69178 (bvsge (_3!205 lt!134201) #b00000000000000000000000000000000))))

(assert (=> d!27134 (= lt!134201 e!56340)))

(declare-fun c!5798 () Bool)

(assert (=> d!27134 (= c!5798 (bvslt lt!134200 nBits!333))))

(assert (=> d!27134 (= lt!134200 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(assert (=> d!27134 (= lt!134198 lt!134197)))

(assert (=> d!27134 e!56342))

(declare-fun res!69184 () Bool)

(assert (=> d!27134 (=> (not res!69184) (not e!56342))))

(assert (=> d!27134 (= res!69184 (= (size!1807 (buf!2197 thiss!1136)) (size!1807 (buf!2197 (_2!3820 lt!134197)))))))

(declare-fun appendBit!0 (BitStream!3176 Bool) tuple2!7228)

(assert (=> d!27134 (= lt!134197 (appendBit!0 thiss!1136 lt!134195))))

(assert (=> d!27134 (= lt!134195 (not (= (bvand v!176 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27134 e!56341))

(declare-fun res!69179 () Bool)

(assert (=> d!27134 (=> (not res!69179) (not e!56341))))

(assert (=> d!27134 (= res!69179 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000))))

(assert (=> d!27134 (= (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 thiss!1136 #b00000000000000000000000000000000) lt!134201)))

(declare-fun b!84285 () Bool)

(assert (=> b!84285 (= e!56343 (bvsge (_3!205 lt!134201) nBits!333))))

(declare-fun b!84286 () Bool)

(assert (=> b!84286 (= e!56341 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84287 () Bool)

(declare-fun res!69188 () Bool)

(assert (=> b!84287 (=> (not res!69188) (not e!56343))))

(assert (=> b!84287 (= res!69188 (and (bvsle (_3!205 lt!134201) nBits!333) (= (size!1807 (buf!2197 (_2!3819 lt!134201))) (size!1807 (buf!2197 thiss!1136)))))))

(declare-fun b!84288 () Bool)

(assert (=> b!84288 (= e!56340 (appendBitsLSBFirstWhileWhile!0 nBits!333 thiss!1136 v!176 (_2!3820 lt!134198) lt!134200))))

(declare-fun b!84289 () Bool)

(declare-fun res!69180 () Bool)

(assert (=> b!84289 (=> (not res!69180) (not e!56343))))

(assert (=> b!84289 (= res!69180 (invariant!0 (currentBit!4350 (_2!3819 lt!134201)) (currentByte!4355 (_2!3819 lt!134201)) (size!1807 (buf!2197 (_2!3819 lt!134201)))))))

(declare-fun b!84290 () Bool)

(declare-fun res!69189 () Bool)

(assert (=> b!84290 (=> (not res!69189) (not e!56343))))

(declare-fun lt!134202 () (_ BitVec 64))

(declare-fun lt!134196 () (_ BitVec 64))

(assert (=> b!84290 (= res!69189 (= (bitIndex!0 (size!1807 (buf!2197 (_2!3819 lt!134201))) (currentByte!4355 (_2!3819 lt!134201)) (currentBit!4350 (_2!3819 lt!134201))) (bvadd lt!134196 lt!134202)))))

(assert (=> b!84290 (or (not (= (bvand lt!134196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134202 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134196 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134196 lt!134202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!84290 (= lt!134202 ((_ sign_extend 32) (_3!205 lt!134201)))))

(assert (=> b!84290 (= lt!134196 (bitIndex!0 (size!1807 (buf!2197 thiss!1136)) (currentByte!4355 thiss!1136) (currentBit!4350 thiss!1136)))))

(declare-fun b!84291 () Bool)

(declare-fun res!69177 () Bool)

(assert (=> b!84291 (=> (not res!69177) (not e!56341))))

(assert (=> b!84291 (= res!69177 (and (bvsle #b00000000000000000000000000000000 nBits!333) (= (size!1807 (buf!2197 thiss!1136)) (size!1807 (buf!2197 thiss!1136)))))))

(declare-fun b!84292 () Bool)

(assert (=> b!84292 (= e!56339 (= (bitIndex!0 (size!1807 (buf!2197 (_1!3821 lt!134199))) (currentByte!4355 (_1!3821 lt!134199)) (currentBit!4350 (_1!3821 lt!134199))) (bitIndex!0 (size!1807 (buf!2197 (_2!3820 lt!134197))) (currentByte!4355 (_2!3820 lt!134197)) (currentBit!4350 (_2!3820 lt!134197)))))))

(declare-fun b!84293 () Bool)

(declare-fun res!69186 () Bool)

(assert (=> b!84293 (=> (not res!69186) (not e!56341))))

(assert (=> b!84293 (= res!69186 (invariant!0 (currentBit!4350 thiss!1136) (currentByte!4355 thiss!1136) (size!1807 (buf!2197 thiss!1136))))))

(declare-fun b!84294 () Bool)

(declare-fun res!69182 () Bool)

(assert (=> b!84294 (=> (not res!69182) (not e!56341))))

(assert (=> b!84294 (= res!69182 (= (bitIndex!0 (size!1807 (buf!2197 thiss!1136)) (currentByte!4355 thiss!1136) (currentBit!4350 thiss!1136)) (bvadd (bitIndex!0 (size!1807 (buf!2197 thiss!1136)) (currentByte!4355 thiss!1136) (currentBit!4350 thiss!1136)) ((_ sign_extend 32) #b00000000000000000000000000000000))))))

(declare-fun b!84295 () Bool)

(declare-fun res!69185 () Bool)

(assert (=> b!84295 (=> (not res!69185) (not e!56343))))

(assert (=> b!84295 (= res!69185 (validate_offset_bits!1 ((_ sign_extend 32) (size!1807 (buf!2197 (_2!3819 lt!134201)))) ((_ sign_extend 32) (currentByte!4355 (_2!3819 lt!134201))) ((_ sign_extend 32) (currentBit!4350 (_2!3819 lt!134201))) ((_ sign_extend 32) (bvsub nBits!333 (_3!205 lt!134201)))))))

(assert (=> b!84295 (or (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (_3!205 lt!134201) #b10000000000000000000000000000000)) (= (bvand nBits!333 #b10000000000000000000000000000000) (bvand (bvsub nBits!333 (_3!205 lt!134201)) #b10000000000000000000000000000000)))))

(assert (= (and d!27134 res!69179) b!84293))

(assert (= (and b!84293 res!69186) b!84291))

(assert (= (and b!84291 res!69177) b!84294))

(assert (= (and b!84294 res!69182) b!84284))

(assert (= (and b!84284 res!69190) b!84286))

(assert (= (and d!27134 res!69184) b!84280))

(assert (= (and b!84280 res!69181) b!84283))

(assert (= (and b!84283 res!69187) b!84282))

(assert (= (and b!84282 res!69183) b!84292))

(assert (= (and d!27134 c!5798) b!84288))

(assert (= (and d!27134 (not c!5798)) b!84281))

(assert (= (and d!27134 res!69178) b!84289))

(assert (= (and b!84289 res!69180) b!84287))

(assert (= (and b!84287 res!69188) b!84290))

(assert (= (and b!84290 res!69189) b!84295))

(assert (= (and b!84295 res!69185) b!84285))

(declare-fun m!130919 () Bool)

(assert (=> b!84282 m!130919))

(assert (=> b!84282 m!130919))

(declare-fun m!130921 () Bool)

(assert (=> b!84282 m!130921))

(assert (=> b!84293 m!130907))

(declare-fun m!130923 () Bool)

(assert (=> b!84288 m!130923))

(declare-fun m!130925 () Bool)

(assert (=> b!84283 m!130925))

(declare-fun m!130927 () Bool)

(assert (=> d!27134 m!130927))

(declare-fun m!130929 () Bool)

(assert (=> b!84284 m!130929))

(declare-fun m!130931 () Bool)

(assert (=> b!84289 m!130931))

(declare-fun m!130933 () Bool)

(assert (=> b!84280 m!130933))

(declare-fun m!130935 () Bool)

(assert (=> b!84280 m!130935))

(declare-fun m!130937 () Bool)

(assert (=> b!84292 m!130937))

(assert (=> b!84292 m!130933))

(assert (=> b!84294 m!130935))

(assert (=> b!84294 m!130935))

(declare-fun m!130939 () Bool)

(assert (=> b!84290 m!130939))

(assert (=> b!84290 m!130935))

(declare-fun m!130941 () Bool)

(assert (=> b!84295 m!130941))

(assert (=> b!84245 d!27134))

(declare-fun d!27136 () Bool)

(assert (=> d!27136 (= (invariant!0 (currentBit!4350 thiss!1136) (currentByte!4355 thiss!1136) (size!1807 (buf!2197 thiss!1136))) (and (bvsge (currentBit!4350 thiss!1136) #b00000000000000000000000000000000) (bvslt (currentBit!4350 thiss!1136) #b00000000000000000000000000001000) (bvsge (currentByte!4355 thiss!1136) #b00000000000000000000000000000000) (or (bvslt (currentByte!4355 thiss!1136) (size!1807 (buf!2197 thiss!1136))) (and (= (currentBit!4350 thiss!1136) #b00000000000000000000000000000000) (= (currentByte!4355 thiss!1136) (size!1807 (buf!2197 thiss!1136)))))))))

(assert (=> b!84244 d!27136))

(push 1)

(assert (not b!84290))

(assert (not b!84292))

(assert (not b!84288))

(assert (not b!84283))

(assert (not b!84289))

(assert (not d!27130))

(assert (not b!84282))

(assert (not b!84295))

(assert (not b!84284))

(assert (not d!27132))

(assert (not d!27134))

(assert (not b!84294))

(assert (not b!84293))

(assert (not b!84280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

