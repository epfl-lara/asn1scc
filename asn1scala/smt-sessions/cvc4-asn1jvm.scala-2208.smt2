; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56024 () Bool)

(assert start!56024)

(declare-fun b!260185 () Bool)

(declare-fun res!217886 () Bool)

(declare-fun e!180589 () Bool)

(assert (=> b!260185 (=> (not res!217886) (not e!180589))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!260185 (= res!217886 (not (= from!526 nBits!535)))))

(declare-fun b!260186 () Bool)

(declare-fun e!180588 () Bool)

(declare-fun e!180586 () Bool)

(assert (=> b!260186 (= e!180588 (not e!180586))))

(declare-fun res!217885 () Bool)

(assert (=> b!260186 (=> (not res!217885) (not e!180586))))

(declare-datatypes ((array!14236 0))(
  ( (array!14237 (arr!7218 (Array (_ BitVec 32) (_ BitVec 8))) (size!6231 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11384 0))(
  ( (BitStream!11385 (buf!6753 array!14236) (currentByte!12421 (_ BitVec 32)) (currentBit!12416 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11384)

(declare-fun lt!402406 () (_ BitVec 64))

(declare-fun lt!402409 () (_ BitVec 64))

(declare-datatypes ((tuple2!22318 0))(
  ( (tuple2!22319 (_1!12095 Bool) (_2!12095 BitStream!11384)) )
))
(declare-fun lt!402407 () tuple2!22318)

(assert (=> b!260186 (= res!217885 (and (bvsge lt!402406 lt!402409) (= (buf!6753 thiss!1754) (buf!6753 (_2!12095 lt!402407))) (or (not (= nBits!535 from!526)) (_1!12095 lt!402407)) (or (not (_1!12095 lt!402407)) (= lt!402406 lt!402409))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260186 (= lt!402409 (bitIndex!0 (size!6231 (buf!6753 (_2!12095 lt!402407))) (currentByte!12421 (_2!12095 lt!402407)) (currentBit!12416 (_2!12095 lt!402407))))))

(assert (=> b!260186 (= lt!402406 (bvsub (bvadd (bitIndex!0 (size!6231 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754) (currentBit!12416 thiss!1754)) nBits!535) from!526))))

(declare-fun expected!109 () Bool)

(declare-fun lt!402410 () tuple2!22318)

(declare-fun checkBitsLoop!0 (BitStream!11384 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22318)

(assert (=> b!260186 (= lt!402407 (checkBitsLoop!0 (_2!12095 lt!402410) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260186 (validate_offset_bits!1 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402410)))) ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402410))) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402410))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18505 0))(
  ( (Unit!18506) )
))
(declare-fun lt!402408 () Unit!18505)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11384 BitStream!11384 (_ BitVec 64) (_ BitVec 64)) Unit!18505)

(assert (=> b!260186 (= lt!402408 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12095 lt!402410) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!260187 () Bool)

(declare-fun e!180587 () Bool)

(assert (=> b!260187 (= e!180586 e!180587)))

(declare-fun res!217887 () Bool)

(assert (=> b!260187 (=> res!217887 e!180587)))

(assert (=> b!260187 (= res!217887 (or (not (_1!12095 lt!402407)) (bvsge from!526 nBits!535)))))

(declare-fun b!260188 () Bool)

(declare-fun res!217883 () Bool)

(assert (=> b!260188 (=> (not res!217883) (not e!180589))))

(assert (=> b!260188 (= res!217883 (validate_offset_bits!1 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))) ((_ sign_extend 32) (currentByte!12421 thiss!1754)) ((_ sign_extend 32) (currentBit!12416 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!260190 () Bool)

(declare-datatypes ((tuple2!22320 0))(
  ( (tuple2!22321 (_1!12096 BitStream!11384) (_2!12096 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11384) tuple2!22320)

(assert (=> b!260190 (= e!180587 (= expected!109 (_2!12096 (readBitPure!0 thiss!1754))))))

(declare-fun b!260191 () Bool)

(declare-fun e!180585 () Bool)

(declare-fun array_inv!5972 (array!14236) Bool)

(assert (=> b!260191 (= e!180585 (array_inv!5972 (buf!6753 thiss!1754)))))

(declare-fun res!217884 () Bool)

(assert (=> start!56024 (=> (not res!217884) (not e!180589))))

(assert (=> start!56024 (= res!217884 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!56024 e!180589))

(assert (=> start!56024 true))

(declare-fun inv!12 (BitStream!11384) Bool)

(assert (=> start!56024 (and (inv!12 thiss!1754) e!180585)))

(declare-fun b!260189 () Bool)

(assert (=> b!260189 (= e!180589 e!180588)))

(declare-fun res!217888 () Bool)

(assert (=> b!260189 (=> (not res!217888) (not e!180588))))

(assert (=> b!260189 (= res!217888 (= (_1!12095 lt!402410) expected!109))))

(declare-fun readBit!0 (BitStream!11384) tuple2!22318)

(assert (=> b!260189 (= lt!402410 (readBit!0 thiss!1754))))

(assert (= (and start!56024 res!217884) b!260188))

(assert (= (and b!260188 res!217883) b!260185))

(assert (= (and b!260185 res!217886) b!260189))

(assert (= (and b!260189 res!217888) b!260186))

(assert (= (and b!260186 res!217885) b!260187))

(assert (= (and b!260187 (not res!217887)) b!260190))

(assert (= start!56024 b!260191))

(declare-fun m!389427 () Bool)

(assert (=> b!260191 m!389427))

(declare-fun m!389429 () Bool)

(assert (=> b!260190 m!389429))

(declare-fun m!389431 () Bool)

(assert (=> b!260189 m!389431))

(declare-fun m!389433 () Bool)

(assert (=> b!260186 m!389433))

(declare-fun m!389435 () Bool)

(assert (=> b!260186 m!389435))

(declare-fun m!389437 () Bool)

(assert (=> b!260186 m!389437))

(declare-fun m!389439 () Bool)

(assert (=> b!260186 m!389439))

(declare-fun m!389441 () Bool)

(assert (=> b!260186 m!389441))

(declare-fun m!389443 () Bool)

(assert (=> b!260188 m!389443))

(declare-fun m!389445 () Bool)

(assert (=> start!56024 m!389445))

(push 1)

(assert (not b!260186))

(assert (not b!260188))

(assert (not b!260190))

(assert (not b!260189))

(assert (not start!56024))

(assert (not b!260191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87274 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87274 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402410)))) ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402410))) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402410))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402410)))) ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402410))) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402410)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22106 () Bool)

(assert (= bs!22106 d!87274))

(declare-fun m!389471 () Bool)

(assert (=> bs!22106 m!389471))

(assert (=> b!260186 d!87274))

(declare-fun d!87276 () Bool)

(declare-fun e!180609 () Bool)

(assert (=> d!87276 e!180609))

(declare-fun res!217910 () Bool)

(assert (=> d!87276 (=> (not res!217910) (not e!180609))))

(declare-fun lt!402481 () (_ BitVec 64))

(declare-fun lt!402480 () (_ BitVec 64))

(declare-fun lt!402485 () (_ BitVec 64))

(assert (=> d!87276 (= res!217910 (= lt!402480 (bvsub lt!402485 lt!402481)))))

(assert (=> d!87276 (or (= (bvand lt!402485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402485 lt!402481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87276 (= lt!402481 (remainingBits!0 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))) ((_ sign_extend 32) (currentByte!12421 thiss!1754)) ((_ sign_extend 32) (currentBit!12416 thiss!1754))))))

(declare-fun lt!402482 () (_ BitVec 64))

(declare-fun lt!402484 () (_ BitVec 64))

(assert (=> d!87276 (= lt!402485 (bvmul lt!402482 lt!402484))))

(assert (=> d!87276 (or (= lt!402482 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402484 (bvsdiv (bvmul lt!402482 lt!402484) lt!402482)))))

(assert (=> d!87276 (= lt!402484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87276 (= lt!402482 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))))))

(assert (=> d!87276 (= lt!402480 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12421 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12416 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87276 (invariant!0 (currentBit!12416 thiss!1754) (currentByte!12421 thiss!1754) (size!6231 (buf!6753 thiss!1754)))))

(assert (=> d!87276 (= (bitIndex!0 (size!6231 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754) (currentBit!12416 thiss!1754)) lt!402480)))

(declare-fun b!260213 () Bool)

(declare-fun res!217911 () Bool)

(assert (=> b!260213 (=> (not res!217911) (not e!180609))))

(assert (=> b!260213 (= res!217911 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402480))))

(declare-fun b!260214 () Bool)

(declare-fun lt!402483 () (_ BitVec 64))

(assert (=> b!260214 (= e!180609 (bvsle lt!402480 (bvmul lt!402483 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260214 (or (= lt!402483 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402483 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402483)))))

(assert (=> b!260214 (= lt!402483 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))))))

(assert (= (and d!87276 res!217910) b!260213))

(assert (= (and b!260213 res!217911) b!260214))

(declare-fun m!389475 () Bool)

(assert (=> d!87276 m!389475))

(declare-fun m!389477 () Bool)

(assert (=> d!87276 m!389477))

(assert (=> b!260186 d!87276))

(declare-fun d!87280 () Bool)

(declare-fun e!180616 () Bool)

(assert (=> d!87280 e!180616))

(declare-fun res!217922 () Bool)

(assert (=> d!87280 (=> (not res!217922) (not e!180616))))

(assert (=> d!87280 (= res!217922 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402512 () Unit!18505)

(declare-fun choose!27 (BitStream!11384 BitStream!11384 (_ BitVec 64) (_ BitVec 64)) Unit!18505)

(assert (=> d!87280 (= lt!402512 (choose!27 thiss!1754 (_2!12095 lt!402410) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87280 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87280 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12095 lt!402410) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402512)))

(declare-fun b!260225 () Bool)

(assert (=> b!260225 (= e!180616 (validate_offset_bits!1 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402410)))) ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402410))) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402410))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87280 res!217922) b!260225))

(declare-fun m!389487 () Bool)

(assert (=> d!87280 m!389487))

(assert (=> b!260225 m!389433))

(assert (=> b!260186 d!87280))

(declare-fun d!87288 () Bool)

(declare-fun e!180617 () Bool)

(assert (=> d!87288 e!180617))

(declare-fun res!217923 () Bool)

(assert (=> d!87288 (=> (not res!217923) (not e!180617))))

(declare-fun lt!402514 () (_ BitVec 64))

(declare-fun lt!402518 () (_ BitVec 64))

(declare-fun lt!402513 () (_ BitVec 64))

(assert (=> d!87288 (= res!217923 (= lt!402513 (bvsub lt!402518 lt!402514)))))

(assert (=> d!87288 (or (= (bvand lt!402518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402518 lt!402514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87288 (= lt!402514 (remainingBits!0 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402407)))) ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402407))) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402407)))))))

(declare-fun lt!402515 () (_ BitVec 64))

(declare-fun lt!402517 () (_ BitVec 64))

(assert (=> d!87288 (= lt!402518 (bvmul lt!402515 lt!402517))))

(assert (=> d!87288 (or (= lt!402515 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402517 (bvsdiv (bvmul lt!402515 lt!402517) lt!402515)))))

(assert (=> d!87288 (= lt!402517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87288 (= lt!402515 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402407)))))))

(assert (=> d!87288 (= lt!402513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402407))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402407)))))))

(assert (=> d!87288 (invariant!0 (currentBit!12416 (_2!12095 lt!402407)) (currentByte!12421 (_2!12095 lt!402407)) (size!6231 (buf!6753 (_2!12095 lt!402407))))))

(assert (=> d!87288 (= (bitIndex!0 (size!6231 (buf!6753 (_2!12095 lt!402407))) (currentByte!12421 (_2!12095 lt!402407)) (currentBit!12416 (_2!12095 lt!402407))) lt!402513)))

(declare-fun b!260226 () Bool)

(declare-fun res!217924 () Bool)

(assert (=> b!260226 (=> (not res!217924) (not e!180617))))

(assert (=> b!260226 (= res!217924 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402513))))

(declare-fun b!260227 () Bool)

(declare-fun lt!402516 () (_ BitVec 64))

(assert (=> b!260227 (= e!180617 (bvsle lt!402513 (bvmul lt!402516 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260227 (or (= lt!402516 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402516 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402516)))))

(assert (=> b!260227 (= lt!402516 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402407)))))))

(assert (= (and d!87288 res!217923) b!260226))

(assert (= (and b!260226 res!217924) b!260227))

(declare-fun m!389489 () Bool)

(assert (=> d!87288 m!389489))

(declare-fun m!389491 () Bool)

(assert (=> d!87288 m!389491))

(assert (=> b!260186 d!87288))

(declare-fun b!260303 () Bool)

(declare-fun res!217968 () Bool)

(declare-fun e!180667 () Bool)

(assert (=> b!260303 (=> (not res!217968) (not e!180667))))

(declare-fun e!180669 () Bool)

(assert (=> b!260303 (= res!217968 e!180669)))

(declare-fun res!217970 () Bool)

(assert (=> b!260303 (=> res!217970 e!180669)))

(declare-fun lt!402636 () tuple2!22318)

(assert (=> b!260303 (= res!217970 (not (_1!12095 lt!402636)))))

(declare-fun b!260304 () Bool)

(declare-fun e!180668 () Bool)

(assert (=> b!260304 (= e!180668 (= expected!109 (_2!12096 (readBitPure!0 (_2!12095 lt!402410)))))))

(declare-fun b!260305 () Bool)

(declare-fun lt!402637 () (_ BitVec 64))

(assert (=> b!260305 (= e!180669 (= (bvsub lt!402637 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6231 (buf!6753 (_2!12095 lt!402636))) (currentByte!12421 (_2!12095 lt!402636)) (currentBit!12416 (_2!12095 lt!402636)))))))

(assert (=> b!260305 (or (= (bvand lt!402637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402637 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402628 () (_ BitVec 64))

(assert (=> b!260305 (= lt!402637 (bvadd lt!402628 nBits!535))))

(assert (=> b!260305 (or (not (= (bvand lt!402628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402628 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402628 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260305 (= lt!402628 (bitIndex!0 (size!6231 (buf!6753 (_2!12095 lt!402410))) (currentByte!12421 (_2!12095 lt!402410)) (currentBit!12416 (_2!12095 lt!402410))))))

(declare-fun b!260306 () Bool)

(declare-fun res!217971 () Bool)

(assert (=> b!260306 (=> (not res!217971) (not e!180667))))

(assert (=> b!260306 (= res!217971 (and (= (buf!6753 (_2!12095 lt!402410)) (buf!6753 (_2!12095 lt!402636))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12095 lt!402636))))))

(declare-fun b!260307 () Bool)

(assert (=> b!260307 (= e!180667 e!180668)))

(declare-fun res!217969 () Bool)

(assert (=> b!260307 (=> res!217969 e!180668)))

(assert (=> b!260307 (= res!217969 (or (not (_1!12095 lt!402636)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!260308 () Bool)

(declare-fun e!180666 () tuple2!22318)

(declare-fun lt!402635 () tuple2!22318)

(assert (=> b!260308 (= e!180666 (tuple2!22319 false (_2!12095 lt!402635)))))

(declare-fun b!260309 () Bool)

(declare-fun e!180665 () tuple2!22318)

(assert (=> b!260309 (= e!180665 (tuple2!22319 true (_2!12095 lt!402410)))))

(declare-fun b!260310 () Bool)

(assert (=> b!260310 (= e!180665 e!180666)))

(assert (=> b!260310 (= lt!402635 (readBit!0 (_2!12095 lt!402410)))))

(declare-fun c!11985 () Bool)

(assert (=> b!260310 (= c!11985 (not (= (_1!12095 lt!402635) expected!109)))))

(declare-fun d!87290 () Bool)

(assert (=> d!87290 e!180667))

(declare-fun res!217972 () Bool)

(assert (=> d!87290 (=> (not res!217972) (not e!180667))))

(declare-fun lt!402630 () (_ BitVec 64))

(assert (=> d!87290 (= res!217972 (bvsge (bvsub lt!402630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6231 (buf!6753 (_2!12095 lt!402636))) (currentByte!12421 (_2!12095 lt!402636)) (currentBit!12416 (_2!12095 lt!402636)))))))

(assert (=> d!87290 (or (= (bvand lt!402630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402630 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402630 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402631 () (_ BitVec 64))

(assert (=> d!87290 (= lt!402630 (bvadd lt!402631 nBits!535))))

(assert (=> d!87290 (or (not (= (bvand lt!402631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402631 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87290 (= lt!402631 (bitIndex!0 (size!6231 (buf!6753 (_2!12095 lt!402410))) (currentByte!12421 (_2!12095 lt!402410)) (currentBit!12416 (_2!12095 lt!402410))))))

(assert (=> d!87290 (= lt!402636 e!180665)))

(declare-fun c!11984 () Bool)

(assert (=> d!87290 (= c!11984 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87290 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87290 (= (checkBitsLoop!0 (_2!12095 lt!402410) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402636)))

(declare-fun b!260311 () Bool)

(declare-fun lt!402632 () tuple2!22318)

(assert (=> b!260311 (= lt!402632 (checkBitsLoop!0 (_2!12095 lt!402635) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402633 () Unit!18505)

(declare-fun lt!402638 () Unit!18505)

(assert (=> b!260311 (= lt!402633 lt!402638)))

(declare-fun lt!402634 () (_ BitVec 64))

(declare-fun lt!402629 () (_ BitVec 64))

(assert (=> b!260311 (validate_offset_bits!1 ((_ sign_extend 32) (size!6231 (buf!6753 (_2!12095 lt!402635)))) ((_ sign_extend 32) (currentByte!12421 (_2!12095 lt!402635))) ((_ sign_extend 32) (currentBit!12416 (_2!12095 lt!402635))) (bvsub lt!402634 lt!402629))))

(assert (=> b!260311 (= lt!402638 (validateOffsetBitsIneqLemma!0 (_2!12095 lt!402410) (_2!12095 lt!402635) lt!402634 lt!402629))))

(assert (=> b!260311 (= lt!402629 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260311 (= lt!402634 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!260311 (= e!180666 (tuple2!22319 (_1!12095 lt!402632) (_2!12095 lt!402632)))))

(assert (= (and d!87290 c!11984) b!260309))

(assert (= (and d!87290 (not c!11984)) b!260310))

(assert (= (and b!260310 c!11985) b!260308))

(assert (= (and b!260310 (not c!11985)) b!260311))

(assert (= (and d!87290 res!217972) b!260306))

(assert (= (and b!260306 res!217971) b!260303))

(assert (= (and b!260303 (not res!217970)) b!260305))

(assert (= (and b!260303 res!217968) b!260307))

(assert (= (and b!260307 (not res!217969)) b!260304))

(declare-fun m!389531 () Bool)

(assert (=> b!260304 m!389531))

(declare-fun m!389533 () Bool)

(assert (=> b!260310 m!389533))

(declare-fun m!389535 () Bool)

(assert (=> b!260305 m!389535))

(declare-fun m!389537 () Bool)

(assert (=> b!260305 m!389537))

(declare-fun m!389539 () Bool)

(assert (=> b!260311 m!389539))

(declare-fun m!389541 () Bool)

(assert (=> b!260311 m!389541))

(declare-fun m!389543 () Bool)

(assert (=> b!260311 m!389543))

(assert (=> d!87290 m!389535))

(assert (=> d!87290 m!389537))

(assert (=> b!260186 d!87290))

(declare-fun d!87300 () Bool)

(assert (=> d!87300 (= (array_inv!5972 (buf!6753 thiss!1754)) (bvsge (size!6231 (buf!6753 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!260191 d!87300))

(declare-fun d!87302 () Bool)

(declare-fun lt!402641 () tuple2!22318)

(assert (=> d!87302 (= lt!402641 (readBit!0 thiss!1754))))

(assert (=> d!87302 (= (readBitPure!0 thiss!1754) (tuple2!22321 (_2!12095 lt!402641) (_1!12095 lt!402641)))))

(declare-fun bs!22110 () Bool)

(assert (= bs!22110 d!87302))

(assert (=> bs!22110 m!389431))

(assert (=> b!260190 d!87302))

(declare-fun d!87304 () Bool)

(declare-fun e!180676 () Bool)

(assert (=> d!87304 e!180676))

(declare-fun res!217975 () Bool)

(assert (=> d!87304 (=> (not res!217975) (not e!180676))))

(declare-datatypes ((tuple2!22326 0))(
  ( (tuple2!22327 (_1!12099 Unit!18505) (_2!12099 BitStream!11384)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11384) tuple2!22326)

(assert (=> d!87304 (= res!217975 (= (buf!6753 (_2!12099 (increaseBitIndex!0 thiss!1754))) (buf!6753 thiss!1754)))))

(declare-fun lt!402660 () Bool)

(assert (=> d!87304 (= lt!402660 (not (= (bvand ((_ sign_extend 24) (select (arr!7218 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12416 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402658 () tuple2!22318)

(assert (=> d!87304 (= lt!402658 (tuple2!22319 (not (= (bvand ((_ sign_extend 24) (select (arr!7218 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12416 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12099 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87304 (validate_offset_bit!0 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))) ((_ sign_extend 32) (currentByte!12421 thiss!1754)) ((_ sign_extend 32) (currentBit!12416 thiss!1754)))))

(assert (=> d!87304 (= (readBit!0 thiss!1754) lt!402658)))

(declare-fun lt!402661 () (_ BitVec 64))

(declare-fun lt!402656 () (_ BitVec 64))

(declare-fun b!260314 () Bool)

(assert (=> b!260314 (= e!180676 (= (bitIndex!0 (size!6231 (buf!6753 (_2!12099 (increaseBitIndex!0 thiss!1754)))) (currentByte!12421 (_2!12099 (increaseBitIndex!0 thiss!1754))) (currentBit!12416 (_2!12099 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402656 lt!402661)))))

(assert (=> b!260314 (or (not (= (bvand lt!402656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402661 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402656 lt!402661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260314 (= lt!402661 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260314 (= lt!402656 (bitIndex!0 (size!6231 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754) (currentBit!12416 thiss!1754)))))

(declare-fun lt!402659 () Bool)

(assert (=> b!260314 (= lt!402659 (not (= (bvand ((_ sign_extend 24) (select (arr!7218 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12416 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402657 () Bool)

(assert (=> b!260314 (= lt!402657 (not (= (bvand ((_ sign_extend 24) (select (arr!7218 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12416 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402662 () Bool)

(assert (=> b!260314 (= lt!402662 (not (= (bvand ((_ sign_extend 24) (select (arr!7218 (buf!6753 thiss!1754)) (currentByte!12421 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12416 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87304 res!217975) b!260314))

(declare-fun m!389545 () Bool)

(assert (=> d!87304 m!389545))

(declare-fun m!389547 () Bool)

(assert (=> d!87304 m!389547))

(declare-fun m!389549 () Bool)

(assert (=> d!87304 m!389549))

(declare-fun m!389551 () Bool)

(assert (=> d!87304 m!389551))

(assert (=> b!260314 m!389435))

(assert (=> b!260314 m!389549))

(declare-fun m!389553 () Bool)

(assert (=> b!260314 m!389553))

(assert (=> b!260314 m!389547))

(assert (=> b!260314 m!389545))

(assert (=> b!260189 d!87304))

(declare-fun d!87306 () Bool)

(assert (=> d!87306 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12416 thiss!1754) (currentByte!12421 thiss!1754) (size!6231 (buf!6753 thiss!1754))))))

(declare-fun bs!22111 () Bool)

(assert (= bs!22111 d!87306))

(assert (=> bs!22111 m!389477))

(assert (=> start!56024 d!87306))

(declare-fun d!87308 () Bool)

(assert (=> d!87308 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))) ((_ sign_extend 32) (currentByte!12421 thiss!1754)) ((_ sign_extend 32) (currentBit!12416 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6231 (buf!6753 thiss!1754))) ((_ sign_extend 32) (currentByte!12421 thiss!1754)) ((_ sign_extend 32) (currentBit!12416 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22112 () Bool)

(assert (= bs!22112 d!87308))

(assert (=> bs!22112 m!389475))

(assert (=> b!260188 d!87308))

(push 1)

(assert (not b!260310))

(assert (not b!260314))

(assert (not b!260304))

(assert (not d!87304))

(assert (not d!87308))

(assert (not b!260311))

(assert (not d!87302))

(assert (not b!260225))

(assert (not d!87290))

(assert (not d!87280))

(assert (not d!87276))

(assert (not d!87288))

(assert (not d!87306))

(assert (not d!87274))

(assert (not b!260305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

