; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28022 () Bool)

(assert start!28022)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!96872 () Bool)

(declare-datatypes ((array!6614 0))(
  ( (array!6615 (arr!3728 (Array (_ BitVec 32) (_ BitVec 8))) (size!2995 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6614)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((BitStream!5248 0))(
  ( (BitStream!5249 (buf!3434 array!6614) (currentByte!6324 (_ BitVec 32)) (currentBit!6319 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13002 0))(
  ( (tuple2!13003 (_1!6847 BitStream!5248) (_2!6847 BitStream!5248)) )
))
(declare-fun lt!225076 () tuple2!13002)

(declare-fun b!145295 () Bool)

(declare-datatypes ((tuple2!13004 0))(
  ( (tuple2!13005 (_1!6848 BitStream!5248) (_2!6848 array!6614)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!5248 array!6614 (_ BitVec 32) (_ BitVec 32)) tuple2!13004)

(assert (=> b!145295 (= e!96872 (= (_1!6848 (readByteArrayLoopPure!0 (_1!6847 lt!225076) arr!237 from!447 to!404)) (_2!6847 lt!225076)))))

(declare-fun res!121490 () Bool)

(declare-fun e!96871 () Bool)

(assert (=> start!28022 (=> (not res!121490) (not e!96871))))

(assert (=> start!28022 (= res!121490 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2995 arr!237))))))

(assert (=> start!28022 e!96871))

(assert (=> start!28022 true))

(declare-fun array_inv!2784 (array!6614) Bool)

(assert (=> start!28022 (array_inv!2784 arr!237)))

(declare-fun thiss!1634 () BitStream!5248)

(declare-fun e!96866 () Bool)

(declare-fun inv!12 (BitStream!5248) Bool)

(assert (=> start!28022 (and (inv!12 thiss!1634) e!96866)))

(declare-fun b!145296 () Bool)

(declare-fun e!96870 () Bool)

(declare-datatypes ((Unit!9063 0))(
  ( (Unit!9064) )
))
(declare-datatypes ((tuple2!13006 0))(
  ( (tuple2!13007 (_1!6849 Unit!9063) (_2!6849 BitStream!5248)) )
))
(declare-fun lt!225075 () tuple2!13006)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145296 (= e!96870 (invariant!0 (currentBit!6319 thiss!1634) (currentByte!6324 thiss!1634) (size!2995 (buf!3434 (_2!6849 lt!225075)))))))

(declare-fun b!145297 () Bool)

(declare-fun e!96873 () Bool)

(declare-datatypes ((tuple2!13008 0))(
  ( (tuple2!13009 (_1!6850 BitStream!5248) (_2!6850 (_ BitVec 8))) )
))
(declare-fun lt!225077 () tuple2!13008)

(declare-fun lt!225080 () tuple2!13008)

(assert (=> b!145297 (= e!96873 (= (_2!6850 lt!225077) (_2!6850 lt!225080)))))

(declare-fun b!145298 () Bool)

(declare-fun lt!225071 () tuple2!13002)

(declare-fun e!96868 () Bool)

(declare-fun lt!225078 () tuple2!13008)

(assert (=> b!145298 (= e!96868 (and (= (_2!6850 lt!225078) (select (arr!3728 arr!237) from!447)) (= (_1!6850 lt!225078) (_2!6847 lt!225071))))))

(declare-fun readBytePure!0 (BitStream!5248) tuple2!13008)

(assert (=> b!145298 (= lt!225078 (readBytePure!0 (_1!6847 lt!225071)))))

(declare-fun reader!0 (BitStream!5248 BitStream!5248) tuple2!13002)

(assert (=> b!145298 (= lt!225071 (reader!0 thiss!1634 (_2!6849 lt!225075)))))

(declare-fun b!145299 () Bool)

(declare-fun res!121487 () Bool)

(assert (=> b!145299 (=> (not res!121487) (not e!96868))))

(declare-fun isPrefixOf!0 (BitStream!5248 BitStream!5248) Bool)

(assert (=> b!145299 (= res!121487 (isPrefixOf!0 thiss!1634 (_2!6849 lt!225075)))))

(declare-fun b!145300 () Bool)

(declare-fun res!121488 () Bool)

(assert (=> b!145300 (=> (not res!121488) (not e!96871))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!145300 (= res!121488 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2995 (buf!3434 thiss!1634))) ((_ sign_extend 32) (currentByte!6324 thiss!1634)) ((_ sign_extend 32) (currentBit!6319 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!145301 () Bool)

(assert (=> b!145301 (= e!96866 (array_inv!2784 (buf!3434 thiss!1634)))))

(declare-fun b!145302 () Bool)

(declare-fun res!121482 () Bool)

(assert (=> b!145302 (=> (not res!121482) (not e!96868))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!145302 (= res!121482 (= (bitIndex!0 (size!2995 (buf!3434 (_2!6849 lt!225075))) (currentByte!6324 (_2!6849 lt!225075)) (currentBit!6319 (_2!6849 lt!225075))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2995 (buf!3434 thiss!1634)) (currentByte!6324 thiss!1634) (currentBit!6319 thiss!1634)))))))

(declare-fun b!145303 () Bool)

(declare-fun e!96875 () Bool)

(declare-fun e!96869 () Bool)

(assert (=> b!145303 (= e!96875 e!96869)))

(declare-fun res!121485 () Bool)

(assert (=> b!145303 (=> (not res!121485) (not e!96869))))

(declare-fun lt!225079 () (_ BitVec 64))

(declare-fun lt!225066 () tuple2!13006)

(assert (=> b!145303 (= res!121485 (= (bitIndex!0 (size!2995 (buf!3434 (_2!6849 lt!225066))) (currentByte!6324 (_2!6849 lt!225066)) (currentBit!6319 (_2!6849 lt!225066))) (bvadd (bitIndex!0 (size!2995 (buf!3434 (_2!6849 lt!225075))) (currentByte!6324 (_2!6849 lt!225075)) (currentBit!6319 (_2!6849 lt!225075))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!225079))))))

(assert (=> b!145303 (= lt!225079 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!145304 () Bool)

(declare-fun res!121484 () Bool)

(assert (=> b!145304 (=> (not res!121484) (not e!96871))))

(assert (=> b!145304 (= res!121484 (bvslt from!447 to!404))))

(declare-fun b!145305 () Bool)

(declare-fun res!121481 () Bool)

(assert (=> b!145305 (=> (not res!121481) (not e!96871))))

(assert (=> b!145305 (= res!121481 (invariant!0 (currentBit!6319 thiss!1634) (currentByte!6324 thiss!1634) (size!2995 (buf!3434 thiss!1634))))))

(declare-fun b!145306 () Bool)

(declare-fun e!96867 () Bool)

(assert (=> b!145306 (= e!96869 (not e!96867))))

(declare-fun res!121479 () Bool)

(assert (=> b!145306 (=> res!121479 e!96867)))

(declare-fun lt!225062 () tuple2!13002)

(declare-fun lt!225064 () tuple2!13004)

(assert (=> b!145306 (= res!121479 (or (not (= (size!2995 (_2!6848 lt!225064)) (size!2995 arr!237))) (not (= (_1!6848 lt!225064) (_2!6847 lt!225062)))))))

(assert (=> b!145306 (= lt!225064 (readByteArrayLoopPure!0 (_1!6847 lt!225062) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!145306 (validate_offset_bits!1 ((_ sign_extend 32) (size!2995 (buf!3434 (_2!6849 lt!225066)))) ((_ sign_extend 32) (currentByte!6324 (_2!6849 lt!225075))) ((_ sign_extend 32) (currentBit!6319 (_2!6849 lt!225075))) lt!225079)))

(declare-fun lt!225069 () Unit!9063)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5248 array!6614 (_ BitVec 64)) Unit!9063)

(assert (=> b!145306 (= lt!225069 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6849 lt!225075) (buf!3434 (_2!6849 lt!225066)) lt!225079))))

(assert (=> b!145306 (= lt!225062 (reader!0 (_2!6849 lt!225075) (_2!6849 lt!225066)))))

(declare-fun b!145307 () Bool)

(assert (=> b!145307 (= e!96871 (not true))))

(declare-fun lt!225073 () tuple2!13004)

(declare-fun lt!225067 () tuple2!13002)

(declare-fun lt!225081 () tuple2!13008)

(assert (=> b!145307 (= lt!225073 (readByteArrayLoopPure!0 (_1!6847 lt!225067) (array!6615 (store (arr!3728 arr!237) from!447 (_2!6850 lt!225081)) (size!2995 arr!237)) (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!225065 () (_ BitVec 32))

(assert (=> b!145307 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2995 (buf!3434 (_2!6849 lt!225066)))) ((_ sign_extend 32) (currentByte!6324 (_2!6849 lt!225075))) ((_ sign_extend 32) (currentBit!6319 (_2!6849 lt!225075))) lt!225065)))

(declare-fun lt!225061 () Unit!9063)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5248 array!6614 (_ BitVec 32)) Unit!9063)

(assert (=> b!145307 (= lt!225061 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6849 lt!225075) (buf!3434 (_2!6849 lt!225066)) lt!225065))))

(assert (=> b!145307 e!96872))

(declare-fun res!121491 () Bool)

(assert (=> b!145307 (=> (not res!121491) (not e!96872))))

(assert (=> b!145307 (= res!121491 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2995 (buf!3434 (_2!6849 lt!225066)))) ((_ sign_extend 32) (currentByte!6324 thiss!1634)) ((_ sign_extend 32) (currentBit!6319 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!225063 () Unit!9063)

(assert (=> b!145307 (= lt!225063 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3434 (_2!6849 lt!225066)) (bvsub to!404 from!447)))))

(assert (=> b!145307 (= (_2!6850 lt!225081) (select (arr!3728 arr!237) from!447))))

(assert (=> b!145307 (= lt!225081 (readBytePure!0 (_1!6847 lt!225076)))))

(assert (=> b!145307 (= lt!225067 (reader!0 (_2!6849 lt!225075) (_2!6849 lt!225066)))))

(assert (=> b!145307 (= lt!225076 (reader!0 thiss!1634 (_2!6849 lt!225066)))))

(assert (=> b!145307 e!96873))

(declare-fun res!121489 () Bool)

(assert (=> b!145307 (=> (not res!121489) (not e!96873))))

(assert (=> b!145307 (= res!121489 (= (bitIndex!0 (size!2995 (buf!3434 (_1!6850 lt!225077))) (currentByte!6324 (_1!6850 lt!225077)) (currentBit!6319 (_1!6850 lt!225077))) (bitIndex!0 (size!2995 (buf!3434 (_1!6850 lt!225080))) (currentByte!6324 (_1!6850 lt!225080)) (currentBit!6319 (_1!6850 lt!225080)))))))

(declare-fun lt!225072 () Unit!9063)

(declare-fun lt!225068 () BitStream!5248)

(declare-fun readBytePrefixLemma!0 (BitStream!5248 BitStream!5248) Unit!9063)

(assert (=> b!145307 (= lt!225072 (readBytePrefixLemma!0 lt!225068 (_2!6849 lt!225066)))))

(assert (=> b!145307 (= lt!225080 (readBytePure!0 (BitStream!5249 (buf!3434 (_2!6849 lt!225066)) (currentByte!6324 thiss!1634) (currentBit!6319 thiss!1634))))))

(assert (=> b!145307 (= lt!225077 (readBytePure!0 lt!225068))))

(assert (=> b!145307 (= lt!225068 (BitStream!5249 (buf!3434 (_2!6849 lt!225075)) (currentByte!6324 thiss!1634) (currentBit!6319 thiss!1634)))))

(assert (=> b!145307 e!96870))

(declare-fun res!121480 () Bool)

(assert (=> b!145307 (=> (not res!121480) (not e!96870))))

(assert (=> b!145307 (= res!121480 (isPrefixOf!0 thiss!1634 (_2!6849 lt!225066)))))

(declare-fun lt!225070 () Unit!9063)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5248 BitStream!5248 BitStream!5248) Unit!9063)

(assert (=> b!145307 (= lt!225070 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6849 lt!225075) (_2!6849 lt!225066)))))

(assert (=> b!145307 e!96875))

(declare-fun res!121492 () Bool)

(assert (=> b!145307 (=> (not res!121492) (not e!96875))))

(assert (=> b!145307 (= res!121492 (= (size!2995 (buf!3434 (_2!6849 lt!225075))) (size!2995 (buf!3434 (_2!6849 lt!225066)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5248 array!6614 (_ BitVec 32) (_ BitVec 32)) tuple2!13006)

(assert (=> b!145307 (= lt!225066 (appendByteArrayLoop!0 (_2!6849 lt!225075) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!145307 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2995 (buf!3434 (_2!6849 lt!225075)))) ((_ sign_extend 32) (currentByte!6324 (_2!6849 lt!225075))) ((_ sign_extend 32) (currentBit!6319 (_2!6849 lt!225075))) lt!225065)))

(assert (=> b!145307 (= lt!225065 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!225074 () Unit!9063)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5248 BitStream!5248 (_ BitVec 64) (_ BitVec 32)) Unit!9063)

(assert (=> b!145307 (= lt!225074 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6849 lt!225075) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!145307 e!96868))

(declare-fun res!121486 () Bool)

(assert (=> b!145307 (=> (not res!121486) (not e!96868))))

(assert (=> b!145307 (= res!121486 (= (size!2995 (buf!3434 thiss!1634)) (size!2995 (buf!3434 (_2!6849 lt!225075)))))))

(declare-fun appendByte!0 (BitStream!5248 (_ BitVec 8)) tuple2!13006)

(assert (=> b!145307 (= lt!225075 (appendByte!0 thiss!1634 (select (arr!3728 arr!237) from!447)))))

(declare-fun b!145308 () Bool)

(declare-fun arrayRangesEq!311 (array!6614 array!6614 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!145308 (= e!96867 (not (arrayRangesEq!311 arr!237 (_2!6848 lt!225064) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!145309 () Bool)

(declare-fun res!121483 () Bool)

(assert (=> b!145309 (=> (not res!121483) (not e!96869))))

(assert (=> b!145309 (= res!121483 (isPrefixOf!0 (_2!6849 lt!225075) (_2!6849 lt!225066)))))

(assert (= (and start!28022 res!121490) b!145300))

(assert (= (and b!145300 res!121488) b!145304))

(assert (= (and b!145304 res!121484) b!145305))

(assert (= (and b!145305 res!121481) b!145307))

(assert (= (and b!145307 res!121486) b!145302))

(assert (= (and b!145302 res!121482) b!145299))

(assert (= (and b!145299 res!121487) b!145298))

(assert (= (and b!145307 res!121492) b!145303))

(assert (= (and b!145303 res!121485) b!145309))

(assert (= (and b!145309 res!121483) b!145306))

(assert (= (and b!145306 (not res!121479)) b!145308))

(assert (= (and b!145307 res!121480) b!145296))

(assert (= (and b!145307 res!121489) b!145297))

(assert (= (and b!145307 res!121491) b!145295))

(assert (= start!28022 b!145301))

(declare-fun m!223505 () Bool)

(assert (=> b!145303 m!223505))

(declare-fun m!223507 () Bool)

(assert (=> b!145303 m!223507))

(declare-fun m!223509 () Bool)

(assert (=> b!145308 m!223509))

(declare-fun m!223511 () Bool)

(assert (=> b!145309 m!223511))

(declare-fun m!223513 () Bool)

(assert (=> b!145299 m!223513))

(declare-fun m!223515 () Bool)

(assert (=> b!145295 m!223515))

(declare-fun m!223517 () Bool)

(assert (=> b!145300 m!223517))

(declare-fun m!223519 () Bool)

(assert (=> start!28022 m!223519))

(declare-fun m!223521 () Bool)

(assert (=> start!28022 m!223521))

(assert (=> b!145302 m!223507))

(declare-fun m!223523 () Bool)

(assert (=> b!145302 m!223523))

(declare-fun m!223525 () Bool)

(assert (=> b!145305 m!223525))

(declare-fun m!223527 () Bool)

(assert (=> b!145307 m!223527))

(declare-fun m!223529 () Bool)

(assert (=> b!145307 m!223529))

(declare-fun m!223531 () Bool)

(assert (=> b!145307 m!223531))

(declare-fun m!223533 () Bool)

(assert (=> b!145307 m!223533))

(declare-fun m!223535 () Bool)

(assert (=> b!145307 m!223535))

(declare-fun m!223537 () Bool)

(assert (=> b!145307 m!223537))

(declare-fun m!223539 () Bool)

(assert (=> b!145307 m!223539))

(declare-fun m!223541 () Bool)

(assert (=> b!145307 m!223541))

(declare-fun m!223543 () Bool)

(assert (=> b!145307 m!223543))

(declare-fun m!223545 () Bool)

(assert (=> b!145307 m!223545))

(declare-fun m!223547 () Bool)

(assert (=> b!145307 m!223547))

(assert (=> b!145307 m!223545))

(declare-fun m!223549 () Bool)

(assert (=> b!145307 m!223549))

(declare-fun m!223551 () Bool)

(assert (=> b!145307 m!223551))

(declare-fun m!223553 () Bool)

(assert (=> b!145307 m!223553))

(declare-fun m!223555 () Bool)

(assert (=> b!145307 m!223555))

(declare-fun m!223557 () Bool)

(assert (=> b!145307 m!223557))

(declare-fun m!223559 () Bool)

(assert (=> b!145307 m!223559))

(declare-fun m!223561 () Bool)

(assert (=> b!145307 m!223561))

(declare-fun m!223563 () Bool)

(assert (=> b!145307 m!223563))

(declare-fun m!223565 () Bool)

(assert (=> b!145307 m!223565))

(declare-fun m!223567 () Bool)

(assert (=> b!145307 m!223567))

(assert (=> b!145298 m!223545))

(declare-fun m!223569 () Bool)

(assert (=> b!145298 m!223569))

(declare-fun m!223571 () Bool)

(assert (=> b!145298 m!223571))

(declare-fun m!223573 () Bool)

(assert (=> b!145296 m!223573))

(declare-fun m!223575 () Bool)

(assert (=> b!145301 m!223575))

(declare-fun m!223577 () Bool)

(assert (=> b!145306 m!223577))

(declare-fun m!223579 () Bool)

(assert (=> b!145306 m!223579))

(declare-fun m!223581 () Bool)

(assert (=> b!145306 m!223581))

(assert (=> b!145306 m!223533))

(push 1)

(assert (not b!145308))

(assert (not b!145298))

(assert (not b!145309))

(assert (not b!145305))

(assert (not b!145303))

(assert (not b!145307))

(assert (not b!145295))

(assert (not b!145299))

(assert (not b!145302))

(assert (not b!145306))

(assert (not b!145301))

(assert (not b!145296))

(assert (not b!145300))

(assert (not start!28022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

