; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55880 () Bool)

(assert start!55880)

(declare-fun lt!401563 () (_ BitVec 64))

(declare-fun e!180184 () Bool)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun b!259653 () Bool)

(declare-fun lt!401560 () (_ BitVec 64))

(assert (=> b!259653 (= e!180184 (not (or (= lt!401563 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!401563 (bvand (bvsub lt!401560 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!259653 (= lt!401563 (bvand lt!401560 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!14209 0))(
  ( (array!14210 (arr!7209 (Array (_ BitVec 32) (_ BitVec 8))) (size!6222 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11366 0))(
  ( (BitStream!11367 (buf!6744 array!14209) (currentByte!12394 (_ BitVec 32)) (currentBit!12389 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11366)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259653 (= lt!401560 (bvadd (bitIndex!0 (size!6222 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754) (currentBit!12389 thiss!1754)) nBits!535))))

(declare-fun expected!109 () Bool)

(declare-datatypes ((tuple2!22260 0))(
  ( (tuple2!22261 (_1!12066 Bool) (_2!12066 BitStream!11366)) )
))
(declare-fun lt!401562 () tuple2!22260)

(declare-fun lt!401561 () tuple2!22260)

(declare-fun checkBitsLoop!0 (BitStream!11366 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22260)

(assert (=> b!259653 (= lt!401562 (checkBitsLoop!0 (_2!12066 lt!401561) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259653 (validate_offset_bits!1 ((_ sign_extend 32) (size!6222 (buf!6744 (_2!12066 lt!401561)))) ((_ sign_extend 32) (currentByte!12394 (_2!12066 lt!401561))) ((_ sign_extend 32) (currentBit!12389 (_2!12066 lt!401561))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18487 0))(
  ( (Unit!18488) )
))
(declare-fun lt!401564 () Unit!18487)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11366 BitStream!11366 (_ BitVec 64) (_ BitVec 64)) Unit!18487)

(assert (=> b!259653 (= lt!401564 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12066 lt!401561) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!259654 () Bool)

(declare-fun e!180187 () Bool)

(declare-fun array_inv!5963 (array!14209) Bool)

(assert (=> b!259654 (= e!180187 (array_inv!5963 (buf!6744 thiss!1754)))))

(declare-fun b!259655 () Bool)

(declare-fun e!180185 () Bool)

(assert (=> b!259655 (= e!180185 e!180184)))

(declare-fun res!217489 () Bool)

(assert (=> b!259655 (=> (not res!217489) (not e!180184))))

(assert (=> b!259655 (= res!217489 (= (_1!12066 lt!401561) expected!109))))

(declare-fun readBit!0 (BitStream!11366) tuple2!22260)

(assert (=> b!259655 (= lt!401561 (readBit!0 thiss!1754))))

(declare-fun b!259657 () Bool)

(declare-fun res!217486 () Bool)

(assert (=> b!259657 (=> (not res!217486) (not e!180185))))

(assert (=> b!259657 (= res!217486 (validate_offset_bits!1 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))) ((_ sign_extend 32) (currentByte!12394 thiss!1754)) ((_ sign_extend 32) (currentBit!12389 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217487 () Bool)

(assert (=> start!55880 (=> (not res!217487) (not e!180185))))

(assert (=> start!55880 (= res!217487 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55880 e!180185))

(assert (=> start!55880 true))

(declare-fun inv!12 (BitStream!11366) Bool)

(assert (=> start!55880 (and (inv!12 thiss!1754) e!180187)))

(declare-fun b!259656 () Bool)

(declare-fun res!217488 () Bool)

(assert (=> b!259656 (=> (not res!217488) (not e!180185))))

(assert (=> b!259656 (= res!217488 (not (= from!526 nBits!535)))))

(assert (= (and start!55880 res!217487) b!259657))

(assert (= (and b!259657 res!217486) b!259656))

(assert (= (and b!259656 res!217488) b!259655))

(assert (= (and b!259655 res!217489) b!259653))

(assert (= start!55880 b!259654))

(declare-fun m!388951 () Bool)

(assert (=> b!259653 m!388951))

(declare-fun m!388953 () Bool)

(assert (=> b!259653 m!388953))

(declare-fun m!388955 () Bool)

(assert (=> b!259653 m!388955))

(declare-fun m!388957 () Bool)

(assert (=> b!259653 m!388957))

(declare-fun m!388959 () Bool)

(assert (=> start!55880 m!388959))

(declare-fun m!388961 () Bool)

(assert (=> b!259657 m!388961))

(declare-fun m!388963 () Bool)

(assert (=> b!259654 m!388963))

(declare-fun m!388965 () Bool)

(assert (=> b!259655 m!388965))

(push 1)

(assert (not start!55880))

(assert (not b!259654))

(assert (not b!259657))

(assert (not b!259653))

(assert (not b!259655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87094 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))) ((_ sign_extend 32) (currentByte!12394 thiss!1754)) ((_ sign_extend 32) (currentBit!12389 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))) ((_ sign_extend 32) (currentByte!12394 thiss!1754)) ((_ sign_extend 32) (currentBit!12389 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22066 () Bool)

(assert (= bs!22066 d!87094))

(declare-fun m!388969 () Bool)

(assert (=> bs!22066 m!388969))

(assert (=> b!259657 d!87094))

(declare-fun d!87098 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87098 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12389 thiss!1754) (currentByte!12394 thiss!1754) (size!6222 (buf!6744 thiss!1754))))))

(declare-fun bs!22068 () Bool)

(assert (= bs!22068 d!87098))

(declare-fun m!388973 () Bool)

(assert (=> bs!22068 m!388973))

(assert (=> start!55880 d!87098))

(declare-fun d!87102 () Bool)

(declare-fun e!180201 () Bool)

(assert (=> d!87102 e!180201))

(declare-fun res!217498 () Bool)

(assert (=> d!87102 (=> (not res!217498) (not e!180201))))

(declare-fun lt!401605 () (_ BitVec 64))

(declare-fun lt!401604 () (_ BitVec 64))

(declare-fun lt!401601 () (_ BitVec 64))

(assert (=> d!87102 (= res!217498 (= lt!401601 (bvsub lt!401604 lt!401605)))))

(assert (=> d!87102 (or (= (bvand lt!401604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401605 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401604 lt!401605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87102 (= lt!401605 (remainingBits!0 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))) ((_ sign_extend 32) (currentByte!12394 thiss!1754)) ((_ sign_extend 32) (currentBit!12389 thiss!1754))))))

(declare-fun lt!401603 () (_ BitVec 64))

(declare-fun lt!401600 () (_ BitVec 64))

(assert (=> d!87102 (= lt!401604 (bvmul lt!401603 lt!401600))))

(assert (=> d!87102 (or (= lt!401603 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!401600 (bvsdiv (bvmul lt!401603 lt!401600) lt!401603)))))

(assert (=> d!87102 (= lt!401600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!87102 (= lt!401603 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))))))

(assert (=> d!87102 (= lt!401601 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12394 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12389 thiss!1754))))))

(assert (=> d!87102 (invariant!0 (currentBit!12389 thiss!1754) (currentByte!12394 thiss!1754) (size!6222 (buf!6744 thiss!1754)))))

(assert (=> d!87102 (= (bitIndex!0 (size!6222 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754) (currentBit!12389 thiss!1754)) lt!401601)))

(declare-fun b!259665 () Bool)

(declare-fun res!217497 () Bool)

(assert (=> b!259665 (=> (not res!217497) (not e!180201))))

(assert (=> b!259665 (= res!217497 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!401601))))

(declare-fun b!259666 () Bool)

(declare-fun lt!401602 () (_ BitVec 64))

(assert (=> b!259666 (= e!180201 (bvsle lt!401601 (bvmul lt!401602 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!259666 (or (= lt!401602 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!401602 #b0000000000000000000000000000000000000000000000000000000000001000) lt!401602)))))

(assert (=> b!259666 (= lt!401602 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))))))

(assert (= (and d!87102 res!217498) b!259665))

(assert (= (and b!259665 res!217497) b!259666))

(assert (=> d!87102 m!388969))

(assert (=> d!87102 m!388973))

(assert (=> b!259653 d!87102))

(declare-fun b!259718 () Bool)

(declare-fun e!180233 () tuple2!22260)

(declare-fun e!180232 () tuple2!22260)

(assert (=> b!259718 (= e!180233 e!180232)))

(declare-fun lt!401710 () tuple2!22260)

(assert (=> b!259718 (= lt!401710 (readBit!0 (_2!12066 lt!401561)))))

(declare-fun c!11922 () Bool)

(assert (=> b!259718 (= c!11922 (not (= (_1!12066 lt!401710) expected!109)))))

(declare-fun b!259719 () Bool)

(assert (=> b!259719 (= e!180233 (tuple2!22261 true (_2!12066 lt!401561)))))

(declare-fun d!87110 () Bool)

(declare-fun e!180234 () Bool)

(assert (=> d!87110 e!180234))

(declare-fun res!217536 () Bool)

(assert (=> d!87110 (=> (not res!217536) (not e!180234))))

(declare-fun lt!401706 () tuple2!22260)

(declare-fun lt!401715 () (_ BitVec 64))

(assert (=> d!87110 (= res!217536 (bvsge (bvsub lt!401715 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6222 (buf!6744 (_2!12066 lt!401706))) (currentByte!12394 (_2!12066 lt!401706)) (currentBit!12389 (_2!12066 lt!401706)))))))

(assert (=> d!87110 (or (= (bvand lt!401715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401715 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401714 () (_ BitVec 64))

(assert (=> d!87110 (= lt!401715 (bvadd lt!401714 nBits!535))))

(assert (=> d!87110 (or (not (= (bvand lt!401714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401714 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!87110 (= lt!401714 (bitIndex!0 (size!6222 (buf!6744 (_2!12066 lt!401561))) (currentByte!12394 (_2!12066 lt!401561)) (currentBit!12389 (_2!12066 lt!401561))))))

(assert (=> d!87110 (= lt!401706 e!180233)))

(declare-fun c!11923 () Bool)

(assert (=> d!87110 (= c!11923 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!87110 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!87110 (= (checkBitsLoop!0 (_2!12066 lt!401561) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!401706)))

(declare-fun b!259720 () Bool)

(declare-fun res!217537 () Bool)

(assert (=> b!259720 (=> (not res!217537) (not e!180234))))

(declare-fun e!180231 () Bool)

(assert (=> b!259720 (= res!217537 e!180231)))

(declare-fun res!217534 () Bool)

(assert (=> b!259720 (=> res!217534 e!180231)))

(assert (=> b!259720 (= res!217534 (not (_1!12066 lt!401706)))))

(declare-fun b!259721 () Bool)

(declare-fun e!180235 () Bool)

(declare-datatypes ((tuple2!22268 0))(
  ( (tuple2!22269 (_1!12070 BitStream!11366) (_2!12070 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11366) tuple2!22268)

(assert (=> b!259721 (= e!180235 (= expected!109 (_2!12070 (readBitPure!0 (_2!12066 lt!401561)))))))

(declare-fun lt!401712 () (_ BitVec 64))

(declare-fun b!259722 () Bool)

(assert (=> b!259722 (= e!180231 (= (bvsub lt!401712 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6222 (buf!6744 (_2!12066 lt!401706))) (currentByte!12394 (_2!12066 lt!401706)) (currentBit!12389 (_2!12066 lt!401706)))))))

(assert (=> b!259722 (or (= (bvand lt!401712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!401712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!401712 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!401707 () (_ BitVec 64))

(assert (=> b!259722 (= lt!401712 (bvadd lt!401707 nBits!535))))

(assert (=> b!259722 (or (not (= (bvand lt!401707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401707 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259722 (= lt!401707 (bitIndex!0 (size!6222 (buf!6744 (_2!12066 lt!401561))) (currentByte!12394 (_2!12066 lt!401561)) (currentBit!12389 (_2!12066 lt!401561))))))

(declare-fun b!259723 () Bool)

(assert (=> b!259723 (= e!180234 e!180235)))

(declare-fun res!217535 () Bool)

(assert (=> b!259723 (=> res!217535 e!180235)))

(assert (=> b!259723 (= res!217535 (or (not (_1!12066 lt!401706)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!259724 () Bool)

(assert (=> b!259724 (= e!180232 (tuple2!22261 false (_2!12066 lt!401710)))))

(declare-fun b!259725 () Bool)

(declare-fun lt!401705 () tuple2!22260)

(assert (=> b!259725 (= lt!401705 (checkBitsLoop!0 (_2!12066 lt!401710) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!401708 () Unit!18487)

(declare-fun lt!401713 () Unit!18487)

(assert (=> b!259725 (= lt!401708 lt!401713)))

(declare-fun lt!401709 () (_ BitVec 64))

(declare-fun lt!401711 () (_ BitVec 64))

(assert (=> b!259725 (validate_offset_bits!1 ((_ sign_extend 32) (size!6222 (buf!6744 (_2!12066 lt!401710)))) ((_ sign_extend 32) (currentByte!12394 (_2!12066 lt!401710))) ((_ sign_extend 32) (currentBit!12389 (_2!12066 lt!401710))) (bvsub lt!401709 lt!401711))))

(assert (=> b!259725 (= lt!401713 (validateOffsetBitsIneqLemma!0 (_2!12066 lt!401561) (_2!12066 lt!401710) lt!401709 lt!401711))))

(assert (=> b!259725 (= lt!401711 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259725 (= lt!401709 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!259725 (= e!180232 (tuple2!22261 (_1!12066 lt!401705) (_2!12066 lt!401705)))))

(declare-fun b!259726 () Bool)

(declare-fun res!217538 () Bool)

(assert (=> b!259726 (=> (not res!217538) (not e!180234))))

(assert (=> b!259726 (= res!217538 (and (= (buf!6744 (_2!12066 lt!401561)) (buf!6744 (_2!12066 lt!401706))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!12066 lt!401706))))))

(assert (= (and d!87110 c!11923) b!259719))

(assert (= (and d!87110 (not c!11923)) b!259718))

(assert (= (and b!259718 c!11922) b!259724))

(assert (= (and b!259718 (not c!11922)) b!259725))

(assert (= (and d!87110 res!217536) b!259726))

(assert (= (and b!259726 res!217538) b!259720))

(assert (= (and b!259720 (not res!217534)) b!259722))

(assert (= (and b!259720 res!217537) b!259723))

(assert (= (and b!259723 (not res!217535)) b!259721))

(declare-fun m!388999 () Bool)

(assert (=> d!87110 m!388999))

(declare-fun m!389001 () Bool)

(assert (=> d!87110 m!389001))

(declare-fun m!389003 () Bool)

(assert (=> b!259725 m!389003))

(declare-fun m!389005 () Bool)

(assert (=> b!259725 m!389005))

(declare-fun m!389007 () Bool)

(assert (=> b!259725 m!389007))

(declare-fun m!389009 () Bool)

(assert (=> b!259718 m!389009))

(assert (=> b!259722 m!388999))

(assert (=> b!259722 m!389001))

(declare-fun m!389011 () Bool)

(assert (=> b!259721 m!389011))

(assert (=> b!259653 d!87110))

(declare-fun d!87118 () Bool)

(assert (=> d!87118 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6222 (buf!6744 (_2!12066 lt!401561)))) ((_ sign_extend 32) (currentByte!12394 (_2!12066 lt!401561))) ((_ sign_extend 32) (currentBit!12389 (_2!12066 lt!401561))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6222 (buf!6744 (_2!12066 lt!401561)))) ((_ sign_extend 32) (currentByte!12394 (_2!12066 lt!401561))) ((_ sign_extend 32) (currentBit!12389 (_2!12066 lt!401561)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!22070 () Bool)

(assert (= bs!22070 d!87118))

(declare-fun m!389013 () Bool)

(assert (=> bs!22070 m!389013))

(assert (=> b!259653 d!87118))

(declare-fun d!87120 () Bool)

(declare-fun e!180243 () Bool)

(assert (=> d!87120 e!180243))

(declare-fun res!217546 () Bool)

(assert (=> d!87120 (=> (not res!217546) (not e!180243))))

(assert (=> d!87120 (= res!217546 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401729 () Unit!18487)

(declare-fun choose!27 (BitStream!11366 BitStream!11366 (_ BitVec 64) (_ BitVec 64)) Unit!18487)

(assert (=> d!87120 (= lt!401729 (choose!27 thiss!1754 (_2!12066 lt!401561) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!87120 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!87120 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!12066 lt!401561) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!401729)))

(declare-fun b!259738 () Bool)

(assert (=> b!259738 (= e!180243 (validate_offset_bits!1 ((_ sign_extend 32) (size!6222 (buf!6744 (_2!12066 lt!401561)))) ((_ sign_extend 32) (currentByte!12394 (_2!12066 lt!401561))) ((_ sign_extend 32) (currentBit!12389 (_2!12066 lt!401561))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!87120 res!217546) b!259738))

(declare-fun m!389031 () Bool)

(assert (=> d!87120 m!389031))

(assert (=> b!259738 m!388955))

(assert (=> b!259653 d!87120))

(declare-fun d!87126 () Bool)

(assert (=> d!87126 (= (array_inv!5963 (buf!6744 thiss!1754)) (bvsge (size!6222 (buf!6744 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259654 d!87126))

(declare-fun d!87128 () Bool)

(declare-fun e!180268 () Bool)

(assert (=> d!87128 e!180268))

(declare-fun res!217567 () Bool)

(assert (=> d!87128 (=> (not res!217567) (not e!180268))))

(declare-datatypes ((tuple2!22272 0))(
  ( (tuple2!22273 (_1!12072 Unit!18487) (_2!12072 BitStream!11366)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11366) tuple2!22272)

(assert (=> d!87128 (= res!217567 (= (buf!6744 (_2!12072 (increaseBitIndex!0 thiss!1754))) (buf!6744 thiss!1754)))))

(declare-fun lt!401780 () Bool)

(assert (=> d!87128 (= lt!401780 (not (= (bvand ((_ sign_extend 24) (select (arr!7209 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12389 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401781 () tuple2!22260)

(assert (=> d!87128 (= lt!401781 (tuple2!22261 (not (= (bvand ((_ sign_extend 24) (select (arr!7209 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12389 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12072 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!87128 (validate_offset_bit!0 ((_ sign_extend 32) (size!6222 (buf!6744 thiss!1754))) ((_ sign_extend 32) (currentByte!12394 thiss!1754)) ((_ sign_extend 32) (currentBit!12389 thiss!1754)))))

(assert (=> d!87128 (= (readBit!0 thiss!1754) lt!401781)))

(declare-fun b!259771 () Bool)

(declare-fun lt!401786 () (_ BitVec 64))

(declare-fun lt!401785 () (_ BitVec 64))

(assert (=> b!259771 (= e!180268 (= (bitIndex!0 (size!6222 (buf!6744 (_2!12072 (increaseBitIndex!0 thiss!1754)))) (currentByte!12394 (_2!12072 (increaseBitIndex!0 thiss!1754))) (currentBit!12389 (_2!12072 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!401785 lt!401786)))))

(assert (=> b!259771 (or (not (= (bvand lt!401785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401786 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!401785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!401785 lt!401786) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!259771 (= lt!401786 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!259771 (= lt!401785 (bitIndex!0 (size!6222 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754) (currentBit!12389 thiss!1754)))))

(declare-fun lt!401782 () Bool)

(assert (=> b!259771 (= lt!401782 (not (= (bvand ((_ sign_extend 24) (select (arr!7209 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12389 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401784 () Bool)

(assert (=> b!259771 (= lt!401784 (not (= (bvand ((_ sign_extend 24) (select (arr!7209 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12389 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401783 () Bool)

(assert (=> b!259771 (= lt!401783 (not (= (bvand ((_ sign_extend 24) (select (arr!7209 (buf!6744 thiss!1754)) (currentByte!12394 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12389 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!87128 res!217567) b!259771))

(declare-fun m!389051 () Bool)

(assert (=> d!87128 m!389051))

(declare-fun m!389053 () Bool)

(assert (=> d!87128 m!389053))

(declare-fun m!389055 () Bool)

(assert (=> d!87128 m!389055))

(declare-fun m!389057 () Bool)

(assert (=> d!87128 m!389057))

(assert (=> b!259771 m!389055))

(assert (=> b!259771 m!389053))

(assert (=> b!259771 m!389051))

(declare-fun m!389059 () Bool)

(assert (=> b!259771 m!389059))

(assert (=> b!259771 m!388951))

(assert (=> b!259655 d!87128))

(push 1)

(assert (not d!87118))

(assert (not b!259718))

(assert (not d!87094))

(assert (not d!87120))

(assert (not d!87128))

(assert (not b!259721))

(assert (not d!87110))

(assert (not d!87098))

(assert (not d!87102))

(assert (not b!259738))

(assert (not b!259725))

(assert (not b!259722))

(assert (not b!259771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

