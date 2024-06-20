; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55972 () Bool)

(assert start!55972)

(declare-fun res!217715 () Bool)

(declare-fun e!180417 () Bool)

(assert (=> start!55972 (=> (not res!217715) (not e!180417))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55972 (= res!217715 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55972 e!180417))

(assert (=> start!55972 true))

(declare-datatypes ((array!14223 0))(
  ( (array!14224 (arr!7213 (Array (_ BitVec 32) (_ BitVec 8))) (size!6226 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11374 0))(
  ( (BitStream!11375 (buf!6748 array!14223) (currentByte!12410 (_ BitVec 32)) (currentBit!12405 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11374)

(declare-fun e!180415 () Bool)

(declare-fun inv!12 (BitStream!11374) Bool)

(assert (=> start!55972 (and (inv!12 thiss!1754) e!180415)))

(declare-fun b!259964 () Bool)

(declare-fun e!180418 () Bool)

(assert (=> b!259964 (= e!180417 e!180418)))

(declare-fun res!217717 () Bool)

(assert (=> b!259964 (=> (not res!217717) (not e!180418))))

(declare-datatypes ((tuple2!22292 0))(
  ( (tuple2!22293 (_1!12082 Bool) (_2!12082 BitStream!11374)) )
))
(declare-fun lt!402091 () tuple2!22292)

(declare-fun expected!109 () Bool)

(assert (=> b!259964 (= res!217717 (= (_1!12082 lt!402091) expected!109))))

(declare-fun readBit!0 (BitStream!11374) tuple2!22292)

(assert (=> b!259964 (= lt!402091 (readBit!0 thiss!1754))))

(declare-fun b!259965 () Bool)

(declare-fun res!217713 () Bool)

(assert (=> b!259965 (=> (not res!217713) (not e!180417))))

(assert (=> b!259965 (= res!217713 (not (= from!526 nBits!535)))))

(declare-fun lt!402092 () (_ BitVec 64))

(declare-fun lt!402088 () (_ BitVec 64))

(declare-fun b!259966 () Bool)

(declare-fun e!180416 () Bool)

(declare-fun lt!402089 () tuple2!22292)

(assert (=> b!259966 (= e!180416 (or (not (= (buf!6748 thiss!1754) (buf!6748 (_2!12082 lt!402089)))) (not (_1!12082 lt!402089)) (let ((bdg!16208 (bvand lt!402088 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!16208 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!16208 (bvand lt!402092 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!259967 () Bool)

(declare-fun array_inv!5967 (array!14223) Bool)

(assert (=> b!259967 (= e!180415 (array_inv!5967 (buf!6748 thiss!1754)))))

(declare-fun b!259968 () Bool)

(assert (=> b!259968 (= e!180418 (not e!180416))))

(declare-fun res!217714 () Bool)

(assert (=> b!259968 (=> res!217714 e!180416)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259968 (= res!217714 (bvslt lt!402092 (bitIndex!0 (size!6226 (buf!6748 (_2!12082 lt!402089))) (currentByte!12410 (_2!12082 lt!402089)) (currentBit!12405 (_2!12082 lt!402089)))))))

(assert (=> b!259968 (= lt!402092 (bvsub lt!402088 from!526))))

(assert (=> b!259968 (= lt!402088 (bvadd (bitIndex!0 (size!6226 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754) (currentBit!12405 thiss!1754)) nBits!535))))

(declare-fun checkBitsLoop!0 (BitStream!11374 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22292)

(assert (=> b!259968 (= lt!402089 (checkBitsLoop!0 (_2!12082 lt!402091) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259968 (validate_offset_bits!1 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402091)))) ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402091))) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402091))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18495 0))(
  ( (Unit!18496) )
))
(declare-fun lt!402090 () Unit!18495)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11374 BitStream!11374 (_ BitVec 64) (_ BitVec 64)) Unit!18495)

(assert (=> b!259968 (= lt!402090 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12082 lt!402091) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259969 () Bool)

(declare-fun res!217716 () Bool)

(assert (=> b!259969 (=> (not res!217716) (not e!180417))))

(assert (=> b!259969 (= res!217716 (validate_offset_bits!1 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))) ((_ sign_extend 32) (currentByte!12410 thiss!1754)) ((_ sign_extend 32) (currentBit!12405 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55972 res!217715) b!259969))

(assert (= (and b!259969 res!217716) b!259965))

(assert (= (and b!259965 res!217713) b!259964))

(assert (= (and b!259964 res!217717) b!259968))

(assert (= (and b!259968 (not res!217714)) b!259966))

(assert (= start!55972 b!259967))

(declare-fun m!389225 () Bool)

(assert (=> b!259968 m!389225))

(declare-fun m!389227 () Bool)

(assert (=> b!259968 m!389227))

(declare-fun m!389229 () Bool)

(assert (=> b!259968 m!389229))

(declare-fun m!389231 () Bool)

(assert (=> b!259968 m!389231))

(declare-fun m!389233 () Bool)

(assert (=> b!259968 m!389233))

(declare-fun m!389235 () Bool)

(assert (=> start!55972 m!389235))

(declare-fun m!389237 () Bool)

(assert (=> b!259967 m!389237))

(declare-fun m!389239 () Bool)

(assert (=> b!259964 m!389239))

(declare-fun m!389241 () Bool)

(assert (=> b!259969 m!389241))

(push 1)

(assert (not b!259967))

(assert (not start!55972))

(assert (not b!259968))

(assert (not b!259969))

(assert (not b!259964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87194 () Bool)

(assert (=> d!87194 (= (array_inv!5967 (buf!6748 thiss!1754)) (bvsge (size!6226 (buf!6748 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259967 d!87194))

(declare-fun d!87196 () Bool)

(declare-fun e!180451 () Bool)

(assert (=> d!87196 e!180451))

(declare-fun res!217753 () Bool)

(assert (=> d!87196 (=> (not res!217753) (not e!180451))))

(declare-fun lt!402136 () (_ BitVec 64))

(declare-fun lt!402140 () (_ BitVec 64))

(declare-fun lt!402139 () (_ BitVec 64))

(assert (=> d!87196 (= res!217753 (= lt!402140 (bvsub lt!402136 lt!402139)))))

(assert (=> d!87196 (or (= (bvand lt!402136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402139 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402136 lt!402139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87196 (= lt!402139 (remainingBits!0 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402089)))) ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402089))) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402089)))))))

(declare-fun lt!402138 () (_ BitVec 64))

(declare-fun lt!402137 () (_ BitVec 64))

(assert (=> d!87196 (= lt!402136 (bvmul lt!402138 lt!402137))))

(assert (=> d!87196 (or (= lt!402138 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402137 (bvsdiv (bvmul lt!402138 lt!402137) lt!402138)))))

(assert (=> d!87196 (= lt!402137 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87196 (= lt!402138 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402089)))))))

(assert (=> d!87196 (= lt!402140 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402089))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402089)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87196 (invariant!0 (currentBit!12405 (_2!12082 lt!402089)) (currentByte!12410 (_2!12082 lt!402089)) (size!6226 (buf!6748 (_2!12082 lt!402089))))))

(assert (=> d!87196 (= (bitIndex!0 (size!6226 (buf!6748 (_2!12082 lt!402089))) (currentByte!12410 (_2!12082 lt!402089)) (currentBit!12405 (_2!12082 lt!402089))) lt!402140)))

(declare-fun b!260010 () Bool)

(declare-fun res!217752 () Bool)

(assert (=> b!260010 (=> (not res!217752) (not e!180451))))

(assert (=> b!260010 (= res!217752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402140))))

(declare-fun b!260011 () Bool)

(declare-fun lt!402135 () (_ BitVec 64))

(assert (=> b!260011 (= e!180451 (bvsle lt!402140 (bvmul lt!402135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260011 (or (= lt!402135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402135)))))

(assert (=> b!260011 (= lt!402135 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402089)))))))

(assert (= (and d!87196 res!217753) b!260010))

(assert (= (and b!260010 res!217752) b!260011))

(declare-fun m!389279 () Bool)

(assert (=> d!87196 m!389279))

(declare-fun m!389281 () Bool)

(assert (=> d!87196 m!389281))

(assert (=> b!259968 d!87196))

(declare-fun d!87202 () Bool)

(declare-fun e!180452 () Bool)

(assert (=> d!87202 e!180452))

(declare-fun res!217755 () Bool)

(assert (=> d!87202 (=> (not res!217755) (not e!180452))))

(declare-fun lt!402142 () (_ BitVec 64))

(declare-fun lt!402146 () (_ BitVec 64))

(declare-fun lt!402145 () (_ BitVec 64))

(assert (=> d!87202 (= res!217755 (= lt!402146 (bvsub lt!402142 lt!402145)))))

(assert (=> d!87202 (or (= (bvand lt!402142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402145 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402142 lt!402145) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87202 (= lt!402145 (remainingBits!0 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))) ((_ sign_extend 32) (currentByte!12410 thiss!1754)) ((_ sign_extend 32) (currentBit!12405 thiss!1754))))))

(declare-fun lt!402144 () (_ BitVec 64))

(declare-fun lt!402143 () (_ BitVec 64))

(assert (=> d!87202 (= lt!402142 (bvmul lt!402144 lt!402143))))

(assert (=> d!87202 (or (= lt!402144 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402143 (bvsdiv (bvmul lt!402144 lt!402143) lt!402144)))))

(assert (=> d!87202 (= lt!402143 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87202 (= lt!402144 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))))))

(assert (=> d!87202 (= lt!402146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12410 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12405 thiss!1754))))))

(assert (=> d!87202 (invariant!0 (currentBit!12405 thiss!1754) (currentByte!12410 thiss!1754) (size!6226 (buf!6748 thiss!1754)))))

(assert (=> d!87202 (= (bitIndex!0 (size!6226 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754) (currentBit!12405 thiss!1754)) lt!402146)))

(declare-fun b!260012 () Bool)

(declare-fun res!217754 () Bool)

(assert (=> b!260012 (=> (not res!217754) (not e!180452))))

(assert (=> b!260012 (= res!217754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402146))))

(declare-fun b!260013 () Bool)

(declare-fun lt!402141 () (_ BitVec 64))

(assert (=> b!260013 (= e!180452 (bvsle lt!402146 (bvmul lt!402141 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260013 (or (= lt!402141 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402141 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402141)))))

(assert (=> b!260013 (= lt!402141 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))))))

(assert (= (and d!87202 res!217755) b!260012))

(assert (= (and b!260012 res!217754) b!260013))

(declare-fun m!389283 () Bool)

(assert (=> d!87202 m!389283))

(declare-fun m!389285 () Bool)

(assert (=> d!87202 m!389285))

(assert (=> b!259968 d!87202))

(declare-fun d!87204 () Bool)

(declare-fun e!180455 () Bool)

(assert (=> d!87204 e!180455))

(declare-fun res!217758 () Bool)

(assert (=> d!87204 (=> (not res!217758) (not e!180455))))

(assert (=> d!87204 (= res!217758 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402151 () Unit!18495)

(declare-fun choose!27 (BitStream!11374 BitStream!11374 (_ BitVec 64) (_ BitVec 64)) Unit!18495)

(assert (=> d!87204 (= lt!402151 (choose!27 thiss!1754 (_2!12082 lt!402091) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87204 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87204 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12082 lt!402091) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402151)))

(declare-fun b!260016 () Bool)

(assert (=> b!260016 (= e!180455 (validate_offset_bits!1 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402091)))) ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402091))) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402091))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87204 res!217758) b!260016))

(declare-fun m!389287 () Bool)

(assert (=> d!87204 m!389287))

(assert (=> b!260016 m!389231))

(assert (=> b!259968 d!87204))

(declare-fun d!87206 () Bool)

(assert (=> d!87206 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402091)))) ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402091))) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402091))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402091)))) ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402091))) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402091)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22089 () Bool)

(assert (= bs!22089 d!87206))

(declare-fun m!389289 () Bool)

(assert (=> bs!22089 m!389289))

(assert (=> b!259968 d!87206))

(declare-fun b!260078 () Bool)

(declare-fun e!180493 () tuple2!22292)

(declare-fun lt!402263 () tuple2!22292)

(assert (=> b!260078 (= e!180493 (tuple2!22293 false (_2!12082 lt!402263)))))

(declare-fun b!260079 () Bool)

(declare-fun e!180494 () Bool)

(declare-fun e!180490 () Bool)

(assert (=> b!260079 (= e!180494 e!180490)))

(declare-fun res!217799 () Bool)

(assert (=> b!260079 (=> res!217799 e!180490)))

(declare-fun lt!402262 () tuple2!22292)

(assert (=> b!260079 (= res!217799 (or (not (_1!12082 lt!402262)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!260080 () Bool)

(declare-fun e!180492 () tuple2!22292)

(assert (=> b!260080 (= e!180492 (tuple2!22293 true (_2!12082 lt!402091)))))

(declare-fun b!260081 () Bool)

(declare-fun lt!402259 () (_ BitVec 64))

(declare-fun e!180491 () Bool)

(assert (=> b!260081 (= e!180491 (= (bvsub lt!402259 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6226 (buf!6748 (_2!12082 lt!402262))) (currentByte!12410 (_2!12082 lt!402262)) (currentBit!12405 (_2!12082 lt!402262)))))))

(assert (=> b!260081 (or (= (bvand lt!402259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402259 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402258 () (_ BitVec 64))

(assert (=> b!260081 (= lt!402259 (bvadd lt!402258 nBits!535))))

(assert (=> b!260081 (or (not (= (bvand lt!402258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402258 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260081 (= lt!402258 (bitIndex!0 (size!6226 (buf!6748 (_2!12082 lt!402091))) (currentByte!12410 (_2!12082 lt!402091)) (currentBit!12405 (_2!12082 lt!402091))))))

(declare-fun b!260082 () Bool)

(declare-fun res!217797 () Bool)

(assert (=> b!260082 (=> (not res!217797) (not e!180494))))

(assert (=> b!260082 (= res!217797 e!180491)))

(declare-fun res!217798 () Bool)

(assert (=> b!260082 (=> res!217798 e!180491)))

(assert (=> b!260082 (= res!217798 (not (_1!12082 lt!402262)))))

(declare-fun b!260083 () Bool)

(assert (=> b!260083 (= e!180492 e!180493)))

(assert (=> b!260083 (= lt!402263 (readBit!0 (_2!12082 lt!402091)))))

(declare-fun c!11962 () Bool)

(assert (=> b!260083 (= c!11962 (not (= (_1!12082 lt!402263) expected!109)))))

(declare-fun lt!402260 () tuple2!22292)

(declare-fun b!260084 () Bool)

(assert (=> b!260084 (= lt!402260 (checkBitsLoop!0 (_2!12082 lt!402263) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402257 () Unit!18495)

(declare-fun lt!402253 () Unit!18495)

(assert (=> b!260084 (= lt!402257 lt!402253)))

(declare-fun lt!402261 () (_ BitVec 64))

(declare-fun lt!402254 () (_ BitVec 64))

(assert (=> b!260084 (validate_offset_bits!1 ((_ sign_extend 32) (size!6226 (buf!6748 (_2!12082 lt!402263)))) ((_ sign_extend 32) (currentByte!12410 (_2!12082 lt!402263))) ((_ sign_extend 32) (currentBit!12405 (_2!12082 lt!402263))) (bvsub lt!402261 lt!402254))))

(assert (=> b!260084 (= lt!402253 (validateOffsetBitsIneqLemma!0 (_2!12082 lt!402091) (_2!12082 lt!402263) lt!402261 lt!402254))))

(assert (=> b!260084 (= lt!402254 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260084 (= lt!402261 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!260084 (= e!180493 (tuple2!22293 (_1!12082 lt!402260) (_2!12082 lt!402260)))))

(declare-fun b!260086 () Bool)

(declare-datatypes ((tuple2!22300 0))(
  ( (tuple2!22301 (_1!12086 BitStream!11374) (_2!12086 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11374) tuple2!22300)

(assert (=> b!260086 (= e!180490 (= expected!109 (_2!12086 (readBitPure!0 (_2!12082 lt!402091)))))))

(declare-fun b!260085 () Bool)

(declare-fun res!217796 () Bool)

(assert (=> b!260085 (=> (not res!217796) (not e!180494))))

(assert (=> b!260085 (= res!217796 (and (= (buf!6748 (_2!12082 lt!402091)) (buf!6748 (_2!12082 lt!402262))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12082 lt!402262))))))

(declare-fun d!87208 () Bool)

(assert (=> d!87208 e!180494))

(declare-fun res!217800 () Bool)

(assert (=> d!87208 (=> (not res!217800) (not e!180494))))

(declare-fun lt!402256 () (_ BitVec 64))

(assert (=> d!87208 (= res!217800 (bvsge (bvsub lt!402256 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6226 (buf!6748 (_2!12082 lt!402262))) (currentByte!12410 (_2!12082 lt!402262)) (currentBit!12405 (_2!12082 lt!402262)))))))

(assert (=> d!87208 (or (= (bvand lt!402256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402256 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402255 () (_ BitVec 64))

(assert (=> d!87208 (= lt!402256 (bvadd lt!402255 nBits!535))))

(assert (=> d!87208 (or (not (= (bvand lt!402255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402255 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87208 (= lt!402255 (bitIndex!0 (size!6226 (buf!6748 (_2!12082 lt!402091))) (currentByte!12410 (_2!12082 lt!402091)) (currentBit!12405 (_2!12082 lt!402091))))))

(assert (=> d!87208 (= lt!402262 e!180492)))

(declare-fun c!11963 () Bool)

(assert (=> d!87208 (= c!11963 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87208 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87208 (= (checkBitsLoop!0 (_2!12082 lt!402091) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402262)))

(assert (= (and d!87208 c!11963) b!260080))

(assert (= (and d!87208 (not c!11963)) b!260083))

(assert (= (and b!260083 c!11962) b!260078))

(assert (= (and b!260083 (not c!11962)) b!260084))

(assert (= (and d!87208 res!217800) b!260085))

(assert (= (and b!260085 res!217796) b!260082))

(assert (= (and b!260082 (not res!217798)) b!260081))

(assert (= (and b!260082 res!217797) b!260079))

(assert (= (and b!260079 (not res!217799)) b!260086))

(declare-fun m!389305 () Bool)

(assert (=> b!260084 m!389305))

(declare-fun m!389307 () Bool)

(assert (=> b!260084 m!389307))

(declare-fun m!389309 () Bool)

(assert (=> b!260084 m!389309))

(declare-fun m!389311 () Bool)

(assert (=> b!260081 m!389311))

(declare-fun m!389313 () Bool)

(assert (=> b!260081 m!389313))

(declare-fun m!389315 () Bool)

(assert (=> b!260083 m!389315))

(declare-fun m!389317 () Bool)

(assert (=> b!260086 m!389317))

(assert (=> d!87208 m!389311))

(assert (=> d!87208 m!389313))

(assert (=> b!259968 d!87208))

(declare-fun d!87218 () Bool)

(assert (=> d!87218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))) ((_ sign_extend 32) (currentByte!12410 thiss!1754)) ((_ sign_extend 32) (currentBit!12405 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))) ((_ sign_extend 32) (currentByte!12410 thiss!1754)) ((_ sign_extend 32) (currentBit!12405 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22090 () Bool)

(assert (= bs!22090 d!87218))

(assert (=> bs!22090 m!389283))

(assert (=> b!259969 d!87218))

(declare-fun d!87220 () Bool)

(declare-fun e!180529 () Bool)

(assert (=> d!87220 e!180529))

(declare-fun res!217828 () Bool)

(assert (=> d!87220 (=> (not res!217828) (not e!180529))))

(declare-datatypes ((tuple2!22304 0))(
  ( (tuple2!22305 (_1!12088 Unit!18495) (_2!12088 BitStream!11374)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11374) tuple2!22304)

(assert (=> d!87220 (= res!217828 (= (buf!6748 (_2!12088 (increaseBitIndex!0 thiss!1754))) (buf!6748 thiss!1754)))))

(declare-fun lt!402317 () Bool)

(assert (=> d!87220 (= lt!402317 (not (= (bvand ((_ sign_extend 24) (select (arr!7213 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12405 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402321 () tuple2!22292)

(assert (=> d!87220 (= lt!402321 (tuple2!22293 (not (= (bvand ((_ sign_extend 24) (select (arr!7213 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12405 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12088 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87220 (validate_offset_bit!0 ((_ sign_extend 32) (size!6226 (buf!6748 thiss!1754))) ((_ sign_extend 32) (currentByte!12410 thiss!1754)) ((_ sign_extend 32) (currentBit!12405 thiss!1754)))))

(assert (=> d!87220 (= (readBit!0 thiss!1754) lt!402321)))

(declare-fun b!260122 () Bool)

(declare-fun lt!402320 () (_ BitVec 64))

(declare-fun lt!402318 () (_ BitVec 64))

(assert (=> b!260122 (= e!180529 (= (bitIndex!0 (size!6226 (buf!6748 (_2!12088 (increaseBitIndex!0 thiss!1754)))) (currentByte!12410 (_2!12088 (increaseBitIndex!0 thiss!1754))) (currentBit!12405 (_2!12088 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402318 lt!402320)))))

(assert (=> b!260122 (or (not (= (bvand lt!402318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402320 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402318 lt!402320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260122 (= lt!402320 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260122 (= lt!402318 (bitIndex!0 (size!6226 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754) (currentBit!12405 thiss!1754)))))

(declare-fun lt!402322 () Bool)

(assert (=> b!260122 (= lt!402322 (not (= (bvand ((_ sign_extend 24) (select (arr!7213 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12405 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402319 () Bool)

(assert (=> b!260122 (= lt!402319 (not (= (bvand ((_ sign_extend 24) (select (arr!7213 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12405 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402323 () Bool)

(assert (=> b!260122 (= lt!402323 (not (= (bvand ((_ sign_extend 24) (select (arr!7213 (buf!6748 thiss!1754)) (currentByte!12410 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12405 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87220 res!217828) b!260122))

(declare-fun m!389357 () Bool)

(assert (=> d!87220 m!389357))

(declare-fun m!389359 () Bool)

(assert (=> d!87220 m!389359))

(declare-fun m!389361 () Bool)

(assert (=> d!87220 m!389361))

(declare-fun m!389363 () Bool)

(assert (=> d!87220 m!389363))

(assert (=> b!260122 m!389225))

(declare-fun m!389365 () Bool)

(assert (=> b!260122 m!389365))

(assert (=> b!260122 m!389359))

(assert (=> b!260122 m!389357))

(assert (=> b!260122 m!389361))

(assert (=> b!259964 d!87220))

(declare-fun d!87240 () Bool)

(assert (=> d!87240 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12405 thiss!1754) (currentByte!12410 thiss!1754) (size!6226 (buf!6748 thiss!1754))))))

(declare-fun bs!22095 () Bool)

(assert (= bs!22095 d!87240))

(assert (=> bs!22095 m!389285))

(assert (=> start!55972 d!87240))

(push 1)

(assert (not d!87204))

(assert (not d!87220))

(assert (not b!260084))

(assert (not b!260081))

(assert (not d!87206))

(assert (not b!260016))

(assert (not b!260083))

(assert (not d!87240))

(assert (not b!260122))

(assert (not d!87202))

(assert (not b!260086))

(assert (not d!87196))

(assert (not d!87208))

(assert (not d!87218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

