; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9160 () Bool)

(assert start!9160)

(declare-fun b!45408 () Bool)

(declare-fun res!38405 () Bool)

(declare-fun e!30226 () Bool)

(assert (=> b!45408 (=> (not res!38405) (not e!30226))))

(declare-datatypes ((array!2265 0))(
  ( (array!2266 (arr!1536 (Array (_ BitVec 32) (_ BitVec 8))) (size!1019 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1782 0))(
  ( (BitStream!1783 (buf!1368 array!2265) (currentByte!2861 (_ BitVec 32)) (currentBit!2856 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1782)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45408 (= res!38405 (validate_offset_bits!1 ((_ sign_extend 32) (size!1019 (buf!1368 thiss!1379))) ((_ sign_extend 32) (currentByte!2861 thiss!1379)) ((_ sign_extend 32) (currentBit!2856 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2265)

(declare-fun e!30229 () Bool)

(declare-datatypes ((Unit!3228 0))(
  ( (Unit!3229) )
))
(declare-datatypes ((tuple2!4432 0))(
  ( (tuple2!4433 (_1!2309 Unit!3228) (_2!2309 BitStream!1782)) )
))
(declare-fun lt!69726 () tuple2!4432)

(declare-datatypes ((tuple2!4434 0))(
  ( (tuple2!4435 (_1!2310 BitStream!1782) (_2!2310 BitStream!1782)) )
))
(declare-fun lt!69718 () tuple2!4434)

(declare-fun b!45409 () Bool)

(declare-datatypes ((List!532 0))(
  ( (Nil!529) (Cons!528 (h!647 Bool) (t!1282 List!532)) )
))
(declare-fun head!351 (List!532) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1782 array!2265 (_ BitVec 64) (_ BitVec 64)) List!532)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1782 BitStream!1782 (_ BitVec 64)) List!532)

(assert (=> b!45409 (= e!30229 (= (head!351 (byteArrayBitContentToList!0 (_2!2309 lt!69726) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!351 (bitStreamReadBitsIntoList!0 (_2!2309 lt!69726) (_1!2310 lt!69718) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45410 () Bool)

(declare-fun e!30224 () Bool)

(declare-fun array_inv!944 (array!2265) Bool)

(assert (=> b!45410 (= e!30224 (array_inv!944 (buf!1368 thiss!1379)))))

(declare-fun b!45411 () Bool)

(declare-fun e!30233 () Bool)

(declare-fun e!30225 () Bool)

(assert (=> b!45411 (= e!30233 e!30225)))

(declare-fun res!38409 () Bool)

(assert (=> b!45411 (=> res!38409 e!30225)))

(declare-fun lt!69724 () tuple2!4432)

(declare-fun isPrefixOf!0 (BitStream!1782 BitStream!1782) Bool)

(assert (=> b!45411 (= res!38409 (not (isPrefixOf!0 (_2!2309 lt!69726) (_2!2309 lt!69724))))))

(assert (=> b!45411 (isPrefixOf!0 thiss!1379 (_2!2309 lt!69724))))

(declare-fun lt!69716 () Unit!3228)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1782 BitStream!1782 BitStream!1782) Unit!3228)

(assert (=> b!45411 (= lt!69716 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2309 lt!69726) (_2!2309 lt!69724)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1782 array!2265 (_ BitVec 64) (_ BitVec 64)) tuple2!4432)

(assert (=> b!45411 (= lt!69724 (appendBitsMSBFirstLoop!0 (_2!2309 lt!69726) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!45411 e!30229))

(declare-fun res!38406 () Bool)

(assert (=> b!45411 (=> (not res!38406) (not e!30229))))

(assert (=> b!45411 (= res!38406 (validate_offset_bits!1 ((_ sign_extend 32) (size!1019 (buf!1368 (_2!2309 lt!69726)))) ((_ sign_extend 32) (currentByte!2861 thiss!1379)) ((_ sign_extend 32) (currentBit!2856 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69725 () Unit!3228)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1782 array!2265 (_ BitVec 64)) Unit!3228)

(assert (=> b!45411 (= lt!69725 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1368 (_2!2309 lt!69726)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1782 BitStream!1782) tuple2!4434)

(assert (=> b!45411 (= lt!69718 (reader!0 thiss!1379 (_2!2309 lt!69726)))))

(declare-fun b!45412 () Bool)

(declare-fun e!30223 () Bool)

(assert (=> b!45412 (= e!30225 e!30223)))

(declare-fun res!38411 () Bool)

(assert (=> b!45412 (=> res!38411 e!30223)))

(declare-fun lt!69727 () (_ BitVec 64))

(declare-fun lt!69730 () (_ BitVec 64))

(assert (=> b!45412 (= res!38411 (not (= lt!69730 (bvsub (bvadd lt!69727 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45412 (= lt!69730 (bitIndex!0 (size!1019 (buf!1368 (_2!2309 lt!69724))) (currentByte!2861 (_2!2309 lt!69724)) (currentBit!2856 (_2!2309 lt!69724))))))

(declare-fun res!38400 () Bool)

(assert (=> start!9160 (=> (not res!38400) (not e!30226))))

(assert (=> start!9160 (= res!38400 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1019 srcBuffer!2))))))))

(assert (=> start!9160 e!30226))

(assert (=> start!9160 true))

(assert (=> start!9160 (array_inv!944 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1782) Bool)

(assert (=> start!9160 (and (inv!12 thiss!1379) e!30224)))

(declare-fun b!45413 () Bool)

(declare-fun e!30227 () Bool)

(assert (=> b!45413 (= e!30227 (= lt!69730 (bvsub (bvsub (bvadd (bitIndex!0 (size!1019 (buf!1368 (_2!2309 lt!69726))) (currentByte!2861 (_2!2309 lt!69726)) (currentBit!2856 (_2!2309 lt!69726))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45414 () Bool)

(declare-fun e!30230 () Bool)

(assert (=> b!45414 (= e!30230 e!30233)))

(declare-fun res!38403 () Bool)

(assert (=> b!45414 (=> res!38403 e!30233)))

(assert (=> b!45414 (= res!38403 (not (isPrefixOf!0 thiss!1379 (_2!2309 lt!69726))))))

(declare-fun lt!69717 () (_ BitVec 64))

(assert (=> b!45414 (validate_offset_bits!1 ((_ sign_extend 32) (size!1019 (buf!1368 (_2!2309 lt!69726)))) ((_ sign_extend 32) (currentByte!2861 (_2!2309 lt!69726))) ((_ sign_extend 32) (currentBit!2856 (_2!2309 lt!69726))) lt!69717)))

(assert (=> b!45414 (= lt!69717 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69719 () Unit!3228)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1782 BitStream!1782 (_ BitVec 64) (_ BitVec 64)) Unit!3228)

(assert (=> b!45414 (= lt!69719 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2309 lt!69726) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1782 (_ BitVec 8) (_ BitVec 32)) tuple2!4432)

(assert (=> b!45414 (= lt!69726 (appendBitFromByte!0 thiss!1379 (select (arr!1536 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45415 () Bool)

(declare-fun e!30232 () Bool)

(assert (=> b!45415 (= e!30232 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!69729 () tuple2!4434)

(declare-fun lt!69722 () List!532)

(assert (=> b!45415 (= lt!69722 (bitStreamReadBitsIntoList!0 (_2!2309 lt!69724) (_1!2310 lt!69729) lt!69717))))

(declare-fun lt!69715 () List!532)

(declare-fun lt!69728 () tuple2!4434)

(assert (=> b!45415 (= lt!69715 (bitStreamReadBitsIntoList!0 (_2!2309 lt!69724) (_1!2310 lt!69728) (bvsub to!314 i!635)))))

(assert (=> b!45415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1019 (buf!1368 (_2!2309 lt!69724)))) ((_ sign_extend 32) (currentByte!2861 (_2!2309 lt!69726))) ((_ sign_extend 32) (currentBit!2856 (_2!2309 lt!69726))) lt!69717)))

(declare-fun lt!69720 () Unit!3228)

(assert (=> b!45415 (= lt!69720 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2309 lt!69726) (buf!1368 (_2!2309 lt!69724)) lt!69717))))

(assert (=> b!45415 (= lt!69729 (reader!0 (_2!2309 lt!69726) (_2!2309 lt!69724)))))

(assert (=> b!45415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1019 (buf!1368 (_2!2309 lt!69724)))) ((_ sign_extend 32) (currentByte!2861 thiss!1379)) ((_ sign_extend 32) (currentBit!2856 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!69723 () Unit!3228)

(assert (=> b!45415 (= lt!69723 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1368 (_2!2309 lt!69724)) (bvsub to!314 i!635)))))

(assert (=> b!45415 (= lt!69728 (reader!0 thiss!1379 (_2!2309 lt!69724)))))

(declare-fun b!45416 () Bool)

(declare-fun res!38404 () Bool)

(assert (=> b!45416 (=> res!38404 e!30223)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45416 (= res!38404 (not (invariant!0 (currentBit!2856 (_2!2309 lt!69724)) (currentByte!2861 (_2!2309 lt!69724)) (size!1019 (buf!1368 (_2!2309 lt!69724))))))))

(declare-fun b!45417 () Bool)

(declare-fun res!38408 () Bool)

(assert (=> b!45417 (=> res!38408 e!30232)))

(assert (=> b!45417 (= res!38408 (not (invariant!0 (currentBit!2856 (_2!2309 lt!69726)) (currentByte!2861 (_2!2309 lt!69726)) (size!1019 (buf!1368 (_2!2309 lt!69724))))))))

(declare-fun b!45418 () Bool)

(declare-fun res!38412 () Bool)

(assert (=> b!45418 (=> res!38412 e!30232)))

(assert (=> b!45418 (= res!38412 (not (invariant!0 (currentBit!2856 (_2!2309 lt!69726)) (currentByte!2861 (_2!2309 lt!69726)) (size!1019 (buf!1368 (_2!2309 lt!69726))))))))

(declare-fun b!45419 () Bool)

(declare-fun res!38402 () Bool)

(assert (=> b!45419 (=> res!38402 e!30223)))

(assert (=> b!45419 (= res!38402 (not (= (size!1019 (buf!1368 thiss!1379)) (size!1019 (buf!1368 (_2!2309 lt!69724))))))))

(declare-fun b!45420 () Bool)

(assert (=> b!45420 (= e!30226 (not e!30230))))

(declare-fun res!38407 () Bool)

(assert (=> b!45420 (=> res!38407 e!30230)))

(assert (=> b!45420 (= res!38407 (bvsge i!635 to!314))))

(assert (=> b!45420 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69721 () Unit!3228)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1782) Unit!3228)

(assert (=> b!45420 (= lt!69721 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!45420 (= lt!69727 (bitIndex!0 (size!1019 (buf!1368 thiss!1379)) (currentByte!2861 thiss!1379) (currentBit!2856 thiss!1379)))))

(declare-fun b!45421 () Bool)

(assert (=> b!45421 (= e!30223 e!30232)))

(declare-fun res!38410 () Bool)

(assert (=> b!45421 (=> res!38410 e!30232)))

(assert (=> b!45421 (= res!38410 (not (= (size!1019 (buf!1368 (_2!2309 lt!69726))) (size!1019 (buf!1368 (_2!2309 lt!69724))))))))

(assert (=> b!45421 e!30227))

(declare-fun res!38401 () Bool)

(assert (=> b!45421 (=> (not res!38401) (not e!30227))))

(assert (=> b!45421 (= res!38401 (= (size!1019 (buf!1368 (_2!2309 lt!69724))) (size!1019 (buf!1368 thiss!1379))))))

(assert (= (and start!9160 res!38400) b!45408))

(assert (= (and b!45408 res!38405) b!45420))

(assert (= (and b!45420 (not res!38407)) b!45414))

(assert (= (and b!45414 (not res!38403)) b!45411))

(assert (= (and b!45411 res!38406) b!45409))

(assert (= (and b!45411 (not res!38409)) b!45412))

(assert (= (and b!45412 (not res!38411)) b!45416))

(assert (= (and b!45416 (not res!38404)) b!45419))

(assert (= (and b!45419 (not res!38402)) b!45421))

(assert (= (and b!45421 res!38401) b!45413))

(assert (= (and b!45421 (not res!38410)) b!45418))

(assert (= (and b!45418 (not res!38412)) b!45417))

(assert (= (and b!45417 (not res!38408)) b!45415))

(assert (= start!9160 b!45410))

(declare-fun m!69271 () Bool)

(assert (=> b!45417 m!69271))

(declare-fun m!69273 () Bool)

(assert (=> b!45416 m!69273))

(declare-fun m!69275 () Bool)

(assert (=> b!45411 m!69275))

(declare-fun m!69277 () Bool)

(assert (=> b!45411 m!69277))

(declare-fun m!69279 () Bool)

(assert (=> b!45411 m!69279))

(declare-fun m!69281 () Bool)

(assert (=> b!45411 m!69281))

(declare-fun m!69283 () Bool)

(assert (=> b!45411 m!69283))

(declare-fun m!69285 () Bool)

(assert (=> b!45411 m!69285))

(declare-fun m!69287 () Bool)

(assert (=> b!45411 m!69287))

(declare-fun m!69289 () Bool)

(assert (=> start!9160 m!69289))

(declare-fun m!69291 () Bool)

(assert (=> start!9160 m!69291))

(declare-fun m!69293 () Bool)

(assert (=> b!45415 m!69293))

(declare-fun m!69295 () Bool)

(assert (=> b!45415 m!69295))

(declare-fun m!69297 () Bool)

(assert (=> b!45415 m!69297))

(declare-fun m!69299 () Bool)

(assert (=> b!45415 m!69299))

(declare-fun m!69301 () Bool)

(assert (=> b!45415 m!69301))

(declare-fun m!69303 () Bool)

(assert (=> b!45415 m!69303))

(declare-fun m!69305 () Bool)

(assert (=> b!45415 m!69305))

(declare-fun m!69307 () Bool)

(assert (=> b!45415 m!69307))

(declare-fun m!69309 () Bool)

(assert (=> b!45413 m!69309))

(declare-fun m!69311 () Bool)

(assert (=> b!45410 m!69311))

(declare-fun m!69313 () Bool)

(assert (=> b!45408 m!69313))

(declare-fun m!69315 () Bool)

(assert (=> b!45414 m!69315))

(declare-fun m!69317 () Bool)

(assert (=> b!45414 m!69317))

(declare-fun m!69319 () Bool)

(assert (=> b!45414 m!69319))

(declare-fun m!69321 () Bool)

(assert (=> b!45414 m!69321))

(assert (=> b!45414 m!69317))

(declare-fun m!69323 () Bool)

(assert (=> b!45414 m!69323))

(declare-fun m!69325 () Bool)

(assert (=> b!45412 m!69325))

(declare-fun m!69327 () Bool)

(assert (=> b!45409 m!69327))

(assert (=> b!45409 m!69327))

(declare-fun m!69329 () Bool)

(assert (=> b!45409 m!69329))

(declare-fun m!69331 () Bool)

(assert (=> b!45409 m!69331))

(assert (=> b!45409 m!69331))

(declare-fun m!69333 () Bool)

(assert (=> b!45409 m!69333))

(declare-fun m!69335 () Bool)

(assert (=> b!45420 m!69335))

(declare-fun m!69337 () Bool)

(assert (=> b!45420 m!69337))

(declare-fun m!69339 () Bool)

(assert (=> b!45420 m!69339))

(declare-fun m!69341 () Bool)

(assert (=> b!45418 m!69341))

(check-sat (not b!45413) (not b!45416) (not b!45408) (not b!45418) (not start!9160) (not b!45411) (not b!45410) (not b!45417) (not b!45414) (not b!45409) (not b!45412) (not b!45415) (not b!45420))
(check-sat)
