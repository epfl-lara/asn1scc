; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23680 () Bool)

(assert start!23680)

(declare-fun b!119962 () Bool)

(declare-fun res!99310 () Bool)

(declare-fun e!78594 () Bool)

(assert (=> b!119962 (=> (not res!99310) (not e!78594))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119962 (= res!99310 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!119963 () Bool)

(declare-fun e!78587 () Bool)

(declare-datatypes ((array!5350 0))(
  ( (array!5351 (arr!3016 (Array (_ BitVec 32) (_ BitVec 8))) (size!2423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4320 0))(
  ( (BitStream!4321 (buf!2851 array!5350) (currentByte!5524 (_ BitVec 32)) (currentBit!5519 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4320)

(declare-datatypes ((Unit!7389 0))(
  ( (Unit!7390) )
))
(declare-datatypes ((tuple2!10056 0))(
  ( (tuple2!10057 (_1!5293 Unit!7389) (_2!5293 BitStream!4320)) )
))
(declare-fun lt!186215 () tuple2!10056)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119963 (= e!78587 (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186215)))))))

(declare-fun lt!186229 () tuple2!10056)

(declare-datatypes ((tuple2!10058 0))(
  ( (tuple2!10059 (_1!5294 BitStream!4320) (_2!5294 BitStream!4320)) )
))
(declare-fun lt!186212 () tuple2!10058)

(declare-fun lt!186217 () (_ BitVec 64))

(declare-fun b!119964 () Bool)

(declare-fun e!78588 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4320 (_ BitVec 64)) BitStream!4320)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119964 (= e!78588 (= (_1!5294 lt!186212) (withMovedBitIndex!0 (_2!5294 lt!186212) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217))))))

(declare-fun lt!186231 () tuple2!10058)

(declare-fun lt!186216 () (_ BitVec 64))

(assert (=> b!119964 (= (_1!5294 lt!186231) (withMovedBitIndex!0 (_2!5294 lt!186231) (bvsub lt!186216 lt!186217)))))

(assert (=> b!119964 (= lt!186217 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186215))) (currentByte!5524 (_2!5293 lt!186215)) (currentBit!5519 (_2!5293 lt!186215))))))

(assert (=> b!119964 (= lt!186216 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(declare-datatypes ((tuple2!10060 0))(
  ( (tuple2!10061 (_1!5295 BitStream!4320) (_2!5295 (_ BitVec 64))) )
))
(declare-fun lt!186214 () tuple2!10060)

(declare-fun lt!186207 () tuple2!10060)

(assert (=> b!119964 (and (= (_2!5295 lt!186214) (_2!5295 lt!186207)) (= (_1!5295 lt!186214) (_1!5295 lt!186207)))))

(declare-fun lt!186208 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!186219 () Unit!7389)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7389)

(assert (=> b!119964 (= lt!186219 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5294 lt!186231) nBits!396 i!615 lt!186208))))

(declare-fun lt!186226 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10060)

(assert (=> b!119964 (= lt!186207 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186226))))

(declare-fun b!119965 () Bool)

(declare-fun e!78586 () Bool)

(declare-fun e!78592 () Bool)

(assert (=> b!119965 (= e!78586 e!78592)))

(declare-fun res!99318 () Bool)

(assert (=> b!119965 (=> (not res!99318) (not e!78592))))

(declare-fun lt!186209 () (_ BitVec 64))

(declare-fun lt!186222 () (_ BitVec 64))

(assert (=> b!119965 (= res!99318 (= lt!186209 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!186222)))))

(assert (=> b!119965 (= lt!186209 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))))))

(assert (=> b!119965 (= lt!186222 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(declare-fun b!119966 () Bool)

(assert (=> b!119966 (= e!78594 (not e!78588))))

(declare-fun res!99308 () Bool)

(assert (=> b!119966 (=> res!99308 e!78588)))

(assert (=> b!119966 (= res!99308 (not (= (_1!5295 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!186212) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186226)) (_2!5294 lt!186212))))))

(declare-fun lt!186213 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119966 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229))) lt!186213)))

(declare-fun lt!186223 () Unit!7389)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4320 array!5350 (_ BitVec 64)) Unit!7389)

(assert (=> b!119966 (= lt!186223 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5293 lt!186229) (buf!2851 (_2!5293 lt!186215)) lt!186213))))

(assert (=> b!119966 (= lt!186213 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10062 0))(
  ( (tuple2!10063 (_1!5296 BitStream!4320) (_2!5296 Bool)) )
))
(declare-fun lt!186230 () tuple2!10062)

(declare-fun lt!186221 () (_ BitVec 64))

(assert (=> b!119966 (= lt!186226 (bvor lt!186208 (ite (_2!5296 lt!186230) lt!186221 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119966 (= lt!186214 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!186231) nBits!396 i!615 lt!186208))))

(declare-fun lt!186227 () (_ BitVec 64))

(assert (=> b!119966 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305)) lt!186227)))

(declare-fun lt!186224 () Unit!7389)

(assert (=> b!119966 (= lt!186224 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2851 (_2!5293 lt!186215)) lt!186227))))

(assert (=> b!119966 (= lt!186208 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!186228 () Bool)

(assert (=> b!119966 (= (_2!5296 lt!186230) lt!186228)))

(declare-fun readBitPure!0 (BitStream!4320) tuple2!10062)

(assert (=> b!119966 (= lt!186230 (readBitPure!0 (_1!5294 lt!186231)))))

(declare-fun reader!0 (BitStream!4320 BitStream!4320) tuple2!10058)

(assert (=> b!119966 (= lt!186212 (reader!0 (_2!5293 lt!186229) (_2!5293 lt!186215)))))

(assert (=> b!119966 (= lt!186231 (reader!0 thiss!1305 (_2!5293 lt!186215)))))

(declare-fun e!78590 () Bool)

(assert (=> b!119966 e!78590))

(declare-fun res!99309 () Bool)

(assert (=> b!119966 (=> (not res!99309) (not e!78590))))

(declare-fun lt!186225 () tuple2!10062)

(declare-fun lt!186220 () tuple2!10062)

(assert (=> b!119966 (= res!99309 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186225))) (currentByte!5524 (_1!5296 lt!186225)) (currentBit!5519 (_1!5296 lt!186225))) (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186220))) (currentByte!5524 (_1!5296 lt!186220)) (currentBit!5519 (_1!5296 lt!186220)))))))

(declare-fun lt!186206 () Unit!7389)

(declare-fun lt!186210 () BitStream!4320)

(declare-fun readBitPrefixLemma!0 (BitStream!4320 BitStream!4320) Unit!7389)

(assert (=> b!119966 (= lt!186206 (readBitPrefixLemma!0 lt!186210 (_2!5293 lt!186215)))))

(assert (=> b!119966 (= lt!186220 (readBitPure!0 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305))))))

(assert (=> b!119966 (= lt!186225 (readBitPure!0 lt!186210))))

(assert (=> b!119966 (= lt!186210 (BitStream!4321 (buf!2851 (_2!5293 lt!186229)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(assert (=> b!119966 e!78587))

(declare-fun res!99314 () Bool)

(assert (=> b!119966 (=> (not res!99314) (not e!78587))))

(declare-fun isPrefixOf!0 (BitStream!4320 BitStream!4320) Bool)

(assert (=> b!119966 (= res!99314 (isPrefixOf!0 thiss!1305 (_2!5293 lt!186215)))))

(declare-fun lt!186211 () Unit!7389)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4320 BitStream!4320 BitStream!4320) Unit!7389)

(assert (=> b!119966 (= lt!186211 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5293 lt!186229) (_2!5293 lt!186215)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10056)

(assert (=> b!119966 (= lt!186215 (appendNLeastSignificantBitsLoop!0 (_2!5293 lt!186229) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!119966 e!78586))

(declare-fun res!99312 () Bool)

(assert (=> b!119966 (=> (not res!99312) (not e!78586))))

(assert (=> b!119966 (= res!99312 (= (size!2423 (buf!2851 thiss!1305)) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(declare-fun appendBit!0 (BitStream!4320 Bool) tuple2!10056)

(assert (=> b!119966 (= lt!186229 (appendBit!0 thiss!1305 lt!186228))))

(assert (=> b!119966 (= lt!186228 (not (= (bvand v!199 lt!186221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119966 (= lt!186221 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!99317 () Bool)

(declare-fun e!78589 () Bool)

(assert (=> start!23680 (=> (not res!99317) (not e!78589))))

(assert (=> start!23680 (= res!99317 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23680 e!78589))

(assert (=> start!23680 true))

(declare-fun e!78585 () Bool)

(declare-fun inv!12 (BitStream!4320) Bool)

(assert (=> start!23680 (and (inv!12 thiss!1305) e!78585)))

(declare-fun b!119967 () Bool)

(declare-fun array_inv!2225 (array!5350) Bool)

(assert (=> b!119967 (= e!78585 (array_inv!2225 (buf!2851 thiss!1305)))))

(declare-fun b!119968 () Bool)

(declare-fun res!99315 () Bool)

(assert (=> b!119968 (=> (not res!99315) (not e!78594))))

(assert (=> b!119968 (= res!99315 (bvslt i!615 nBits!396))))

(declare-fun b!119969 () Bool)

(declare-fun res!99311 () Bool)

(assert (=> b!119969 (=> (not res!99311) (not e!78592))))

(assert (=> b!119969 (= res!99311 (isPrefixOf!0 thiss!1305 (_2!5293 lt!186229)))))

(declare-fun b!119970 () Bool)

(assert (=> b!119970 (= e!78590 (= (_2!5296 lt!186225) (_2!5296 lt!186220)))))

(declare-fun b!119971 () Bool)

(declare-fun e!78593 () Bool)

(assert (=> b!119971 (= e!78592 e!78593)))

(declare-fun res!99316 () Bool)

(assert (=> b!119971 (=> (not res!99316) (not e!78593))))

(declare-fun lt!186218 () tuple2!10062)

(assert (=> b!119971 (= res!99316 (and (= (_2!5296 lt!186218) lt!186228) (= (_1!5296 lt!186218) (_2!5293 lt!186229))))))

(declare-fun readerFrom!0 (BitStream!4320 (_ BitVec 32) (_ BitVec 32)) BitStream!4320)

(assert (=> b!119971 (= lt!186218 (readBitPure!0 (readerFrom!0 (_2!5293 lt!186229) (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305))))))

(declare-fun b!119972 () Bool)

(assert (=> b!119972 (= e!78593 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186218))) (currentByte!5524 (_1!5296 lt!186218)) (currentBit!5519 (_1!5296 lt!186218))) lt!186209))))

(declare-fun b!119973 () Bool)

(declare-fun res!99307 () Bool)

(assert (=> b!119973 (=> (not res!99307) (not e!78587))))

(assert (=> b!119973 (= res!99307 (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(declare-fun b!119974 () Bool)

(assert (=> b!119974 (= e!78589 e!78594)))

(declare-fun res!99313 () Bool)

(assert (=> b!119974 (=> (not res!99313) (not e!78594))))

(assert (=> b!119974 (= res!99313 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305)) lt!186227))))

(assert (=> b!119974 (= lt!186227 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!23680 res!99317) b!119974))

(assert (= (and b!119974 res!99313) b!119962))

(assert (= (and b!119962 res!99310) b!119968))

(assert (= (and b!119968 res!99315) b!119966))

(assert (= (and b!119966 res!99312) b!119965))

(assert (= (and b!119965 res!99318) b!119969))

(assert (= (and b!119969 res!99311) b!119971))

(assert (= (and b!119971 res!99316) b!119972))

(assert (= (and b!119966 res!99314) b!119973))

(assert (= (and b!119973 res!99307) b!119963))

(assert (= (and b!119966 res!99309) b!119970))

(assert (= (and b!119966 (not res!99308)) b!119964))

(assert (= start!23680 b!119967))

(declare-fun m!180973 () Bool)

(assert (=> b!119974 m!180973))

(declare-fun m!180975 () Bool)

(assert (=> b!119965 m!180975))

(declare-fun m!180977 () Bool)

(assert (=> b!119965 m!180977))

(declare-fun m!180979 () Bool)

(assert (=> b!119966 m!180979))

(declare-fun m!180981 () Bool)

(assert (=> b!119966 m!180981))

(declare-fun m!180983 () Bool)

(assert (=> b!119966 m!180983))

(declare-fun m!180985 () Bool)

(assert (=> b!119966 m!180985))

(declare-fun m!180987 () Bool)

(assert (=> b!119966 m!180987))

(declare-fun m!180989 () Bool)

(assert (=> b!119966 m!180989))

(declare-fun m!180991 () Bool)

(assert (=> b!119966 m!180991))

(declare-fun m!180993 () Bool)

(assert (=> b!119966 m!180993))

(declare-fun m!180995 () Bool)

(assert (=> b!119966 m!180995))

(declare-fun m!180997 () Bool)

(assert (=> b!119966 m!180997))

(declare-fun m!180999 () Bool)

(assert (=> b!119966 m!180999))

(declare-fun m!181001 () Bool)

(assert (=> b!119966 m!181001))

(declare-fun m!181003 () Bool)

(assert (=> b!119966 m!181003))

(declare-fun m!181005 () Bool)

(assert (=> b!119966 m!181005))

(declare-fun m!181007 () Bool)

(assert (=> b!119966 m!181007))

(declare-fun m!181009 () Bool)

(assert (=> b!119966 m!181009))

(declare-fun m!181011 () Bool)

(assert (=> b!119966 m!181011))

(declare-fun m!181013 () Bool)

(assert (=> b!119966 m!181013))

(declare-fun m!181015 () Bool)

(assert (=> b!119966 m!181015))

(declare-fun m!181017 () Bool)

(assert (=> b!119964 m!181017))

(declare-fun m!181019 () Bool)

(assert (=> b!119964 m!181019))

(assert (=> b!119964 m!180977))

(declare-fun m!181021 () Bool)

(assert (=> b!119964 m!181021))

(declare-fun m!181023 () Bool)

(assert (=> b!119964 m!181023))

(assert (=> b!119964 m!181019))

(declare-fun m!181025 () Bool)

(assert (=> b!119964 m!181025))

(assert (=> b!119964 m!180975))

(declare-fun m!181027 () Bool)

(assert (=> b!119964 m!181027))

(declare-fun m!181029 () Bool)

(assert (=> start!23680 m!181029))

(declare-fun m!181031 () Bool)

(assert (=> b!119969 m!181031))

(declare-fun m!181033 () Bool)

(assert (=> b!119972 m!181033))

(declare-fun m!181035 () Bool)

(assert (=> b!119963 m!181035))

(declare-fun m!181037 () Bool)

(assert (=> b!119962 m!181037))

(declare-fun m!181039 () Bool)

(assert (=> b!119971 m!181039))

(assert (=> b!119971 m!181039))

(declare-fun m!181041 () Bool)

(assert (=> b!119971 m!181041))

(declare-fun m!181043 () Bool)

(assert (=> b!119973 m!181043))

(declare-fun m!181045 () Bool)

(assert (=> b!119967 m!181045))

(check-sat (not b!119964) (not b!119969) (not b!119967) (not start!23680) (not b!119965) (not b!119974) (not b!119963) (not b!119972) (not b!119962) (not b!119973) (not b!119971) (not b!119966))
(check-sat)
(get-model)

(declare-fun d!38616 () Bool)

(assert (=> d!38616 (= (array_inv!2225 (buf!2851 thiss!1305)) (bvsge (size!2423 (buf!2851 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119967 d!38616))

(declare-fun d!38618 () Bool)

(assert (=> d!38618 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119966 d!38618))

(declare-fun d!38620 () Bool)

(declare-fun res!99432 () Bool)

(declare-fun e!78672 () Bool)

(assert (=> d!38620 (=> (not res!99432) (not e!78672))))

(assert (=> d!38620 (= res!99432 (= (size!2423 (buf!2851 thiss!1305)) (size!2423 (buf!2851 (_2!5293 lt!186215)))))))

(assert (=> d!38620 (= (isPrefixOf!0 thiss!1305 (_2!5293 lt!186215)) e!78672)))

(declare-fun b!120101 () Bool)

(declare-fun res!99433 () Bool)

(assert (=> b!120101 (=> (not res!99433) (not e!78672))))

(assert (=> b!120101 (= res!99433 (bvsle (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)) (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186215))) (currentByte!5524 (_2!5293 lt!186215)) (currentBit!5519 (_2!5293 lt!186215)))))))

(declare-fun b!120102 () Bool)

(declare-fun e!78671 () Bool)

(assert (=> b!120102 (= e!78672 e!78671)))

(declare-fun res!99434 () Bool)

(assert (=> b!120102 (=> res!99434 e!78671)))

(assert (=> b!120102 (= res!99434 (= (size!2423 (buf!2851 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120103 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5350 array!5350 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120103 (= e!78671 (arrayBitRangesEq!0 (buf!2851 thiss!1305) (buf!2851 (_2!5293 lt!186215)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305))))))

(assert (= (and d!38620 res!99432) b!120101))

(assert (= (and b!120101 res!99433) b!120102))

(assert (= (and b!120102 (not res!99434)) b!120103))

(assert (=> b!120101 m!180977))

(assert (=> b!120101 m!181017))

(assert (=> b!120103 m!180977))

(assert (=> b!120103 m!180977))

(declare-fun m!181279 () Bool)

(assert (=> b!120103 m!181279))

(assert (=> b!119966 d!38620))

(declare-datatypes ((tuple2!10080 0))(
  ( (tuple2!10081 (_1!5305 (_ BitVec 64)) (_2!5305 BitStream!4320)) )
))
(declare-fun lt!186513 () tuple2!10080)

(declare-fun d!38622 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10080)

(assert (=> d!38622 (= lt!186513 (readNLeastSignificantBitsLoop!0 (_1!5294 lt!186212) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186226))))

(assert (=> d!38622 (= (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!186212) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186226) (tuple2!10061 (_2!5305 lt!186513) (_1!5305 lt!186513)))))

(declare-fun bs!9341 () Bool)

(assert (= bs!9341 d!38622))

(declare-fun m!181281 () Bool)

(assert (=> bs!9341 m!181281))

(assert (=> b!119966 d!38622))

(declare-fun d!38624 () Bool)

(declare-datatypes ((tuple2!10082 0))(
  ( (tuple2!10083 (_1!5306 Bool) (_2!5306 BitStream!4320)) )
))
(declare-fun lt!186516 () tuple2!10082)

(declare-fun readBit!0 (BitStream!4320) tuple2!10082)

(assert (=> d!38624 (= lt!186516 (readBit!0 lt!186210))))

(assert (=> d!38624 (= (readBitPure!0 lt!186210) (tuple2!10063 (_2!5306 lt!186516) (_1!5306 lt!186516)))))

(declare-fun bs!9342 () Bool)

(assert (= bs!9342 d!38624))

(declare-fun m!181283 () Bool)

(assert (=> bs!9342 m!181283))

(assert (=> b!119966 d!38624))

(declare-fun d!38626 () Bool)

(declare-fun lt!186517 () tuple2!10082)

(assert (=> d!38626 (= lt!186517 (readBit!0 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305))))))

(assert (=> d!38626 (= (readBitPure!0 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305))) (tuple2!10063 (_2!5306 lt!186517) (_1!5306 lt!186517)))))

(declare-fun bs!9343 () Bool)

(assert (= bs!9343 d!38626))

(declare-fun m!181285 () Bool)

(assert (=> bs!9343 m!181285))

(assert (=> b!119966 d!38626))

(declare-fun d!38628 () Bool)

(declare-fun e!78675 () Bool)

(assert (=> d!38628 e!78675))

(declare-fun res!99439 () Bool)

(assert (=> d!38628 (=> (not res!99439) (not e!78675))))

(declare-fun lt!186535 () (_ BitVec 64))

(declare-fun lt!186532 () (_ BitVec 64))

(declare-fun lt!186533 () (_ BitVec 64))

(assert (=> d!38628 (= res!99439 (= lt!186533 (bvsub lt!186535 lt!186532)))))

(assert (=> d!38628 (or (= (bvand lt!186535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186532 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186535 lt!186532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38628 (= lt!186532 (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186225)))) ((_ sign_extend 32) (currentByte!5524 (_1!5296 lt!186225))) ((_ sign_extend 32) (currentBit!5519 (_1!5296 lt!186225)))))))

(declare-fun lt!186531 () (_ BitVec 64))

(declare-fun lt!186534 () (_ BitVec 64))

(assert (=> d!38628 (= lt!186535 (bvmul lt!186531 lt!186534))))

(assert (=> d!38628 (or (= lt!186531 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186534 (bvsdiv (bvmul lt!186531 lt!186534) lt!186531)))))

(assert (=> d!38628 (= lt!186534 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38628 (= lt!186531 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186225)))))))

(assert (=> d!38628 (= lt!186533 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5524 (_1!5296 lt!186225))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5519 (_1!5296 lt!186225)))))))

(assert (=> d!38628 (invariant!0 (currentBit!5519 (_1!5296 lt!186225)) (currentByte!5524 (_1!5296 lt!186225)) (size!2423 (buf!2851 (_1!5296 lt!186225))))))

(assert (=> d!38628 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186225))) (currentByte!5524 (_1!5296 lt!186225)) (currentBit!5519 (_1!5296 lt!186225))) lt!186533)))

(declare-fun b!120108 () Bool)

(declare-fun res!99440 () Bool)

(assert (=> b!120108 (=> (not res!99440) (not e!78675))))

(assert (=> b!120108 (= res!99440 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186533))))

(declare-fun b!120109 () Bool)

(declare-fun lt!186530 () (_ BitVec 64))

(assert (=> b!120109 (= e!78675 (bvsle lt!186533 (bvmul lt!186530 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120109 (or (= lt!186530 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186530 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186530)))))

(assert (=> b!120109 (= lt!186530 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186225)))))))

(assert (= (and d!38628 res!99439) b!120108))

(assert (= (and b!120108 res!99440) b!120109))

(declare-fun m!181287 () Bool)

(assert (=> d!38628 m!181287))

(declare-fun m!181289 () Bool)

(assert (=> d!38628 m!181289))

(assert (=> b!119966 d!38628))

(declare-fun d!38630 () Bool)

(declare-fun e!78681 () Bool)

(assert (=> d!38630 e!78681))

(declare-fun res!99452 () Bool)

(assert (=> d!38630 (=> (not res!99452) (not e!78681))))

(declare-fun lt!186544 () tuple2!10056)

(assert (=> d!38630 (= res!99452 (= (size!2423 (buf!2851 thiss!1305)) (size!2423 (buf!2851 (_2!5293 lt!186544)))))))

(declare-fun choose!16 (BitStream!4320 Bool) tuple2!10056)

(assert (=> d!38630 (= lt!186544 (choose!16 thiss!1305 lt!186228))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38630 (validate_offset_bit!0 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305)))))

(assert (=> d!38630 (= (appendBit!0 thiss!1305 lt!186228) lt!186544)))

(declare-fun b!120119 () Bool)

(declare-fun res!99451 () Bool)

(assert (=> b!120119 (=> (not res!99451) (not e!78681))))

(declare-fun lt!186547 () (_ BitVec 64))

(declare-fun lt!186546 () (_ BitVec 64))

(assert (=> b!120119 (= res!99451 (= (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186544))) (currentByte!5524 (_2!5293 lt!186544)) (currentBit!5519 (_2!5293 lt!186544))) (bvadd lt!186547 lt!186546)))))

(assert (=> b!120119 (or (not (= (bvand lt!186547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186546 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!186547 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!186547 lt!186546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120119 (= lt!186546 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!120119 (= lt!186547 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(declare-fun b!120120 () Bool)

(declare-fun res!99449 () Bool)

(assert (=> b!120120 (=> (not res!99449) (not e!78681))))

(assert (=> b!120120 (= res!99449 (isPrefixOf!0 thiss!1305 (_2!5293 lt!186544)))))

(declare-fun b!120121 () Bool)

(declare-fun e!78680 () Bool)

(assert (=> b!120121 (= e!78681 e!78680)))

(declare-fun res!99450 () Bool)

(assert (=> b!120121 (=> (not res!99450) (not e!78680))))

(declare-fun lt!186545 () tuple2!10062)

(assert (=> b!120121 (= res!99450 (and (= (_2!5296 lt!186545) lt!186228) (= (_1!5296 lt!186545) (_2!5293 lt!186544))))))

(assert (=> b!120121 (= lt!186545 (readBitPure!0 (readerFrom!0 (_2!5293 lt!186544) (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305))))))

(declare-fun b!120122 () Bool)

(assert (=> b!120122 (= e!78680 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186545))) (currentByte!5524 (_1!5296 lt!186545)) (currentBit!5519 (_1!5296 lt!186545))) (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186544))) (currentByte!5524 (_2!5293 lt!186544)) (currentBit!5519 (_2!5293 lt!186544)))))))

(assert (= (and d!38630 res!99452) b!120119))

(assert (= (and b!120119 res!99451) b!120120))

(assert (= (and b!120120 res!99449) b!120121))

(assert (= (and b!120121 res!99450) b!120122))

(declare-fun m!181291 () Bool)

(assert (=> b!120120 m!181291))

(declare-fun m!181293 () Bool)

(assert (=> d!38630 m!181293))

(declare-fun m!181295 () Bool)

(assert (=> d!38630 m!181295))

(declare-fun m!181297 () Bool)

(assert (=> b!120119 m!181297))

(assert (=> b!120119 m!180977))

(declare-fun m!181299 () Bool)

(assert (=> b!120122 m!181299))

(assert (=> b!120122 m!181297))

(declare-fun m!181301 () Bool)

(assert (=> b!120121 m!181301))

(assert (=> b!120121 m!181301))

(declare-fun m!181303 () Bool)

(assert (=> b!120121 m!181303))

(assert (=> b!119966 d!38630))

(declare-fun d!38632 () Bool)

(declare-fun e!78684 () Bool)

(assert (=> d!38632 e!78684))

(declare-fun res!99455 () Bool)

(assert (=> d!38632 (=> (not res!99455) (not e!78684))))

(declare-fun lt!186559 () tuple2!10062)

(declare-fun lt!186558 () tuple2!10062)

(assert (=> d!38632 (= res!99455 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186559))) (currentByte!5524 (_1!5296 lt!186559)) (currentBit!5519 (_1!5296 lt!186559))) (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186558))) (currentByte!5524 (_1!5296 lt!186558)) (currentBit!5519 (_1!5296 lt!186558)))))))

(declare-fun lt!186557 () BitStream!4320)

(declare-fun lt!186556 () Unit!7389)

(declare-fun choose!50 (BitStream!4320 BitStream!4320 BitStream!4320 tuple2!10062 tuple2!10062 BitStream!4320 Bool tuple2!10062 tuple2!10062 BitStream!4320 Bool) Unit!7389)

(assert (=> d!38632 (= lt!186556 (choose!50 lt!186210 (_2!5293 lt!186215) lt!186557 lt!186559 (tuple2!10063 (_1!5296 lt!186559) (_2!5296 lt!186559)) (_1!5296 lt!186559) (_2!5296 lt!186559) lt!186558 (tuple2!10063 (_1!5296 lt!186558) (_2!5296 lt!186558)) (_1!5296 lt!186558) (_2!5296 lt!186558)))))

(assert (=> d!38632 (= lt!186558 (readBitPure!0 lt!186557))))

(assert (=> d!38632 (= lt!186559 (readBitPure!0 lt!186210))))

(assert (=> d!38632 (= lt!186557 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 lt!186210) (currentBit!5519 lt!186210)))))

(assert (=> d!38632 (invariant!0 (currentBit!5519 lt!186210) (currentByte!5524 lt!186210) (size!2423 (buf!2851 (_2!5293 lt!186215))))))

(assert (=> d!38632 (= (readBitPrefixLemma!0 lt!186210 (_2!5293 lt!186215)) lt!186556)))

(declare-fun b!120125 () Bool)

(assert (=> b!120125 (= e!78684 (= (_2!5296 lt!186559) (_2!5296 lt!186558)))))

(assert (= (and d!38632 res!99455) b!120125))

(declare-fun m!181305 () Bool)

(assert (=> d!38632 m!181305))

(declare-fun m!181307 () Bool)

(assert (=> d!38632 m!181307))

(declare-fun m!181309 () Bool)

(assert (=> d!38632 m!181309))

(declare-fun m!181311 () Bool)

(assert (=> d!38632 m!181311))

(assert (=> d!38632 m!180989))

(declare-fun m!181313 () Bool)

(assert (=> d!38632 m!181313))

(assert (=> b!119966 d!38632))

(declare-fun d!38634 () Bool)

(assert (=> d!38634 (isPrefixOf!0 thiss!1305 (_2!5293 lt!186215))))

(declare-fun lt!186562 () Unit!7389)

(declare-fun choose!30 (BitStream!4320 BitStream!4320 BitStream!4320) Unit!7389)

(assert (=> d!38634 (= lt!186562 (choose!30 thiss!1305 (_2!5293 lt!186229) (_2!5293 lt!186215)))))

(assert (=> d!38634 (isPrefixOf!0 thiss!1305 (_2!5293 lt!186229))))

(assert (=> d!38634 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5293 lt!186229) (_2!5293 lt!186215)) lt!186562)))

(declare-fun bs!9344 () Bool)

(assert (= bs!9344 d!38634))

(assert (=> bs!9344 m!180993))

(declare-fun m!181315 () Bool)

(assert (=> bs!9344 m!181315))

(assert (=> bs!9344 m!181031))

(assert (=> b!119966 d!38634))

(declare-fun d!38636 () Bool)

(assert (=> d!38636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305)) lt!186227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305))) lt!186227))))

(declare-fun bs!9345 () Bool)

(assert (= bs!9345 d!38636))

(declare-fun m!181317 () Bool)

(assert (=> bs!9345 m!181317))

(assert (=> b!119966 d!38636))

(declare-fun d!38638 () Bool)

(assert (=> d!38638 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305)) lt!186227)))

(declare-fun lt!186565 () Unit!7389)

(declare-fun choose!9 (BitStream!4320 array!5350 (_ BitVec 64) BitStream!4320) Unit!7389)

(assert (=> d!38638 (= lt!186565 (choose!9 thiss!1305 (buf!2851 (_2!5293 lt!186215)) lt!186227 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305))))))

(assert (=> d!38638 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2851 (_2!5293 lt!186215)) lt!186227) lt!186565)))

(declare-fun bs!9346 () Bool)

(assert (= bs!9346 d!38638))

(assert (=> bs!9346 m!180995))

(declare-fun m!181319 () Bool)

(assert (=> bs!9346 m!181319))

(assert (=> b!119966 d!38638))

(declare-fun d!38640 () Bool)

(declare-fun lt!186566 () tuple2!10082)

(assert (=> d!38640 (= lt!186566 (readBit!0 (_1!5294 lt!186231)))))

(assert (=> d!38640 (= (readBitPure!0 (_1!5294 lt!186231)) (tuple2!10063 (_2!5306 lt!186566) (_1!5306 lt!186566)))))

(declare-fun bs!9347 () Bool)

(assert (= bs!9347 d!38640))

(declare-fun m!181321 () Bool)

(assert (=> bs!9347 m!181321))

(assert (=> b!119966 d!38640))

(declare-fun d!38642 () Bool)

(declare-fun e!78685 () Bool)

(assert (=> d!38642 e!78685))

(declare-fun res!99456 () Bool)

(assert (=> d!38642 (=> (not res!99456) (not e!78685))))

(declare-fun lt!186570 () (_ BitVec 64))

(declare-fun lt!186572 () (_ BitVec 64))

(declare-fun lt!186569 () (_ BitVec 64))

(assert (=> d!38642 (= res!99456 (= lt!186570 (bvsub lt!186572 lt!186569)))))

(assert (=> d!38642 (or (= (bvand lt!186572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186572 lt!186569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38642 (= lt!186569 (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186220)))) ((_ sign_extend 32) (currentByte!5524 (_1!5296 lt!186220))) ((_ sign_extend 32) (currentBit!5519 (_1!5296 lt!186220)))))))

(declare-fun lt!186568 () (_ BitVec 64))

(declare-fun lt!186571 () (_ BitVec 64))

(assert (=> d!38642 (= lt!186572 (bvmul lt!186568 lt!186571))))

(assert (=> d!38642 (or (= lt!186568 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!186571 (bvsdiv (bvmul lt!186568 lt!186571) lt!186568)))))

(assert (=> d!38642 (= lt!186571 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38642 (= lt!186568 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186220)))))))

(assert (=> d!38642 (= lt!186570 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5524 (_1!5296 lt!186220))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5519 (_1!5296 lt!186220)))))))

(assert (=> d!38642 (invariant!0 (currentBit!5519 (_1!5296 lt!186220)) (currentByte!5524 (_1!5296 lt!186220)) (size!2423 (buf!2851 (_1!5296 lt!186220))))))

(assert (=> d!38642 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186220))) (currentByte!5524 (_1!5296 lt!186220)) (currentBit!5519 (_1!5296 lt!186220))) lt!186570)))

(declare-fun b!120126 () Bool)

(declare-fun res!99457 () Bool)

(assert (=> b!120126 (=> (not res!99457) (not e!78685))))

(assert (=> b!120126 (= res!99457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!186570))))

(declare-fun b!120127 () Bool)

(declare-fun lt!186567 () (_ BitVec 64))

(assert (=> b!120127 (= e!78685 (bvsle lt!186570 (bvmul lt!186567 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120127 (or (= lt!186567 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!186567 #b0000000000000000000000000000000000000000000000000000000000001000) lt!186567)))))

(assert (=> b!120127 (= lt!186567 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186220)))))))

(assert (= (and d!38642 res!99456) b!120126))

(assert (= (and b!120126 res!99457) b!120127))

(declare-fun m!181323 () Bool)

(assert (=> d!38642 m!181323))

(declare-fun m!181325 () Bool)

(assert (=> d!38642 m!181325))

(assert (=> b!119966 d!38642))

(declare-fun d!38644 () Bool)

(assert (=> d!38644 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229))) lt!186213)))

(declare-fun lt!186573 () Unit!7389)

(assert (=> d!38644 (= lt!186573 (choose!9 (_2!5293 lt!186229) (buf!2851 (_2!5293 lt!186215)) lt!186213 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229)))))))

(assert (=> d!38644 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5293 lt!186229) (buf!2851 (_2!5293 lt!186215)) lt!186213) lt!186573)))

(declare-fun bs!9348 () Bool)

(assert (= bs!9348 d!38644))

(assert (=> bs!9348 m!181009))

(declare-fun m!181327 () Bool)

(assert (=> bs!9348 m!181327))

(assert (=> b!119966 d!38644))

(declare-fun b!120138 () Bool)

(declare-fun res!99465 () Bool)

(declare-fun e!78690 () Bool)

(assert (=> b!120138 (=> (not res!99465) (not e!78690))))

(declare-fun lt!186628 () tuple2!10058)

(assert (=> b!120138 (= res!99465 (isPrefixOf!0 (_1!5294 lt!186628) thiss!1305))))

(declare-fun b!120139 () Bool)

(declare-fun res!99466 () Bool)

(assert (=> b!120139 (=> (not res!99466) (not e!78690))))

(assert (=> b!120139 (= res!99466 (isPrefixOf!0 (_2!5294 lt!186628) (_2!5293 lt!186215)))))

(declare-fun d!38646 () Bool)

(assert (=> d!38646 e!78690))

(declare-fun res!99464 () Bool)

(assert (=> d!38646 (=> (not res!99464) (not e!78690))))

(assert (=> d!38646 (= res!99464 (isPrefixOf!0 (_1!5294 lt!186628) (_2!5294 lt!186628)))))

(declare-fun lt!186622 () BitStream!4320)

(assert (=> d!38646 (= lt!186628 (tuple2!10059 lt!186622 (_2!5293 lt!186215)))))

(declare-fun lt!186620 () Unit!7389)

(declare-fun lt!186618 () Unit!7389)

(assert (=> d!38646 (= lt!186620 lt!186618)))

(assert (=> d!38646 (isPrefixOf!0 lt!186622 (_2!5293 lt!186215))))

(assert (=> d!38646 (= lt!186618 (lemmaIsPrefixTransitive!0 lt!186622 (_2!5293 lt!186215) (_2!5293 lt!186215)))))

(declare-fun lt!186632 () Unit!7389)

(declare-fun lt!186631 () Unit!7389)

(assert (=> d!38646 (= lt!186632 lt!186631)))

(assert (=> d!38646 (isPrefixOf!0 lt!186622 (_2!5293 lt!186215))))

(assert (=> d!38646 (= lt!186631 (lemmaIsPrefixTransitive!0 lt!186622 thiss!1305 (_2!5293 lt!186215)))))

(declare-fun lt!186619 () Unit!7389)

(declare-fun e!78691 () Unit!7389)

(assert (=> d!38646 (= lt!186619 e!78691)))

(declare-fun c!7217 () Bool)

(assert (=> d!38646 (= c!7217 (not (= (size!2423 (buf!2851 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!186625 () Unit!7389)

(declare-fun lt!186616 () Unit!7389)

(assert (=> d!38646 (= lt!186625 lt!186616)))

(assert (=> d!38646 (isPrefixOf!0 (_2!5293 lt!186215) (_2!5293 lt!186215))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4320) Unit!7389)

(assert (=> d!38646 (= lt!186616 (lemmaIsPrefixRefl!0 (_2!5293 lt!186215)))))

(declare-fun lt!186614 () Unit!7389)

(declare-fun lt!186623 () Unit!7389)

(assert (=> d!38646 (= lt!186614 lt!186623)))

(assert (=> d!38646 (= lt!186623 (lemmaIsPrefixRefl!0 (_2!5293 lt!186215)))))

(declare-fun lt!186629 () Unit!7389)

(declare-fun lt!186615 () Unit!7389)

(assert (=> d!38646 (= lt!186629 lt!186615)))

(assert (=> d!38646 (isPrefixOf!0 lt!186622 lt!186622)))

(assert (=> d!38646 (= lt!186615 (lemmaIsPrefixRefl!0 lt!186622))))

(declare-fun lt!186630 () Unit!7389)

(declare-fun lt!186627 () Unit!7389)

(assert (=> d!38646 (= lt!186630 lt!186627)))

(assert (=> d!38646 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38646 (= lt!186627 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38646 (= lt!186622 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(assert (=> d!38646 (isPrefixOf!0 thiss!1305 (_2!5293 lt!186215))))

(assert (=> d!38646 (= (reader!0 thiss!1305 (_2!5293 lt!186215)) lt!186628)))

(declare-fun b!120140 () Bool)

(declare-fun lt!186626 () Unit!7389)

(assert (=> b!120140 (= e!78691 lt!186626)))

(declare-fun lt!186633 () (_ BitVec 64))

(assert (=> b!120140 (= lt!186633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186621 () (_ BitVec 64))

(assert (=> b!120140 (= lt!186621 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5350 array!5350 (_ BitVec 64) (_ BitVec 64)) Unit!7389)

(assert (=> b!120140 (= lt!186626 (arrayBitRangesEqSymmetric!0 (buf!2851 thiss!1305) (buf!2851 (_2!5293 lt!186215)) lt!186633 lt!186621))))

(assert (=> b!120140 (arrayBitRangesEq!0 (buf!2851 (_2!5293 lt!186215)) (buf!2851 thiss!1305) lt!186633 lt!186621)))

(declare-fun b!120141 () Bool)

(declare-fun Unit!7409 () Unit!7389)

(assert (=> b!120141 (= e!78691 Unit!7409)))

(declare-fun lt!186624 () (_ BitVec 64))

(declare-fun lt!186617 () (_ BitVec 64))

(declare-fun b!120142 () Bool)

(assert (=> b!120142 (= e!78690 (= (_1!5294 lt!186628) (withMovedBitIndex!0 (_2!5294 lt!186628) (bvsub lt!186617 lt!186624))))))

(assert (=> b!120142 (or (= (bvand lt!186617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!186624 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!186617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186617 lt!186624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120142 (= lt!186624 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186215))) (currentByte!5524 (_2!5293 lt!186215)) (currentBit!5519 (_2!5293 lt!186215))))))

(assert (=> b!120142 (= lt!186617 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(assert (= (and d!38646 c!7217) b!120140))

(assert (= (and d!38646 (not c!7217)) b!120141))

(assert (= (and d!38646 res!99464) b!120138))

(assert (= (and b!120138 res!99465) b!120139))

(assert (= (and b!120139 res!99466) b!120142))

(declare-fun m!181329 () Bool)

(assert (=> b!120139 m!181329))

(declare-fun m!181331 () Bool)

(assert (=> b!120138 m!181331))

(declare-fun m!181333 () Bool)

(assert (=> b!120142 m!181333))

(assert (=> b!120142 m!181017))

(assert (=> b!120142 m!180977))

(assert (=> b!120140 m!180977))

(declare-fun m!181335 () Bool)

(assert (=> b!120140 m!181335))

(declare-fun m!181337 () Bool)

(assert (=> b!120140 m!181337))

(declare-fun m!181339 () Bool)

(assert (=> d!38646 m!181339))

(declare-fun m!181341 () Bool)

(assert (=> d!38646 m!181341))

(declare-fun m!181343 () Bool)

(assert (=> d!38646 m!181343))

(declare-fun m!181345 () Bool)

(assert (=> d!38646 m!181345))

(declare-fun m!181347 () Bool)

(assert (=> d!38646 m!181347))

(declare-fun m!181349 () Bool)

(assert (=> d!38646 m!181349))

(assert (=> d!38646 m!180993))

(declare-fun m!181351 () Bool)

(assert (=> d!38646 m!181351))

(declare-fun m!181353 () Bool)

(assert (=> d!38646 m!181353))

(declare-fun m!181355 () Bool)

(assert (=> d!38646 m!181355))

(declare-fun m!181357 () Bool)

(assert (=> d!38646 m!181357))

(assert (=> b!119966 d!38646))

(declare-fun d!38648 () Bool)

(declare-fun lt!186634 () tuple2!10080)

(assert (=> d!38648 (= lt!186634 (readNLeastSignificantBitsLoop!0 (_1!5294 lt!186231) nBits!396 i!615 lt!186208))))

(assert (=> d!38648 (= (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!186231) nBits!396 i!615 lt!186208) (tuple2!10061 (_2!5305 lt!186634) (_1!5305 lt!186634)))))

(declare-fun bs!9349 () Bool)

(assert (= bs!9349 d!38648))

(declare-fun m!181359 () Bool)

(assert (=> bs!9349 m!181359))

(assert (=> b!119966 d!38648))

(declare-fun d!38650 () Bool)

(assert (=> d!38650 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229))) lt!186213) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229)))) lt!186213))))

(declare-fun bs!9350 () Bool)

(assert (= bs!9350 d!38650))

(declare-fun m!181361 () Bool)

(assert (=> bs!9350 m!181361))

(assert (=> b!119966 d!38650))

(declare-fun b!120310 () Bool)

(declare-fun res!99601 () Bool)

(declare-fun e!78794 () Bool)

(assert (=> b!120310 (=> (not res!99601) (not e!78794))))

(declare-fun lt!187228 () tuple2!10056)

(assert (=> b!120310 (= res!99601 (isPrefixOf!0 (_2!5293 lt!186229) (_2!5293 lt!187228)))))

(declare-fun b!120311 () Bool)

(declare-fun e!78792 () Bool)

(declare-fun lt!187214 () tuple2!10062)

(declare-fun lt!187224 () tuple2!10062)

(assert (=> b!120311 (= e!78792 (= (_2!5296 lt!187214) (_2!5296 lt!187224)))))

(declare-fun b!120312 () Bool)

(declare-fun lt!187212 () tuple2!10060)

(declare-fun lt!187223 () tuple2!10058)

(assert (=> b!120312 (= e!78794 (and (= (_2!5295 lt!187212) v!199) (= (_1!5295 lt!187212) (_2!5294 lt!187223))))))

(declare-fun lt!187192 () (_ BitVec 64))

(assert (=> b!120312 (= lt!187212 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!187223) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187192))))

(declare-fun lt!187203 () Unit!7389)

(declare-fun lt!187199 () Unit!7389)

(assert (=> b!120312 (= lt!187203 lt!187199)))

(declare-fun lt!187217 () (_ BitVec 64))

(assert (=> b!120312 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!187228)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229))) lt!187217)))

(assert (=> b!120312 (= lt!187199 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5293 lt!186229) (buf!2851 (_2!5293 lt!187228)) lt!187217))))

(declare-fun e!78790 () Bool)

(assert (=> b!120312 e!78790))

(declare-fun res!99597 () Bool)

(assert (=> b!120312 (=> (not res!99597) (not e!78790))))

(assert (=> b!120312 (= res!99597 (and (= (size!2423 (buf!2851 (_2!5293 lt!186229))) (size!2423 (buf!2851 (_2!5293 lt!187228)))) (bvsge lt!187217 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120312 (= lt!187217 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120312 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120312 (= lt!187192 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!120312 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120312 (= lt!187223 (reader!0 (_2!5293 lt!186229) (_2!5293 lt!187228)))))

(declare-fun b!120313 () Bool)

(declare-fun lt!187195 () tuple2!10062)

(declare-fun lt!187234 () tuple2!10056)

(assert (=> b!120313 (= lt!187195 (readBitPure!0 (readerFrom!0 (_2!5293 lt!187234) (currentBit!5519 (_2!5293 lt!186229)) (currentByte!5524 (_2!5293 lt!186229)))))))

(declare-fun lt!187197 () Bool)

(declare-fun res!99596 () Bool)

(assert (=> b!120313 (= res!99596 (and (= (_2!5296 lt!187195) lt!187197) (= (_1!5296 lt!187195) (_2!5293 lt!187234))))))

(declare-fun e!78793 () Bool)

(assert (=> b!120313 (=> (not res!99596) (not e!78793))))

(declare-fun e!78788 () Bool)

(assert (=> b!120313 (= e!78788 e!78793)))

(declare-fun b!120314 () Bool)

(declare-fun e!78789 () tuple2!10056)

(declare-fun lt!187205 () tuple2!10056)

(declare-fun Unit!7410 () Unit!7389)

(assert (=> b!120314 (= e!78789 (tuple2!10057 Unit!7410 (_2!5293 lt!187205)))))

(assert (=> b!120314 (= lt!187197 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120314 (= lt!187234 (appendBit!0 (_2!5293 lt!186229) lt!187197))))

(declare-fun res!99602 () Bool)

(assert (=> b!120314 (= res!99602 (= (size!2423 (buf!2851 (_2!5293 lt!186229))) (size!2423 (buf!2851 (_2!5293 lt!187234)))))))

(assert (=> b!120314 (=> (not res!99602) (not e!78788))))

(assert (=> b!120314 e!78788))

(declare-fun lt!187211 () tuple2!10056)

(assert (=> b!120314 (= lt!187211 lt!187234)))

(assert (=> b!120314 (= lt!187205 (appendNLeastSignificantBitsLoop!0 (_2!5293 lt!187211) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!187201 () Unit!7389)

(assert (=> b!120314 (= lt!187201 (lemmaIsPrefixTransitive!0 (_2!5293 lt!186229) (_2!5293 lt!187211) (_2!5293 lt!187205)))))

(declare-fun call!1571 () Bool)

(assert (=> b!120314 call!1571))

(declare-fun lt!187221 () Unit!7389)

(assert (=> b!120314 (= lt!187221 lt!187201)))

(assert (=> b!120314 (invariant!0 (currentBit!5519 (_2!5293 lt!186229)) (currentByte!5524 (_2!5293 lt!186229)) (size!2423 (buf!2851 (_2!5293 lt!187211))))))

(declare-fun lt!187208 () BitStream!4320)

(assert (=> b!120314 (= lt!187208 (BitStream!4321 (buf!2851 (_2!5293 lt!187211)) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))))))

(assert (=> b!120314 (invariant!0 (currentBit!5519 lt!187208) (currentByte!5524 lt!187208) (size!2423 (buf!2851 (_2!5293 lt!187205))))))

(declare-fun lt!187202 () BitStream!4320)

(assert (=> b!120314 (= lt!187202 (BitStream!4321 (buf!2851 (_2!5293 lt!187205)) (currentByte!5524 lt!187208) (currentBit!5519 lt!187208)))))

(assert (=> b!120314 (= lt!187214 (readBitPure!0 lt!187208))))

(assert (=> b!120314 (= lt!187224 (readBitPure!0 lt!187202))))

(declare-fun lt!187213 () Unit!7389)

(assert (=> b!120314 (= lt!187213 (readBitPrefixLemma!0 lt!187208 (_2!5293 lt!187205)))))

(declare-fun res!99603 () Bool)

(assert (=> b!120314 (= res!99603 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!187214))) (currentByte!5524 (_1!5296 lt!187214)) (currentBit!5519 (_1!5296 lt!187214))) (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!187224))) (currentByte!5524 (_1!5296 lt!187224)) (currentBit!5519 (_1!5296 lt!187224)))))))

(assert (=> b!120314 (=> (not res!99603) (not e!78792))))

(assert (=> b!120314 e!78792))

(declare-fun lt!187194 () Unit!7389)

(assert (=> b!120314 (= lt!187194 lt!187213)))

(declare-fun lt!187218 () tuple2!10058)

(assert (=> b!120314 (= lt!187218 (reader!0 (_2!5293 lt!186229) (_2!5293 lt!187205)))))

(declare-fun lt!187226 () tuple2!10058)

(assert (=> b!120314 (= lt!187226 (reader!0 (_2!5293 lt!187211) (_2!5293 lt!187205)))))

(declare-fun lt!187216 () tuple2!10062)

(assert (=> b!120314 (= lt!187216 (readBitPure!0 (_1!5294 lt!187218)))))

(assert (=> b!120314 (= (_2!5296 lt!187216) lt!187197)))

(declare-fun lt!187206 () Unit!7389)

(declare-fun Unit!7411 () Unit!7389)

(assert (=> b!120314 (= lt!187206 Unit!7411)))

(declare-fun lt!187207 () (_ BitVec 64))

(assert (=> b!120314 (= lt!187207 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!187196 () (_ BitVec 64))

(assert (=> b!120314 (= lt!187196 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!187200 () Unit!7389)

(assert (=> b!120314 (= lt!187200 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5293 lt!186229) (buf!2851 (_2!5293 lt!187205)) lt!187196))))

(assert (=> b!120314 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!187205)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229))) lt!187196)))

(declare-fun lt!187227 () Unit!7389)

(assert (=> b!120314 (= lt!187227 lt!187200)))

(declare-fun lt!187232 () tuple2!10060)

(assert (=> b!120314 (= lt!187232 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!187218) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187207))))

(declare-fun lt!187209 () (_ BitVec 64))

(assert (=> b!120314 (= lt!187209 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!187219 () Unit!7389)

(assert (=> b!120314 (= lt!187219 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5293 lt!187211) (buf!2851 (_2!5293 lt!187205)) lt!187209))))

(assert (=> b!120314 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!187205)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!187211))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!187211))) lt!187209)))

(declare-fun lt!187210 () Unit!7389)

(assert (=> b!120314 (= lt!187210 lt!187219)))

(declare-fun lt!187222 () tuple2!10060)

(assert (=> b!120314 (= lt!187222 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!187226) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!187207 (ite (_2!5296 lt!187216) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!187198 () tuple2!10060)

(assert (=> b!120314 (= lt!187198 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!187218) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187207))))

(declare-fun c!7238 () Bool)

(assert (=> b!120314 (= c!7238 (_2!5296 (readBitPure!0 (_1!5294 lt!187218))))))

(declare-fun e!78791 () (_ BitVec 64))

(declare-fun lt!187220 () tuple2!10060)

(assert (=> b!120314 (= lt!187220 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5294 lt!187218) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!187207 e!78791)))))

(declare-fun lt!187229 () Unit!7389)

(assert (=> b!120314 (= lt!187229 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5294 lt!187218) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187207))))

(assert (=> b!120314 (and (= (_2!5295 lt!187198) (_2!5295 lt!187220)) (= (_1!5295 lt!187198) (_1!5295 lt!187220)))))

(declare-fun lt!187193 () Unit!7389)

(assert (=> b!120314 (= lt!187193 lt!187229)))

(assert (=> b!120314 (= (_1!5294 lt!187218) (withMovedBitIndex!0 (_2!5294 lt!187218) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187205))) (currentByte!5524 (_2!5293 lt!187205)) (currentBit!5519 (_2!5293 lt!187205))))))))

(declare-fun lt!187231 () Unit!7389)

(declare-fun Unit!7412 () Unit!7389)

(assert (=> b!120314 (= lt!187231 Unit!7412)))

(assert (=> b!120314 (= (_1!5294 lt!187226) (withMovedBitIndex!0 (_2!5294 lt!187226) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187211))) (currentByte!5524 (_2!5293 lt!187211)) (currentBit!5519 (_2!5293 lt!187211))) (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187205))) (currentByte!5524 (_2!5293 lt!187205)) (currentBit!5519 (_2!5293 lt!187205))))))))

(declare-fun lt!187191 () Unit!7389)

(declare-fun Unit!7413 () Unit!7389)

(assert (=> b!120314 (= lt!187191 Unit!7413)))

(assert (=> b!120314 (= (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187211))) (currentByte!5524 (_2!5293 lt!187211)) (currentBit!5519 (_2!5293 lt!187211))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!187233 () Unit!7389)

(declare-fun Unit!7414 () Unit!7389)

(assert (=> b!120314 (= lt!187233 Unit!7414)))

(assert (=> b!120314 (= (_2!5295 lt!187232) (_2!5295 lt!187222))))

(declare-fun lt!187215 () Unit!7389)

(declare-fun Unit!7415 () Unit!7389)

(assert (=> b!120314 (= lt!187215 Unit!7415)))

(assert (=> b!120314 (= (_1!5295 lt!187232) (_2!5294 lt!187218))))

(declare-fun b!120315 () Bool)

(assert (=> b!120315 (= e!78791 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bm!1568 () Bool)

(declare-fun lt!187190 () BitStream!4320)

(declare-fun c!7239 () Bool)

(assert (=> bm!1568 (= call!1571 (isPrefixOf!0 (ite c!7239 (_2!5293 lt!186229) lt!187190) (ite c!7239 (_2!5293 lt!187205) lt!187190)))))

(declare-fun b!120316 () Bool)

(assert (=> b!120316 (= e!78790 (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186229)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229))) lt!187217))))

(declare-fun b!120317 () Bool)

(declare-fun res!99598 () Bool)

(assert (=> b!120317 (=> (not res!99598) (not e!78794))))

(declare-fun lt!187225 () (_ BitVec 64))

(declare-fun lt!187204 () (_ BitVec 64))

(assert (=> b!120317 (= res!99598 (= (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187228))) (currentByte!5524 (_2!5293 lt!187228)) (currentBit!5519 (_2!5293 lt!187228))) (bvadd lt!187225 lt!187204)))))

(assert (=> b!120317 (or (not (= (bvand lt!187225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187204 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187225 lt!187204) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120317 (= lt!187204 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120317 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120317 (= lt!187225 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))))))

(declare-fun b!120318 () Bool)

(assert (=> b!120318 (= e!78793 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!187195))) (currentByte!5524 (_1!5296 lt!187195)) (currentBit!5519 (_1!5296 lt!187195))) (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187234))) (currentByte!5524 (_2!5293 lt!187234)) (currentBit!5519 (_2!5293 lt!187234)))))))

(declare-fun b!120319 () Bool)

(declare-fun lt!187230 () Unit!7389)

(assert (=> b!120319 (= e!78789 (tuple2!10057 lt!187230 (_2!5293 lt!186229)))))

(assert (=> b!120319 (= lt!187190 (_2!5293 lt!186229))))

(assert (=> b!120319 (= lt!187230 (lemmaIsPrefixRefl!0 lt!187190))))

(assert (=> b!120319 call!1571))

(declare-fun b!120320 () Bool)

(assert (=> b!120320 (= e!78791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!38652 () Bool)

(assert (=> d!38652 e!78794))

(declare-fun res!99599 () Bool)

(assert (=> d!38652 (=> (not res!99599) (not e!78794))))

(assert (=> d!38652 (= res!99599 (= (size!2423 (buf!2851 (_2!5293 lt!186229))) (size!2423 (buf!2851 (_2!5293 lt!187228)))))))

(assert (=> d!38652 (= lt!187228 e!78789)))

(assert (=> d!38652 (= c!7239 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38652 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38652 (= (appendNLeastSignificantBitsLoop!0 (_2!5293 lt!186229) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!187228)))

(declare-fun b!120321 () Bool)

(declare-fun res!99604 () Bool)

(assert (=> b!120321 (= res!99604 (= (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!187234))) (currentByte!5524 (_2!5293 lt!187234)) (currentBit!5519 (_2!5293 lt!187234))) (bvadd (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!120321 (=> (not res!99604) (not e!78788))))

(declare-fun b!120322 () Bool)

(declare-fun res!99600 () Bool)

(assert (=> b!120322 (= res!99600 (isPrefixOf!0 (_2!5293 lt!186229) (_2!5293 lt!187234)))))

(assert (=> b!120322 (=> (not res!99600) (not e!78788))))

(assert (= (and d!38652 c!7239) b!120314))

(assert (= (and d!38652 (not c!7239)) b!120319))

(assert (= (and b!120314 res!99602) b!120321))

(assert (= (and b!120321 res!99604) b!120322))

(assert (= (and b!120322 res!99600) b!120313))

(assert (= (and b!120313 res!99596) b!120318))

(assert (= (and b!120314 res!99603) b!120311))

(assert (= (and b!120314 c!7238) b!120315))

(assert (= (and b!120314 (not c!7238)) b!120320))

(assert (= (or b!120314 b!120319) bm!1568))

(assert (= (and d!38652 res!99599) b!120317))

(assert (= (and b!120317 res!99598) b!120310))

(assert (= (and b!120310 res!99601) b!120312))

(assert (= (and b!120312 res!99597) b!120316))

(declare-fun m!181693 () Bool)

(assert (=> b!120317 m!181693))

(assert (=> b!120317 m!180975))

(declare-fun m!181695 () Bool)

(assert (=> b!120314 m!181695))

(declare-fun m!181697 () Bool)

(assert (=> b!120314 m!181697))

(declare-fun m!181699 () Bool)

(assert (=> b!120314 m!181699))

(declare-fun m!181701 () Bool)

(assert (=> b!120314 m!181701))

(declare-fun m!181703 () Bool)

(assert (=> b!120314 m!181703))

(declare-fun m!181705 () Bool)

(assert (=> b!120314 m!181705))

(declare-fun m!181707 () Bool)

(assert (=> b!120314 m!181707))

(declare-fun m!181709 () Bool)

(assert (=> b!120314 m!181709))

(declare-fun m!181711 () Bool)

(assert (=> b!120314 m!181711))

(declare-fun m!181713 () Bool)

(assert (=> b!120314 m!181713))

(declare-fun m!181715 () Bool)

(assert (=> b!120314 m!181715))

(declare-fun m!181717 () Bool)

(assert (=> b!120314 m!181717))

(declare-fun m!181719 () Bool)

(assert (=> b!120314 m!181719))

(declare-fun m!181721 () Bool)

(assert (=> b!120314 m!181721))

(assert (=> b!120314 m!181701))

(declare-fun m!181723 () Bool)

(assert (=> b!120314 m!181723))

(declare-fun m!181725 () Bool)

(assert (=> b!120314 m!181725))

(declare-fun m!181727 () Bool)

(assert (=> b!120314 m!181727))

(declare-fun m!181729 () Bool)

(assert (=> b!120314 m!181729))

(declare-fun m!181731 () Bool)

(assert (=> b!120314 m!181731))

(declare-fun m!181733 () Bool)

(assert (=> b!120314 m!181733))

(declare-fun m!181735 () Bool)

(assert (=> b!120314 m!181735))

(declare-fun m!181737 () Bool)

(assert (=> b!120314 m!181737))

(assert (=> b!120314 m!180975))

(declare-fun m!181739 () Bool)

(assert (=> b!120314 m!181739))

(declare-fun m!181741 () Bool)

(assert (=> b!120314 m!181741))

(declare-fun m!181743 () Bool)

(assert (=> b!120314 m!181743))

(declare-fun m!181745 () Bool)

(assert (=> b!120314 m!181745))

(declare-fun m!181747 () Bool)

(assert (=> b!120314 m!181747))

(declare-fun m!181749 () Bool)

(assert (=> b!120316 m!181749))

(declare-fun m!181751 () Bool)

(assert (=> b!120313 m!181751))

(assert (=> b!120313 m!181751))

(declare-fun m!181753 () Bool)

(assert (=> b!120313 m!181753))

(declare-fun m!181755 () Bool)

(assert (=> b!120319 m!181755))

(declare-fun m!181757 () Bool)

(assert (=> b!120310 m!181757))

(declare-fun m!181759 () Bool)

(assert (=> b!120321 m!181759))

(assert (=> b!120321 m!180975))

(assert (=> b!120312 m!181705))

(declare-fun m!181761 () Bool)

(assert (=> b!120312 m!181761))

(declare-fun m!181763 () Bool)

(assert (=> b!120312 m!181763))

(declare-fun m!181765 () Bool)

(assert (=> b!120312 m!181765))

(declare-fun m!181767 () Bool)

(assert (=> b!120312 m!181767))

(declare-fun m!181769 () Bool)

(assert (=> bm!1568 m!181769))

(declare-fun m!181771 () Bool)

(assert (=> b!120322 m!181771))

(declare-fun m!181773 () Bool)

(assert (=> b!120318 m!181773))

(assert (=> b!120318 m!181759))

(assert (=> b!119966 d!38652))

(declare-fun b!120323 () Bool)

(declare-fun res!99606 () Bool)

(declare-fun e!78795 () Bool)

(assert (=> b!120323 (=> (not res!99606) (not e!78795))))

(declare-fun lt!187249 () tuple2!10058)

(assert (=> b!120323 (= res!99606 (isPrefixOf!0 (_1!5294 lt!187249) (_2!5293 lt!186229)))))

(declare-fun b!120324 () Bool)

(declare-fun res!99607 () Bool)

(assert (=> b!120324 (=> (not res!99607) (not e!78795))))

(assert (=> b!120324 (= res!99607 (isPrefixOf!0 (_2!5294 lt!187249) (_2!5293 lt!186215)))))

(declare-fun d!38736 () Bool)

(assert (=> d!38736 e!78795))

(declare-fun res!99605 () Bool)

(assert (=> d!38736 (=> (not res!99605) (not e!78795))))

(assert (=> d!38736 (= res!99605 (isPrefixOf!0 (_1!5294 lt!187249) (_2!5294 lt!187249)))))

(declare-fun lt!187243 () BitStream!4320)

(assert (=> d!38736 (= lt!187249 (tuple2!10059 lt!187243 (_2!5293 lt!186215)))))

(declare-fun lt!187241 () Unit!7389)

(declare-fun lt!187239 () Unit!7389)

(assert (=> d!38736 (= lt!187241 lt!187239)))

(assert (=> d!38736 (isPrefixOf!0 lt!187243 (_2!5293 lt!186215))))

(assert (=> d!38736 (= lt!187239 (lemmaIsPrefixTransitive!0 lt!187243 (_2!5293 lt!186215) (_2!5293 lt!186215)))))

(declare-fun lt!187253 () Unit!7389)

(declare-fun lt!187252 () Unit!7389)

(assert (=> d!38736 (= lt!187253 lt!187252)))

(assert (=> d!38736 (isPrefixOf!0 lt!187243 (_2!5293 lt!186215))))

(assert (=> d!38736 (= lt!187252 (lemmaIsPrefixTransitive!0 lt!187243 (_2!5293 lt!186229) (_2!5293 lt!186215)))))

(declare-fun lt!187240 () Unit!7389)

(declare-fun e!78796 () Unit!7389)

(assert (=> d!38736 (= lt!187240 e!78796)))

(declare-fun c!7240 () Bool)

(assert (=> d!38736 (= c!7240 (not (= (size!2423 (buf!2851 (_2!5293 lt!186229))) #b00000000000000000000000000000000)))))

(declare-fun lt!187246 () Unit!7389)

(declare-fun lt!187237 () Unit!7389)

(assert (=> d!38736 (= lt!187246 lt!187237)))

(assert (=> d!38736 (isPrefixOf!0 (_2!5293 lt!186215) (_2!5293 lt!186215))))

(assert (=> d!38736 (= lt!187237 (lemmaIsPrefixRefl!0 (_2!5293 lt!186215)))))

(declare-fun lt!187235 () Unit!7389)

(declare-fun lt!187244 () Unit!7389)

(assert (=> d!38736 (= lt!187235 lt!187244)))

(assert (=> d!38736 (= lt!187244 (lemmaIsPrefixRefl!0 (_2!5293 lt!186215)))))

(declare-fun lt!187250 () Unit!7389)

(declare-fun lt!187236 () Unit!7389)

(assert (=> d!38736 (= lt!187250 lt!187236)))

(assert (=> d!38736 (isPrefixOf!0 lt!187243 lt!187243)))

(assert (=> d!38736 (= lt!187236 (lemmaIsPrefixRefl!0 lt!187243))))

(declare-fun lt!187251 () Unit!7389)

(declare-fun lt!187248 () Unit!7389)

(assert (=> d!38736 (= lt!187251 lt!187248)))

(assert (=> d!38736 (isPrefixOf!0 (_2!5293 lt!186229) (_2!5293 lt!186229))))

(assert (=> d!38736 (= lt!187248 (lemmaIsPrefixRefl!0 (_2!5293 lt!186229)))))

(assert (=> d!38736 (= lt!187243 (BitStream!4321 (buf!2851 (_2!5293 lt!186215)) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))))))

(assert (=> d!38736 (isPrefixOf!0 (_2!5293 lt!186229) (_2!5293 lt!186215))))

(assert (=> d!38736 (= (reader!0 (_2!5293 lt!186229) (_2!5293 lt!186215)) lt!187249)))

(declare-fun b!120325 () Bool)

(declare-fun lt!187247 () Unit!7389)

(assert (=> b!120325 (= e!78796 lt!187247)))

(declare-fun lt!187254 () (_ BitVec 64))

(assert (=> b!120325 (= lt!187254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!187242 () (_ BitVec 64))

(assert (=> b!120325 (= lt!187242 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))))))

(assert (=> b!120325 (= lt!187247 (arrayBitRangesEqSymmetric!0 (buf!2851 (_2!5293 lt!186229)) (buf!2851 (_2!5293 lt!186215)) lt!187254 lt!187242))))

(assert (=> b!120325 (arrayBitRangesEq!0 (buf!2851 (_2!5293 lt!186215)) (buf!2851 (_2!5293 lt!186229)) lt!187254 lt!187242)))

(declare-fun b!120326 () Bool)

(declare-fun Unit!7416 () Unit!7389)

(assert (=> b!120326 (= e!78796 Unit!7416)))

(declare-fun lt!187245 () (_ BitVec 64))

(declare-fun b!120327 () Bool)

(declare-fun lt!187238 () (_ BitVec 64))

(assert (=> b!120327 (= e!78795 (= (_1!5294 lt!187249) (withMovedBitIndex!0 (_2!5294 lt!187249) (bvsub lt!187238 lt!187245))))))

(assert (=> b!120327 (or (= (bvand lt!187238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187238 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187238 lt!187245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120327 (= lt!187245 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186215))) (currentByte!5524 (_2!5293 lt!186215)) (currentBit!5519 (_2!5293 lt!186215))))))

(assert (=> b!120327 (= lt!187238 (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))))))

(assert (= (and d!38736 c!7240) b!120325))

(assert (= (and d!38736 (not c!7240)) b!120326))

(assert (= (and d!38736 res!99605) b!120323))

(assert (= (and b!120323 res!99606) b!120324))

(assert (= (and b!120324 res!99607) b!120327))

(declare-fun m!181775 () Bool)

(assert (=> b!120324 m!181775))

(declare-fun m!181777 () Bool)

(assert (=> b!120323 m!181777))

(declare-fun m!181779 () Bool)

(assert (=> b!120327 m!181779))

(assert (=> b!120327 m!181017))

(assert (=> b!120327 m!180975))

(assert (=> b!120325 m!180975))

(declare-fun m!181781 () Bool)

(assert (=> b!120325 m!181781))

(declare-fun m!181783 () Bool)

(assert (=> b!120325 m!181783))

(declare-fun m!181785 () Bool)

(assert (=> d!38736 m!181785))

(assert (=> d!38736 m!181341))

(declare-fun m!181787 () Bool)

(assert (=> d!38736 m!181787))

(declare-fun m!181789 () Bool)

(assert (=> d!38736 m!181789))

(declare-fun m!181791 () Bool)

(assert (=> d!38736 m!181791))

(assert (=> d!38736 m!181349))

(declare-fun m!181793 () Bool)

(assert (=> d!38736 m!181793))

(declare-fun m!181795 () Bool)

(assert (=> d!38736 m!181795))

(declare-fun m!181797 () Bool)

(assert (=> d!38736 m!181797))

(declare-fun m!181799 () Bool)

(assert (=> d!38736 m!181799))

(declare-fun m!181801 () Bool)

(assert (=> d!38736 m!181801))

(assert (=> b!119966 d!38736))

(declare-fun d!38738 () Bool)

(declare-fun res!99608 () Bool)

(declare-fun e!78798 () Bool)

(assert (=> d!38738 (=> (not res!99608) (not e!78798))))

(assert (=> d!38738 (= res!99608 (= (size!2423 (buf!2851 thiss!1305)) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(assert (=> d!38738 (= (isPrefixOf!0 thiss!1305 (_2!5293 lt!186229)) e!78798)))

(declare-fun b!120328 () Bool)

(declare-fun res!99609 () Bool)

(assert (=> b!120328 (=> (not res!99609) (not e!78798))))

(assert (=> b!120328 (= res!99609 (bvsle (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)) (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229)))))))

(declare-fun b!120329 () Bool)

(declare-fun e!78797 () Bool)

(assert (=> b!120329 (= e!78798 e!78797)))

(declare-fun res!99610 () Bool)

(assert (=> b!120329 (=> res!99610 e!78797)))

(assert (=> b!120329 (= res!99610 (= (size!2423 (buf!2851 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120330 () Bool)

(assert (=> b!120330 (= e!78797 (arrayBitRangesEq!0 (buf!2851 thiss!1305) (buf!2851 (_2!5293 lt!186229)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305))))))

(assert (= (and d!38738 res!99608) b!120328))

(assert (= (and b!120328 res!99609) b!120329))

(assert (= (and b!120329 (not res!99610)) b!120330))

(assert (=> b!120328 m!180977))

(assert (=> b!120328 m!180975))

(assert (=> b!120330 m!180977))

(assert (=> b!120330 m!180977))

(declare-fun m!181803 () Bool)

(assert (=> b!120330 m!181803))

(assert (=> b!119969 d!38738))

(declare-fun d!38740 () Bool)

(declare-fun lt!187255 () tuple2!10082)

(assert (=> d!38740 (= lt!187255 (readBit!0 (readerFrom!0 (_2!5293 lt!186229) (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305))))))

(assert (=> d!38740 (= (readBitPure!0 (readerFrom!0 (_2!5293 lt!186229) (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305))) (tuple2!10063 (_2!5306 lt!187255) (_1!5306 lt!187255)))))

(declare-fun bs!9371 () Bool)

(assert (= bs!9371 d!38740))

(assert (=> bs!9371 m!181039))

(declare-fun m!181805 () Bool)

(assert (=> bs!9371 m!181805))

(assert (=> b!119971 d!38740))

(declare-fun d!38742 () Bool)

(declare-fun e!78801 () Bool)

(assert (=> d!38742 e!78801))

(declare-fun res!99614 () Bool)

(assert (=> d!38742 (=> (not res!99614) (not e!78801))))

(assert (=> d!38742 (= res!99614 (invariant!0 (currentBit!5519 (_2!5293 lt!186229)) (currentByte!5524 (_2!5293 lt!186229)) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(assert (=> d!38742 (= (readerFrom!0 (_2!5293 lt!186229) (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305)) (BitStream!4321 (buf!2851 (_2!5293 lt!186229)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)))))

(declare-fun b!120333 () Bool)

(assert (=> b!120333 (= e!78801 (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(assert (= (and d!38742 res!99614) b!120333))

(declare-fun m!181807 () Bool)

(assert (=> d!38742 m!181807))

(assert (=> b!120333 m!181043))

(assert (=> b!119971 d!38742))

(declare-fun d!38744 () Bool)

(declare-fun e!78802 () Bool)

(assert (=> d!38744 e!78802))

(declare-fun res!99615 () Bool)

(assert (=> d!38744 (=> (not res!99615) (not e!78802))))

(declare-fun lt!187259 () (_ BitVec 64))

(declare-fun lt!187261 () (_ BitVec 64))

(declare-fun lt!187258 () (_ BitVec 64))

(assert (=> d!38744 (= res!99615 (= lt!187259 (bvsub lt!187261 lt!187258)))))

(assert (=> d!38744 (or (= (bvand lt!187261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187258 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187261 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187261 lt!187258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38744 (= lt!187258 (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186218)))) ((_ sign_extend 32) (currentByte!5524 (_1!5296 lt!186218))) ((_ sign_extend 32) (currentBit!5519 (_1!5296 lt!186218)))))))

(declare-fun lt!187257 () (_ BitVec 64))

(declare-fun lt!187260 () (_ BitVec 64))

(assert (=> d!38744 (= lt!187261 (bvmul lt!187257 lt!187260))))

(assert (=> d!38744 (or (= lt!187257 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187260 (bvsdiv (bvmul lt!187257 lt!187260) lt!187257)))))

(assert (=> d!38744 (= lt!187260 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38744 (= lt!187257 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186218)))))))

(assert (=> d!38744 (= lt!187259 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5524 (_1!5296 lt!186218))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5519 (_1!5296 lt!186218)))))))

(assert (=> d!38744 (invariant!0 (currentBit!5519 (_1!5296 lt!186218)) (currentByte!5524 (_1!5296 lt!186218)) (size!2423 (buf!2851 (_1!5296 lt!186218))))))

(assert (=> d!38744 (= (bitIndex!0 (size!2423 (buf!2851 (_1!5296 lt!186218))) (currentByte!5524 (_1!5296 lt!186218)) (currentBit!5519 (_1!5296 lt!186218))) lt!187259)))

(declare-fun b!120334 () Bool)

(declare-fun res!99616 () Bool)

(assert (=> b!120334 (=> (not res!99616) (not e!78802))))

(assert (=> b!120334 (= res!99616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187259))))

(declare-fun b!120335 () Bool)

(declare-fun lt!187256 () (_ BitVec 64))

(assert (=> b!120335 (= e!78802 (bvsle lt!187259 (bvmul lt!187256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120335 (or (= lt!187256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187256)))))

(assert (=> b!120335 (= lt!187256 ((_ sign_extend 32) (size!2423 (buf!2851 (_1!5296 lt!186218)))))))

(assert (= (and d!38744 res!99615) b!120334))

(assert (= (and b!120334 res!99616) b!120335))

(declare-fun m!181809 () Bool)

(assert (=> d!38744 m!181809))

(declare-fun m!181811 () Bool)

(assert (=> d!38744 m!181811))

(assert (=> b!119972 d!38744))

(declare-fun d!38746 () Bool)

(assert (=> d!38746 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 thiss!1305))))))

(declare-fun bs!9372 () Bool)

(assert (= bs!9372 d!38746))

(declare-fun m!181813 () Bool)

(assert (=> bs!9372 m!181813))

(assert (=> start!23680 d!38746))

(declare-fun d!38748 () Bool)

(assert (=> d!38748 (= (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186215)))) (and (bvsge (currentBit!5519 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5519 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5524 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186215)))) (and (= (currentBit!5519 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186215))))))))))

(assert (=> b!119963 d!38748))

(declare-fun d!38750 () Bool)

(assert (=> d!38750 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119962 d!38750))

(declare-fun d!38752 () Bool)

(assert (=> d!38752 (= (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186229)))) (and (bvsge (currentBit!5519 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5519 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5524 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186229)))) (and (= (currentBit!5519 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5524 thiss!1305) (size!2423 (buf!2851 (_2!5293 lt!186229))))))))))

(assert (=> b!119973 d!38752))

(declare-fun d!38754 () Bool)

(declare-fun lt!187275 () tuple2!10060)

(declare-fun lt!187277 () tuple2!10060)

(assert (=> d!38754 (and (= (_2!5295 lt!187275) (_2!5295 lt!187277)) (= (_1!5295 lt!187275) (_1!5295 lt!187277)))))

(declare-fun lt!187276 () Unit!7389)

(declare-fun lt!187278 () BitStream!4320)

(declare-fun lt!187274 () Bool)

(declare-fun lt!187279 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10060 tuple2!10060 BitStream!4320 (_ BitVec 64) Bool BitStream!4320 (_ BitVec 64) tuple2!10060 tuple2!10060 BitStream!4320 (_ BitVec 64)) Unit!7389)

(assert (=> d!38754 (= lt!187276 (choose!45 (_1!5294 lt!186231) nBits!396 i!615 lt!186208 lt!187275 (tuple2!10061 (_1!5295 lt!187275) (_2!5295 lt!187275)) (_1!5295 lt!187275) (_2!5295 lt!187275) lt!187274 lt!187278 lt!187279 lt!187277 (tuple2!10061 (_1!5295 lt!187277) (_2!5295 lt!187277)) (_1!5295 lt!187277) (_2!5295 lt!187277)))))

(assert (=> d!38754 (= lt!187277 (readNLeastSignificantBitsLoopPure!0 lt!187278 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!187279))))

(assert (=> d!38754 (= lt!187279 (bvor lt!186208 (ite lt!187274 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38754 (= lt!187278 (withMovedBitIndex!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38754 (= lt!187274 (_2!5296 (readBitPure!0 (_1!5294 lt!186231))))))

(assert (=> d!38754 (= lt!187275 (readNLeastSignificantBitsLoopPure!0 (_1!5294 lt!186231) nBits!396 i!615 lt!186208))))

(assert (=> d!38754 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5294 lt!186231) nBits!396 i!615 lt!186208) lt!187276)))

(declare-fun bs!9374 () Bool)

(assert (= bs!9374 d!38754))

(assert (=> bs!9374 m!180991))

(declare-fun m!181815 () Bool)

(assert (=> bs!9374 m!181815))

(declare-fun m!181817 () Bool)

(assert (=> bs!9374 m!181817))

(assert (=> bs!9374 m!180999))

(assert (=> bs!9374 m!181019))

(assert (=> b!119964 d!38754))

(declare-fun d!38756 () Bool)

(declare-fun e!78803 () Bool)

(assert (=> d!38756 e!78803))

(declare-fun res!99617 () Bool)

(assert (=> d!38756 (=> (not res!99617) (not e!78803))))

(declare-fun lt!187283 () (_ BitVec 64))

(declare-fun lt!187285 () (_ BitVec 64))

(declare-fun lt!187282 () (_ BitVec 64))

(assert (=> d!38756 (= res!99617 (= lt!187283 (bvsub lt!187285 lt!187282)))))

(assert (=> d!38756 (or (= (bvand lt!187285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187285 lt!187282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38756 (= lt!187282 (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186215))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186215)))))))

(declare-fun lt!187281 () (_ BitVec 64))

(declare-fun lt!187284 () (_ BitVec 64))

(assert (=> d!38756 (= lt!187285 (bvmul lt!187281 lt!187284))))

(assert (=> d!38756 (or (= lt!187281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187284 (bvsdiv (bvmul lt!187281 lt!187284) lt!187281)))))

(assert (=> d!38756 (= lt!187284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38756 (= lt!187281 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))))))

(assert (=> d!38756 (= lt!187283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186215))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186215)))))))

(assert (=> d!38756 (invariant!0 (currentBit!5519 (_2!5293 lt!186215)) (currentByte!5524 (_2!5293 lt!186215)) (size!2423 (buf!2851 (_2!5293 lt!186215))))))

(assert (=> d!38756 (= (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186215))) (currentByte!5524 (_2!5293 lt!186215)) (currentBit!5519 (_2!5293 lt!186215))) lt!187283)))

(declare-fun b!120336 () Bool)

(declare-fun res!99618 () Bool)

(assert (=> b!120336 (=> (not res!99618) (not e!78803))))

(assert (=> b!120336 (= res!99618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187283))))

(declare-fun b!120337 () Bool)

(declare-fun lt!187280 () (_ BitVec 64))

(assert (=> b!120337 (= e!78803 (bvsle lt!187283 (bvmul lt!187280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120337 (or (= lt!187280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187280)))))

(assert (=> b!120337 (= lt!187280 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186215)))))))

(assert (= (and d!38756 res!99617) b!120336))

(assert (= (and b!120336 res!99618) b!120337))

(declare-fun m!181819 () Bool)

(assert (=> d!38756 m!181819))

(declare-fun m!181821 () Bool)

(assert (=> d!38756 m!181821))

(assert (=> b!119964 d!38756))

(declare-fun lt!187286 () tuple2!10080)

(declare-fun d!38758 () Bool)

(assert (=> d!38758 (= lt!187286 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186226))))

(assert (=> d!38758 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!186226) (tuple2!10061 (_2!5305 lt!187286) (_1!5305 lt!187286)))))

(declare-fun bs!9375 () Bool)

(assert (= bs!9375 d!38758))

(assert (=> bs!9375 m!181019))

(declare-fun m!181823 () Bool)

(assert (=> bs!9375 m!181823))

(assert (=> b!119964 d!38758))

(declare-fun d!38760 () Bool)

(declare-fun e!78804 () Bool)

(assert (=> d!38760 e!78804))

(declare-fun res!99619 () Bool)

(assert (=> d!38760 (=> (not res!99619) (not e!78804))))

(declare-fun lt!187290 () (_ BitVec 64))

(declare-fun lt!187292 () (_ BitVec 64))

(declare-fun lt!187289 () (_ BitVec 64))

(assert (=> d!38760 (= res!99619 (= lt!187290 (bvsub lt!187292 lt!187289)))))

(assert (=> d!38760 (or (= (bvand lt!187292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187292 lt!187289) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38760 (= lt!187289 (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305))))))

(declare-fun lt!187288 () (_ BitVec 64))

(declare-fun lt!187291 () (_ BitVec 64))

(assert (=> d!38760 (= lt!187292 (bvmul lt!187288 lt!187291))))

(assert (=> d!38760 (or (= lt!187288 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187291 (bvsdiv (bvmul lt!187288 lt!187291) lt!187288)))))

(assert (=> d!38760 (= lt!187291 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38760 (= lt!187288 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))))))

(assert (=> d!38760 (= lt!187290 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5524 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5519 thiss!1305))))))

(assert (=> d!38760 (invariant!0 (currentBit!5519 thiss!1305) (currentByte!5524 thiss!1305) (size!2423 (buf!2851 thiss!1305)))))

(assert (=> d!38760 (= (bitIndex!0 (size!2423 (buf!2851 thiss!1305)) (currentByte!5524 thiss!1305) (currentBit!5519 thiss!1305)) lt!187290)))

(declare-fun b!120338 () Bool)

(declare-fun res!99620 () Bool)

(assert (=> b!120338 (=> (not res!99620) (not e!78804))))

(assert (=> b!120338 (= res!99620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187290))))

(declare-fun b!120339 () Bool)

(declare-fun lt!187287 () (_ BitVec 64))

(assert (=> b!120339 (= e!78804 (bvsle lt!187290 (bvmul lt!187287 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120339 (or (= lt!187287 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187287 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187287)))))

(assert (=> b!120339 (= lt!187287 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))))))

(assert (= (and d!38760 res!99619) b!120338))

(assert (= (and b!120338 res!99620) b!120339))

(declare-fun m!181825 () Bool)

(assert (=> d!38760 m!181825))

(assert (=> d!38760 m!181813))

(assert (=> b!119964 d!38760))

(declare-fun d!38762 () Bool)

(declare-fun e!78807 () Bool)

(assert (=> d!38762 e!78807))

(declare-fun res!99623 () Bool)

(assert (=> d!38762 (=> (not res!99623) (not e!78807))))

(declare-fun lt!187298 () (_ BitVec 64))

(declare-fun lt!187297 () BitStream!4320)

(assert (=> d!38762 (= res!99623 (= (bvadd lt!187298 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2423 (buf!2851 lt!187297)) (currentByte!5524 lt!187297) (currentBit!5519 lt!187297))))))

(assert (=> d!38762 (or (not (= (bvand lt!187298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187298 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38762 (= lt!187298 (bitIndex!0 (size!2423 (buf!2851 (_1!5294 lt!186231))) (currentByte!5524 (_1!5294 lt!186231)) (currentBit!5519 (_1!5294 lt!186231))))))

(declare-fun moveBitIndex!0 (BitStream!4320 (_ BitVec 64)) tuple2!10056)

(assert (=> d!38762 (= lt!187297 (_2!5293 (moveBitIndex!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4320 (_ BitVec 64)) Bool)

(assert (=> d!38762 (moveBitIndexPrecond!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38762 (= (withMovedBitIndex!0 (_1!5294 lt!186231) #b0000000000000000000000000000000000000000000000000000000000000001) lt!187297)))

(declare-fun b!120342 () Bool)

(assert (=> b!120342 (= e!78807 (= (size!2423 (buf!2851 (_1!5294 lt!186231))) (size!2423 (buf!2851 lt!187297))))))

(assert (= (and d!38762 res!99623) b!120342))

(declare-fun m!181827 () Bool)

(assert (=> d!38762 m!181827))

(declare-fun m!181829 () Bool)

(assert (=> d!38762 m!181829))

(declare-fun m!181831 () Bool)

(assert (=> d!38762 m!181831))

(declare-fun m!181833 () Bool)

(assert (=> d!38762 m!181833))

(assert (=> b!119964 d!38762))

(declare-fun d!38764 () Bool)

(declare-fun e!78808 () Bool)

(assert (=> d!38764 e!78808))

(declare-fun res!99624 () Bool)

(assert (=> d!38764 (=> (not res!99624) (not e!78808))))

(declare-fun lt!187302 () (_ BitVec 64))

(declare-fun lt!187304 () (_ BitVec 64))

(declare-fun lt!187301 () (_ BitVec 64))

(assert (=> d!38764 (= res!99624 (= lt!187302 (bvsub lt!187304 lt!187301)))))

(assert (=> d!38764 (or (= (bvand lt!187304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187304 lt!187301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38764 (= lt!187301 (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186229)))) ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229)))))))

(declare-fun lt!187300 () (_ BitVec 64))

(declare-fun lt!187303 () (_ BitVec 64))

(assert (=> d!38764 (= lt!187304 (bvmul lt!187300 lt!187303))))

(assert (=> d!38764 (or (= lt!187300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187303 (bvsdiv (bvmul lt!187300 lt!187303) lt!187300)))))

(assert (=> d!38764 (= lt!187303 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38764 (= lt!187300 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(assert (=> d!38764 (= lt!187302 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5524 (_2!5293 lt!186229))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5519 (_2!5293 lt!186229)))))))

(assert (=> d!38764 (invariant!0 (currentBit!5519 (_2!5293 lt!186229)) (currentByte!5524 (_2!5293 lt!186229)) (size!2423 (buf!2851 (_2!5293 lt!186229))))))

(assert (=> d!38764 (= (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!187302)))

(declare-fun b!120343 () Bool)

(declare-fun res!99625 () Bool)

(assert (=> b!120343 (=> (not res!99625) (not e!78808))))

(assert (=> b!120343 (= res!99625 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187302))))

(declare-fun b!120344 () Bool)

(declare-fun lt!187299 () (_ BitVec 64))

(assert (=> b!120344 (= e!78808 (bvsle lt!187302 (bvmul lt!187299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120344 (or (= lt!187299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187299)))))

(assert (=> b!120344 (= lt!187299 ((_ sign_extend 32) (size!2423 (buf!2851 (_2!5293 lt!186229)))))))

(assert (= (and d!38764 res!99624) b!120343))

(assert (= (and b!120343 res!99625) b!120344))

(declare-fun m!181835 () Bool)

(assert (=> d!38764 m!181835))

(assert (=> d!38764 m!181807))

(assert (=> b!119964 d!38764))

(declare-fun d!38766 () Bool)

(declare-fun e!78809 () Bool)

(assert (=> d!38766 e!78809))

(declare-fun res!99626 () Bool)

(assert (=> d!38766 (=> (not res!99626) (not e!78809))))

(declare-fun lt!187305 () BitStream!4320)

(declare-fun lt!187306 () (_ BitVec 64))

(assert (=> d!38766 (= res!99626 (= (bvadd lt!187306 (bvsub lt!186216 lt!186217)) (bitIndex!0 (size!2423 (buf!2851 lt!187305)) (currentByte!5524 lt!187305) (currentBit!5519 lt!187305))))))

(assert (=> d!38766 (or (not (= (bvand lt!187306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!186216 lt!186217) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187306 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187306 (bvsub lt!186216 lt!186217)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38766 (= lt!187306 (bitIndex!0 (size!2423 (buf!2851 (_2!5294 lt!186231))) (currentByte!5524 (_2!5294 lt!186231)) (currentBit!5519 (_2!5294 lt!186231))))))

(assert (=> d!38766 (= lt!187305 (_2!5293 (moveBitIndex!0 (_2!5294 lt!186231) (bvsub lt!186216 lt!186217))))))

(assert (=> d!38766 (moveBitIndexPrecond!0 (_2!5294 lt!186231) (bvsub lt!186216 lt!186217))))

(assert (=> d!38766 (= (withMovedBitIndex!0 (_2!5294 lt!186231) (bvsub lt!186216 lt!186217)) lt!187305)))

(declare-fun b!120345 () Bool)

(assert (=> b!120345 (= e!78809 (= (size!2423 (buf!2851 (_2!5294 lt!186231))) (size!2423 (buf!2851 lt!187305))))))

(assert (= (and d!38766 res!99626) b!120345))

(declare-fun m!181837 () Bool)

(assert (=> d!38766 m!181837))

(declare-fun m!181839 () Bool)

(assert (=> d!38766 m!181839))

(declare-fun m!181841 () Bool)

(assert (=> d!38766 m!181841))

(declare-fun m!181843 () Bool)

(assert (=> d!38766 m!181843))

(assert (=> b!119964 d!38766))

(declare-fun d!38768 () Bool)

(declare-fun e!78810 () Bool)

(assert (=> d!38768 e!78810))

(declare-fun res!99627 () Bool)

(assert (=> d!38768 (=> (not res!99627) (not e!78810))))

(declare-fun lt!187308 () (_ BitVec 64))

(declare-fun lt!187307 () BitStream!4320)

(assert (=> d!38768 (= res!99627 (= (bvadd lt!187308 (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217)) (bitIndex!0 (size!2423 (buf!2851 lt!187307)) (currentByte!5524 lt!187307) (currentBit!5519 lt!187307))))))

(assert (=> d!38768 (or (not (= (bvand lt!187308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187308 (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38768 (= lt!187308 (bitIndex!0 (size!2423 (buf!2851 (_2!5294 lt!186212))) (currentByte!5524 (_2!5294 lt!186212)) (currentBit!5519 (_2!5294 lt!186212))))))

(assert (=> d!38768 (= lt!187307 (_2!5293 (moveBitIndex!0 (_2!5294 lt!186212) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217))))))

(assert (=> d!38768 (moveBitIndexPrecond!0 (_2!5294 lt!186212) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217))))

(assert (=> d!38768 (= (withMovedBitIndex!0 (_2!5294 lt!186212) (bvsub (bitIndex!0 (size!2423 (buf!2851 (_2!5293 lt!186229))) (currentByte!5524 (_2!5293 lt!186229)) (currentBit!5519 (_2!5293 lt!186229))) lt!186217)) lt!187307)))

(declare-fun b!120346 () Bool)

(assert (=> b!120346 (= e!78810 (= (size!2423 (buf!2851 (_2!5294 lt!186212))) (size!2423 (buf!2851 lt!187307))))))

(assert (= (and d!38768 res!99627) b!120346))

(declare-fun m!181845 () Bool)

(assert (=> d!38768 m!181845))

(declare-fun m!181847 () Bool)

(assert (=> d!38768 m!181847))

(declare-fun m!181849 () Bool)

(assert (=> d!38768 m!181849))

(declare-fun m!181851 () Bool)

(assert (=> d!38768 m!181851))

(assert (=> b!119964 d!38768))

(declare-fun d!38770 () Bool)

(assert (=> d!38770 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305)) lt!186227) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2423 (buf!2851 thiss!1305))) ((_ sign_extend 32) (currentByte!5524 thiss!1305)) ((_ sign_extend 32) (currentBit!5519 thiss!1305))) lt!186227))))

(declare-fun bs!9376 () Bool)

(assert (= bs!9376 d!38770))

(assert (=> bs!9376 m!181825))

(assert (=> b!119974 d!38770))

(assert (=> b!119965 d!38764))

(assert (=> b!119965 d!38760))

(check-sat (not d!38744) (not d!38634) (not b!120119) (not d!38762) (not b!120310) (not b!120103) (not b!120142) (not d!38768) (not d!38638) (not b!120333) (not b!120323) (not d!38742) (not bm!1568) (not b!120317) (not b!120313) (not d!38746) (not d!38632) (not b!120327) (not b!120321) (not b!120122) (not d!38630) (not d!38626) (not b!120120) (not d!38642) (not d!38650) (not b!120138) (not b!120121) (not d!38754) (not d!38760) (not b!120139) (not b!120312) (not b!120330) (not d!38740) (not b!120316) (not d!38736) (not b!120140) (not d!38758) (not b!120324) (not d!38648) (not d!38770) (not d!38764) (not b!120101) (not d!38646) (not b!120328) (not d!38766) (not d!38640) (not b!120322) (not d!38756) (not d!38644) (not b!120325) (not d!38622) (not d!38636) (not b!120319) (not b!120318) (not d!38628) (not b!120314) (not d!38624))
(check-sat)
