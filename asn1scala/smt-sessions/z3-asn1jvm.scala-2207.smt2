; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55974 () Bool)

(assert start!55974)

(declare-fun res!217731 () Bool)

(declare-fun e!180433 () Bool)

(assert (=> start!55974 (=> (not res!217731) (not e!180433))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55974 (= res!217731 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55974 e!180433))

(assert (=> start!55974 true))

(declare-datatypes ((array!14225 0))(
  ( (array!14226 (arr!7214 (Array (_ BitVec 32) (_ BitVec 8))) (size!6227 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11376 0))(
  ( (BitStream!11377 (buf!6749 array!14225) (currentByte!12411 (_ BitVec 32)) (currentBit!12406 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11376)

(declare-fun e!180432 () Bool)

(declare-fun inv!12 (BitStream!11376) Bool)

(assert (=> start!55974 (and (inv!12 thiss!1754) e!180432)))

(declare-fun b!259982 () Bool)

(declare-fun array_inv!5968 (array!14225) Bool)

(assert (=> b!259982 (= e!180432 (array_inv!5968 (buf!6749 thiss!1754)))))

(declare-fun b!259983 () Bool)

(declare-fun res!217732 () Bool)

(assert (=> b!259983 (=> (not res!217732) (not e!180433))))

(assert (=> b!259983 (= res!217732 (not (= from!526 nBits!535)))))

(declare-datatypes ((tuple2!22294 0))(
  ( (tuple2!22295 (_1!12083 Bool) (_2!12083 BitStream!11376)) )
))
(declare-fun lt!402106 () tuple2!22294)

(declare-fun lt!402107 () (_ BitVec 64))

(declare-fun lt!402105 () (_ BitVec 64))

(declare-fun b!259984 () Bool)

(declare-fun e!180431 () Bool)

(assert (=> b!259984 (= e!180431 (or (not (= (buf!6749 thiss!1754) (buf!6749 (_2!12083 lt!402106)))) (not (_1!12083 lt!402106)) (let ((bdg!16208 (bvand lt!402107 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!16208 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!16208 (bvand lt!402105 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!259985 () Bool)

(declare-fun res!217730 () Bool)

(assert (=> b!259985 (=> (not res!217730) (not e!180433))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259985 (= res!217730 (validate_offset_bits!1 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))) ((_ sign_extend 32) (currentByte!12411 thiss!1754)) ((_ sign_extend 32) (currentBit!12406 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259986 () Bool)

(declare-fun e!180429 () Bool)

(assert (=> b!259986 (= e!180433 e!180429)))

(declare-fun res!217729 () Bool)

(assert (=> b!259986 (=> (not res!217729) (not e!180429))))

(declare-fun lt!402104 () tuple2!22294)

(declare-fun expected!109 () Bool)

(assert (=> b!259986 (= res!217729 (= (_1!12083 lt!402104) expected!109))))

(declare-fun readBit!0 (BitStream!11376) tuple2!22294)

(assert (=> b!259986 (= lt!402104 (readBit!0 thiss!1754))))

(declare-fun b!259987 () Bool)

(assert (=> b!259987 (= e!180429 (not e!180431))))

(declare-fun res!217728 () Bool)

(assert (=> b!259987 (=> res!217728 e!180431)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259987 (= res!217728 (bvslt lt!402105 (bitIndex!0 (size!6227 (buf!6749 (_2!12083 lt!402106))) (currentByte!12411 (_2!12083 lt!402106)) (currentBit!12406 (_2!12083 lt!402106)))))))

(assert (=> b!259987 (= lt!402105 (bvsub lt!402107 from!526))))

(assert (=> b!259987 (= lt!402107 (bvadd (bitIndex!0 (size!6227 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754) (currentBit!12406 thiss!1754)) nBits!535))))

(declare-fun checkBitsLoop!0 (BitStream!11376 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22294)

(assert (=> b!259987 (= lt!402106 (checkBitsLoop!0 (_2!12083 lt!402104) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259987 (validate_offset_bits!1 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402104)))) ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402104))) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402104))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18497 0))(
  ( (Unit!18498) )
))
(declare-fun lt!402103 () Unit!18497)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11376 BitStream!11376 (_ BitVec 64) (_ BitVec 64)) Unit!18497)

(assert (=> b!259987 (= lt!402103 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12083 lt!402104) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!55974 res!217731) b!259985))

(assert (= (and b!259985 res!217730) b!259983))

(assert (= (and b!259983 res!217732) b!259986))

(assert (= (and b!259986 res!217729) b!259987))

(assert (= (and b!259987 (not res!217728)) b!259984))

(assert (= start!55974 b!259982))

(declare-fun m!389243 () Bool)

(assert (=> b!259986 m!389243))

(declare-fun m!389245 () Bool)

(assert (=> b!259982 m!389245))

(declare-fun m!389247 () Bool)

(assert (=> start!55974 m!389247))

(declare-fun m!389249 () Bool)

(assert (=> b!259987 m!389249))

(declare-fun m!389251 () Bool)

(assert (=> b!259987 m!389251))

(declare-fun m!389253 () Bool)

(assert (=> b!259987 m!389253))

(declare-fun m!389255 () Bool)

(assert (=> b!259987 m!389255))

(declare-fun m!389257 () Bool)

(assert (=> b!259987 m!389257))

(declare-fun m!389259 () Bool)

(assert (=> b!259985 m!389259))

(check-sat (not b!259982) (not b!259985) (not b!259986) (not b!259987) (not start!55974))
(check-sat)
(get-model)

(declare-fun d!87200 () Bool)

(declare-fun e!180461 () Bool)

(assert (=> d!87200 e!180461))

(declare-fun res!217770 () Bool)

(assert (=> d!87200 (=> (not res!217770) (not e!180461))))

(declare-fun lt!402180 () (_ BitVec 64))

(declare-fun lt!402182 () (_ BitVec 64))

(declare-fun lt!402181 () (_ BitVec 64))

(assert (=> d!87200 (= res!217770 (= lt!402181 (bvsub lt!402182 lt!402180)))))

(assert (=> d!87200 (or (= (bvand lt!402182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402182 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402182 lt!402180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87200 (= lt!402180 (remainingBits!0 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))) ((_ sign_extend 32) (currentByte!12411 thiss!1754)) ((_ sign_extend 32) (currentBit!12406 thiss!1754))))))

(declare-fun lt!402183 () (_ BitVec 64))

(declare-fun lt!402184 () (_ BitVec 64))

(assert (=> d!87200 (= lt!402182 (bvmul lt!402183 lt!402184))))

(assert (=> d!87200 (or (= lt!402183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402184 (bvsdiv (bvmul lt!402183 lt!402184) lt!402183)))))

(assert (=> d!87200 (= lt!402184 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87200 (= lt!402183 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))))))

(assert (=> d!87200 (= lt!402181 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12411 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12406 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87200 (invariant!0 (currentBit!12406 thiss!1754) (currentByte!12411 thiss!1754) (size!6227 (buf!6749 thiss!1754)))))

(assert (=> d!87200 (= (bitIndex!0 (size!6227 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754) (currentBit!12406 thiss!1754)) lt!402181)))

(declare-fun b!260027 () Bool)

(declare-fun res!217769 () Bool)

(assert (=> b!260027 (=> (not res!217769) (not e!180461))))

(assert (=> b!260027 (= res!217769 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402181))))

(declare-fun b!260028 () Bool)

(declare-fun lt!402185 () (_ BitVec 64))

(assert (=> b!260028 (= e!180461 (bvsle lt!402181 (bvmul lt!402185 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260028 (or (= lt!402185 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402185 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402185)))))

(assert (=> b!260028 (= lt!402185 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))))))

(assert (= (and d!87200 res!217770) b!260027))

(assert (= (and b!260027 res!217769) b!260028))

(declare-fun m!389295 () Bool)

(assert (=> d!87200 m!389295))

(declare-fun m!389297 () Bool)

(assert (=> d!87200 m!389297))

(assert (=> b!259987 d!87200))

(declare-fun d!87212 () Bool)

(declare-fun e!180464 () Bool)

(assert (=> d!87212 e!180464))

(declare-fun res!217773 () Bool)

(assert (=> d!87212 (=> (not res!217773) (not e!180464))))

(assert (=> d!87212 (= res!217773 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402188 () Unit!18497)

(declare-fun choose!27 (BitStream!11376 BitStream!11376 (_ BitVec 64) (_ BitVec 64)) Unit!18497)

(assert (=> d!87212 (= lt!402188 (choose!27 thiss!1754 (_2!12083 lt!402104) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87212 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87212 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12083 lt!402104) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402188)))

(declare-fun b!260031 () Bool)

(assert (=> b!260031 (= e!180464 (validate_offset_bits!1 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402104)))) ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402104))) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402104))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87212 res!217773) b!260031))

(declare-fun m!389299 () Bool)

(assert (=> d!87212 m!389299))

(assert (=> b!260031 m!389253))

(assert (=> b!259987 d!87212))

(declare-fun d!87214 () Bool)

(declare-fun e!180465 () Bool)

(assert (=> d!87214 e!180465))

(declare-fun res!217775 () Bool)

(assert (=> d!87214 (=> (not res!217775) (not e!180465))))

(declare-fun lt!402191 () (_ BitVec 64))

(declare-fun lt!402189 () (_ BitVec 64))

(declare-fun lt!402190 () (_ BitVec 64))

(assert (=> d!87214 (= res!217775 (= lt!402190 (bvsub lt!402191 lt!402189)))))

(assert (=> d!87214 (or (= (bvand lt!402191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402191 lt!402189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87214 (= lt!402189 (remainingBits!0 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402106)))) ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402106))) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402106)))))))

(declare-fun lt!402192 () (_ BitVec 64))

(declare-fun lt!402193 () (_ BitVec 64))

(assert (=> d!87214 (= lt!402191 (bvmul lt!402192 lt!402193))))

(assert (=> d!87214 (or (= lt!402192 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402193 (bvsdiv (bvmul lt!402192 lt!402193) lt!402192)))))

(assert (=> d!87214 (= lt!402193 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87214 (= lt!402192 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402106)))))))

(assert (=> d!87214 (= lt!402190 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402106))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402106)))))))

(assert (=> d!87214 (invariant!0 (currentBit!12406 (_2!12083 lt!402106)) (currentByte!12411 (_2!12083 lt!402106)) (size!6227 (buf!6749 (_2!12083 lt!402106))))))

(assert (=> d!87214 (= (bitIndex!0 (size!6227 (buf!6749 (_2!12083 lt!402106))) (currentByte!12411 (_2!12083 lt!402106)) (currentBit!12406 (_2!12083 lt!402106))) lt!402190)))

(declare-fun b!260032 () Bool)

(declare-fun res!217774 () Bool)

(assert (=> b!260032 (=> (not res!217774) (not e!180465))))

(assert (=> b!260032 (= res!217774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402190))))

(declare-fun b!260033 () Bool)

(declare-fun lt!402194 () (_ BitVec 64))

(assert (=> b!260033 (= e!180465 (bvsle lt!402190 (bvmul lt!402194 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260033 (or (= lt!402194 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402194 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402194)))))

(assert (=> b!260033 (= lt!402194 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402106)))))))

(assert (= (and d!87214 res!217775) b!260032))

(assert (= (and b!260032 res!217774) b!260033))

(declare-fun m!389301 () Bool)

(assert (=> d!87214 m!389301))

(declare-fun m!389303 () Bool)

(assert (=> d!87214 m!389303))

(assert (=> b!259987 d!87214))

(declare-fun b!260106 () Bool)

(declare-fun lt!402290 () tuple2!22294)

(declare-fun lt!402292 () tuple2!22294)

(assert (=> b!260106 (= lt!402292 (checkBitsLoop!0 (_2!12083 lt!402290) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402288 () Unit!18497)

(declare-fun lt!402286 () Unit!18497)

(assert (=> b!260106 (= lt!402288 lt!402286)))

(declare-fun lt!402283 () (_ BitVec 64))

(declare-fun lt!402287 () (_ BitVec 64))

(assert (=> b!260106 (validate_offset_bits!1 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402290)))) ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402290))) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402290))) (bvsub lt!402283 lt!402287))))

(assert (=> b!260106 (= lt!402286 (validateOffsetBitsIneqLemma!0 (_2!12083 lt!402104) (_2!12083 lt!402290) lt!402283 lt!402287))))

(assert (=> b!260106 (= lt!402287 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260106 (= lt!402283 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!180509 () tuple2!22294)

(assert (=> b!260106 (= e!180509 (tuple2!22295 (_1!12083 lt!402292) (_2!12083 lt!402292)))))

(declare-fun b!260107 () Bool)

(declare-fun e!180506 () Bool)

(declare-fun e!180508 () Bool)

(assert (=> b!260107 (= e!180506 e!180508)))

(declare-fun res!217820 () Bool)

(assert (=> b!260107 (=> res!217820 e!180508)))

(declare-fun lt!402289 () tuple2!22294)

(assert (=> b!260107 (= res!217820 (or (not (_1!12083 lt!402289)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!260109 () Bool)

(declare-fun res!217819 () Bool)

(assert (=> b!260109 (=> (not res!217819) (not e!180506))))

(assert (=> b!260109 (= res!217819 (and (= (buf!6749 (_2!12083 lt!402104)) (buf!6749 (_2!12083 lt!402289))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12083 lt!402289))))))

(declare-fun b!260110 () Bool)

(assert (=> b!260110 (= e!180509 (tuple2!22295 false (_2!12083 lt!402290)))))

(declare-fun b!260111 () Bool)

(declare-fun e!180510 () tuple2!22294)

(assert (=> b!260111 (= e!180510 (tuple2!22295 true (_2!12083 lt!402104)))))

(declare-fun b!260112 () Bool)

(declare-fun res!217818 () Bool)

(assert (=> b!260112 (=> (not res!217818) (not e!180506))))

(declare-fun e!180507 () Bool)

(assert (=> b!260112 (= res!217818 e!180507)))

(declare-fun res!217817 () Bool)

(assert (=> b!260112 (=> res!217817 e!180507)))

(assert (=> b!260112 (= res!217817 (not (_1!12083 lt!402289)))))

(declare-fun b!260108 () Bool)

(declare-datatypes ((tuple2!22302 0))(
  ( (tuple2!22303 (_1!12087 BitStream!11376) (_2!12087 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11376) tuple2!22302)

(assert (=> b!260108 (= e!180508 (= expected!109 (_2!12087 (readBitPure!0 (_2!12083 lt!402104)))))))

(declare-fun d!87216 () Bool)

(assert (=> d!87216 e!180506))

(declare-fun res!217816 () Bool)

(assert (=> d!87216 (=> (not res!217816) (not e!180506))))

(declare-fun lt!402293 () (_ BitVec 64))

(assert (=> d!87216 (= res!217816 (bvsge (bvsub lt!402293 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6227 (buf!6749 (_2!12083 lt!402289))) (currentByte!12411 (_2!12083 lt!402289)) (currentBit!12406 (_2!12083 lt!402289)))))))

(assert (=> d!87216 (or (= (bvand lt!402293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402293 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402285 () (_ BitVec 64))

(assert (=> d!87216 (= lt!402293 (bvadd lt!402285 nBits!535))))

(assert (=> d!87216 (or (not (= (bvand lt!402285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402285 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87216 (= lt!402285 (bitIndex!0 (size!6227 (buf!6749 (_2!12083 lt!402104))) (currentByte!12411 (_2!12083 lt!402104)) (currentBit!12406 (_2!12083 lt!402104))))))

(assert (=> d!87216 (= lt!402289 e!180510)))

(declare-fun c!11966 () Bool)

(assert (=> d!87216 (= c!11966 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87216 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87216 (= (checkBitsLoop!0 (_2!12083 lt!402104) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402289)))

(declare-fun lt!402284 () (_ BitVec 64))

(declare-fun b!260113 () Bool)

(assert (=> b!260113 (= e!180507 (= (bvsub lt!402284 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6227 (buf!6749 (_2!12083 lt!402289))) (currentByte!12411 (_2!12083 lt!402289)) (currentBit!12406 (_2!12083 lt!402289)))))))

(assert (=> b!260113 (or (= (bvand lt!402284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402284 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402291 () (_ BitVec 64))

(assert (=> b!260113 (= lt!402284 (bvadd lt!402291 nBits!535))))

(assert (=> b!260113 (or (not (= (bvand lt!402291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402291 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260113 (= lt!402291 (bitIndex!0 (size!6227 (buf!6749 (_2!12083 lt!402104))) (currentByte!12411 (_2!12083 lt!402104)) (currentBit!12406 (_2!12083 lt!402104))))))

(declare-fun b!260114 () Bool)

(assert (=> b!260114 (= e!180510 e!180509)))

(assert (=> b!260114 (= lt!402290 (readBit!0 (_2!12083 lt!402104)))))

(declare-fun c!11967 () Bool)

(assert (=> b!260114 (= c!11967 (not (= (_1!12083 lt!402290) expected!109)))))

(assert (= (and d!87216 c!11966) b!260111))

(assert (= (and d!87216 (not c!11966)) b!260114))

(assert (= (and b!260114 c!11967) b!260110))

(assert (= (and b!260114 (not c!11967)) b!260106))

(assert (= (and d!87216 res!217816) b!260109))

(assert (= (and b!260109 res!217819) b!260112))

(assert (= (and b!260112 (not res!217817)) b!260113))

(assert (= (and b!260112 res!217818) b!260107))

(assert (= (and b!260107 (not res!217820)) b!260108))

(declare-fun m!389335 () Bool)

(assert (=> b!260114 m!389335))

(declare-fun m!389337 () Bool)

(assert (=> d!87216 m!389337))

(declare-fun m!389339 () Bool)

(assert (=> d!87216 m!389339))

(assert (=> b!260113 m!389337))

(assert (=> b!260113 m!389339))

(declare-fun m!389341 () Bool)

(assert (=> b!260106 m!389341))

(declare-fun m!389343 () Bool)

(assert (=> b!260106 m!389343))

(declare-fun m!389345 () Bool)

(assert (=> b!260106 m!389345))

(declare-fun m!389347 () Bool)

(assert (=> b!260108 m!389347))

(assert (=> b!259987 d!87216))

(declare-fun d!87226 () Bool)

(assert (=> d!87226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402104)))) ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402104))) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402104))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6227 (buf!6749 (_2!12083 lt!402104)))) ((_ sign_extend 32) (currentByte!12411 (_2!12083 lt!402104))) ((_ sign_extend 32) (currentBit!12406 (_2!12083 lt!402104)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22092 () Bool)

(assert (= bs!22092 d!87226))

(declare-fun m!389351 () Bool)

(assert (=> bs!22092 m!389351))

(assert (=> b!259987 d!87226))

(declare-fun d!87230 () Bool)

(assert (=> d!87230 (= (array_inv!5968 (buf!6749 thiss!1754)) (bvsge (size!6227 (buf!6749 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259982 d!87230))

(declare-fun d!87234 () Bool)

(assert (=> d!87234 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12406 thiss!1754) (currentByte!12411 thiss!1754) (size!6227 (buf!6749 thiss!1754))))))

(declare-fun bs!22093 () Bool)

(assert (= bs!22093 d!87234))

(assert (=> bs!22093 m!389297))

(assert (=> start!55974 d!87234))

(declare-fun d!87236 () Bool)

(assert (=> d!87236 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))) ((_ sign_extend 32) (currentByte!12411 thiss!1754)) ((_ sign_extend 32) (currentBit!12406 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))) ((_ sign_extend 32) (currentByte!12411 thiss!1754)) ((_ sign_extend 32) (currentBit!12406 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22094 () Bool)

(assert (= bs!22094 d!87236))

(assert (=> bs!22094 m!389295))

(assert (=> b!259985 d!87236))

(declare-fun d!87238 () Bool)

(declare-fun e!180535 () Bool)

(assert (=> d!87238 e!180535))

(declare-fun res!217834 () Bool)

(assert (=> d!87238 (=> (not res!217834) (not e!180535))))

(declare-datatypes ((tuple2!22306 0))(
  ( (tuple2!22307 (_1!12089 Unit!18497) (_2!12089 BitStream!11376)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11376) tuple2!22306)

(assert (=> d!87238 (= res!217834 (= (buf!6749 (_2!12089 (increaseBitIndex!0 thiss!1754))) (buf!6749 thiss!1754)))))

(declare-fun lt!402363 () Bool)

(assert (=> d!87238 (= lt!402363 (not (= (bvand ((_ sign_extend 24) (select (arr!7214 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12406 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402365 () tuple2!22294)

(assert (=> d!87238 (= lt!402365 (tuple2!22295 (not (= (bvand ((_ sign_extend 24) (select (arr!7214 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12406 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12089 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87238 (validate_offset_bit!0 ((_ sign_extend 32) (size!6227 (buf!6749 thiss!1754))) ((_ sign_extend 32) (currentByte!12411 thiss!1754)) ((_ sign_extend 32) (currentBit!12406 thiss!1754)))))

(assert (=> d!87238 (= (readBit!0 thiss!1754) lt!402365)))

(declare-fun lt!402361 () (_ BitVec 64))

(declare-fun b!260128 () Bool)

(declare-fun lt!402362 () (_ BitVec 64))

(assert (=> b!260128 (= e!180535 (= (bitIndex!0 (size!6227 (buf!6749 (_2!12089 (increaseBitIndex!0 thiss!1754)))) (currentByte!12411 (_2!12089 (increaseBitIndex!0 thiss!1754))) (currentBit!12406 (_2!12089 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402361 lt!402362)))))

(assert (=> b!260128 (or (not (= (bvand lt!402361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402362 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402361 lt!402362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260128 (= lt!402362 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260128 (= lt!402361 (bitIndex!0 (size!6227 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754) (currentBit!12406 thiss!1754)))))

(declare-fun lt!402359 () Bool)

(assert (=> b!260128 (= lt!402359 (not (= (bvand ((_ sign_extend 24) (select (arr!7214 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12406 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402360 () Bool)

(assert (=> b!260128 (= lt!402360 (not (= (bvand ((_ sign_extend 24) (select (arr!7214 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12406 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402364 () Bool)

(assert (=> b!260128 (= lt!402364 (not (= (bvand ((_ sign_extend 24) (select (arr!7214 (buf!6749 thiss!1754)) (currentByte!12411 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12406 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87238 res!217834) b!260128))

(declare-fun m!389377 () Bool)

(assert (=> d!87238 m!389377))

(declare-fun m!389379 () Bool)

(assert (=> d!87238 m!389379))

(declare-fun m!389381 () Bool)

(assert (=> d!87238 m!389381))

(declare-fun m!389383 () Bool)

(assert (=> d!87238 m!389383))

(assert (=> b!260128 m!389249))

(assert (=> b!260128 m!389379))

(declare-fun m!389385 () Bool)

(assert (=> b!260128 m!389385))

(assert (=> b!260128 m!389377))

(assert (=> b!260128 m!389381))

(assert (=> b!259986 d!87238))

(check-sat (not d!87234) (not d!87236) (not d!87214) (not b!260128) (not d!87212) (not b!260106) (not d!87216) (not d!87200) (not b!260113) (not b!260114) (not d!87226) (not b!260108) (not b!260031) (not d!87238))
