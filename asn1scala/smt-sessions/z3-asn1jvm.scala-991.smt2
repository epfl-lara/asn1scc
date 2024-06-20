; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27802 () Bool)

(assert start!27802)

(declare-fun b!143458 () Bool)

(declare-fun res!119818 () Bool)

(declare-fun e!95570 () Bool)

(assert (=> b!143458 (=> (not res!119818) (not e!95570))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6559 0))(
  ( (array!6560 (arr!3692 (Array (_ BitVec 32) (_ BitVec 8))) (size!2969 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5196 0))(
  ( (BitStream!5197 (buf!3398 array!6559) (currentByte!6282 (_ BitVec 32)) (currentBit!6277 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5196)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143458 (= res!119818 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2969 (buf!3398 thiss!1634))) ((_ sign_extend 32) (currentByte!6282 thiss!1634)) ((_ sign_extend 32) (currentBit!6277 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143459 () Bool)

(declare-fun e!95571 () Bool)

(declare-fun e!95563 () Bool)

(assert (=> b!143459 (= e!95571 e!95563)))

(declare-fun res!119816 () Bool)

(assert (=> b!143459 (=> (not res!119816) (not e!95563))))

(declare-datatypes ((Unit!8938 0))(
  ( (Unit!8939) )
))
(declare-datatypes ((tuple2!12784 0))(
  ( (tuple2!12785 (_1!6733 Unit!8938) (_2!6733 BitStream!5196)) )
))
(declare-fun lt!222347 () tuple2!12784)

(declare-fun lt!222345 () tuple2!12784)

(declare-fun lt!222346 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143459 (= res!119816 (= (bitIndex!0 (size!2969 (buf!3398 (_2!6733 lt!222347))) (currentByte!6282 (_2!6733 lt!222347)) (currentBit!6277 (_2!6733 lt!222347))) (bvadd (bitIndex!0 (size!2969 (buf!3398 (_2!6733 lt!222345))) (currentByte!6282 (_2!6733 lt!222345)) (currentBit!6277 (_2!6733 lt!222345))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222346))))))

(assert (=> b!143459 (= lt!222346 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143460 () Bool)

(assert (=> b!143460 (= e!95570 (not true))))

(declare-datatypes ((tuple2!12786 0))(
  ( (tuple2!12787 (_1!6734 BitStream!5196) (_2!6734 BitStream!5196)) )
))
(declare-fun lt!222340 () tuple2!12786)

(declare-fun arr!237 () array!6559)

(declare-datatypes ((tuple2!12788 0))(
  ( (tuple2!12789 (_1!6735 BitStream!5196) (_2!6735 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5196) tuple2!12788)

(assert (=> b!143460 (= (_2!6735 (readBytePure!0 (_1!6734 lt!222340))) (select (arr!3692 arr!237) from!447))))

(declare-fun lt!222343 () tuple2!12786)

(declare-fun reader!0 (BitStream!5196 BitStream!5196) tuple2!12786)

(assert (=> b!143460 (= lt!222343 (reader!0 (_2!6733 lt!222345) (_2!6733 lt!222347)))))

(assert (=> b!143460 (= lt!222340 (reader!0 thiss!1634 (_2!6733 lt!222347)))))

(declare-fun e!95569 () Bool)

(assert (=> b!143460 e!95569))

(declare-fun res!119822 () Bool)

(assert (=> b!143460 (=> (not res!119822) (not e!95569))))

(declare-fun lt!222337 () tuple2!12788)

(declare-fun lt!222349 () tuple2!12788)

(assert (=> b!143460 (= res!119822 (= (bitIndex!0 (size!2969 (buf!3398 (_1!6735 lt!222337))) (currentByte!6282 (_1!6735 lt!222337)) (currentBit!6277 (_1!6735 lt!222337))) (bitIndex!0 (size!2969 (buf!3398 (_1!6735 lt!222349))) (currentByte!6282 (_1!6735 lt!222349)) (currentBit!6277 (_1!6735 lt!222349)))))))

(declare-fun lt!222344 () Unit!8938)

(declare-fun lt!222350 () BitStream!5196)

(declare-fun readBytePrefixLemma!0 (BitStream!5196 BitStream!5196) Unit!8938)

(assert (=> b!143460 (= lt!222344 (readBytePrefixLemma!0 lt!222350 (_2!6733 lt!222347)))))

(assert (=> b!143460 (= lt!222349 (readBytePure!0 (BitStream!5197 (buf!3398 (_2!6733 lt!222347)) (currentByte!6282 thiss!1634) (currentBit!6277 thiss!1634))))))

(assert (=> b!143460 (= lt!222337 (readBytePure!0 lt!222350))))

(assert (=> b!143460 (= lt!222350 (BitStream!5197 (buf!3398 (_2!6733 lt!222345)) (currentByte!6282 thiss!1634) (currentBit!6277 thiss!1634)))))

(declare-fun e!95567 () Bool)

(assert (=> b!143460 e!95567))

(declare-fun res!119820 () Bool)

(assert (=> b!143460 (=> (not res!119820) (not e!95567))))

(declare-fun isPrefixOf!0 (BitStream!5196 BitStream!5196) Bool)

(assert (=> b!143460 (= res!119820 (isPrefixOf!0 thiss!1634 (_2!6733 lt!222347)))))

(declare-fun lt!222341 () Unit!8938)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5196 BitStream!5196 BitStream!5196) Unit!8938)

(assert (=> b!143460 (= lt!222341 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6733 lt!222345) (_2!6733 lt!222347)))))

(assert (=> b!143460 e!95571))

(declare-fun res!119826 () Bool)

(assert (=> b!143460 (=> (not res!119826) (not e!95571))))

(assert (=> b!143460 (= res!119826 (= (size!2969 (buf!3398 (_2!6733 lt!222345))) (size!2969 (buf!3398 (_2!6733 lt!222347)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5196 array!6559 (_ BitVec 32) (_ BitVec 32)) tuple2!12784)

(assert (=> b!143460 (= lt!222347 (appendByteArrayLoop!0 (_2!6733 lt!222345) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143460 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2969 (buf!3398 (_2!6733 lt!222345)))) ((_ sign_extend 32) (currentByte!6282 (_2!6733 lt!222345))) ((_ sign_extend 32) (currentBit!6277 (_2!6733 lt!222345))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222352 () Unit!8938)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5196 BitStream!5196 (_ BitVec 64) (_ BitVec 32)) Unit!8938)

(assert (=> b!143460 (= lt!222352 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6733 lt!222345) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!95562 () Bool)

(assert (=> b!143460 e!95562))

(declare-fun res!119823 () Bool)

(assert (=> b!143460 (=> (not res!119823) (not e!95562))))

(assert (=> b!143460 (= res!119823 (= (size!2969 (buf!3398 thiss!1634)) (size!2969 (buf!3398 (_2!6733 lt!222345)))))))

(declare-fun appendByte!0 (BitStream!5196 (_ BitVec 8)) tuple2!12784)

(assert (=> b!143460 (= lt!222345 (appendByte!0 thiss!1634 (select (arr!3692 arr!237) from!447)))))

(declare-fun b!143461 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143461 (= e!95567 (invariant!0 (currentBit!6277 thiss!1634) (currentByte!6282 thiss!1634) (size!2969 (buf!3398 (_2!6733 lt!222345)))))))

(declare-fun b!143462 () Bool)

(declare-fun res!119828 () Bool)

(assert (=> b!143462 (=> (not res!119828) (not e!95570))))

(assert (=> b!143462 (= res!119828 (bvslt from!447 to!404))))

(declare-fun b!143463 () Bool)

(declare-fun res!119819 () Bool)

(assert (=> b!143463 (=> (not res!119819) (not e!95563))))

(assert (=> b!143463 (= res!119819 (isPrefixOf!0 (_2!6733 lt!222345) (_2!6733 lt!222347)))))

(declare-fun b!143464 () Bool)

(assert (=> b!143464 (= e!95569 (= (_2!6735 lt!222337) (_2!6735 lt!222349)))))

(declare-fun lt!222342 () tuple2!12788)

(declare-fun lt!222348 () tuple2!12786)

(declare-fun b!143465 () Bool)

(assert (=> b!143465 (= e!95562 (and (= (_2!6735 lt!222342) (select (arr!3692 arr!237) from!447)) (= (_1!6735 lt!222342) (_2!6734 lt!222348))))))

(assert (=> b!143465 (= lt!222342 (readBytePure!0 (_1!6734 lt!222348)))))

(assert (=> b!143465 (= lt!222348 (reader!0 thiss!1634 (_2!6733 lt!222345)))))

(declare-fun e!95566 () Bool)

(declare-datatypes ((tuple2!12790 0))(
  ( (tuple2!12791 (_1!6736 BitStream!5196) (_2!6736 array!6559)) )
))
(declare-fun lt!222338 () tuple2!12790)

(declare-fun b!143466 () Bool)

(declare-fun arrayRangesEq!285 (array!6559 array!6559 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143466 (= e!95566 (not (arrayRangesEq!285 arr!237 (_2!6736 lt!222338) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143468 () Bool)

(declare-fun e!95568 () Bool)

(declare-fun array_inv!2758 (array!6559) Bool)

(assert (=> b!143468 (= e!95568 (array_inv!2758 (buf!3398 thiss!1634)))))

(declare-fun b!143469 () Bool)

(declare-fun res!119827 () Bool)

(assert (=> b!143469 (=> (not res!119827) (not e!95562))))

(assert (=> b!143469 (= res!119827 (= (bitIndex!0 (size!2969 (buf!3398 (_2!6733 lt!222345))) (currentByte!6282 (_2!6733 lt!222345)) (currentBit!6277 (_2!6733 lt!222345))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2969 (buf!3398 thiss!1634)) (currentByte!6282 thiss!1634) (currentBit!6277 thiss!1634)))))))

(declare-fun b!143470 () Bool)

(assert (=> b!143470 (= e!95563 (not e!95566))))

(declare-fun res!119817 () Bool)

(assert (=> b!143470 (=> res!119817 e!95566)))

(declare-fun lt!222351 () tuple2!12786)

(assert (=> b!143470 (= res!119817 (or (not (= (size!2969 (_2!6736 lt!222338)) (size!2969 arr!237))) (not (= (_1!6736 lt!222338) (_2!6734 lt!222351)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5196 array!6559 (_ BitVec 32) (_ BitVec 32)) tuple2!12790)

(assert (=> b!143470 (= lt!222338 (readByteArrayLoopPure!0 (_1!6734 lt!222351) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143470 (validate_offset_bits!1 ((_ sign_extend 32) (size!2969 (buf!3398 (_2!6733 lt!222347)))) ((_ sign_extend 32) (currentByte!6282 (_2!6733 lt!222345))) ((_ sign_extend 32) (currentBit!6277 (_2!6733 lt!222345))) lt!222346)))

(declare-fun lt!222339 () Unit!8938)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5196 array!6559 (_ BitVec 64)) Unit!8938)

(assert (=> b!143470 (= lt!222339 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6733 lt!222345) (buf!3398 (_2!6733 lt!222347)) lt!222346))))

(assert (=> b!143470 (= lt!222351 (reader!0 (_2!6733 lt!222345) (_2!6733 lt!222347)))))

(declare-fun b!143471 () Bool)

(declare-fun res!119821 () Bool)

(assert (=> b!143471 (=> (not res!119821) (not e!95562))))

(assert (=> b!143471 (= res!119821 (isPrefixOf!0 thiss!1634 (_2!6733 lt!222345)))))

(declare-fun b!143467 () Bool)

(declare-fun res!119824 () Bool)

(assert (=> b!143467 (=> (not res!119824) (not e!95570))))

(assert (=> b!143467 (= res!119824 (invariant!0 (currentBit!6277 thiss!1634) (currentByte!6282 thiss!1634) (size!2969 (buf!3398 thiss!1634))))))

(declare-fun res!119825 () Bool)

(assert (=> start!27802 (=> (not res!119825) (not e!95570))))

(assert (=> start!27802 (= res!119825 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2969 arr!237))))))

(assert (=> start!27802 e!95570))

(assert (=> start!27802 true))

(assert (=> start!27802 (array_inv!2758 arr!237)))

(declare-fun inv!12 (BitStream!5196) Bool)

(assert (=> start!27802 (and (inv!12 thiss!1634) e!95568)))

(assert (= (and start!27802 res!119825) b!143458))

(assert (= (and b!143458 res!119818) b!143462))

(assert (= (and b!143462 res!119828) b!143467))

(assert (= (and b!143467 res!119824) b!143460))

(assert (= (and b!143460 res!119823) b!143469))

(assert (= (and b!143469 res!119827) b!143471))

(assert (= (and b!143471 res!119821) b!143465))

(assert (= (and b!143460 res!119826) b!143459))

(assert (= (and b!143459 res!119816) b!143463))

(assert (= (and b!143463 res!119819) b!143470))

(assert (= (and b!143470 (not res!119817)) b!143466))

(assert (= (and b!143460 res!119820) b!143461))

(assert (= (and b!143460 res!119822) b!143464))

(assert (= start!27802 b!143468))

(declare-fun m!220253 () Bool)

(assert (=> b!143468 m!220253))

(declare-fun m!220255 () Bool)

(assert (=> b!143467 m!220255))

(declare-fun m!220257 () Bool)

(assert (=> b!143471 m!220257))

(declare-fun m!220259 () Bool)

(assert (=> b!143459 m!220259))

(declare-fun m!220261 () Bool)

(assert (=> b!143459 m!220261))

(declare-fun m!220263 () Bool)

(assert (=> b!143466 m!220263))

(declare-fun m!220265 () Bool)

(assert (=> b!143465 m!220265))

(declare-fun m!220267 () Bool)

(assert (=> b!143465 m!220267))

(declare-fun m!220269 () Bool)

(assert (=> b!143465 m!220269))

(declare-fun m!220271 () Bool)

(assert (=> b!143461 m!220271))

(declare-fun m!220273 () Bool)

(assert (=> b!143458 m!220273))

(assert (=> b!143469 m!220261))

(declare-fun m!220275 () Bool)

(assert (=> b!143469 m!220275))

(declare-fun m!220277 () Bool)

(assert (=> b!143470 m!220277))

(declare-fun m!220279 () Bool)

(assert (=> b!143470 m!220279))

(declare-fun m!220281 () Bool)

(assert (=> b!143470 m!220281))

(declare-fun m!220283 () Bool)

(assert (=> b!143470 m!220283))

(declare-fun m!220285 () Bool)

(assert (=> b!143463 m!220285))

(declare-fun m!220287 () Bool)

(assert (=> start!27802 m!220287))

(declare-fun m!220289 () Bool)

(assert (=> start!27802 m!220289))

(declare-fun m!220291 () Bool)

(assert (=> b!143460 m!220291))

(assert (=> b!143460 m!220283))

(declare-fun m!220293 () Bool)

(assert (=> b!143460 m!220293))

(declare-fun m!220295 () Bool)

(assert (=> b!143460 m!220295))

(declare-fun m!220297 () Bool)

(assert (=> b!143460 m!220297))

(declare-fun m!220299 () Bool)

(assert (=> b!143460 m!220299))

(declare-fun m!220301 () Bool)

(assert (=> b!143460 m!220301))

(declare-fun m!220303 () Bool)

(assert (=> b!143460 m!220303))

(declare-fun m!220305 () Bool)

(assert (=> b!143460 m!220305))

(assert (=> b!143460 m!220265))

(declare-fun m!220307 () Bool)

(assert (=> b!143460 m!220307))

(assert (=> b!143460 m!220265))

(declare-fun m!220309 () Bool)

(assert (=> b!143460 m!220309))

(declare-fun m!220311 () Bool)

(assert (=> b!143460 m!220311))

(declare-fun m!220313 () Bool)

(assert (=> b!143460 m!220313))

(declare-fun m!220315 () Bool)

(assert (=> b!143460 m!220315))

(check-sat (not b!143461) (not b!143466) (not b!143467) (not b!143463) (not b!143460) (not b!143470) (not b!143458) (not b!143468) (not b!143471) (not start!27802) (not b!143459) (not b!143465) (not b!143469))
