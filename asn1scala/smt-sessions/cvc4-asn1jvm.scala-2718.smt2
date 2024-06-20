; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66512 () Bool)

(assert start!66512)

(declare-fun res!245975 () Bool)

(declare-fun e!213492 () Bool)

(assert (=> start!66512 (=> (not res!245975) (not e!213492))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17871 0))(
  ( (array!17872 (arr!8826 (Array (_ BitVec 32) (_ BitVec 8))) (size!7746 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17871)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!66512 (= res!245975 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7746 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66512 e!213492))

(declare-datatypes ((BitStream!13496 0))(
  ( (BitStream!13497 (buf!7809 array!17871) (currentByte!14363 (_ BitVec 32)) (currentBit!14358 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13496)

(declare-fun e!213490 () Bool)

(declare-fun inv!12 (BitStream!13496) Bool)

(assert (=> start!66512 (and (inv!12 thiss!1728) e!213490)))

(assert (=> start!66512 true))

(declare-fun array_inv!7358 (array!17871) Bool)

(assert (=> start!66512 (array_inv!7358 arr!273)))

(declare-fun b!298061 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298061 (= e!213492 (not (invariant!0 (currentBit!14358 thiss!1728) (currentByte!14363 thiss!1728) (size!7746 (buf!7809 thiss!1728)))))))

(declare-fun arrayBitRangesEq!0 (array!17871 array!17871 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298061 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20813 0))(
  ( (Unit!20814) )
))
(declare-fun lt!434246 () Unit!20813)

(declare-fun lt!434245 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17871 array!17871 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20813)

(assert (=> b!298061 (= lt!434246 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434245 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!298061 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434245)))

(assert (=> b!298061 (= lt!434245 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7746 arr!273))))))

(declare-fun lt!434247 () Unit!20813)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17871) Unit!20813)

(assert (=> b!298061 (= lt!434247 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!298059 () Bool)

(declare-fun res!245973 () Bool)

(assert (=> b!298059 (=> (not res!245973) (not e!213492))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298059 (= res!245973 (validate_offset_bits!1 ((_ sign_extend 32) (size!7746 (buf!7809 thiss!1728))) ((_ sign_extend 32) (currentByte!14363 thiss!1728)) ((_ sign_extend 32) (currentBit!14358 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!298060 () Bool)

(declare-fun res!245974 () Bool)

(assert (=> b!298060 (=> (not res!245974) (not e!213492))))

(assert (=> b!298060 (= res!245974 (bvsge from!505 to!474))))

(declare-fun b!298062 () Bool)

(assert (=> b!298062 (= e!213490 (array_inv!7358 (buf!7809 thiss!1728)))))

(assert (= (and start!66512 res!245975) b!298059))

(assert (= (and b!298059 res!245973) b!298060))

(assert (= (and b!298060 res!245974) b!298061))

(assert (= start!66512 b!298062))

(declare-fun m!436975 () Bool)

(assert (=> start!66512 m!436975))

(declare-fun m!436977 () Bool)

(assert (=> start!66512 m!436977))

(declare-fun m!436979 () Bool)

(assert (=> b!298061 m!436979))

(declare-fun m!436981 () Bool)

(assert (=> b!298061 m!436981))

(declare-fun m!436983 () Bool)

(assert (=> b!298061 m!436983))

(declare-fun m!436985 () Bool)

(assert (=> b!298061 m!436985))

(declare-fun m!436987 () Bool)

(assert (=> b!298061 m!436987))

(declare-fun m!436989 () Bool)

(assert (=> b!298059 m!436989))

(declare-fun m!436991 () Bool)

(assert (=> b!298062 m!436991))

(push 1)

(assert (not b!298059))

(assert (not b!298062))

(assert (not b!298061))

(assert (not start!66512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100324 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!100324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7746 (buf!7809 thiss!1728))) ((_ sign_extend 32) (currentByte!14363 thiss!1728)) ((_ sign_extend 32) (currentBit!14358 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7746 (buf!7809 thiss!1728))) ((_ sign_extend 32) (currentByte!14363 thiss!1728)) ((_ sign_extend 32) (currentBit!14358 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25681 () Bool)

(assert (= bs!25681 d!100324))

(declare-fun m!437003 () Bool)

(assert (=> bs!25681 m!437003))

(assert (=> b!298059 d!100324))

(declare-fun d!100326 () Bool)

(assert (=> d!100326 (= (array_inv!7358 (buf!7809 thiss!1728)) (bvsge (size!7746 (buf!7809 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!298062 d!100326))

(declare-fun b!298129 () Bool)

(declare-fun e!213551 () Bool)

(declare-fun e!213550 () Bool)

(assert (=> b!298129 (= e!213551 e!213550)))

(declare-fun c!13639 () Bool)

(declare-datatypes ((tuple4!934 0))(
  ( (tuple4!935 (_1!13116 (_ BitVec 32)) (_2!13116 (_ BitVec 32)) (_3!1424 (_ BitVec 32)) (_4!467 (_ BitVec 32))) )
))
(declare-fun lt!434289 () tuple4!934)

(assert (=> b!298129 (= c!13639 (= (_3!1424 lt!434289) (_4!467 lt!434289)))))

(declare-fun b!298131 () Bool)

(declare-fun res!246028 () Bool)

(declare-fun lt!434288 () (_ BitVec 32))

(assert (=> b!298131 (= res!246028 (= lt!434288 #b00000000000000000000000000000000))))

(declare-fun e!213552 () Bool)

(assert (=> b!298131 (=> res!246028 e!213552)))

(declare-fun e!213553 () Bool)

(assert (=> b!298131 (= e!213553 e!213552)))

(declare-fun b!298132 () Bool)

(declare-fun e!213555 () Bool)

(declare-fun arrayRangesEq!1525 (array!17871 array!17871 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!298132 (= e!213555 (arrayRangesEq!1525 arr!273 arr!273 (_1!13116 lt!434289) (_2!13116 lt!434289)))))

(declare-fun b!298133 () Bool)

(assert (=> b!298133 (= e!213550 e!213553)))

(declare-fun res!246025 () Bool)

(declare-fun call!5277 () Bool)

(assert (=> b!298133 (= res!246025 call!5277)))

(assert (=> b!298133 (=> (not res!246025) (not e!213553))))

(declare-fun lt!434287 () (_ BitVec 32))

(declare-fun bm!5274 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5274 (= call!5277 (byteRangesEq!0 (select (arr!8826 arr!273) (_3!1424 lt!434289)) (select (arr!8826 arr!273) (_3!1424 lt!434289)) lt!434287 (ite c!13639 lt!434288 #b00000000000000000000000000001000)))))

(declare-fun b!298130 () Bool)

(assert (=> b!298130 (= e!213552 (byteRangesEq!0 (select (arr!8826 arr!273) (_4!467 lt!434289)) (select (arr!8826 arr!273) (_4!467 lt!434289)) #b00000000000000000000000000000000 lt!434288))))

(declare-fun d!100328 () Bool)

(declare-fun res!246027 () Bool)

(declare-fun e!213554 () Bool)

(assert (=> d!100328 (=> res!246027 e!213554)))

(assert (=> d!100328 (= res!246027 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!434245))))

(assert (=> d!100328 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434245) e!213554)))

(declare-fun b!298134 () Bool)

(assert (=> b!298134 (= e!213554 e!213551)))

(declare-fun res!246026 () Bool)

(assert (=> b!298134 (=> (not res!246026) (not e!213551))))

(assert (=> b!298134 (= res!246026 e!213555)))

(declare-fun res!246024 () Bool)

(assert (=> b!298134 (=> res!246024 e!213555)))

(assert (=> b!298134 (= res!246024 (bvsge (_1!13116 lt!434289) (_2!13116 lt!434289)))))

(assert (=> b!298134 (= lt!434288 ((_ extract 31 0) (bvsrem lt!434245 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298134 (= lt!434287 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!934)

(assert (=> b!298134 (= lt!434289 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!434245))))

(declare-fun b!298135 () Bool)

(assert (=> b!298135 (= e!213550 call!5277)))

(assert (= (and d!100328 (not res!246027)) b!298134))

(assert (= (and b!298134 (not res!246024)) b!298132))

(assert (= (and b!298134 res!246026) b!298129))

(assert (= (and b!298129 c!13639) b!298135))

(assert (= (and b!298129 (not c!13639)) b!298133))

(assert (= (and b!298133 res!246025) b!298131))

(assert (= (and b!298131 (not res!246028)) b!298130))

(assert (= (or b!298135 b!298133) bm!5274))

(declare-fun m!437043 () Bool)

(assert (=> b!298132 m!437043))

(declare-fun m!437045 () Bool)

(assert (=> bm!5274 m!437045))

(assert (=> bm!5274 m!437045))

(assert (=> bm!5274 m!437045))

(assert (=> bm!5274 m!437045))

(declare-fun m!437047 () Bool)

(assert (=> bm!5274 m!437047))

(declare-fun m!437049 () Bool)

(assert (=> b!298130 m!437049))

(assert (=> b!298130 m!437049))

(assert (=> b!298130 m!437049))

(assert (=> b!298130 m!437049))

(declare-fun m!437051 () Bool)

(assert (=> b!298130 m!437051))

(declare-fun m!437053 () Bool)

(assert (=> b!298134 m!437053))

(assert (=> b!298061 d!100328))

(declare-fun d!100342 () Bool)

(assert (=> d!100342 (= (invariant!0 (currentBit!14358 thiss!1728) (currentByte!14363 thiss!1728) (size!7746 (buf!7809 thiss!1728))) (and (bvsge (currentBit!14358 thiss!1728) #b00000000000000000000000000000000) (bvslt (currentBit!14358 thiss!1728) #b00000000000000000000000000001000) (bvsge (currentByte!14363 thiss!1728) #b00000000000000000000000000000000) (or (bvslt (currentByte!14363 thiss!1728) (size!7746 (buf!7809 thiss!1728))) (and (= (currentBit!14358 thiss!1728) #b00000000000000000000000000000000) (= (currentByte!14363 thiss!1728) (size!7746 (buf!7809 thiss!1728)))))))))

(assert (=> b!298061 d!100342))

(declare-fun d!100348 () Bool)

(declare-fun e!213567 () Bool)

(assert (=> d!100348 e!213567))

(declare-fun res!246039 () Bool)

(assert (=> d!100348 (=> (not res!246039) (not e!213567))))

(declare-fun lt!434304 () (_ BitVec 64))

(assert (=> d!100348 (= res!246039 (or (= lt!434304 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!434304 #b0000000000000000000000000000000000000000000000000000000000001000) lt!434304))))))

(assert (=> d!100348 (= lt!434304 ((_ sign_extend 32) (size!7746 arr!273)))))

(declare-fun lt!434303 () Unit!20813)

(declare-fun choose!59 (array!17871) Unit!20813)

(assert (=> d!100348 (= lt!434303 (choose!59 arr!273))))

(assert (=> d!100348 (= (arrayBitRangesEqReflexiveLemma!0 arr!273) lt!434303)))

(declare-fun b!298148 () Bool)

(assert (=> b!298148 (= e!213567 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!7746 arr!273)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!100348 res!246039) b!298148))

(declare-fun m!437071 () Bool)

(assert (=> d!100348 m!437071))

(declare-fun m!437073 () Bool)

(assert (=> b!298148 m!437073))

(assert (=> b!298061 d!100348))

(declare-fun b!298149 () Bool)

(declare-fun e!213569 () Bool)

(declare-fun e!213568 () Bool)

(assert (=> b!298149 (= e!213569 e!213568)))

(declare-fun c!13641 () Bool)

(declare-fun lt!434307 () tuple4!934)

(assert (=> b!298149 (= c!13641 (= (_3!1424 lt!434307) (_4!467 lt!434307)))))

(declare-fun b!298151 () Bool)

(declare-fun res!246044 () Bool)

(declare-fun lt!434306 () (_ BitVec 32))

(assert (=> b!298151 (= res!246044 (= lt!434306 #b00000000000000000000000000000000))))

(declare-fun e!213570 () Bool)

(assert (=> b!298151 (=> res!246044 e!213570)))

(declare-fun e!213571 () Bool)

(assert (=> b!298151 (= e!213571 e!213570)))

(declare-fun b!298152 () Bool)

(declare-fun e!213573 () Bool)

(assert (=> b!298152 (= e!213573 (arrayRangesEq!1525 arr!273 arr!273 (_1!13116 lt!434307) (_2!13116 lt!434307)))))

(declare-fun b!298153 () Bool)

(assert (=> b!298153 (= e!213568 e!213571)))

(declare-fun res!246041 () Bool)

(declare-fun call!5279 () Bool)

(assert (=> b!298153 (= res!246041 call!5279)))

(assert (=> b!298153 (=> (not res!246041) (not e!213571))))

(declare-fun lt!434305 () (_ BitVec 32))

(declare-fun bm!5276 () Bool)

(assert (=> bm!5276 (= call!5279 (byteRangesEq!0 (select (arr!8826 arr!273) (_3!1424 lt!434307)) (select (arr!8826 arr!273) (_3!1424 lt!434307)) lt!434305 (ite c!13641 lt!434306 #b00000000000000000000000000001000)))))

(declare-fun b!298150 () Bool)

(assert (=> b!298150 (= e!213570 (byteRangesEq!0 (select (arr!8826 arr!273) (_4!467 lt!434307)) (select (arr!8826 arr!273) (_4!467 lt!434307)) #b00000000000000000000000000000000 lt!434306))))

(declare-fun d!100350 () Bool)

(declare-fun res!246043 () Bool)

(declare-fun e!213572 () Bool)

(assert (=> d!100350 (=> res!246043 e!213572)))

(assert (=> d!100350 (= res!246043 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!100350 (= (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!213572)))

(declare-fun b!298154 () Bool)

(assert (=> b!298154 (= e!213572 e!213569)))

(declare-fun res!246042 () Bool)

(assert (=> b!298154 (=> (not res!246042) (not e!213569))))

(assert (=> b!298154 (= res!246042 e!213573)))

(declare-fun res!246040 () Bool)

(assert (=> b!298154 (=> res!246040 e!213573)))

(assert (=> b!298154 (= res!246040 (bvsge (_1!13116 lt!434307) (_2!13116 lt!434307)))))

(assert (=> b!298154 (= lt!434306 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298154 (= lt!434305 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298154 (= lt!434307 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!298155 () Bool)

(assert (=> b!298155 (= e!213568 call!5279)))

(assert (= (and d!100350 (not res!246043)) b!298154))

(assert (= (and b!298154 (not res!246040)) b!298152))

(assert (= (and b!298154 res!246042) b!298149))

(assert (= (and b!298149 c!13641) b!298155))

(assert (= (and b!298149 (not c!13641)) b!298153))

(assert (= (and b!298153 res!246041) b!298151))

(assert (= (and b!298151 (not res!246044)) b!298150))

(assert (= (or b!298155 b!298153) bm!5276))

(declare-fun m!437075 () Bool)

(assert (=> b!298152 m!437075))

(declare-fun m!437077 () Bool)

(assert (=> bm!5276 m!437077))

(assert (=> bm!5276 m!437077))

(assert (=> bm!5276 m!437077))

(assert (=> bm!5276 m!437077))

(declare-fun m!437079 () Bool)

(assert (=> bm!5276 m!437079))

(declare-fun m!437081 () Bool)

(assert (=> b!298150 m!437081))

(assert (=> b!298150 m!437081))

(assert (=> b!298150 m!437081))

(assert (=> b!298150 m!437081))

(declare-fun m!437083 () Bool)

(assert (=> b!298150 m!437083))

(declare-fun m!437085 () Bool)

(assert (=> b!298154 m!437085))

(assert (=> b!298061 d!100350))

(declare-fun d!100352 () Bool)

(assert (=> d!100352 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

