; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52762 () Bool)

(assert start!52762)

(declare-fun b!244369 () Bool)

(declare-fun e!169376 () Bool)

(declare-datatypes ((array!13381 0))(
  ( (array!13382 (arr!6854 (Array (_ BitVec 32) (_ BitVec 8))) (size!5867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10656 0))(
  ( (BitStream!10657 (buf!6339 array!13381) (currentByte!11717 (_ BitVec 32)) (currentBit!11712 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10656)

(declare-fun array_inv!5608 (array!13381) Bool)

(assert (=> b!244369 (= e!169376 (array_inv!5608 (buf!6339 thiss!1005)))))

(declare-fun b!244370 () Bool)

(declare-fun e!169382 () Bool)

(declare-fun e!169378 () Bool)

(assert (=> b!244370 (= e!169382 e!169378)))

(declare-fun res!204252 () Bool)

(assert (=> b!244370 (=> (not res!204252) (not e!169378))))

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20964 0))(
  ( (tuple2!20965 (_1!11404 BitStream!10656) (_2!11404 Bool)) )
))
(declare-fun lt!380859 () tuple2!20964)

(declare-datatypes ((Unit!17829 0))(
  ( (Unit!17830) )
))
(declare-datatypes ((tuple2!20966 0))(
  ( (tuple2!20967 (_1!11405 Unit!17829) (_2!11405 BitStream!10656)) )
))
(declare-fun lt!380848 () tuple2!20966)

(assert (=> b!244370 (= res!204252 (and (= (_2!11404 lt!380859) bit!26) (= (_1!11404 lt!380859) (_2!11405 lt!380848))))))

(declare-fun readBitPure!0 (BitStream!10656) tuple2!20964)

(declare-fun readerFrom!0 (BitStream!10656 (_ BitVec 32) (_ BitVec 32)) BitStream!10656)

(assert (=> b!244370 (= lt!380859 (readBitPure!0 (readerFrom!0 (_2!11405 lt!380848) (currentBit!11712 thiss!1005) (currentByte!11717 thiss!1005))))))

(declare-fun b!244371 () Bool)

(declare-fun res!204241 () Bool)

(declare-fun e!169381 () Bool)

(assert (=> b!244371 (=> (not res!204241) (not e!169381))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244371 (= res!204241 (invariant!0 (currentBit!11712 thiss!1005) (currentByte!11717 thiss!1005) (size!5867 (buf!6339 (_2!11405 lt!380848)))))))

(declare-fun res!204242 () Bool)

(declare-fun e!169377 () Bool)

(assert (=> start!52762 (=> (not res!204242) (not e!169377))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52762 (= res!204242 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52762 e!169377))

(assert (=> start!52762 true))

(declare-fun inv!12 (BitStream!10656) Bool)

(assert (=> start!52762 (and (inv!12 thiss!1005) e!169376)))

(declare-fun b!244372 () Bool)

(declare-fun e!169374 () Bool)

(declare-fun lt!380842 () tuple2!20964)

(declare-fun lt!380847 () tuple2!20964)

(assert (=> b!244372 (= e!169374 (= (_2!11404 lt!380842) (_2!11404 lt!380847)))))

(declare-fun b!244373 () Bool)

(declare-fun res!204249 () Bool)

(assert (=> b!244373 (=> (not res!204249) (not e!169382))))

(declare-fun isPrefixOf!0 (BitStream!10656 BitStream!10656) Bool)

(assert (=> b!244373 (= res!204249 (isPrefixOf!0 thiss!1005 (_2!11405 lt!380848)))))

(declare-fun b!244374 () Bool)

(declare-fun e!169373 () Bool)

(declare-fun e!169380 () Bool)

(assert (=> b!244374 (= e!169373 e!169380)))

(declare-fun res!204240 () Bool)

(assert (=> b!244374 (=> (not res!204240) (not e!169380))))

(declare-fun lt!380849 () (_ BitVec 64))

(declare-fun lt!380844 () tuple2!20966)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244374 (= res!204240 (= (bitIndex!0 (size!5867 (buf!6339 (_2!11405 lt!380844))) (currentByte!11717 (_2!11405 lt!380844)) (currentBit!11712 (_2!11405 lt!380844))) (bvadd (bitIndex!0 (size!5867 (buf!6339 (_2!11405 lt!380848))) (currentByte!11717 (_2!11405 lt!380848)) (currentBit!11712 (_2!11405 lt!380848))) lt!380849)))))

(assert (=> b!244374 (= lt!380849 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244375 () Bool)

(declare-fun res!204247 () Bool)

(assert (=> b!244375 (=> (not res!204247) (not e!169377))))

(assert (=> b!244375 (= res!204247 (bvslt from!289 nBits!297))))

(declare-fun b!244376 () Bool)

(declare-fun res!204245 () Bool)

(assert (=> b!244376 (=> (not res!204245) (not e!169377))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244376 (= res!204245 (validate_offset_bits!1 ((_ sign_extend 32) (size!5867 (buf!6339 thiss!1005))) ((_ sign_extend 32) (currentByte!11717 thiss!1005)) ((_ sign_extend 32) (currentBit!11712 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244377 () Bool)

(declare-fun lt!380861 () tuple2!20964)

(declare-datatypes ((tuple2!20968 0))(
  ( (tuple2!20969 (_1!11406 BitStream!10656) (_2!11406 BitStream!10656)) )
))
(declare-fun lt!380857 () tuple2!20968)

(assert (=> b!244377 (= e!169380 (not (or (not (_2!11404 lt!380861)) (not (= (_1!11404 lt!380861) (_2!11406 lt!380857))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10656 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20964)

(assert (=> b!244377 (= lt!380861 (checkBitsLoopPure!0 (_1!11406 lt!380857) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244377 (validate_offset_bits!1 ((_ sign_extend 32) (size!5867 (buf!6339 (_2!11405 lt!380844)))) ((_ sign_extend 32) (currentByte!11717 (_2!11405 lt!380848))) ((_ sign_extend 32) (currentBit!11712 (_2!11405 lt!380848))) lt!380849)))

(declare-fun lt!380845 () Unit!17829)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10656 array!13381 (_ BitVec 64)) Unit!17829)

(assert (=> b!244377 (= lt!380845 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11405 lt!380848) (buf!6339 (_2!11405 lt!380844)) lt!380849))))

(declare-fun reader!0 (BitStream!10656 BitStream!10656) tuple2!20968)

(assert (=> b!244377 (= lt!380857 (reader!0 (_2!11405 lt!380848) (_2!11405 lt!380844)))))

(declare-fun b!244378 () Bool)

(assert (=> b!244378 (= e!169377 (not true))))

(declare-fun lt!380854 () (_ BitVec 64))

(assert (=> b!244378 (validate_offset_bits!1 ((_ sign_extend 32) (size!5867 (buf!6339 (_2!11405 lt!380844)))) ((_ sign_extend 32) (currentByte!11717 (_2!11405 lt!380848))) ((_ sign_extend 32) (currentBit!11712 (_2!11405 lt!380848))) lt!380854)))

(declare-fun lt!380856 () Unit!17829)

(assert (=> b!244378 (= lt!380856 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11405 lt!380848) (buf!6339 (_2!11405 lt!380844)) lt!380854))))

(declare-fun lt!380852 () tuple2!20964)

(declare-fun lt!380846 () tuple2!20968)

(assert (=> b!244378 (= lt!380852 (checkBitsLoopPure!0 (_1!11406 lt!380846) nBits!297 bit!26 from!289))))

(assert (=> b!244378 (validate_offset_bits!1 ((_ sign_extend 32) (size!5867 (buf!6339 (_2!11405 lt!380844)))) ((_ sign_extend 32) (currentByte!11717 thiss!1005)) ((_ sign_extend 32) (currentBit!11712 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380853 () Unit!17829)

(assert (=> b!244378 (= lt!380853 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6339 (_2!11405 lt!380844)) (bvsub nBits!297 from!289)))))

(assert (=> b!244378 (= (_2!11404 (readBitPure!0 (_1!11406 lt!380846))) bit!26)))

(declare-fun lt!380850 () tuple2!20968)

(assert (=> b!244378 (= lt!380850 (reader!0 (_2!11405 lt!380848) (_2!11405 lt!380844)))))

(assert (=> b!244378 (= lt!380846 (reader!0 thiss!1005 (_2!11405 lt!380844)))))

(assert (=> b!244378 e!169374))

(declare-fun res!204246 () Bool)

(assert (=> b!244378 (=> (not res!204246) (not e!169374))))

(assert (=> b!244378 (= res!204246 (= (bitIndex!0 (size!5867 (buf!6339 (_1!11404 lt!380842))) (currentByte!11717 (_1!11404 lt!380842)) (currentBit!11712 (_1!11404 lt!380842))) (bitIndex!0 (size!5867 (buf!6339 (_1!11404 lt!380847))) (currentByte!11717 (_1!11404 lt!380847)) (currentBit!11712 (_1!11404 lt!380847)))))))

(declare-fun lt!380862 () Unit!17829)

(declare-fun lt!380860 () BitStream!10656)

(declare-fun readBitPrefixLemma!0 (BitStream!10656 BitStream!10656) Unit!17829)

(assert (=> b!244378 (= lt!380862 (readBitPrefixLemma!0 lt!380860 (_2!11405 lt!380844)))))

(assert (=> b!244378 (= lt!380847 (readBitPure!0 (BitStream!10657 (buf!6339 (_2!11405 lt!380844)) (currentByte!11717 thiss!1005) (currentBit!11712 thiss!1005))))))

(assert (=> b!244378 (= lt!380842 (readBitPure!0 lt!380860))))

(assert (=> b!244378 (= lt!380860 (BitStream!10657 (buf!6339 (_2!11405 lt!380848)) (currentByte!11717 thiss!1005) (currentBit!11712 thiss!1005)))))

(assert (=> b!244378 e!169381))

(declare-fun res!204243 () Bool)

(assert (=> b!244378 (=> (not res!204243) (not e!169381))))

(assert (=> b!244378 (= res!204243 (isPrefixOf!0 thiss!1005 (_2!11405 lt!380844)))))

(declare-fun lt!380851 () Unit!17829)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10656 BitStream!10656 BitStream!10656) Unit!17829)

(assert (=> b!244378 (= lt!380851 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11405 lt!380848) (_2!11405 lt!380844)))))

(assert (=> b!244378 e!169373))

(declare-fun res!204248 () Bool)

(assert (=> b!244378 (=> (not res!204248) (not e!169373))))

(assert (=> b!244378 (= res!204248 (= (size!5867 (buf!6339 (_2!11405 lt!380848))) (size!5867 (buf!6339 (_2!11405 lt!380844)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10656 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20966)

(assert (=> b!244378 (= lt!380844 (appendNBitsLoop!0 (_2!11405 lt!380848) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244378 (validate_offset_bits!1 ((_ sign_extend 32) (size!5867 (buf!6339 (_2!11405 lt!380848)))) ((_ sign_extend 32) (currentByte!11717 (_2!11405 lt!380848))) ((_ sign_extend 32) (currentBit!11712 (_2!11405 lt!380848))) lt!380854)))

(assert (=> b!244378 (= lt!380854 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380855 () Unit!17829)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10656 BitStream!10656 (_ BitVec 64) (_ BitVec 64)) Unit!17829)

(assert (=> b!244378 (= lt!380855 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11405 lt!380848) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169379 () Bool)

(assert (=> b!244378 e!169379))

(declare-fun res!204244 () Bool)

(assert (=> b!244378 (=> (not res!204244) (not e!169379))))

(assert (=> b!244378 (= res!204244 (= (size!5867 (buf!6339 thiss!1005)) (size!5867 (buf!6339 (_2!11405 lt!380848)))))))

(declare-fun appendBit!0 (BitStream!10656 Bool) tuple2!20966)

(assert (=> b!244378 (= lt!380848 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244379 () Bool)

(declare-fun res!204250 () Bool)

(assert (=> b!244379 (=> (not res!204250) (not e!169380))))

(assert (=> b!244379 (= res!204250 (isPrefixOf!0 (_2!11405 lt!380848) (_2!11405 lt!380844)))))

(declare-fun b!244380 () Bool)

(declare-fun lt!380843 () (_ BitVec 64))

(assert (=> b!244380 (= e!169378 (= (bitIndex!0 (size!5867 (buf!6339 (_1!11404 lt!380859))) (currentByte!11717 (_1!11404 lt!380859)) (currentBit!11712 (_1!11404 lt!380859))) lt!380843))))

(declare-fun b!244381 () Bool)

(assert (=> b!244381 (= e!169381 (invariant!0 (currentBit!11712 thiss!1005) (currentByte!11717 thiss!1005) (size!5867 (buf!6339 (_2!11405 lt!380844)))))))

(declare-fun b!244382 () Bool)

(assert (=> b!244382 (= e!169379 e!169382)))

(declare-fun res!204251 () Bool)

(assert (=> b!244382 (=> (not res!204251) (not e!169382))))

(declare-fun lt!380858 () (_ BitVec 64))

(assert (=> b!244382 (= res!204251 (= lt!380843 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380858)))))

(assert (=> b!244382 (= lt!380843 (bitIndex!0 (size!5867 (buf!6339 (_2!11405 lt!380848))) (currentByte!11717 (_2!11405 lt!380848)) (currentBit!11712 (_2!11405 lt!380848))))))

(assert (=> b!244382 (= lt!380858 (bitIndex!0 (size!5867 (buf!6339 thiss!1005)) (currentByte!11717 thiss!1005) (currentBit!11712 thiss!1005)))))

(assert (= (and start!52762 res!204242) b!244376))

(assert (= (and b!244376 res!204245) b!244375))

(assert (= (and b!244375 res!204247) b!244378))

(assert (= (and b!244378 res!204244) b!244382))

(assert (= (and b!244382 res!204251) b!244373))

(assert (= (and b!244373 res!204249) b!244370))

(assert (= (and b!244370 res!204252) b!244380))

(assert (= (and b!244378 res!204248) b!244374))

(assert (= (and b!244374 res!204240) b!244379))

(assert (= (and b!244379 res!204250) b!244377))

(assert (= (and b!244378 res!204243) b!244371))

(assert (= (and b!244371 res!204241) b!244381))

(assert (= (and b!244378 res!204246) b!244372))

(assert (= start!52762 b!244369))

(declare-fun m!368289 () Bool)

(assert (=> b!244377 m!368289))

(declare-fun m!368291 () Bool)

(assert (=> b!244377 m!368291))

(declare-fun m!368293 () Bool)

(assert (=> b!244377 m!368293))

(declare-fun m!368295 () Bool)

(assert (=> b!244377 m!368295))

(declare-fun m!368297 () Bool)

(assert (=> b!244382 m!368297))

(declare-fun m!368299 () Bool)

(assert (=> b!244382 m!368299))

(declare-fun m!368301 () Bool)

(assert (=> b!244371 m!368301))

(declare-fun m!368303 () Bool)

(assert (=> b!244380 m!368303))

(declare-fun m!368305 () Bool)

(assert (=> b!244378 m!368305))

(declare-fun m!368307 () Bool)

(assert (=> b!244378 m!368307))

(declare-fun m!368309 () Bool)

(assert (=> b!244378 m!368309))

(declare-fun m!368311 () Bool)

(assert (=> b!244378 m!368311))

(declare-fun m!368313 () Bool)

(assert (=> b!244378 m!368313))

(declare-fun m!368315 () Bool)

(assert (=> b!244378 m!368315))

(declare-fun m!368317 () Bool)

(assert (=> b!244378 m!368317))

(declare-fun m!368319 () Bool)

(assert (=> b!244378 m!368319))

(declare-fun m!368321 () Bool)

(assert (=> b!244378 m!368321))

(declare-fun m!368323 () Bool)

(assert (=> b!244378 m!368323))

(declare-fun m!368325 () Bool)

(assert (=> b!244378 m!368325))

(declare-fun m!368327 () Bool)

(assert (=> b!244378 m!368327))

(assert (=> b!244378 m!368295))

(declare-fun m!368329 () Bool)

(assert (=> b!244378 m!368329))

(declare-fun m!368331 () Bool)

(assert (=> b!244378 m!368331))

(declare-fun m!368333 () Bool)

(assert (=> b!244378 m!368333))

(declare-fun m!368335 () Bool)

(assert (=> b!244378 m!368335))

(declare-fun m!368337 () Bool)

(assert (=> b!244378 m!368337))

(declare-fun m!368339 () Bool)

(assert (=> b!244378 m!368339))

(declare-fun m!368341 () Bool)

(assert (=> b!244370 m!368341))

(assert (=> b!244370 m!368341))

(declare-fun m!368343 () Bool)

(assert (=> b!244370 m!368343))

(declare-fun m!368345 () Bool)

(assert (=> b!244374 m!368345))

(assert (=> b!244374 m!368297))

(declare-fun m!368347 () Bool)

(assert (=> b!244381 m!368347))

(declare-fun m!368349 () Bool)

(assert (=> b!244376 m!368349))

(declare-fun m!368351 () Bool)

(assert (=> b!244369 m!368351))

(declare-fun m!368353 () Bool)

(assert (=> b!244379 m!368353))

(declare-fun m!368355 () Bool)

(assert (=> b!244373 m!368355))

(declare-fun m!368357 () Bool)

(assert (=> start!52762 m!368357))

(check-sat (not b!244382) (not b!244374) (not start!52762) (not b!244373) (not b!244376) (not b!244371) (not b!244379) (not b!244369) (not b!244381) (not b!244378) (not b!244377) (not b!244370) (not b!244380))
