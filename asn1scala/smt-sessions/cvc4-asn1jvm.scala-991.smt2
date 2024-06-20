; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27804 () Bool)

(assert start!27804)

(declare-fun b!143500 () Bool)

(declare-fun res!119862 () Bool)

(declare-fun e!95595 () Bool)

(assert (=> b!143500 (=> (not res!119862) (not e!95595))))

(declare-datatypes ((array!6561 0))(
  ( (array!6562 (arr!3693 (Array (_ BitVec 32) (_ BitVec 8))) (size!2970 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5198 0))(
  ( (BitStream!5199 (buf!3399 array!6561) (currentByte!6283 (_ BitVec 32)) (currentBit!6278 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8940 0))(
  ( (Unit!8941) )
))
(declare-datatypes ((tuple2!12792 0))(
  ( (tuple2!12793 (_1!6737 Unit!8940) (_2!6737 BitStream!5198)) )
))
(declare-fun lt!222393 () tuple2!12792)

(declare-fun lt!222385 () tuple2!12792)

(declare-fun isPrefixOf!0 (BitStream!5198 BitStream!5198) Bool)

(assert (=> b!143500 (= res!119862 (isPrefixOf!0 (_2!6737 lt!222393) (_2!6737 lt!222385)))))

(declare-fun b!143501 () Bool)

(declare-fun e!95592 () Bool)

(declare-fun thiss!1634 () BitStream!5198)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143501 (= e!95592 (invariant!0 (currentBit!6278 thiss!1634) (currentByte!6283 thiss!1634) (size!2970 (buf!3399 (_2!6737 lt!222393)))))))

(declare-datatypes ((tuple2!12794 0))(
  ( (tuple2!12795 (_1!6738 BitStream!5198) (_2!6738 BitStream!5198)) )
))
(declare-fun lt!222399 () tuple2!12794)

(declare-fun e!95600 () Bool)

(declare-fun b!143502 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12796 0))(
  ( (tuple2!12797 (_1!6739 BitStream!5198) (_2!6739 (_ BitVec 8))) )
))
(declare-fun lt!222400 () tuple2!12796)

(declare-fun arr!237 () array!6561)

(assert (=> b!143502 (= e!95600 (and (= (_2!6739 lt!222400) (select (arr!3693 arr!237) from!447)) (= (_1!6739 lt!222400) (_2!6738 lt!222399))))))

(declare-fun readBytePure!0 (BitStream!5198) tuple2!12796)

(assert (=> b!143502 (= lt!222400 (readBytePure!0 (_1!6738 lt!222399)))))

(declare-fun reader!0 (BitStream!5198 BitStream!5198) tuple2!12794)

(assert (=> b!143502 (= lt!222399 (reader!0 thiss!1634 (_2!6737 lt!222393)))))

(declare-fun b!143503 () Bool)

(declare-fun res!119867 () Bool)

(assert (=> b!143503 (=> (not res!119867) (not e!95600))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143503 (= res!119867 (= (bitIndex!0 (size!2970 (buf!3399 (_2!6737 lt!222393))) (currentByte!6283 (_2!6737 lt!222393)) (currentBit!6278 (_2!6737 lt!222393))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2970 (buf!3399 thiss!1634)) (currentByte!6283 thiss!1634) (currentBit!6278 thiss!1634)))))))

(declare-fun b!143505 () Bool)

(declare-fun e!95594 () Bool)

(assert (=> b!143505 (= e!95594 e!95595)))

(declare-fun res!119863 () Bool)

(assert (=> b!143505 (=> (not res!119863) (not e!95595))))

(declare-fun lt!222388 () (_ BitVec 64))

(assert (=> b!143505 (= res!119863 (= (bitIndex!0 (size!2970 (buf!3399 (_2!6737 lt!222385))) (currentByte!6283 (_2!6737 lt!222385)) (currentBit!6278 (_2!6737 lt!222385))) (bvadd (bitIndex!0 (size!2970 (buf!3399 (_2!6737 lt!222393))) (currentByte!6283 (_2!6737 lt!222393)) (currentBit!6278 (_2!6737 lt!222393))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222388))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!143505 (= lt!222388 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!12798 0))(
  ( (tuple2!12799 (_1!6740 BitStream!5198) (_2!6740 array!6561)) )
))
(declare-fun lt!222389 () tuple2!12798)

(declare-fun e!95598 () Bool)

(declare-fun b!143506 () Bool)

(declare-fun arrayRangesEq!286 (array!6561 array!6561 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143506 (= e!95598 (not (arrayRangesEq!286 arr!237 (_2!6740 lt!222389) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!143507 () Bool)

(declare-fun res!119864 () Bool)

(declare-fun e!95599 () Bool)

(assert (=> b!143507 (=> (not res!119864) (not e!95599))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143507 (= res!119864 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2970 (buf!3399 thiss!1634))) ((_ sign_extend 32) (currentByte!6283 thiss!1634)) ((_ sign_extend 32) (currentBit!6278 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143508 () Bool)

(declare-fun e!95601 () Bool)

(declare-fun array_inv!2759 (array!6561) Bool)

(assert (=> b!143508 (= e!95601 (array_inv!2759 (buf!3399 thiss!1634)))))

(declare-fun b!143509 () Bool)

(assert (=> b!143509 (= e!95595 (not e!95598))))

(declare-fun res!119866 () Bool)

(assert (=> b!143509 (=> res!119866 e!95598)))

(declare-fun lt!222387 () tuple2!12794)

(assert (=> b!143509 (= res!119866 (or (not (= (size!2970 (_2!6740 lt!222389)) (size!2970 arr!237))) (not (= (_1!6740 lt!222389) (_2!6738 lt!222387)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5198 array!6561 (_ BitVec 32) (_ BitVec 32)) tuple2!12798)

(assert (=> b!143509 (= lt!222389 (readByteArrayLoopPure!0 (_1!6738 lt!222387) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143509 (validate_offset_bits!1 ((_ sign_extend 32) (size!2970 (buf!3399 (_2!6737 lt!222385)))) ((_ sign_extend 32) (currentByte!6283 (_2!6737 lt!222393))) ((_ sign_extend 32) (currentBit!6278 (_2!6737 lt!222393))) lt!222388)))

(declare-fun lt!222397 () Unit!8940)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5198 array!6561 (_ BitVec 64)) Unit!8940)

(assert (=> b!143509 (= lt!222397 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6737 lt!222393) (buf!3399 (_2!6737 lt!222385)) lt!222388))))

(assert (=> b!143509 (= lt!222387 (reader!0 (_2!6737 lt!222393) (_2!6737 lt!222385)))))

(declare-fun b!143510 () Bool)

(declare-fun res!119859 () Bool)

(assert (=> b!143510 (=> (not res!119859) (not e!95599))))

(assert (=> b!143510 (= res!119859 (invariant!0 (currentBit!6278 thiss!1634) (currentByte!6283 thiss!1634) (size!2970 (buf!3399 thiss!1634))))))

(declare-fun b!143511 () Bool)

(declare-fun res!119856 () Bool)

(assert (=> b!143511 (=> (not res!119856) (not e!95600))))

(assert (=> b!143511 (= res!119856 (isPrefixOf!0 thiss!1634 (_2!6737 lt!222393)))))

(declare-fun b!143512 () Bool)

(declare-fun e!95596 () Bool)

(declare-fun lt!222398 () tuple2!12796)

(declare-fun lt!222394 () tuple2!12796)

(assert (=> b!143512 (= e!95596 (= (_2!6739 lt!222398) (_2!6739 lt!222394)))))

(declare-fun b!143513 () Bool)

(declare-fun res!119865 () Bool)

(assert (=> b!143513 (=> (not res!119865) (not e!95599))))

(assert (=> b!143513 (= res!119865 (bvslt from!447 to!404))))

(declare-fun b!143504 () Bool)

(assert (=> b!143504 (= e!95599 (not true))))

(declare-fun lt!222396 () tuple2!12794)

(assert (=> b!143504 (= (_2!6739 (readBytePure!0 (_1!6738 lt!222396))) (select (arr!3693 arr!237) from!447))))

(declare-fun lt!222386 () tuple2!12794)

(assert (=> b!143504 (= lt!222386 (reader!0 (_2!6737 lt!222393) (_2!6737 lt!222385)))))

(assert (=> b!143504 (= lt!222396 (reader!0 thiss!1634 (_2!6737 lt!222385)))))

(assert (=> b!143504 e!95596))

(declare-fun res!119861 () Bool)

(assert (=> b!143504 (=> (not res!119861) (not e!95596))))

(assert (=> b!143504 (= res!119861 (= (bitIndex!0 (size!2970 (buf!3399 (_1!6739 lt!222398))) (currentByte!6283 (_1!6739 lt!222398)) (currentBit!6278 (_1!6739 lt!222398))) (bitIndex!0 (size!2970 (buf!3399 (_1!6739 lt!222394))) (currentByte!6283 (_1!6739 lt!222394)) (currentBit!6278 (_1!6739 lt!222394)))))))

(declare-fun lt!222391 () Unit!8940)

(declare-fun lt!222390 () BitStream!5198)

(declare-fun readBytePrefixLemma!0 (BitStream!5198 BitStream!5198) Unit!8940)

(assert (=> b!143504 (= lt!222391 (readBytePrefixLemma!0 lt!222390 (_2!6737 lt!222385)))))

(assert (=> b!143504 (= lt!222394 (readBytePure!0 (BitStream!5199 (buf!3399 (_2!6737 lt!222385)) (currentByte!6283 thiss!1634) (currentBit!6278 thiss!1634))))))

(assert (=> b!143504 (= lt!222398 (readBytePure!0 lt!222390))))

(assert (=> b!143504 (= lt!222390 (BitStream!5199 (buf!3399 (_2!6737 lt!222393)) (currentByte!6283 thiss!1634) (currentBit!6278 thiss!1634)))))

(assert (=> b!143504 e!95592))

(declare-fun res!119860 () Bool)

(assert (=> b!143504 (=> (not res!119860) (not e!95592))))

(assert (=> b!143504 (= res!119860 (isPrefixOf!0 thiss!1634 (_2!6737 lt!222385)))))

(declare-fun lt!222392 () Unit!8940)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5198 BitStream!5198 BitStream!5198) Unit!8940)

(assert (=> b!143504 (= lt!222392 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6737 lt!222393) (_2!6737 lt!222385)))))

(assert (=> b!143504 e!95594))

(declare-fun res!119855 () Bool)

(assert (=> b!143504 (=> (not res!119855) (not e!95594))))

(assert (=> b!143504 (= res!119855 (= (size!2970 (buf!3399 (_2!6737 lt!222393))) (size!2970 (buf!3399 (_2!6737 lt!222385)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5198 array!6561 (_ BitVec 32) (_ BitVec 32)) tuple2!12792)

(assert (=> b!143504 (= lt!222385 (appendByteArrayLoop!0 (_2!6737 lt!222393) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143504 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2970 (buf!3399 (_2!6737 lt!222393)))) ((_ sign_extend 32) (currentByte!6283 (_2!6737 lt!222393))) ((_ sign_extend 32) (currentBit!6278 (_2!6737 lt!222393))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222395 () Unit!8940)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5198 BitStream!5198 (_ BitVec 64) (_ BitVec 32)) Unit!8940)

(assert (=> b!143504 (= lt!222395 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6737 lt!222393) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143504 e!95600))

(declare-fun res!119858 () Bool)

(assert (=> b!143504 (=> (not res!119858) (not e!95600))))

(assert (=> b!143504 (= res!119858 (= (size!2970 (buf!3399 thiss!1634)) (size!2970 (buf!3399 (_2!6737 lt!222393)))))))

(declare-fun appendByte!0 (BitStream!5198 (_ BitVec 8)) tuple2!12792)

(assert (=> b!143504 (= lt!222393 (appendByte!0 thiss!1634 (select (arr!3693 arr!237) from!447)))))

(declare-fun res!119857 () Bool)

(assert (=> start!27804 (=> (not res!119857) (not e!95599))))

(assert (=> start!27804 (= res!119857 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2970 arr!237))))))

(assert (=> start!27804 e!95599))

(assert (=> start!27804 true))

(assert (=> start!27804 (array_inv!2759 arr!237)))

(declare-fun inv!12 (BitStream!5198) Bool)

(assert (=> start!27804 (and (inv!12 thiss!1634) e!95601)))

(assert (= (and start!27804 res!119857) b!143507))

(assert (= (and b!143507 res!119864) b!143513))

(assert (= (and b!143513 res!119865) b!143510))

(assert (= (and b!143510 res!119859) b!143504))

(assert (= (and b!143504 res!119858) b!143503))

(assert (= (and b!143503 res!119867) b!143511))

(assert (= (and b!143511 res!119856) b!143502))

(assert (= (and b!143504 res!119855) b!143505))

(assert (= (and b!143505 res!119863) b!143500))

(assert (= (and b!143500 res!119862) b!143509))

(assert (= (and b!143509 (not res!119866)) b!143506))

(assert (= (and b!143504 res!119860) b!143501))

(assert (= (and b!143504 res!119861) b!143512))

(assert (= start!27804 b!143508))

(declare-fun m!220317 () Bool)

(assert (=> b!143504 m!220317))

(declare-fun m!220319 () Bool)

(assert (=> b!143504 m!220319))

(declare-fun m!220321 () Bool)

(assert (=> b!143504 m!220321))

(declare-fun m!220323 () Bool)

(assert (=> b!143504 m!220323))

(declare-fun m!220325 () Bool)

(assert (=> b!143504 m!220325))

(declare-fun m!220327 () Bool)

(assert (=> b!143504 m!220327))

(declare-fun m!220329 () Bool)

(assert (=> b!143504 m!220329))

(declare-fun m!220331 () Bool)

(assert (=> b!143504 m!220331))

(declare-fun m!220333 () Bool)

(assert (=> b!143504 m!220333))

(declare-fun m!220335 () Bool)

(assert (=> b!143504 m!220335))

(declare-fun m!220337 () Bool)

(assert (=> b!143504 m!220337))

(declare-fun m!220339 () Bool)

(assert (=> b!143504 m!220339))

(declare-fun m!220341 () Bool)

(assert (=> b!143504 m!220341))

(assert (=> b!143504 m!220337))

(declare-fun m!220343 () Bool)

(assert (=> b!143504 m!220343))

(declare-fun m!220345 () Bool)

(assert (=> b!143504 m!220345))

(declare-fun m!220347 () Bool)

(assert (=> b!143509 m!220347))

(declare-fun m!220349 () Bool)

(assert (=> b!143509 m!220349))

(declare-fun m!220351 () Bool)

(assert (=> b!143509 m!220351))

(assert (=> b!143509 m!220327))

(declare-fun m!220353 () Bool)

(assert (=> start!27804 m!220353))

(declare-fun m!220355 () Bool)

(assert (=> start!27804 m!220355))

(declare-fun m!220357 () Bool)

(assert (=> b!143510 m!220357))

(declare-fun m!220359 () Bool)

(assert (=> b!143501 m!220359))

(assert (=> b!143502 m!220337))

(declare-fun m!220361 () Bool)

(assert (=> b!143502 m!220361))

(declare-fun m!220363 () Bool)

(assert (=> b!143502 m!220363))

(declare-fun m!220365 () Bool)

(assert (=> b!143507 m!220365))

(declare-fun m!220367 () Bool)

(assert (=> b!143506 m!220367))

(declare-fun m!220369 () Bool)

(assert (=> b!143503 m!220369))

(declare-fun m!220371 () Bool)

(assert (=> b!143503 m!220371))

(declare-fun m!220373 () Bool)

(assert (=> b!143505 m!220373))

(assert (=> b!143505 m!220369))

(declare-fun m!220375 () Bool)

(assert (=> b!143511 m!220375))

(declare-fun m!220377 () Bool)

(assert (=> b!143500 m!220377))

(declare-fun m!220379 () Bool)

(assert (=> b!143508 m!220379))

(push 1)

