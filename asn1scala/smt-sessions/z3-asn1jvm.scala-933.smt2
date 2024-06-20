; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26374 () Bool)

(assert start!26374)

(declare-fun b!135291 () Bool)

(declare-fun res!112508 () Bool)

(declare-fun e!89813 () Bool)

(assert (=> b!135291 (=> (not res!112508) (not e!89813))))

(declare-datatypes ((array!6174 0))(
  ( (array!6175 (arr!3460 (Array (_ BitVec 32) (_ BitVec 8))) (size!2795 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4854 0))(
  ( (BitStream!4855 (buf!3188 array!6174) (currentByte!5985 (_ BitVec 32)) (currentBit!5980 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8428 0))(
  ( (Unit!8429) )
))
(declare-datatypes ((tuple2!11756 0))(
  ( (tuple2!11757 (_1!6194 Unit!8428) (_2!6194 BitStream!4854)) )
))
(declare-fun lt!209991 () tuple2!11756)

(declare-fun thiss!1634 () BitStream!4854)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135291 (= res!112508 (= (bitIndex!0 (size!2795 (buf!3188 (_2!6194 lt!209991))) (currentByte!5985 (_2!6194 lt!209991)) (currentBit!5980 (_2!6194 lt!209991))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2795 (buf!3188 thiss!1634)) (currentByte!5985 thiss!1634) (currentBit!5980 thiss!1634)))))))

(declare-fun b!135292 () Bool)

(declare-fun res!112509 () Bool)

(declare-fun e!89814 () Bool)

(assert (=> b!135292 (=> (not res!112509) (not e!89814))))

(declare-fun lt!209994 () tuple2!11756)

(declare-fun isPrefixOf!0 (BitStream!4854 BitStream!4854) Bool)

(assert (=> b!135292 (= res!112509 (isPrefixOf!0 (_2!6194 lt!209991) (_2!6194 lt!209994)))))

(declare-fun b!135293 () Bool)

(declare-fun res!112510 () Bool)

(declare-fun e!89809 () Bool)

(assert (=> b!135293 (=> (not res!112510) (not e!89809))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!135293 (= res!112510 (bvslt from!447 to!404))))

(declare-fun b!135294 () Bool)

(declare-fun res!112512 () Bool)

(assert (=> b!135294 (=> (not res!112512) (not e!89809))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135294 (= res!112512 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2795 (buf!3188 thiss!1634))) ((_ sign_extend 32) (currentByte!5985 thiss!1634)) ((_ sign_extend 32) (currentBit!5980 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135295 () Bool)

(declare-fun res!112517 () Bool)

(assert (=> b!135295 (=> (not res!112517) (not e!89813))))

(assert (=> b!135295 (= res!112517 (isPrefixOf!0 thiss!1634 (_2!6194 lt!209991)))))

(declare-fun res!112506 () Bool)

(assert (=> start!26374 (=> (not res!112506) (not e!89809))))

(declare-fun arr!237 () array!6174)

(assert (=> start!26374 (= res!112506 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2795 arr!237))))))

(assert (=> start!26374 e!89809))

(assert (=> start!26374 true))

(declare-fun array_inv!2584 (array!6174) Bool)

(assert (=> start!26374 (array_inv!2584 arr!237)))

(declare-fun e!89804 () Bool)

(declare-fun inv!12 (BitStream!4854) Bool)

(assert (=> start!26374 (and (inv!12 thiss!1634) e!89804)))

(declare-fun b!135296 () Bool)

(declare-fun e!89806 () Bool)

(assert (=> b!135296 (= e!89806 e!89814)))

(declare-fun res!112511 () Bool)

(assert (=> b!135296 (=> (not res!112511) (not e!89814))))

(declare-fun lt!209981 () (_ BitVec 64))

(assert (=> b!135296 (= res!112511 (= (bitIndex!0 (size!2795 (buf!3188 (_2!6194 lt!209994))) (currentByte!5985 (_2!6194 lt!209994)) (currentBit!5980 (_2!6194 lt!209994))) (bvadd (bitIndex!0 (size!2795 (buf!3188 (_2!6194 lt!209991))) (currentByte!5985 (_2!6194 lt!209991)) (currentBit!5980 (_2!6194 lt!209991))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209981))))))

(assert (=> b!135296 (= lt!209981 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!11758 0))(
  ( (tuple2!11759 (_1!6195 BitStream!4854) (_2!6195 array!6174)) )
))
(declare-fun lt!209986 () tuple2!11758)

(declare-fun e!89807 () Bool)

(declare-fun b!135297 () Bool)

(declare-fun arrayRangesEq!198 (array!6174 array!6174 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135297 (= e!89807 (not (arrayRangesEq!198 arr!237 (_2!6195 lt!209986) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135298 () Bool)

(declare-fun e!89812 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135298 (= e!89812 (invariant!0 (currentBit!5980 thiss!1634) (currentByte!5985 thiss!1634) (size!2795 (buf!3188 (_2!6194 lt!209991)))))))

(declare-fun b!135299 () Bool)

(assert (=> b!135299 (= e!89804 (array_inv!2584 (buf!3188 thiss!1634)))))

(declare-fun b!135300 () Bool)

(declare-fun e!89810 () Bool)

(assert (=> b!135300 (= e!89809 (not e!89810))))

(declare-fun res!112516 () Bool)

(assert (=> b!135300 (=> res!112516 e!89810)))

(declare-fun lt!209992 () tuple2!11758)

(declare-fun lt!209976 () tuple2!11758)

(assert (=> b!135300 (= res!112516 (not (arrayRangesEq!198 (_2!6195 lt!209992) (_2!6195 lt!209976) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209990 () tuple2!11758)

(assert (=> b!135300 (arrayRangesEq!198 (_2!6195 lt!209992) (_2!6195 lt!209990) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!11760 0))(
  ( (tuple2!11761 (_1!6196 BitStream!4854) (_2!6196 BitStream!4854)) )
))
(declare-fun lt!209982 () tuple2!11760)

(declare-fun lt!209971 () Unit!8428)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4854 array!6174 (_ BitVec 32) (_ BitVec 32)) Unit!8428)

(assert (=> b!135300 (= lt!209971 (readByteArrayLoopArrayPrefixLemma!0 (_1!6196 lt!209982) arr!237 from!447 to!404))))

(declare-fun lt!209970 () array!6174)

(declare-fun readByteArrayLoopPure!0 (BitStream!4854 array!6174 (_ BitVec 32) (_ BitVec 32)) tuple2!11758)

(declare-fun withMovedByteIndex!0 (BitStream!4854 (_ BitVec 32)) BitStream!4854)

(assert (=> b!135300 (= lt!209990 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6196 lt!209982) #b00000000000000000000000000000001) lt!209970 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209984 () tuple2!11760)

(assert (=> b!135300 (= lt!209976 (readByteArrayLoopPure!0 (_1!6196 lt!209984) lt!209970 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11762 0))(
  ( (tuple2!11763 (_1!6197 BitStream!4854) (_2!6197 (_ BitVec 8))) )
))
(declare-fun lt!209983 () tuple2!11762)

(assert (=> b!135300 (= lt!209970 (array!6175 (store (arr!3460 arr!237) from!447 (_2!6197 lt!209983)) (size!2795 arr!237)))))

(declare-fun lt!209975 () (_ BitVec 32))

(assert (=> b!135300 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2795 (buf!3188 (_2!6194 lt!209994)))) ((_ sign_extend 32) (currentByte!5985 (_2!6194 lt!209991))) ((_ sign_extend 32) (currentBit!5980 (_2!6194 lt!209991))) lt!209975)))

(declare-fun lt!209993 () Unit!8428)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4854 array!6174 (_ BitVec 32)) Unit!8428)

(assert (=> b!135300 (= lt!209993 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6194 lt!209991) (buf!3188 (_2!6194 lt!209994)) lt!209975))))

(assert (=> b!135300 (= (_1!6195 lt!209992) (_2!6196 lt!209982))))

(assert (=> b!135300 (= lt!209992 (readByteArrayLoopPure!0 (_1!6196 lt!209982) arr!237 from!447 to!404))))

(assert (=> b!135300 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2795 (buf!3188 (_2!6194 lt!209994)))) ((_ sign_extend 32) (currentByte!5985 thiss!1634)) ((_ sign_extend 32) (currentBit!5980 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209989 () Unit!8428)

(assert (=> b!135300 (= lt!209989 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3188 (_2!6194 lt!209994)) (bvsub to!404 from!447)))))

(assert (=> b!135300 (= (_2!6197 lt!209983) (select (arr!3460 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4854) tuple2!11762)

(assert (=> b!135300 (= lt!209983 (readBytePure!0 (_1!6196 lt!209982)))))

(declare-fun reader!0 (BitStream!4854 BitStream!4854) tuple2!11760)

(assert (=> b!135300 (= lt!209984 (reader!0 (_2!6194 lt!209991) (_2!6194 lt!209994)))))

(assert (=> b!135300 (= lt!209982 (reader!0 thiss!1634 (_2!6194 lt!209994)))))

(declare-fun e!89808 () Bool)

(assert (=> b!135300 e!89808))

(declare-fun res!112515 () Bool)

(assert (=> b!135300 (=> (not res!112515) (not e!89808))))

(declare-fun lt!209987 () tuple2!11762)

(declare-fun lt!209980 () tuple2!11762)

(assert (=> b!135300 (= res!112515 (= (bitIndex!0 (size!2795 (buf!3188 (_1!6197 lt!209987))) (currentByte!5985 (_1!6197 lt!209987)) (currentBit!5980 (_1!6197 lt!209987))) (bitIndex!0 (size!2795 (buf!3188 (_1!6197 lt!209980))) (currentByte!5985 (_1!6197 lt!209980)) (currentBit!5980 (_1!6197 lt!209980)))))))

(declare-fun lt!209985 () Unit!8428)

(declare-fun lt!209988 () BitStream!4854)

(declare-fun readBytePrefixLemma!0 (BitStream!4854 BitStream!4854) Unit!8428)

(assert (=> b!135300 (= lt!209985 (readBytePrefixLemma!0 lt!209988 (_2!6194 lt!209994)))))

(assert (=> b!135300 (= lt!209980 (readBytePure!0 (BitStream!4855 (buf!3188 (_2!6194 lt!209994)) (currentByte!5985 thiss!1634) (currentBit!5980 thiss!1634))))))

(assert (=> b!135300 (= lt!209987 (readBytePure!0 lt!209988))))

(assert (=> b!135300 (= lt!209988 (BitStream!4855 (buf!3188 (_2!6194 lt!209991)) (currentByte!5985 thiss!1634) (currentBit!5980 thiss!1634)))))

(assert (=> b!135300 e!89812))

(declare-fun res!112518 () Bool)

(assert (=> b!135300 (=> (not res!112518) (not e!89812))))

(assert (=> b!135300 (= res!112518 (isPrefixOf!0 thiss!1634 (_2!6194 lt!209994)))))

(declare-fun lt!209977 () Unit!8428)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4854 BitStream!4854 BitStream!4854) Unit!8428)

(assert (=> b!135300 (= lt!209977 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6194 lt!209991) (_2!6194 lt!209994)))))

(assert (=> b!135300 e!89806))

(declare-fun res!112514 () Bool)

(assert (=> b!135300 (=> (not res!112514) (not e!89806))))

(assert (=> b!135300 (= res!112514 (= (size!2795 (buf!3188 (_2!6194 lt!209991))) (size!2795 (buf!3188 (_2!6194 lt!209994)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4854 array!6174 (_ BitVec 32) (_ BitVec 32)) tuple2!11756)

(assert (=> b!135300 (= lt!209994 (appendByteArrayLoop!0 (_2!6194 lt!209991) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135300 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2795 (buf!3188 (_2!6194 lt!209991)))) ((_ sign_extend 32) (currentByte!5985 (_2!6194 lt!209991))) ((_ sign_extend 32) (currentBit!5980 (_2!6194 lt!209991))) lt!209975)))

(assert (=> b!135300 (= lt!209975 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209973 () Unit!8428)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4854 BitStream!4854 (_ BitVec 64) (_ BitVec 32)) Unit!8428)

(assert (=> b!135300 (= lt!209973 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6194 lt!209991) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135300 e!89813))

(declare-fun res!112513 () Bool)

(assert (=> b!135300 (=> (not res!112513) (not e!89813))))

(assert (=> b!135300 (= res!112513 (= (size!2795 (buf!3188 thiss!1634)) (size!2795 (buf!3188 (_2!6194 lt!209991)))))))

(declare-fun appendByte!0 (BitStream!4854 (_ BitVec 8)) tuple2!11756)

(assert (=> b!135300 (= lt!209991 (appendByte!0 thiss!1634 (select (arr!3460 arr!237) from!447)))))

(declare-fun b!135301 () Bool)

(assert (=> b!135301 (= e!89814 (not e!89807))))

(declare-fun res!112505 () Bool)

(assert (=> b!135301 (=> res!112505 e!89807)))

(declare-fun lt!209978 () tuple2!11760)

(assert (=> b!135301 (= res!112505 (or (not (= (size!2795 (_2!6195 lt!209986)) (size!2795 arr!237))) (not (= (_1!6195 lt!209986) (_2!6196 lt!209978)))))))

(assert (=> b!135301 (= lt!209986 (readByteArrayLoopPure!0 (_1!6196 lt!209978) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135301 (validate_offset_bits!1 ((_ sign_extend 32) (size!2795 (buf!3188 (_2!6194 lt!209994)))) ((_ sign_extend 32) (currentByte!5985 (_2!6194 lt!209991))) ((_ sign_extend 32) (currentBit!5980 (_2!6194 lt!209991))) lt!209981)))

(declare-fun lt!209979 () Unit!8428)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4854 array!6174 (_ BitVec 64)) Unit!8428)

(assert (=> b!135301 (= lt!209979 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6194 lt!209991) (buf!3188 (_2!6194 lt!209994)) lt!209981))))

(assert (=> b!135301 (= lt!209978 (reader!0 (_2!6194 lt!209991) (_2!6194 lt!209994)))))

(declare-fun b!135302 () Bool)

(assert (=> b!135302 (= e!89808 (= (_2!6197 lt!209987) (_2!6197 lt!209980)))))

(declare-fun b!135303 () Bool)

(assert (=> b!135303 (= e!89810 true)))

(assert (=> b!135303 (arrayRangesEq!198 (_2!6195 lt!209976) (_2!6195 lt!209992) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209972 () Unit!8428)

(declare-fun arrayRangesEqSymmetricLemma!11 (array!6174 array!6174 (_ BitVec 32) (_ BitVec 32)) Unit!8428)

(assert (=> b!135303 (= lt!209972 (arrayRangesEqSymmetricLemma!11 (_2!6195 lt!209992) (_2!6195 lt!209976) #b00000000000000000000000000000000 to!404))))

(declare-fun lt!209974 () tuple2!11760)

(declare-fun b!135304 () Bool)

(declare-fun lt!209995 () tuple2!11762)

(assert (=> b!135304 (= e!89813 (and (= (_2!6197 lt!209995) (select (arr!3460 arr!237) from!447)) (= (_1!6197 lt!209995) (_2!6196 lt!209974))))))

(assert (=> b!135304 (= lt!209995 (readBytePure!0 (_1!6196 lt!209974)))))

(assert (=> b!135304 (= lt!209974 (reader!0 thiss!1634 (_2!6194 lt!209991)))))

(declare-fun b!135305 () Bool)

(declare-fun res!112507 () Bool)

(assert (=> b!135305 (=> (not res!112507) (not e!89809))))

(assert (=> b!135305 (= res!112507 (invariant!0 (currentBit!5980 thiss!1634) (currentByte!5985 thiss!1634) (size!2795 (buf!3188 thiss!1634))))))

(assert (= (and start!26374 res!112506) b!135294))

(assert (= (and b!135294 res!112512) b!135293))

(assert (= (and b!135293 res!112510) b!135305))

(assert (= (and b!135305 res!112507) b!135300))

(assert (= (and b!135300 res!112513) b!135291))

(assert (= (and b!135291 res!112508) b!135295))

(assert (= (and b!135295 res!112517) b!135304))

(assert (= (and b!135300 res!112514) b!135296))

(assert (= (and b!135296 res!112511) b!135292))

(assert (= (and b!135292 res!112509) b!135301))

(assert (= (and b!135301 (not res!112505)) b!135297))

(assert (= (and b!135300 res!112518) b!135298))

(assert (= (and b!135300 res!112515) b!135302))

(assert (= (and b!135300 (not res!112516)) b!135303))

(assert (= start!26374 b!135299))

(declare-fun m!206319 () Bool)

(assert (=> b!135300 m!206319))

(declare-fun m!206321 () Bool)

(assert (=> b!135300 m!206321))

(declare-fun m!206323 () Bool)

(assert (=> b!135300 m!206323))

(declare-fun m!206325 () Bool)

(assert (=> b!135300 m!206325))

(declare-fun m!206327 () Bool)

(assert (=> b!135300 m!206327))

(declare-fun m!206329 () Bool)

(assert (=> b!135300 m!206329))

(declare-fun m!206331 () Bool)

(assert (=> b!135300 m!206331))

(declare-fun m!206333 () Bool)

(assert (=> b!135300 m!206333))

(declare-fun m!206335 () Bool)

(assert (=> b!135300 m!206335))

(declare-fun m!206337 () Bool)

(assert (=> b!135300 m!206337))

(declare-fun m!206339 () Bool)

(assert (=> b!135300 m!206339))

(declare-fun m!206341 () Bool)

(assert (=> b!135300 m!206341))

(declare-fun m!206343 () Bool)

(assert (=> b!135300 m!206343))

(declare-fun m!206345 () Bool)

(assert (=> b!135300 m!206345))

(assert (=> b!135300 m!206331))

(declare-fun m!206347 () Bool)

(assert (=> b!135300 m!206347))

(declare-fun m!206349 () Bool)

(assert (=> b!135300 m!206349))

(declare-fun m!206351 () Bool)

(assert (=> b!135300 m!206351))

(declare-fun m!206353 () Bool)

(assert (=> b!135300 m!206353))

(declare-fun m!206355 () Bool)

(assert (=> b!135300 m!206355))

(declare-fun m!206357 () Bool)

(assert (=> b!135300 m!206357))

(declare-fun m!206359 () Bool)

(assert (=> b!135300 m!206359))

(declare-fun m!206361 () Bool)

(assert (=> b!135300 m!206361))

(declare-fun m!206363 () Bool)

(assert (=> b!135300 m!206363))

(declare-fun m!206365 () Bool)

(assert (=> b!135300 m!206365))

(declare-fun m!206367 () Bool)

(assert (=> b!135300 m!206367))

(declare-fun m!206369 () Bool)

(assert (=> b!135300 m!206369))

(declare-fun m!206371 () Bool)

(assert (=> b!135300 m!206371))

(assert (=> b!135300 m!206337))

(declare-fun m!206373 () Bool)

(assert (=> b!135305 m!206373))

(declare-fun m!206375 () Bool)

(assert (=> b!135296 m!206375))

(declare-fun m!206377 () Bool)

(assert (=> b!135296 m!206377))

(declare-fun m!206379 () Bool)

(assert (=> b!135295 m!206379))

(declare-fun m!206381 () Bool)

(assert (=> b!135292 m!206381))

(assert (=> b!135291 m!206377))

(declare-fun m!206383 () Bool)

(assert (=> b!135291 m!206383))

(declare-fun m!206385 () Bool)

(assert (=> b!135299 m!206385))

(declare-fun m!206387 () Bool)

(assert (=> b!135303 m!206387))

(declare-fun m!206389 () Bool)

(assert (=> b!135303 m!206389))

(declare-fun m!206391 () Bool)

(assert (=> b!135301 m!206391))

(declare-fun m!206393 () Bool)

(assert (=> b!135301 m!206393))

(declare-fun m!206395 () Bool)

(assert (=> b!135301 m!206395))

(assert (=> b!135301 m!206365))

(assert (=> b!135304 m!206337))

(declare-fun m!206397 () Bool)

(assert (=> b!135304 m!206397))

(declare-fun m!206399 () Bool)

(assert (=> b!135304 m!206399))

(declare-fun m!206401 () Bool)

(assert (=> b!135297 m!206401))

(declare-fun m!206403 () Bool)

(assert (=> start!26374 m!206403))

(declare-fun m!206405 () Bool)

(assert (=> start!26374 m!206405))

(declare-fun m!206407 () Bool)

(assert (=> b!135298 m!206407))

(declare-fun m!206409 () Bool)

(assert (=> b!135294 m!206409))

(check-sat (not b!135301) (not b!135292) (not b!135294) (not b!135297) (not b!135299) (not b!135298) (not b!135295) (not start!26374) (not b!135300) (not b!135303) (not b!135291) (not b!135296) (not b!135304) (not b!135305))
