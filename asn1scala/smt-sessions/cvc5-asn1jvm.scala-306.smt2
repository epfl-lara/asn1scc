; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6008 () Bool)

(assert start!6008)

(declare-fun b!28128 () Bool)

(declare-fun res!24407 () Bool)

(declare-fun e!18959 () Bool)

(assert (=> b!28128 (=> res!24407 e!18959)))

(declare-datatypes ((array!1745 0))(
  ( (array!1746 (arr!1217 (Array (_ BitVec 32) (_ BitVec 8))) (size!755 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1342 0))(
  ( (BitStream!1343 (buf!1082 array!1745) (currentByte!2407 (_ BitVec 32)) (currentBit!2402 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1342)

(declare-datatypes ((Unit!2213 0))(
  ( (Unit!2214) )
))
(declare-datatypes ((tuple2!3050 0))(
  ( (tuple2!3051 (_1!1612 Unit!2213) (_2!1612 BitStream!1342)) )
))
(declare-fun lt!39611 () tuple2!3050)

(assert (=> b!28128 (= res!24407 (not (= (size!755 (buf!1082 thiss!1379)) (size!755 (buf!1082 (_2!1612 lt!39611))))))))

(declare-fun b!28130 () Bool)

(declare-fun res!24405 () Bool)

(declare-fun e!18961 () Bool)

(assert (=> b!28130 (=> res!24405 e!18961)))

(declare-fun lt!39612 () tuple2!3050)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28130 (= res!24405 (not (invariant!0 (currentBit!2402 (_2!1612 lt!39612)) (currentByte!2407 (_2!1612 lt!39612)) (size!755 (buf!1082 (_2!1612 lt!39612))))))))

(declare-fun b!28131 () Bool)

(declare-fun res!24396 () Bool)

(assert (=> b!28131 (=> res!24396 e!18961)))

(assert (=> b!28131 (= res!24396 (not (invariant!0 (currentBit!2402 (_2!1612 lt!39612)) (currentByte!2407 (_2!1612 lt!39612)) (size!755 (buf!1082 (_2!1612 lt!39611))))))))

(declare-fun b!28132 () Bool)

(declare-fun e!18963 () Bool)

(declare-fun array_inv!724 (array!1745) Bool)

(assert (=> b!28132 (= e!18963 (array_inv!724 (buf!1082 thiss!1379)))))

(declare-fun b!28133 () Bool)

(declare-fun res!24394 () Bool)

(declare-fun e!18956 () Bool)

(assert (=> b!28133 (=> (not res!24394) (not e!18956))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28133 (= res!24394 (validate_offset_bits!1 ((_ sign_extend 32) (size!755 (buf!1082 thiss!1379))) ((_ sign_extend 32) (currentByte!2407 thiss!1379)) ((_ sign_extend 32) (currentBit!2402 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28134 () Bool)

(declare-fun res!24398 () Bool)

(declare-fun e!18953 () Bool)

(assert (=> b!28134 (=> res!24398 e!18953)))

(declare-datatypes ((tuple2!3052 0))(
  ( (tuple2!3053 (_1!1613 BitStream!1342) (_2!1613 BitStream!1342)) )
))
(declare-fun lt!39619 () tuple2!3052)

(declare-fun lt!39622 () tuple2!3052)

(declare-fun lt!39614 () (_ BitVec 64))

(assert (=> b!28134 (= res!24398 (or (not (= (buf!1082 (_1!1613 lt!39619)) (buf!1082 (_1!1613 lt!39622)))) (not (= (buf!1082 (_1!1613 lt!39619)) (buf!1082 (_2!1612 lt!39611)))) (bvsge lt!39614 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!28135 () Bool)

(assert (=> b!28135 (= e!18953 true)))

(declare-fun lt!39621 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28135 (= lt!39621 (bitIndex!0 (size!755 (buf!1082 (_1!1613 lt!39622))) (currentByte!2407 (_1!1613 lt!39622)) (currentBit!2402 (_1!1613 lt!39622))))))

(declare-fun lt!39609 () (_ BitVec 64))

(assert (=> b!28135 (= lt!39609 (bitIndex!0 (size!755 (buf!1082 (_1!1613 lt!39619))) (currentByte!2407 (_1!1613 lt!39619)) (currentBit!2402 (_1!1613 lt!39619))))))

(declare-fun b!28129 () Bool)

(declare-fun e!18954 () Bool)

(declare-fun e!18964 () Bool)

(assert (=> b!28129 (= e!18954 e!18964)))

(declare-fun res!24399 () Bool)

(assert (=> b!28129 (=> res!24399 e!18964)))

(declare-fun isPrefixOf!0 (BitStream!1342 BitStream!1342) Bool)

(assert (=> b!28129 (= res!24399 (not (isPrefixOf!0 thiss!1379 (_2!1612 lt!39612))))))

(declare-fun lt!39605 () (_ BitVec 64))

(assert (=> b!28129 (validate_offset_bits!1 ((_ sign_extend 32) (size!755 (buf!1082 (_2!1612 lt!39612)))) ((_ sign_extend 32) (currentByte!2407 (_2!1612 lt!39612))) ((_ sign_extend 32) (currentBit!2402 (_2!1612 lt!39612))) lt!39605)))

(assert (=> b!28129 (= lt!39605 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39606 () Unit!2213)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1342 BitStream!1342 (_ BitVec 64) (_ BitVec 64)) Unit!2213)

(assert (=> b!28129 (= lt!39606 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1612 lt!39612) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1745)

(declare-fun appendBitFromByte!0 (BitStream!1342 (_ BitVec 8) (_ BitVec 32)) tuple2!3050)

(assert (=> b!28129 (= lt!39612 (appendBitFromByte!0 thiss!1379 (select (arr!1217 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!24392 () Bool)

(assert (=> start!6008 (=> (not res!24392) (not e!18956))))

(assert (=> start!6008 (= res!24392 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!755 srcBuffer!2))))))))

(assert (=> start!6008 e!18956))

(assert (=> start!6008 true))

(assert (=> start!6008 (array_inv!724 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1342) Bool)

(assert (=> start!6008 (and (inv!12 thiss!1379) e!18963)))

(declare-fun b!28136 () Bool)

(assert (=> b!28136 (= e!18961 e!18953)))

(declare-fun res!24402 () Bool)

(assert (=> b!28136 (=> res!24402 e!18953)))

(assert (=> b!28136 (= res!24402 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!372 0))(
  ( (Nil!369) (Cons!368 (h!487 Bool) (t!1122 List!372)) )
))
(declare-fun lt!39618 () List!372)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1342 BitStream!1342 (_ BitVec 64)) List!372)

(assert (=> b!28136 (= lt!39618 (bitStreamReadBitsIntoList!0 (_2!1612 lt!39611) (_1!1613 lt!39622) lt!39605))))

(declare-fun lt!39607 () List!372)

(assert (=> b!28136 (= lt!39607 (bitStreamReadBitsIntoList!0 (_2!1612 lt!39611) (_1!1613 lt!39619) (bvsub to!314 i!635)))))

(assert (=> b!28136 (validate_offset_bits!1 ((_ sign_extend 32) (size!755 (buf!1082 (_2!1612 lt!39611)))) ((_ sign_extend 32) (currentByte!2407 (_2!1612 lt!39612))) ((_ sign_extend 32) (currentBit!2402 (_2!1612 lt!39612))) lt!39605)))

(declare-fun lt!39615 () Unit!2213)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1342 array!1745 (_ BitVec 64)) Unit!2213)

(assert (=> b!28136 (= lt!39615 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1612 lt!39612) (buf!1082 (_2!1612 lt!39611)) lt!39605))))

(declare-fun reader!0 (BitStream!1342 BitStream!1342) tuple2!3052)

(assert (=> b!28136 (= lt!39622 (reader!0 (_2!1612 lt!39612) (_2!1612 lt!39611)))))

(assert (=> b!28136 (validate_offset_bits!1 ((_ sign_extend 32) (size!755 (buf!1082 (_2!1612 lt!39611)))) ((_ sign_extend 32) (currentByte!2407 thiss!1379)) ((_ sign_extend 32) (currentBit!2402 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39608 () Unit!2213)

(assert (=> b!28136 (= lt!39608 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1082 (_2!1612 lt!39611)) (bvsub to!314 i!635)))))

(assert (=> b!28136 (= lt!39619 (reader!0 thiss!1379 (_2!1612 lt!39611)))))

(declare-fun b!28137 () Bool)

(declare-fun e!18955 () Bool)

(assert (=> b!28137 (= e!18964 e!18955)))

(declare-fun res!24401 () Bool)

(assert (=> b!28137 (=> res!24401 e!18955)))

(assert (=> b!28137 (= res!24401 (not (isPrefixOf!0 (_2!1612 lt!39612) (_2!1612 lt!39611))))))

(assert (=> b!28137 (isPrefixOf!0 thiss!1379 (_2!1612 lt!39611))))

(declare-fun lt!39610 () Unit!2213)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1342 BitStream!1342 BitStream!1342) Unit!2213)

(assert (=> b!28137 (= lt!39610 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1612 lt!39612) (_2!1612 lt!39611)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1342 array!1745 (_ BitVec 64) (_ BitVec 64)) tuple2!3050)

(assert (=> b!28137 (= lt!39611 (appendBitsMSBFirstLoop!0 (_2!1612 lt!39612) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18958 () Bool)

(assert (=> b!28137 e!18958))

(declare-fun res!24408 () Bool)

(assert (=> b!28137 (=> (not res!24408) (not e!18958))))

(assert (=> b!28137 (= res!24408 (validate_offset_bits!1 ((_ sign_extend 32) (size!755 (buf!1082 (_2!1612 lt!39612)))) ((_ sign_extend 32) (currentByte!2407 thiss!1379)) ((_ sign_extend 32) (currentBit!2402 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39617 () Unit!2213)

(assert (=> b!28137 (= lt!39617 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1082 (_2!1612 lt!39612)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39613 () tuple2!3052)

(assert (=> b!28137 (= lt!39613 (reader!0 thiss!1379 (_2!1612 lt!39612)))))

(declare-fun b!28138 () Bool)

(declare-fun head!209 (List!372) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1342 array!1745 (_ BitVec 64) (_ BitVec 64)) List!372)

(assert (=> b!28138 (= e!18958 (= (head!209 (byteArrayBitContentToList!0 (_2!1612 lt!39612) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!209 (bitStreamReadBitsIntoList!0 (_2!1612 lt!39612) (_1!1613 lt!39613) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!28139 () Bool)

(assert (=> b!28139 (= e!18955 e!18959)))

(declare-fun res!24395 () Bool)

(assert (=> b!28139 (=> res!24395 e!18959)))

(declare-fun lt!39620 () (_ BitVec 64))

(assert (=> b!28139 (= res!24395 (not (= lt!39614 (bvsub (bvadd lt!39620 to!314) i!635))))))

(assert (=> b!28139 (= lt!39614 (bitIndex!0 (size!755 (buf!1082 (_2!1612 lt!39611))) (currentByte!2407 (_2!1612 lt!39611)) (currentBit!2402 (_2!1612 lt!39611))))))

(declare-fun b!28140 () Bool)

(declare-fun res!24393 () Bool)

(assert (=> b!28140 (=> res!24393 e!18953)))

(assert (=> b!28140 (= res!24393 (not (isPrefixOf!0 (_1!1613 lt!39622) (_2!1612 lt!39611))))))

(declare-fun b!28141 () Bool)

(declare-fun e!18960 () Bool)

(assert (=> b!28141 (= e!18960 (= lt!39614 (bvsub (bvsub (bvadd (bitIndex!0 (size!755 (buf!1082 (_2!1612 lt!39612))) (currentByte!2407 (_2!1612 lt!39612)) (currentBit!2402 (_2!1612 lt!39612))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28142 () Bool)

(assert (=> b!28142 (= e!18956 (not e!18954))))

(declare-fun res!24391 () Bool)

(assert (=> b!28142 (=> res!24391 e!18954)))

(assert (=> b!28142 (= res!24391 (bvsge i!635 to!314))))

(assert (=> b!28142 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39616 () Unit!2213)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1342) Unit!2213)

(assert (=> b!28142 (= lt!39616 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28142 (= lt!39620 (bitIndex!0 (size!755 (buf!1082 thiss!1379)) (currentByte!2407 thiss!1379) (currentBit!2402 thiss!1379)))))

(declare-fun b!28143 () Bool)

(declare-fun res!24406 () Bool)

(assert (=> b!28143 (=> res!24406 e!18953)))

(assert (=> b!28143 (= res!24406 (not (isPrefixOf!0 (_1!1613 lt!39619) (_1!1613 lt!39622))))))

(declare-fun b!28144 () Bool)

(declare-fun res!24404 () Bool)

(assert (=> b!28144 (=> res!24404 e!18953)))

(assert (=> b!28144 (= res!24404 (not (isPrefixOf!0 (_1!1613 lt!39619) (_2!1612 lt!39611))))))

(declare-fun b!28145 () Bool)

(assert (=> b!28145 (= e!18959 e!18961)))

(declare-fun res!24390 () Bool)

(assert (=> b!28145 (=> res!24390 e!18961)))

(assert (=> b!28145 (= res!24390 (not (= (size!755 (buf!1082 (_2!1612 lt!39612))) (size!755 (buf!1082 (_2!1612 lt!39611))))))))

(assert (=> b!28145 e!18960))

(declare-fun res!24397 () Bool)

(assert (=> b!28145 (=> (not res!24397) (not e!18960))))

(assert (=> b!28145 (= res!24397 (= (size!755 (buf!1082 (_2!1612 lt!39611))) (size!755 (buf!1082 thiss!1379))))))

(declare-fun b!28146 () Bool)

(declare-fun res!24403 () Bool)

(assert (=> b!28146 (=> res!24403 e!18953)))

(declare-fun length!98 (List!372) Int)

(assert (=> b!28146 (= res!24403 (<= (length!98 lt!39607) 0))))

(declare-fun b!28147 () Bool)

(declare-fun res!24400 () Bool)

(assert (=> b!28147 (=> res!24400 e!18959)))

(assert (=> b!28147 (= res!24400 (not (invariant!0 (currentBit!2402 (_2!1612 lt!39611)) (currentByte!2407 (_2!1612 lt!39611)) (size!755 (buf!1082 (_2!1612 lt!39611))))))))

(assert (= (and start!6008 res!24392) b!28133))

(assert (= (and b!28133 res!24394) b!28142))

(assert (= (and b!28142 (not res!24391)) b!28129))

(assert (= (and b!28129 (not res!24399)) b!28137))

(assert (= (and b!28137 res!24408) b!28138))

(assert (= (and b!28137 (not res!24401)) b!28139))

(assert (= (and b!28139 (not res!24395)) b!28147))

(assert (= (and b!28147 (not res!24400)) b!28128))

(assert (= (and b!28128 (not res!24407)) b!28145))

(assert (= (and b!28145 res!24397) b!28141))

(assert (= (and b!28145 (not res!24390)) b!28130))

(assert (= (and b!28130 (not res!24405)) b!28131))

(assert (= (and b!28131 (not res!24396)) b!28136))

(assert (= (and b!28136 (not res!24402)) b!28146))

(assert (= (and b!28146 (not res!24403)) b!28144))

(assert (= (and b!28144 (not res!24404)) b!28140))

(assert (= (and b!28140 (not res!24393)) b!28143))

(assert (= (and b!28143 (not res!24406)) b!28134))

(assert (= (and b!28134 (not res!24398)) b!28135))

(assert (= start!6008 b!28132))

(declare-fun m!40281 () Bool)

(assert (=> b!28146 m!40281))

(declare-fun m!40283 () Bool)

(assert (=> b!28147 m!40283))

(declare-fun m!40285 () Bool)

(assert (=> b!28139 m!40285))

(declare-fun m!40287 () Bool)

(assert (=> b!28136 m!40287))

(declare-fun m!40289 () Bool)

(assert (=> b!28136 m!40289))

(declare-fun m!40291 () Bool)

(assert (=> b!28136 m!40291))

(declare-fun m!40293 () Bool)

(assert (=> b!28136 m!40293))

(declare-fun m!40295 () Bool)

(assert (=> b!28136 m!40295))

(declare-fun m!40297 () Bool)

(assert (=> b!28136 m!40297))

(declare-fun m!40299 () Bool)

(assert (=> b!28136 m!40299))

(declare-fun m!40301 () Bool)

(assert (=> b!28136 m!40301))

(declare-fun m!40303 () Bool)

(assert (=> b!28138 m!40303))

(assert (=> b!28138 m!40303))

(declare-fun m!40305 () Bool)

(assert (=> b!28138 m!40305))

(declare-fun m!40307 () Bool)

(assert (=> b!28138 m!40307))

(assert (=> b!28138 m!40307))

(declare-fun m!40309 () Bool)

(assert (=> b!28138 m!40309))

(declare-fun m!40311 () Bool)

(assert (=> b!28135 m!40311))

(declare-fun m!40313 () Bool)

(assert (=> b!28135 m!40313))

(declare-fun m!40315 () Bool)

(assert (=> b!28133 m!40315))

(declare-fun m!40317 () Bool)

(assert (=> b!28142 m!40317))

(declare-fun m!40319 () Bool)

(assert (=> b!28142 m!40319))

(declare-fun m!40321 () Bool)

(assert (=> b!28142 m!40321))

(declare-fun m!40323 () Bool)

(assert (=> b!28137 m!40323))

(declare-fun m!40325 () Bool)

(assert (=> b!28137 m!40325))

(declare-fun m!40327 () Bool)

(assert (=> b!28137 m!40327))

(declare-fun m!40329 () Bool)

(assert (=> b!28137 m!40329))

(declare-fun m!40331 () Bool)

(assert (=> b!28137 m!40331))

(declare-fun m!40333 () Bool)

(assert (=> b!28137 m!40333))

(declare-fun m!40335 () Bool)

(assert (=> b!28137 m!40335))

(declare-fun m!40337 () Bool)

(assert (=> b!28129 m!40337))

(declare-fun m!40339 () Bool)

(assert (=> b!28129 m!40339))

(declare-fun m!40341 () Bool)

(assert (=> b!28129 m!40341))

(declare-fun m!40343 () Bool)

(assert (=> b!28129 m!40343))

(assert (=> b!28129 m!40339))

(declare-fun m!40345 () Bool)

(assert (=> b!28129 m!40345))

(declare-fun m!40347 () Bool)

(assert (=> start!6008 m!40347))

(declare-fun m!40349 () Bool)

(assert (=> start!6008 m!40349))

(declare-fun m!40351 () Bool)

(assert (=> b!28141 m!40351))

(declare-fun m!40353 () Bool)

(assert (=> b!28131 m!40353))

(declare-fun m!40355 () Bool)

(assert (=> b!28143 m!40355))

(declare-fun m!40357 () Bool)

(assert (=> b!28132 m!40357))

(declare-fun m!40359 () Bool)

(assert (=> b!28144 m!40359))

(declare-fun m!40361 () Bool)

(assert (=> b!28130 m!40361))

(declare-fun m!40363 () Bool)

(assert (=> b!28140 m!40363))

(push 1)

