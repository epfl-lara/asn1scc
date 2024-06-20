; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55314 () Bool)

(assert start!55314)

(declare-fun b!257998 () Bool)

(declare-fun e!178933 () Bool)

(declare-datatypes ((array!14036 0))(
  ( (array!14037 (arr!7142 (Array (_ BitVec 32) (_ BitVec 8))) (size!6155 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11232 0))(
  ( (BitStream!11233 (buf!6677 array!14036) (currentByte!12243 (_ BitVec 32)) (currentBit!12238 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11232)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257998 (= e!178933 (invariant!0 (currentBit!12238 thiss!1754) (currentByte!12243 thiss!1754) (size!6155 (buf!6677 thiss!1754))))))

(declare-fun res!216181 () Bool)

(declare-fun e!178932 () Bool)

(assert (=> start!55314 (=> (not res!216181) (not e!178932))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55314 (= res!216181 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55314 e!178932))

(assert (=> start!55314 true))

(declare-fun e!178929 () Bool)

(declare-fun inv!12 (BitStream!11232) Bool)

(assert (=> start!55314 (and (inv!12 thiss!1754) e!178929)))

(declare-fun b!257999 () Bool)

(declare-fun array_inv!5896 (array!14036) Bool)

(assert (=> b!257999 (= e!178929 (array_inv!5896 (buf!6677 thiss!1754)))))

(declare-fun b!258000 () Bool)

(declare-fun res!216180 () Bool)

(assert (=> b!258000 (=> res!216180 e!178933)))

(declare-datatypes ((tuple2!22084 0))(
  ( (tuple2!22085 (_1!11978 Bool) (_2!11978 BitStream!11232)) )
))
(declare-fun lt!399412 () tuple2!22084)

(assert (=> b!258000 (= res!216180 (or (not (= (buf!6677 thiss!1754) (buf!6677 (_2!11978 lt!399412)))) (not (_1!11978 lt!399412))))))

(declare-fun b!258001 () Bool)

(declare-fun e!178930 () Bool)

(assert (=> b!258001 (= e!178930 (not e!178933))))

(declare-fun res!216178 () Bool)

(assert (=> b!258001 (=> res!216178 e!178933)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258001 (= res!216178 (bvslt (bvsub (bvadd (bitIndex!0 (size!6155 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754) (currentBit!12238 thiss!1754)) nBits!535) from!526) (bitIndex!0 (size!6155 (buf!6677 (_2!11978 lt!399412))) (currentByte!12243 (_2!11978 lt!399412)) (currentBit!12238 (_2!11978 lt!399412)))))))

(declare-fun expected!109 () Bool)

(declare-fun lt!399411 () tuple2!22084)

(declare-fun checkBitsLoop!0 (BitStream!11232 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22084)

(assert (=> b!258001 (= lt!399412 (checkBitsLoop!0 (_2!11978 lt!399411) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258001 (validate_offset_bits!1 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399411)))) ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399411))) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399411))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18419 0))(
  ( (Unit!18420) )
))
(declare-fun lt!399413 () Unit!18419)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11232 BitStream!11232 (_ BitVec 64) (_ BitVec 64)) Unit!18419)

(assert (=> b!258001 (= lt!399413 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11978 lt!399411) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258002 () Bool)

(declare-fun res!216176 () Bool)

(assert (=> b!258002 (=> (not res!216176) (not e!178932))))

(assert (=> b!258002 (= res!216176 (not (= from!526 nBits!535)))))

(declare-fun b!258003 () Bool)

(declare-fun res!216177 () Bool)

(assert (=> b!258003 (=> (not res!216177) (not e!178932))))

(assert (=> b!258003 (= res!216177 (validate_offset_bits!1 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))) ((_ sign_extend 32) (currentByte!12243 thiss!1754)) ((_ sign_extend 32) (currentBit!12238 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258004 () Bool)

(assert (=> b!258004 (= e!178932 e!178930)))

(declare-fun res!216179 () Bool)

(assert (=> b!258004 (=> (not res!216179) (not e!178930))))

(assert (=> b!258004 (= res!216179 (= (_1!11978 lt!399411) expected!109))))

(declare-fun readBit!0 (BitStream!11232) tuple2!22084)

(assert (=> b!258004 (= lt!399411 (readBit!0 thiss!1754))))

(assert (= (and start!55314 res!216181) b!258003))

(assert (= (and b!258003 res!216177) b!258002))

(assert (= (and b!258002 res!216176) b!258004))

(assert (= (and b!258004 res!216179) b!258001))

(assert (= (and b!258001 (not res!216178)) b!258000))

(assert (= (and b!258000 (not res!216180)) b!257998))

(assert (= start!55314 b!257999))

(declare-fun m!387511 () Bool)

(assert (=> b!257999 m!387511))

(declare-fun m!387513 () Bool)

(assert (=> b!258001 m!387513))

(declare-fun m!387515 () Bool)

(assert (=> b!258001 m!387515))

(declare-fun m!387517 () Bool)

(assert (=> b!258001 m!387517))

(declare-fun m!387519 () Bool)

(assert (=> b!258001 m!387519))

(declare-fun m!387521 () Bool)

(assert (=> b!258001 m!387521))

(declare-fun m!387523 () Bool)

(assert (=> b!257998 m!387523))

(declare-fun m!387525 () Bool)

(assert (=> b!258003 m!387525))

(declare-fun m!387527 () Bool)

(assert (=> b!258004 m!387527))

(declare-fun m!387529 () Bool)

(assert (=> start!55314 m!387529))

(check-sat (not start!55314) (not b!258004) (not b!258003) (not b!257998) (not b!258001) (not b!257999))
(check-sat)
(get-model)

(declare-fun d!86562 () Bool)

(assert (=> d!86562 (= (invariant!0 (currentBit!12238 thiss!1754) (currentByte!12243 thiss!1754) (size!6155 (buf!6677 thiss!1754))) (and (bvsge (currentBit!12238 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12238 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12243 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12243 thiss!1754) (size!6155 (buf!6677 thiss!1754))) (and (= (currentBit!12238 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12243 thiss!1754) (size!6155 (buf!6677 thiss!1754)))))))))

(assert (=> b!257998 d!86562))

(declare-fun d!86564 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86564 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))) ((_ sign_extend 32) (currentByte!12243 thiss!1754)) ((_ sign_extend 32) (currentBit!12238 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))) ((_ sign_extend 32) (currentByte!12243 thiss!1754)) ((_ sign_extend 32) (currentBit!12238 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21903 () Bool)

(assert (= bs!21903 d!86564))

(declare-fun m!387551 () Bool)

(assert (=> bs!21903 m!387551))

(assert (=> b!258003 d!86564))

(declare-fun b!258049 () Bool)

(declare-fun res!216215 () Bool)

(declare-fun e!178975 () Bool)

(assert (=> b!258049 (=> (not res!216215) (not e!178975))))

(declare-fun e!178973 () Bool)

(assert (=> b!258049 (= res!216215 e!178973)))

(declare-fun res!216219 () Bool)

(assert (=> b!258049 (=> res!216219 e!178973)))

(declare-fun lt!399481 () tuple2!22084)

(assert (=> b!258049 (= res!216219 (not (_1!11978 lt!399481)))))

(declare-fun b!258050 () Bool)

(declare-fun e!178972 () Bool)

(assert (=> b!258050 (= e!178975 e!178972)))

(declare-fun res!216217 () Bool)

(assert (=> b!258050 (=> res!216217 e!178972)))

(assert (=> b!258050 (= res!216217 (or (not (_1!11978 lt!399481)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258051 () Bool)

(declare-fun e!178974 () tuple2!22084)

(declare-fun e!178976 () tuple2!22084)

(assert (=> b!258051 (= e!178974 e!178976)))

(declare-fun lt!399489 () tuple2!22084)

(assert (=> b!258051 (= lt!399489 (readBit!0 (_2!11978 lt!399411)))))

(declare-fun c!11846 () Bool)

(assert (=> b!258051 (= c!11846 (not (= (_1!11978 lt!399489) expected!109)))))

(declare-fun b!258052 () Bool)

(declare-fun res!216218 () Bool)

(assert (=> b!258052 (=> (not res!216218) (not e!178975))))

(assert (=> b!258052 (= res!216218 (and (= (buf!6677 (_2!11978 lt!399411)) (buf!6677 (_2!11978 lt!399481))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11978 lt!399481))))))

(declare-fun b!258054 () Bool)

(declare-fun lt!399490 () (_ BitVec 64))

(assert (=> b!258054 (= e!178973 (= (bvsub lt!399490 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6155 (buf!6677 (_2!11978 lt!399481))) (currentByte!12243 (_2!11978 lt!399481)) (currentBit!12238 (_2!11978 lt!399481)))))))

(assert (=> b!258054 (or (= (bvand lt!399490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399490 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399484 () (_ BitVec 64))

(assert (=> b!258054 (= lt!399490 (bvadd lt!399484 nBits!535))))

(assert (=> b!258054 (or (not (= (bvand lt!399484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399484 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258054 (= lt!399484 (bitIndex!0 (size!6155 (buf!6677 (_2!11978 lt!399411))) (currentByte!12243 (_2!11978 lt!399411)) (currentBit!12238 (_2!11978 lt!399411))))))

(declare-fun b!258055 () Bool)

(assert (=> b!258055 (= e!178976 (tuple2!22085 false (_2!11978 lt!399489)))))

(declare-fun d!86566 () Bool)

(assert (=> d!86566 e!178975))

(declare-fun res!216216 () Bool)

(assert (=> d!86566 (=> (not res!216216) (not e!178975))))

(declare-fun lt!399483 () (_ BitVec 64))

(assert (=> d!86566 (= res!216216 (bvsge (bvsub lt!399483 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6155 (buf!6677 (_2!11978 lt!399481))) (currentByte!12243 (_2!11978 lt!399481)) (currentBit!12238 (_2!11978 lt!399481)))))))

(assert (=> d!86566 (or (= (bvand lt!399483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399483 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399486 () (_ BitVec 64))

(assert (=> d!86566 (= lt!399483 (bvadd lt!399486 nBits!535))))

(assert (=> d!86566 (or (not (= (bvand lt!399486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399486 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86566 (= lt!399486 (bitIndex!0 (size!6155 (buf!6677 (_2!11978 lt!399411))) (currentByte!12243 (_2!11978 lt!399411)) (currentBit!12238 (_2!11978 lt!399411))))))

(assert (=> d!86566 (= lt!399481 e!178974)))

(declare-fun c!11847 () Bool)

(assert (=> d!86566 (= c!11847 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86566 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86566 (= (checkBitsLoop!0 (_2!11978 lt!399411) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399481)))

(declare-fun b!258053 () Bool)

(assert (=> b!258053 (= e!178974 (tuple2!22085 true (_2!11978 lt!399411)))))

(declare-fun b!258056 () Bool)

(declare-datatypes ((tuple2!22088 0))(
  ( (tuple2!22089 (_1!11980 BitStream!11232) (_2!11980 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11232) tuple2!22088)

(assert (=> b!258056 (= e!178972 (= expected!109 (_2!11980 (readBitPure!0 (_2!11978 lt!399411)))))))

(declare-fun lt!399480 () tuple2!22084)

(declare-fun b!258057 () Bool)

(assert (=> b!258057 (= lt!399480 (checkBitsLoop!0 (_2!11978 lt!399489) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399485 () Unit!18419)

(declare-fun lt!399482 () Unit!18419)

(assert (=> b!258057 (= lt!399485 lt!399482)))

(declare-fun lt!399488 () (_ BitVec 64))

(declare-fun lt!399487 () (_ BitVec 64))

(assert (=> b!258057 (validate_offset_bits!1 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399489)))) ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399489))) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399489))) (bvsub lt!399488 lt!399487))))

(assert (=> b!258057 (= lt!399482 (validateOffsetBitsIneqLemma!0 (_2!11978 lt!399411) (_2!11978 lt!399489) lt!399488 lt!399487))))

(assert (=> b!258057 (= lt!399487 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258057 (= lt!399488 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258057 (= e!178976 (tuple2!22085 (_1!11978 lt!399480) (_2!11978 lt!399480)))))

(assert (= (and d!86566 c!11847) b!258053))

(assert (= (and d!86566 (not c!11847)) b!258051))

(assert (= (and b!258051 c!11846) b!258055))

(assert (= (and b!258051 (not c!11846)) b!258057))

(assert (= (and d!86566 res!216216) b!258052))

(assert (= (and b!258052 res!216218) b!258049))

(assert (= (and b!258049 (not res!216219)) b!258054))

(assert (= (and b!258049 res!216215) b!258050))

(assert (= (and b!258050 (not res!216217)) b!258056))

(declare-fun m!387571 () Bool)

(assert (=> b!258056 m!387571))

(declare-fun m!387573 () Bool)

(assert (=> d!86566 m!387573))

(declare-fun m!387575 () Bool)

(assert (=> d!86566 m!387575))

(declare-fun m!387577 () Bool)

(assert (=> b!258057 m!387577))

(declare-fun m!387581 () Bool)

(assert (=> b!258057 m!387581))

(declare-fun m!387583 () Bool)

(assert (=> b!258057 m!387583))

(assert (=> b!258054 m!387573))

(assert (=> b!258054 m!387575))

(declare-fun m!387585 () Bool)

(assert (=> b!258051 m!387585))

(assert (=> b!258001 d!86566))

(declare-fun d!86580 () Bool)

(declare-fun e!178982 () Bool)

(assert (=> d!86580 e!178982))

(declare-fun res!216229 () Bool)

(assert (=> d!86580 (=> (not res!216229) (not e!178982))))

(declare-fun lt!399526 () (_ BitVec 64))

(declare-fun lt!399522 () (_ BitVec 64))

(declare-fun lt!399524 () (_ BitVec 64))

(assert (=> d!86580 (= res!216229 (= lt!399524 (bvsub lt!399522 lt!399526)))))

(assert (=> d!86580 (or (= (bvand lt!399522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399522 lt!399526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86580 (= lt!399526 (remainingBits!0 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))) ((_ sign_extend 32) (currentByte!12243 thiss!1754)) ((_ sign_extend 32) (currentBit!12238 thiss!1754))))))

(declare-fun lt!399527 () (_ BitVec 64))

(declare-fun lt!399525 () (_ BitVec 64))

(assert (=> d!86580 (= lt!399522 (bvmul lt!399527 lt!399525))))

(assert (=> d!86580 (or (= lt!399527 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399525 (bvsdiv (bvmul lt!399527 lt!399525) lt!399527)))))

(assert (=> d!86580 (= lt!399525 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86580 (= lt!399527 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))))))

(assert (=> d!86580 (= lt!399524 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12243 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12238 thiss!1754))))))

(assert (=> d!86580 (invariant!0 (currentBit!12238 thiss!1754) (currentByte!12243 thiss!1754) (size!6155 (buf!6677 thiss!1754)))))

(assert (=> d!86580 (= (bitIndex!0 (size!6155 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754) (currentBit!12238 thiss!1754)) lt!399524)))

(declare-fun b!258067 () Bool)

(declare-fun res!216230 () Bool)

(assert (=> b!258067 (=> (not res!216230) (not e!178982))))

(assert (=> b!258067 (= res!216230 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399524))))

(declare-fun b!258068 () Bool)

(declare-fun lt!399523 () (_ BitVec 64))

(assert (=> b!258068 (= e!178982 (bvsle lt!399524 (bvmul lt!399523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258068 (or (= lt!399523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399523)))))

(assert (=> b!258068 (= lt!399523 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))))))

(assert (= (and d!86580 res!216229) b!258067))

(assert (= (and b!258067 res!216230) b!258068))

(assert (=> d!86580 m!387551))

(assert (=> d!86580 m!387523))

(assert (=> b!258001 d!86580))

(declare-fun d!86584 () Bool)

(assert (=> d!86584 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399411)))) ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399411))) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399411))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399411)))) ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399411))) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399411)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21905 () Bool)

(assert (= bs!21905 d!86584))

(declare-fun m!387587 () Bool)

(assert (=> bs!21905 m!387587))

(assert (=> b!258001 d!86584))

(declare-fun d!86586 () Bool)

(declare-fun e!178983 () Bool)

(assert (=> d!86586 e!178983))

(declare-fun res!216231 () Bool)

(assert (=> d!86586 (=> (not res!216231) (not e!178983))))

(declare-fun lt!399530 () (_ BitVec 64))

(declare-fun lt!399528 () (_ BitVec 64))

(declare-fun lt!399532 () (_ BitVec 64))

(assert (=> d!86586 (= res!216231 (= lt!399530 (bvsub lt!399528 lt!399532)))))

(assert (=> d!86586 (or (= (bvand lt!399528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399532 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399528 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399528 lt!399532) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86586 (= lt!399532 (remainingBits!0 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399412)))) ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399412))) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399412)))))))

(declare-fun lt!399533 () (_ BitVec 64))

(declare-fun lt!399531 () (_ BitVec 64))

(assert (=> d!86586 (= lt!399528 (bvmul lt!399533 lt!399531))))

(assert (=> d!86586 (or (= lt!399533 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399531 (bvsdiv (bvmul lt!399533 lt!399531) lt!399533)))))

(assert (=> d!86586 (= lt!399531 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86586 (= lt!399533 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399412)))))))

(assert (=> d!86586 (= lt!399530 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399412))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399412)))))))

(assert (=> d!86586 (invariant!0 (currentBit!12238 (_2!11978 lt!399412)) (currentByte!12243 (_2!11978 lt!399412)) (size!6155 (buf!6677 (_2!11978 lt!399412))))))

(assert (=> d!86586 (= (bitIndex!0 (size!6155 (buf!6677 (_2!11978 lt!399412))) (currentByte!12243 (_2!11978 lt!399412)) (currentBit!12238 (_2!11978 lt!399412))) lt!399530)))

(declare-fun b!258069 () Bool)

(declare-fun res!216232 () Bool)

(assert (=> b!258069 (=> (not res!216232) (not e!178983))))

(assert (=> b!258069 (= res!216232 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399530))))

(declare-fun b!258070 () Bool)

(declare-fun lt!399529 () (_ BitVec 64))

(assert (=> b!258070 (= e!178983 (bvsle lt!399530 (bvmul lt!399529 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258070 (or (= lt!399529 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399529 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399529)))))

(assert (=> b!258070 (= lt!399529 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399412)))))))

(assert (= (and d!86586 res!216231) b!258069))

(assert (= (and b!258069 res!216232) b!258070))

(declare-fun m!387589 () Bool)

(assert (=> d!86586 m!387589))

(declare-fun m!387591 () Bool)

(assert (=> d!86586 m!387591))

(assert (=> b!258001 d!86586))

(declare-fun d!86588 () Bool)

(declare-fun e!178988 () Bool)

(assert (=> d!86588 e!178988))

(declare-fun res!216239 () Bool)

(assert (=> d!86588 (=> (not res!216239) (not e!178988))))

(assert (=> d!86588 (= res!216239 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399548 () Unit!18419)

(declare-fun choose!27 (BitStream!11232 BitStream!11232 (_ BitVec 64) (_ BitVec 64)) Unit!18419)

(assert (=> d!86588 (= lt!399548 (choose!27 thiss!1754 (_2!11978 lt!399411) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86588 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86588 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11978 lt!399411) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399548)))

(declare-fun b!258077 () Bool)

(assert (=> b!258077 (= e!178988 (validate_offset_bits!1 ((_ sign_extend 32) (size!6155 (buf!6677 (_2!11978 lt!399411)))) ((_ sign_extend 32) (currentByte!12243 (_2!11978 lt!399411))) ((_ sign_extend 32) (currentBit!12238 (_2!11978 lt!399411))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86588 res!216239) b!258077))

(declare-fun m!387601 () Bool)

(assert (=> d!86588 m!387601))

(assert (=> b!258077 m!387521))

(assert (=> b!258001 d!86588))

(declare-fun d!86596 () Bool)

(assert (=> d!86596 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12238 thiss!1754) (currentByte!12243 thiss!1754) (size!6155 (buf!6677 thiss!1754))))))

(declare-fun bs!21907 () Bool)

(assert (= bs!21907 d!86596))

(assert (=> bs!21907 m!387523))

(assert (=> start!55314 d!86596))

(declare-fun d!86598 () Bool)

(assert (=> d!86598 (= (array_inv!5896 (buf!6677 thiss!1754)) (bvsge (size!6155 (buf!6677 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257999 d!86598))

(declare-fun d!86600 () Bool)

(declare-fun e!179010 () Bool)

(assert (=> d!86600 e!179010))

(declare-fun res!216257 () Bool)

(assert (=> d!86600 (=> (not res!216257) (not e!179010))))

(declare-datatypes ((tuple2!22096 0))(
  ( (tuple2!22097 (_1!11984 Unit!18419) (_2!11984 BitStream!11232)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11232) tuple2!22096)

(assert (=> d!86600 (= res!216257 (= (buf!6677 (_2!11984 (increaseBitIndex!0 thiss!1754))) (buf!6677 thiss!1754)))))

(declare-fun lt!399600 () Bool)

(assert (=> d!86600 (= lt!399600 (not (= (bvand ((_ sign_extend 24) (select (arr!7142 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12238 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399598 () tuple2!22084)

(assert (=> d!86600 (= lt!399598 (tuple2!22085 (not (= (bvand ((_ sign_extend 24) (select (arr!7142 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12238 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11984 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86600 (validate_offset_bit!0 ((_ sign_extend 32) (size!6155 (buf!6677 thiss!1754))) ((_ sign_extend 32) (currentByte!12243 thiss!1754)) ((_ sign_extend 32) (currentBit!12238 thiss!1754)))))

(assert (=> d!86600 (= (readBit!0 thiss!1754) lt!399598)))

(declare-fun lt!399599 () (_ BitVec 64))

(declare-fun b!258107 () Bool)

(declare-fun lt!399596 () (_ BitVec 64))

(assert (=> b!258107 (= e!179010 (= (bitIndex!0 (size!6155 (buf!6677 (_2!11984 (increaseBitIndex!0 thiss!1754)))) (currentByte!12243 (_2!11984 (increaseBitIndex!0 thiss!1754))) (currentBit!12238 (_2!11984 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399596 lt!399599)))))

(assert (=> b!258107 (or (not (= (bvand lt!399596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399599 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399596 lt!399599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258107 (= lt!399599 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258107 (= lt!399596 (bitIndex!0 (size!6155 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754) (currentBit!12238 thiss!1754)))))

(declare-fun lt!399602 () Bool)

(assert (=> b!258107 (= lt!399602 (not (= (bvand ((_ sign_extend 24) (select (arr!7142 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12238 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399601 () Bool)

(assert (=> b!258107 (= lt!399601 (not (= (bvand ((_ sign_extend 24) (select (arr!7142 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12238 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399597 () Bool)

(assert (=> b!258107 (= lt!399597 (not (= (bvand ((_ sign_extend 24) (select (arr!7142 (buf!6677 thiss!1754)) (currentByte!12243 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12238 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86600 res!216257) b!258107))

(declare-fun m!387617 () Bool)

(assert (=> d!86600 m!387617))

(declare-fun m!387619 () Bool)

(assert (=> d!86600 m!387619))

(declare-fun m!387621 () Bool)

(assert (=> d!86600 m!387621))

(declare-fun m!387623 () Bool)

(assert (=> d!86600 m!387623))

(assert (=> b!258107 m!387617))

(assert (=> b!258107 m!387621))

(assert (=> b!258107 m!387619))

(assert (=> b!258107 m!387515))

(declare-fun m!387625 () Bool)

(assert (=> b!258107 m!387625))

(assert (=> b!258004 d!86600))

(check-sat (not b!258057) (not d!86588) (not b!258056) (not d!86566) (not d!86596) (not d!86586) (not d!86564) (not b!258054) (not d!86580) (not b!258107) (not b!258077) (not d!86584) (not b!258051) (not d!86600))
