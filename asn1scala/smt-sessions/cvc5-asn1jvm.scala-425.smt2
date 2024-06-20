; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11166 () Bool)

(assert start!11166)

(declare-fun b!55408 () Bool)

(declare-fun res!46160 () Bool)

(declare-fun e!36936 () Bool)

(assert (=> b!55408 (=> res!46160 e!36936)))

(declare-datatypes ((array!2581 0))(
  ( (array!2582 (arr!1721 (Array (_ BitVec 32) (_ BitVec 8))) (size!1175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2038 0))(
  ( (BitStream!2039 (buf!1538 array!2581) (currentByte!3120 (_ BitVec 32)) (currentBit!3115 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3829 0))(
  ( (Unit!3830) )
))
(declare-datatypes ((tuple2!5054 0))(
  ( (tuple2!5055 (_1!2638 Unit!3829) (_2!2638 BitStream!2038)) )
))
(declare-fun lt!86474 () tuple2!5054)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55408 (= res!46160 (not (invariant!0 (currentBit!3115 (_2!2638 lt!86474)) (currentByte!3120 (_2!2638 lt!86474)) (size!1175 (buf!1538 (_2!2638 lt!86474))))))))

(declare-fun b!55409 () Bool)

(declare-fun res!46154 () Bool)

(assert (=> b!55409 (=> res!46154 e!36936)))

(declare-fun thiss!1379 () BitStream!2038)

(assert (=> b!55409 (= res!46154 (not (= (size!1175 (buf!1538 thiss!1379)) (size!1175 (buf!1538 (_2!2638 lt!86474))))))))

(declare-fun res!46158 () Bool)

(declare-fun e!36932 () Bool)

(assert (=> start!11166 (=> (not res!46158) (not e!36932))))

(declare-fun srcBuffer!2 () array!2581)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11166 (= res!46158 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1175 srcBuffer!2))))))))

(assert (=> start!11166 e!36932))

(assert (=> start!11166 true))

(declare-fun array_inv!1078 (array!2581) Bool)

(assert (=> start!11166 (array_inv!1078 srcBuffer!2)))

(declare-fun e!36938 () Bool)

(declare-fun inv!12 (BitStream!2038) Bool)

(assert (=> start!11166 (and (inv!12 thiss!1379) e!36938)))

(declare-fun lt!86481 () (_ BitVec 64))

(declare-fun b!55410 () Bool)

(declare-fun lt!86480 () (_ BitVec 64))

(assert (=> b!55410 (= e!36936 (or (not (= lt!86481 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!86481 (bvand lt!86480 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!86476 () (_ BitVec 64))

(assert (=> b!55410 (= lt!86481 (bvand lt!86476 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!55410 (= (size!1175 (buf!1538 (_2!2638 lt!86474))) (size!1175 (buf!1538 thiss!1379)))))

(declare-fun b!55411 () Bool)

(declare-fun e!36930 () Bool)

(declare-fun e!36931 () Bool)

(assert (=> b!55411 (= e!36930 e!36931)))

(declare-fun res!46161 () Bool)

(assert (=> b!55411 (=> res!46161 e!36931)))

(declare-fun lt!86479 () tuple2!5054)

(declare-fun isPrefixOf!0 (BitStream!2038 BitStream!2038) Bool)

(assert (=> b!55411 (= res!46161 (not (isPrefixOf!0 (_2!2638 lt!86479) (_2!2638 lt!86474))))))

(assert (=> b!55411 (isPrefixOf!0 thiss!1379 (_2!2638 lt!86474))))

(declare-fun lt!86477 () Unit!3829)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2038 BitStream!2038 BitStream!2038) Unit!3829)

(assert (=> b!55411 (= lt!86477 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2638 lt!86479) (_2!2638 lt!86474)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2038 array!2581 (_ BitVec 64) (_ BitVec 64)) tuple2!5054)

(assert (=> b!55411 (= lt!86474 (appendBitsMSBFirstLoop!0 (_2!2638 lt!86479) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36935 () Bool)

(assert (=> b!55411 e!36935))

(declare-fun res!46153 () Bool)

(assert (=> b!55411 (=> (not res!46153) (not e!36935))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55411 (= res!46153 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86482 () Unit!3829)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2038 array!2581 (_ BitVec 64)) Unit!3829)

(assert (=> b!55411 (= lt!86482 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1538 (_2!2638 lt!86479)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5056 0))(
  ( (tuple2!5057 (_1!2639 BitStream!2038) (_2!2639 BitStream!2038)) )
))
(declare-fun lt!86473 () tuple2!5056)

(declare-fun reader!0 (BitStream!2038 BitStream!2038) tuple2!5056)

(assert (=> b!55411 (= lt!86473 (reader!0 thiss!1379 (_2!2638 lt!86479)))))

(declare-fun b!55412 () Bool)

(declare-fun e!36937 () Bool)

(assert (=> b!55412 (= e!36932 (not e!36937))))

(declare-fun res!46156 () Bool)

(assert (=> b!55412 (=> res!46156 e!36937)))

(assert (=> b!55412 (= res!46156 (bvsge i!635 to!314))))

(assert (=> b!55412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86475 () Unit!3829)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2038) Unit!3829)

(assert (=> b!55412 (= lt!86475 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55412 (= lt!86476 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)))))

(declare-fun b!55413 () Bool)

(assert (=> b!55413 (= e!36931 e!36936)))

(declare-fun res!46157 () Bool)

(assert (=> b!55413 (=> res!46157 e!36936)))

(assert (=> b!55413 (= res!46157 (not (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86474))) (currentByte!3120 (_2!2638 lt!86474)) (currentBit!3115 (_2!2638 lt!86474))) (bvsub lt!86480 i!635))))))

(assert (=> b!55413 (= lt!86480 (bvadd lt!86476 to!314))))

(declare-fun b!55414 () Bool)

(assert (=> b!55414 (= e!36938 (array_inv!1078 (buf!1538 thiss!1379)))))

(declare-fun b!55415 () Bool)

(assert (=> b!55415 (= e!36937 e!36930)))

(declare-fun res!46159 () Bool)

(assert (=> b!55415 (=> res!46159 e!36930)))

(assert (=> b!55415 (= res!46159 (not (isPrefixOf!0 thiss!1379 (_2!2638 lt!86479))))))

(assert (=> b!55415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86478 () Unit!3829)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2038 BitStream!2038 (_ BitVec 64) (_ BitVec 64)) Unit!3829)

(assert (=> b!55415 (= lt!86478 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2638 lt!86479) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2038 (_ BitVec 8) (_ BitVec 32)) tuple2!5054)

(assert (=> b!55415 (= lt!86479 (appendBitFromByte!0 thiss!1379 (select (arr!1721 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!55416 () Bool)

(declare-datatypes ((List!594 0))(
  ( (Nil!591) (Cons!590 (h!709 Bool) (t!1344 List!594)) )
))
(declare-fun head!413 (List!594) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2038 array!2581 (_ BitVec 64) (_ BitVec 64)) List!594)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2038 BitStream!2038 (_ BitVec 64)) List!594)

(assert (=> b!55416 (= e!36935 (= (head!413 (byteArrayBitContentToList!0 (_2!2638 lt!86479) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!413 (bitStreamReadBitsIntoList!0 (_2!2638 lt!86479) (_1!2639 lt!86473) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55417 () Bool)

(declare-fun res!46155 () Bool)

(assert (=> b!55417 (=> (not res!46155) (not e!36932))))

(assert (=> b!55417 (= res!46155 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 thiss!1379))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!11166 res!46158) b!55417))

(assert (= (and b!55417 res!46155) b!55412))

(assert (= (and b!55412 (not res!46156)) b!55415))

(assert (= (and b!55415 (not res!46159)) b!55411))

(assert (= (and b!55411 res!46153) b!55416))

(assert (= (and b!55411 (not res!46161)) b!55413))

(assert (= (and b!55413 (not res!46157)) b!55408))

(assert (= (and b!55408 (not res!46160)) b!55409))

(assert (= (and b!55409 (not res!46154)) b!55410))

(assert (= start!11166 b!55414))

(declare-fun m!87283 () Bool)

(assert (=> b!55417 m!87283))

(declare-fun m!87285 () Bool)

(assert (=> b!55415 m!87285))

(declare-fun m!87287 () Bool)

(assert (=> b!55415 m!87287))

(declare-fun m!87289 () Bool)

(assert (=> b!55415 m!87289))

(declare-fun m!87291 () Bool)

(assert (=> b!55415 m!87291))

(assert (=> b!55415 m!87287))

(declare-fun m!87293 () Bool)

(assert (=> b!55415 m!87293))

(declare-fun m!87295 () Bool)

(assert (=> b!55411 m!87295))

(declare-fun m!87297 () Bool)

(assert (=> b!55411 m!87297))

(declare-fun m!87299 () Bool)

(assert (=> b!55411 m!87299))

(declare-fun m!87301 () Bool)

(assert (=> b!55411 m!87301))

(declare-fun m!87303 () Bool)

(assert (=> b!55411 m!87303))

(declare-fun m!87305 () Bool)

(assert (=> b!55411 m!87305))

(declare-fun m!87307 () Bool)

(assert (=> b!55411 m!87307))

(declare-fun m!87309 () Bool)

(assert (=> b!55416 m!87309))

(assert (=> b!55416 m!87309))

(declare-fun m!87311 () Bool)

(assert (=> b!55416 m!87311))

(declare-fun m!87313 () Bool)

(assert (=> b!55416 m!87313))

(assert (=> b!55416 m!87313))

(declare-fun m!87315 () Bool)

(assert (=> b!55416 m!87315))

(declare-fun m!87317 () Bool)

(assert (=> b!55414 m!87317))

(declare-fun m!87319 () Bool)

(assert (=> b!55413 m!87319))

(declare-fun m!87321 () Bool)

(assert (=> start!11166 m!87321))

(declare-fun m!87323 () Bool)

(assert (=> start!11166 m!87323))

(declare-fun m!87325 () Bool)

(assert (=> b!55408 m!87325))

(declare-fun m!87327 () Bool)

(assert (=> b!55412 m!87327))

(declare-fun m!87329 () Bool)

(assert (=> b!55412 m!87329))

(declare-fun m!87331 () Bool)

(assert (=> b!55412 m!87331))

(push 1)

(assert (not b!55411))

(assert (not b!55416))

(assert (not b!55417))

(assert (not b!55414))

(assert (not b!55415))

(assert (not b!55412))

(assert (not b!55408))

(assert (not start!11166))

(assert (not b!55413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17682 () Bool)

(declare-fun e!37023 () Bool)

(assert (=> d!17682 e!37023))

(declare-fun res!46265 () Bool)

(assert (=> d!17682 (=> (not res!46265) (not e!37023))))

(declare-fun lt!86612 () (_ BitVec 64))

(declare-fun lt!86609 () (_ BitVec 64))

(declare-fun lt!86611 () (_ BitVec 64))

(assert (=> d!17682 (= res!46265 (= lt!86609 (bvsub lt!86611 lt!86612)))))

(assert (=> d!17682 (or (= (bvand lt!86611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86612 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86611 lt!86612) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17682 (= lt!86612 (remainingBits!0 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86474)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86474))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86474)))))))

(declare-fun lt!86614 () (_ BitVec 64))

(declare-fun lt!86610 () (_ BitVec 64))

(assert (=> d!17682 (= lt!86611 (bvmul lt!86614 lt!86610))))

(assert (=> d!17682 (or (= lt!86614 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!86610 (bvsdiv (bvmul lt!86614 lt!86610) lt!86614)))))

(assert (=> d!17682 (= lt!86610 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17682 (= lt!86614 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86474)))))))

(assert (=> d!17682 (= lt!86609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86474))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86474)))))))

(assert (=> d!17682 (invariant!0 (currentBit!3115 (_2!2638 lt!86474)) (currentByte!3120 (_2!2638 lt!86474)) (size!1175 (buf!1538 (_2!2638 lt!86474))))))

(assert (=> d!17682 (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86474))) (currentByte!3120 (_2!2638 lt!86474)) (currentBit!3115 (_2!2638 lt!86474))) lt!86609)))

(declare-fun b!55526 () Bool)

(declare-fun res!46264 () Bool)

(assert (=> b!55526 (=> (not res!46264) (not e!37023))))

(assert (=> b!55526 (= res!46264 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!86609))))

(declare-fun b!55527 () Bool)

(declare-fun lt!86613 () (_ BitVec 64))

(assert (=> b!55527 (= e!37023 (bvsle lt!86609 (bvmul lt!86613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55527 (or (= lt!86613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!86613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!86613)))))

(assert (=> b!55527 (= lt!86613 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86474)))))))

(assert (= (and d!17682 res!46265) b!55526))

(assert (= (and b!55526 res!46264) b!55527))

(declare-fun m!87467 () Bool)

(assert (=> d!17682 m!87467))

(assert (=> d!17682 m!87325))

(assert (=> b!55413 d!17682))

(declare-fun d!17684 () Bool)

(assert (=> d!17684 (= (invariant!0 (currentBit!3115 (_2!2638 lt!86474)) (currentByte!3120 (_2!2638 lt!86474)) (size!1175 (buf!1538 (_2!2638 lt!86474)))) (and (bvsge (currentBit!3115 (_2!2638 lt!86474)) #b00000000000000000000000000000000) (bvslt (currentBit!3115 (_2!2638 lt!86474)) #b00000000000000000000000000001000) (bvsge (currentByte!3120 (_2!2638 lt!86474)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3120 (_2!2638 lt!86474)) (size!1175 (buf!1538 (_2!2638 lt!86474)))) (and (= (currentBit!3115 (_2!2638 lt!86474)) #b00000000000000000000000000000000) (= (currentByte!3120 (_2!2638 lt!86474)) (size!1175 (buf!1538 (_2!2638 lt!86474))))))))))

(assert (=> b!55408 d!17684))

(declare-fun b!55547 () Bool)

(declare-fun e!37033 () Unit!3829)

(declare-fun Unit!3843 () Unit!3829)

(assert (=> b!55547 (= e!37033 Unit!3843)))

(declare-fun d!17686 () Bool)

(declare-fun e!37032 () Bool)

(assert (=> d!17686 e!37032))

(declare-fun res!46282 () Bool)

(assert (=> d!17686 (=> (not res!46282) (not e!37032))))

(declare-fun lt!86674 () tuple2!5056)

(assert (=> d!17686 (= res!46282 (isPrefixOf!0 (_1!2639 lt!86674) (_2!2639 lt!86674)))))

(declare-fun lt!86668 () BitStream!2038)

(assert (=> d!17686 (= lt!86674 (tuple2!5057 lt!86668 (_2!2638 lt!86479)))))

(declare-fun lt!86673 () Unit!3829)

(declare-fun lt!86680 () Unit!3829)

(assert (=> d!17686 (= lt!86673 lt!86680)))

(assert (=> d!17686 (isPrefixOf!0 lt!86668 (_2!2638 lt!86479))))

(assert (=> d!17686 (= lt!86680 (lemmaIsPrefixTransitive!0 lt!86668 (_2!2638 lt!86479) (_2!2638 lt!86479)))))

(declare-fun lt!86678 () Unit!3829)

(declare-fun lt!86669 () Unit!3829)

(assert (=> d!17686 (= lt!86678 lt!86669)))

(assert (=> d!17686 (isPrefixOf!0 lt!86668 (_2!2638 lt!86479))))

(assert (=> d!17686 (= lt!86669 (lemmaIsPrefixTransitive!0 lt!86668 thiss!1379 (_2!2638 lt!86479)))))

(declare-fun lt!86671 () Unit!3829)

(assert (=> d!17686 (= lt!86671 e!37033)))

(declare-fun c!3960 () Bool)

(assert (=> d!17686 (= c!3960 (not (= (size!1175 (buf!1538 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!86667 () Unit!3829)

(declare-fun lt!86672 () Unit!3829)

(assert (=> d!17686 (= lt!86667 lt!86672)))

(assert (=> d!17686 (isPrefixOf!0 (_2!2638 lt!86479) (_2!2638 lt!86479))))

(assert (=> d!17686 (= lt!86672 (lemmaIsPrefixRefl!0 (_2!2638 lt!86479)))))

(declare-fun lt!86681 () Unit!3829)

(declare-fun lt!86686 () Unit!3829)

(assert (=> d!17686 (= lt!86681 lt!86686)))

(assert (=> d!17686 (= lt!86686 (lemmaIsPrefixRefl!0 (_2!2638 lt!86479)))))

(declare-fun lt!86677 () Unit!3829)

(declare-fun lt!86685 () Unit!3829)

(assert (=> d!17686 (= lt!86677 lt!86685)))

(assert (=> d!17686 (isPrefixOf!0 lt!86668 lt!86668)))

(assert (=> d!17686 (= lt!86685 (lemmaIsPrefixRefl!0 lt!86668))))

(declare-fun lt!86670 () Unit!3829)

(declare-fun lt!86682 () Unit!3829)

(assert (=> d!17686 (= lt!86670 lt!86682)))

(assert (=> d!17686 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17686 (= lt!86682 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17686 (= lt!86668 (BitStream!2039 (buf!1538 (_2!2638 lt!86479)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)))))

(assert (=> d!17686 (isPrefixOf!0 thiss!1379 (_2!2638 lt!86479))))

(assert (=> d!17686 (= (reader!0 thiss!1379 (_2!2638 lt!86479)) lt!86674)))

(declare-fun b!55548 () Bool)

(declare-fun lt!86683 () Unit!3829)

(assert (=> b!55548 (= e!37033 lt!86683)))

(declare-fun lt!86675 () (_ BitVec 64))

(assert (=> b!55548 (= lt!86675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86676 () (_ BitVec 64))

(assert (=> b!55548 (= lt!86676 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2581 array!2581 (_ BitVec 64) (_ BitVec 64)) Unit!3829)

(assert (=> b!55548 (= lt!86683 (arrayBitRangesEqSymmetric!0 (buf!1538 thiss!1379) (buf!1538 (_2!2638 lt!86479)) lt!86675 lt!86676))))

(declare-fun arrayBitRangesEq!0 (array!2581 array!2581 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55548 (arrayBitRangesEq!0 (buf!1538 (_2!2638 lt!86479)) (buf!1538 thiss!1379) lt!86675 lt!86676)))

(declare-fun b!55549 () Bool)

(declare-fun res!46280 () Bool)

(assert (=> b!55549 (=> (not res!46280) (not e!37032))))

(assert (=> b!55549 (= res!46280 (isPrefixOf!0 (_1!2639 lt!86674) thiss!1379))))

(declare-fun b!55550 () Bool)

(declare-fun res!46281 () Bool)

(assert (=> b!55550 (=> (not res!46281) (not e!37032))))

(assert (=> b!55550 (= res!46281 (isPrefixOf!0 (_2!2639 lt!86674) (_2!2638 lt!86479)))))

(declare-fun b!55551 () Bool)

(declare-fun lt!86684 () (_ BitVec 64))

(declare-fun lt!86679 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2038 (_ BitVec 64)) BitStream!2038)

(assert (=> b!55551 (= e!37032 (= (_1!2639 lt!86674) (withMovedBitIndex!0 (_2!2639 lt!86674) (bvsub lt!86679 lt!86684))))))

(assert (=> b!55551 (or (= (bvand lt!86679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!86684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!86679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!86679 lt!86684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55551 (= lt!86684 (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479))))))

(assert (=> b!55551 (= lt!86679 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)))))

(assert (= (and d!17686 c!3960) b!55548))

(assert (= (and d!17686 (not c!3960)) b!55547))

(assert (= (and d!17686 res!46282) b!55549))

(assert (= (and b!55549 res!46280) b!55550))

(assert (= (and b!55550 res!46281) b!55551))

(assert (=> b!55548 m!87331))

(declare-fun m!87469 () Bool)

(assert (=> b!55548 m!87469))

(declare-fun m!87471 () Bool)

(assert (=> b!55548 m!87471))

(declare-fun m!87473 () Bool)

(assert (=> b!55551 m!87473))

(declare-fun m!87475 () Bool)

(assert (=> b!55551 m!87475))

(assert (=> b!55551 m!87331))

(assert (=> d!17686 m!87327))

(declare-fun m!87477 () Bool)

(assert (=> d!17686 m!87477))

(declare-fun m!87479 () Bool)

(assert (=> d!17686 m!87479))

(declare-fun m!87481 () Bool)

(assert (=> d!17686 m!87481))

(assert (=> d!17686 m!87329))

(assert (=> d!17686 m!87289))

(declare-fun m!87483 () Bool)

(assert (=> d!17686 m!87483))

(declare-fun m!87485 () Bool)

(assert (=> d!17686 m!87485))

(declare-fun m!87487 () Bool)

(assert (=> d!17686 m!87487))

(declare-fun m!87489 () Bool)

(assert (=> d!17686 m!87489))

(declare-fun m!87491 () Bool)

(assert (=> d!17686 m!87491))

(declare-fun m!87493 () Bool)

(assert (=> b!55549 m!87493))

(declare-fun m!87495 () Bool)

(assert (=> b!55550 m!87495))

(assert (=> b!55411 d!17686))

(declare-fun d!17688 () Bool)

(declare-fun e!37090 () Bool)

(assert (=> d!17688 e!37090))

(declare-fun res!46374 () Bool)

(assert (=> d!17688 (=> (not res!46374) (not e!37090))))

(declare-fun lt!87083 () (_ BitVec 64))

(declare-fun lt!87077 () tuple2!5054)

(assert (=> d!17688 (= res!46374 (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87077))) (currentByte!3120 (_2!2638 lt!87077)) (currentBit!3115 (_2!2638 lt!87077))) (bvsub lt!87083 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17688 (or (= (bvand lt!87083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87083 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!87063 () (_ BitVec 64))

(assert (=> d!17688 (= lt!87083 (bvadd lt!87063 to!314))))

(assert (=> d!17688 (or (not (= (bvand lt!87063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!87063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!87063 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17688 (= lt!87063 (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479))))))

(declare-fun e!37091 () tuple2!5054)

(assert (=> d!17688 (= lt!87077 e!37091)))

(declare-fun c!3978 () Bool)

(assert (=> d!17688 (= c!3978 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!87079 () Unit!3829)

(declare-fun lt!87090 () Unit!3829)

(assert (=> d!17688 (= lt!87079 lt!87090)))

(assert (=> d!17688 (isPrefixOf!0 (_2!2638 lt!86479) (_2!2638 lt!86479))))

(assert (=> d!17688 (= lt!87090 (lemmaIsPrefixRefl!0 (_2!2638 lt!86479)))))

(declare-fun lt!87072 () (_ BitVec 64))

(assert (=> d!17688 (= lt!87072 (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479))))))

(assert (=> d!17688 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17688 (= (appendBitsMSBFirstLoop!0 (_2!2638 lt!86479) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!87077)))

(declare-fun b!55674 () Bool)

(declare-fun lt!87056 () tuple2!5054)

(declare-fun Unit!3844 () Unit!3829)

(assert (=> b!55674 (= e!37091 (tuple2!5055 Unit!3844 (_2!2638 lt!87056)))))

(declare-fun lt!87084 () tuple2!5054)

(assert (=> b!55674 (= lt!87084 (appendBitFromByte!0 (_2!2638 lt!86479) (select (arr!1721 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!87091 () (_ BitVec 64))

(assert (=> b!55674 (= lt!87091 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87052 () (_ BitVec 64))

(assert (=> b!55674 (= lt!87052 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87068 () Unit!3829)

(assert (=> b!55674 (= lt!87068 (validateOffsetBitsIneqLemma!0 (_2!2638 lt!86479) (_2!2638 lt!87084) lt!87091 lt!87052))))

(assert (=> b!55674 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!87084)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!87084))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!87084))) (bvsub lt!87091 lt!87052))))

(declare-fun lt!87081 () Unit!3829)

(assert (=> b!55674 (= lt!87081 lt!87068)))

(declare-fun lt!87051 () tuple2!5056)

(declare-fun call!715 () tuple2!5056)

(assert (=> b!55674 (= lt!87051 call!715)))

(declare-fun lt!87069 () (_ BitVec 64))

(assert (=> b!55674 (= lt!87069 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87086 () Unit!3829)

(assert (=> b!55674 (= lt!87086 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2638 lt!86479) (buf!1538 (_2!2638 lt!87084)) lt!87069))))

(assert (=> b!55674 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!87084)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) lt!87069)))

(declare-fun lt!87088 () Unit!3829)

(assert (=> b!55674 (= lt!87088 lt!87086)))

(assert (=> b!55674 (= (head!413 (byteArrayBitContentToList!0 (_2!2638 lt!87084) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!413 (bitStreamReadBitsIntoList!0 (_2!2638 lt!87084) (_1!2639 lt!87051) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87057 () Unit!3829)

(declare-fun Unit!3845 () Unit!3829)

(assert (=> b!55674 (= lt!87057 Unit!3845)))

(assert (=> b!55674 (= lt!87056 (appendBitsMSBFirstLoop!0 (_2!2638 lt!87084) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!87085 () Unit!3829)

(assert (=> b!55674 (= lt!87085 (lemmaIsPrefixTransitive!0 (_2!2638 lt!86479) (_2!2638 lt!87084) (_2!2638 lt!87056)))))

(assert (=> b!55674 (isPrefixOf!0 (_2!2638 lt!86479) (_2!2638 lt!87056))))

(declare-fun lt!87087 () Unit!3829)

(assert (=> b!55674 (= lt!87087 lt!87085)))

(assert (=> b!55674 (= (size!1175 (buf!1538 (_2!2638 lt!87056))) (size!1175 (buf!1538 (_2!2638 lt!86479))))))

(declare-fun lt!87066 () Unit!3829)

(declare-fun Unit!3846 () Unit!3829)

(assert (=> b!55674 (= lt!87066 Unit!3846)))

(assert (=> b!55674 (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87056))) (currentByte!3120 (_2!2638 lt!87056)) (currentBit!3115 (_2!2638 lt!87056))) (bvsub (bvadd (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87049 () Unit!3829)

(declare-fun Unit!3847 () Unit!3829)

(assert (=> b!55674 (= lt!87049 Unit!3847)))

(assert (=> b!55674 (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87056))) (currentByte!3120 (_2!2638 lt!87056)) (currentBit!3115 (_2!2638 lt!87056))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87084))) (currentByte!3120 (_2!2638 lt!87084)) (currentBit!3115 (_2!2638 lt!87084))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87059 () Unit!3829)

(declare-fun Unit!3848 () Unit!3829)

(assert (=> b!55674 (= lt!87059 Unit!3848)))

(declare-fun lt!87067 () tuple2!5056)

(assert (=> b!55674 (= lt!87067 (reader!0 (_2!2638 lt!86479) (_2!2638 lt!87056)))))

(declare-fun lt!87073 () (_ BitVec 64))

(assert (=> b!55674 (= lt!87073 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87089 () Unit!3829)

(assert (=> b!55674 (= lt!87089 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2638 lt!86479) (buf!1538 (_2!2638 lt!87056)) lt!87073))))

(assert (=> b!55674 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!87056)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) lt!87073)))

(declare-fun lt!87060 () Unit!3829)

(assert (=> b!55674 (= lt!87060 lt!87089)))

(declare-fun lt!87053 () tuple2!5056)

(assert (=> b!55674 (= lt!87053 (reader!0 (_2!2638 lt!87084) (_2!2638 lt!87056)))))

(declare-fun lt!87055 () (_ BitVec 64))

(assert (=> b!55674 (= lt!87055 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87065 () Unit!3829)

(assert (=> b!55674 (= lt!87065 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2638 lt!87084) (buf!1538 (_2!2638 lt!87056)) lt!87055))))

(assert (=> b!55674 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!87056)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!87084))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!87084))) lt!87055)))

(declare-fun lt!87076 () Unit!3829)

(assert (=> b!55674 (= lt!87076 lt!87065)))

(declare-fun lt!87080 () List!594)

(assert (=> b!55674 (= lt!87080 (byteArrayBitContentToList!0 (_2!2638 lt!87056) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!87071 () List!594)

(assert (=> b!55674 (= lt!87071 (byteArrayBitContentToList!0 (_2!2638 lt!87056) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87054 () List!594)

(assert (=> b!55674 (= lt!87054 (bitStreamReadBitsIntoList!0 (_2!2638 lt!87056) (_1!2639 lt!87067) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!87070 () List!594)

(assert (=> b!55674 (= lt!87070 (bitStreamReadBitsIntoList!0 (_2!2638 lt!87056) (_1!2639 lt!87053) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!87058 () (_ BitVec 64))

(assert (=> b!55674 (= lt!87058 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!87078 () Unit!3829)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2038 BitStream!2038 BitStream!2038 BitStream!2038 (_ BitVec 64) List!594) Unit!3829)

(assert (=> b!55674 (= lt!87078 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2638 lt!87056) (_2!2638 lt!87056) (_1!2639 lt!87067) (_1!2639 lt!87053) lt!87058 lt!87054))))

(declare-fun tail!265 (List!594) List!594)

(assert (=> b!55674 (= (bitStreamReadBitsIntoList!0 (_2!2638 lt!87056) (_1!2639 lt!87053) (bvsub lt!87058 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!265 lt!87054))))

(declare-fun lt!87075 () Unit!3829)

(assert (=> b!55674 (= lt!87075 lt!87078)))

(declare-fun lt!87050 () Unit!3829)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2581 array!2581 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3829)

(assert (=> b!55674 (= lt!87050 (arrayBitRangesEqImpliesEq!0 (buf!1538 (_2!2638 lt!87084)) (buf!1538 (_2!2638 lt!87056)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!87072 (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87084))) (currentByte!3120 (_2!2638 lt!87084)) (currentBit!3115 (_2!2638 lt!87084)))))))

(declare-fun bitAt!0 (array!2581 (_ BitVec 64)) Bool)

(assert (=> b!55674 (= (bitAt!0 (buf!1538 (_2!2638 lt!87084)) lt!87072) (bitAt!0 (buf!1538 (_2!2638 lt!87056)) lt!87072))))

(declare-fun lt!87062 () Unit!3829)

(assert (=> b!55674 (= lt!87062 lt!87050)))

(declare-fun bm!712 () Bool)

(assert (=> bm!712 (= call!715 (reader!0 (_2!2638 lt!86479) (ite c!3978 (_2!2638 lt!87084) (_2!2638 lt!86479))))))

(declare-fun b!55675 () Bool)

(declare-fun res!46373 () Bool)

(assert (=> b!55675 (=> (not res!46373) (not e!37090))))

(assert (=> b!55675 (= res!46373 (isPrefixOf!0 (_2!2638 lt!86479) (_2!2638 lt!87077)))))

(declare-fun b!55676 () Bool)

(declare-fun res!46372 () Bool)

(assert (=> b!55676 (=> (not res!46372) (not e!37090))))

(assert (=> b!55676 (= res!46372 (= (size!1175 (buf!1538 (_2!2638 lt!86479))) (size!1175 (buf!1538 (_2!2638 lt!87077)))))))

(declare-fun b!55677 () Bool)

(declare-fun res!46371 () Bool)

(assert (=> b!55677 (=> (not res!46371) (not e!37090))))

(assert (=> b!55677 (= res!46371 (invariant!0 (currentBit!3115 (_2!2638 lt!87077)) (currentByte!3120 (_2!2638 lt!87077)) (size!1175 (buf!1538 (_2!2638 lt!87077)))))))

(declare-fun b!55678 () Bool)

(declare-fun e!37092 () Bool)

(declare-fun lt!87061 () (_ BitVec 64))

(assert (=> b!55678 (= e!37092 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) lt!87061))))

(declare-fun b!55679 () Bool)

(declare-fun lt!87048 () tuple2!5056)

(assert (=> b!55679 (= e!37090 (= (bitStreamReadBitsIntoList!0 (_2!2638 lt!87077) (_1!2639 lt!87048) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2638 lt!87077) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!55679 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55679 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!87082 () Unit!3829)

(declare-fun lt!87064 () Unit!3829)

(assert (=> b!55679 (= lt!87082 lt!87064)))

(assert (=> b!55679 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!87077)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) lt!87061)))

(assert (=> b!55679 (= lt!87064 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2638 lt!86479) (buf!1538 (_2!2638 lt!87077)) lt!87061))))

(assert (=> b!55679 e!37092))

(declare-fun res!46375 () Bool)

(assert (=> b!55679 (=> (not res!46375) (not e!37092))))

(assert (=> b!55679 (= res!46375 (and (= (size!1175 (buf!1538 (_2!2638 lt!86479))) (size!1175 (buf!1538 (_2!2638 lt!87077)))) (bvsge lt!87061 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55679 (= lt!87061 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!55679 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55679 (= lt!87048 (reader!0 (_2!2638 lt!86479) (_2!2638 lt!87077)))))

(declare-fun b!55680 () Bool)

(declare-fun res!46370 () Bool)

(assert (=> b!55680 (=> (not res!46370) (not e!37090))))

(assert (=> b!55680 (= res!46370 (= (size!1175 (buf!1538 (_2!2638 lt!87077))) (size!1175 (buf!1538 (_2!2638 lt!86479)))))))

(declare-fun b!55681 () Bool)

(declare-fun Unit!3851 () Unit!3829)

(assert (=> b!55681 (= e!37091 (tuple2!5055 Unit!3851 (_2!2638 lt!86479)))))

(assert (=> b!55681 (= (size!1175 (buf!1538 (_2!2638 lt!86479))) (size!1175 (buf!1538 (_2!2638 lt!86479))))))

(declare-fun lt!87074 () Unit!3829)

(declare-fun Unit!3852 () Unit!3829)

(assert (=> b!55681 (= lt!87074 Unit!3852)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2038 array!2581 array!2581 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5078 0))(
  ( (tuple2!5079 (_1!2650 array!2581) (_2!2650 BitStream!2038)) )
))
(declare-fun readBits!0 (BitStream!2038 (_ BitVec 64)) tuple2!5078)

(assert (=> b!55681 (checkByteArrayBitContent!0 (_2!2638 lt!86479) srcBuffer!2 (_1!2650 (readBits!0 (_1!2639 call!715) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!17688 c!3978) b!55674))

(assert (= (and d!17688 (not c!3978)) b!55681))

(assert (= (or b!55674 b!55681) bm!712))

(assert (= (and d!17688 res!46374) b!55677))

(assert (= (and b!55677 res!46371) b!55676))

(assert (= (and b!55676 res!46372) b!55675))

(assert (= (and b!55675 res!46373) b!55680))

(assert (= (and b!55680 res!46370) b!55679))

(assert (= (and b!55679 res!46375) b!55678))

(declare-fun m!87687 () Bool)

(assert (=> b!55681 m!87687))

(declare-fun m!87689 () Bool)

(assert (=> b!55681 m!87689))

(declare-fun m!87691 () Bool)

(assert (=> b!55678 m!87691))

(declare-fun m!87693 () Bool)

(assert (=> b!55674 m!87693))

(assert (=> b!55674 m!87475))

(declare-fun m!87695 () Bool)

(assert (=> b!55674 m!87695))

(declare-fun m!87697 () Bool)

(assert (=> b!55674 m!87697))

(declare-fun m!87699 () Bool)

(assert (=> b!55674 m!87699))

(declare-fun m!87701 () Bool)

(assert (=> b!55674 m!87701))

(declare-fun m!87703 () Bool)

(assert (=> b!55674 m!87703))

(declare-fun m!87705 () Bool)

(assert (=> b!55674 m!87705))

(declare-fun m!87707 () Bool)

(assert (=> b!55674 m!87707))

(assert (=> b!55674 m!87705))

(declare-fun m!87709 () Bool)

(assert (=> b!55674 m!87709))

(declare-fun m!87711 () Bool)

(assert (=> b!55674 m!87711))

(declare-fun m!87713 () Bool)

(assert (=> b!55674 m!87713))

(declare-fun m!87715 () Bool)

(assert (=> b!55674 m!87715))

(declare-fun m!87717 () Bool)

(assert (=> b!55674 m!87717))

(declare-fun m!87719 () Bool)

(assert (=> b!55674 m!87719))

(declare-fun m!87721 () Bool)

(assert (=> b!55674 m!87721))

(assert (=> b!55674 m!87717))

(declare-fun m!87723 () Bool)

(assert (=> b!55674 m!87723))

(declare-fun m!87725 () Bool)

(assert (=> b!55674 m!87725))

(declare-fun m!87727 () Bool)

(assert (=> b!55674 m!87727))

(declare-fun m!87729 () Bool)

(assert (=> b!55674 m!87729))

(declare-fun m!87731 () Bool)

(assert (=> b!55674 m!87731))

(declare-fun m!87733 () Bool)

(assert (=> b!55674 m!87733))

(declare-fun m!87735 () Bool)

(assert (=> b!55674 m!87735))

(declare-fun m!87737 () Bool)

(assert (=> b!55674 m!87737))

(declare-fun m!87739 () Bool)

(assert (=> b!55674 m!87739))

(declare-fun m!87741 () Bool)

(assert (=> b!55674 m!87741))

(declare-fun m!87743 () Bool)

(assert (=> b!55674 m!87743))

(declare-fun m!87745 () Bool)

(assert (=> b!55674 m!87745))

(assert (=> b!55674 m!87703))

(declare-fun m!87747 () Bool)

(assert (=> b!55674 m!87747))

(declare-fun m!87749 () Bool)

(assert (=> b!55674 m!87749))

(assert (=> b!55674 m!87745))

(declare-fun m!87751 () Bool)

(assert (=> b!55674 m!87751))

(declare-fun m!87753 () Bool)

(assert (=> b!55674 m!87753))

(declare-fun m!87755 () Bool)

(assert (=> b!55677 m!87755))

(declare-fun m!87757 () Bool)

(assert (=> d!17688 m!87757))

(assert (=> d!17688 m!87475))

(assert (=> d!17688 m!87487))

(assert (=> d!17688 m!87485))

(declare-fun m!87759 () Bool)

(assert (=> bm!712 m!87759))

(declare-fun m!87761 () Bool)

(assert (=> b!55675 m!87761))

(declare-fun m!87763 () Bool)

(assert (=> b!55679 m!87763))

(declare-fun m!87765 () Bool)

(assert (=> b!55679 m!87765))

(declare-fun m!87767 () Bool)

(assert (=> b!55679 m!87767))

(declare-fun m!87769 () Bool)

(assert (=> b!55679 m!87769))

(declare-fun m!87771 () Bool)

(assert (=> b!55679 m!87771))

(assert (=> b!55411 d!17688))

(declare-fun d!17732 () Bool)

(assert (=> d!17732 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87148 () Unit!3829)

(declare-fun choose!9 (BitStream!2038 array!2581 (_ BitVec 64) BitStream!2038) Unit!3829)

(assert (=> d!17732 (= lt!87148 (choose!9 thiss!1379 (buf!1538 (_2!2638 lt!86479)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2039 (buf!1538 (_2!2638 lt!86479)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379))))))

(assert (=> d!17732 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1538 (_2!2638 lt!86479)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87148)))

(declare-fun bs!4453 () Bool)

(assert (= bs!4453 d!17732))

(assert (=> bs!4453 m!87307))

(declare-fun m!87773 () Bool)

(assert (=> bs!4453 m!87773))

(assert (=> b!55411 d!17732))

(declare-fun d!17734 () Bool)

(assert (=> d!17734 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4454 () Bool)

(assert (= bs!4454 d!17734))

(declare-fun m!87775 () Bool)

(assert (=> bs!4454 m!87775))

(assert (=> b!55411 d!17734))

(declare-fun d!17736 () Bool)

(declare-fun res!46394 () Bool)

(declare-fun e!37104 () Bool)

(assert (=> d!17736 (=> (not res!46394) (not e!37104))))

(assert (=> d!17736 (= res!46394 (= (size!1175 (buf!1538 thiss!1379)) (size!1175 (buf!1538 (_2!2638 lt!86474)))))))

(assert (=> d!17736 (= (isPrefixOf!0 thiss!1379 (_2!2638 lt!86474)) e!37104)))

(declare-fun b!55704 () Bool)

(declare-fun res!46395 () Bool)

(assert (=> b!55704 (=> (not res!46395) (not e!37104))))

(assert (=> b!55704 (= res!46395 (bvsle (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)) (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86474))) (currentByte!3120 (_2!2638 lt!86474)) (currentBit!3115 (_2!2638 lt!86474)))))))

(declare-fun b!55705 () Bool)

(declare-fun e!37103 () Bool)

(assert (=> b!55705 (= e!37104 e!37103)))

(declare-fun res!46396 () Bool)

(assert (=> b!55705 (=> res!46396 e!37103)))

(assert (=> b!55705 (= res!46396 (= (size!1175 (buf!1538 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55706 () Bool)

(assert (=> b!55706 (= e!37103 (arrayBitRangesEq!0 (buf!1538 thiss!1379) (buf!1538 (_2!2638 lt!86474)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379))))))

(assert (= (and d!17736 res!46394) b!55704))

(assert (= (and b!55704 res!46395) b!55705))

(assert (= (and b!55705 (not res!46396)) b!55706))

(assert (=> b!55704 m!87331))

(assert (=> b!55704 m!87319))

(assert (=> b!55706 m!87331))

(assert (=> b!55706 m!87331))

(declare-fun m!87777 () Bool)

(assert (=> b!55706 m!87777))

(assert (=> b!55411 d!17736))

(declare-fun d!17738 () Bool)

(declare-fun res!46397 () Bool)

(declare-fun e!37106 () Bool)

(assert (=> d!17738 (=> (not res!46397) (not e!37106))))

(assert (=> d!17738 (= res!46397 (= (size!1175 (buf!1538 (_2!2638 lt!86479))) (size!1175 (buf!1538 (_2!2638 lt!86474)))))))

(assert (=> d!17738 (= (isPrefixOf!0 (_2!2638 lt!86479) (_2!2638 lt!86474)) e!37106)))

(declare-fun b!55707 () Bool)

(declare-fun res!46398 () Bool)

(assert (=> b!55707 (=> (not res!46398) (not e!37106))))

(assert (=> b!55707 (= res!46398 (bvsle (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479))) (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86474))) (currentByte!3120 (_2!2638 lt!86474)) (currentBit!3115 (_2!2638 lt!86474)))))))

(declare-fun b!55708 () Bool)

(declare-fun e!37105 () Bool)

(assert (=> b!55708 (= e!37106 e!37105)))

(declare-fun res!46399 () Bool)

(assert (=> b!55708 (=> res!46399 e!37105)))

(assert (=> b!55708 (= res!46399 (= (size!1175 (buf!1538 (_2!2638 lt!86479))) #b00000000000000000000000000000000))))

(declare-fun b!55709 () Bool)

(assert (=> b!55709 (= e!37105 (arrayBitRangesEq!0 (buf!1538 (_2!2638 lt!86479)) (buf!1538 (_2!2638 lt!86474)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479)))))))

(assert (= (and d!17738 res!46397) b!55707))

(assert (= (and b!55707 res!46398) b!55708))

(assert (= (and b!55708 (not res!46399)) b!55709))

(assert (=> b!55707 m!87475))

(assert (=> b!55707 m!87319))

(assert (=> b!55709 m!87475))

(assert (=> b!55709 m!87475))

(declare-fun m!87779 () Bool)

(assert (=> b!55709 m!87779))

(assert (=> b!55411 d!17738))

(declare-fun d!17740 () Bool)

(assert (=> d!17740 (isPrefixOf!0 thiss!1379 (_2!2638 lt!86474))))

(declare-fun lt!87185 () Unit!3829)

(declare-fun choose!30 (BitStream!2038 BitStream!2038 BitStream!2038) Unit!3829)

(assert (=> d!17740 (= lt!87185 (choose!30 thiss!1379 (_2!2638 lt!86479) (_2!2638 lt!86474)))))

(assert (=> d!17740 (isPrefixOf!0 thiss!1379 (_2!2638 lt!86479))))

(assert (=> d!17740 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2638 lt!86479) (_2!2638 lt!86474)) lt!87185)))

(declare-fun bs!4455 () Bool)

(assert (= bs!4455 d!17740))

(assert (=> bs!4455 m!87295))

(declare-fun m!87781 () Bool)

(assert (=> bs!4455 m!87781))

(assert (=> bs!4455 m!87289))

(assert (=> b!55411 d!17740))

(declare-fun d!17742 () Bool)

(assert (=> d!17742 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 thiss!1379))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1175 (buf!1538 thiss!1379))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4456 () Bool)

(assert (= bs!4456 d!17742))

(declare-fun m!87783 () Bool)

(assert (=> bs!4456 m!87783))

(assert (=> b!55417 d!17742))

(declare-fun d!17744 () Bool)

(declare-fun res!46400 () Bool)

(declare-fun e!37108 () Bool)

(assert (=> d!17744 (=> (not res!46400) (not e!37108))))

(assert (=> d!17744 (= res!46400 (= (size!1175 (buf!1538 thiss!1379)) (size!1175 (buf!1538 thiss!1379))))))

(assert (=> d!17744 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37108)))

(declare-fun b!55710 () Bool)

(declare-fun res!46401 () Bool)

(assert (=> b!55710 (=> (not res!46401) (not e!37108))))

(assert (=> b!55710 (= res!46401 (bvsle (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)) (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379))))))

(declare-fun b!55711 () Bool)

(declare-fun e!37107 () Bool)

(assert (=> b!55711 (= e!37108 e!37107)))

(declare-fun res!46402 () Bool)

(assert (=> b!55711 (=> res!46402 e!37107)))

(assert (=> b!55711 (= res!46402 (= (size!1175 (buf!1538 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55712 () Bool)

(assert (=> b!55712 (= e!37107 (arrayBitRangesEq!0 (buf!1538 thiss!1379) (buf!1538 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379))))))

(assert (= (and d!17744 res!46400) b!55710))

(assert (= (and b!55710 res!46401) b!55711))

(assert (= (and b!55711 (not res!46402)) b!55712))

(assert (=> b!55710 m!87331))

(assert (=> b!55710 m!87331))

(assert (=> b!55712 m!87331))

(assert (=> b!55712 m!87331))

(declare-fun m!87785 () Bool)

(assert (=> b!55712 m!87785))

(assert (=> b!55412 d!17744))

(declare-fun d!17746 () Bool)

(assert (=> d!17746 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!87188 () Unit!3829)

(declare-fun choose!11 (BitStream!2038) Unit!3829)

(assert (=> d!17746 (= lt!87188 (choose!11 thiss!1379))))

(assert (=> d!17746 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!87188)))

(declare-fun bs!4458 () Bool)

(assert (= bs!4458 d!17746))

(assert (=> bs!4458 m!87327))

(declare-fun m!87787 () Bool)

(assert (=> bs!4458 m!87787))

(assert (=> b!55412 d!17746))

(declare-fun d!17748 () Bool)

(declare-fun e!37109 () Bool)

(assert (=> d!17748 e!37109))

(declare-fun res!46404 () Bool)

(assert (=> d!17748 (=> (not res!46404) (not e!37109))))

(declare-fun lt!87189 () (_ BitVec 64))

(declare-fun lt!87191 () (_ BitVec 64))

(declare-fun lt!87192 () (_ BitVec 64))

(assert (=> d!17748 (= res!46404 (= lt!87189 (bvsub lt!87191 lt!87192)))))

(assert (=> d!17748 (or (= (bvand lt!87191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87191 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87191 lt!87192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17748 (= lt!87192 (remainingBits!0 ((_ sign_extend 32) (size!1175 (buf!1538 thiss!1379))) ((_ sign_extend 32) (currentByte!3120 thiss!1379)) ((_ sign_extend 32) (currentBit!3115 thiss!1379))))))

(declare-fun lt!87194 () (_ BitVec 64))

(declare-fun lt!87190 () (_ BitVec 64))

(assert (=> d!17748 (= lt!87191 (bvmul lt!87194 lt!87190))))

(assert (=> d!17748 (or (= lt!87194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!87190 (bvsdiv (bvmul lt!87194 lt!87190) lt!87194)))))

(assert (=> d!17748 (= lt!87190 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17748 (= lt!87194 ((_ sign_extend 32) (size!1175 (buf!1538 thiss!1379))))))

(assert (=> d!17748 (= lt!87189 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3120 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3115 thiss!1379))))))

(assert (=> d!17748 (invariant!0 (currentBit!3115 thiss!1379) (currentByte!3120 thiss!1379) (size!1175 (buf!1538 thiss!1379)))))

(assert (=> d!17748 (= (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)) lt!87189)))

(declare-fun b!55713 () Bool)

(declare-fun res!46403 () Bool)

(assert (=> b!55713 (=> (not res!46403) (not e!37109))))

(assert (=> b!55713 (= res!46403 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!87189))))

(declare-fun b!55714 () Bool)

(declare-fun lt!87193 () (_ BitVec 64))

(assert (=> b!55714 (= e!37109 (bvsle lt!87189 (bvmul lt!87193 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55714 (or (= lt!87193 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!87193 #b0000000000000000000000000000000000000000000000000000000000001000) lt!87193)))))

(assert (=> b!55714 (= lt!87193 ((_ sign_extend 32) (size!1175 (buf!1538 thiss!1379))))))

(assert (= (and d!17748 res!46404) b!55713))

(assert (= (and b!55713 res!46403) b!55714))

(assert (=> d!17748 m!87783))

(declare-fun m!87789 () Bool)

(assert (=> d!17748 m!87789))

(assert (=> b!55412 d!17748))

(declare-fun d!17750 () Bool)

(assert (=> d!17750 (= (array_inv!1078 srcBuffer!2) (bvsge (size!1175 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11166 d!17750))

(declare-fun d!17752 () Bool)

(assert (=> d!17752 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3115 thiss!1379) (currentByte!3120 thiss!1379) (size!1175 (buf!1538 thiss!1379))))))

(declare-fun bs!4459 () Bool)

(assert (= bs!4459 d!17752))

(assert (=> bs!4459 m!87789))

(assert (=> start!11166 d!17752))

(declare-fun d!17754 () Bool)

(declare-fun res!46405 () Bool)

(declare-fun e!37111 () Bool)

(assert (=> d!17754 (=> (not res!46405) (not e!37111))))

(assert (=> d!17754 (= res!46405 (= (size!1175 (buf!1538 thiss!1379)) (size!1175 (buf!1538 (_2!2638 lt!86479)))))))

(assert (=> d!17754 (= (isPrefixOf!0 thiss!1379 (_2!2638 lt!86479)) e!37111)))

(declare-fun b!55715 () Bool)

(declare-fun res!46406 () Bool)

(assert (=> b!55715 (=> (not res!46406) (not e!37111))))

(assert (=> b!55715 (= res!46406 (bvsle (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)) (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!86479))) (currentByte!3120 (_2!2638 lt!86479)) (currentBit!3115 (_2!2638 lt!86479)))))))

(declare-fun b!55716 () Bool)

(declare-fun e!37110 () Bool)

(assert (=> b!55716 (= e!37111 e!37110)))

(declare-fun res!46407 () Bool)

(assert (=> b!55716 (=> res!46407 e!37110)))

(assert (=> b!55716 (= res!46407 (= (size!1175 (buf!1538 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55717 () Bool)

(assert (=> b!55717 (= e!37110 (arrayBitRangesEq!0 (buf!1538 thiss!1379) (buf!1538 (_2!2638 lt!86479)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379))))))

(assert (= (and d!17754 res!46405) b!55715))

(assert (= (and b!55715 res!46406) b!55716))

(assert (= (and b!55716 (not res!46407)) b!55717))

(assert (=> b!55715 m!87331))

(assert (=> b!55715 m!87475))

(assert (=> b!55717 m!87331))

(assert (=> b!55717 m!87331))

(declare-fun m!87791 () Bool)

(assert (=> b!55717 m!87791))

(assert (=> b!55415 d!17754))

(declare-fun d!17756 () Bool)

(assert (=> d!17756 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4460 () Bool)

(assert (= bs!4460 d!17756))

(declare-fun m!87793 () Bool)

(assert (=> bs!4460 m!87793))

(assert (=> b!55415 d!17756))

(declare-fun d!17758 () Bool)

(declare-fun e!37117 () Bool)

(assert (=> d!17758 e!37117))

(declare-fun res!46416 () Bool)

(assert (=> d!17758 (=> (not res!46416) (not e!37117))))

(assert (=> d!17758 (= res!46416 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!87241 () Unit!3829)

(declare-fun choose!27 (BitStream!2038 BitStream!2038 (_ BitVec 64) (_ BitVec 64)) Unit!3829)

(assert (=> d!17758 (= lt!87241 (choose!27 thiss!1379 (_2!2638 lt!86479) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17758 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17758 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2638 lt!86479) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87241)))

(declare-fun b!55728 () Bool)

(assert (=> b!55728 (= e!37117 (validate_offset_bits!1 ((_ sign_extend 32) (size!1175 (buf!1538 (_2!2638 lt!86479)))) ((_ sign_extend 32) (currentByte!3120 (_2!2638 lt!86479))) ((_ sign_extend 32) (currentBit!3115 (_2!2638 lt!86479))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17758 res!46416) b!55728))

(declare-fun m!87863 () Bool)

(assert (=> d!17758 m!87863))

(assert (=> b!55728 m!87285))

(assert (=> b!55415 d!17758))

(declare-fun b!55785 () Bool)

(declare-fun e!37148 () Bool)

(declare-datatypes ((tuple2!5080 0))(
  ( (tuple2!5081 (_1!2651 BitStream!2038) (_2!2651 Bool)) )
))
(declare-fun lt!87346 () tuple2!5080)

(declare-fun lt!87341 () tuple2!5054)

(assert (=> b!55785 (= e!37148 (= (bitIndex!0 (size!1175 (buf!1538 (_1!2651 lt!87346))) (currentByte!3120 (_1!2651 lt!87346)) (currentBit!3115 (_1!2651 lt!87346))) (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87341))) (currentByte!3120 (_2!2638 lt!87341)) (currentBit!3115 (_2!2638 lt!87341)))))))

(declare-fun b!55786 () Bool)

(declare-fun res!46450 () Bool)

(declare-fun e!37145 () Bool)

(assert (=> b!55786 (=> (not res!46450) (not e!37145))))

(declare-fun lt!87344 () tuple2!5054)

(assert (=> b!55786 (= res!46450 (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87344))) (currentByte!3120 (_2!2638 lt!87344)) (currentBit!3115 (_2!2638 lt!87344))) (bvadd (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!17760 () Bool)

(declare-fun e!37147 () Bool)

(assert (=> d!17760 e!37147))

(declare-fun res!46448 () Bool)

(assert (=> d!17760 (=> (not res!46448) (not e!37147))))

(assert (=> d!17760 (= res!46448 (= (size!1175 (buf!1538 (_2!2638 lt!87341))) (size!1175 (buf!1538 thiss!1379))))))

(declare-fun lt!87348 () (_ BitVec 8))

(declare-fun lt!87345 () array!2581)

(assert (=> d!17760 (= lt!87348 (select (arr!1721 lt!87345) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17760 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1175 lt!87345)))))

(assert (=> d!17760 (= lt!87345 (array!2582 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!87343 () tuple2!5054)

(assert (=> d!17760 (= lt!87341 (tuple2!5055 (_1!2638 lt!87343) (_2!2638 lt!87343)))))

(assert (=> d!17760 (= lt!87343 lt!87344)))

(assert (=> d!17760 e!37145))

(declare-fun res!46454 () Bool)

(assert (=> d!17760 (=> (not res!46454) (not e!37145))))

(assert (=> d!17760 (= res!46454 (= (size!1175 (buf!1538 thiss!1379)) (size!1175 (buf!1538 (_2!2638 lt!87344)))))))

(declare-fun lt!87351 () Bool)

(declare-fun appendBit!0 (BitStream!2038 Bool) tuple2!5054)

(assert (=> d!17760 (= lt!87344 (appendBit!0 thiss!1379 lt!87351))))

(assert (=> d!17760 (= lt!87351 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1721 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17760 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17760 (= (appendBitFromByte!0 thiss!1379 (select (arr!1721 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!87341)))

(declare-fun b!55787 () Bool)

(declare-fun e!37146 () Bool)

(assert (=> b!55787 (= e!37145 e!37146)))

(declare-fun res!46453 () Bool)

(assert (=> b!55787 (=> (not res!46453) (not e!37146))))

(declare-fun lt!87349 () tuple2!5080)

(assert (=> b!55787 (= res!46453 (and (= (_2!2651 lt!87349) lt!87351) (= (_1!2651 lt!87349) (_2!2638 lt!87344))))))

(declare-fun readBitPure!0 (BitStream!2038) tuple2!5080)

(declare-fun readerFrom!0 (BitStream!2038 (_ BitVec 32) (_ BitVec 32)) BitStream!2038)

(assert (=> b!55787 (= lt!87349 (readBitPure!0 (readerFrom!0 (_2!2638 lt!87344) (currentBit!3115 thiss!1379) (currentByte!3120 thiss!1379))))))

(declare-fun b!55788 () Bool)

(assert (=> b!55788 (= e!37146 (= (bitIndex!0 (size!1175 (buf!1538 (_1!2651 lt!87349))) (currentByte!3120 (_1!2651 lt!87349)) (currentBit!3115 (_1!2651 lt!87349))) (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87344))) (currentByte!3120 (_2!2638 lt!87344)) (currentBit!3115 (_2!2638 lt!87344)))))))

(declare-fun b!55789 () Bool)

(declare-fun res!46449 () Bool)

(assert (=> b!55789 (=> (not res!46449) (not e!37147))))

(declare-fun lt!87350 () (_ BitVec 64))

(declare-fun lt!87342 () (_ BitVec 64))

(assert (=> b!55789 (= res!46449 (= (bitIndex!0 (size!1175 (buf!1538 (_2!2638 lt!87341))) (currentByte!3120 (_2!2638 lt!87341)) (currentBit!3115 (_2!2638 lt!87341))) (bvadd lt!87350 lt!87342)))))

(assert (=> b!55789 (or (not (= (bvand lt!87350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87342 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!87350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!87350 lt!87342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!55789 (= lt!87342 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!55789 (= lt!87350 (bitIndex!0 (size!1175 (buf!1538 thiss!1379)) (currentByte!3120 thiss!1379) (currentBit!3115 thiss!1379)))))

(declare-fun b!55790 () Bool)

(assert (=> b!55790 (= e!37147 e!37148)))

(declare-fun res!46455 () Bool)

(assert (=> b!55790 (=> (not res!46455) (not e!37148))))

(assert (=> b!55790 (= res!46455 (and (= (_2!2651 lt!87346) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1721 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!87348)) #b00000000000000000000000000000000))) (= (_1!2651 lt!87346) (_2!2638 lt!87341))))))

(declare-fun lt!87352 () tuple2!5078)

(declare-fun lt!87347 () BitStream!2038)

(assert (=> b!55790 (= lt!87352 (readBits!0 lt!87347 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!55790 (= lt!87346 (readBitPure!0 lt!87347))))

(assert (=> b!55790 (= lt!87347 (readerFrom!0 (_2!2638 lt!87341) (currentBit!3115 thiss!1379) (currentByte!3120 thiss!1379)))))

(declare-fun b!55791 () Bool)

(declare-fun res!46452 () Bool)

(assert (=> b!55791 (=> (not res!46452) (not e!37147))))

(assert (=> b!55791 (= res!46452 (isPrefixOf!0 thiss!1379 (_2!2638 lt!87341)))))

(declare-fun b!55792 () Bool)

(declare-fun res!46451 () Bool)

(assert (=> b!55792 (=> (not res!46451) (not e!37145))))

(assert (=> b!55792 (= res!46451 (isPrefixOf!0 thiss!1379 (_2!2638 lt!87344)))))

(assert (= (and d!17760 res!46454) b!55786))

(assert (= (and b!55786 res!46450) b!55792))

(assert (= (and b!55792 res!46451) b!55787))

(assert (= (and b!55787 res!46453) b!55788))

(assert (= (and d!17760 res!46448) b!55789))

(assert (= (and b!55789 res!46449) b!55791))

(assert (= (and b!55791 res!46452) b!55790))

(assert (= (and b!55790 res!46455) b!55785))

(declare-fun m!87929 () Bool)

(assert (=> d!17760 m!87929))

(declare-fun m!87931 () Bool)

(assert (=> d!17760 m!87931))

(declare-fun m!87933 () Bool)

(assert (=> d!17760 m!87933))

(declare-fun m!87935 () Bool)

(assert (=> b!55792 m!87935))

(declare-fun m!87937 () Bool)

(assert (=> b!55788 m!87937))

(declare-fun m!87939 () Bool)

(assert (=> b!55788 m!87939))

(declare-fun m!87941 () Bool)

(assert (=> b!55791 m!87941))

(declare-fun m!87943 () Bool)

(assert (=> b!55789 m!87943))

(assert (=> b!55789 m!87331))

(declare-fun m!87945 () Bool)

(assert (=> b!55787 m!87945))

(assert (=> b!55787 m!87945))

(declare-fun m!87947 () Bool)

(assert (=> b!55787 m!87947))

(assert (=> b!55786 m!87939))

(assert (=> b!55786 m!87331))

(declare-fun m!87949 () Bool)

(assert (=> b!55785 m!87949))

(assert (=> b!55785 m!87943))

(declare-fun m!87951 () Bool)

(assert (=> b!55790 m!87951))

(declare-fun m!87953 () Bool)

(assert (=> b!55790 m!87953))

(declare-fun m!87955 () Bool)

(assert (=> b!55790 m!87955))

(assert (=> b!55415 d!17760))

(declare-fun d!17784 () Bool)

(assert (=> d!17784 (= (head!413 (byteArrayBitContentToList!0 (_2!2638 lt!86479) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!709 (byteArrayBitContentToList!0 (_2!2638 lt!86479) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55416 d!17784))

(declare-fun d!17786 () Bool)

(declare-fun c!3996 () Bool)

(assert (=> d!17786 (= c!3996 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37151 () List!594)

(assert (=> d!17786 (= (byteArrayBitContentToList!0 (_2!2638 lt!86479) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37151)))

(declare-fun b!55797 () Bool)

(assert (=> b!55797 (= e!37151 Nil!591)))

(declare-fun b!55798 () Bool)

(assert (=> b!55798 (= e!37151 (Cons!590 (not (= (bvand ((_ sign_extend 24) (select (arr!1721 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2638 lt!86479) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17786 c!3996) b!55797))

(assert (= (and d!17786 (not c!3996)) b!55798))

(assert (=> b!55798 m!87287))

(assert (=> b!55798 m!87933))

(declare-fun m!87957 () Bool)

(assert (=> b!55798 m!87957))

(assert (=> b!55416 d!17786))

(declare-fun d!17788 () Bool)

(assert (=> d!17788 (= (head!413 (bitStreamReadBitsIntoList!0 (_2!2638 lt!86479) (_1!2639 lt!86473) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!709 (bitStreamReadBitsIntoList!0 (_2!2638 lt!86479) (_1!2639 lt!86473) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55416 d!17788))

(declare-datatypes ((tuple2!5082 0))(
  ( (tuple2!5083 (_1!2652 List!594) (_2!2652 BitStream!2038)) )
))
(declare-fun e!37157 () tuple2!5082)

(declare-datatypes ((tuple2!5084 0))(
  ( (tuple2!5085 (_1!2653 Bool) (_2!2653 BitStream!2038)) )
))
(declare-fun lt!87360 () tuple2!5084)

(declare-fun lt!87361 () (_ BitVec 64))

(declare-fun b!55808 () Bool)

(assert (=> b!55808 (= e!37157 (tuple2!5083 (Cons!590 (_1!2653 lt!87360) (bitStreamReadBitsIntoList!0 (_2!2638 lt!86479) (_2!2653 lt!87360) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!87361))) (_2!2653 lt!87360)))))

(declare-fun readBit!0 (BitStream!2038) tuple2!5084)

(assert (=> b!55808 (= lt!87360 (readBit!0 (_1!2639 lt!86473)))))

(assert (=> b!55808 (= lt!87361 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!55810 () Bool)

(declare-fun e!37156 () Bool)

(declare-fun lt!87359 () List!594)

(declare-fun length!277 (List!594) Int)

(assert (=> b!55810 (= e!37156 (> (length!277 lt!87359) 0))))

(declare-fun b!55809 () Bool)

(declare-fun isEmpty!163 (List!594) Bool)

(assert (=> b!55809 (= e!37156 (isEmpty!163 lt!87359))))

(declare-fun d!17790 () Bool)

(assert (=> d!17790 e!37156))

(declare-fun c!4002 () Bool)

(assert (=> d!17790 (= c!4002 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17790 (= lt!87359 (_1!2652 e!37157))))

(declare-fun c!4001 () Bool)

(assert (=> d!17790 (= c!4001 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17790 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17790 (= (bitStreamReadBitsIntoList!0 (_2!2638 lt!86479) (_1!2639 lt!86473) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87359)))

(declare-fun b!55807 () Bool)

(assert (=> b!55807 (= e!37157 (tuple2!5083 Nil!591 (_1!2639 lt!86473)))))

(assert (= (and d!17790 c!4001) b!55807))

(assert (= (and d!17790 (not c!4001)) b!55808))

(assert (= (and d!17790 c!4002) b!55809))

(assert (= (and d!17790 (not c!4002)) b!55810))

(declare-fun m!87959 () Bool)

(assert (=> b!55808 m!87959))

(declare-fun m!87961 () Bool)

(assert (=> b!55808 m!87961))

(declare-fun m!87963 () Bool)

(assert (=> b!55810 m!87963))

(declare-fun m!87965 () Bool)

(assert (=> b!55809 m!87965))

(assert (=> b!55416 d!17790))

(declare-fun d!17792 () Bool)

(assert (=> d!17792 (= (array_inv!1078 (buf!1538 thiss!1379)) (bvsge (size!1175 (buf!1538 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!55414 d!17792))

(push 1)

(assert (not d!17748))

(assert (not b!55707))

(assert (not b!55681))

(assert (not d!17732))

(assert (not d!17760))

(assert (not d!17742))

(assert (not b!55678))

(assert (not b!55786))

(assert (not b!55551))

(assert (not b!55789))

(assert (not b!55675))

(assert (not b!55810))

(assert (not b!55704))

(assert (not b!55790))

(assert (not bm!712))

(assert (not d!17734))

(assert (not b!55808))

(assert (not b!55791))

(assert (not b!55709))

(assert (not b!55788))

(assert (not b!55710))

(assert (not d!17752))

(assert (not b!55728))

(assert (not b!55548))

(assert (not b!55717))

(assert (not b!55550))

(assert (not d!17686))

(assert (not b!55677))

(assert (not b!55549))

(assert (not b!55792))

(assert (not b!55679))

(assert (not b!55798))

(assert (not b!55787))

(assert (not d!17740))

(assert (not b!55706))

(assert (not b!55674))

(assert (not d!17756))

(assert (not d!17688))

(assert (not b!55809))

(assert (not d!17758))

(assert (not d!17682))

(assert (not b!55712))

(assert (not d!17746))

(assert (not b!55715))

(assert (not b!55785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

