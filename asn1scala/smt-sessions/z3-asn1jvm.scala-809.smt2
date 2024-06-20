; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23794 () Bool)

(assert start!23794)

(declare-fun b!120412 () Bool)

(declare-fun res!99692 () Bool)

(declare-fun e!78864 () Bool)

(assert (=> b!120412 (=> (not res!99692) (not e!78864))))

(declare-datatypes ((array!5359 0))(
  ( (array!5360 (arr!3019 (Array (_ BitVec 32) (_ BitVec 8))) (size!2426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4326 0))(
  ( (BitStream!4327 (buf!2857 array!5359) (currentByte!5536 (_ BitVec 32)) (currentBit!5531 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4326)

(declare-datatypes ((Unit!7419 0))(
  ( (Unit!7420) )
))
(declare-datatypes ((tuple2!10092 0))(
  ( (tuple2!10093 (_1!5311 Unit!7419) (_2!5311 BitStream!4326)) )
))
(declare-fun lt!187462 () tuple2!10092)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120412 (= res!99692 (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(declare-fun b!120413 () Bool)

(declare-fun e!78865 () Bool)

(declare-fun e!78862 () Bool)

(assert (=> b!120413 (= e!78865 e!78862)))

(declare-fun res!99689 () Bool)

(assert (=> b!120413 (=> (not res!99689) (not e!78862))))

(declare-fun lt!187456 () (_ BitVec 64))

(declare-fun lt!187460 () (_ BitVec 64))

(assert (=> b!120413 (= res!99689 (= lt!187456 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!187460)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120413 (= lt!187456 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(assert (=> b!120413 (= lt!187460 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(declare-fun b!120414 () Bool)

(declare-fun lt!187455 () tuple2!10092)

(assert (=> b!120414 (= e!78864 (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187455)))))))

(declare-fun b!120415 () Bool)

(declare-fun e!78869 () Bool)

(declare-fun lt!187452 () (_ BitVec 64))

(declare-fun lt!187461 () (_ BitVec 64))

(assert (=> b!120415 (= e!78869 (or (= lt!187452 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187452 (bvand (bvsub lt!187461 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!120415 (= lt!187452 (bvand lt!187461 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!10094 0))(
  ( (tuple2!10095 (_1!5312 BitStream!4326) (_2!5312 BitStream!4326)) )
))
(declare-fun lt!187470 () tuple2!10094)

(declare-fun lt!187451 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4326 (_ BitVec 64)) BitStream!4326)

(assert (=> b!120415 (= (_1!5312 lt!187470) (withMovedBitIndex!0 (_2!5312 lt!187470) (bvsub lt!187461 lt!187451)))))

(assert (=> b!120415 (= lt!187461 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(declare-fun lt!187464 () tuple2!10094)

(declare-fun lt!187475 () (_ BitVec 64))

(assert (=> b!120415 (= (_1!5312 lt!187464) (withMovedBitIndex!0 (_2!5312 lt!187464) (bvsub lt!187475 lt!187451)))))

(assert (=> b!120415 (= lt!187451 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187455))) (currentByte!5536 (_2!5311 lt!187455)) (currentBit!5531 (_2!5311 lt!187455))))))

(assert (=> b!120415 (= lt!187475 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(declare-datatypes ((tuple2!10096 0))(
  ( (tuple2!10097 (_1!5313 BitStream!4326) (_2!5313 (_ BitVec 64))) )
))
(declare-fun lt!187454 () tuple2!10096)

(declare-fun lt!187466 () tuple2!10096)

(assert (=> b!120415 (and (= (_2!5313 lt!187454) (_2!5313 lt!187466)) (= (_1!5313 lt!187454) (_1!5313 lt!187466)))))

(declare-fun lt!187474 () Unit!7419)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!187473 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7419)

(assert (=> b!120415 (= lt!187474 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5312 lt!187464) nBits!396 i!615 lt!187473))))

(declare-fun lt!187465 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10096)

(assert (=> b!120415 (= lt!187466 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187465))))

(declare-fun b!120416 () Bool)

(declare-fun e!78868 () Bool)

(assert (=> b!120416 (= e!78868 (not e!78869))))

(declare-fun res!99688 () Bool)

(assert (=> b!120416 (=> res!99688 e!78869)))

(assert (=> b!120416 (= res!99688 (not (= (_1!5313 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!187470) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187465)) (_2!5312 lt!187470))))))

(declare-fun lt!187450 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120416 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462))) lt!187450)))

(declare-fun lt!187458 () Unit!7419)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4326 array!5359 (_ BitVec 64)) Unit!7419)

(assert (=> b!120416 (= lt!187458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5311 lt!187462) (buf!2857 (_2!5311 lt!187455)) lt!187450))))

(assert (=> b!120416 (= lt!187450 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!187472 () (_ BitVec 64))

(declare-datatypes ((tuple2!10098 0))(
  ( (tuple2!10099 (_1!5314 BitStream!4326) (_2!5314 Bool)) )
))
(declare-fun lt!187476 () tuple2!10098)

(assert (=> b!120416 (= lt!187465 (bvor lt!187473 (ite (_2!5314 lt!187476) lt!187472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120416 (= lt!187454 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!187464) nBits!396 i!615 lt!187473))))

(declare-fun lt!187468 () (_ BitVec 64))

(assert (=> b!120416 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305)) lt!187468)))

(declare-fun lt!187453 () Unit!7419)

(assert (=> b!120416 (= lt!187453 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2857 (_2!5311 lt!187455)) lt!187468))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120416 (= lt!187473 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!187459 () Bool)

(assert (=> b!120416 (= (_2!5314 lt!187476) lt!187459)))

(declare-fun readBitPure!0 (BitStream!4326) tuple2!10098)

(assert (=> b!120416 (= lt!187476 (readBitPure!0 (_1!5312 lt!187464)))))

(declare-fun reader!0 (BitStream!4326 BitStream!4326) tuple2!10094)

(assert (=> b!120416 (= lt!187470 (reader!0 (_2!5311 lt!187462) (_2!5311 lt!187455)))))

(assert (=> b!120416 (= lt!187464 (reader!0 thiss!1305 (_2!5311 lt!187455)))))

(declare-fun e!78870 () Bool)

(assert (=> b!120416 e!78870))

(declare-fun res!99691 () Bool)

(assert (=> b!120416 (=> (not res!99691) (not e!78870))))

(declare-fun lt!187457 () tuple2!10098)

(declare-fun lt!187471 () tuple2!10098)

(assert (=> b!120416 (= res!99691 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187457))) (currentByte!5536 (_1!5314 lt!187457)) (currentBit!5531 (_1!5314 lt!187457))) (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187471))) (currentByte!5536 (_1!5314 lt!187471)) (currentBit!5531 (_1!5314 lt!187471)))))))

(declare-fun lt!187467 () Unit!7419)

(declare-fun lt!187449 () BitStream!4326)

(declare-fun readBitPrefixLemma!0 (BitStream!4326 BitStream!4326) Unit!7419)

(assert (=> b!120416 (= lt!187467 (readBitPrefixLemma!0 lt!187449 (_2!5311 lt!187455)))))

(assert (=> b!120416 (= lt!187471 (readBitPure!0 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305))))))

(assert (=> b!120416 (= lt!187457 (readBitPure!0 lt!187449))))

(assert (=> b!120416 (= lt!187449 (BitStream!4327 (buf!2857 (_2!5311 lt!187462)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(assert (=> b!120416 e!78864))

(declare-fun res!99695 () Bool)

(assert (=> b!120416 (=> (not res!99695) (not e!78864))))

(declare-fun isPrefixOf!0 (BitStream!4326 BitStream!4326) Bool)

(assert (=> b!120416 (= res!99695 (isPrefixOf!0 thiss!1305 (_2!5311 lt!187455)))))

(declare-fun lt!187463 () Unit!7419)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4326 BitStream!4326 BitStream!4326) Unit!7419)

(assert (=> b!120416 (= lt!187463 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5311 lt!187462) (_2!5311 lt!187455)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10092)

(assert (=> b!120416 (= lt!187455 (appendNLeastSignificantBitsLoop!0 (_2!5311 lt!187462) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!120416 e!78865))

(declare-fun res!99693 () Bool)

(assert (=> b!120416 (=> (not res!99693) (not e!78865))))

(assert (=> b!120416 (= res!99693 (= (size!2426 (buf!2857 thiss!1305)) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(declare-fun appendBit!0 (BitStream!4326 Bool) tuple2!10092)

(assert (=> b!120416 (= lt!187462 (appendBit!0 thiss!1305 lt!187459))))

(assert (=> b!120416 (= lt!187459 (not (= (bvand v!199 lt!187472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120416 (= lt!187472 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!120418 () Bool)

(declare-fun e!78866 () Bool)

(declare-fun array_inv!2228 (array!5359) Bool)

(assert (=> b!120418 (= e!78866 (array_inv!2228 (buf!2857 thiss!1305)))))

(declare-fun b!120419 () Bool)

(declare-fun e!78861 () Bool)

(declare-fun lt!187469 () tuple2!10098)

(assert (=> b!120419 (= e!78861 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187469))) (currentByte!5536 (_1!5314 lt!187469)) (currentBit!5531 (_1!5314 lt!187469))) lt!187456))))

(declare-fun b!120420 () Bool)

(declare-fun res!99690 () Bool)

(assert (=> b!120420 (=> (not res!99690) (not e!78862))))

(assert (=> b!120420 (= res!99690 (isPrefixOf!0 thiss!1305 (_2!5311 lt!187462)))))

(declare-fun b!120421 () Bool)

(declare-fun res!99696 () Bool)

(assert (=> b!120421 (=> (not res!99696) (not e!78868))))

(assert (=> b!120421 (= res!99696 (bvslt i!615 nBits!396))))

(declare-fun b!120422 () Bool)

(declare-fun e!78863 () Bool)

(assert (=> b!120422 (= e!78863 e!78868)))

(declare-fun res!99697 () Bool)

(assert (=> b!120422 (=> (not res!99697) (not e!78868))))

(assert (=> b!120422 (= res!99697 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305)) lt!187468))))

(assert (=> b!120422 (= lt!187468 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120423 () Bool)

(assert (=> b!120423 (= e!78870 (= (_2!5314 lt!187457) (_2!5314 lt!187471)))))

(declare-fun b!120424 () Bool)

(assert (=> b!120424 (= e!78862 e!78861)))

(declare-fun res!99698 () Bool)

(assert (=> b!120424 (=> (not res!99698) (not e!78861))))

(assert (=> b!120424 (= res!99698 (and (= (_2!5314 lt!187469) lt!187459) (= (_1!5314 lt!187469) (_2!5311 lt!187462))))))

(declare-fun readerFrom!0 (BitStream!4326 (_ BitVec 32) (_ BitVec 32)) BitStream!4326)

(assert (=> b!120424 (= lt!187469 (readBitPure!0 (readerFrom!0 (_2!5311 lt!187462) (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305))))))

(declare-fun b!120417 () Bool)

(declare-fun res!99694 () Bool)

(assert (=> b!120417 (=> (not res!99694) (not e!78868))))

(assert (=> b!120417 (= res!99694 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!99699 () Bool)

(assert (=> start!23794 (=> (not res!99699) (not e!78863))))

(assert (=> start!23794 (= res!99699 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23794 e!78863))

(assert (=> start!23794 true))

(declare-fun inv!12 (BitStream!4326) Bool)

(assert (=> start!23794 (and (inv!12 thiss!1305) e!78866)))

(assert (= (and start!23794 res!99699) b!120422))

(assert (= (and b!120422 res!99697) b!120417))

(assert (= (and b!120417 res!99694) b!120421))

(assert (= (and b!120421 res!99696) b!120416))

(assert (= (and b!120416 res!99693) b!120413))

(assert (= (and b!120413 res!99689) b!120420))

(assert (= (and b!120420 res!99690) b!120424))

(assert (= (and b!120424 res!99698) b!120419))

(assert (= (and b!120416 res!99695) b!120412))

(assert (= (and b!120412 res!99692) b!120414))

(assert (= (and b!120416 res!99691) b!120423))

(assert (= (and b!120416 (not res!99688)) b!120415))

(assert (= start!23794 b!120418))

(declare-fun m!181927 () Bool)

(assert (=> b!120416 m!181927))

(declare-fun m!181929 () Bool)

(assert (=> b!120416 m!181929))

(declare-fun m!181931 () Bool)

(assert (=> b!120416 m!181931))

(declare-fun m!181933 () Bool)

(assert (=> b!120416 m!181933))

(declare-fun m!181935 () Bool)

(assert (=> b!120416 m!181935))

(declare-fun m!181937 () Bool)

(assert (=> b!120416 m!181937))

(declare-fun m!181939 () Bool)

(assert (=> b!120416 m!181939))

(declare-fun m!181941 () Bool)

(assert (=> b!120416 m!181941))

(declare-fun m!181943 () Bool)

(assert (=> b!120416 m!181943))

(declare-fun m!181945 () Bool)

(assert (=> b!120416 m!181945))

(declare-fun m!181947 () Bool)

(assert (=> b!120416 m!181947))

(declare-fun m!181949 () Bool)

(assert (=> b!120416 m!181949))

(declare-fun m!181951 () Bool)

(assert (=> b!120416 m!181951))

(declare-fun m!181953 () Bool)

(assert (=> b!120416 m!181953))

(declare-fun m!181955 () Bool)

(assert (=> b!120416 m!181955))

(declare-fun m!181957 () Bool)

(assert (=> b!120416 m!181957))

(declare-fun m!181959 () Bool)

(assert (=> b!120416 m!181959))

(declare-fun m!181961 () Bool)

(assert (=> b!120416 m!181961))

(declare-fun m!181963 () Bool)

(assert (=> b!120416 m!181963))

(declare-fun m!181965 () Bool)

(assert (=> b!120412 m!181965))

(declare-fun m!181967 () Bool)

(assert (=> b!120415 m!181967))

(declare-fun m!181969 () Bool)

(assert (=> b!120415 m!181969))

(declare-fun m!181971 () Bool)

(assert (=> b!120415 m!181971))

(declare-fun m!181973 () Bool)

(assert (=> b!120415 m!181973))

(declare-fun m!181975 () Bool)

(assert (=> b!120415 m!181975))

(declare-fun m!181977 () Bool)

(assert (=> b!120415 m!181977))

(assert (=> b!120415 m!181975))

(declare-fun m!181979 () Bool)

(assert (=> b!120415 m!181979))

(declare-fun m!181981 () Bool)

(assert (=> b!120415 m!181981))

(declare-fun m!181983 () Bool)

(assert (=> b!120418 m!181983))

(declare-fun m!181985 () Bool)

(assert (=> b!120420 m!181985))

(assert (=> b!120413 m!181971))

(assert (=> b!120413 m!181973))

(declare-fun m!181987 () Bool)

(assert (=> start!23794 m!181987))

(declare-fun m!181989 () Bool)

(assert (=> b!120424 m!181989))

(assert (=> b!120424 m!181989))

(declare-fun m!181991 () Bool)

(assert (=> b!120424 m!181991))

(declare-fun m!181993 () Bool)

(assert (=> b!120414 m!181993))

(declare-fun m!181995 () Bool)

(assert (=> b!120417 m!181995))

(declare-fun m!181997 () Bool)

(assert (=> b!120422 m!181997))

(declare-fun m!181999 () Bool)

(assert (=> b!120419 m!181999))

(check-sat (not b!120422) (not start!23794) (not b!120415) (not b!120416) (not b!120424) (not b!120414) (not b!120412) (not b!120419) (not b!120420) (not b!120418) (not b!120413) (not b!120417))
(check-sat)
(get-model)

(declare-fun d!38774 () Bool)

(assert (=> d!38774 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!120417 d!38774))

(declare-fun b!120474 () Bool)

(declare-fun e!78906 () Unit!7419)

(declare-fun Unit!7423 () Unit!7419)

(assert (=> b!120474 (= e!78906 Unit!7423)))

(declare-fun b!120475 () Bool)

(declare-fun res!99742 () Bool)

(declare-fun e!78905 () Bool)

(assert (=> b!120475 (=> (not res!99742) (not e!78905))))

(declare-fun lt!187605 () tuple2!10094)

(assert (=> b!120475 (= res!99742 (isPrefixOf!0 (_2!5312 lt!187605) (_2!5311 lt!187455)))))

(declare-fun d!38776 () Bool)

(assert (=> d!38776 e!78905))

(declare-fun res!99743 () Bool)

(assert (=> d!38776 (=> (not res!99743) (not e!78905))))

(assert (=> d!38776 (= res!99743 (isPrefixOf!0 (_1!5312 lt!187605) (_2!5312 lt!187605)))))

(declare-fun lt!187610 () BitStream!4326)

(assert (=> d!38776 (= lt!187605 (tuple2!10095 lt!187610 (_2!5311 lt!187455)))))

(declare-fun lt!187614 () Unit!7419)

(declare-fun lt!187619 () Unit!7419)

(assert (=> d!38776 (= lt!187614 lt!187619)))

(assert (=> d!38776 (isPrefixOf!0 lt!187610 (_2!5311 lt!187455))))

(assert (=> d!38776 (= lt!187619 (lemmaIsPrefixTransitive!0 lt!187610 (_2!5311 lt!187455) (_2!5311 lt!187455)))))

(declare-fun lt!187620 () Unit!7419)

(declare-fun lt!187618 () Unit!7419)

(assert (=> d!38776 (= lt!187620 lt!187618)))

(assert (=> d!38776 (isPrefixOf!0 lt!187610 (_2!5311 lt!187455))))

(assert (=> d!38776 (= lt!187618 (lemmaIsPrefixTransitive!0 lt!187610 (_2!5311 lt!187462) (_2!5311 lt!187455)))))

(declare-fun lt!187607 () Unit!7419)

(assert (=> d!38776 (= lt!187607 e!78906)))

(declare-fun c!7243 () Bool)

(assert (=> d!38776 (= c!7243 (not (= (size!2426 (buf!2857 (_2!5311 lt!187462))) #b00000000000000000000000000000000)))))

(declare-fun lt!187616 () Unit!7419)

(declare-fun lt!187613 () Unit!7419)

(assert (=> d!38776 (= lt!187616 lt!187613)))

(assert (=> d!38776 (isPrefixOf!0 (_2!5311 lt!187455) (_2!5311 lt!187455))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4326) Unit!7419)

(assert (=> d!38776 (= lt!187613 (lemmaIsPrefixRefl!0 (_2!5311 lt!187455)))))

(declare-fun lt!187611 () Unit!7419)

(declare-fun lt!187603 () Unit!7419)

(assert (=> d!38776 (= lt!187611 lt!187603)))

(assert (=> d!38776 (= lt!187603 (lemmaIsPrefixRefl!0 (_2!5311 lt!187455)))))

(declare-fun lt!187615 () Unit!7419)

(declare-fun lt!187617 () Unit!7419)

(assert (=> d!38776 (= lt!187615 lt!187617)))

(assert (=> d!38776 (isPrefixOf!0 lt!187610 lt!187610)))

(assert (=> d!38776 (= lt!187617 (lemmaIsPrefixRefl!0 lt!187610))))

(declare-fun lt!187612 () Unit!7419)

(declare-fun lt!187602 () Unit!7419)

(assert (=> d!38776 (= lt!187612 lt!187602)))

(assert (=> d!38776 (isPrefixOf!0 (_2!5311 lt!187462) (_2!5311 lt!187462))))

(assert (=> d!38776 (= lt!187602 (lemmaIsPrefixRefl!0 (_2!5311 lt!187462)))))

(assert (=> d!38776 (= lt!187610 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(assert (=> d!38776 (isPrefixOf!0 (_2!5311 lt!187462) (_2!5311 lt!187455))))

(assert (=> d!38776 (= (reader!0 (_2!5311 lt!187462) (_2!5311 lt!187455)) lt!187605)))

(declare-fun b!120476 () Bool)

(declare-fun lt!187608 () Unit!7419)

(assert (=> b!120476 (= e!78906 lt!187608)))

(declare-fun lt!187604 () (_ BitVec 64))

(assert (=> b!120476 (= lt!187604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!187609 () (_ BitVec 64))

(assert (=> b!120476 (= lt!187609 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5359 array!5359 (_ BitVec 64) (_ BitVec 64)) Unit!7419)

(assert (=> b!120476 (= lt!187608 (arrayBitRangesEqSymmetric!0 (buf!2857 (_2!5311 lt!187462)) (buf!2857 (_2!5311 lt!187455)) lt!187604 lt!187609))))

(declare-fun arrayBitRangesEq!0 (array!5359 array!5359 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120476 (arrayBitRangesEq!0 (buf!2857 (_2!5311 lt!187455)) (buf!2857 (_2!5311 lt!187462)) lt!187604 lt!187609)))

(declare-fun b!120477 () Bool)

(declare-fun lt!187601 () (_ BitVec 64))

(declare-fun lt!187606 () (_ BitVec 64))

(assert (=> b!120477 (= e!78905 (= (_1!5312 lt!187605) (withMovedBitIndex!0 (_2!5312 lt!187605) (bvsub lt!187601 lt!187606))))))

(assert (=> b!120477 (or (= (bvand lt!187601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187606 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187601 lt!187606) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120477 (= lt!187606 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187455))) (currentByte!5536 (_2!5311 lt!187455)) (currentBit!5531 (_2!5311 lt!187455))))))

(assert (=> b!120477 (= lt!187601 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(declare-fun b!120478 () Bool)

(declare-fun res!99744 () Bool)

(assert (=> b!120478 (=> (not res!99744) (not e!78905))))

(assert (=> b!120478 (= res!99744 (isPrefixOf!0 (_1!5312 lt!187605) (_2!5311 lt!187462)))))

(assert (= (and d!38776 c!7243) b!120476))

(assert (= (and d!38776 (not c!7243)) b!120474))

(assert (= (and d!38776 res!99743) b!120478))

(assert (= (and b!120478 res!99744) b!120475))

(assert (= (and b!120475 res!99742) b!120477))

(declare-fun m!182075 () Bool)

(assert (=> d!38776 m!182075))

(declare-fun m!182077 () Bool)

(assert (=> d!38776 m!182077))

(declare-fun m!182079 () Bool)

(assert (=> d!38776 m!182079))

(declare-fun m!182081 () Bool)

(assert (=> d!38776 m!182081))

(declare-fun m!182083 () Bool)

(assert (=> d!38776 m!182083))

(declare-fun m!182085 () Bool)

(assert (=> d!38776 m!182085))

(declare-fun m!182087 () Bool)

(assert (=> d!38776 m!182087))

(declare-fun m!182089 () Bool)

(assert (=> d!38776 m!182089))

(declare-fun m!182091 () Bool)

(assert (=> d!38776 m!182091))

(declare-fun m!182093 () Bool)

(assert (=> d!38776 m!182093))

(declare-fun m!182095 () Bool)

(assert (=> d!38776 m!182095))

(declare-fun m!182097 () Bool)

(assert (=> b!120475 m!182097))

(assert (=> b!120476 m!181971))

(declare-fun m!182099 () Bool)

(assert (=> b!120476 m!182099))

(declare-fun m!182101 () Bool)

(assert (=> b!120476 m!182101))

(declare-fun m!182103 () Bool)

(assert (=> b!120478 m!182103))

(declare-fun m!182105 () Bool)

(assert (=> b!120477 m!182105))

(assert (=> b!120477 m!181979))

(assert (=> b!120477 m!181971))

(assert (=> b!120416 d!38776))

(declare-fun d!38778 () Bool)

(declare-fun e!78909 () Bool)

(assert (=> d!38778 e!78909))

(declare-fun res!99749 () Bool)

(assert (=> d!38778 (=> (not res!99749) (not e!78909))))

(declare-fun lt!187634 () (_ BitVec 64))

(declare-fun lt!187635 () (_ BitVec 64))

(declare-fun lt!187638 () (_ BitVec 64))

(assert (=> d!38778 (= res!99749 (= lt!187638 (bvsub lt!187634 lt!187635)))))

(assert (=> d!38778 (or (= (bvand lt!187634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187634 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187634 lt!187635) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38778 (= lt!187635 (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187457)))) ((_ sign_extend 32) (currentByte!5536 (_1!5314 lt!187457))) ((_ sign_extend 32) (currentBit!5531 (_1!5314 lt!187457)))))))

(declare-fun lt!187636 () (_ BitVec 64))

(declare-fun lt!187637 () (_ BitVec 64))

(assert (=> d!38778 (= lt!187634 (bvmul lt!187636 lt!187637))))

(assert (=> d!38778 (or (= lt!187636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187637 (bvsdiv (bvmul lt!187636 lt!187637) lt!187636)))))

(assert (=> d!38778 (= lt!187637 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38778 (= lt!187636 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187457)))))))

(assert (=> d!38778 (= lt!187638 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5536 (_1!5314 lt!187457))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5531 (_1!5314 lt!187457)))))))

(assert (=> d!38778 (invariant!0 (currentBit!5531 (_1!5314 lt!187457)) (currentByte!5536 (_1!5314 lt!187457)) (size!2426 (buf!2857 (_1!5314 lt!187457))))))

(assert (=> d!38778 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187457))) (currentByte!5536 (_1!5314 lt!187457)) (currentBit!5531 (_1!5314 lt!187457))) lt!187638)))

(declare-fun b!120483 () Bool)

(declare-fun res!99750 () Bool)

(assert (=> b!120483 (=> (not res!99750) (not e!78909))))

(assert (=> b!120483 (= res!99750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187638))))

(declare-fun b!120484 () Bool)

(declare-fun lt!187633 () (_ BitVec 64))

(assert (=> b!120484 (= e!78909 (bvsle lt!187638 (bvmul lt!187633 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120484 (or (= lt!187633 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187633 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187633)))))

(assert (=> b!120484 (= lt!187633 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187457)))))))

(assert (= (and d!38778 res!99749) b!120483))

(assert (= (and b!120483 res!99750) b!120484))

(declare-fun m!182107 () Bool)

(assert (=> d!38778 m!182107))

(declare-fun m!182109 () Bool)

(assert (=> d!38778 m!182109))

(assert (=> b!120416 d!38778))

(declare-fun d!38780 () Bool)

(assert (=> d!38780 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462))) lt!187450)))

(declare-fun lt!187641 () Unit!7419)

(declare-fun choose!9 (BitStream!4326 array!5359 (_ BitVec 64) BitStream!4326) Unit!7419)

(assert (=> d!38780 (= lt!187641 (choose!9 (_2!5311 lt!187462) (buf!2857 (_2!5311 lt!187455)) lt!187450 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462)))))))

(assert (=> d!38780 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5311 lt!187462) (buf!2857 (_2!5311 lt!187455)) lt!187450) lt!187641)))

(declare-fun bs!9380 () Bool)

(assert (= bs!9380 d!38780))

(assert (=> bs!9380 m!181935))

(declare-fun m!182111 () Bool)

(assert (=> bs!9380 m!182111))

(assert (=> b!120416 d!38780))

(declare-fun b!120495 () Bool)

(declare-fun res!99759 () Bool)

(declare-fun e!78914 () Bool)

(assert (=> b!120495 (=> (not res!99759) (not e!78914))))

(declare-fun lt!187651 () tuple2!10092)

(assert (=> b!120495 (= res!99759 (isPrefixOf!0 thiss!1305 (_2!5311 lt!187651)))))

(declare-fun b!120496 () Bool)

(declare-fun e!78915 () Bool)

(assert (=> b!120496 (= e!78914 e!78915)))

(declare-fun res!99760 () Bool)

(assert (=> b!120496 (=> (not res!99760) (not e!78915))))

(declare-fun lt!187650 () tuple2!10098)

(assert (=> b!120496 (= res!99760 (and (= (_2!5314 lt!187650) lt!187459) (= (_1!5314 lt!187650) (_2!5311 lt!187651))))))

(assert (=> b!120496 (= lt!187650 (readBitPure!0 (readerFrom!0 (_2!5311 lt!187651) (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305))))))

(declare-fun b!120497 () Bool)

(assert (=> b!120497 (= e!78915 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187650))) (currentByte!5536 (_1!5314 lt!187650)) (currentBit!5531 (_1!5314 lt!187650))) (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187651))) (currentByte!5536 (_2!5311 lt!187651)) (currentBit!5531 (_2!5311 lt!187651)))))))

(declare-fun b!120494 () Bool)

(declare-fun res!99761 () Bool)

(assert (=> b!120494 (=> (not res!99761) (not e!78914))))

(declare-fun lt!187653 () (_ BitVec 64))

(declare-fun lt!187652 () (_ BitVec 64))

(assert (=> b!120494 (= res!99761 (= (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187651))) (currentByte!5536 (_2!5311 lt!187651)) (currentBit!5531 (_2!5311 lt!187651))) (bvadd lt!187653 lt!187652)))))

(assert (=> b!120494 (or (not (= (bvand lt!187653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187652 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187653 lt!187652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120494 (= lt!187652 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!120494 (= lt!187653 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(declare-fun d!38782 () Bool)

(assert (=> d!38782 e!78914))

(declare-fun res!99762 () Bool)

(assert (=> d!38782 (=> (not res!99762) (not e!78914))))

(assert (=> d!38782 (= res!99762 (= (size!2426 (buf!2857 thiss!1305)) (size!2426 (buf!2857 (_2!5311 lt!187651)))))))

(declare-fun choose!16 (BitStream!4326 Bool) tuple2!10092)

(assert (=> d!38782 (= lt!187651 (choose!16 thiss!1305 lt!187459))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38782 (validate_offset_bit!0 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305)))))

(assert (=> d!38782 (= (appendBit!0 thiss!1305 lt!187459) lt!187651)))

(assert (= (and d!38782 res!99762) b!120494))

(assert (= (and b!120494 res!99761) b!120495))

(assert (= (and b!120495 res!99759) b!120496))

(assert (= (and b!120496 res!99760) b!120497))

(declare-fun m!182113 () Bool)

(assert (=> b!120495 m!182113))

(declare-fun m!182115 () Bool)

(assert (=> b!120497 m!182115))

(declare-fun m!182117 () Bool)

(assert (=> b!120497 m!182117))

(declare-fun m!182119 () Bool)

(assert (=> b!120496 m!182119))

(assert (=> b!120496 m!182119))

(declare-fun m!182121 () Bool)

(assert (=> b!120496 m!182121))

(declare-fun m!182123 () Bool)

(assert (=> d!38782 m!182123))

(declare-fun m!182125 () Bool)

(assert (=> d!38782 m!182125))

(assert (=> b!120494 m!182117))

(assert (=> b!120494 m!181973))

(assert (=> b!120416 d!38782))

(declare-fun d!38784 () Bool)

(declare-datatypes ((tuple2!10108 0))(
  ( (tuple2!10109 (_1!5319 Bool) (_2!5319 BitStream!4326)) )
))
(declare-fun lt!187656 () tuple2!10108)

(declare-fun readBit!0 (BitStream!4326) tuple2!10108)

(assert (=> d!38784 (= lt!187656 (readBit!0 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305))))))

(assert (=> d!38784 (= (readBitPure!0 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305))) (tuple2!10099 (_2!5319 lt!187656) (_1!5319 lt!187656)))))

(declare-fun bs!9381 () Bool)

(assert (= bs!9381 d!38784))

(declare-fun m!182127 () Bool)

(assert (=> bs!9381 m!182127))

(assert (=> b!120416 d!38784))

(declare-fun b!120498 () Bool)

(declare-fun e!78917 () Unit!7419)

(declare-fun Unit!7424 () Unit!7419)

(assert (=> b!120498 (= e!78917 Unit!7424)))

(declare-fun b!120499 () Bool)

(declare-fun res!99763 () Bool)

(declare-fun e!78916 () Bool)

(assert (=> b!120499 (=> (not res!99763) (not e!78916))))

(declare-fun lt!187661 () tuple2!10094)

(assert (=> b!120499 (= res!99763 (isPrefixOf!0 (_2!5312 lt!187661) (_2!5311 lt!187455)))))

(declare-fun d!38786 () Bool)

(assert (=> d!38786 e!78916))

(declare-fun res!99764 () Bool)

(assert (=> d!38786 (=> (not res!99764) (not e!78916))))

(assert (=> d!38786 (= res!99764 (isPrefixOf!0 (_1!5312 lt!187661) (_2!5312 lt!187661)))))

(declare-fun lt!187666 () BitStream!4326)

(assert (=> d!38786 (= lt!187661 (tuple2!10095 lt!187666 (_2!5311 lt!187455)))))

(declare-fun lt!187670 () Unit!7419)

(declare-fun lt!187675 () Unit!7419)

(assert (=> d!38786 (= lt!187670 lt!187675)))

(assert (=> d!38786 (isPrefixOf!0 lt!187666 (_2!5311 lt!187455))))

(assert (=> d!38786 (= lt!187675 (lemmaIsPrefixTransitive!0 lt!187666 (_2!5311 lt!187455) (_2!5311 lt!187455)))))

(declare-fun lt!187676 () Unit!7419)

(declare-fun lt!187674 () Unit!7419)

(assert (=> d!38786 (= lt!187676 lt!187674)))

(assert (=> d!38786 (isPrefixOf!0 lt!187666 (_2!5311 lt!187455))))

(assert (=> d!38786 (= lt!187674 (lemmaIsPrefixTransitive!0 lt!187666 thiss!1305 (_2!5311 lt!187455)))))

(declare-fun lt!187663 () Unit!7419)

(assert (=> d!38786 (= lt!187663 e!78917)))

(declare-fun c!7244 () Bool)

(assert (=> d!38786 (= c!7244 (not (= (size!2426 (buf!2857 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!187672 () Unit!7419)

(declare-fun lt!187669 () Unit!7419)

(assert (=> d!38786 (= lt!187672 lt!187669)))

(assert (=> d!38786 (isPrefixOf!0 (_2!5311 lt!187455) (_2!5311 lt!187455))))

(assert (=> d!38786 (= lt!187669 (lemmaIsPrefixRefl!0 (_2!5311 lt!187455)))))

(declare-fun lt!187667 () Unit!7419)

(declare-fun lt!187659 () Unit!7419)

(assert (=> d!38786 (= lt!187667 lt!187659)))

(assert (=> d!38786 (= lt!187659 (lemmaIsPrefixRefl!0 (_2!5311 lt!187455)))))

(declare-fun lt!187671 () Unit!7419)

(declare-fun lt!187673 () Unit!7419)

(assert (=> d!38786 (= lt!187671 lt!187673)))

(assert (=> d!38786 (isPrefixOf!0 lt!187666 lt!187666)))

(assert (=> d!38786 (= lt!187673 (lemmaIsPrefixRefl!0 lt!187666))))

(declare-fun lt!187668 () Unit!7419)

(declare-fun lt!187658 () Unit!7419)

(assert (=> d!38786 (= lt!187668 lt!187658)))

(assert (=> d!38786 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38786 (= lt!187658 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38786 (= lt!187666 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(assert (=> d!38786 (isPrefixOf!0 thiss!1305 (_2!5311 lt!187455))))

(assert (=> d!38786 (= (reader!0 thiss!1305 (_2!5311 lt!187455)) lt!187661)))

(declare-fun b!120500 () Bool)

(declare-fun lt!187664 () Unit!7419)

(assert (=> b!120500 (= e!78917 lt!187664)))

(declare-fun lt!187660 () (_ BitVec 64))

(assert (=> b!120500 (= lt!187660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!187665 () (_ BitVec 64))

(assert (=> b!120500 (= lt!187665 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(assert (=> b!120500 (= lt!187664 (arrayBitRangesEqSymmetric!0 (buf!2857 thiss!1305) (buf!2857 (_2!5311 lt!187455)) lt!187660 lt!187665))))

(assert (=> b!120500 (arrayBitRangesEq!0 (buf!2857 (_2!5311 lt!187455)) (buf!2857 thiss!1305) lt!187660 lt!187665)))

(declare-fun lt!187662 () (_ BitVec 64))

(declare-fun b!120501 () Bool)

(declare-fun lt!187657 () (_ BitVec 64))

(assert (=> b!120501 (= e!78916 (= (_1!5312 lt!187661) (withMovedBitIndex!0 (_2!5312 lt!187661) (bvsub lt!187657 lt!187662))))))

(assert (=> b!120501 (or (= (bvand lt!187657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187657 lt!187662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120501 (= lt!187662 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187455))) (currentByte!5536 (_2!5311 lt!187455)) (currentBit!5531 (_2!5311 lt!187455))))))

(assert (=> b!120501 (= lt!187657 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(declare-fun b!120502 () Bool)

(declare-fun res!99765 () Bool)

(assert (=> b!120502 (=> (not res!99765) (not e!78916))))

(assert (=> b!120502 (= res!99765 (isPrefixOf!0 (_1!5312 lt!187661) thiss!1305))))

(assert (= (and d!38786 c!7244) b!120500))

(assert (= (and d!38786 (not c!7244)) b!120498))

(assert (= (and d!38786 res!99764) b!120502))

(assert (= (and b!120502 res!99765) b!120499))

(assert (= (and b!120499 res!99763) b!120501))

(declare-fun m!182129 () Bool)

(assert (=> d!38786 m!182129))

(declare-fun m!182131 () Bool)

(assert (=> d!38786 m!182131))

(assert (=> d!38786 m!182079))

(declare-fun m!182133 () Bool)

(assert (=> d!38786 m!182133))

(declare-fun m!182135 () Bool)

(assert (=> d!38786 m!182135))

(assert (=> d!38786 m!182085))

(declare-fun m!182137 () Bool)

(assert (=> d!38786 m!182137))

(declare-fun m!182139 () Bool)

(assert (=> d!38786 m!182139))

(assert (=> d!38786 m!181941))

(declare-fun m!182141 () Bool)

(assert (=> d!38786 m!182141))

(declare-fun m!182143 () Bool)

(assert (=> d!38786 m!182143))

(declare-fun m!182145 () Bool)

(assert (=> b!120499 m!182145))

(assert (=> b!120500 m!181973))

(declare-fun m!182147 () Bool)

(assert (=> b!120500 m!182147))

(declare-fun m!182149 () Bool)

(assert (=> b!120500 m!182149))

(declare-fun m!182151 () Bool)

(assert (=> b!120502 m!182151))

(declare-fun m!182153 () Bool)

(assert (=> b!120501 m!182153))

(assert (=> b!120501 m!181979))

(assert (=> b!120501 m!181973))

(assert (=> b!120416 d!38786))

(declare-datatypes ((tuple2!10110 0))(
  ( (tuple2!10111 (_1!5320 (_ BitVec 64)) (_2!5320 BitStream!4326)) )
))
(declare-fun lt!187679 () tuple2!10110)

(declare-fun d!38788 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10110)

(assert (=> d!38788 (= lt!187679 (readNLeastSignificantBitsLoop!0 (_1!5312 lt!187464) nBits!396 i!615 lt!187473))))

(assert (=> d!38788 (= (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!187464) nBits!396 i!615 lt!187473) (tuple2!10097 (_2!5320 lt!187679) (_1!5320 lt!187679)))))

(declare-fun bs!9382 () Bool)

(assert (= bs!9382 d!38788))

(declare-fun m!182155 () Bool)

(assert (=> bs!9382 m!182155))

(assert (=> b!120416 d!38788))

(declare-fun d!38790 () Bool)

(assert (=> d!38790 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!120416 d!38790))

(declare-fun b!120617 () Bool)

(declare-fun e!78986 () Bool)

(declare-fun lt!188056 () tuple2!10098)

(declare-fun lt!188037 () tuple2!10092)

(assert (=> b!120617 (= e!78986 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!188056))) (currentByte!5536 (_1!5314 lt!188056)) (currentBit!5531 (_1!5314 lt!188056))) (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188037))) (currentByte!5536 (_2!5311 lt!188037)) (currentBit!5531 (_2!5311 lt!188037)))))))

(declare-fun b!120618 () Bool)

(declare-fun e!78982 () Bool)

(declare-fun lt!188043 () (_ BitVec 64))

(assert (=> b!120618 (= e!78982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187462)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462))) lt!188043))))

(declare-fun b!120619 () Bool)

(declare-fun e!78983 () tuple2!10092)

(declare-fun lt!188023 () Unit!7419)

(assert (=> b!120619 (= e!78983 (tuple2!10093 lt!188023 (_2!5311 lt!187462)))))

(declare-fun lt!188033 () BitStream!4326)

(assert (=> b!120619 (= lt!188033 (_2!5311 lt!187462))))

(assert (=> b!120619 (= lt!188023 (lemmaIsPrefixRefl!0 lt!188033))))

(declare-fun call!1574 () Bool)

(assert (=> b!120619 call!1574))

(declare-fun d!38792 () Bool)

(declare-fun e!78985 () Bool)

(assert (=> d!38792 e!78985))

(declare-fun res!99869 () Bool)

(assert (=> d!38792 (=> (not res!99869) (not e!78985))))

(declare-fun lt!188024 () tuple2!10092)

(assert (=> d!38792 (= res!99869 (= (size!2426 (buf!2857 (_2!5311 lt!187462))) (size!2426 (buf!2857 (_2!5311 lt!188024)))))))

(assert (=> d!38792 (= lt!188024 e!78983)))

(declare-fun c!7255 () Bool)

(assert (=> d!38792 (= c!7255 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38792 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38792 (= (appendNLeastSignificantBitsLoop!0 (_2!5311 lt!187462) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!188024)))

(declare-fun b!120620 () Bool)

(declare-fun res!99866 () Bool)

(assert (=> b!120620 (=> (not res!99866) (not e!78985))))

(assert (=> b!120620 (= res!99866 (isPrefixOf!0 (_2!5311 lt!187462) (_2!5311 lt!188024)))))

(declare-fun b!120621 () Bool)

(declare-fun res!99863 () Bool)

(assert (=> b!120621 (= res!99863 (= (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188037))) (currentByte!5536 (_2!5311 lt!188037)) (currentBit!5531 (_2!5311 lt!188037))) (bvadd (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!78984 () Bool)

(assert (=> b!120621 (=> (not res!99863) (not e!78984))))

(declare-fun b!120622 () Bool)

(declare-fun lt!188036 () tuple2!10092)

(declare-fun Unit!7425 () Unit!7419)

(assert (=> b!120622 (= e!78983 (tuple2!10093 Unit!7425 (_2!5311 lt!188036)))))

(declare-fun lt!188045 () Bool)

(assert (=> b!120622 (= lt!188045 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120622 (= lt!188037 (appendBit!0 (_2!5311 lt!187462) lt!188045))))

(declare-fun res!99867 () Bool)

(assert (=> b!120622 (= res!99867 (= (size!2426 (buf!2857 (_2!5311 lt!187462))) (size!2426 (buf!2857 (_2!5311 lt!188037)))))))

(assert (=> b!120622 (=> (not res!99867) (not e!78984))))

(assert (=> b!120622 e!78984))

(declare-fun lt!188048 () tuple2!10092)

(assert (=> b!120622 (= lt!188048 lt!188037)))

(assert (=> b!120622 (= lt!188036 (appendNLeastSignificantBitsLoop!0 (_2!5311 lt!188048) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!188065 () Unit!7419)

(assert (=> b!120622 (= lt!188065 (lemmaIsPrefixTransitive!0 (_2!5311 lt!187462) (_2!5311 lt!188048) (_2!5311 lt!188036)))))

(assert (=> b!120622 (isPrefixOf!0 (_2!5311 lt!187462) (_2!5311 lt!188036))))

(declare-fun lt!188053 () Unit!7419)

(assert (=> b!120622 (= lt!188053 lt!188065)))

(assert (=> b!120622 (invariant!0 (currentBit!5531 (_2!5311 lt!187462)) (currentByte!5536 (_2!5311 lt!187462)) (size!2426 (buf!2857 (_2!5311 lt!188048))))))

(declare-fun lt!188063 () BitStream!4326)

(assert (=> b!120622 (= lt!188063 (BitStream!4327 (buf!2857 (_2!5311 lt!188048)) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(assert (=> b!120622 (invariant!0 (currentBit!5531 lt!188063) (currentByte!5536 lt!188063) (size!2426 (buf!2857 (_2!5311 lt!188036))))))

(declare-fun lt!188025 () BitStream!4326)

(assert (=> b!120622 (= lt!188025 (BitStream!4327 (buf!2857 (_2!5311 lt!188036)) (currentByte!5536 lt!188063) (currentBit!5531 lt!188063)))))

(declare-fun lt!188050 () tuple2!10098)

(assert (=> b!120622 (= lt!188050 (readBitPure!0 lt!188063))))

(declare-fun lt!188064 () tuple2!10098)

(assert (=> b!120622 (= lt!188064 (readBitPure!0 lt!188025))))

(declare-fun lt!188034 () Unit!7419)

(assert (=> b!120622 (= lt!188034 (readBitPrefixLemma!0 lt!188063 (_2!5311 lt!188036)))))

(declare-fun res!99868 () Bool)

(assert (=> b!120622 (= res!99868 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!188050))) (currentByte!5536 (_1!5314 lt!188050)) (currentBit!5531 (_1!5314 lt!188050))) (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!188064))) (currentByte!5536 (_1!5314 lt!188064)) (currentBit!5531 (_1!5314 lt!188064)))))))

(declare-fun e!78988 () Bool)

(assert (=> b!120622 (=> (not res!99868) (not e!78988))))

(assert (=> b!120622 e!78988))

(declare-fun lt!188057 () Unit!7419)

(assert (=> b!120622 (= lt!188057 lt!188034)))

(declare-fun lt!188039 () tuple2!10094)

(assert (=> b!120622 (= lt!188039 (reader!0 (_2!5311 lt!187462) (_2!5311 lt!188036)))))

(declare-fun lt!188061 () tuple2!10094)

(assert (=> b!120622 (= lt!188061 (reader!0 (_2!5311 lt!188048) (_2!5311 lt!188036)))))

(declare-fun lt!188041 () tuple2!10098)

(assert (=> b!120622 (= lt!188041 (readBitPure!0 (_1!5312 lt!188039)))))

(assert (=> b!120622 (= (_2!5314 lt!188041) lt!188045)))

(declare-fun lt!188026 () Unit!7419)

(declare-fun Unit!7426 () Unit!7419)

(assert (=> b!120622 (= lt!188026 Unit!7426)))

(declare-fun lt!188032 () (_ BitVec 64))

(assert (=> b!120622 (= lt!188032 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!188040 () (_ BitVec 64))

(assert (=> b!120622 (= lt!188040 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!188031 () Unit!7419)

(assert (=> b!120622 (= lt!188031 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5311 lt!187462) (buf!2857 (_2!5311 lt!188036)) lt!188040))))

(assert (=> b!120622 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!188036)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462))) lt!188040)))

(declare-fun lt!188028 () Unit!7419)

(assert (=> b!120622 (= lt!188028 lt!188031)))

(declare-fun lt!188046 () tuple2!10096)

(assert (=> b!120622 (= lt!188046 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!188039) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188032))))

(declare-fun lt!188027 () (_ BitVec 64))

(assert (=> b!120622 (= lt!188027 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!188055 () Unit!7419)

(assert (=> b!120622 (= lt!188055 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5311 lt!188048) (buf!2857 (_2!5311 lt!188036)) lt!188027))))

(assert (=> b!120622 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!188036)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!188048))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!188048))) lt!188027)))

(declare-fun lt!188060 () Unit!7419)

(assert (=> b!120622 (= lt!188060 lt!188055)))

(declare-fun lt!188030 () tuple2!10096)

(assert (=> b!120622 (= lt!188030 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!188061) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!188032 (ite (_2!5314 lt!188041) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!188059 () tuple2!10096)

(assert (=> b!120622 (= lt!188059 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!188039) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188032))))

(declare-fun c!7256 () Bool)

(assert (=> b!120622 (= c!7256 (_2!5314 (readBitPure!0 (_1!5312 lt!188039))))))

(declare-fun e!78987 () (_ BitVec 64))

(declare-fun lt!188044 () tuple2!10096)

(assert (=> b!120622 (= lt!188044 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5312 lt!188039) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!188032 e!78987)))))

(declare-fun lt!188054 () Unit!7419)

(assert (=> b!120622 (= lt!188054 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5312 lt!188039) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188032))))

(assert (=> b!120622 (and (= (_2!5313 lt!188059) (_2!5313 lt!188044)) (= (_1!5313 lt!188059) (_1!5313 lt!188044)))))

(declare-fun lt!188022 () Unit!7419)

(assert (=> b!120622 (= lt!188022 lt!188054)))

(assert (=> b!120622 (= (_1!5312 lt!188039) (withMovedBitIndex!0 (_2!5312 lt!188039) (bvsub (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))) (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188036))) (currentByte!5536 (_2!5311 lt!188036)) (currentBit!5531 (_2!5311 lt!188036))))))))

(declare-fun lt!188062 () Unit!7419)

(declare-fun Unit!7427 () Unit!7419)

(assert (=> b!120622 (= lt!188062 Unit!7427)))

(assert (=> b!120622 (= (_1!5312 lt!188061) (withMovedBitIndex!0 (_2!5312 lt!188061) (bvsub (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188048))) (currentByte!5536 (_2!5311 lt!188048)) (currentBit!5531 (_2!5311 lt!188048))) (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188036))) (currentByte!5536 (_2!5311 lt!188036)) (currentBit!5531 (_2!5311 lt!188036))))))))

(declare-fun lt!188047 () Unit!7419)

(declare-fun Unit!7428 () Unit!7419)

(assert (=> b!120622 (= lt!188047 Unit!7428)))

(assert (=> b!120622 (= (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))) (bvsub (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188048))) (currentByte!5536 (_2!5311 lt!188048)) (currentBit!5531 (_2!5311 lt!188048))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!188035 () Unit!7419)

(declare-fun Unit!7429 () Unit!7419)

(assert (=> b!120622 (= lt!188035 Unit!7429)))

(assert (=> b!120622 (= (_2!5313 lt!188046) (_2!5313 lt!188030))))

(declare-fun lt!188029 () Unit!7419)

(declare-fun Unit!7430 () Unit!7419)

(assert (=> b!120622 (= lt!188029 Unit!7430)))

(assert (=> b!120622 (= (_1!5313 lt!188046) (_2!5312 lt!188039))))

(declare-fun b!120623 () Bool)

(declare-fun res!99865 () Bool)

(assert (=> b!120623 (=> (not res!99865) (not e!78985))))

(declare-fun lt!188038 () (_ BitVec 64))

(declare-fun lt!188058 () (_ BitVec 64))

(assert (=> b!120623 (= res!99865 (= (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!188024))) (currentByte!5536 (_2!5311 lt!188024)) (currentBit!5531 (_2!5311 lt!188024))) (bvadd lt!188058 lt!188038)))))

(assert (=> b!120623 (or (not (= (bvand lt!188058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188038 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188058 lt!188038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120623 (= lt!188038 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120623 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120623 (= lt!188058 (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))))))

(declare-fun b!120624 () Bool)

(assert (=> b!120624 (= e!78987 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun bm!1571 () Bool)

(assert (=> bm!1571 (= call!1574 (isPrefixOf!0 (ite c!7255 (_2!5311 lt!187462) lt!188033) (ite c!7255 (_2!5311 lt!188037) lt!188033)))))

(declare-fun lt!188042 () tuple2!10094)

(declare-fun lt!188066 () tuple2!10096)

(declare-fun b!120625 () Bool)

(assert (=> b!120625 (= e!78985 (and (= (_2!5313 lt!188066) v!199) (= (_1!5313 lt!188066) (_2!5312 lt!188042))))))

(declare-fun lt!188051 () (_ BitVec 64))

(assert (=> b!120625 (= lt!188066 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!188042) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188051))))

(declare-fun lt!188052 () Unit!7419)

(declare-fun lt!188049 () Unit!7419)

(assert (=> b!120625 (= lt!188052 lt!188049)))

(assert (=> b!120625 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!188024)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462))) lt!188043)))

(assert (=> b!120625 (= lt!188049 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5311 lt!187462) (buf!2857 (_2!5311 lt!188024)) lt!188043))))

(assert (=> b!120625 e!78982))

(declare-fun res!99864 () Bool)

(assert (=> b!120625 (=> (not res!99864) (not e!78982))))

(assert (=> b!120625 (= res!99864 (and (= (size!2426 (buf!2857 (_2!5311 lt!187462))) (size!2426 (buf!2857 (_2!5311 lt!188024)))) (bvsge lt!188043 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120625 (= lt!188043 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120625 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120625 (= lt!188051 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!120625 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120625 (= lt!188042 (reader!0 (_2!5311 lt!187462) (_2!5311 lt!188024)))))

(declare-fun b!120626 () Bool)

(assert (=> b!120626 (= e!78987 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!120627 () Bool)

(declare-fun res!99862 () Bool)

(assert (=> b!120627 (= res!99862 call!1574)))

(assert (=> b!120627 (=> (not res!99862) (not e!78984))))

(declare-fun b!120628 () Bool)

(assert (=> b!120628 (= lt!188056 (readBitPure!0 (readerFrom!0 (_2!5311 lt!188037) (currentBit!5531 (_2!5311 lt!187462)) (currentByte!5536 (_2!5311 lt!187462)))))))

(declare-fun res!99870 () Bool)

(assert (=> b!120628 (= res!99870 (and (= (_2!5314 lt!188056) lt!188045) (= (_1!5314 lt!188056) (_2!5311 lt!188037))))))

(assert (=> b!120628 (=> (not res!99870) (not e!78986))))

(assert (=> b!120628 (= e!78984 e!78986)))

(declare-fun b!120629 () Bool)

(assert (=> b!120629 (= e!78988 (= (_2!5314 lt!188050) (_2!5314 lt!188064)))))

(assert (= (and d!38792 c!7255) b!120622))

(assert (= (and d!38792 (not c!7255)) b!120619))

(assert (= (and b!120622 res!99867) b!120621))

(assert (= (and b!120621 res!99863) b!120627))

(assert (= (and b!120627 res!99862) b!120628))

(assert (= (and b!120628 res!99870) b!120617))

(assert (= (and b!120622 res!99868) b!120629))

(assert (= (and b!120622 c!7256) b!120626))

(assert (= (and b!120622 (not c!7256)) b!120624))

(assert (= (or b!120627 b!120619) bm!1571))

(assert (= (and d!38792 res!99869) b!120623))

(assert (= (and b!120623 res!99865) b!120620))

(assert (= (and b!120620 res!99866) b!120625))

(assert (= (and b!120625 res!99864) b!120618))

(declare-fun m!182315 () Bool)

(assert (=> b!120619 m!182315))

(declare-fun m!182317 () Bool)

(assert (=> b!120623 m!182317))

(assert (=> b!120623 m!181971))

(declare-fun m!182319 () Bool)

(assert (=> b!120622 m!182319))

(declare-fun m!182321 () Bool)

(assert (=> b!120622 m!182321))

(declare-fun m!182323 () Bool)

(assert (=> b!120622 m!182323))

(declare-fun m!182325 () Bool)

(assert (=> b!120622 m!182325))

(declare-fun m!182327 () Bool)

(assert (=> b!120622 m!182327))

(declare-fun m!182329 () Bool)

(assert (=> b!120622 m!182329))

(declare-fun m!182331 () Bool)

(assert (=> b!120622 m!182331))

(declare-fun m!182333 () Bool)

(assert (=> b!120622 m!182333))

(declare-fun m!182335 () Bool)

(assert (=> b!120622 m!182335))

(declare-fun m!182337 () Bool)

(assert (=> b!120622 m!182337))

(declare-fun m!182339 () Bool)

(assert (=> b!120622 m!182339))

(declare-fun m!182341 () Bool)

(assert (=> b!120622 m!182341))

(declare-fun m!182343 () Bool)

(assert (=> b!120622 m!182343))

(declare-fun m!182345 () Bool)

(assert (=> b!120622 m!182345))

(declare-fun m!182347 () Bool)

(assert (=> b!120622 m!182347))

(declare-fun m!182349 () Bool)

(assert (=> b!120622 m!182349))

(declare-fun m!182351 () Bool)

(assert (=> b!120622 m!182351))

(declare-fun m!182353 () Bool)

(assert (=> b!120622 m!182353))

(declare-fun m!182355 () Bool)

(assert (=> b!120622 m!182355))

(declare-fun m!182357 () Bool)

(assert (=> b!120622 m!182357))

(declare-fun m!182359 () Bool)

(assert (=> b!120622 m!182359))

(assert (=> b!120622 m!182353))

(declare-fun m!182361 () Bool)

(assert (=> b!120622 m!182361))

(declare-fun m!182363 () Bool)

(assert (=> b!120622 m!182363))

(declare-fun m!182365 () Bool)

(assert (=> b!120622 m!182365))

(assert (=> b!120622 m!181971))

(declare-fun m!182367 () Bool)

(assert (=> b!120622 m!182367))

(declare-fun m!182369 () Bool)

(assert (=> b!120622 m!182369))

(declare-fun m!182371 () Bool)

(assert (=> b!120622 m!182371))

(declare-fun m!182373 () Bool)

(assert (=> b!120622 m!182373))

(declare-fun m!182375 () Bool)

(assert (=> b!120621 m!182375))

(assert (=> b!120621 m!181971))

(declare-fun m!182377 () Bool)

(assert (=> b!120620 m!182377))

(declare-fun m!182379 () Bool)

(assert (=> b!120618 m!182379))

(declare-fun m!182381 () Bool)

(assert (=> b!120628 m!182381))

(assert (=> b!120628 m!182381))

(declare-fun m!182383 () Bool)

(assert (=> b!120628 m!182383))

(assert (=> b!120625 m!182331))

(declare-fun m!182385 () Bool)

(assert (=> b!120625 m!182385))

(declare-fun m!182387 () Bool)

(assert (=> b!120625 m!182387))

(declare-fun m!182389 () Bool)

(assert (=> b!120625 m!182389))

(declare-fun m!182391 () Bool)

(assert (=> b!120625 m!182391))

(declare-fun m!182393 () Bool)

(assert (=> bm!1571 m!182393))

(declare-fun m!182395 () Bool)

(assert (=> b!120617 m!182395))

(assert (=> b!120617 m!182375))

(assert (=> b!120416 d!38792))

(declare-fun d!38892 () Bool)

(declare-fun e!78989 () Bool)

(assert (=> d!38892 e!78989))

(declare-fun res!99871 () Bool)

(assert (=> d!38892 (=> (not res!99871) (not e!78989))))

(declare-fun lt!188069 () (_ BitVec 64))

(declare-fun lt!188072 () (_ BitVec 64))

(declare-fun lt!188068 () (_ BitVec 64))

(assert (=> d!38892 (= res!99871 (= lt!188072 (bvsub lt!188068 lt!188069)))))

(assert (=> d!38892 (or (= (bvand lt!188068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188069 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188068 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188068 lt!188069) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38892 (= lt!188069 (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187471)))) ((_ sign_extend 32) (currentByte!5536 (_1!5314 lt!187471))) ((_ sign_extend 32) (currentBit!5531 (_1!5314 lt!187471)))))))

(declare-fun lt!188070 () (_ BitVec 64))

(declare-fun lt!188071 () (_ BitVec 64))

(assert (=> d!38892 (= lt!188068 (bvmul lt!188070 lt!188071))))

(assert (=> d!38892 (or (= lt!188070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188071 (bvsdiv (bvmul lt!188070 lt!188071) lt!188070)))))

(assert (=> d!38892 (= lt!188071 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38892 (= lt!188070 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187471)))))))

(assert (=> d!38892 (= lt!188072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5536 (_1!5314 lt!187471))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5531 (_1!5314 lt!187471)))))))

(assert (=> d!38892 (invariant!0 (currentBit!5531 (_1!5314 lt!187471)) (currentByte!5536 (_1!5314 lt!187471)) (size!2426 (buf!2857 (_1!5314 lt!187471))))))

(assert (=> d!38892 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187471))) (currentByte!5536 (_1!5314 lt!187471)) (currentBit!5531 (_1!5314 lt!187471))) lt!188072)))

(declare-fun b!120630 () Bool)

(declare-fun res!99872 () Bool)

(assert (=> b!120630 (=> (not res!99872) (not e!78989))))

(assert (=> b!120630 (= res!99872 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188072))))

(declare-fun b!120631 () Bool)

(declare-fun lt!188067 () (_ BitVec 64))

(assert (=> b!120631 (= e!78989 (bvsle lt!188072 (bvmul lt!188067 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120631 (or (= lt!188067 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188067 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188067)))))

(assert (=> b!120631 (= lt!188067 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187471)))))))

(assert (= (and d!38892 res!99871) b!120630))

(assert (= (and b!120630 res!99872) b!120631))

(declare-fun m!182397 () Bool)

(assert (=> d!38892 m!182397))

(declare-fun m!182399 () Bool)

(assert (=> d!38892 m!182399))

(assert (=> b!120416 d!38892))

(declare-fun d!38894 () Bool)

(assert (=> d!38894 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462))) lt!187450) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462)))) lt!187450))))

(declare-fun bs!9403 () Bool)

(assert (= bs!9403 d!38894))

(declare-fun m!182401 () Bool)

(assert (=> bs!9403 m!182401))

(assert (=> b!120416 d!38894))

(declare-fun d!38896 () Bool)

(assert (=> d!38896 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305)) lt!187468) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305))) lt!187468))))

(declare-fun bs!9404 () Bool)

(assert (= bs!9404 d!38896))

(declare-fun m!182403 () Bool)

(assert (=> bs!9404 m!182403))

(assert (=> b!120416 d!38896))

(declare-fun d!38898 () Bool)

(assert (=> d!38898 (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305)) lt!187468)))

(declare-fun lt!188073 () Unit!7419)

(assert (=> d!38898 (= lt!188073 (choose!9 thiss!1305 (buf!2857 (_2!5311 lt!187455)) lt!187468 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305))))))

(assert (=> d!38898 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2857 (_2!5311 lt!187455)) lt!187468) lt!188073)))

(declare-fun bs!9405 () Bool)

(assert (= bs!9405 d!38898))

(assert (=> bs!9405 m!181947))

(declare-fun m!182405 () Bool)

(assert (=> bs!9405 m!182405))

(assert (=> b!120416 d!38898))

(declare-fun d!38900 () Bool)

(assert (=> d!38900 (isPrefixOf!0 thiss!1305 (_2!5311 lt!187455))))

(declare-fun lt!188076 () Unit!7419)

(declare-fun choose!30 (BitStream!4326 BitStream!4326 BitStream!4326) Unit!7419)

(assert (=> d!38900 (= lt!188076 (choose!30 thiss!1305 (_2!5311 lt!187462) (_2!5311 lt!187455)))))

(assert (=> d!38900 (isPrefixOf!0 thiss!1305 (_2!5311 lt!187462))))

(assert (=> d!38900 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5311 lt!187462) (_2!5311 lt!187455)) lt!188076)))

(declare-fun bs!9406 () Bool)

(assert (= bs!9406 d!38900))

(assert (=> bs!9406 m!181941))

(declare-fun m!182407 () Bool)

(assert (=> bs!9406 m!182407))

(assert (=> bs!9406 m!181985))

(assert (=> b!120416 d!38900))

(declare-fun d!38902 () Bool)

(declare-fun lt!188077 () tuple2!10108)

(assert (=> d!38902 (= lt!188077 (readBit!0 (_1!5312 lt!187464)))))

(assert (=> d!38902 (= (readBitPure!0 (_1!5312 lt!187464)) (tuple2!10099 (_2!5319 lt!188077) (_1!5319 lt!188077)))))

(declare-fun bs!9407 () Bool)

(assert (= bs!9407 d!38902))

(declare-fun m!182409 () Bool)

(assert (=> bs!9407 m!182409))

(assert (=> b!120416 d!38902))

(declare-fun d!38904 () Bool)

(declare-fun e!78992 () Bool)

(assert (=> d!38904 e!78992))

(declare-fun res!99875 () Bool)

(assert (=> d!38904 (=> (not res!99875) (not e!78992))))

(declare-fun lt!188087 () tuple2!10098)

(declare-fun lt!188089 () tuple2!10098)

(assert (=> d!38904 (= res!99875 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!188087))) (currentByte!5536 (_1!5314 lt!188087)) (currentBit!5531 (_1!5314 lt!188087))) (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!188089))) (currentByte!5536 (_1!5314 lt!188089)) (currentBit!5531 (_1!5314 lt!188089)))))))

(declare-fun lt!188088 () BitStream!4326)

(declare-fun lt!188086 () Unit!7419)

(declare-fun choose!50 (BitStream!4326 BitStream!4326 BitStream!4326 tuple2!10098 tuple2!10098 BitStream!4326 Bool tuple2!10098 tuple2!10098 BitStream!4326 Bool) Unit!7419)

(assert (=> d!38904 (= lt!188086 (choose!50 lt!187449 (_2!5311 lt!187455) lt!188088 lt!188087 (tuple2!10099 (_1!5314 lt!188087) (_2!5314 lt!188087)) (_1!5314 lt!188087) (_2!5314 lt!188087) lt!188089 (tuple2!10099 (_1!5314 lt!188089) (_2!5314 lt!188089)) (_1!5314 lt!188089) (_2!5314 lt!188089)))))

(assert (=> d!38904 (= lt!188089 (readBitPure!0 lt!188088))))

(assert (=> d!38904 (= lt!188087 (readBitPure!0 lt!187449))))

(assert (=> d!38904 (= lt!188088 (BitStream!4327 (buf!2857 (_2!5311 lt!187455)) (currentByte!5536 lt!187449) (currentBit!5531 lt!187449)))))

(assert (=> d!38904 (invariant!0 (currentBit!5531 lt!187449) (currentByte!5536 lt!187449) (size!2426 (buf!2857 (_2!5311 lt!187455))))))

(assert (=> d!38904 (= (readBitPrefixLemma!0 lt!187449 (_2!5311 lt!187455)) lt!188086)))

(declare-fun b!120634 () Bool)

(assert (=> b!120634 (= e!78992 (= (_2!5314 lt!188087) (_2!5314 lt!188089)))))

(assert (= (and d!38904 res!99875) b!120634))

(declare-fun m!182411 () Bool)

(assert (=> d!38904 m!182411))

(declare-fun m!182413 () Bool)

(assert (=> d!38904 m!182413))

(declare-fun m!182415 () Bool)

(assert (=> d!38904 m!182415))

(declare-fun m!182417 () Bool)

(assert (=> d!38904 m!182417))

(declare-fun m!182419 () Bool)

(assert (=> d!38904 m!182419))

(assert (=> d!38904 m!181943))

(assert (=> b!120416 d!38904))

(declare-fun d!38906 () Bool)

(declare-fun res!99883 () Bool)

(declare-fun e!78997 () Bool)

(assert (=> d!38906 (=> (not res!99883) (not e!78997))))

(assert (=> d!38906 (= res!99883 (= (size!2426 (buf!2857 thiss!1305)) (size!2426 (buf!2857 (_2!5311 lt!187455)))))))

(assert (=> d!38906 (= (isPrefixOf!0 thiss!1305 (_2!5311 lt!187455)) e!78997)))

(declare-fun b!120641 () Bool)

(declare-fun res!99884 () Bool)

(assert (=> b!120641 (=> (not res!99884) (not e!78997))))

(assert (=> b!120641 (= res!99884 (bvsle (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)) (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187455))) (currentByte!5536 (_2!5311 lt!187455)) (currentBit!5531 (_2!5311 lt!187455)))))))

(declare-fun b!120642 () Bool)

(declare-fun e!78998 () Bool)

(assert (=> b!120642 (= e!78997 e!78998)))

(declare-fun res!99882 () Bool)

(assert (=> b!120642 (=> res!99882 e!78998)))

(assert (=> b!120642 (= res!99882 (= (size!2426 (buf!2857 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120643 () Bool)

(assert (=> b!120643 (= e!78998 (arrayBitRangesEq!0 (buf!2857 thiss!1305) (buf!2857 (_2!5311 lt!187455)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305))))))

(assert (= (and d!38906 res!99883) b!120641))

(assert (= (and b!120641 res!99884) b!120642))

(assert (= (and b!120642 (not res!99882)) b!120643))

(assert (=> b!120641 m!181973))

(assert (=> b!120641 m!181979))

(assert (=> b!120643 m!181973))

(assert (=> b!120643 m!181973))

(declare-fun m!182421 () Bool)

(assert (=> b!120643 m!182421))

(assert (=> b!120416 d!38906))

(declare-fun d!38908 () Bool)

(declare-fun lt!188090 () tuple2!10108)

(assert (=> d!38908 (= lt!188090 (readBit!0 lt!187449))))

(assert (=> d!38908 (= (readBitPure!0 lt!187449) (tuple2!10099 (_2!5319 lt!188090) (_1!5319 lt!188090)))))

(declare-fun bs!9408 () Bool)

(assert (= bs!9408 d!38908))

(declare-fun m!182423 () Bool)

(assert (=> bs!9408 m!182423))

(assert (=> b!120416 d!38908))

(declare-fun lt!188091 () tuple2!10110)

(declare-fun d!38910 () Bool)

(assert (=> d!38910 (= lt!188091 (readNLeastSignificantBitsLoop!0 (_1!5312 lt!187470) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187465))))

(assert (=> d!38910 (= (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!187470) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187465) (tuple2!10097 (_2!5320 lt!188091) (_1!5320 lt!188091)))))

(declare-fun bs!9409 () Bool)

(assert (= bs!9409 d!38910))

(declare-fun m!182425 () Bool)

(assert (=> bs!9409 m!182425))

(assert (=> b!120416 d!38910))

(declare-fun d!38912 () Bool)

(assert (=> d!38912 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 thiss!1305))))))

(declare-fun bs!9410 () Bool)

(assert (= bs!9410 d!38912))

(declare-fun m!182427 () Bool)

(assert (=> bs!9410 m!182427))

(assert (=> start!23794 d!38912))

(declare-fun d!38914 () Bool)

(declare-fun e!79001 () Bool)

(assert (=> d!38914 e!79001))

(declare-fun res!99887 () Bool)

(assert (=> d!38914 (=> (not res!99887) (not e!79001))))

(declare-fun lt!188097 () (_ BitVec 64))

(declare-fun lt!188096 () BitStream!4326)

(assert (=> d!38914 (= res!99887 (= (bvadd lt!188097 (bvsub lt!187475 lt!187451)) (bitIndex!0 (size!2426 (buf!2857 lt!188096)) (currentByte!5536 lt!188096) (currentBit!5531 lt!188096))))))

(assert (=> d!38914 (or (not (= (bvand lt!188097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187475 lt!187451) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188097 (bvsub lt!187475 lt!187451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38914 (= lt!188097 (bitIndex!0 (size!2426 (buf!2857 (_2!5312 lt!187464))) (currentByte!5536 (_2!5312 lt!187464)) (currentBit!5531 (_2!5312 lt!187464))))))

(declare-fun moveBitIndex!0 (BitStream!4326 (_ BitVec 64)) tuple2!10092)

(assert (=> d!38914 (= lt!188096 (_2!5311 (moveBitIndex!0 (_2!5312 lt!187464) (bvsub lt!187475 lt!187451))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4326 (_ BitVec 64)) Bool)

(assert (=> d!38914 (moveBitIndexPrecond!0 (_2!5312 lt!187464) (bvsub lt!187475 lt!187451))))

(assert (=> d!38914 (= (withMovedBitIndex!0 (_2!5312 lt!187464) (bvsub lt!187475 lt!187451)) lt!188096)))

(declare-fun b!120646 () Bool)

(assert (=> b!120646 (= e!79001 (= (size!2426 (buf!2857 (_2!5312 lt!187464))) (size!2426 (buf!2857 lt!188096))))))

(assert (= (and d!38914 res!99887) b!120646))

(declare-fun m!182429 () Bool)

(assert (=> d!38914 m!182429))

(declare-fun m!182431 () Bool)

(assert (=> d!38914 m!182431))

(declare-fun m!182433 () Bool)

(assert (=> d!38914 m!182433))

(declare-fun m!182435 () Bool)

(assert (=> d!38914 m!182435))

(assert (=> b!120415 d!38914))

(declare-fun d!38916 () Bool)

(declare-fun e!79002 () Bool)

(assert (=> d!38916 e!79002))

(declare-fun res!99888 () Bool)

(assert (=> d!38916 (=> (not res!99888) (not e!79002))))

(declare-fun lt!188099 () (_ BitVec 64))

(declare-fun lt!188098 () BitStream!4326)

(assert (=> d!38916 (= res!99888 (= (bvadd lt!188099 (bvsub lt!187461 lt!187451)) (bitIndex!0 (size!2426 (buf!2857 lt!188098)) (currentByte!5536 lt!188098) (currentBit!5531 lt!188098))))))

(assert (=> d!38916 (or (not (= (bvand lt!188099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187461 lt!187451) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188099 (bvsub lt!187461 lt!187451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38916 (= lt!188099 (bitIndex!0 (size!2426 (buf!2857 (_2!5312 lt!187470))) (currentByte!5536 (_2!5312 lt!187470)) (currentBit!5531 (_2!5312 lt!187470))))))

(assert (=> d!38916 (= lt!188098 (_2!5311 (moveBitIndex!0 (_2!5312 lt!187470) (bvsub lt!187461 lt!187451))))))

(assert (=> d!38916 (moveBitIndexPrecond!0 (_2!5312 lt!187470) (bvsub lt!187461 lt!187451))))

(assert (=> d!38916 (= (withMovedBitIndex!0 (_2!5312 lt!187470) (bvsub lt!187461 lt!187451)) lt!188098)))

(declare-fun b!120647 () Bool)

(assert (=> b!120647 (= e!79002 (= (size!2426 (buf!2857 (_2!5312 lt!187470))) (size!2426 (buf!2857 lt!188098))))))

(assert (= (and d!38916 res!99888) b!120647))

(declare-fun m!182437 () Bool)

(assert (=> d!38916 m!182437))

(declare-fun m!182439 () Bool)

(assert (=> d!38916 m!182439))

(declare-fun m!182441 () Bool)

(assert (=> d!38916 m!182441))

(declare-fun m!182443 () Bool)

(assert (=> d!38916 m!182443))

(assert (=> b!120415 d!38916))

(declare-fun d!38918 () Bool)

(declare-fun e!79003 () Bool)

(assert (=> d!38918 e!79003))

(declare-fun res!99889 () Bool)

(assert (=> d!38918 (=> (not res!99889) (not e!79003))))

(declare-fun lt!188105 () (_ BitVec 64))

(declare-fun lt!188101 () (_ BitVec 64))

(declare-fun lt!188102 () (_ BitVec 64))

(assert (=> d!38918 (= res!99889 (= lt!188105 (bvsub lt!188101 lt!188102)))))

(assert (=> d!38918 (or (= (bvand lt!188101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188102 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188101 lt!188102) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38918 (= lt!188102 (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187455))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187455)))))))

(declare-fun lt!188103 () (_ BitVec 64))

(declare-fun lt!188104 () (_ BitVec 64))

(assert (=> d!38918 (= lt!188101 (bvmul lt!188103 lt!188104))))

(assert (=> d!38918 (or (= lt!188103 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188104 (bvsdiv (bvmul lt!188103 lt!188104) lt!188103)))))

(assert (=> d!38918 (= lt!188104 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38918 (= lt!188103 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))))))

(assert (=> d!38918 (= lt!188105 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187455))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187455)))))))

(assert (=> d!38918 (invariant!0 (currentBit!5531 (_2!5311 lt!187455)) (currentByte!5536 (_2!5311 lt!187455)) (size!2426 (buf!2857 (_2!5311 lt!187455))))))

(assert (=> d!38918 (= (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187455))) (currentByte!5536 (_2!5311 lt!187455)) (currentBit!5531 (_2!5311 lt!187455))) lt!188105)))

(declare-fun b!120648 () Bool)

(declare-fun res!99890 () Bool)

(assert (=> b!120648 (=> (not res!99890) (not e!79003))))

(assert (=> b!120648 (= res!99890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188105))))

(declare-fun b!120649 () Bool)

(declare-fun lt!188100 () (_ BitVec 64))

(assert (=> b!120649 (= e!79003 (bvsle lt!188105 (bvmul lt!188100 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120649 (or (= lt!188100 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188100 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188100)))))

(assert (=> b!120649 (= lt!188100 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187455)))))))

(assert (= (and d!38918 res!99889) b!120648))

(assert (= (and b!120648 res!99890) b!120649))

(declare-fun m!182445 () Bool)

(assert (=> d!38918 m!182445))

(declare-fun m!182447 () Bool)

(assert (=> d!38918 m!182447))

(assert (=> b!120415 d!38918))

(declare-fun d!38920 () Bool)

(declare-fun e!79004 () Bool)

(assert (=> d!38920 e!79004))

(declare-fun res!99891 () Bool)

(assert (=> d!38920 (=> (not res!99891) (not e!79004))))

(declare-fun lt!188111 () (_ BitVec 64))

(declare-fun lt!188108 () (_ BitVec 64))

(declare-fun lt!188107 () (_ BitVec 64))

(assert (=> d!38920 (= res!99891 (= lt!188111 (bvsub lt!188107 lt!188108)))))

(assert (=> d!38920 (or (= (bvand lt!188107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188108 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188107 lt!188108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38920 (= lt!188108 (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305))))))

(declare-fun lt!188109 () (_ BitVec 64))

(declare-fun lt!188110 () (_ BitVec 64))

(assert (=> d!38920 (= lt!188107 (bvmul lt!188109 lt!188110))))

(assert (=> d!38920 (or (= lt!188109 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188110 (bvsdiv (bvmul lt!188109 lt!188110) lt!188109)))))

(assert (=> d!38920 (= lt!188110 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38920 (= lt!188109 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))))))

(assert (=> d!38920 (= lt!188111 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5536 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5531 thiss!1305))))))

(assert (=> d!38920 (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 thiss!1305)))))

(assert (=> d!38920 (= (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)) lt!188111)))

(declare-fun b!120650 () Bool)

(declare-fun res!99892 () Bool)

(assert (=> b!120650 (=> (not res!99892) (not e!79004))))

(assert (=> b!120650 (= res!99892 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188111))))

(declare-fun b!120651 () Bool)

(declare-fun lt!188106 () (_ BitVec 64))

(assert (=> b!120651 (= e!79004 (bvsle lt!188111 (bvmul lt!188106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120651 (or (= lt!188106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188106)))))

(assert (=> b!120651 (= lt!188106 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))))))

(assert (= (and d!38920 res!99891) b!120650))

(assert (= (and b!120650 res!99892) b!120651))

(declare-fun m!182449 () Bool)

(assert (=> d!38920 m!182449))

(assert (=> d!38920 m!182427))

(assert (=> b!120415 d!38920))

(declare-fun d!38922 () Bool)

(declare-fun e!79005 () Bool)

(assert (=> d!38922 e!79005))

(declare-fun res!99893 () Bool)

(assert (=> d!38922 (=> (not res!99893) (not e!79005))))

(declare-fun lt!188114 () (_ BitVec 64))

(declare-fun lt!188117 () (_ BitVec 64))

(declare-fun lt!188113 () (_ BitVec 64))

(assert (=> d!38922 (= res!99893 (= lt!188117 (bvsub lt!188113 lt!188114)))))

(assert (=> d!38922 (or (= (bvand lt!188113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188113 lt!188114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38922 (= lt!188114 (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187462)))) ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462)))))))

(declare-fun lt!188115 () (_ BitVec 64))

(declare-fun lt!188116 () (_ BitVec 64))

(assert (=> d!38922 (= lt!188113 (bvmul lt!188115 lt!188116))))

(assert (=> d!38922 (or (= lt!188115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188116 (bvsdiv (bvmul lt!188115 lt!188116) lt!188115)))))

(assert (=> d!38922 (= lt!188116 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38922 (= lt!188115 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(assert (=> d!38922 (= lt!188117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5536 (_2!5311 lt!187462))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5531 (_2!5311 lt!187462)))))))

(assert (=> d!38922 (invariant!0 (currentBit!5531 (_2!5311 lt!187462)) (currentByte!5536 (_2!5311 lt!187462)) (size!2426 (buf!2857 (_2!5311 lt!187462))))))

(assert (=> d!38922 (= (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462))) lt!188117)))

(declare-fun b!120652 () Bool)

(declare-fun res!99894 () Bool)

(assert (=> b!120652 (=> (not res!99894) (not e!79005))))

(assert (=> b!120652 (= res!99894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188117))))

(declare-fun b!120653 () Bool)

(declare-fun lt!188112 () (_ BitVec 64))

(assert (=> b!120653 (= e!79005 (bvsle lt!188117 (bvmul lt!188112 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120653 (or (= lt!188112 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188112 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188112)))))

(assert (=> b!120653 (= lt!188112 ((_ sign_extend 32) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(assert (= (and d!38922 res!99893) b!120652))

(assert (= (and b!120652 res!99894) b!120653))

(declare-fun m!182451 () Bool)

(assert (=> d!38922 m!182451))

(declare-fun m!182453 () Bool)

(assert (=> d!38922 m!182453))

(assert (=> b!120415 d!38922))

(declare-fun d!38924 () Bool)

(declare-fun e!79006 () Bool)

(assert (=> d!38924 e!79006))

(declare-fun res!99895 () Bool)

(assert (=> d!38924 (=> (not res!99895) (not e!79006))))

(declare-fun lt!188119 () (_ BitVec 64))

(declare-fun lt!188118 () BitStream!4326)

(assert (=> d!38924 (= res!99895 (= (bvadd lt!188119 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2426 (buf!2857 lt!188118)) (currentByte!5536 lt!188118) (currentBit!5531 lt!188118))))))

(assert (=> d!38924 (or (not (= (bvand lt!188119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188119 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188119 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38924 (= lt!188119 (bitIndex!0 (size!2426 (buf!2857 (_1!5312 lt!187464))) (currentByte!5536 (_1!5312 lt!187464)) (currentBit!5531 (_1!5312 lt!187464))))))

(assert (=> d!38924 (= lt!188118 (_2!5311 (moveBitIndex!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!38924 (moveBitIndexPrecond!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38924 (= (withMovedBitIndex!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001) lt!188118)))

(declare-fun b!120654 () Bool)

(assert (=> b!120654 (= e!79006 (= (size!2426 (buf!2857 (_1!5312 lt!187464))) (size!2426 (buf!2857 lt!188118))))))

(assert (= (and d!38924 res!99895) b!120654))

(declare-fun m!182455 () Bool)

(assert (=> d!38924 m!182455))

(declare-fun m!182457 () Bool)

(assert (=> d!38924 m!182457))

(declare-fun m!182459 () Bool)

(assert (=> d!38924 m!182459))

(declare-fun m!182461 () Bool)

(assert (=> d!38924 m!182461))

(assert (=> b!120415 d!38924))

(declare-fun d!38926 () Bool)

(declare-fun lt!188120 () tuple2!10110)

(assert (=> d!38926 (= lt!188120 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187465))))

(assert (=> d!38926 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187465) (tuple2!10097 (_2!5320 lt!188120) (_1!5320 lt!188120)))))

(declare-fun bs!9411 () Bool)

(assert (= bs!9411 d!38926))

(assert (=> bs!9411 m!181975))

(declare-fun m!182463 () Bool)

(assert (=> bs!9411 m!182463))

(assert (=> b!120415 d!38926))

(declare-fun d!38928 () Bool)

(declare-fun lt!188137 () tuple2!10096)

(declare-fun lt!188134 () tuple2!10096)

(assert (=> d!38928 (and (= (_2!5313 lt!188137) (_2!5313 lt!188134)) (= (_1!5313 lt!188137) (_1!5313 lt!188134)))))

(declare-fun lt!188133 () Bool)

(declare-fun lt!188136 () Unit!7419)

(declare-fun lt!188135 () BitStream!4326)

(declare-fun lt!188138 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10096 tuple2!10096 BitStream!4326 (_ BitVec 64) Bool BitStream!4326 (_ BitVec 64) tuple2!10096 tuple2!10096 BitStream!4326 (_ BitVec 64)) Unit!7419)

(assert (=> d!38928 (= lt!188136 (choose!45 (_1!5312 lt!187464) nBits!396 i!615 lt!187473 lt!188137 (tuple2!10097 (_1!5313 lt!188137) (_2!5313 lt!188137)) (_1!5313 lt!188137) (_2!5313 lt!188137) lt!188133 lt!188135 lt!188138 lt!188134 (tuple2!10097 (_1!5313 lt!188134) (_2!5313 lt!188134)) (_1!5313 lt!188134) (_2!5313 lt!188134)))))

(assert (=> d!38928 (= lt!188134 (readNLeastSignificantBitsLoopPure!0 lt!188135 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!188138))))

(assert (=> d!38928 (= lt!188138 (bvor lt!187473 (ite lt!188133 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38928 (= lt!188135 (withMovedBitIndex!0 (_1!5312 lt!187464) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38928 (= lt!188133 (_2!5314 (readBitPure!0 (_1!5312 lt!187464))))))

(assert (=> d!38928 (= lt!188137 (readNLeastSignificantBitsLoopPure!0 (_1!5312 lt!187464) nBits!396 i!615 lt!187473))))

(assert (=> d!38928 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5312 lt!187464) nBits!396 i!615 lt!187473) lt!188136)))

(declare-fun bs!9413 () Bool)

(assert (= bs!9413 d!38928))

(assert (=> bs!9413 m!181975))

(assert (=> bs!9413 m!181957))

(declare-fun m!182465 () Bool)

(assert (=> bs!9413 m!182465))

(assert (=> bs!9413 m!181959))

(declare-fun m!182467 () Bool)

(assert (=> bs!9413 m!182467))

(assert (=> b!120415 d!38928))

(declare-fun d!38930 () Bool)

(assert (=> d!38930 (= (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187455)))) (and (bvsge (currentBit!5531 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5531 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5536 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187455)))) (and (= (currentBit!5531 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187455))))))))))

(assert (=> b!120414 d!38930))

(assert (=> b!120413 d!38922))

(assert (=> b!120413 d!38920))

(declare-fun d!38932 () Bool)

(declare-fun lt!188139 () tuple2!10108)

(assert (=> d!38932 (= lt!188139 (readBit!0 (readerFrom!0 (_2!5311 lt!187462) (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305))))))

(assert (=> d!38932 (= (readBitPure!0 (readerFrom!0 (_2!5311 lt!187462) (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305))) (tuple2!10099 (_2!5319 lt!188139) (_1!5319 lt!188139)))))

(declare-fun bs!9414 () Bool)

(assert (= bs!9414 d!38932))

(assert (=> bs!9414 m!181989))

(declare-fun m!182469 () Bool)

(assert (=> bs!9414 m!182469))

(assert (=> b!120424 d!38932))

(declare-fun d!38934 () Bool)

(declare-fun e!79009 () Bool)

(assert (=> d!38934 e!79009))

(declare-fun res!99899 () Bool)

(assert (=> d!38934 (=> (not res!99899) (not e!79009))))

(assert (=> d!38934 (= res!99899 (invariant!0 (currentBit!5531 (_2!5311 lt!187462)) (currentByte!5536 (_2!5311 lt!187462)) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(assert (=> d!38934 (= (readerFrom!0 (_2!5311 lt!187462) (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305)) (BitStream!4327 (buf!2857 (_2!5311 lt!187462)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)))))

(declare-fun b!120657 () Bool)

(assert (=> b!120657 (= e!79009 (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(assert (= (and d!38934 res!99899) b!120657))

(assert (=> d!38934 m!182453))

(assert (=> b!120657 m!181965))

(assert (=> b!120424 d!38934))

(declare-fun d!38936 () Bool)

(assert (=> d!38936 (= (invariant!0 (currentBit!5531 thiss!1305) (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187462)))) (and (bvsge (currentBit!5531 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5531 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5536 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187462)))) (and (= (currentBit!5531 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5536 thiss!1305) (size!2426 (buf!2857 (_2!5311 lt!187462))))))))))

(assert (=> b!120412 d!38936))

(declare-fun d!38938 () Bool)

(assert (=> d!38938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305)) lt!187468) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 thiss!1305))) ((_ sign_extend 32) (currentByte!5536 thiss!1305)) ((_ sign_extend 32) (currentBit!5531 thiss!1305))) lt!187468))))

(declare-fun bs!9415 () Bool)

(assert (= bs!9415 d!38938))

(assert (=> bs!9415 m!182449))

(assert (=> b!120422 d!38938))

(declare-fun d!38940 () Bool)

(declare-fun res!99901 () Bool)

(declare-fun e!79010 () Bool)

(assert (=> d!38940 (=> (not res!99901) (not e!79010))))

(assert (=> d!38940 (= res!99901 (= (size!2426 (buf!2857 thiss!1305)) (size!2426 (buf!2857 (_2!5311 lt!187462)))))))

(assert (=> d!38940 (= (isPrefixOf!0 thiss!1305 (_2!5311 lt!187462)) e!79010)))

(declare-fun b!120658 () Bool)

(declare-fun res!99902 () Bool)

(assert (=> b!120658 (=> (not res!99902) (not e!79010))))

(assert (=> b!120658 (= res!99902 (bvsle (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305)) (bitIndex!0 (size!2426 (buf!2857 (_2!5311 lt!187462))) (currentByte!5536 (_2!5311 lt!187462)) (currentBit!5531 (_2!5311 lt!187462)))))))

(declare-fun b!120659 () Bool)

(declare-fun e!79011 () Bool)

(assert (=> b!120659 (= e!79010 e!79011)))

(declare-fun res!99900 () Bool)

(assert (=> b!120659 (=> res!99900 e!79011)))

(assert (=> b!120659 (= res!99900 (= (size!2426 (buf!2857 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120660 () Bool)

(assert (=> b!120660 (= e!79011 (arrayBitRangesEq!0 (buf!2857 thiss!1305) (buf!2857 (_2!5311 lt!187462)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2426 (buf!2857 thiss!1305)) (currentByte!5536 thiss!1305) (currentBit!5531 thiss!1305))))))

(assert (= (and d!38940 res!99901) b!120658))

(assert (= (and b!120658 res!99902) b!120659))

(assert (= (and b!120659 (not res!99900)) b!120660))

(assert (=> b!120658 m!181973))

(assert (=> b!120658 m!181971))

(assert (=> b!120660 m!181973))

(assert (=> b!120660 m!181973))

(declare-fun m!182471 () Bool)

(assert (=> b!120660 m!182471))

(assert (=> b!120420 d!38940))

(declare-fun d!38942 () Bool)

(declare-fun e!79012 () Bool)

(assert (=> d!38942 e!79012))

(declare-fun res!99903 () Bool)

(assert (=> d!38942 (=> (not res!99903) (not e!79012))))

(declare-fun lt!188145 () (_ BitVec 64))

(declare-fun lt!188142 () (_ BitVec 64))

(declare-fun lt!188141 () (_ BitVec 64))

(assert (=> d!38942 (= res!99903 (= lt!188145 (bvsub lt!188141 lt!188142)))))

(assert (=> d!38942 (or (= (bvand lt!188141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188142 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188141 lt!188142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38942 (= lt!188142 (remainingBits!0 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187469)))) ((_ sign_extend 32) (currentByte!5536 (_1!5314 lt!187469))) ((_ sign_extend 32) (currentBit!5531 (_1!5314 lt!187469)))))))

(declare-fun lt!188143 () (_ BitVec 64))

(declare-fun lt!188144 () (_ BitVec 64))

(assert (=> d!38942 (= lt!188141 (bvmul lt!188143 lt!188144))))

(assert (=> d!38942 (or (= lt!188143 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188144 (bvsdiv (bvmul lt!188143 lt!188144) lt!188143)))))

(assert (=> d!38942 (= lt!188144 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38942 (= lt!188143 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187469)))))))

(assert (=> d!38942 (= lt!188145 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5536 (_1!5314 lt!187469))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5531 (_1!5314 lt!187469)))))))

(assert (=> d!38942 (invariant!0 (currentBit!5531 (_1!5314 lt!187469)) (currentByte!5536 (_1!5314 lt!187469)) (size!2426 (buf!2857 (_1!5314 lt!187469))))))

(assert (=> d!38942 (= (bitIndex!0 (size!2426 (buf!2857 (_1!5314 lt!187469))) (currentByte!5536 (_1!5314 lt!187469)) (currentBit!5531 (_1!5314 lt!187469))) lt!188145)))

(declare-fun b!120661 () Bool)

(declare-fun res!99904 () Bool)

(assert (=> b!120661 (=> (not res!99904) (not e!79012))))

(assert (=> b!120661 (= res!99904 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188145))))

(declare-fun b!120662 () Bool)

(declare-fun lt!188140 () (_ BitVec 64))

(assert (=> b!120662 (= e!79012 (bvsle lt!188145 (bvmul lt!188140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120662 (or (= lt!188140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188140)))))

(assert (=> b!120662 (= lt!188140 ((_ sign_extend 32) (size!2426 (buf!2857 (_1!5314 lt!187469)))))))

(assert (= (and d!38942 res!99903) b!120661))

(assert (= (and b!120661 res!99904) b!120662))

(declare-fun m!182473 () Bool)

(assert (=> d!38942 m!182473))

(declare-fun m!182475 () Bool)

(assert (=> d!38942 m!182475))

(assert (=> b!120419 d!38942))

(declare-fun d!38944 () Bool)

(assert (=> d!38944 (= (array_inv!2228 (buf!2857 thiss!1305)) (bvsge (size!2426 (buf!2857 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!120418 d!38944))

(check-sat (not b!120657) (not d!38934) (not d!38784) (not d!38892) (not b!120643) (not d!38778) (not d!38928) (not d!38932) (not b!120476) (not b!120495) (not d!38912) (not b!120502) (not d!38916) (not b!120618) (not b!120628) (not d!38914) (not d!38908) (not b!120497) (not d!38910) (not d!38898) (not d!38904) (not d!38782) (not d!38918) (not d!38902) (not b!120478) (not b!120660) (not bm!1571) (not b!120500) (not b!120501) (not d!38896) (not d!38788) (not b!120623) (not b!120658) (not d!38926) (not b!120619) (not b!120641) (not d!38920) (not b!120475) (not d!38942) (not b!120494) (not b!120622) (not b!120620) (not b!120625) (not b!120499) (not d!38894) (not d!38776) (not d!38922) (not d!38786) (not d!38900) (not b!120496) (not b!120621) (not d!38780) (not d!38924) (not b!120617) (not d!38938) (not b!120477))
