; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53110 () Bool)

(assert start!53110)

(declare-fun b!246304 () Bool)

(declare-fun res!206031 () Bool)

(declare-fun e!170641 () Bool)

(assert (=> b!246304 (=> res!206031 e!170641)))

(declare-datatypes ((array!13438 0))(
  ( (array!13439 (arr!6878 (Array (_ BitVec 32) (_ BitVec 8))) (size!5891 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10704 0))(
  ( (BitStream!10705 (buf!6372 array!13438) (currentByte!11768 (_ BitVec 32)) (currentBit!11763 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21126 0))(
  ( (tuple2!21127 (_1!11485 BitStream!10704) (_2!11485 BitStream!10704)) )
))
(declare-fun lt!384261 () tuple2!21126)

(declare-fun lt!384253 () tuple2!21126)

(declare-fun withMovedBitIndex!0 (BitStream!10704 (_ BitVec 64)) BitStream!10704)

(assert (=> b!246304 (= res!206031 (not (= (_1!11485 lt!384261) (withMovedBitIndex!0 (_1!11485 lt!384253) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246305 () Bool)

(declare-fun e!170637 () Bool)

(assert (=> b!246305 (= e!170637 true)))

(declare-fun lt!384263 () (_ BitVec 64))

(declare-datatypes ((Unit!17894 0))(
  ( (Unit!17895) )
))
(declare-datatypes ((tuple2!21128 0))(
  ( (tuple2!21129 (_1!11486 Unit!17894) (_2!11486 BitStream!10704)) )
))
(declare-fun lt!384249 () tuple2!21128)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246305 (= lt!384263 (bitIndex!0 (size!5891 (buf!6372 (_2!11486 lt!384249))) (currentByte!11768 (_2!11486 lt!384249)) (currentBit!11763 (_2!11486 lt!384249))))))

(declare-fun lt!384270 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10704)

(assert (=> b!246305 (= lt!384270 (bitIndex!0 (size!5891 (buf!6372 thiss!1005)) (currentByte!11768 thiss!1005) (currentBit!11763 thiss!1005)))))

(declare-fun b!246306 () Bool)

(declare-fun res!206037 () Bool)

(declare-fun e!170642 () Bool)

(assert (=> b!246306 (=> (not res!206037) (not e!170642))))

(declare-fun lt!384262 () tuple2!21128)

(declare-fun isPrefixOf!0 (BitStream!10704 BitStream!10704) Bool)

(assert (=> b!246306 (= res!206037 (isPrefixOf!0 (_2!11486 lt!384262) (_2!11486 lt!384249)))))

(declare-fun b!246307 () Bool)

(declare-fun res!206028 () Bool)

(declare-fun e!170639 () Bool)

(assert (=> b!246307 (=> (not res!206028) (not e!170639))))

(assert (=> b!246307 (= res!206028 (isPrefixOf!0 thiss!1005 (_2!11486 lt!384262)))))

(declare-fun b!246308 () Bool)

(declare-datatypes ((tuple2!21130 0))(
  ( (tuple2!21131 (_1!11487 BitStream!10704) (_2!11487 Bool)) )
))
(declare-fun lt!384256 () tuple2!21130)

(declare-fun lt!384258 () tuple2!21126)

(assert (=> b!246308 (= e!170642 (not (or (not (_2!11487 lt!384256)) (not (= (_1!11487 lt!384256) (_2!11485 lt!384258))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10704 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21130)

(assert (=> b!246308 (= lt!384256 (checkBitsLoopPure!0 (_1!11485 lt!384258) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384269 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246308 (validate_offset_bits!1 ((_ sign_extend 32) (size!5891 (buf!6372 (_2!11486 lt!384249)))) ((_ sign_extend 32) (currentByte!11768 (_2!11486 lt!384262))) ((_ sign_extend 32) (currentBit!11763 (_2!11486 lt!384262))) lt!384269)))

(declare-fun lt!384250 () Unit!17894)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10704 array!13438 (_ BitVec 64)) Unit!17894)

(assert (=> b!246308 (= lt!384250 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11486 lt!384262) (buf!6372 (_2!11486 lt!384249)) lt!384269))))

(declare-fun reader!0 (BitStream!10704 BitStream!10704) tuple2!21126)

(assert (=> b!246308 (= lt!384258 (reader!0 (_2!11486 lt!384262) (_2!11486 lt!384249)))))

(declare-fun b!246309 () Bool)

(declare-fun e!170635 () Bool)

(declare-fun lt!384259 () tuple2!21130)

(declare-fun lt!384267 () tuple2!21130)

(assert (=> b!246309 (= e!170635 (= (_2!11487 lt!384259) (_2!11487 lt!384267)))))

(declare-fun res!206030 () Bool)

(declare-fun e!170638 () Bool)

(assert (=> start!53110 (=> (not res!206030) (not e!170638))))

(assert (=> start!53110 (= res!206030 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53110 e!170638))

(assert (=> start!53110 true))

(declare-fun e!170640 () Bool)

(declare-fun inv!12 (BitStream!10704) Bool)

(assert (=> start!53110 (and (inv!12 thiss!1005) e!170640)))

(declare-fun b!246310 () Bool)

(declare-fun e!170634 () Bool)

(declare-fun lt!384257 () tuple2!21130)

(declare-fun lt!384248 () (_ BitVec 64))

(assert (=> b!246310 (= e!170634 (= (bitIndex!0 (size!5891 (buf!6372 (_1!11487 lt!384257))) (currentByte!11768 (_1!11487 lt!384257)) (currentBit!11763 (_1!11487 lt!384257))) lt!384248))))

(declare-fun b!246311 () Bool)

(declare-fun res!206036 () Bool)

(assert (=> b!246311 (=> (not res!206036) (not e!170638))))

(assert (=> b!246311 (= res!206036 (bvslt from!289 nBits!297))))

(declare-fun b!246312 () Bool)

(assert (=> b!246312 (= e!170638 (not e!170641))))

(declare-fun res!206039 () Bool)

(assert (=> b!246312 (=> res!206039 e!170641)))

(declare-fun lt!384247 () tuple2!21130)

(assert (=> b!246312 (= res!206039 (not (= (_1!11487 lt!384247) (_2!11485 lt!384261))))))

(assert (=> b!246312 (= lt!384247 (checkBitsLoopPure!0 (_1!11485 lt!384261) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384251 () (_ BitVec 64))

(assert (=> b!246312 (validate_offset_bits!1 ((_ sign_extend 32) (size!5891 (buf!6372 (_2!11486 lt!384249)))) ((_ sign_extend 32) (currentByte!11768 (_2!11486 lt!384262))) ((_ sign_extend 32) (currentBit!11763 (_2!11486 lt!384262))) lt!384251)))

(declare-fun lt!384260 () Unit!17894)

(assert (=> b!246312 (= lt!384260 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11486 lt!384262) (buf!6372 (_2!11486 lt!384249)) lt!384251))))

(declare-fun lt!384265 () tuple2!21130)

(assert (=> b!246312 (= lt!384265 (checkBitsLoopPure!0 (_1!11485 lt!384253) nBits!297 bit!26 from!289))))

(assert (=> b!246312 (validate_offset_bits!1 ((_ sign_extend 32) (size!5891 (buf!6372 (_2!11486 lt!384249)))) ((_ sign_extend 32) (currentByte!11768 thiss!1005)) ((_ sign_extend 32) (currentBit!11763 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384268 () Unit!17894)

(assert (=> b!246312 (= lt!384268 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6372 (_2!11486 lt!384249)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10704) tuple2!21130)

(assert (=> b!246312 (= (_2!11487 (readBitPure!0 (_1!11485 lt!384253))) bit!26)))

(assert (=> b!246312 (= lt!384261 (reader!0 (_2!11486 lt!384262) (_2!11486 lt!384249)))))

(assert (=> b!246312 (= lt!384253 (reader!0 thiss!1005 (_2!11486 lt!384249)))))

(assert (=> b!246312 e!170635))

(declare-fun res!206038 () Bool)

(assert (=> b!246312 (=> (not res!206038) (not e!170635))))

(assert (=> b!246312 (= res!206038 (= (bitIndex!0 (size!5891 (buf!6372 (_1!11487 lt!384259))) (currentByte!11768 (_1!11487 lt!384259)) (currentBit!11763 (_1!11487 lt!384259))) (bitIndex!0 (size!5891 (buf!6372 (_1!11487 lt!384267))) (currentByte!11768 (_1!11487 lt!384267)) (currentBit!11763 (_1!11487 lt!384267)))))))

(declare-fun lt!384266 () Unit!17894)

(declare-fun lt!384254 () BitStream!10704)

(declare-fun readBitPrefixLemma!0 (BitStream!10704 BitStream!10704) Unit!17894)

(assert (=> b!246312 (= lt!384266 (readBitPrefixLemma!0 lt!384254 (_2!11486 lt!384249)))))

(assert (=> b!246312 (= lt!384267 (readBitPure!0 (BitStream!10705 (buf!6372 (_2!11486 lt!384249)) (currentByte!11768 thiss!1005) (currentBit!11763 thiss!1005))))))

(assert (=> b!246312 (= lt!384259 (readBitPure!0 lt!384254))))

(assert (=> b!246312 (= lt!384254 (BitStream!10705 (buf!6372 (_2!11486 lt!384262)) (currentByte!11768 thiss!1005) (currentBit!11763 thiss!1005)))))

(declare-fun e!170645 () Bool)

(assert (=> b!246312 e!170645))

(declare-fun res!206042 () Bool)

(assert (=> b!246312 (=> (not res!206042) (not e!170645))))

(assert (=> b!246312 (= res!206042 (isPrefixOf!0 thiss!1005 (_2!11486 lt!384249)))))

(declare-fun lt!384255 () Unit!17894)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10704 BitStream!10704 BitStream!10704) Unit!17894)

(assert (=> b!246312 (= lt!384255 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11486 lt!384262) (_2!11486 lt!384249)))))

(declare-fun e!170643 () Bool)

(assert (=> b!246312 e!170643))

(declare-fun res!206033 () Bool)

(assert (=> b!246312 (=> (not res!206033) (not e!170643))))

(assert (=> b!246312 (= res!206033 (= (size!5891 (buf!6372 (_2!11486 lt!384262))) (size!5891 (buf!6372 (_2!11486 lt!384249)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10704 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21128)

(assert (=> b!246312 (= lt!384249 (appendNBitsLoop!0 (_2!11486 lt!384262) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246312 (validate_offset_bits!1 ((_ sign_extend 32) (size!5891 (buf!6372 (_2!11486 lt!384262)))) ((_ sign_extend 32) (currentByte!11768 (_2!11486 lt!384262))) ((_ sign_extend 32) (currentBit!11763 (_2!11486 lt!384262))) lt!384251)))

(assert (=> b!246312 (= lt!384251 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384252 () Unit!17894)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10704 BitStream!10704 (_ BitVec 64) (_ BitVec 64)) Unit!17894)

(assert (=> b!246312 (= lt!384252 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11486 lt!384262) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!170636 () Bool)

(assert (=> b!246312 e!170636))

(declare-fun res!206043 () Bool)

(assert (=> b!246312 (=> (not res!206043) (not e!170636))))

(assert (=> b!246312 (= res!206043 (= (size!5891 (buf!6372 thiss!1005)) (size!5891 (buf!6372 (_2!11486 lt!384262)))))))

(declare-fun appendBit!0 (BitStream!10704 Bool) tuple2!21128)

(assert (=> b!246312 (= lt!384262 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246313 () Bool)

(declare-fun res!206035 () Bool)

(assert (=> b!246313 (=> (not res!206035) (not e!170645))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246313 (= res!206035 (invariant!0 (currentBit!11763 thiss!1005) (currentByte!11768 thiss!1005) (size!5891 (buf!6372 (_2!11486 lt!384262)))))))

(declare-fun b!246314 () Bool)

(assert (=> b!246314 (= e!170641 e!170637)))

(declare-fun res!206034 () Bool)

(assert (=> b!246314 (=> res!206034 e!170637)))

(assert (=> b!246314 (= res!206034 (not (= (size!5891 (buf!6372 thiss!1005)) (size!5891 (buf!6372 (_2!11486 lt!384249))))))))

(assert (=> b!246314 (and (= (_2!11487 lt!384265) (_2!11487 lt!384247)) (= (_1!11487 lt!384265) (_2!11485 lt!384253)))))

(declare-fun b!246315 () Bool)

(assert (=> b!246315 (= e!170636 e!170639)))

(declare-fun res!206029 () Bool)

(assert (=> b!246315 (=> (not res!206029) (not e!170639))))

(declare-fun lt!384264 () (_ BitVec 64))

(assert (=> b!246315 (= res!206029 (= lt!384248 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384264)))))

(assert (=> b!246315 (= lt!384248 (bitIndex!0 (size!5891 (buf!6372 (_2!11486 lt!384262))) (currentByte!11768 (_2!11486 lt!384262)) (currentBit!11763 (_2!11486 lt!384262))))))

(assert (=> b!246315 (= lt!384264 (bitIndex!0 (size!5891 (buf!6372 thiss!1005)) (currentByte!11768 thiss!1005) (currentBit!11763 thiss!1005)))))

(declare-fun b!246316 () Bool)

(assert (=> b!246316 (= e!170645 (invariant!0 (currentBit!11763 thiss!1005) (currentByte!11768 thiss!1005) (size!5891 (buf!6372 (_2!11486 lt!384249)))))))

(declare-fun b!246317 () Bool)

(assert (=> b!246317 (= e!170639 e!170634)))

(declare-fun res!206040 () Bool)

(assert (=> b!246317 (=> (not res!206040) (not e!170634))))

(assert (=> b!246317 (= res!206040 (and (= (_2!11487 lt!384257) bit!26) (= (_1!11487 lt!384257) (_2!11486 lt!384262))))))

(declare-fun readerFrom!0 (BitStream!10704 (_ BitVec 32) (_ BitVec 32)) BitStream!10704)

(assert (=> b!246317 (= lt!384257 (readBitPure!0 (readerFrom!0 (_2!11486 lt!384262) (currentBit!11763 thiss!1005) (currentByte!11768 thiss!1005))))))

(declare-fun b!246318 () Bool)

(declare-fun res!206032 () Bool)

(assert (=> b!246318 (=> (not res!206032) (not e!170638))))

(assert (=> b!246318 (= res!206032 (validate_offset_bits!1 ((_ sign_extend 32) (size!5891 (buf!6372 thiss!1005))) ((_ sign_extend 32) (currentByte!11768 thiss!1005)) ((_ sign_extend 32) (currentBit!11763 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246319 () Bool)

(declare-fun array_inv!5632 (array!13438) Bool)

(assert (=> b!246319 (= e!170640 (array_inv!5632 (buf!6372 thiss!1005)))))

(declare-fun b!246320 () Bool)

(assert (=> b!246320 (= e!170643 e!170642)))

(declare-fun res!206041 () Bool)

(assert (=> b!246320 (=> (not res!206041) (not e!170642))))

(assert (=> b!246320 (= res!206041 (= (bitIndex!0 (size!5891 (buf!6372 (_2!11486 lt!384249))) (currentByte!11768 (_2!11486 lt!384249)) (currentBit!11763 (_2!11486 lt!384249))) (bvadd (bitIndex!0 (size!5891 (buf!6372 (_2!11486 lt!384262))) (currentByte!11768 (_2!11486 lt!384262)) (currentBit!11763 (_2!11486 lt!384262))) lt!384269)))))

(assert (=> b!246320 (= lt!384269 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!53110 res!206030) b!246318))

(assert (= (and b!246318 res!206032) b!246311))

(assert (= (and b!246311 res!206036) b!246312))

(assert (= (and b!246312 res!206043) b!246315))

(assert (= (and b!246315 res!206029) b!246307))

(assert (= (and b!246307 res!206028) b!246317))

(assert (= (and b!246317 res!206040) b!246310))

(assert (= (and b!246312 res!206033) b!246320))

(assert (= (and b!246320 res!206041) b!246306))

(assert (= (and b!246306 res!206037) b!246308))

(assert (= (and b!246312 res!206042) b!246313))

(assert (= (and b!246313 res!206035) b!246316))

(assert (= (and b!246312 res!206038) b!246309))

(assert (= (and b!246312 (not res!206039)) b!246304))

(assert (= (and b!246304 (not res!206031)) b!246314))

(assert (= (and b!246314 (not res!206034)) b!246305))

(assert (= start!53110 b!246319))

(declare-fun m!371479 () Bool)

(assert (=> b!246304 m!371479))

(declare-fun m!371481 () Bool)

(assert (=> b!246317 m!371481))

(assert (=> b!246317 m!371481))

(declare-fun m!371483 () Bool)

(assert (=> b!246317 m!371483))

(declare-fun m!371485 () Bool)

(assert (=> start!53110 m!371485))

(declare-fun m!371487 () Bool)

(assert (=> b!246310 m!371487))

(declare-fun m!371489 () Bool)

(assert (=> b!246305 m!371489))

(declare-fun m!371491 () Bool)

(assert (=> b!246305 m!371491))

(assert (=> b!246320 m!371489))

(declare-fun m!371493 () Bool)

(assert (=> b!246320 m!371493))

(declare-fun m!371495 () Bool)

(assert (=> b!246312 m!371495))

(declare-fun m!371497 () Bool)

(assert (=> b!246312 m!371497))

(declare-fun m!371499 () Bool)

(assert (=> b!246312 m!371499))

(declare-fun m!371501 () Bool)

(assert (=> b!246312 m!371501))

(declare-fun m!371503 () Bool)

(assert (=> b!246312 m!371503))

(declare-fun m!371505 () Bool)

(assert (=> b!246312 m!371505))

(declare-fun m!371507 () Bool)

(assert (=> b!246312 m!371507))

(declare-fun m!371509 () Bool)

(assert (=> b!246312 m!371509))

(declare-fun m!371511 () Bool)

(assert (=> b!246312 m!371511))

(declare-fun m!371513 () Bool)

(assert (=> b!246312 m!371513))

(declare-fun m!371515 () Bool)

(assert (=> b!246312 m!371515))

(declare-fun m!371517 () Bool)

(assert (=> b!246312 m!371517))

(declare-fun m!371519 () Bool)

(assert (=> b!246312 m!371519))

(declare-fun m!371521 () Bool)

(assert (=> b!246312 m!371521))

(declare-fun m!371523 () Bool)

(assert (=> b!246312 m!371523))

(declare-fun m!371525 () Bool)

(assert (=> b!246312 m!371525))

(declare-fun m!371527 () Bool)

(assert (=> b!246312 m!371527))

(declare-fun m!371529 () Bool)

(assert (=> b!246312 m!371529))

(declare-fun m!371531 () Bool)

(assert (=> b!246312 m!371531))

(declare-fun m!371533 () Bool)

(assert (=> b!246312 m!371533))

(declare-fun m!371535 () Bool)

(assert (=> b!246308 m!371535))

(declare-fun m!371537 () Bool)

(assert (=> b!246308 m!371537))

(declare-fun m!371539 () Bool)

(assert (=> b!246308 m!371539))

(assert (=> b!246308 m!371523))

(declare-fun m!371541 () Bool)

(assert (=> b!246307 m!371541))

(declare-fun m!371543 () Bool)

(assert (=> b!246319 m!371543))

(declare-fun m!371545 () Bool)

(assert (=> b!246306 m!371545))

(assert (=> b!246315 m!371493))

(assert (=> b!246315 m!371491))

(declare-fun m!371547 () Bool)

(assert (=> b!246313 m!371547))

(declare-fun m!371549 () Bool)

(assert (=> b!246318 m!371549))

(declare-fun m!371551 () Bool)

(assert (=> b!246316 m!371551))

(check-sat (not start!53110) (not b!246305) (not b!246315) (not b!246313) (not b!246307) (not b!246319) (not b!246317) (not b!246308) (not b!246312) (not b!246310) (not b!246304) (not b!246320) (not b!246306) (not b!246316) (not b!246318))
