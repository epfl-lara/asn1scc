; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39730 () Bool)

(assert start!39730)

(declare-fun res!149428 () Bool)

(declare-fun e!125134 () Bool)

(assert (=> start!39730 (=> (not res!149428) (not e!125134))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39730 (= res!149428 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39730 e!125134))

(assert (=> start!39730 true))

(declare-datatypes ((array!9664 0))(
  ( (array!9665 (arr!5192 (Array (_ BitVec 32) (_ BitVec 8))) (size!4262 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7632 0))(
  ( (BitStream!7633 (buf!4705 array!9664) (currentByte!8915 (_ BitVec 32)) (currentBit!8910 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7632)

(declare-fun e!125139 () Bool)

(declare-fun inv!12 (BitStream!7632) Bool)

(assert (=> start!39730 (and (inv!12 thiss!1204) e!125139)))

(declare-fun b!180008 () Bool)

(declare-fun e!125136 () Bool)

(declare-fun e!125133 () Bool)

(assert (=> b!180008 (= e!125136 e!125133)))

(declare-fun res!149433 () Bool)

(assert (=> b!180008 (=> (not res!149433) (not e!125133))))

(declare-datatypes ((Unit!12943 0))(
  ( (Unit!12944) )
))
(declare-datatypes ((tuple2!15518 0))(
  ( (tuple2!15519 (_1!8404 Unit!12943) (_2!8404 BitStream!7632)) )
))
(declare-fun lt!276143 () tuple2!15518)

(declare-fun lt!276140 () Bool)

(declare-datatypes ((tuple2!15520 0))(
  ( (tuple2!15521 (_1!8405 BitStream!7632) (_2!8405 Bool)) )
))
(declare-fun lt!276132 () tuple2!15520)

(assert (=> b!180008 (= res!149433 (and (= (_2!8405 lt!276132) lt!276140) (= (_1!8405 lt!276132) (_2!8404 lt!276143))))))

(declare-fun readBitPure!0 (BitStream!7632) tuple2!15520)

(declare-fun readerFrom!0 (BitStream!7632 (_ BitVec 32) (_ BitVec 32)) BitStream!7632)

(assert (=> b!180008 (= lt!276132 (readBitPure!0 (readerFrom!0 (_2!8404 lt!276143) (currentBit!8910 thiss!1204) (currentByte!8915 thiss!1204))))))

(declare-fun b!180009 () Bool)

(declare-fun res!149429 () Bool)

(declare-fun e!125140 () Bool)

(assert (=> b!180009 (=> res!149429 e!125140)))

(declare-fun isPrefixOf!0 (BitStream!7632 BitStream!7632) Bool)

(assert (=> b!180009 (= res!149429 (not (isPrefixOf!0 thiss!1204 (_2!8404 lt!276143))))))

(declare-fun b!180010 () Bool)

(declare-fun res!149430 () Bool)

(assert (=> b!180010 (=> res!149430 e!125140)))

(declare-fun lt!276131 () tuple2!15518)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180010 (= res!149430 (not (invariant!0 (currentBit!8910 (_2!8404 lt!276131)) (currentByte!8915 (_2!8404 lt!276131)) (size!4262 (buf!4705 (_2!8404 lt!276131))))))))

(declare-fun b!180011 () Bool)

(declare-fun res!149420 () Bool)

(assert (=> b!180011 (=> res!149420 e!125140)))

(assert (=> b!180011 (= res!149420 (not (isPrefixOf!0 (_2!8404 lt!276143) (_2!8404 lt!276131))))))

(declare-fun b!180012 () Bool)

(declare-fun res!149431 () Bool)

(assert (=> b!180012 (=> (not res!149431) (not e!125134))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180012 (= res!149431 (validate_offset_bits!1 ((_ sign_extend 32) (size!4262 (buf!4705 thiss!1204))) ((_ sign_extend 32) (currentByte!8915 thiss!1204)) ((_ sign_extend 32) (currentBit!8910 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!180013 () Bool)

(assert (=> b!180013 (= e!125140 true)))

(declare-datatypes ((tuple2!15522 0))(
  ( (tuple2!15523 (_1!8406 BitStream!7632) (_2!8406 BitStream!7632)) )
))
(declare-fun lt!276141 () tuple2!15522)

(assert (=> b!180013 (= (_2!8405 (readBitPure!0 (_1!8406 lt!276141))) lt!276140)))

(declare-fun lt!276142 () tuple2!15522)

(declare-fun reader!0 (BitStream!7632 BitStream!7632) tuple2!15522)

(assert (=> b!180013 (= lt!276142 (reader!0 (_2!8404 lt!276143) (_2!8404 lt!276131)))))

(assert (=> b!180013 (= lt!276141 (reader!0 thiss!1204 (_2!8404 lt!276131)))))

(declare-fun e!125137 () Bool)

(assert (=> b!180013 e!125137))

(declare-fun res!149427 () Bool)

(assert (=> b!180013 (=> (not res!149427) (not e!125137))))

(declare-fun lt!276138 () tuple2!15520)

(declare-fun lt!276134 () tuple2!15520)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180013 (= res!149427 (= (bitIndex!0 (size!4262 (buf!4705 (_1!8405 lt!276138))) (currentByte!8915 (_1!8405 lt!276138)) (currentBit!8910 (_1!8405 lt!276138))) (bitIndex!0 (size!4262 (buf!4705 (_1!8405 lt!276134))) (currentByte!8915 (_1!8405 lt!276134)) (currentBit!8910 (_1!8405 lt!276134)))))))

(declare-fun lt!276136 () Unit!12943)

(declare-fun lt!276130 () BitStream!7632)

(declare-fun readBitPrefixLemma!0 (BitStream!7632 BitStream!7632) Unit!12943)

(assert (=> b!180013 (= lt!276136 (readBitPrefixLemma!0 lt!276130 (_2!8404 lt!276131)))))

(assert (=> b!180013 (= lt!276134 (readBitPure!0 (BitStream!7633 (buf!4705 (_2!8404 lt!276131)) (currentByte!8915 thiss!1204) (currentBit!8910 thiss!1204))))))

(assert (=> b!180013 (= lt!276138 (readBitPure!0 lt!276130))))

(declare-fun e!125138 () Bool)

(assert (=> b!180013 e!125138))

(declare-fun res!149426 () Bool)

(assert (=> b!180013 (=> (not res!149426) (not e!125138))))

(assert (=> b!180013 (= res!149426 (invariant!0 (currentBit!8910 thiss!1204) (currentByte!8915 thiss!1204) (size!4262 (buf!4705 (_2!8404 lt!276143)))))))

(assert (=> b!180013 (= lt!276130 (BitStream!7633 (buf!4705 (_2!8404 lt!276143)) (currentByte!8915 thiss!1204) (currentBit!8910 thiss!1204)))))

(declare-fun b!180014 () Bool)

(declare-fun lt!276133 () (_ BitVec 64))

(assert (=> b!180014 (= e!125133 (= (bitIndex!0 (size!4262 (buf!4705 (_1!8405 lt!276132))) (currentByte!8915 (_1!8405 lt!276132)) (currentBit!8910 (_1!8405 lt!276132))) lt!276133))))

(declare-fun b!180015 () Bool)

(declare-fun res!149424 () Bool)

(assert (=> b!180015 (=> res!149424 e!125140)))

(declare-fun lt!276137 () (_ BitVec 64))

(declare-fun lt!276128 () (_ BitVec 64))

(assert (=> b!180015 (= res!149424 (or (not (= (size!4262 (buf!4705 (_2!8404 lt!276131))) (size!4262 (buf!4705 thiss!1204)))) (not (= lt!276128 (bvsub (bvadd lt!276137 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180016 () Bool)

(declare-fun e!125135 () Bool)

(assert (=> b!180016 (= e!125135 e!125136)))

(declare-fun res!149422 () Bool)

(assert (=> b!180016 (=> (not res!149422) (not e!125136))))

(declare-fun lt!276139 () (_ BitVec 64))

(assert (=> b!180016 (= res!149422 (= lt!276133 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276139)))))

(assert (=> b!180016 (= lt!276133 (bitIndex!0 (size!4262 (buf!4705 (_2!8404 lt!276143))) (currentByte!8915 (_2!8404 lt!276143)) (currentBit!8910 (_2!8404 lt!276143))))))

(assert (=> b!180016 (= lt!276139 (bitIndex!0 (size!4262 (buf!4705 thiss!1204)) (currentByte!8915 thiss!1204) (currentBit!8910 thiss!1204)))))

(declare-fun b!180017 () Bool)

(declare-fun res!149421 () Bool)

(assert (=> b!180017 (=> (not res!149421) (not e!125134))))

(assert (=> b!180017 (= res!149421 (not (= i!590 nBits!348)))))

(declare-fun b!180018 () Bool)

(declare-fun e!125131 () Bool)

(assert (=> b!180018 (= e!125131 e!125140)))

(declare-fun res!149419 () Bool)

(assert (=> b!180018 (=> res!149419 e!125140)))

(declare-fun lt!276129 () (_ BitVec 64))

(assert (=> b!180018 (= res!149419 (not (= lt!276128 (bvsub (bvsub (bvadd lt!276129 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!180018 (= lt!276128 (bitIndex!0 (size!4262 (buf!4705 (_2!8404 lt!276131))) (currentByte!8915 (_2!8404 lt!276131)) (currentBit!8910 (_2!8404 lt!276131))))))

(assert (=> b!180018 (isPrefixOf!0 thiss!1204 (_2!8404 lt!276131))))

(declare-fun lt!276135 () Unit!12943)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7632 BitStream!7632 BitStream!7632) Unit!12943)

(assert (=> b!180018 (= lt!276135 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8404 lt!276143) (_2!8404 lt!276131)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15518)

(assert (=> b!180018 (= lt!276131 (appendBitsLSBFirstLoopTR!0 (_2!8404 lt!276143) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180019 () Bool)

(declare-fun array_inv!4003 (array!9664) Bool)

(assert (=> b!180019 (= e!125139 (array_inv!4003 (buf!4705 thiss!1204)))))

(declare-fun b!180020 () Bool)

(assert (=> b!180020 (= e!125134 (not e!125131))))

(declare-fun res!149425 () Bool)

(assert (=> b!180020 (=> res!149425 e!125131)))

(assert (=> b!180020 (= res!149425 (not (= lt!276129 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276137))))))

(assert (=> b!180020 (= lt!276129 (bitIndex!0 (size!4262 (buf!4705 (_2!8404 lt!276143))) (currentByte!8915 (_2!8404 lt!276143)) (currentBit!8910 (_2!8404 lt!276143))))))

(assert (=> b!180020 (= lt!276137 (bitIndex!0 (size!4262 (buf!4705 thiss!1204)) (currentByte!8915 thiss!1204) (currentBit!8910 thiss!1204)))))

(assert (=> b!180020 e!125135))

(declare-fun res!149418 () Bool)

(assert (=> b!180020 (=> (not res!149418) (not e!125135))))

(assert (=> b!180020 (= res!149418 (= (size!4262 (buf!4705 thiss!1204)) (size!4262 (buf!4705 (_2!8404 lt!276143)))))))

(declare-fun appendBit!0 (BitStream!7632 Bool) tuple2!15518)

(assert (=> b!180020 (= lt!276143 (appendBit!0 thiss!1204 lt!276140))))

(assert (=> b!180020 (= lt!276140 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180021 () Bool)

(assert (=> b!180021 (= e!125137 (= (_2!8405 lt!276138) (_2!8405 lt!276134)))))

(declare-fun b!180022 () Bool)

(declare-fun res!149423 () Bool)

(assert (=> b!180022 (=> (not res!149423) (not e!125134))))

(assert (=> b!180022 (= res!149423 (invariant!0 (currentBit!8910 thiss!1204) (currentByte!8915 thiss!1204) (size!4262 (buf!4705 thiss!1204))))))

(declare-fun b!180023 () Bool)

(declare-fun res!149432 () Bool)

(assert (=> b!180023 (=> (not res!149432) (not e!125136))))

(assert (=> b!180023 (= res!149432 (isPrefixOf!0 thiss!1204 (_2!8404 lt!276143)))))

(declare-fun b!180024 () Bool)

(assert (=> b!180024 (= e!125138 (invariant!0 (currentBit!8910 thiss!1204) (currentByte!8915 thiss!1204) (size!4262 (buf!4705 (_2!8404 lt!276131)))))))

(assert (= (and start!39730 res!149428) b!180012))

(assert (= (and b!180012 res!149431) b!180022))

(assert (= (and b!180022 res!149423) b!180017))

(assert (= (and b!180017 res!149421) b!180020))

(assert (= (and b!180020 res!149418) b!180016))

(assert (= (and b!180016 res!149422) b!180023))

(assert (= (and b!180023 res!149432) b!180008))

(assert (= (and b!180008 res!149433) b!180014))

(assert (= (and b!180020 (not res!149425)) b!180018))

(assert (= (and b!180018 (not res!149419)) b!180010))

(assert (= (and b!180010 (not res!149430)) b!180015))

(assert (= (and b!180015 (not res!149424)) b!180011))

(assert (= (and b!180011 (not res!149420)) b!180009))

(assert (= (and b!180009 (not res!149429)) b!180013))

(assert (= (and b!180013 res!149426) b!180024))

(assert (= (and b!180013 res!149427) b!180021))

(assert (= start!39730 b!180019))

(declare-fun m!280381 () Bool)

(assert (=> b!180020 m!280381))

(declare-fun m!280383 () Bool)

(assert (=> b!180020 m!280383))

(declare-fun m!280385 () Bool)

(assert (=> b!180020 m!280385))

(declare-fun m!280387 () Bool)

(assert (=> b!180008 m!280387))

(assert (=> b!180008 m!280387))

(declare-fun m!280389 () Bool)

(assert (=> b!180008 m!280389))

(declare-fun m!280391 () Bool)

(assert (=> b!180019 m!280391))

(assert (=> b!180016 m!280381))

(assert (=> b!180016 m!280383))

(declare-fun m!280393 () Bool)

(assert (=> b!180023 m!280393))

(declare-fun m!280395 () Bool)

(assert (=> b!180018 m!280395))

(declare-fun m!280397 () Bool)

(assert (=> b!180018 m!280397))

(declare-fun m!280399 () Bool)

(assert (=> b!180018 m!280399))

(declare-fun m!280401 () Bool)

(assert (=> b!180018 m!280401))

(declare-fun m!280403 () Bool)

(assert (=> b!180013 m!280403))

(declare-fun m!280405 () Bool)

(assert (=> b!180013 m!280405))

(declare-fun m!280407 () Bool)

(assert (=> b!180013 m!280407))

(declare-fun m!280409 () Bool)

(assert (=> b!180013 m!280409))

(declare-fun m!280411 () Bool)

(assert (=> b!180013 m!280411))

(declare-fun m!280413 () Bool)

(assert (=> b!180013 m!280413))

(declare-fun m!280415 () Bool)

(assert (=> b!180013 m!280415))

(declare-fun m!280417 () Bool)

(assert (=> b!180013 m!280417))

(declare-fun m!280419 () Bool)

(assert (=> b!180013 m!280419))

(assert (=> b!180009 m!280393))

(declare-fun m!280421 () Bool)

(assert (=> start!39730 m!280421))

(declare-fun m!280423 () Bool)

(assert (=> b!180011 m!280423))

(declare-fun m!280425 () Bool)

(assert (=> b!180022 m!280425))

(declare-fun m!280427 () Bool)

(assert (=> b!180014 m!280427))

(declare-fun m!280429 () Bool)

(assert (=> b!180012 m!280429))

(declare-fun m!280431 () Bool)

(assert (=> b!180024 m!280431))

(declare-fun m!280433 () Bool)

(assert (=> b!180010 m!280433))

(check-sat (not b!180024) (not b!180016) (not b!180010) (not b!180008) (not b!180011) (not b!180019) (not b!180018) (not b!180014) (not b!180013) (not b!180023) (not start!39730) (not b!180009) (not b!180020) (not b!180022) (not b!180012))
