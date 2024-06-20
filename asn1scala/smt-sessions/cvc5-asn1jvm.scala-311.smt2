; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6500 () Bool)

(assert start!6500)

(declare-fun b!30506 () Bool)

(declare-fun res!26207 () Bool)

(declare-fun e!20312 () Bool)

(assert (=> b!30506 (=> res!26207 e!20312)))

(declare-datatypes ((array!1787 0))(
  ( (array!1788 (arr!1247 (Array (_ BitVec 32) (_ BitVec 8))) (size!781 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1372 0))(
  ( (BitStream!1373 (buf!1109 array!1787) (currentByte!2458 (_ BitVec 32)) (currentBit!2453 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2345 0))(
  ( (Unit!2346) )
))
(declare-datatypes ((tuple2!3202 0))(
  ( (tuple2!3203 (_1!1688 Unit!2345) (_2!1688 BitStream!1372)) )
))
(declare-fun lt!44418 () tuple2!3202)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!30506 (= res!26207 (not (invariant!0 (currentBit!2453 (_2!1688 lt!44418)) (currentByte!2458 (_2!1688 lt!44418)) (size!781 (buf!1109 (_2!1688 lt!44418))))))))

(declare-fun b!30507 () Bool)

(declare-fun res!26210 () Bool)

(declare-fun e!20308 () Bool)

(assert (=> b!30507 (=> res!26210 e!20308)))

(declare-fun lt!44408 () (_ BitVec 64))

(declare-datatypes ((tuple2!3204 0))(
  ( (tuple2!3205 (_1!1689 BitStream!1372) (_2!1689 BitStream!1372)) )
))
(declare-fun lt!44405 () tuple2!3204)

(declare-fun lt!44417 () tuple2!3204)

(declare-fun bitAt!0 (array!1787 (_ BitVec 64)) Bool)

(assert (=> b!30507 (= res!26210 (not (= (bitAt!0 (buf!1109 (_1!1689 lt!44405)) lt!44408) (bitAt!0 (buf!1109 (_1!1689 lt!44417)) lt!44408))))))

(declare-fun b!30508 () Bool)

(declare-fun res!26220 () Bool)

(declare-fun e!20316 () Bool)

(assert (=> b!30508 (=> res!26220 e!20316)))

(declare-fun lt!44419 () tuple2!3202)

(assert (=> b!30508 (= res!26220 (not (invariant!0 (currentBit!2453 (_2!1688 lt!44419)) (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44418))))))))

(declare-fun b!30509 () Bool)

(declare-fun e!20310 () Bool)

(assert (=> b!30509 (= e!20316 e!20310)))

(declare-fun res!26209 () Bool)

(assert (=> b!30509 (=> res!26209 e!20310)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!30509 (= res!26209 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!44414 () (_ BitVec 64))

(declare-datatypes ((List!387 0))(
  ( (Nil!384) (Cons!383 (h!502 Bool) (t!1137 List!387)) )
))
(declare-fun lt!44407 () List!387)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1372 BitStream!1372 (_ BitVec 64)) List!387)

(assert (=> b!30509 (= lt!44407 (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_1!1689 lt!44417) lt!44414))))

(declare-fun lt!44415 () List!387)

(assert (=> b!30509 (= lt!44415 (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_1!1689 lt!44405) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30509 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!44414)))

(declare-fun lt!44416 () Unit!2345)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1372 array!1787 (_ BitVec 64)) Unit!2345)

(assert (=> b!30509 (= lt!44416 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1688 lt!44419) (buf!1109 (_2!1688 lt!44418)) lt!44414))))

(declare-fun reader!0 (BitStream!1372 BitStream!1372) tuple2!3204)

(assert (=> b!30509 (= lt!44417 (reader!0 (_2!1688 lt!44419) (_2!1688 lt!44418)))))

(declare-fun thiss!1379 () BitStream!1372)

(assert (=> b!30509 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!44409 () Unit!2345)

(assert (=> b!30509 (= lt!44409 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1109 (_2!1688 lt!44418)) (bvsub to!314 i!635)))))

(assert (=> b!30509 (= lt!44405 (reader!0 thiss!1379 (_2!1688 lt!44418)))))

(declare-fun lt!44406 () (_ BitVec 64))

(declare-fun b!30510 () Bool)

(declare-fun e!20315 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!30510 (= e!20315 (= lt!44406 (bvsub (bvsub (bvadd (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30511 () Bool)

(declare-fun e!20309 () Bool)

(declare-fun e!20317 () Bool)

(assert (=> b!30511 (= e!20309 (not e!20317))))

(declare-fun res!26222 () Bool)

(assert (=> b!30511 (=> res!26222 e!20317)))

(assert (=> b!30511 (= res!26222 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1372 BitStream!1372) Bool)

(assert (=> b!30511 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!44404 () Unit!2345)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1372) Unit!2345)

(assert (=> b!30511 (= lt!44404 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!30511 (= lt!44408 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(declare-fun b!30512 () Bool)

(declare-fun res!26216 () Bool)

(assert (=> b!30512 (=> res!26216 e!20310)))

(declare-fun length!113 (List!387) Int)

(assert (=> b!30512 (= res!26216 (<= (length!113 lt!44415) 0))))

(declare-fun b!30513 () Bool)

(declare-fun res!26219 () Bool)

(assert (=> b!30513 (=> res!26219 e!20316)))

(assert (=> b!30513 (= res!26219 (not (invariant!0 (currentBit!2453 (_2!1688 lt!44419)) (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44419))))))))

(declare-fun b!30514 () Bool)

(declare-fun e!20319 () Bool)

(declare-fun e!20320 () Bool)

(assert (=> b!30514 (= e!20319 e!20320)))

(declare-fun res!26215 () Bool)

(assert (=> b!30514 (=> res!26215 e!20320)))

(assert (=> b!30514 (= res!26215 (not (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!44418))))))

(assert (=> b!30514 (isPrefixOf!0 thiss!1379 (_2!1688 lt!44418))))

(declare-fun lt!44411 () Unit!2345)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1372 BitStream!1372 BitStream!1372) Unit!2345)

(assert (=> b!30514 (= lt!44411 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1688 lt!44419) (_2!1688 lt!44418)))))

(declare-fun srcBuffer!2 () array!1787)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1372 array!1787 (_ BitVec 64) (_ BitVec 64)) tuple2!3202)

(assert (=> b!30514 (= lt!44418 (appendBitsMSBFirstLoop!0 (_2!1688 lt!44419) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!20318 () Bool)

(assert (=> b!30514 e!20318))

(declare-fun res!26214 () Bool)

(assert (=> b!30514 (=> (not res!26214) (not e!20318))))

(assert (=> b!30514 (= res!26214 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44410 () Unit!2345)

(assert (=> b!30514 (= lt!44410 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1109 (_2!1688 lt!44419)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44413 () tuple2!3204)

(assert (=> b!30514 (= lt!44413 (reader!0 thiss!1379 (_2!1688 lt!44419)))))

(declare-fun res!26217 () Bool)

(assert (=> start!6500 (=> (not res!26217) (not e!20309))))

(assert (=> start!6500 (= res!26217 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!781 srcBuffer!2))))))))

(assert (=> start!6500 e!20309))

(assert (=> start!6500 true))

(declare-fun array_inv!739 (array!1787) Bool)

(assert (=> start!6500 (array_inv!739 srcBuffer!2)))

(declare-fun e!20314 () Bool)

(declare-fun inv!12 (BitStream!1372) Bool)

(assert (=> start!6500 (and (inv!12 thiss!1379) e!20314)))

(declare-fun b!30515 () Bool)

(assert (=> b!30515 (= e!20308 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44408) (bvslt lt!44408 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!781 (buf!1109 (_1!1689 lt!44405))))))))))

(declare-fun b!30516 () Bool)

(declare-fun res!26208 () Bool)

(assert (=> b!30516 (=> (not res!26208) (not e!20309))))

(assert (=> b!30516 (= res!26208 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 thiss!1379))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!30517 () Bool)

(declare-fun head!224 (List!387) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1372 array!1787 (_ BitVec 64) (_ BitVec 64)) List!387)

(assert (=> b!30517 (= e!20318 (= (head!224 (byteArrayBitContentToList!0 (_2!1688 lt!44419) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!224 (bitStreamReadBitsIntoList!0 (_2!1688 lt!44419) (_1!1689 lt!44413) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!30518 () Bool)

(assert (=> b!30518 (= e!20312 e!20316)))

(declare-fun res!26218 () Bool)

(assert (=> b!30518 (=> res!26218 e!20316)))

(assert (=> b!30518 (= res!26218 (not (= (size!781 (buf!1109 (_2!1688 lt!44419))) (size!781 (buf!1109 (_2!1688 lt!44418))))))))

(assert (=> b!30518 e!20315))

(declare-fun res!26221 () Bool)

(assert (=> b!30518 (=> (not res!26221) (not e!20315))))

(assert (=> b!30518 (= res!26221 (= (size!781 (buf!1109 (_2!1688 lt!44418))) (size!781 (buf!1109 thiss!1379))))))

(declare-fun b!30519 () Bool)

(declare-fun res!26212 () Bool)

(assert (=> b!30519 (=> res!26212 e!20312)))

(assert (=> b!30519 (= res!26212 (not (= (size!781 (buf!1109 thiss!1379)) (size!781 (buf!1109 (_2!1688 lt!44418))))))))

(declare-fun b!30520 () Bool)

(assert (=> b!30520 (= e!20317 e!20319)))

(declare-fun res!26211 () Bool)

(assert (=> b!30520 (=> res!26211 e!20319)))

(assert (=> b!30520 (= res!26211 (not (isPrefixOf!0 thiss!1379 (_2!1688 lt!44419))))))

(assert (=> b!30520 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!44414)))

(assert (=> b!30520 (= lt!44414 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44402 () Unit!2345)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1372 BitStream!1372 (_ BitVec 64) (_ BitVec 64)) Unit!2345)

(assert (=> b!30520 (= lt!44402 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1688 lt!44419) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1372 (_ BitVec 8) (_ BitVec 32)) tuple2!3202)

(assert (=> b!30520 (= lt!44419 (appendBitFromByte!0 thiss!1379 (select (arr!1247 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!30521 () Bool)

(assert (=> b!30521 (= e!20320 e!20312)))

(declare-fun res!26213 () Bool)

(assert (=> b!30521 (=> res!26213 e!20312)))

(assert (=> b!30521 (= res!26213 (not (= lt!44406 (bvsub (bvadd lt!44408 to!314) i!635))))))

(assert (=> b!30521 (= lt!44406 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44418))) (currentByte!2458 (_2!1688 lt!44418)) (currentBit!2453 (_2!1688 lt!44418))))))

(declare-fun b!30522 () Bool)

(assert (=> b!30522 (= e!20314 (array_inv!739 (buf!1109 thiss!1379)))))

(declare-fun b!30523 () Bool)

(assert (=> b!30523 (= e!20310 e!20308)))

(declare-fun res!26223 () Bool)

(assert (=> b!30523 (=> res!26223 e!20308)))

(declare-fun lt!44412 () List!387)

(assert (=> b!30523 (= res!26223 (not (= lt!44412 lt!44407)))))

(assert (=> b!30523 (= lt!44407 lt!44412)))

(declare-fun tail!104 (List!387) List!387)

(assert (=> b!30523 (= lt!44412 (tail!104 lt!44415))))

(declare-fun lt!44403 () Unit!2345)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1372 BitStream!1372 BitStream!1372 BitStream!1372 (_ BitVec 64) List!387) Unit!2345)

(assert (=> b!30523 (= lt!44403 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1688 lt!44418) (_2!1688 lt!44418) (_1!1689 lt!44405) (_1!1689 lt!44417) (bvsub to!314 i!635) lt!44415))))

(assert (= (and start!6500 res!26217) b!30516))

(assert (= (and b!30516 res!26208) b!30511))

(assert (= (and b!30511 (not res!26222)) b!30520))

(assert (= (and b!30520 (not res!26211)) b!30514))

(assert (= (and b!30514 res!26214) b!30517))

(assert (= (and b!30514 (not res!26215)) b!30521))

(assert (= (and b!30521 (not res!26213)) b!30506))

(assert (= (and b!30506 (not res!26207)) b!30519))

(assert (= (and b!30519 (not res!26212)) b!30518))

(assert (= (and b!30518 res!26221) b!30510))

(assert (= (and b!30518 (not res!26218)) b!30513))

(assert (= (and b!30513 (not res!26219)) b!30508))

(assert (= (and b!30508 (not res!26220)) b!30509))

(assert (= (and b!30509 (not res!26209)) b!30512))

(assert (= (and b!30512 (not res!26216)) b!30523))

(assert (= (and b!30523 (not res!26223)) b!30507))

(assert (= (and b!30507 (not res!26210)) b!30515))

(assert (= start!6500 b!30522))

(declare-fun m!44571 () Bool)

(assert (=> b!30521 m!44571))

(declare-fun m!44573 () Bool)

(assert (=> b!30509 m!44573))

(declare-fun m!44575 () Bool)

(assert (=> b!30509 m!44575))

(declare-fun m!44577 () Bool)

(assert (=> b!30509 m!44577))

(declare-fun m!44579 () Bool)

(assert (=> b!30509 m!44579))

(declare-fun m!44581 () Bool)

(assert (=> b!30509 m!44581))

(declare-fun m!44583 () Bool)

(assert (=> b!30509 m!44583))

(declare-fun m!44585 () Bool)

(assert (=> b!30509 m!44585))

(declare-fun m!44587 () Bool)

(assert (=> b!30509 m!44587))

(declare-fun m!44589 () Bool)

(assert (=> b!30512 m!44589))

(declare-fun m!44591 () Bool)

(assert (=> b!30520 m!44591))

(declare-fun m!44593 () Bool)

(assert (=> b!30520 m!44593))

(declare-fun m!44595 () Bool)

(assert (=> b!30520 m!44595))

(declare-fun m!44597 () Bool)

(assert (=> b!30520 m!44597))

(assert (=> b!30520 m!44591))

(declare-fun m!44599 () Bool)

(assert (=> b!30520 m!44599))

(declare-fun m!44601 () Bool)

(assert (=> b!30513 m!44601))

(declare-fun m!44603 () Bool)

(assert (=> b!30510 m!44603))

(declare-fun m!44605 () Bool)

(assert (=> b!30511 m!44605))

(declare-fun m!44607 () Bool)

(assert (=> b!30511 m!44607))

(declare-fun m!44609 () Bool)

(assert (=> b!30511 m!44609))

(declare-fun m!44611 () Bool)

(assert (=> b!30507 m!44611))

(declare-fun m!44613 () Bool)

(assert (=> b!30507 m!44613))

(declare-fun m!44615 () Bool)

(assert (=> b!30523 m!44615))

(declare-fun m!44617 () Bool)

(assert (=> b!30523 m!44617))

(declare-fun m!44619 () Bool)

(assert (=> b!30514 m!44619))

(declare-fun m!44621 () Bool)

(assert (=> b!30514 m!44621))

(declare-fun m!44623 () Bool)

(assert (=> b!30514 m!44623))

(declare-fun m!44625 () Bool)

(assert (=> b!30514 m!44625))

(declare-fun m!44627 () Bool)

(assert (=> b!30514 m!44627))

(declare-fun m!44629 () Bool)

(assert (=> b!30514 m!44629))

(declare-fun m!44631 () Bool)

(assert (=> b!30514 m!44631))

(declare-fun m!44633 () Bool)

(assert (=> b!30508 m!44633))

(declare-fun m!44635 () Bool)

(assert (=> start!6500 m!44635))

(declare-fun m!44637 () Bool)

(assert (=> start!6500 m!44637))

(declare-fun m!44639 () Bool)

(assert (=> b!30522 m!44639))

(declare-fun m!44641 () Bool)

(assert (=> b!30516 m!44641))

(declare-fun m!44643 () Bool)

(assert (=> b!30506 m!44643))

(declare-fun m!44645 () Bool)

(assert (=> b!30517 m!44645))

(assert (=> b!30517 m!44645))

(declare-fun m!44647 () Bool)

(assert (=> b!30517 m!44647))

(declare-fun m!44649 () Bool)

(assert (=> b!30517 m!44649))

(assert (=> b!30517 m!44649))

(declare-fun m!44651 () Bool)

(assert (=> b!30517 m!44651))

(push 1)

(assert (not start!6500))

(assert (not b!30506))

(assert (not b!30510))

(assert (not b!30521))

(assert (not b!30507))

(assert (not b!30516))

(assert (not b!30517))

(assert (not b!30522))

(assert (not b!30508))

(assert (not b!30513))

(assert (not b!30520))

(assert (not b!30514))

(assert (not b!30511))

(assert (not b!30512))

(assert (not b!30523))

(assert (not b!30509))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8900 () Bool)

(assert (=> d!8900 (= (tail!104 lt!44415) (t!1137 lt!44415))))

(assert (=> b!30523 d!8900))

(declare-fun d!8902 () Bool)

(declare-fun e!20474 () Bool)

(assert (=> d!8902 e!20474))

(declare-fun res!26419 () Bool)

(assert (=> d!8902 (=> (not res!26419) (not e!20474))))

(declare-fun lt!44821 () (_ BitVec 64))

(assert (=> d!8902 (= res!26419 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!44821) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8902 (= lt!44821 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44820 () Unit!2345)

(declare-fun choose!42 (BitStream!1372 BitStream!1372 BitStream!1372 BitStream!1372 (_ BitVec 64) List!387) Unit!2345)

(assert (=> d!8902 (= lt!44820 (choose!42 (_2!1688 lt!44418) (_2!1688 lt!44418) (_1!1689 lt!44405) (_1!1689 lt!44417) (bvsub to!314 i!635) lt!44415))))

(assert (=> d!8902 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8902 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1688 lt!44418) (_2!1688 lt!44418) (_1!1689 lt!44405) (_1!1689 lt!44417) (bvsub to!314 i!635) lt!44415) lt!44820)))

(declare-fun b!30776 () Bool)

(assert (=> b!30776 (= e!20474 (= (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_1!1689 lt!44417) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!104 lt!44415)))))

(assert (= (and d!8902 res!26419) b!30776))

(declare-fun m!45023 () Bool)

(assert (=> d!8902 m!45023))

(declare-fun m!45025 () Bool)

(assert (=> b!30776 m!45025))

(assert (=> b!30776 m!44615))

(assert (=> b!30523 d!8902))

(declare-fun d!8904 () Bool)

(declare-fun size!786 (List!387) Int)

(assert (=> d!8904 (= (length!113 lt!44415) (size!786 lt!44415))))

(declare-fun bs!2477 () Bool)

(assert (= bs!2477 d!8904))

(declare-fun m!45027 () Bool)

(assert (=> bs!2477 m!45027))

(assert (=> b!30512 d!8904))

(declare-fun d!8906 () Bool)

(assert (=> d!8906 (= (array_inv!739 (buf!1109 thiss!1379)) (bvsge (size!781 (buf!1109 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!30522 d!8906))

(declare-fun d!8908 () Bool)

(assert (=> d!8908 (= (invariant!0 (currentBit!2453 (_2!1688 lt!44419)) (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44419)))) (and (bvsge (currentBit!2453 (_2!1688 lt!44419)) #b00000000000000000000000000000000) (bvslt (currentBit!2453 (_2!1688 lt!44419)) #b00000000000000000000000000001000) (bvsge (currentByte!2458 (_2!1688 lt!44419)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44419)))) (and (= (currentBit!2453 (_2!1688 lt!44419)) #b00000000000000000000000000000000) (= (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44419))))))))))

(assert (=> b!30513 d!8908))

(declare-fun d!8910 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2478 () Bool)

(assert (= bs!2478 d!8910))

(declare-fun m!45029 () Bool)

(assert (=> bs!2478 m!45029))

(assert (=> b!30514 d!8910))

(declare-fun d!8912 () Bool)

(assert (=> d!8912 (isPrefixOf!0 thiss!1379 (_2!1688 lt!44418))))

(declare-fun lt!44824 () Unit!2345)

(declare-fun choose!30 (BitStream!1372 BitStream!1372 BitStream!1372) Unit!2345)

(assert (=> d!8912 (= lt!44824 (choose!30 thiss!1379 (_2!1688 lt!44419) (_2!1688 lt!44418)))))

(assert (=> d!8912 (isPrefixOf!0 thiss!1379 (_2!1688 lt!44419))))

(assert (=> d!8912 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1688 lt!44419) (_2!1688 lt!44418)) lt!44824)))

(declare-fun bs!2479 () Bool)

(assert (= bs!2479 d!8912))

(assert (=> bs!2479 m!44619))

(declare-fun m!45031 () Bool)

(assert (=> bs!2479 m!45031))

(assert (=> bs!2479 m!44595))

(assert (=> b!30514 d!8912))

(declare-fun d!8914 () Bool)

(assert (=> d!8914 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44827 () Unit!2345)

(declare-fun choose!9 (BitStream!1372 array!1787 (_ BitVec 64) BitStream!1372) Unit!2345)

(assert (=> d!8914 (= lt!44827 (choose!9 thiss!1379 (buf!1109 (_2!1688 lt!44419)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1373 (buf!1109 (_2!1688 lt!44419)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379))))))

(assert (=> d!8914 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1109 (_2!1688 lt!44419)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44827)))

(declare-fun bs!2480 () Bool)

(assert (= bs!2480 d!8914))

(assert (=> bs!2480 m!44627))

(declare-fun m!45033 () Bool)

(assert (=> bs!2480 m!45033))

(assert (=> b!30514 d!8914))

(declare-fun b!30919 () Bool)

(declare-fun res!26525 () Bool)

(declare-fun e!20543 () Bool)

(assert (=> b!30919 (=> (not res!26525) (not e!20543))))

(declare-fun lt!45320 () tuple2!3202)

(assert (=> b!30919 (= res!26525 (= (size!781 (buf!1109 (_2!1688 lt!45320))) (size!781 (buf!1109 (_2!1688 lt!44419)))))))

(declare-fun b!30920 () Bool)

(declare-fun e!20542 () tuple2!3202)

(declare-fun Unit!2371 () Unit!2345)

(assert (=> b!30920 (= e!20542 (tuple2!3203 Unit!2371 (_2!1688 lt!44419)))))

(assert (=> b!30920 (= (size!781 (buf!1109 (_2!1688 lt!44419))) (size!781 (buf!1109 (_2!1688 lt!44419))))))

(declare-fun lt!45335 () Unit!2345)

(declare-fun Unit!2372 () Unit!2345)

(assert (=> b!30920 (= lt!45335 Unit!2372)))

(declare-fun call!400 () tuple2!3204)

(declare-fun checkByteArrayBitContent!0 (BitStream!1372 array!1787 array!1787 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3228 0))(
  ( (tuple2!3229 (_1!1701 array!1787) (_2!1701 BitStream!1372)) )
))
(declare-fun readBits!0 (BitStream!1372 (_ BitVec 64)) tuple2!3228)

(assert (=> b!30920 (checkByteArrayBitContent!0 (_2!1688 lt!44419) srcBuffer!2 (_1!1701 (readBits!0 (_1!1689 call!400) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!30921 () Bool)

(declare-fun lt!45315 () tuple2!3202)

(declare-fun Unit!2373 () Unit!2345)

(assert (=> b!30921 (= e!20542 (tuple2!3203 Unit!2373 (_2!1688 lt!45315)))))

(declare-fun lt!45298 () tuple2!3202)

(assert (=> b!30921 (= lt!45298 (appendBitFromByte!0 (_2!1688 lt!44419) (select (arr!1247 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!45334 () (_ BitVec 64))

(assert (=> b!30921 (= lt!45334 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45307 () (_ BitVec 64))

(assert (=> b!30921 (= lt!45307 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45314 () Unit!2345)

(assert (=> b!30921 (= lt!45314 (validateOffsetBitsIneqLemma!0 (_2!1688 lt!44419) (_2!1688 lt!45298) lt!45334 lt!45307))))

(assert (=> b!30921 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!45298)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!45298))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!45298))) (bvsub lt!45334 lt!45307))))

(declare-fun lt!45299 () Unit!2345)

(assert (=> b!30921 (= lt!45299 lt!45314)))

(declare-fun lt!45323 () tuple2!3204)

(assert (=> b!30921 (= lt!45323 (reader!0 (_2!1688 lt!44419) (_2!1688 lt!45298)))))

(declare-fun lt!45324 () (_ BitVec 64))

(assert (=> b!30921 (= lt!45324 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45326 () Unit!2345)

(assert (=> b!30921 (= lt!45326 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1688 lt!44419) (buf!1109 (_2!1688 lt!45298)) lt!45324))))

(assert (=> b!30921 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!45298)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!45324)))

(declare-fun lt!45333 () Unit!2345)

(assert (=> b!30921 (= lt!45333 lt!45326)))

(assert (=> b!30921 (= (head!224 (byteArrayBitContentToList!0 (_2!1688 lt!45298) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!224 (bitStreamReadBitsIntoList!0 (_2!1688 lt!45298) (_1!1689 lt!45323) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45313 () Unit!2345)

(declare-fun Unit!2374 () Unit!2345)

(assert (=> b!30921 (= lt!45313 Unit!2374)))

(assert (=> b!30921 (= lt!45315 (appendBitsMSBFirstLoop!0 (_2!1688 lt!45298) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!45328 () Unit!2345)

(assert (=> b!30921 (= lt!45328 (lemmaIsPrefixTransitive!0 (_2!1688 lt!44419) (_2!1688 lt!45298) (_2!1688 lt!45315)))))

(assert (=> b!30921 (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!45315))))

(declare-fun lt!45327 () Unit!2345)

(assert (=> b!30921 (= lt!45327 lt!45328)))

(assert (=> b!30921 (= (size!781 (buf!1109 (_2!1688 lt!45315))) (size!781 (buf!1109 (_2!1688 lt!44419))))))

(declare-fun lt!45337 () Unit!2345)

(declare-fun Unit!2375 () Unit!2345)

(assert (=> b!30921 (= lt!45337 Unit!2375)))

(assert (=> b!30921 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45315))) (currentByte!2458 (_2!1688 lt!45315)) (currentBit!2453 (_2!1688 lt!45315))) (bvsub (bvadd (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45311 () Unit!2345)

(declare-fun Unit!2376 () Unit!2345)

(assert (=> b!30921 (= lt!45311 Unit!2376)))

(assert (=> b!30921 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45315))) (currentByte!2458 (_2!1688 lt!45315)) (currentBit!2453 (_2!1688 lt!45315))) (bvsub (bvsub (bvadd (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45298))) (currentByte!2458 (_2!1688 lt!45298)) (currentBit!2453 (_2!1688 lt!45298))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45318 () Unit!2345)

(declare-fun Unit!2377 () Unit!2345)

(assert (=> b!30921 (= lt!45318 Unit!2377)))

(declare-fun lt!45316 () tuple2!3204)

(assert (=> b!30921 (= lt!45316 (reader!0 (_2!1688 lt!44419) (_2!1688 lt!45315)))))

(declare-fun lt!45329 () (_ BitVec 64))

(assert (=> b!30921 (= lt!45329 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45336 () Unit!2345)

(assert (=> b!30921 (= lt!45336 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1688 lt!44419) (buf!1109 (_2!1688 lt!45315)) lt!45329))))

(assert (=> b!30921 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!45315)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!45329)))

(declare-fun lt!45296 () Unit!2345)

(assert (=> b!30921 (= lt!45296 lt!45336)))

(declare-fun lt!45330 () tuple2!3204)

(assert (=> b!30921 (= lt!45330 call!400)))

(declare-fun lt!45321 () (_ BitVec 64))

(assert (=> b!30921 (= lt!45321 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45317 () Unit!2345)

(assert (=> b!30921 (= lt!45317 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1688 lt!45298) (buf!1109 (_2!1688 lt!45315)) lt!45321))))

(assert (=> b!30921 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!45315)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!45298))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!45298))) lt!45321)))

(declare-fun lt!45331 () Unit!2345)

(assert (=> b!30921 (= lt!45331 lt!45317)))

(declare-fun lt!45308 () List!387)

(assert (=> b!30921 (= lt!45308 (byteArrayBitContentToList!0 (_2!1688 lt!45315) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!45303 () List!387)

(assert (=> b!30921 (= lt!45303 (byteArrayBitContentToList!0 (_2!1688 lt!45315) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45310 () List!387)

(assert (=> b!30921 (= lt!45310 (bitStreamReadBitsIntoList!0 (_2!1688 lt!45315) (_1!1689 lt!45316) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!45297 () List!387)

(assert (=> b!30921 (= lt!45297 (bitStreamReadBitsIntoList!0 (_2!1688 lt!45315) (_1!1689 lt!45330) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45306 () (_ BitVec 64))

(assert (=> b!30921 (= lt!45306 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45295 () Unit!2345)

(assert (=> b!30921 (= lt!45295 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1688 lt!45315) (_2!1688 lt!45315) (_1!1689 lt!45316) (_1!1689 lt!45330) lt!45306 lt!45310))))

(assert (=> b!30921 (= (bitStreamReadBitsIntoList!0 (_2!1688 lt!45315) (_1!1689 lt!45330) (bvsub lt!45306 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!104 lt!45310))))

(declare-fun lt!45305 () Unit!2345)

(assert (=> b!30921 (= lt!45305 lt!45295)))

(declare-fun lt!45301 () Unit!2345)

(declare-fun lt!45332 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1787 array!1787 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2345)

(assert (=> b!30921 (= lt!45301 (arrayBitRangesEqImpliesEq!0 (buf!1109 (_2!1688 lt!45298)) (buf!1109 (_2!1688 lt!45315)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!45332 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45298))) (currentByte!2458 (_2!1688 lt!45298)) (currentBit!2453 (_2!1688 lt!45298)))))))

(assert (=> b!30921 (= (bitAt!0 (buf!1109 (_2!1688 lt!45298)) lt!45332) (bitAt!0 (buf!1109 (_2!1688 lt!45315)) lt!45332))))

(declare-fun lt!45302 () Unit!2345)

(assert (=> b!30921 (= lt!45302 lt!45301)))

(declare-fun b!30922 () Bool)

(declare-fun res!26523 () Bool)

(assert (=> b!30922 (=> (not res!26523) (not e!20543))))

(assert (=> b!30922 (= res!26523 (= (size!781 (buf!1109 (_2!1688 lt!44419))) (size!781 (buf!1109 (_2!1688 lt!45320)))))))

(declare-fun d!8916 () Bool)

(assert (=> d!8916 e!20543))

(declare-fun res!26524 () Bool)

(assert (=> d!8916 (=> (not res!26524) (not e!20543))))

(declare-fun lt!45325 () (_ BitVec 64))

(assert (=> d!8916 (= res!26524 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45320))) (currentByte!2458 (_2!1688 lt!45320)) (currentBit!2453 (_2!1688 lt!45320))) (bvsub lt!45325 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8916 (or (= (bvand lt!45325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45325 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!45304 () (_ BitVec 64))

(assert (=> d!8916 (= lt!45325 (bvadd lt!45304 to!314))))

(assert (=> d!8916 (or (not (= (bvand lt!45304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!45304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!45304 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8916 (= lt!45304 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))))))

(assert (=> d!8916 (= lt!45320 e!20542)))

(declare-fun c!2073 () Bool)

(assert (=> d!8916 (= c!2073 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!45312 () Unit!2345)

(declare-fun lt!45322 () Unit!2345)

(assert (=> d!8916 (= lt!45312 lt!45322)))

(assert (=> d!8916 (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!44419))))

(assert (=> d!8916 (= lt!45322 (lemmaIsPrefixRefl!0 (_2!1688 lt!44419)))))

(assert (=> d!8916 (= lt!45332 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))))))

(assert (=> d!8916 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8916 (= (appendBitsMSBFirstLoop!0 (_2!1688 lt!44419) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!45320)))

(declare-fun bm!397 () Bool)

(assert (=> bm!397 (= call!400 (reader!0 (ite c!2073 (_2!1688 lt!45298) (_2!1688 lt!44419)) (ite c!2073 (_2!1688 lt!45315) (_2!1688 lt!44419))))))

(declare-fun b!30923 () Bool)

(declare-fun e!20544 () Bool)

(declare-fun lt!45300 () (_ BitVec 64))

(assert (=> b!30923 (= e!20544 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!45300))))

(declare-fun b!30924 () Bool)

(declare-fun res!26527 () Bool)

(assert (=> b!30924 (=> (not res!26527) (not e!20543))))

(assert (=> b!30924 (= res!26527 (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!45320)))))

(declare-fun b!30925 () Bool)

(declare-fun res!26528 () Bool)

(assert (=> b!30925 (=> (not res!26528) (not e!20543))))

(assert (=> b!30925 (= res!26528 (invariant!0 (currentBit!2453 (_2!1688 lt!45320)) (currentByte!2458 (_2!1688 lt!45320)) (size!781 (buf!1109 (_2!1688 lt!45320)))))))

(declare-fun b!30926 () Bool)

(declare-fun lt!45309 () tuple2!3204)

(assert (=> b!30926 (= e!20543 (= (bitStreamReadBitsIntoList!0 (_2!1688 lt!45320) (_1!1689 lt!45309) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1688 lt!45320) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!30926 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30926 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!45294 () Unit!2345)

(declare-fun lt!45319 () Unit!2345)

(assert (=> b!30926 (= lt!45294 lt!45319)))

(assert (=> b!30926 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!45320)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!45300)))

(assert (=> b!30926 (= lt!45319 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1688 lt!44419) (buf!1109 (_2!1688 lt!45320)) lt!45300))))

(assert (=> b!30926 e!20544))

(declare-fun res!26526 () Bool)

(assert (=> b!30926 (=> (not res!26526) (not e!20544))))

(assert (=> b!30926 (= res!26526 (and (= (size!781 (buf!1109 (_2!1688 lt!44419))) (size!781 (buf!1109 (_2!1688 lt!45320)))) (bvsge lt!45300 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30926 (= lt!45300 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!30926 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30926 (= lt!45309 (reader!0 (_2!1688 lt!44419) (_2!1688 lt!45320)))))

(assert (= (and d!8916 c!2073) b!30921))

(assert (= (and d!8916 (not c!2073)) b!30920))

(assert (= (or b!30921 b!30920) bm!397))

(assert (= (and d!8916 res!26524) b!30925))

(assert (= (and b!30925 res!26528) b!30922))

(assert (= (and b!30922 res!26523) b!30924))

(assert (= (and b!30924 res!26527) b!30919))

(assert (= (and b!30919 res!26525) b!30926))

(assert (= (and b!30926 res!26526) b!30923))

(declare-fun m!45353 () Bool)

(assert (=> b!30921 m!45353))

(declare-fun m!45355 () Bool)

(assert (=> b!30921 m!45355))

(declare-fun m!45357 () Bool)

(assert (=> b!30921 m!45357))

(declare-fun m!45359 () Bool)

(assert (=> b!30921 m!45359))

(declare-fun m!45361 () Bool)

(assert (=> b!30921 m!45361))

(declare-fun m!45363 () Bool)

(assert (=> b!30921 m!45363))

(declare-fun m!45365 () Bool)

(assert (=> b!30921 m!45365))

(declare-fun m!45367 () Bool)

(assert (=> b!30921 m!45367))

(declare-fun m!45369 () Bool)

(assert (=> b!30921 m!45369))

(declare-fun m!45371 () Bool)

(assert (=> b!30921 m!45371))

(declare-fun m!45373 () Bool)

(assert (=> b!30921 m!45373))

(declare-fun m!45375 () Bool)

(assert (=> b!30921 m!45375))

(declare-fun m!45377 () Bool)

(assert (=> b!30921 m!45377))

(declare-fun m!45379 () Bool)

(assert (=> b!30921 m!45379))

(declare-fun m!45381 () Bool)

(assert (=> b!30921 m!45381))

(declare-fun m!45383 () Bool)

(assert (=> b!30921 m!45383))

(declare-fun m!45385 () Bool)

(assert (=> b!30921 m!45385))

(declare-fun m!45387 () Bool)

(assert (=> b!30921 m!45387))

(declare-fun m!45389 () Bool)

(assert (=> b!30921 m!45389))

(declare-fun m!45391 () Bool)

(assert (=> b!30921 m!45391))

(declare-fun m!45393 () Bool)

(assert (=> b!30921 m!45393))

(declare-fun m!45395 () Bool)

(assert (=> b!30921 m!45395))

(assert (=> b!30921 m!45385))

(declare-fun m!45397 () Bool)

(assert (=> b!30921 m!45397))

(declare-fun m!45399 () Bool)

(assert (=> b!30921 m!45399))

(declare-fun m!45401 () Bool)

(assert (=> b!30921 m!45401))

(declare-fun m!45403 () Bool)

(assert (=> b!30921 m!45403))

(assert (=> b!30921 m!44603))

(declare-fun m!45405 () Bool)

(assert (=> b!30921 m!45405))

(assert (=> b!30921 m!45353))

(declare-fun m!45407 () Bool)

(assert (=> b!30921 m!45407))

(assert (=> b!30921 m!45405))

(declare-fun m!45409 () Bool)

(assert (=> b!30921 m!45409))

(declare-fun m!45411 () Bool)

(assert (=> b!30921 m!45411))

(declare-fun m!45413 () Bool)

(assert (=> b!30921 m!45413))

(assert (=> b!30921 m!45355))

(declare-fun m!45415 () Bool)

(assert (=> b!30920 m!45415))

(declare-fun m!45417 () Bool)

(assert (=> b!30920 m!45417))

(declare-fun m!45419 () Bool)

(assert (=> d!8916 m!45419))

(assert (=> d!8916 m!44603))

(declare-fun m!45421 () Bool)

(assert (=> d!8916 m!45421))

(declare-fun m!45423 () Bool)

(assert (=> d!8916 m!45423))

(declare-fun m!45425 () Bool)

(assert (=> b!30925 m!45425))

(declare-fun m!45427 () Bool)

(assert (=> b!30923 m!45427))

(declare-fun m!45429 () Bool)

(assert (=> b!30926 m!45429))

(declare-fun m!45431 () Bool)

(assert (=> b!30926 m!45431))

(declare-fun m!45433 () Bool)

(assert (=> b!30926 m!45433))

(declare-fun m!45435 () Bool)

(assert (=> b!30926 m!45435))

(declare-fun m!45437 () Bool)

(assert (=> b!30926 m!45437))

(declare-fun m!45439 () Bool)

(assert (=> bm!397 m!45439))

(declare-fun m!45441 () Bool)

(assert (=> b!30924 m!45441))

(assert (=> b!30514 d!8916))

(declare-fun b!30937 () Bool)

(declare-fun e!20550 () Unit!2345)

(declare-fun lt!45381 () Unit!2345)

(assert (=> b!30937 (= e!20550 lt!45381)))

(declare-fun lt!45392 () (_ BitVec 64))

(assert (=> b!30937 (= lt!45392 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45386 () (_ BitVec 64))

(assert (=> b!30937 (= lt!45386 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1787 array!1787 (_ BitVec 64) (_ BitVec 64)) Unit!2345)

(assert (=> b!30937 (= lt!45381 (arrayBitRangesEqSymmetric!0 (buf!1109 thiss!1379) (buf!1109 (_2!1688 lt!44419)) lt!45392 lt!45386))))

(declare-fun arrayBitRangesEq!0 (array!1787 array!1787 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30937 (arrayBitRangesEq!0 (buf!1109 (_2!1688 lt!44419)) (buf!1109 thiss!1379) lt!45392 lt!45386)))

(declare-fun b!30938 () Bool)

(declare-fun Unit!2378 () Unit!2345)

(assert (=> b!30938 (= e!20550 Unit!2378)))

(declare-fun b!30939 () Bool)

(declare-fun res!26535 () Bool)

(declare-fun e!20549 () Bool)

(assert (=> b!30939 (=> (not res!26535) (not e!20549))))

(declare-fun lt!45378 () tuple2!3204)

(assert (=> b!30939 (= res!26535 (isPrefixOf!0 (_1!1689 lt!45378) thiss!1379))))

(declare-fun b!30940 () Bool)

(declare-fun lt!45394 () (_ BitVec 64))

(declare-fun lt!45385 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1372 (_ BitVec 64)) BitStream!1372)

(assert (=> b!30940 (= e!20549 (= (_1!1689 lt!45378) (withMovedBitIndex!0 (_2!1689 lt!45378) (bvsub lt!45394 lt!45385))))))

(assert (=> b!30940 (or (= (bvand lt!45394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45394 lt!45385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30940 (= lt!45385 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))))))

(assert (=> b!30940 (= lt!45394 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(declare-fun d!8990 () Bool)

(assert (=> d!8990 e!20549))

(declare-fun res!26536 () Bool)

(assert (=> d!8990 (=> (not res!26536) (not e!20549))))

(assert (=> d!8990 (= res!26536 (isPrefixOf!0 (_1!1689 lt!45378) (_2!1689 lt!45378)))))

(declare-fun lt!45397 () BitStream!1372)

(assert (=> d!8990 (= lt!45378 (tuple2!3205 lt!45397 (_2!1688 lt!44419)))))

(declare-fun lt!45390 () Unit!2345)

(declare-fun lt!45393 () Unit!2345)

(assert (=> d!8990 (= lt!45390 lt!45393)))

(assert (=> d!8990 (isPrefixOf!0 lt!45397 (_2!1688 lt!44419))))

(assert (=> d!8990 (= lt!45393 (lemmaIsPrefixTransitive!0 lt!45397 (_2!1688 lt!44419) (_2!1688 lt!44419)))))

(declare-fun lt!45396 () Unit!2345)

(declare-fun lt!45382 () Unit!2345)

(assert (=> d!8990 (= lt!45396 lt!45382)))

(assert (=> d!8990 (isPrefixOf!0 lt!45397 (_2!1688 lt!44419))))

(assert (=> d!8990 (= lt!45382 (lemmaIsPrefixTransitive!0 lt!45397 thiss!1379 (_2!1688 lt!44419)))))

(declare-fun lt!45387 () Unit!2345)

(assert (=> d!8990 (= lt!45387 e!20550)))

(declare-fun c!2076 () Bool)

(assert (=> d!8990 (= c!2076 (not (= (size!781 (buf!1109 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!45380 () Unit!2345)

(declare-fun lt!45391 () Unit!2345)

(assert (=> d!8990 (= lt!45380 lt!45391)))

(assert (=> d!8990 (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!44419))))

(assert (=> d!8990 (= lt!45391 (lemmaIsPrefixRefl!0 (_2!1688 lt!44419)))))

(declare-fun lt!45379 () Unit!2345)

(declare-fun lt!45388 () Unit!2345)

(assert (=> d!8990 (= lt!45379 lt!45388)))

(assert (=> d!8990 (= lt!45388 (lemmaIsPrefixRefl!0 (_2!1688 lt!44419)))))

(declare-fun lt!45395 () Unit!2345)

(declare-fun lt!45389 () Unit!2345)

(assert (=> d!8990 (= lt!45395 lt!45389)))

(assert (=> d!8990 (isPrefixOf!0 lt!45397 lt!45397)))

(assert (=> d!8990 (= lt!45389 (lemmaIsPrefixRefl!0 lt!45397))))

(declare-fun lt!45384 () Unit!2345)

(declare-fun lt!45383 () Unit!2345)

(assert (=> d!8990 (= lt!45384 lt!45383)))

(assert (=> d!8990 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8990 (= lt!45383 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8990 (= lt!45397 (BitStream!1373 (buf!1109 (_2!1688 lt!44419)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(assert (=> d!8990 (isPrefixOf!0 thiss!1379 (_2!1688 lt!44419))))

(assert (=> d!8990 (= (reader!0 thiss!1379 (_2!1688 lt!44419)) lt!45378)))

(declare-fun b!30941 () Bool)

(declare-fun res!26537 () Bool)

(assert (=> b!30941 (=> (not res!26537) (not e!20549))))

(assert (=> b!30941 (= res!26537 (isPrefixOf!0 (_2!1689 lt!45378) (_2!1688 lt!44419)))))

(assert (= (and d!8990 c!2076) b!30937))

(assert (= (and d!8990 (not c!2076)) b!30938))

(assert (= (and d!8990 res!26536) b!30939))

(assert (= (and b!30939 res!26535) b!30941))

(assert (= (and b!30941 res!26537) b!30940))

(assert (=> d!8990 m!44607))

(assert (=> d!8990 m!44595))

(declare-fun m!45443 () Bool)

(assert (=> d!8990 m!45443))

(declare-fun m!45445 () Bool)

(assert (=> d!8990 m!45445))

(assert (=> d!8990 m!45423))

(declare-fun m!45447 () Bool)

(assert (=> d!8990 m!45447))

(assert (=> d!8990 m!44605))

(assert (=> d!8990 m!45421))

(declare-fun m!45449 () Bool)

(assert (=> d!8990 m!45449))

(declare-fun m!45451 () Bool)

(assert (=> d!8990 m!45451))

(declare-fun m!45453 () Bool)

(assert (=> d!8990 m!45453))

(assert (=> b!30937 m!44609))

(declare-fun m!45455 () Bool)

(assert (=> b!30937 m!45455))

(declare-fun m!45457 () Bool)

(assert (=> b!30937 m!45457))

(declare-fun m!45459 () Bool)

(assert (=> b!30939 m!45459))

(declare-fun m!45461 () Bool)

(assert (=> b!30941 m!45461))

(declare-fun m!45463 () Bool)

(assert (=> b!30940 m!45463))

(assert (=> b!30940 m!44603))

(assert (=> b!30940 m!44609))

(assert (=> b!30514 d!8990))

(declare-fun d!8992 () Bool)

(declare-fun res!26546 () Bool)

(declare-fun e!20555 () Bool)

(assert (=> d!8992 (=> (not res!26546) (not e!20555))))

(assert (=> d!8992 (= res!26546 (= (size!781 (buf!1109 thiss!1379)) (size!781 (buf!1109 (_2!1688 lt!44418)))))))

(assert (=> d!8992 (= (isPrefixOf!0 thiss!1379 (_2!1688 lt!44418)) e!20555)))

(declare-fun b!30948 () Bool)

(declare-fun res!26544 () Bool)

(assert (=> b!30948 (=> (not res!26544) (not e!20555))))

(assert (=> b!30948 (= res!26544 (bvsle (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)) (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44418))) (currentByte!2458 (_2!1688 lt!44418)) (currentBit!2453 (_2!1688 lt!44418)))))))

(declare-fun b!30949 () Bool)

(declare-fun e!20556 () Bool)

(assert (=> b!30949 (= e!20555 e!20556)))

(declare-fun res!26545 () Bool)

(assert (=> b!30949 (=> res!26545 e!20556)))

(assert (=> b!30949 (= res!26545 (= (size!781 (buf!1109 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30950 () Bool)

(assert (=> b!30950 (= e!20556 (arrayBitRangesEq!0 (buf!1109 thiss!1379) (buf!1109 (_2!1688 lt!44418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379))))))

(assert (= (and d!8992 res!26546) b!30948))

(assert (= (and b!30948 res!26544) b!30949))

(assert (= (and b!30949 (not res!26545)) b!30950))

(assert (=> b!30948 m!44609))

(assert (=> b!30948 m!44571))

(assert (=> b!30950 m!44609))

(assert (=> b!30950 m!44609))

(declare-fun m!45465 () Bool)

(assert (=> b!30950 m!45465))

(assert (=> b!30514 d!8992))

(declare-fun d!8994 () Bool)

(declare-fun res!26549 () Bool)

(declare-fun e!20557 () Bool)

(assert (=> d!8994 (=> (not res!26549) (not e!20557))))

(assert (=> d!8994 (= res!26549 (= (size!781 (buf!1109 (_2!1688 lt!44419))) (size!781 (buf!1109 (_2!1688 lt!44418)))))))

(assert (=> d!8994 (= (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!44418)) e!20557)))

(declare-fun b!30951 () Bool)

(declare-fun res!26547 () Bool)

(assert (=> b!30951 (=> (not res!26547) (not e!20557))))

(assert (=> b!30951 (= res!26547 (bvsle (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))) (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44418))) (currentByte!2458 (_2!1688 lt!44418)) (currentBit!2453 (_2!1688 lt!44418)))))))

(declare-fun b!30952 () Bool)

(declare-fun e!20558 () Bool)

(assert (=> b!30952 (= e!20557 e!20558)))

(declare-fun res!26548 () Bool)

(assert (=> b!30952 (=> res!26548 e!20558)))

(assert (=> b!30952 (= res!26548 (= (size!781 (buf!1109 (_2!1688 lt!44419))) #b00000000000000000000000000000000))))

(declare-fun b!30953 () Bool)

(assert (=> b!30953 (= e!20558 (arrayBitRangesEq!0 (buf!1109 (_2!1688 lt!44419)) (buf!1109 (_2!1688 lt!44418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419)))))))

(assert (= (and d!8994 res!26549) b!30951))

(assert (= (and b!30951 res!26547) b!30952))

(assert (= (and b!30952 (not res!26548)) b!30953))

(assert (=> b!30951 m!44603))

(assert (=> b!30951 m!44571))

(assert (=> b!30953 m!44603))

(assert (=> b!30953 m!44603))

(declare-fun m!45467 () Bool)

(assert (=> b!30953 m!45467))

(assert (=> b!30514 d!8994))

(declare-fun d!8996 () Bool)

(assert (=> d!8996 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 thiss!1379))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 thiss!1379))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2496 () Bool)

(assert (= bs!2496 d!8996))

(declare-fun m!45469 () Bool)

(assert (=> bs!2496 m!45469))

(assert (=> b!30516 d!8996))

(declare-fun d!8998 () Bool)

(assert (=> d!8998 (= (bitAt!0 (buf!1109 (_1!1689 lt!44405)) lt!44408) (not (= (bvand ((_ sign_extend 24) (select (arr!1247 (buf!1109 (_1!1689 lt!44405))) ((_ extract 31 0) (bvsdiv lt!44408 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!44408 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2497 () Bool)

(assert (= bs!2497 d!8998))

(declare-fun m!45471 () Bool)

(assert (=> bs!2497 m!45471))

(declare-fun m!45473 () Bool)

(assert (=> bs!2497 m!45473))

(assert (=> b!30507 d!8998))

(declare-fun d!9000 () Bool)

(assert (=> d!9000 (= (bitAt!0 (buf!1109 (_1!1689 lt!44417)) lt!44408) (not (= (bvand ((_ sign_extend 24) (select (arr!1247 (buf!1109 (_1!1689 lt!44417))) ((_ extract 31 0) (bvsdiv lt!44408 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!44408 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2498 () Bool)

(assert (= bs!2498 d!9000))

(declare-fun m!45475 () Bool)

(assert (=> bs!2498 m!45475))

(assert (=> bs!2498 m!45473))

(assert (=> b!30507 d!9000))

(declare-fun d!9002 () Bool)

(assert (=> d!9002 (= (head!224 (byteArrayBitContentToList!0 (_2!1688 lt!44419) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!502 (byteArrayBitContentToList!0 (_2!1688 lt!44419) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30517 d!9002))

(declare-fun d!9004 () Bool)

(declare-fun c!2079 () Bool)

(assert (=> d!9004 (= c!2079 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20561 () List!387)

(assert (=> d!9004 (= (byteArrayBitContentToList!0 (_2!1688 lt!44419) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20561)))

(declare-fun b!30958 () Bool)

(assert (=> b!30958 (= e!20561 Nil!384)))

(declare-fun b!30959 () Bool)

(assert (=> b!30959 (= e!20561 (Cons!383 (not (= (bvand ((_ sign_extend 24) (select (arr!1247 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1688 lt!44419) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9004 c!2079) b!30958))

(assert (= (and d!9004 (not c!2079)) b!30959))

(assert (=> b!30959 m!44591))

(declare-fun m!45477 () Bool)

(assert (=> b!30959 m!45477))

(declare-fun m!45479 () Bool)

(assert (=> b!30959 m!45479))

(assert (=> b!30517 d!9004))

(declare-fun d!9006 () Bool)

(assert (=> d!9006 (= (head!224 (bitStreamReadBitsIntoList!0 (_2!1688 lt!44419) (_1!1689 lt!44413) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!502 (bitStreamReadBitsIntoList!0 (_2!1688 lt!44419) (_1!1689 lt!44413) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30517 d!9006))

(declare-fun b!30969 () Bool)

(declare-datatypes ((tuple2!3232 0))(
  ( (tuple2!3233 (_1!1703 Bool) (_2!1703 BitStream!1372)) )
))
(declare-fun lt!45404 () tuple2!3232)

(declare-fun lt!45405 () (_ BitVec 64))

(declare-datatypes ((tuple2!3234 0))(
  ( (tuple2!3235 (_1!1704 List!387) (_2!1704 BitStream!1372)) )
))
(declare-fun e!20567 () tuple2!3234)

(assert (=> b!30969 (= e!20567 (tuple2!3235 (Cons!383 (_1!1703 lt!45404) (bitStreamReadBitsIntoList!0 (_2!1688 lt!44419) (_2!1703 lt!45404) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!45405))) (_2!1703 lt!45404)))))

(declare-fun readBit!0 (BitStream!1372) tuple2!3232)

(assert (=> b!30969 (= lt!45404 (readBit!0 (_1!1689 lt!44413)))))

(assert (=> b!30969 (= lt!45405 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30971 () Bool)

(declare-fun e!20566 () Bool)

(declare-fun lt!45406 () List!387)

(assert (=> b!30971 (= e!20566 (> (length!113 lt!45406) 0))))

(declare-fun b!30970 () Bool)

(declare-fun isEmpty!83 (List!387) Bool)

(assert (=> b!30970 (= e!20566 (isEmpty!83 lt!45406))))

(declare-fun d!9008 () Bool)

(assert (=> d!9008 e!20566))

(declare-fun c!2085 () Bool)

(assert (=> d!9008 (= c!2085 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9008 (= lt!45406 (_1!1704 e!20567))))

(declare-fun c!2084 () Bool)

(assert (=> d!9008 (= c!2084 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9008 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9008 (= (bitStreamReadBitsIntoList!0 (_2!1688 lt!44419) (_1!1689 lt!44413) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45406)))

(declare-fun b!30968 () Bool)

(assert (=> b!30968 (= e!20567 (tuple2!3235 Nil!384 (_1!1689 lt!44413)))))

(assert (= (and d!9008 c!2084) b!30968))

(assert (= (and d!9008 (not c!2084)) b!30969))

(assert (= (and d!9008 c!2085) b!30970))

(assert (= (and d!9008 (not c!2085)) b!30971))

(declare-fun m!45481 () Bool)

(assert (=> b!30969 m!45481))

(declare-fun m!45483 () Bool)

(assert (=> b!30969 m!45483))

(declare-fun m!45485 () Bool)

(assert (=> b!30971 m!45485))

(declare-fun m!45487 () Bool)

(assert (=> b!30970 m!45487))

(assert (=> b!30517 d!9008))

(declare-fun d!9010 () Bool)

(assert (=> d!9010 (= (array_inv!739 srcBuffer!2) (bvsge (size!781 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6500 d!9010))

(declare-fun d!9012 () Bool)

(assert (=> d!9012 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2453 thiss!1379) (currentByte!2458 thiss!1379) (size!781 (buf!1109 thiss!1379))))))

(declare-fun bs!2499 () Bool)

(assert (= bs!2499 d!9012))

(declare-fun m!45489 () Bool)

(assert (=> bs!2499 m!45489))

(assert (=> start!6500 d!9012))

(declare-fun d!9014 () Bool)

(assert (=> d!9014 (= (invariant!0 (currentBit!2453 (_2!1688 lt!44418)) (currentByte!2458 (_2!1688 lt!44418)) (size!781 (buf!1109 (_2!1688 lt!44418)))) (and (bvsge (currentBit!2453 (_2!1688 lt!44418)) #b00000000000000000000000000000000) (bvslt (currentBit!2453 (_2!1688 lt!44418)) #b00000000000000000000000000001000) (bvsge (currentByte!2458 (_2!1688 lt!44418)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2458 (_2!1688 lt!44418)) (size!781 (buf!1109 (_2!1688 lt!44418)))) (and (= (currentBit!2453 (_2!1688 lt!44418)) #b00000000000000000000000000000000) (= (currentByte!2458 (_2!1688 lt!44418)) (size!781 (buf!1109 (_2!1688 lt!44418))))))))))

(assert (=> b!30506 d!9014))

(declare-fun d!9016 () Bool)

(assert (=> d!9016 (= (invariant!0 (currentBit!2453 (_2!1688 lt!44419)) (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44418)))) (and (bvsge (currentBit!2453 (_2!1688 lt!44419)) #b00000000000000000000000000000000) (bvslt (currentBit!2453 (_2!1688 lt!44419)) #b00000000000000000000000000001000) (bvsge (currentByte!2458 (_2!1688 lt!44419)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44418)))) (and (= (currentBit!2453 (_2!1688 lt!44419)) #b00000000000000000000000000000000) (= (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44418))))))))))

(assert (=> b!30508 d!9016))

(declare-fun d!9018 () Bool)

(declare-fun res!26552 () Bool)

(declare-fun e!20568 () Bool)

(assert (=> d!9018 (=> (not res!26552) (not e!20568))))

(assert (=> d!9018 (= res!26552 (= (size!781 (buf!1109 thiss!1379)) (size!781 (buf!1109 (_2!1688 lt!44419)))))))

(assert (=> d!9018 (= (isPrefixOf!0 thiss!1379 (_2!1688 lt!44419)) e!20568)))

(declare-fun b!30972 () Bool)

(declare-fun res!26550 () Bool)

(assert (=> b!30972 (=> (not res!26550) (not e!20568))))

(assert (=> b!30972 (= res!26550 (bvsle (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)) (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419)))))))

(declare-fun b!30973 () Bool)

(declare-fun e!20569 () Bool)

(assert (=> b!30973 (= e!20568 e!20569)))

(declare-fun res!26551 () Bool)

(assert (=> b!30973 (=> res!26551 e!20569)))

(assert (=> b!30973 (= res!26551 (= (size!781 (buf!1109 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30974 () Bool)

(assert (=> b!30974 (= e!20569 (arrayBitRangesEq!0 (buf!1109 thiss!1379) (buf!1109 (_2!1688 lt!44419)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379))))))

(assert (= (and d!9018 res!26552) b!30972))

(assert (= (and b!30972 res!26550) b!30973))

(assert (= (and b!30973 (not res!26551)) b!30974))

(assert (=> b!30972 m!44609))

(assert (=> b!30972 m!44603))

(assert (=> b!30974 m!44609))

(assert (=> b!30974 m!44609))

(declare-fun m!45491 () Bool)

(assert (=> b!30974 m!45491))

(assert (=> b!30520 d!9018))

(declare-fun d!9020 () Bool)

(assert (=> d!9020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!44414) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419)))) lt!44414))))

(declare-fun bs!2500 () Bool)

(assert (= bs!2500 d!9020))

(declare-fun m!45493 () Bool)

(assert (=> bs!2500 m!45493))

(assert (=> b!30520 d!9020))

(declare-fun d!9022 () Bool)

(declare-fun e!20572 () Bool)

(assert (=> d!9022 e!20572))

(declare-fun res!26555 () Bool)

(assert (=> d!9022 (=> (not res!26555) (not e!20572))))

(assert (=> d!9022 (= res!26555 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45409 () Unit!2345)

(declare-fun choose!27 (BitStream!1372 BitStream!1372 (_ BitVec 64) (_ BitVec 64)) Unit!2345)

(assert (=> d!9022 (= lt!45409 (choose!27 thiss!1379 (_2!1688 lt!44419) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9022 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9022 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1688 lt!44419) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45409)))

(declare-fun b!30977 () Bool)

(assert (=> b!30977 (= e!20572 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9022 res!26555) b!30977))

(declare-fun m!45495 () Bool)

(assert (=> d!9022 m!45495))

(declare-fun m!45497 () Bool)

(assert (=> b!30977 m!45497))

(assert (=> b!30520 d!9022))

(declare-fun b!30995 () Bool)

(declare-fun e!20582 () Bool)

(declare-datatypes ((tuple2!3236 0))(
  ( (tuple2!3237 (_1!1705 BitStream!1372) (_2!1705 Bool)) )
))
(declare-fun lt!45434 () tuple2!3236)

(declare-fun lt!45445 () tuple2!3202)

(assert (=> b!30995 (= e!20582 (= (bitIndex!0 (size!781 (buf!1109 (_1!1705 lt!45434))) (currentByte!2458 (_1!1705 lt!45434)) (currentBit!2453 (_1!1705 lt!45434))) (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45445))) (currentByte!2458 (_2!1688 lt!45445)) (currentBit!2453 (_2!1688 lt!45445)))))))

(declare-fun b!30996 () Bool)

(declare-fun e!20581 () Bool)

(assert (=> b!30996 (= e!20581 e!20582)))

(declare-fun res!26576 () Bool)

(assert (=> b!30996 (=> (not res!26576) (not e!20582))))

(declare-fun lt!45440 () (_ BitVec 8))

(assert (=> b!30996 (= res!26576 (and (= (_2!1705 lt!45434) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1247 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!45440)) #b00000000000000000000000000000000))) (= (_1!1705 lt!45434) (_2!1688 lt!45445))))))

(declare-fun lt!45437 () tuple2!3228)

(declare-fun lt!45436 () BitStream!1372)

(assert (=> b!30996 (= lt!45437 (readBits!0 lt!45436 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1372) tuple2!3236)

(assert (=> b!30996 (= lt!45434 (readBitPure!0 lt!45436))))

(declare-fun readerFrom!0 (BitStream!1372 (_ BitVec 32) (_ BitVec 32)) BitStream!1372)

(assert (=> b!30996 (= lt!45436 (readerFrom!0 (_2!1688 lt!45445) (currentBit!2453 thiss!1379) (currentByte!2458 thiss!1379)))))

(declare-fun b!30998 () Bool)

(declare-fun e!20584 () Bool)

(declare-fun e!20583 () Bool)

(assert (=> b!30998 (= e!20584 e!20583)))

(declare-fun res!26574 () Bool)

(assert (=> b!30998 (=> (not res!26574) (not e!20583))))

(declare-fun lt!45443 () tuple2!3236)

(declare-fun lt!45439 () Bool)

(declare-fun lt!45442 () tuple2!3202)

(assert (=> b!30998 (= res!26574 (and (= (_2!1705 lt!45443) lt!45439) (= (_1!1705 lt!45443) (_2!1688 lt!45442))))))

(assert (=> b!30998 (= lt!45443 (readBitPure!0 (readerFrom!0 (_2!1688 lt!45442) (currentBit!2453 thiss!1379) (currentByte!2458 thiss!1379))))))

(declare-fun b!30999 () Bool)

(assert (=> b!30999 (= e!20583 (= (bitIndex!0 (size!781 (buf!1109 (_1!1705 lt!45443))) (currentByte!2458 (_1!1705 lt!45443)) (currentBit!2453 (_1!1705 lt!45443))) (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45442))) (currentByte!2458 (_2!1688 lt!45442)) (currentBit!2453 (_2!1688 lt!45442)))))))

(declare-fun b!31000 () Bool)

(declare-fun res!26577 () Bool)

(assert (=> b!31000 (=> (not res!26577) (not e!20584))))

(assert (=> b!31000 (= res!26577 (isPrefixOf!0 thiss!1379 (_2!1688 lt!45442)))))

(declare-fun b!31001 () Bool)

(declare-fun res!26575 () Bool)

(assert (=> b!31001 (=> (not res!26575) (not e!20581))))

(declare-fun lt!45438 () (_ BitVec 64))

(declare-fun lt!45444 () (_ BitVec 64))

(assert (=> b!31001 (= res!26575 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45445))) (currentByte!2458 (_2!1688 lt!45445)) (currentBit!2453 (_2!1688 lt!45445))) (bvadd lt!45444 lt!45438)))))

(assert (=> b!31001 (or (not (= (bvand lt!45444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45438 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!45444 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!45444 lt!45438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31001 (= lt!45438 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!31001 (= lt!45444 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(declare-fun b!31002 () Bool)

(declare-fun res!26579 () Bool)

(assert (=> b!31002 (=> (not res!26579) (not e!20581))))

(assert (=> b!31002 (= res!26579 (isPrefixOf!0 thiss!1379 (_2!1688 lt!45445)))))

(declare-fun d!9024 () Bool)

(assert (=> d!9024 e!20581))

(declare-fun res!26572 () Bool)

(assert (=> d!9024 (=> (not res!26572) (not e!20581))))

(assert (=> d!9024 (= res!26572 (= (size!781 (buf!1109 (_2!1688 lt!45445))) (size!781 (buf!1109 thiss!1379))))))

(declare-fun lt!45435 () array!1787)

(assert (=> d!9024 (= lt!45440 (select (arr!1247 lt!45435) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9024 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!781 lt!45435)))))

(assert (=> d!9024 (= lt!45435 (array!1788 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!45441 () tuple2!3202)

(assert (=> d!9024 (= lt!45445 (tuple2!3203 (_1!1688 lt!45441) (_2!1688 lt!45441)))))

(assert (=> d!9024 (= lt!45441 lt!45442)))

(assert (=> d!9024 e!20584))

(declare-fun res!26573 () Bool)

(assert (=> d!9024 (=> (not res!26573) (not e!20584))))

(assert (=> d!9024 (= res!26573 (= (size!781 (buf!1109 thiss!1379)) (size!781 (buf!1109 (_2!1688 lt!45442)))))))

(declare-fun appendBit!0 (BitStream!1372 Bool) tuple2!3202)

(assert (=> d!9024 (= lt!45442 (appendBit!0 thiss!1379 lt!45439))))

(assert (=> d!9024 (= lt!45439 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1247 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9024 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9024 (= (appendBitFromByte!0 thiss!1379 (select (arr!1247 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!45445)))

(declare-fun b!30997 () Bool)

(declare-fun res!26578 () Bool)

(assert (=> b!30997 (=> (not res!26578) (not e!20584))))

(assert (=> b!30997 (= res!26578 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!45442))) (currentByte!2458 (_2!1688 lt!45442)) (currentBit!2453 (_2!1688 lt!45442))) (bvadd (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9024 res!26573) b!30997))

(assert (= (and b!30997 res!26578) b!31000))

(assert (= (and b!31000 res!26577) b!30998))

(assert (= (and b!30998 res!26574) b!30999))

(assert (= (and d!9024 res!26572) b!31001))

(assert (= (and b!31001 res!26575) b!31002))

(assert (= (and b!31002 res!26579) b!30996))

(assert (= (and b!30996 res!26576) b!30995))

(declare-fun m!45499 () Bool)

(assert (=> b!30997 m!45499))

(assert (=> b!30997 m!44609))

(declare-fun m!45501 () Bool)

(assert (=> b!30999 m!45501))

(assert (=> b!30999 m!45499))

(declare-fun m!45503 () Bool)

(assert (=> b!31002 m!45503))

(declare-fun m!45505 () Bool)

(assert (=> b!31000 m!45505))

(declare-fun m!45507 () Bool)

(assert (=> b!30998 m!45507))

(assert (=> b!30998 m!45507))

(declare-fun m!45509 () Bool)

(assert (=> b!30998 m!45509))

(declare-fun m!45511 () Bool)

(assert (=> b!30995 m!45511))

(declare-fun m!45513 () Bool)

(assert (=> b!30995 m!45513))

(assert (=> b!31001 m!45513))

(assert (=> b!31001 m!44609))

(declare-fun m!45515 () Bool)

(assert (=> b!30996 m!45515))

(declare-fun m!45517 () Bool)

(assert (=> b!30996 m!45517))

(declare-fun m!45519 () Bool)

(assert (=> b!30996 m!45519))

(declare-fun m!45521 () Bool)

(assert (=> d!9024 m!45521))

(declare-fun m!45523 () Bool)

(assert (=> d!9024 m!45523))

(assert (=> d!9024 m!45477))

(assert (=> b!30520 d!9024))

(declare-fun d!9026 () Bool)

(assert (=> d!9026 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2501 () Bool)

(assert (= bs!2501 d!9026))

(declare-fun m!45525 () Bool)

(assert (=> bs!2501 m!45525))

(assert (=> b!30509 d!9026))

(declare-fun e!20586 () tuple2!3234)

(declare-fun lt!45446 () tuple2!3232)

(declare-fun b!31004 () Bool)

(declare-fun lt!45447 () (_ BitVec 64))

(assert (=> b!31004 (= e!20586 (tuple2!3235 (Cons!383 (_1!1703 lt!45446) (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_2!1703 lt!45446) (bvsub (bvsub to!314 i!635) lt!45447))) (_2!1703 lt!45446)))))

(assert (=> b!31004 (= lt!45446 (readBit!0 (_1!1689 lt!44405)))))

(assert (=> b!31004 (= lt!45447 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31006 () Bool)

(declare-fun e!20585 () Bool)

(declare-fun lt!45448 () List!387)

(assert (=> b!31006 (= e!20585 (> (length!113 lt!45448) 0))))

(declare-fun b!31005 () Bool)

(assert (=> b!31005 (= e!20585 (isEmpty!83 lt!45448))))

(declare-fun d!9028 () Bool)

(assert (=> d!9028 e!20585))

(declare-fun c!2087 () Bool)

(assert (=> d!9028 (= c!2087 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9028 (= lt!45448 (_1!1704 e!20586))))

(declare-fun c!2086 () Bool)

(assert (=> d!9028 (= c!2086 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9028 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9028 (= (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_1!1689 lt!44405) (bvsub to!314 i!635)) lt!45448)))

(declare-fun b!31003 () Bool)

(assert (=> b!31003 (= e!20586 (tuple2!3235 Nil!384 (_1!1689 lt!44405)))))

(assert (= (and d!9028 c!2086) b!31003))

(assert (= (and d!9028 (not c!2086)) b!31004))

(assert (= (and d!9028 c!2087) b!31005))

(assert (= (and d!9028 (not c!2087)) b!31006))

(declare-fun m!45527 () Bool)

(assert (=> b!31004 m!45527))

(declare-fun m!45529 () Bool)

(assert (=> b!31004 m!45529))

(declare-fun m!45531 () Bool)

(assert (=> b!31006 m!45531))

(declare-fun m!45533 () Bool)

(assert (=> b!31005 m!45533))

(assert (=> b!30509 d!9028))

(declare-fun d!9030 () Bool)

(assert (=> d!9030 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!44414)))

(declare-fun lt!45449 () Unit!2345)

(assert (=> d!9030 (= lt!45449 (choose!9 (_2!1688 lt!44419) (buf!1109 (_2!1688 lt!44418)) lt!44414 (BitStream!1373 (buf!1109 (_2!1688 lt!44418)) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419)))))))

(assert (=> d!9030 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1688 lt!44419) (buf!1109 (_2!1688 lt!44418)) lt!44414) lt!45449)))

(declare-fun bs!2502 () Bool)

(assert (= bs!2502 d!9030))

(assert (=> bs!2502 m!44581))

(declare-fun m!45535 () Bool)

(assert (=> bs!2502 m!45535))

(assert (=> b!30509 d!9030))

(declare-fun d!9032 () Bool)

(assert (=> d!9032 (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!45450 () Unit!2345)

(assert (=> d!9032 (= lt!45450 (choose!9 thiss!1379 (buf!1109 (_2!1688 lt!44418)) (bvsub to!314 i!635) (BitStream!1373 (buf!1109 (_2!1688 lt!44418)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379))))))

(assert (=> d!9032 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1109 (_2!1688 lt!44418)) (bvsub to!314 i!635)) lt!45450)))

(declare-fun bs!2503 () Bool)

(assert (= bs!2503 d!9032))

(assert (=> bs!2503 m!44585))

(declare-fun m!45537 () Bool)

(assert (=> bs!2503 m!45537))

(assert (=> b!30509 d!9032))

(declare-fun b!31007 () Bool)

(declare-fun e!20588 () Unit!2345)

(declare-fun lt!45454 () Unit!2345)

(assert (=> b!31007 (= e!20588 lt!45454)))

(declare-fun lt!45465 () (_ BitVec 64))

(assert (=> b!31007 (= lt!45465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45459 () (_ BitVec 64))

(assert (=> b!31007 (= lt!45459 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(assert (=> b!31007 (= lt!45454 (arrayBitRangesEqSymmetric!0 (buf!1109 thiss!1379) (buf!1109 (_2!1688 lt!44418)) lt!45465 lt!45459))))

(assert (=> b!31007 (arrayBitRangesEq!0 (buf!1109 (_2!1688 lt!44418)) (buf!1109 thiss!1379) lt!45465 lt!45459)))

(declare-fun b!31008 () Bool)

(declare-fun Unit!2379 () Unit!2345)

(assert (=> b!31008 (= e!20588 Unit!2379)))

(declare-fun b!31009 () Bool)

(declare-fun res!26580 () Bool)

(declare-fun e!20587 () Bool)

(assert (=> b!31009 (=> (not res!26580) (not e!20587))))

(declare-fun lt!45451 () tuple2!3204)

(assert (=> b!31009 (= res!26580 (isPrefixOf!0 (_1!1689 lt!45451) thiss!1379))))

(declare-fun b!31010 () Bool)

(declare-fun lt!45467 () (_ BitVec 64))

(declare-fun lt!45458 () (_ BitVec 64))

(assert (=> b!31010 (= e!20587 (= (_1!1689 lt!45451) (withMovedBitIndex!0 (_2!1689 lt!45451) (bvsub lt!45467 lt!45458))))))

(assert (=> b!31010 (or (= (bvand lt!45467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45467 lt!45458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31010 (= lt!45458 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44418))) (currentByte!2458 (_2!1688 lt!44418)) (currentBit!2453 (_2!1688 lt!44418))))))

(assert (=> b!31010 (= lt!45467 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(declare-fun d!9034 () Bool)

(assert (=> d!9034 e!20587))

(declare-fun res!26581 () Bool)

(assert (=> d!9034 (=> (not res!26581) (not e!20587))))

(assert (=> d!9034 (= res!26581 (isPrefixOf!0 (_1!1689 lt!45451) (_2!1689 lt!45451)))))

(declare-fun lt!45470 () BitStream!1372)

(assert (=> d!9034 (= lt!45451 (tuple2!3205 lt!45470 (_2!1688 lt!44418)))))

(declare-fun lt!45463 () Unit!2345)

(declare-fun lt!45466 () Unit!2345)

(assert (=> d!9034 (= lt!45463 lt!45466)))

(assert (=> d!9034 (isPrefixOf!0 lt!45470 (_2!1688 lt!44418))))

(assert (=> d!9034 (= lt!45466 (lemmaIsPrefixTransitive!0 lt!45470 (_2!1688 lt!44418) (_2!1688 lt!44418)))))

(declare-fun lt!45469 () Unit!2345)

(declare-fun lt!45455 () Unit!2345)

(assert (=> d!9034 (= lt!45469 lt!45455)))

(assert (=> d!9034 (isPrefixOf!0 lt!45470 (_2!1688 lt!44418))))

(assert (=> d!9034 (= lt!45455 (lemmaIsPrefixTransitive!0 lt!45470 thiss!1379 (_2!1688 lt!44418)))))

(declare-fun lt!45460 () Unit!2345)

(assert (=> d!9034 (= lt!45460 e!20588)))

(declare-fun c!2088 () Bool)

(assert (=> d!9034 (= c!2088 (not (= (size!781 (buf!1109 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!45453 () Unit!2345)

(declare-fun lt!45464 () Unit!2345)

(assert (=> d!9034 (= lt!45453 lt!45464)))

(assert (=> d!9034 (isPrefixOf!0 (_2!1688 lt!44418) (_2!1688 lt!44418))))

(assert (=> d!9034 (= lt!45464 (lemmaIsPrefixRefl!0 (_2!1688 lt!44418)))))

(declare-fun lt!45452 () Unit!2345)

(declare-fun lt!45461 () Unit!2345)

(assert (=> d!9034 (= lt!45452 lt!45461)))

(assert (=> d!9034 (= lt!45461 (lemmaIsPrefixRefl!0 (_2!1688 lt!44418)))))

(declare-fun lt!45468 () Unit!2345)

(declare-fun lt!45462 () Unit!2345)

(assert (=> d!9034 (= lt!45468 lt!45462)))

(assert (=> d!9034 (isPrefixOf!0 lt!45470 lt!45470)))

(assert (=> d!9034 (= lt!45462 (lemmaIsPrefixRefl!0 lt!45470))))

(declare-fun lt!45457 () Unit!2345)

(declare-fun lt!45456 () Unit!2345)

(assert (=> d!9034 (= lt!45457 lt!45456)))

(assert (=> d!9034 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9034 (= lt!45456 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9034 (= lt!45470 (BitStream!1373 (buf!1109 (_2!1688 lt!44418)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)))))

(assert (=> d!9034 (isPrefixOf!0 thiss!1379 (_2!1688 lt!44418))))

(assert (=> d!9034 (= (reader!0 thiss!1379 (_2!1688 lt!44418)) lt!45451)))

(declare-fun b!31011 () Bool)

(declare-fun res!26582 () Bool)

(assert (=> b!31011 (=> (not res!26582) (not e!20587))))

(assert (=> b!31011 (= res!26582 (isPrefixOf!0 (_2!1689 lt!45451) (_2!1688 lt!44418)))))

(assert (= (and d!9034 c!2088) b!31007))

(assert (= (and d!9034 (not c!2088)) b!31008))

(assert (= (and d!9034 res!26581) b!31009))

(assert (= (and b!31009 res!26580) b!31011))

(assert (= (and b!31011 res!26582) b!31010))

(assert (=> d!9034 m!44607))

(assert (=> d!9034 m!44619))

(declare-fun m!45539 () Bool)

(assert (=> d!9034 m!45539))

(declare-fun m!45541 () Bool)

(assert (=> d!9034 m!45541))

(declare-fun m!45543 () Bool)

(assert (=> d!9034 m!45543))

(declare-fun m!45545 () Bool)

(assert (=> d!9034 m!45545))

(assert (=> d!9034 m!44605))

(declare-fun m!45547 () Bool)

(assert (=> d!9034 m!45547))

(declare-fun m!45549 () Bool)

(assert (=> d!9034 m!45549))

(declare-fun m!45551 () Bool)

(assert (=> d!9034 m!45551))

(declare-fun m!45553 () Bool)

(assert (=> d!9034 m!45553))

(assert (=> b!31007 m!44609))

(declare-fun m!45555 () Bool)

(assert (=> b!31007 m!45555))

(declare-fun m!45557 () Bool)

(assert (=> b!31007 m!45557))

(declare-fun m!45559 () Bool)

(assert (=> b!31009 m!45559))

(declare-fun m!45561 () Bool)

(assert (=> b!31011 m!45561))

(declare-fun m!45563 () Bool)

(assert (=> b!31010 m!45563))

(assert (=> b!31010 m!44571))

(assert (=> b!31010 m!44609))

(assert (=> b!30509 d!9034))

(declare-fun b!31013 () Bool)

(declare-fun lt!45472 () (_ BitVec 64))

(declare-fun e!20590 () tuple2!3234)

(declare-fun lt!45471 () tuple2!3232)

(assert (=> b!31013 (= e!20590 (tuple2!3235 (Cons!383 (_1!1703 lt!45471) (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_2!1703 lt!45471) (bvsub lt!44414 lt!45472))) (_2!1703 lt!45471)))))

(assert (=> b!31013 (= lt!45471 (readBit!0 (_1!1689 lt!44417)))))

(assert (=> b!31013 (= lt!45472 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31015 () Bool)

(declare-fun e!20589 () Bool)

(declare-fun lt!45473 () List!387)

(assert (=> b!31015 (= e!20589 (> (length!113 lt!45473) 0))))

(declare-fun b!31014 () Bool)

(assert (=> b!31014 (= e!20589 (isEmpty!83 lt!45473))))

(declare-fun d!9036 () Bool)

(assert (=> d!9036 e!20589))

(declare-fun c!2090 () Bool)

(assert (=> d!9036 (= c!2090 (= lt!44414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9036 (= lt!45473 (_1!1704 e!20590))))

(declare-fun c!2089 () Bool)

(assert (=> d!9036 (= c!2089 (= lt!44414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9036 (bvsge lt!44414 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9036 (= (bitStreamReadBitsIntoList!0 (_2!1688 lt!44418) (_1!1689 lt!44417) lt!44414) lt!45473)))

(declare-fun b!31012 () Bool)

(assert (=> b!31012 (= e!20590 (tuple2!3235 Nil!384 (_1!1689 lt!44417)))))

(assert (= (and d!9036 c!2089) b!31012))

(assert (= (and d!9036 (not c!2089)) b!31013))

(assert (= (and d!9036 c!2090) b!31014))

(assert (= (and d!9036 (not c!2090)) b!31015))

(declare-fun m!45565 () Bool)

(assert (=> b!31013 m!45565))

(declare-fun m!45567 () Bool)

(assert (=> b!31013 m!45567))

(declare-fun m!45569 () Bool)

(assert (=> b!31015 m!45569))

(declare-fun m!45571 () Bool)

(assert (=> b!31014 m!45571))

(assert (=> b!30509 d!9036))

(declare-fun b!31016 () Bool)

(declare-fun e!20592 () Unit!2345)

(declare-fun lt!45477 () Unit!2345)

(assert (=> b!31016 (= e!20592 lt!45477)))

(declare-fun lt!45488 () (_ BitVec 64))

(assert (=> b!31016 (= lt!45488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45482 () (_ BitVec 64))

(assert (=> b!31016 (= lt!45482 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))))))

(assert (=> b!31016 (= lt!45477 (arrayBitRangesEqSymmetric!0 (buf!1109 (_2!1688 lt!44419)) (buf!1109 (_2!1688 lt!44418)) lt!45488 lt!45482))))

(assert (=> b!31016 (arrayBitRangesEq!0 (buf!1109 (_2!1688 lt!44418)) (buf!1109 (_2!1688 lt!44419)) lt!45488 lt!45482)))

(declare-fun b!31017 () Bool)

(declare-fun Unit!2380 () Unit!2345)

(assert (=> b!31017 (= e!20592 Unit!2380)))

(declare-fun b!31018 () Bool)

(declare-fun res!26583 () Bool)

(declare-fun e!20591 () Bool)

(assert (=> b!31018 (=> (not res!26583) (not e!20591))))

(declare-fun lt!45474 () tuple2!3204)

(assert (=> b!31018 (= res!26583 (isPrefixOf!0 (_1!1689 lt!45474) (_2!1688 lt!44419)))))

(declare-fun b!31019 () Bool)

(declare-fun lt!45490 () (_ BitVec 64))

(declare-fun lt!45481 () (_ BitVec 64))

(assert (=> b!31019 (= e!20591 (= (_1!1689 lt!45474) (withMovedBitIndex!0 (_2!1689 lt!45474) (bvsub lt!45490 lt!45481))))))

(assert (=> b!31019 (or (= (bvand lt!45490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45490 lt!45481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31019 (= lt!45481 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44418))) (currentByte!2458 (_2!1688 lt!44418)) (currentBit!2453 (_2!1688 lt!44418))))))

(assert (=> b!31019 (= lt!45490 (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))))))

(declare-fun d!9038 () Bool)

(assert (=> d!9038 e!20591))

(declare-fun res!26584 () Bool)

(assert (=> d!9038 (=> (not res!26584) (not e!20591))))

(assert (=> d!9038 (= res!26584 (isPrefixOf!0 (_1!1689 lt!45474) (_2!1689 lt!45474)))))

(declare-fun lt!45493 () BitStream!1372)

(assert (=> d!9038 (= lt!45474 (tuple2!3205 lt!45493 (_2!1688 lt!44418)))))

(declare-fun lt!45486 () Unit!2345)

(declare-fun lt!45489 () Unit!2345)

(assert (=> d!9038 (= lt!45486 lt!45489)))

(assert (=> d!9038 (isPrefixOf!0 lt!45493 (_2!1688 lt!44418))))

(assert (=> d!9038 (= lt!45489 (lemmaIsPrefixTransitive!0 lt!45493 (_2!1688 lt!44418) (_2!1688 lt!44418)))))

(declare-fun lt!45492 () Unit!2345)

(declare-fun lt!45478 () Unit!2345)

(assert (=> d!9038 (= lt!45492 lt!45478)))

(assert (=> d!9038 (isPrefixOf!0 lt!45493 (_2!1688 lt!44418))))

(assert (=> d!9038 (= lt!45478 (lemmaIsPrefixTransitive!0 lt!45493 (_2!1688 lt!44419) (_2!1688 lt!44418)))))

(declare-fun lt!45483 () Unit!2345)

(assert (=> d!9038 (= lt!45483 e!20592)))

(declare-fun c!2091 () Bool)

(assert (=> d!9038 (= c!2091 (not (= (size!781 (buf!1109 (_2!1688 lt!44419))) #b00000000000000000000000000000000)))))

(declare-fun lt!45476 () Unit!2345)

(declare-fun lt!45487 () Unit!2345)

(assert (=> d!9038 (= lt!45476 lt!45487)))

(assert (=> d!9038 (isPrefixOf!0 (_2!1688 lt!44418) (_2!1688 lt!44418))))

(assert (=> d!9038 (= lt!45487 (lemmaIsPrefixRefl!0 (_2!1688 lt!44418)))))

(declare-fun lt!45475 () Unit!2345)

(declare-fun lt!45484 () Unit!2345)

(assert (=> d!9038 (= lt!45475 lt!45484)))

(assert (=> d!9038 (= lt!45484 (lemmaIsPrefixRefl!0 (_2!1688 lt!44418)))))

(declare-fun lt!45491 () Unit!2345)

(declare-fun lt!45485 () Unit!2345)

(assert (=> d!9038 (= lt!45491 lt!45485)))

(assert (=> d!9038 (isPrefixOf!0 lt!45493 lt!45493)))

(assert (=> d!9038 (= lt!45485 (lemmaIsPrefixRefl!0 lt!45493))))

(declare-fun lt!45480 () Unit!2345)

(declare-fun lt!45479 () Unit!2345)

(assert (=> d!9038 (= lt!45480 lt!45479)))

(assert (=> d!9038 (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!44419))))

(assert (=> d!9038 (= lt!45479 (lemmaIsPrefixRefl!0 (_2!1688 lt!44419)))))

(assert (=> d!9038 (= lt!45493 (BitStream!1373 (buf!1109 (_2!1688 lt!44418)) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))))))

(assert (=> d!9038 (isPrefixOf!0 (_2!1688 lt!44419) (_2!1688 lt!44418))))

(assert (=> d!9038 (= (reader!0 (_2!1688 lt!44419) (_2!1688 lt!44418)) lt!45474)))

(declare-fun b!31020 () Bool)

(declare-fun res!26585 () Bool)

(assert (=> b!31020 (=> (not res!26585) (not e!20591))))

(assert (=> b!31020 (= res!26585 (isPrefixOf!0 (_2!1689 lt!45474) (_2!1688 lt!44418)))))

(assert (= (and d!9038 c!2091) b!31016))

(assert (= (and d!9038 (not c!2091)) b!31017))

(assert (= (and d!9038 res!26584) b!31018))

(assert (= (and b!31018 res!26583) b!31020))

(assert (= (and b!31020 res!26585) b!31019))

(assert (=> d!9038 m!45423))

(assert (=> d!9038 m!44629))

(declare-fun m!45573 () Bool)

(assert (=> d!9038 m!45573))

(declare-fun m!45575 () Bool)

(assert (=> d!9038 m!45575))

(assert (=> d!9038 m!45543))

(declare-fun m!45577 () Bool)

(assert (=> d!9038 m!45577))

(assert (=> d!9038 m!45421))

(assert (=> d!9038 m!45547))

(declare-fun m!45579 () Bool)

(assert (=> d!9038 m!45579))

(declare-fun m!45581 () Bool)

(assert (=> d!9038 m!45581))

(declare-fun m!45583 () Bool)

(assert (=> d!9038 m!45583))

(assert (=> b!31016 m!44603))

(declare-fun m!45585 () Bool)

(assert (=> b!31016 m!45585))

(declare-fun m!45587 () Bool)

(assert (=> b!31016 m!45587))

(declare-fun m!45589 () Bool)

(assert (=> b!31018 m!45589))

(declare-fun m!45591 () Bool)

(assert (=> b!31020 m!45591))

(declare-fun m!45593 () Bool)

(assert (=> b!31019 m!45593))

(assert (=> b!31019 m!44571))

(assert (=> b!31019 m!44603))

(assert (=> b!30509 d!9038))

(declare-fun d!9040 () Bool)

(assert (=> d!9040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419))) lt!44414) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419)))) lt!44414))))

(declare-fun bs!2504 () Bool)

(assert (= bs!2504 d!9040))

(declare-fun m!45595 () Bool)

(assert (=> bs!2504 m!45595))

(assert (=> b!30509 d!9040))

(declare-fun d!9042 () Bool)

(declare-fun res!26588 () Bool)

(declare-fun e!20593 () Bool)

(assert (=> d!9042 (=> (not res!26588) (not e!20593))))

(assert (=> d!9042 (= res!26588 (= (size!781 (buf!1109 thiss!1379)) (size!781 (buf!1109 thiss!1379))))))

(assert (=> d!9042 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20593)))

(declare-fun b!31021 () Bool)

(declare-fun res!26586 () Bool)

(assert (=> b!31021 (=> (not res!26586) (not e!20593))))

(assert (=> b!31021 (= res!26586 (bvsle (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)) (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379))))))

(declare-fun b!31022 () Bool)

(declare-fun e!20594 () Bool)

(assert (=> b!31022 (= e!20593 e!20594)))

(declare-fun res!26587 () Bool)

(assert (=> b!31022 (=> res!26587 e!20594)))

(assert (=> b!31022 (= res!26587 (= (size!781 (buf!1109 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31023 () Bool)

(assert (=> b!31023 (= e!20594 (arrayBitRangesEq!0 (buf!1109 thiss!1379) (buf!1109 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379))))))

(assert (= (and d!9042 res!26588) b!31021))

(assert (= (and b!31021 res!26586) b!31022))

(assert (= (and b!31022 (not res!26587)) b!31023))

(assert (=> b!31021 m!44609))

(assert (=> b!31021 m!44609))

(assert (=> b!31023 m!44609))

(assert (=> b!31023 m!44609))

(declare-fun m!45597 () Bool)

(assert (=> b!31023 m!45597))

(assert (=> b!30511 d!9042))

(declare-fun d!9044 () Bool)

(assert (=> d!9044 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45496 () Unit!2345)

(declare-fun choose!11 (BitStream!1372) Unit!2345)

(assert (=> d!9044 (= lt!45496 (choose!11 thiss!1379))))

(assert (=> d!9044 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!45496)))

(declare-fun bs!2506 () Bool)

(assert (= bs!2506 d!9044))

(assert (=> bs!2506 m!44605))

(declare-fun m!45599 () Bool)

(assert (=> bs!2506 m!45599))

(assert (=> b!30511 d!9044))

(declare-fun d!9046 () Bool)

(declare-fun e!20597 () Bool)

(assert (=> d!9046 e!20597))

(declare-fun res!26593 () Bool)

(assert (=> d!9046 (=> (not res!26593) (not e!20597))))

(declare-fun lt!45513 () (_ BitVec 64))

(declare-fun lt!45514 () (_ BitVec 64))

(declare-fun lt!45509 () (_ BitVec 64))

(assert (=> d!9046 (= res!26593 (= lt!45513 (bvsub lt!45509 lt!45514)))))

(assert (=> d!9046 (or (= (bvand lt!45509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45509 lt!45514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9046 (= lt!45514 (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 thiss!1379))) ((_ sign_extend 32) (currentByte!2458 thiss!1379)) ((_ sign_extend 32) (currentBit!2453 thiss!1379))))))

(declare-fun lt!45510 () (_ BitVec 64))

(declare-fun lt!45512 () (_ BitVec 64))

(assert (=> d!9046 (= lt!45509 (bvmul lt!45510 lt!45512))))

(assert (=> d!9046 (or (= lt!45510 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45512 (bvsdiv (bvmul lt!45510 lt!45512) lt!45510)))))

(assert (=> d!9046 (= lt!45512 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9046 (= lt!45510 ((_ sign_extend 32) (size!781 (buf!1109 thiss!1379))))))

(assert (=> d!9046 (= lt!45513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2458 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2453 thiss!1379))))))

(assert (=> d!9046 (invariant!0 (currentBit!2453 thiss!1379) (currentByte!2458 thiss!1379) (size!781 (buf!1109 thiss!1379)))))

(assert (=> d!9046 (= (bitIndex!0 (size!781 (buf!1109 thiss!1379)) (currentByte!2458 thiss!1379) (currentBit!2453 thiss!1379)) lt!45513)))

(declare-fun b!31028 () Bool)

(declare-fun res!26594 () Bool)

(assert (=> b!31028 (=> (not res!26594) (not e!20597))))

(assert (=> b!31028 (= res!26594 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45513))))

(declare-fun b!31029 () Bool)

(declare-fun lt!45511 () (_ BitVec 64))

(assert (=> b!31029 (= e!20597 (bvsle lt!45513 (bvmul lt!45511 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31029 (or (= lt!45511 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45511 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45511)))))

(assert (=> b!31029 (= lt!45511 ((_ sign_extend 32) (size!781 (buf!1109 thiss!1379))))))

(assert (= (and d!9046 res!26593) b!31028))

(assert (= (and b!31028 res!26594) b!31029))

(assert (=> d!9046 m!45469))

(assert (=> d!9046 m!45489))

(assert (=> b!30511 d!9046))

(declare-fun d!9048 () Bool)

(declare-fun e!20598 () Bool)

(assert (=> d!9048 e!20598))

(declare-fun res!26595 () Bool)

(assert (=> d!9048 (=> (not res!26595) (not e!20598))))

(declare-fun lt!45520 () (_ BitVec 64))

(declare-fun lt!45519 () (_ BitVec 64))

(declare-fun lt!45515 () (_ BitVec 64))

(assert (=> d!9048 (= res!26595 (= lt!45519 (bvsub lt!45515 lt!45520)))))

(assert (=> d!9048 (or (= (bvand lt!45515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45515 lt!45520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9048 (= lt!45520 (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44418))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44418)))))))

(declare-fun lt!45516 () (_ BitVec 64))

(declare-fun lt!45518 () (_ BitVec 64))

(assert (=> d!9048 (= lt!45515 (bvmul lt!45516 lt!45518))))

(assert (=> d!9048 (or (= lt!45516 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45518 (bvsdiv (bvmul lt!45516 lt!45518) lt!45516)))))

(assert (=> d!9048 (= lt!45518 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9048 (= lt!45516 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))))))

(assert (=> d!9048 (= lt!45519 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44418))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44418)))))))

(assert (=> d!9048 (invariant!0 (currentBit!2453 (_2!1688 lt!44418)) (currentByte!2458 (_2!1688 lt!44418)) (size!781 (buf!1109 (_2!1688 lt!44418))))))

(assert (=> d!9048 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44418))) (currentByte!2458 (_2!1688 lt!44418)) (currentBit!2453 (_2!1688 lt!44418))) lt!45519)))

(declare-fun b!31030 () Bool)

(declare-fun res!26596 () Bool)

(assert (=> b!31030 (=> (not res!26596) (not e!20598))))

(assert (=> b!31030 (= res!26596 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45519))))

(declare-fun b!31031 () Bool)

(declare-fun lt!45517 () (_ BitVec 64))

(assert (=> b!31031 (= e!20598 (bvsle lt!45519 (bvmul lt!45517 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31031 (or (= lt!45517 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45517 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45517)))))

(assert (=> b!31031 (= lt!45517 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44418)))))))

(assert (= (and d!9048 res!26595) b!31030))

(assert (= (and b!31030 res!26596) b!31031))

(declare-fun m!45601 () Bool)

(assert (=> d!9048 m!45601))

(assert (=> d!9048 m!44643))

(assert (=> b!30521 d!9048))

(declare-fun d!9050 () Bool)

(declare-fun e!20599 () Bool)

(assert (=> d!9050 e!20599))

(declare-fun res!26597 () Bool)

(assert (=> d!9050 (=> (not res!26597) (not e!20599))))

(declare-fun lt!45521 () (_ BitVec 64))

(declare-fun lt!45526 () (_ BitVec 64))

(declare-fun lt!45525 () (_ BitVec 64))

(assert (=> d!9050 (= res!26597 (= lt!45525 (bvsub lt!45521 lt!45526)))))

(assert (=> d!9050 (or (= (bvand lt!45521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45521 lt!45526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9050 (= lt!45526 (remainingBits!0 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))) ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419)))))))

(declare-fun lt!45522 () (_ BitVec 64))

(declare-fun lt!45524 () (_ BitVec 64))

(assert (=> d!9050 (= lt!45521 (bvmul lt!45522 lt!45524))))

(assert (=> d!9050 (or (= lt!45522 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45524 (bvsdiv (bvmul lt!45522 lt!45524) lt!45522)))))

(assert (=> d!9050 (= lt!45524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9050 (= lt!45522 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))))))

(assert (=> d!9050 (= lt!45525 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2458 (_2!1688 lt!44419))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2453 (_2!1688 lt!44419)))))))

(assert (=> d!9050 (invariant!0 (currentBit!2453 (_2!1688 lt!44419)) (currentByte!2458 (_2!1688 lt!44419)) (size!781 (buf!1109 (_2!1688 lt!44419))))))

(assert (=> d!9050 (= (bitIndex!0 (size!781 (buf!1109 (_2!1688 lt!44419))) (currentByte!2458 (_2!1688 lt!44419)) (currentBit!2453 (_2!1688 lt!44419))) lt!45525)))

(declare-fun b!31032 () Bool)

(declare-fun res!26598 () Bool)

(assert (=> b!31032 (=> (not res!26598) (not e!20599))))

(assert (=> b!31032 (= res!26598 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45525))))

(declare-fun b!31033 () Bool)

(declare-fun lt!45523 () (_ BitVec 64))

(assert (=> b!31033 (= e!20599 (bvsle lt!45525 (bvmul lt!45523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31033 (or (= lt!45523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45523)))))

(assert (=> b!31033 (= lt!45523 ((_ sign_extend 32) (size!781 (buf!1109 (_2!1688 lt!44419)))))))

(assert (= (and d!9050 res!26597) b!31032))

(assert (= (and b!31032 res!26598) b!31033))

(assert (=> d!9050 m!45493))

(assert (=> d!9050 m!44601))

(assert (=> b!30510 d!9050))

(push 1)

(assert (not b!31006))

(assert (not b!31001))

(assert (not d!9012))

(assert (not b!30951))

(assert (not b!30971))

(assert (not b!30940))

(assert (not b!31020))

(assert (not d!9026))

(assert (not b!30977))

(assert (not b!30997))

(assert (not b!30995))

(assert (not b!30970))

(assert (not d!9048))

(assert (not d!8914))

(assert (not b!30998))

(assert (not d!9020))

(assert (not b!30972))

(assert (not d!8912))

(assert (not d!9038))

(assert (not b!30939))

(assert (not d!9024))

(assert (not d!8990))

(assert (not bm!397))

(assert (not d!9040))

(assert (not b!30925))

(assert (not b!30996))

(assert (not b!31004))

(assert (not b!30920))

(assert (not b!31007))

(assert (not b!30969))

(assert (not b!30921))

(assert (not b!30974))

(assert (not d!9034))

(assert (not b!31019))

(assert (not d!9044))

(assert (not b!30776))

(assert (not b!30941))

(assert (not d!8910))

(assert (not b!30953))

(assert (not b!30950))

(assert (not b!31018))

(assert (not d!9032))

(assert (not b!31000))

(assert (not b!31014))

(assert (not b!31009))

(assert (not b!31010))

(assert (not b!31002))

(assert (not b!30948))

(assert (not d!8916))

(assert (not b!30924))

(assert (not b!31021))

(assert (not b!31015))

(assert (not b!31011))

(assert (not b!30923))

(assert (not d!9022))

(assert (not b!30926))

(assert (not b!31016))

(assert (not b!31005))

(assert (not d!9046))

(assert (not b!31013))

(assert (not b!30999))

(assert (not d!9030))

(assert (not b!31023))

(assert (not d!9050))

(assert (not b!30937))

(assert (not d!8996))

(assert (not d!8902))

(assert (not d!8904))

(assert (not b!30959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

