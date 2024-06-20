; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52490 () Bool)

(assert start!52490)

(declare-fun b!242305 () Bool)

(declare-fun e!167989 () Bool)

(declare-datatypes ((array!13301 0))(
  ( (array!13302 (arr!6817 (Array (_ BitVec 32) (_ BitVec 8))) (size!5830 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10582 0))(
  ( (BitStream!10583 (buf!6296 array!13301) (currentByte!11659 (_ BitVec 32)) (currentBit!11654 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20730 0))(
  ( (tuple2!20731 (_1!11287 BitStream!10582) (_2!11287 Bool)) )
))
(declare-fun lt!377723 () tuple2!20730)

(declare-fun lt!377725 () tuple2!20730)

(assert (=> b!242305 (= e!167989 (= (_2!11287 lt!377723) (_2!11287 lt!377725)))))

(declare-fun b!242306 () Bool)

(declare-fun res!202343 () Bool)

(declare-fun e!167986 () Bool)

(assert (=> b!242306 (=> (not res!202343) (not e!167986))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!242306 (= res!202343 (bvslt from!289 nBits!297))))

(declare-fun b!242307 () Bool)

(declare-fun res!202345 () Bool)

(declare-fun e!167984 () Bool)

(assert (=> b!242307 (=> (not res!202345) (not e!167984))))

(declare-fun thiss!1005 () BitStream!10582)

(declare-datatypes ((Unit!17743 0))(
  ( (Unit!17744) )
))
(declare-datatypes ((tuple2!20732 0))(
  ( (tuple2!20733 (_1!11288 Unit!17743) (_2!11288 BitStream!10582)) )
))
(declare-fun lt!377715 () tuple2!20732)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242307 (= res!202345 (invariant!0 (currentBit!11654 thiss!1005) (currentByte!11659 thiss!1005) (size!5830 (buf!6296 (_2!11288 lt!377715)))))))

(declare-fun b!242308 () Bool)

(declare-fun res!202346 () Bool)

(declare-fun e!167987 () Bool)

(assert (=> b!242308 (=> (not res!202346) (not e!167987))))

(declare-fun lt!377724 () tuple2!20732)

(declare-fun isPrefixOf!0 (BitStream!10582 BitStream!10582) Bool)

(assert (=> b!242308 (= res!202346 (isPrefixOf!0 (_2!11288 lt!377715) (_2!11288 lt!377724)))))

(declare-fun b!242309 () Bool)

(declare-fun lt!377726 () tuple2!20730)

(declare-datatypes ((tuple2!20734 0))(
  ( (tuple2!20735 (_1!11289 BitStream!10582) (_2!11289 BitStream!10582)) )
))
(declare-fun lt!377714 () tuple2!20734)

(assert (=> b!242309 (= e!167987 (not (or (not (_2!11287 lt!377726)) (not (= (_1!11287 lt!377726) (_2!11289 lt!377714))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10582 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20730)

(assert (=> b!242309 (= lt!377726 (checkBitsLoopPure!0 (_1!11289 lt!377714) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377720 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242309 (validate_offset_bits!1 ((_ sign_extend 32) (size!5830 (buf!6296 (_2!11288 lt!377724)))) ((_ sign_extend 32) (currentByte!11659 (_2!11288 lt!377715))) ((_ sign_extend 32) (currentBit!11654 (_2!11288 lt!377715))) lt!377720)))

(declare-fun lt!377722 () Unit!17743)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10582 array!13301 (_ BitVec 64)) Unit!17743)

(assert (=> b!242309 (= lt!377722 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11288 lt!377715) (buf!6296 (_2!11288 lt!377724)) lt!377720))))

(declare-fun reader!0 (BitStream!10582 BitStream!10582) tuple2!20734)

(assert (=> b!242309 (= lt!377714 (reader!0 (_2!11288 lt!377715) (_2!11288 lt!377724)))))

(declare-fun b!242310 () Bool)

(assert (=> b!242310 (= e!167986 (not true))))

(assert (=> b!242310 e!167989))

(declare-fun res!202335 () Bool)

(assert (=> b!242310 (=> (not res!202335) (not e!167989))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242310 (= res!202335 (= (bitIndex!0 (size!5830 (buf!6296 (_1!11287 lt!377723))) (currentByte!11659 (_1!11287 lt!377723)) (currentBit!11654 (_1!11287 lt!377723))) (bitIndex!0 (size!5830 (buf!6296 (_1!11287 lt!377725))) (currentByte!11659 (_1!11287 lt!377725)) (currentBit!11654 (_1!11287 lt!377725)))))))

(declare-fun lt!377716 () Unit!17743)

(declare-fun lt!377718 () BitStream!10582)

(declare-fun readBitPrefixLemma!0 (BitStream!10582 BitStream!10582) Unit!17743)

(assert (=> b!242310 (= lt!377716 (readBitPrefixLemma!0 lt!377718 (_2!11288 lt!377724)))))

(declare-fun readBitPure!0 (BitStream!10582) tuple2!20730)

(assert (=> b!242310 (= lt!377725 (readBitPure!0 (BitStream!10583 (buf!6296 (_2!11288 lt!377724)) (currentByte!11659 thiss!1005) (currentBit!11654 thiss!1005))))))

(assert (=> b!242310 (= lt!377723 (readBitPure!0 lt!377718))))

(assert (=> b!242310 (= lt!377718 (BitStream!10583 (buf!6296 (_2!11288 lt!377715)) (currentByte!11659 thiss!1005) (currentBit!11654 thiss!1005)))))

(assert (=> b!242310 e!167984))

(declare-fun res!202341 () Bool)

(assert (=> b!242310 (=> (not res!202341) (not e!167984))))

(assert (=> b!242310 (= res!202341 (isPrefixOf!0 thiss!1005 (_2!11288 lt!377724)))))

(declare-fun lt!377717 () Unit!17743)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10582 BitStream!10582 BitStream!10582) Unit!17743)

(assert (=> b!242310 (= lt!377717 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11288 lt!377715) (_2!11288 lt!377724)))))

(declare-fun e!167988 () Bool)

(assert (=> b!242310 e!167988))

(declare-fun res!202336 () Bool)

(assert (=> b!242310 (=> (not res!202336) (not e!167988))))

(assert (=> b!242310 (= res!202336 (= (size!5830 (buf!6296 (_2!11288 lt!377715))) (size!5830 (buf!6296 (_2!11288 lt!377724)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10582 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20732)

(assert (=> b!242310 (= lt!377724 (appendNBitsLoop!0 (_2!11288 lt!377715) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242310 (validate_offset_bits!1 ((_ sign_extend 32) (size!5830 (buf!6296 (_2!11288 lt!377715)))) ((_ sign_extend 32) (currentByte!11659 (_2!11288 lt!377715))) ((_ sign_extend 32) (currentBit!11654 (_2!11288 lt!377715))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377727 () Unit!17743)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10582 BitStream!10582 (_ BitVec 64) (_ BitVec 64)) Unit!17743)

(assert (=> b!242310 (= lt!377727 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11288 lt!377715) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167990 () Bool)

(assert (=> b!242310 e!167990))

(declare-fun res!202337 () Bool)

(assert (=> b!242310 (=> (not res!202337) (not e!167990))))

(assert (=> b!242310 (= res!202337 (= (size!5830 (buf!6296 thiss!1005)) (size!5830 (buf!6296 (_2!11288 lt!377715)))))))

(declare-fun appendBit!0 (BitStream!10582 Bool) tuple2!20732)

(assert (=> b!242310 (= lt!377715 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242311 () Bool)

(declare-fun res!202344 () Bool)

(assert (=> b!242311 (=> (not res!202344) (not e!167986))))

(assert (=> b!242311 (= res!202344 (validate_offset_bits!1 ((_ sign_extend 32) (size!5830 (buf!6296 thiss!1005))) ((_ sign_extend 32) (currentByte!11659 thiss!1005)) ((_ sign_extend 32) (currentBit!11654 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242312 () Bool)

(declare-fun e!167981 () Bool)

(assert (=> b!242312 (= e!167990 e!167981)))

(declare-fun res!202339 () Bool)

(assert (=> b!242312 (=> (not res!202339) (not e!167981))))

(declare-fun lt!377721 () (_ BitVec 64))

(declare-fun lt!377719 () (_ BitVec 64))

(assert (=> b!242312 (= res!202339 (= lt!377721 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377719)))))

(assert (=> b!242312 (= lt!377721 (bitIndex!0 (size!5830 (buf!6296 (_2!11288 lt!377715))) (currentByte!11659 (_2!11288 lt!377715)) (currentBit!11654 (_2!11288 lt!377715))))))

(assert (=> b!242312 (= lt!377719 (bitIndex!0 (size!5830 (buf!6296 thiss!1005)) (currentByte!11659 thiss!1005) (currentBit!11654 thiss!1005)))))

(declare-fun b!242314 () Bool)

(declare-fun e!167985 () Bool)

(assert (=> b!242314 (= e!167981 e!167985)))

(declare-fun res!202347 () Bool)

(assert (=> b!242314 (=> (not res!202347) (not e!167985))))

(declare-fun lt!377713 () tuple2!20730)

(assert (=> b!242314 (= res!202347 (and (= (_2!11287 lt!377713) bit!26) (= (_1!11287 lt!377713) (_2!11288 lt!377715))))))

(declare-fun readerFrom!0 (BitStream!10582 (_ BitVec 32) (_ BitVec 32)) BitStream!10582)

(assert (=> b!242314 (= lt!377713 (readBitPure!0 (readerFrom!0 (_2!11288 lt!377715) (currentBit!11654 thiss!1005) (currentByte!11659 thiss!1005))))))

(declare-fun b!242315 () Bool)

(declare-fun res!202342 () Bool)

(assert (=> b!242315 (=> (not res!202342) (not e!167981))))

(assert (=> b!242315 (= res!202342 (isPrefixOf!0 thiss!1005 (_2!11288 lt!377715)))))

(declare-fun b!242316 () Bool)

(assert (=> b!242316 (= e!167984 (invariant!0 (currentBit!11654 thiss!1005) (currentByte!11659 thiss!1005) (size!5830 (buf!6296 (_2!11288 lt!377724)))))))

(declare-fun b!242317 () Bool)

(assert (=> b!242317 (= e!167988 e!167987)))

(declare-fun res!202340 () Bool)

(assert (=> b!242317 (=> (not res!202340) (not e!167987))))

(assert (=> b!242317 (= res!202340 (= (bitIndex!0 (size!5830 (buf!6296 (_2!11288 lt!377724))) (currentByte!11659 (_2!11288 lt!377724)) (currentBit!11654 (_2!11288 lt!377724))) (bvadd (bitIndex!0 (size!5830 (buf!6296 (_2!11288 lt!377715))) (currentByte!11659 (_2!11288 lt!377715)) (currentBit!11654 (_2!11288 lt!377715))) lt!377720)))))

(assert (=> b!242317 (= lt!377720 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242318 () Bool)

(assert (=> b!242318 (= e!167985 (= (bitIndex!0 (size!5830 (buf!6296 (_1!11287 lt!377713))) (currentByte!11659 (_1!11287 lt!377713)) (currentBit!11654 (_1!11287 lt!377713))) lt!377721))))

(declare-fun res!202338 () Bool)

(assert (=> start!52490 (=> (not res!202338) (not e!167986))))

(assert (=> start!52490 (= res!202338 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52490 e!167986))

(assert (=> start!52490 true))

(declare-fun e!167982 () Bool)

(declare-fun inv!12 (BitStream!10582) Bool)

(assert (=> start!52490 (and (inv!12 thiss!1005) e!167982)))

(declare-fun b!242313 () Bool)

(declare-fun array_inv!5571 (array!13301) Bool)

(assert (=> b!242313 (= e!167982 (array_inv!5571 (buf!6296 thiss!1005)))))

(assert (= (and start!52490 res!202338) b!242311))

(assert (= (and b!242311 res!202344) b!242306))

(assert (= (and b!242306 res!202343) b!242310))

(assert (= (and b!242310 res!202337) b!242312))

(assert (= (and b!242312 res!202339) b!242315))

(assert (= (and b!242315 res!202342) b!242314))

(assert (= (and b!242314 res!202347) b!242318))

(assert (= (and b!242310 res!202336) b!242317))

(assert (= (and b!242317 res!202340) b!242308))

(assert (= (and b!242308 res!202346) b!242309))

(assert (= (and b!242310 res!202341) b!242307))

(assert (= (and b!242307 res!202345) b!242316))

(assert (= (and b!242310 res!202335) b!242305))

(assert (= start!52490 b!242313))

(declare-fun m!365099 () Bool)

(assert (=> b!242318 m!365099))

(declare-fun m!365101 () Bool)

(assert (=> b!242317 m!365101))

(declare-fun m!365103 () Bool)

(assert (=> b!242317 m!365103))

(declare-fun m!365105 () Bool)

(assert (=> b!242307 m!365105))

(declare-fun m!365107 () Bool)

(assert (=> b!242311 m!365107))

(declare-fun m!365109 () Bool)

(assert (=> b!242313 m!365109))

(declare-fun m!365111 () Bool)

(assert (=> b!242315 m!365111))

(assert (=> b!242312 m!365103))

(declare-fun m!365113 () Bool)

(assert (=> b!242312 m!365113))

(declare-fun m!365115 () Bool)

(assert (=> b!242310 m!365115))

(declare-fun m!365117 () Bool)

(assert (=> b!242310 m!365117))

(declare-fun m!365119 () Bool)

(assert (=> b!242310 m!365119))

(declare-fun m!365121 () Bool)

(assert (=> b!242310 m!365121))

(declare-fun m!365123 () Bool)

(assert (=> b!242310 m!365123))

(declare-fun m!365125 () Bool)

(assert (=> b!242310 m!365125))

(declare-fun m!365127 () Bool)

(assert (=> b!242310 m!365127))

(declare-fun m!365129 () Bool)

(assert (=> b!242310 m!365129))

(declare-fun m!365131 () Bool)

(assert (=> b!242310 m!365131))

(declare-fun m!365133 () Bool)

(assert (=> b!242310 m!365133))

(declare-fun m!365135 () Bool)

(assert (=> b!242310 m!365135))

(declare-fun m!365137 () Bool)

(assert (=> start!52490 m!365137))

(declare-fun m!365139 () Bool)

(assert (=> b!242314 m!365139))

(assert (=> b!242314 m!365139))

(declare-fun m!365141 () Bool)

(assert (=> b!242314 m!365141))

(declare-fun m!365143 () Bool)

(assert (=> b!242309 m!365143))

(declare-fun m!365145 () Bool)

(assert (=> b!242309 m!365145))

(declare-fun m!365147 () Bool)

(assert (=> b!242309 m!365147))

(declare-fun m!365149 () Bool)

(assert (=> b!242309 m!365149))

(declare-fun m!365151 () Bool)

(assert (=> b!242316 m!365151))

(declare-fun m!365153 () Bool)

(assert (=> b!242308 m!365153))

(push 1)

(assert (not b!242314))

(assert (not b!242312))

(assert (not b!242316))

(assert (not b!242317))

(assert (not b!242309))

(assert (not b!242318))

(assert (not b!242308))

(assert (not b!242310))

(assert (not b!242311))

(assert (not start!52490))

(assert (not b!242313))

(assert (not b!242307))

(assert (not b!242315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

