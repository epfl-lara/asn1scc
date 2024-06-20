; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55976 () Bool)

(assert start!55976)

(declare-fun b!260000 () Bool)

(declare-fun e!180446 () Bool)

(declare-datatypes ((array!14227 0))(
  ( (array!14228 (arr!7215 (Array (_ BitVec 32) (_ BitVec 8))) (size!6228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11378 0))(
  ( (BitStream!11379 (buf!6750 array!14227) (currentByte!12412 (_ BitVec 32)) (currentBit!12407 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11378)

(declare-fun array_inv!5969 (array!14227) Bool)

(assert (=> b!260000 (= e!180446 (array_inv!5969 (buf!6750 thiss!1754)))))

(declare-fun res!217747 () Bool)

(declare-fun e!180444 () Bool)

(assert (=> start!55976 (=> (not res!217747) (not e!180444))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55976 (= res!217747 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55976 e!180444))

(assert (=> start!55976 true))

(declare-fun inv!12 (BitStream!11378) Bool)

(assert (=> start!55976 (and (inv!12 thiss!1754) e!180446)))

(declare-fun b!260001 () Bool)

(declare-fun res!217745 () Bool)

(assert (=> b!260001 (=> (not res!217745) (not e!180444))))

(assert (=> b!260001 (= res!217745 (not (= from!526 nBits!535)))))

(declare-fun e!180448 () Bool)

(declare-fun lt!402119 () (_ BitVec 64))

(declare-datatypes ((tuple2!22296 0))(
  ( (tuple2!22297 (_1!12084 Bool) (_2!12084 BitStream!11378)) )
))
(declare-fun lt!402122 () tuple2!22296)

(declare-fun lt!402120 () (_ BitVec 64))

(declare-fun b!260002 () Bool)

(assert (=> b!260002 (= e!180448 (or (not (= (buf!6750 thiss!1754) (buf!6750 (_2!12084 lt!402122)))) (not (_1!12084 lt!402122)) (let ((bdg!16208 (bvand lt!402119 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!16208 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!16208 (bvand lt!402120 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!260003 () Bool)

(declare-fun e!180445 () Bool)

(assert (=> b!260003 (= e!180445 (not e!180448))))

(declare-fun res!217746 () Bool)

(assert (=> b!260003 (=> res!217746 e!180448)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!260003 (= res!217746 (bvslt lt!402120 (bitIndex!0 (size!6228 (buf!6750 (_2!12084 lt!402122))) (currentByte!12412 (_2!12084 lt!402122)) (currentBit!12407 (_2!12084 lt!402122)))))))

(assert (=> b!260003 (= lt!402120 (bvsub lt!402119 from!526))))

(assert (=> b!260003 (= lt!402119 (bvadd (bitIndex!0 (size!6228 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754) (currentBit!12407 thiss!1754)) nBits!535))))

(declare-fun expected!109 () Bool)

(declare-fun lt!402118 () tuple2!22296)

(declare-fun checkBitsLoop!0 (BitStream!11378 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22296)

(assert (=> b!260003 (= lt!402122 (checkBitsLoop!0 (_2!12084 lt!402118) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260003 (validate_offset_bits!1 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402118)))) ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402118))) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402118))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18499 0))(
  ( (Unit!18500) )
))
(declare-fun lt!402121 () Unit!18499)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11378 BitStream!11378 (_ BitVec 64) (_ BitVec 64)) Unit!18499)

(assert (=> b!260003 (= lt!402121 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12084 lt!402118) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!260004 () Bool)

(assert (=> b!260004 (= e!180444 e!180445)))

(declare-fun res!217744 () Bool)

(assert (=> b!260004 (=> (not res!217744) (not e!180445))))

(assert (=> b!260004 (= res!217744 (= (_1!12084 lt!402118) expected!109))))

(declare-fun readBit!0 (BitStream!11378) tuple2!22296)

(assert (=> b!260004 (= lt!402118 (readBit!0 thiss!1754))))

(declare-fun b!260005 () Bool)

(declare-fun res!217743 () Bool)

(assert (=> b!260005 (=> (not res!217743) (not e!180444))))

(assert (=> b!260005 (= res!217743 (validate_offset_bits!1 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))) ((_ sign_extend 32) (currentByte!12412 thiss!1754)) ((_ sign_extend 32) (currentBit!12407 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55976 res!217747) b!260005))

(assert (= (and b!260005 res!217743) b!260001))

(assert (= (and b!260001 res!217745) b!260004))

(assert (= (and b!260004 res!217744) b!260003))

(assert (= (and b!260003 (not res!217746)) b!260002))

(assert (= start!55976 b!260000))

(declare-fun m!389261 () Bool)

(assert (=> b!260004 m!389261))

(declare-fun m!389263 () Bool)

(assert (=> start!55976 m!389263))

(declare-fun m!389265 () Bool)

(assert (=> b!260003 m!389265))

(declare-fun m!389267 () Bool)

(assert (=> b!260003 m!389267))

(declare-fun m!389269 () Bool)

(assert (=> b!260003 m!389269))

(declare-fun m!389271 () Bool)

(assert (=> b!260003 m!389271))

(declare-fun m!389273 () Bool)

(assert (=> b!260003 m!389273))

(declare-fun m!389275 () Bool)

(assert (=> b!260005 m!389275))

(declare-fun m!389277 () Bool)

(assert (=> b!260000 m!389277))

(push 1)

(assert (not b!260003))

(assert (not b!260000))

(assert (not b!260005))

(assert (not start!55976))

(assert (not b!260004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87198 () Bool)

(declare-fun e!180460 () Bool)

(assert (=> d!87198 e!180460))

(declare-fun res!217768 () Bool)

(assert (=> d!87198 (=> (not res!217768) (not e!180460))))

(declare-fun lt!402179 () (_ BitVec 64))

(declare-fun lt!402178 () (_ BitVec 64))

(declare-fun lt!402175 () (_ BitVec 64))

(assert (=> d!87198 (= res!217768 (= lt!402175 (bvsub lt!402179 lt!402178)))))

(assert (=> d!87198 (or (= (bvand lt!402179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402178 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402179 lt!402178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87198 (= lt!402178 (remainingBits!0 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))) ((_ sign_extend 32) (currentByte!12412 thiss!1754)) ((_ sign_extend 32) (currentBit!12407 thiss!1754))))))

(declare-fun lt!402177 () (_ BitVec 64))

(declare-fun lt!402174 () (_ BitVec 64))

(assert (=> d!87198 (= lt!402179 (bvmul lt!402177 lt!402174))))

(assert (=> d!87198 (or (= lt!402177 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402174 (bvsdiv (bvmul lt!402177 lt!402174) lt!402177)))))

(assert (=> d!87198 (= lt!402174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87198 (= lt!402177 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))))))

(assert (=> d!87198 (= lt!402175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12412 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12407 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87198 (invariant!0 (currentBit!12407 thiss!1754) (currentByte!12412 thiss!1754) (size!6228 (buf!6750 thiss!1754)))))

(assert (=> d!87198 (= (bitIndex!0 (size!6228 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754) (currentBit!12407 thiss!1754)) lt!402175)))

(declare-fun b!260025 () Bool)

(declare-fun res!217767 () Bool)

(assert (=> b!260025 (=> (not res!217767) (not e!180460))))

(assert (=> b!260025 (= res!217767 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402175))))

(declare-fun b!260026 () Bool)

(declare-fun lt!402176 () (_ BitVec 64))

(assert (=> b!260026 (= e!180460 (bvsle lt!402175 (bvmul lt!402176 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260026 (or (= lt!402176 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402176 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402176)))))

(assert (=> b!260026 (= lt!402176 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))))))

(assert (= (and d!87198 res!217768) b!260025))

(assert (= (and b!260025 res!217767) b!260026))

(declare-fun m!389291 () Bool)

(assert (=> d!87198 m!389291))

(declare-fun m!389293 () Bool)

(assert (=> d!87198 m!389293))

(assert (=> b!260003 d!87198))

(declare-fun b!260087 () Bool)

(declare-fun e!180498 () Bool)

(declare-datatypes ((tuple2!22298 0))(
  ( (tuple2!22299 (_1!12085 BitStream!11378) (_2!12085 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11378) tuple2!22298)

(assert (=> b!260087 (= e!180498 (= expected!109 (_2!12085 (readBitPure!0 (_2!12084 lt!402118)))))))

(declare-fun d!87210 () Bool)

(declare-fun e!180500 () Bool)

(assert (=> d!87210 e!180500))

(declare-fun res!217803 () Bool)

(assert (=> d!87210 (=> (not res!217803) (not e!180500))))

(declare-fun lt!402271 () tuple2!22296)

(declare-fun lt!402275 () (_ BitVec 64))

(assert (=> d!87210 (= res!217803 (bvsge (bvsub lt!402275 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6228 (buf!6750 (_2!12084 lt!402271))) (currentByte!12412 (_2!12084 lt!402271)) (currentBit!12407 (_2!12084 lt!402271)))))))

(assert (=> d!87210 (or (= (bvand lt!402275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402275 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402268 () (_ BitVec 64))

(assert (=> d!87210 (= lt!402275 (bvadd lt!402268 nBits!535))))

(assert (=> d!87210 (or (not (= (bvand lt!402268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402268 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87210 (= lt!402268 (bitIndex!0 (size!6228 (buf!6750 (_2!12084 lt!402118))) (currentByte!12412 (_2!12084 lt!402118)) (currentBit!12407 (_2!12084 lt!402118))))))

(declare-fun e!180499 () tuple2!22296)

(assert (=> d!87210 (= lt!402271 e!180499)))

(declare-fun c!11964 () Bool)

(assert (=> d!87210 (= c!11964 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87210 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87210 (= (checkBitsLoop!0 (_2!12084 lt!402118) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!402271)))

(declare-fun b!260088 () Bool)

(assert (=> b!260088 (= e!180500 e!180498)))

(declare-fun res!217807 () Bool)

(assert (=> b!260088 (=> res!217807 e!180498)))

(assert (=> b!260088 (= res!217807 (or (not (_1!12084 lt!402271)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!260089 () Bool)

(declare-fun res!217806 () Bool)

(assert (=> b!260089 (=> (not res!217806) (not e!180500))))

(declare-fun e!180501 () Bool)

(assert (=> b!260089 (= res!217806 e!180501)))

(declare-fun res!217804 () Bool)

(assert (=> b!260089 (=> res!217804 e!180501)))

(assert (=> b!260089 (= res!217804 (not (_1!12084 lt!402271)))))

(declare-fun b!260090 () Bool)

(declare-fun lt!402272 () tuple2!22296)

(declare-fun lt!402273 () tuple2!22296)

(assert (=> b!260090 (= lt!402272 (checkBitsLoop!0 (_2!12084 lt!402273) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!402274 () Unit!18499)

(declare-fun lt!402276 () Unit!18499)

(assert (=> b!260090 (= lt!402274 lt!402276)))

(declare-fun lt!402269 () (_ BitVec 64))

(declare-fun lt!402278 () (_ BitVec 64))

(assert (=> b!260090 (validate_offset_bits!1 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402273)))) ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402273))) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402273))) (bvsub lt!402269 lt!402278))))

(assert (=> b!260090 (= lt!402276 (validateOffsetBitsIneqLemma!0 (_2!12084 lt!402118) (_2!12084 lt!402273) lt!402269 lt!402278))))

(assert (=> b!260090 (= lt!402278 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260090 (= lt!402269 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!180497 () tuple2!22296)

(assert (=> b!260090 (= e!180497 (tuple2!22297 (_1!12084 lt!402272) (_2!12084 lt!402272)))))

(declare-fun b!260091 () Bool)

(assert (=> b!260091 (= e!180499 e!180497)))

(assert (=> b!260091 (= lt!402273 (readBit!0 (_2!12084 lt!402118)))))

(declare-fun c!11965 () Bool)

(assert (=> b!260091 (= c!11965 (not (= (_1!12084 lt!402273) expected!109)))))

(declare-fun b!260092 () Bool)

(assert (=> b!260092 (= e!180497 (tuple2!22297 false (_2!12084 lt!402273)))))

(declare-fun b!260093 () Bool)

(assert (=> b!260093 (= e!180499 (tuple2!22297 true (_2!12084 lt!402118)))))

(declare-fun lt!402277 () (_ BitVec 64))

(declare-fun b!260094 () Bool)

(assert (=> b!260094 (= e!180501 (= (bvsub lt!402277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6228 (buf!6750 (_2!12084 lt!402271))) (currentByte!12412 (_2!12084 lt!402271)) (currentBit!12407 (_2!12084 lt!402271)))))))

(assert (=> b!260094 (or (= (bvand lt!402277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!402270 () (_ BitVec 64))

(assert (=> b!260094 (= lt!402277 (bvadd lt!402270 nBits!535))))

(assert (=> b!260094 (or (not (= (bvand lt!402270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402270 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260094 (= lt!402270 (bitIndex!0 (size!6228 (buf!6750 (_2!12084 lt!402118))) (currentByte!12412 (_2!12084 lt!402118)) (currentBit!12407 (_2!12084 lt!402118))))))

(declare-fun b!260095 () Bool)

(declare-fun res!217805 () Bool)

(assert (=> b!260095 (=> (not res!217805) (not e!180500))))

(assert (=> b!260095 (= res!217805 (and (= (buf!6750 (_2!12084 lt!402118)) (buf!6750 (_2!12084 lt!402271))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12084 lt!402271))))))

(assert (= (and d!87210 c!11964) b!260093))

(assert (= (and d!87210 (not c!11964)) b!260091))

(assert (= (and b!260091 c!11965) b!260092))

(assert (= (and b!260091 (not c!11965)) b!260090))

(assert (= (and d!87210 res!217803) b!260095))

(assert (= (and b!260095 res!217805) b!260089))

(assert (= (and b!260089 (not res!217804)) b!260094))

(assert (= (and b!260089 res!217806) b!260088))

(assert (= (and b!260088 (not res!217807)) b!260087))

(declare-fun m!389319 () Bool)

(assert (=> b!260090 m!389319))

(declare-fun m!389321 () Bool)

(assert (=> b!260090 m!389321))

(declare-fun m!389323 () Bool)

(assert (=> b!260090 m!389323))

(declare-fun m!389325 () Bool)

(assert (=> d!87210 m!389325))

(declare-fun m!389327 () Bool)

(assert (=> d!87210 m!389327))

(declare-fun m!389329 () Bool)

(assert (=> b!260091 m!389329))

(declare-fun m!389331 () Bool)

(assert (=> b!260087 m!389331))

(assert (=> b!260094 m!389325))

(assert (=> b!260094 m!389327))

(assert (=> b!260003 d!87210))

(declare-fun d!87222 () Bool)

(assert (=> d!87222 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402118)))) ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402118))) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402118))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402118)))) ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402118))) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402118)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22091 () Bool)

(assert (= bs!22091 d!87222))

(declare-fun m!389333 () Bool)

(assert (=> bs!22091 m!389333))

(assert (=> b!260003 d!87222))

(declare-fun d!87224 () Bool)

(declare-fun e!180513 () Bool)

(assert (=> d!87224 e!180513))

(declare-fun res!217823 () Bool)

(assert (=> d!87224 (=> (not res!217823) (not e!180513))))

(assert (=> d!87224 (= res!217823 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402296 () Unit!18499)

(declare-fun choose!27 (BitStream!11378 BitStream!11378 (_ BitVec 64) (_ BitVec 64)) Unit!18499)

(assert (=> d!87224 (= lt!402296 (choose!27 thiss!1754 (_2!12084 lt!402118) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87224 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87224 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12084 lt!402118) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!402296)))

(declare-fun b!260117 () Bool)

(assert (=> b!260117 (= e!180513 (validate_offset_bits!1 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402118)))) ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402118))) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402118))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87224 res!217823) b!260117))

(declare-fun m!389349 () Bool)

(assert (=> d!87224 m!389349))

(assert (=> b!260117 m!389271))

(assert (=> b!260003 d!87224))

(declare-fun d!87228 () Bool)

(declare-fun e!180514 () Bool)

(assert (=> d!87228 e!180514))

(declare-fun res!217825 () Bool)

(assert (=> d!87228 (=> (not res!217825) (not e!180514))))

(declare-fun lt!402298 () (_ BitVec 64))

(declare-fun lt!402302 () (_ BitVec 64))

(declare-fun lt!402301 () (_ BitVec 64))

(assert (=> d!87228 (= res!217825 (= lt!402298 (bvsub lt!402302 lt!402301)))))

(assert (=> d!87228 (or (= (bvand lt!402302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402301 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402302 lt!402301) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87228 (= lt!402301 (remainingBits!0 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402122)))) ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402122))) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402122)))))))

(declare-fun lt!402300 () (_ BitVec 64))

(declare-fun lt!402297 () (_ BitVec 64))

(assert (=> d!87228 (= lt!402302 (bvmul lt!402300 lt!402297))))

(assert (=> d!87228 (or (= lt!402300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!402297 (bvsdiv (bvmul lt!402300 lt!402297) lt!402300)))))

(assert (=> d!87228 (= lt!402297 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87228 (= lt!402300 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402122)))))))

(assert (=> d!87228 (= lt!402298 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12412 (_2!12084 lt!402122))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12407 (_2!12084 lt!402122)))))))

(assert (=> d!87228 (invariant!0 (currentBit!12407 (_2!12084 lt!402122)) (currentByte!12412 (_2!12084 lt!402122)) (size!6228 (buf!6750 (_2!12084 lt!402122))))))

(assert (=> d!87228 (= (bitIndex!0 (size!6228 (buf!6750 (_2!12084 lt!402122))) (currentByte!12412 (_2!12084 lt!402122)) (currentBit!12407 (_2!12084 lt!402122))) lt!402298)))

(declare-fun b!260118 () Bool)

(declare-fun res!217824 () Bool)

(assert (=> b!260118 (=> (not res!217824) (not e!180514))))

(assert (=> b!260118 (= res!217824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!402298))))

(declare-fun b!260119 () Bool)

(declare-fun lt!402299 () (_ BitVec 64))

(assert (=> b!260119 (= e!180514 (bvsle lt!402298 (bvmul lt!402299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!260119 (or (= lt!402299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!402299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!402299)))))

(assert (=> b!260119 (= lt!402299 ((_ sign_extend 32) (size!6228 (buf!6750 (_2!12084 lt!402122)))))))

(assert (= (and d!87228 res!217825) b!260118))

(assert (= (and b!260118 res!217824) b!260119))

(declare-fun m!389353 () Bool)

(assert (=> d!87228 m!389353))

(declare-fun m!389355 () Bool)

(assert (=> d!87228 m!389355))

(assert (=> b!260003 d!87228))

(declare-fun d!87232 () Bool)

(declare-fun e!180534 () Bool)

(assert (=> d!87232 e!180534))

(declare-fun res!217833 () Bool)

(assert (=> d!87232 (=> (not res!217833) (not e!180534))))

(declare-datatypes ((tuple2!22308 0))(
  ( (tuple2!22309 (_1!12090 Unit!18499) (_2!12090 BitStream!11378)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11378) tuple2!22308)

(assert (=> d!87232 (= res!217833 (= (buf!6750 (_2!12090 (increaseBitIndex!0 thiss!1754))) (buf!6750 thiss!1754)))))

(declare-fun lt!402356 () Bool)

(assert (=> d!87232 (= lt!402356 (not (= (bvand ((_ sign_extend 24) (select (arr!7215 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12407 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402357 () tuple2!22296)

(assert (=> d!87232 (= lt!402357 (tuple2!22297 (not (= (bvand ((_ sign_extend 24) (select (arr!7215 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12407 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12090 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87232 (validate_offset_bit!0 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))) ((_ sign_extend 32) (currentByte!12412 thiss!1754)) ((_ sign_extend 32) (currentBit!12407 thiss!1754)))))

(assert (=> d!87232 (= (readBit!0 thiss!1754) lt!402357)))

(declare-fun lt!402355 () (_ BitVec 64))

(declare-fun lt!402354 () (_ BitVec 64))

(declare-fun b!260127 () Bool)

(assert (=> b!260127 (= e!180534 (= (bitIndex!0 (size!6228 (buf!6750 (_2!12090 (increaseBitIndex!0 thiss!1754)))) (currentByte!12412 (_2!12090 (increaseBitIndex!0 thiss!1754))) (currentBit!12407 (_2!12090 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!402354 lt!402355)))))

(assert (=> b!260127 (or (not (= (bvand lt!402354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!402355 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!402354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!402354 lt!402355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260127 (= lt!402355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!260127 (= lt!402354 (bitIndex!0 (size!6228 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754) (currentBit!12407 thiss!1754)))))

(declare-fun lt!402358 () Bool)

(assert (=> b!260127 (= lt!402358 (not (= (bvand ((_ sign_extend 24) (select (arr!7215 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12407 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402353 () Bool)

(assert (=> b!260127 (= lt!402353 (not (= (bvand ((_ sign_extend 24) (select (arr!7215 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12407 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!402352 () Bool)

(assert (=> b!260127 (= lt!402352 (not (= (bvand ((_ sign_extend 24) (select (arr!7215 (buf!6750 thiss!1754)) (currentByte!12412 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12407 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87232 res!217833) b!260127))

(declare-fun m!389367 () Bool)

(assert (=> d!87232 m!389367))

(declare-fun m!389369 () Bool)

(assert (=> d!87232 m!389369))

(declare-fun m!389371 () Bool)

(assert (=> d!87232 m!389371))

(declare-fun m!389373 () Bool)

(assert (=> d!87232 m!389373))

(declare-fun m!389375 () Bool)

(assert (=> b!260127 m!389375))

(assert (=> b!260127 m!389371))

(assert (=> b!260127 m!389369))

(assert (=> b!260127 m!389267))

(assert (=> b!260127 m!389367))

(assert (=> b!260004 d!87232))

(declare-fun d!87242 () Bool)

(assert (=> d!87242 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))) ((_ sign_extend 32) (currentByte!12412 thiss!1754)) ((_ sign_extend 32) (currentBit!12407 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6228 (buf!6750 thiss!1754))) ((_ sign_extend 32) (currentByte!12412 thiss!1754)) ((_ sign_extend 32) (currentBit!12407 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22096 () Bool)

(assert (= bs!22096 d!87242))

(assert (=> bs!22096 m!389291))

(assert (=> b!260005 d!87242))

(declare-fun d!87244 () Bool)

(assert (=> d!87244 (= (array_inv!5969 (buf!6750 thiss!1754)) (bvsge (size!6228 (buf!6750 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!260000 d!87244))

(declare-fun d!87246 () Bool)

(assert (=> d!87246 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12407 thiss!1754) (currentByte!12412 thiss!1754) (size!6228 (buf!6750 thiss!1754))))))

(declare-fun bs!22097 () Bool)

(assert (= bs!22097 d!87246))

(assert (=> bs!22097 m!389293))

(assert (=> start!55976 d!87246))

(push 1)

(assert (not d!87246))

(assert (not b!260127))

(assert (not b!260090))

(assert (not b!260091))

(assert (not d!87222))

(assert (not d!87242))

(assert (not b!260087))

(assert (not d!87224))

(assert (not d!87232))

(assert (not d!87198))

(assert (not b!260094))

(assert (not d!87210))

(assert (not d!87228))

(assert (not b!260117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

