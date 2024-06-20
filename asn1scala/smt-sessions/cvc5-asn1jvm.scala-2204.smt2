; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55828 () Bool)

(assert start!55828)

(declare-fun b!259461 () Bool)

(declare-fun e!180041 () Bool)

(declare-fun e!180043 () Bool)

(assert (=> b!259461 (= e!180041 e!180043)))

(declare-fun res!217346 () Bool)

(assert (=> b!259461 (=> (not res!217346) (not e!180043))))

(declare-datatypes ((array!14196 0))(
  ( (array!14197 (arr!7204 (Array (_ BitVec 32) (_ BitVec 8))) (size!6217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11356 0))(
  ( (BitStream!11357 (buf!6739 array!14196) (currentByte!12383 (_ BitVec 32)) (currentBit!12378 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22238 0))(
  ( (tuple2!22239 (_1!12055 Bool) (_2!12055 BitStream!11356)) )
))
(declare-fun lt!401264 () tuple2!22238)

(declare-fun expected!109 () Bool)

(assert (=> b!259461 (= res!217346 (= (_1!12055 lt!401264) expected!109))))

(declare-fun thiss!1754 () BitStream!11356)

(declare-fun readBit!0 (BitStream!11356) tuple2!22238)

(assert (=> b!259461 (= lt!401264 (readBit!0 thiss!1754))))

(declare-fun b!259462 () Bool)

(declare-fun e!180042 () Bool)

(declare-fun array_inv!5958 (array!14196) Bool)

(assert (=> b!259462 (= e!180042 (array_inv!5958 (buf!6739 thiss!1754)))))

(declare-fun b!259463 () Bool)

(declare-fun res!217345 () Bool)

(assert (=> b!259463 (=> (not res!217345) (not e!180041))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259463 (= res!217345 (validate_offset_bits!1 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))) ((_ sign_extend 32) (currentByte!12383 thiss!1754)) ((_ sign_extend 32) (currentBit!12378 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217347 () Bool)

(assert (=> start!55828 (=> (not res!217347) (not e!180041))))

(assert (=> start!55828 (= res!217347 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55828 e!180041))

(assert (=> start!55828 true))

(declare-fun inv!12 (BitStream!11356) Bool)

(assert (=> start!55828 (and (inv!12 thiss!1754) e!180042)))

(declare-fun lt!401261 () (_ BitVec 64))

(declare-fun b!259464 () Bool)

(declare-fun lt!401260 () (_ BitVec 64))

(assert (=> b!259464 (= e!180043 (not (or (not (= lt!401261 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!401261 (bvand (bvadd lt!401260 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259464 (= lt!401261 (bvand lt!401260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259464 (= lt!401260 (bitIndex!0 (size!6217 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754) (currentBit!12378 thiss!1754)))))

(declare-fun lt!401262 () tuple2!22238)

(declare-fun checkBitsLoop!0 (BitStream!11356 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22238)

(assert (=> b!259464 (= lt!401262 (checkBitsLoop!0 (_2!12055 lt!401264) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259464 (validate_offset_bits!1 ((_ sign_extend 32) (size!6217 (buf!6739 (_2!12055 lt!401264)))) ((_ sign_extend 32) (currentByte!12383 (_2!12055 lt!401264))) ((_ sign_extend 32) (currentBit!12378 (_2!12055 lt!401264))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18477 0))(
  ( (Unit!18478) )
))
(declare-fun lt!401263 () Unit!18477)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11356 BitStream!11356 (_ BitVec 64) (_ BitVec 64)) Unit!18477)

(assert (=> b!259464 (= lt!401263 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12055 lt!401264) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259465 () Bool)

(declare-fun res!217348 () Bool)

(assert (=> b!259465 (=> (not res!217348) (not e!180041))))

(assert (=> b!259465 (= res!217348 (not (= from!526 nBits!535)))))

(assert (= (and start!55828 res!217347) b!259463))

(assert (= (and b!259463 res!217345) b!259465))

(assert (= (and b!259465 res!217348) b!259461))

(assert (= (and b!259461 res!217346) b!259464))

(assert (= start!55828 b!259462))

(declare-fun m!388775 () Bool)

(assert (=> b!259463 m!388775))

(declare-fun m!388777 () Bool)

(assert (=> b!259464 m!388777))

(declare-fun m!388779 () Bool)

(assert (=> b!259464 m!388779))

(declare-fun m!388781 () Bool)

(assert (=> b!259464 m!388781))

(declare-fun m!388783 () Bool)

(assert (=> b!259464 m!388783))

(declare-fun m!388785 () Bool)

(assert (=> b!259461 m!388785))

(declare-fun m!388787 () Bool)

(assert (=> start!55828 m!388787))

(declare-fun m!388789 () Bool)

(assert (=> b!259462 m!388789))

(push 1)

(assert (not b!259464))

(assert (not start!55828))

(assert (not b!259463))

(assert (not b!259462))

(assert (not b!259461))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87038 () Bool)

(declare-fun e!180070 () Bool)

(assert (=> d!87038 e!180070))

(declare-fun res!217377 () Bool)

(assert (=> d!87038 (=> (not res!217377) (not e!180070))))

(declare-fun lt!401309 () (_ BitVec 64))

(declare-fun lt!401308 () (_ BitVec 64))

(declare-fun lt!401307 () (_ BitVec 64))

(assert (=> d!87038 (= res!217377 (= lt!401308 (bvsub lt!401309 lt!401307)))))

(assert (=> d!87038 (or (= (bvand lt!401309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401307 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401309 lt!401307) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87038 (= lt!401307 (remainingBits!0 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))) ((_ sign_extend 32) (currentByte!12383 thiss!1754)) ((_ sign_extend 32) (currentBit!12378 thiss!1754))))))

(declare-fun lt!401312 () (_ BitVec 64))

(declare-fun lt!401311 () (_ BitVec 64))

(assert (=> d!87038 (= lt!401309 (bvmul lt!401312 lt!401311))))

(assert (=> d!87038 (or (= lt!401312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401311 (bvsdiv (bvmul lt!401312 lt!401311) lt!401312)))))

(assert (=> d!87038 (= lt!401311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87038 (= lt!401312 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))))))

(assert (=> d!87038 (= lt!401308 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12383 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12378 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87038 (invariant!0 (currentBit!12378 thiss!1754) (currentByte!12383 thiss!1754) (size!6217 (buf!6739 thiss!1754)))))

(assert (=> d!87038 (= (bitIndex!0 (size!6217 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754) (currentBit!12378 thiss!1754)) lt!401308)))

(declare-fun b!259500 () Bool)

(declare-fun res!217378 () Bool)

(assert (=> b!259500 (=> (not res!217378) (not e!180070))))

(assert (=> b!259500 (= res!217378 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401308))))

(declare-fun b!259501 () Bool)

(declare-fun lt!401310 () (_ BitVec 64))

(assert (=> b!259501 (= e!180070 (bvsle lt!401308 (bvmul lt!401310 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259501 (or (= lt!401310 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401310 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401310)))))

(assert (=> b!259501 (= lt!401310 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))))))

(assert (= (and d!87038 res!217377) b!259500))

(assert (= (and b!259500 res!217378) b!259501))

(declare-fun m!388829 () Bool)

(assert (=> d!87038 m!388829))

(declare-fun m!388831 () Bool)

(assert (=> d!87038 m!388831))

(assert (=> b!259464 d!87038))

(declare-fun b!259538 () Bool)

(declare-fun res!217411 () Bool)

(declare-fun e!180101 () Bool)

(assert (=> b!259538 (=> (not res!217411) (not e!180101))))

(declare-fun lt!401418 () tuple2!22238)

(assert (=> b!259538 (= res!217411 (and (= (buf!6739 (_2!12055 lt!401264)) (buf!6739 (_2!12055 lt!401418))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12055 lt!401418))))))

(declare-fun b!259539 () Bool)

(declare-fun e!180104 () Bool)

(assert (=> b!259539 (= e!180101 e!180104)))

(declare-fun res!217407 () Bool)

(assert (=> b!259539 (=> res!217407 e!180104)))

(assert (=> b!259539 (= res!217407 (or (not (_1!12055 lt!401418)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259540 () Bool)

(declare-fun res!217408 () Bool)

(assert (=> b!259540 (=> (not res!217408) (not e!180101))))

(declare-fun e!180103 () Bool)

(assert (=> b!259540 (= res!217408 e!180103)))

(declare-fun res!217409 () Bool)

(assert (=> b!259540 (=> res!217409 e!180103)))

(assert (=> b!259540 (= res!217409 (not (_1!12055 lt!401418)))))

(declare-fun b!259541 () Bool)

(declare-fun e!180102 () tuple2!22238)

(declare-fun e!180105 () tuple2!22238)

(assert (=> b!259541 (= e!180102 e!180105)))

(declare-fun lt!401419 () tuple2!22238)

(assert (=> b!259541 (= lt!401419 (readBit!0 (_2!12055 lt!401264)))))

(declare-fun c!11901 () Bool)

(assert (=> b!259541 (= c!11901 (not (= (_1!12055 lt!401419) expected!109)))))

(declare-fun b!259542 () Bool)

(assert (=> b!259542 (= e!180105 (tuple2!22239 false (_2!12055 lt!401419)))))

(declare-fun b!259543 () Bool)

(declare-datatypes ((tuple2!22248 0))(
  ( (tuple2!22249 (_1!12060 BitStream!11356) (_2!12060 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11356) tuple2!22248)

(assert (=> b!259543 (= e!180104 (= expected!109 (_2!12060 (readBitPure!0 (_2!12055 lt!401264)))))))

(declare-fun lt!401420 () tuple2!22238)

(declare-fun b!259544 () Bool)

(assert (=> b!259544 (= lt!401420 (checkBitsLoop!0 (_2!12055 lt!401419) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401423 () Unit!18477)

(declare-fun lt!401413 () Unit!18477)

(assert (=> b!259544 (= lt!401423 lt!401413)))

(declare-fun lt!401416 () (_ BitVec 64))

(declare-fun lt!401415 () (_ BitVec 64))

(assert (=> b!259544 (validate_offset_bits!1 ((_ sign_extend 32) (size!6217 (buf!6739 (_2!12055 lt!401419)))) ((_ sign_extend 32) (currentByte!12383 (_2!12055 lt!401419))) ((_ sign_extend 32) (currentBit!12378 (_2!12055 lt!401419))) (bvsub lt!401416 lt!401415))))

(assert (=> b!259544 (= lt!401413 (validateOffsetBitsIneqLemma!0 (_2!12055 lt!401264) (_2!12055 lt!401419) lt!401416 lt!401415))))

(assert (=> b!259544 (= lt!401415 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259544 (= lt!401416 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259544 (= e!180105 (tuple2!22239 (_1!12055 lt!401420) (_2!12055 lt!401420)))))

(declare-fun b!259545 () Bool)

(assert (=> b!259545 (= e!180102 (tuple2!22239 true (_2!12055 lt!401264)))))

(declare-fun d!87054 () Bool)

(assert (=> d!87054 e!180101))

(declare-fun res!217410 () Bool)

(assert (=> d!87054 (=> (not res!217410) (not e!180101))))

(declare-fun lt!401421 () (_ BitVec 64))

(assert (=> d!87054 (= res!217410 (bvsge (bvsub lt!401421 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6217 (buf!6739 (_2!12055 lt!401418))) (currentByte!12383 (_2!12055 lt!401418)) (currentBit!12378 (_2!12055 lt!401418)))))))

(assert (=> d!87054 (or (= (bvand lt!401421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401421 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401417 () (_ BitVec 64))

(assert (=> d!87054 (= lt!401421 (bvadd lt!401417 nBits!535))))

(assert (=> d!87054 (or (not (= (bvand lt!401417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401417 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401417 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87054 (= lt!401417 (bitIndex!0 (size!6217 (buf!6739 (_2!12055 lt!401264))) (currentByte!12383 (_2!12055 lt!401264)) (currentBit!12378 (_2!12055 lt!401264))))))

(assert (=> d!87054 (= lt!401418 e!180102)))

(declare-fun c!11900 () Bool)

(assert (=> d!87054 (= c!11900 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87054 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87054 (= (checkBitsLoop!0 (_2!12055 lt!401264) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401418)))

(declare-fun lt!401422 () (_ BitVec 64))

(declare-fun b!259546 () Bool)

(assert (=> b!259546 (= e!180103 (= (bvsub lt!401422 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6217 (buf!6739 (_2!12055 lt!401418))) (currentByte!12383 (_2!12055 lt!401418)) (currentBit!12378 (_2!12055 lt!401418)))))))

(assert (=> b!259546 (or (= (bvand lt!401422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401422 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401422 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401414 () (_ BitVec 64))

(assert (=> b!259546 (= lt!401422 (bvadd lt!401414 nBits!535))))

(assert (=> b!259546 (or (not (= (bvand lt!401414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401414 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401414 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259546 (= lt!401414 (bitIndex!0 (size!6217 (buf!6739 (_2!12055 lt!401264))) (currentByte!12383 (_2!12055 lt!401264)) (currentBit!12378 (_2!12055 lt!401264))))))

(assert (= (and d!87054 c!11900) b!259545))

(assert (= (and d!87054 (not c!11900)) b!259541))

(assert (= (and b!259541 c!11901) b!259542))

(assert (= (and b!259541 (not c!11901)) b!259544))

(assert (= (and d!87054 res!217410) b!259538))

(assert (= (and b!259538 res!217411) b!259540))

(assert (= (and b!259540 (not res!217409)) b!259546))

(assert (= (and b!259540 res!217408) b!259539))

(assert (= (and b!259539 (not res!217407)) b!259543))

(declare-fun m!388855 () Bool)

(assert (=> b!259541 m!388855))

(declare-fun m!388857 () Bool)

(assert (=> b!259546 m!388857))

(declare-fun m!388859 () Bool)

(assert (=> b!259546 m!388859))

(declare-fun m!388861 () Bool)

(assert (=> b!259544 m!388861))

(declare-fun m!388863 () Bool)

(assert (=> b!259544 m!388863))

(declare-fun m!388865 () Bool)

(assert (=> b!259544 m!388865))

(assert (=> d!87054 m!388857))

(assert (=> d!87054 m!388859))

(declare-fun m!388867 () Bool)

(assert (=> b!259543 m!388867))

(assert (=> b!259464 d!87054))

(declare-fun d!87066 () Bool)

(assert (=> d!87066 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6217 (buf!6739 (_2!12055 lt!401264)))) ((_ sign_extend 32) (currentByte!12383 (_2!12055 lt!401264))) ((_ sign_extend 32) (currentBit!12378 (_2!12055 lt!401264))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6217 (buf!6739 (_2!12055 lt!401264)))) ((_ sign_extend 32) (currentByte!12383 (_2!12055 lt!401264))) ((_ sign_extend 32) (currentBit!12378 (_2!12055 lt!401264)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22057 () Bool)

(assert (= bs!22057 d!87066))

(declare-fun m!388869 () Bool)

(assert (=> bs!22057 m!388869))

(assert (=> b!259464 d!87066))

(declare-fun d!87068 () Bool)

(declare-fun e!180108 () Bool)

(assert (=> d!87068 e!180108))

(declare-fun res!217414 () Bool)

(assert (=> d!87068 (=> (not res!217414) (not e!180108))))

(assert (=> d!87068 (= res!217414 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401426 () Unit!18477)

(declare-fun choose!27 (BitStream!11356 BitStream!11356 (_ BitVec 64) (_ BitVec 64)) Unit!18477)

(assert (=> d!87068 (= lt!401426 (choose!27 thiss!1754 (_2!12055 lt!401264) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87068 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12055 lt!401264) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401426)))

(declare-fun b!259549 () Bool)

(assert (=> b!259549 (= e!180108 (validate_offset_bits!1 ((_ sign_extend 32) (size!6217 (buf!6739 (_2!12055 lt!401264)))) ((_ sign_extend 32) (currentByte!12383 (_2!12055 lt!401264))) ((_ sign_extend 32) (currentBit!12378 (_2!12055 lt!401264))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87068 res!217414) b!259549))

(declare-fun m!388871 () Bool)

(assert (=> d!87068 m!388871))

(assert (=> b!259549 m!388781))

(assert (=> b!259464 d!87068))

(declare-fun d!87070 () Bool)

(assert (=> d!87070 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12378 thiss!1754) (currentByte!12383 thiss!1754) (size!6217 (buf!6739 thiss!1754))))))

(declare-fun bs!22058 () Bool)

(assert (= bs!22058 d!87070))

(assert (=> bs!22058 m!388831))

(assert (=> start!55828 d!87070))

(declare-fun d!87072 () Bool)

(assert (=> d!87072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))) ((_ sign_extend 32) (currentByte!12383 thiss!1754)) ((_ sign_extend 32) (currentBit!12378 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))) ((_ sign_extend 32) (currentByte!12383 thiss!1754)) ((_ sign_extend 32) (currentBit!12378 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22059 () Bool)

(assert (= bs!22059 d!87072))

(assert (=> bs!22059 m!388829))

(assert (=> b!259463 d!87072))

(declare-fun d!87074 () Bool)

(assert (=> d!87074 (= (array_inv!5958 (buf!6739 thiss!1754)) (bvsge (size!6217 (buf!6739 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259462 d!87074))

(declare-fun d!87076 () Bool)

(declare-fun e!180140 () Bool)

(assert (=> d!87076 e!180140))

(declare-fun res!217442 () Bool)

(assert (=> d!87076 (=> (not res!217442) (not e!180140))))

(declare-datatypes ((tuple2!22252 0))(
  ( (tuple2!22253 (_1!12062 Unit!18477) (_2!12062 BitStream!11356)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11356) tuple2!22252)

(assert (=> d!87076 (= res!217442 (= (buf!6739 (_2!12062 (increaseBitIndex!0 thiss!1754))) (buf!6739 thiss!1754)))))

(declare-fun lt!401497 () Bool)

(assert (=> d!87076 (= lt!401497 (not (= (bvand ((_ sign_extend 24) (select (arr!7204 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12378 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401498 () tuple2!22238)

(assert (=> d!87076 (= lt!401498 (tuple2!22239 (not (= (bvand ((_ sign_extend 24) (select (arr!7204 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12378 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12062 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87076 (validate_offset_bit!0 ((_ sign_extend 32) (size!6217 (buf!6739 thiss!1754))) ((_ sign_extend 32) (currentByte!12383 thiss!1754)) ((_ sign_extend 32) (currentBit!12378 thiss!1754)))))

(assert (=> d!87076 (= (readBit!0 thiss!1754) lt!401498)))

(declare-fun lt!401501 () (_ BitVec 64))

(declare-fun lt!401502 () (_ BitVec 64))

(declare-fun b!259597 () Bool)

(assert (=> b!259597 (= e!180140 (= (bitIndex!0 (size!6217 (buf!6739 (_2!12062 (increaseBitIndex!0 thiss!1754)))) (currentByte!12383 (_2!12062 (increaseBitIndex!0 thiss!1754))) (currentBit!12378 (_2!12062 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401501 lt!401502)))))

(assert (=> b!259597 (or (not (= (bvand lt!401501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401502 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401501 lt!401502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259597 (= lt!401502 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259597 (= lt!401501 (bitIndex!0 (size!6217 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754) (currentBit!12378 thiss!1754)))))

(declare-fun lt!401500 () Bool)

(assert (=> b!259597 (= lt!401500 (not (= (bvand ((_ sign_extend 24) (select (arr!7204 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12378 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401496 () Bool)

(assert (=> b!259597 (= lt!401496 (not (= (bvand ((_ sign_extend 24) (select (arr!7204 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12378 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401499 () Bool)

(assert (=> b!259597 (= lt!401499 (not (= (bvand ((_ sign_extend 24) (select (arr!7204 (buf!6739 thiss!1754)) (currentByte!12383 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12378 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87076 res!217442) b!259597))

(declare-fun m!388889 () Bool)

(assert (=> d!87076 m!388889))

(declare-fun m!388891 () Bool)

(assert (=> d!87076 m!388891))

(declare-fun m!388893 () Bool)

(assert (=> d!87076 m!388893))

(declare-fun m!388895 () Bool)

(assert (=> d!87076 m!388895))

(assert (=> b!259597 m!388891))

(assert (=> b!259597 m!388777))

(declare-fun m!388897 () Bool)

(assert (=> b!259597 m!388897))

(assert (=> b!259597 m!388889))

(assert (=> b!259597 m!388893))

(assert (=> b!259461 d!87076))

(push 1)

(assert (not d!87066))

(assert (not b!259549))

(assert (not b!259544))

(assert (not d!87038))

(assert (not b!259597))

(assert (not b!259541))

(assert (not d!87072))

(assert (not b!259543))

(assert (not d!87070))

(assert (not d!87068))

(assert (not d!87054))

(assert (not b!259546))

(assert (not d!87076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

