; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27808 () Bool)

(assert start!27808)

(declare-fun b!143584 () Bool)

(declare-fun e!95660 () Bool)

(declare-fun e!95654 () Bool)

(assert (=> b!143584 (= e!95660 e!95654)))

(declare-fun res!119933 () Bool)

(assert (=> b!143584 (=> (not res!119933) (not e!95654))))

(declare-datatypes ((array!6565 0))(
  ( (array!6566 (arr!3695 (Array (_ BitVec 32) (_ BitVec 8))) (size!2972 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5202 0))(
  ( (BitStream!5203 (buf!3401 array!6565) (currentByte!6285 (_ BitVec 32)) (currentBit!6280 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8944 0))(
  ( (Unit!8945) )
))
(declare-datatypes ((tuple2!12808 0))(
  ( (tuple2!12809 (_1!6745 Unit!8944) (_2!6745 BitStream!5202)) )
))
(declare-fun lt!222493 () tuple2!12808)

(declare-fun lt!222486 () tuple2!12808)

(declare-fun lt!222488 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!143584 (= res!119933 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493))) (bvadd (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!222488))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!143584 (= lt!222488 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!143585 () Bool)

(declare-fun e!95658 () Bool)

(declare-datatypes ((tuple2!12810 0))(
  ( (tuple2!12811 (_1!6746 BitStream!5202) (_2!6746 (_ BitVec 8))) )
))
(declare-fun lt!222498 () tuple2!12810)

(declare-fun lt!222501 () tuple2!12810)

(assert (=> b!143585 (= e!95658 (= (_2!6746 lt!222498) (_2!6746 lt!222501)))))

(declare-fun b!143586 () Bool)

(declare-fun res!119936 () Bool)

(declare-fun e!95659 () Bool)

(assert (=> b!143586 (=> (not res!119936) (not e!95659))))

(declare-fun thiss!1634 () BitStream!5202)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!143586 (= res!119936 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!143587 () Bool)

(declare-fun res!119945 () Bool)

(declare-fun e!95655 () Bool)

(assert (=> b!143587 (=> (not res!119945) (not e!95655))))

(declare-fun isPrefixOf!0 (BitStream!5202 BitStream!5202) Bool)

(assert (=> b!143587 (= res!119945 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222486)))))

(declare-fun b!143588 () Bool)

(declare-fun res!119938 () Bool)

(assert (=> b!143588 (=> (not res!119938) (not e!95659))))

(assert (=> b!143588 (= res!119938 (bvslt from!447 to!404))))

(declare-fun b!143589 () Bool)

(declare-fun res!119942 () Bool)

(assert (=> b!143589 (=> (not res!119942) (not e!95659))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143589 (= res!119942 (invariant!0 (currentBit!6280 thiss!1634) (currentByte!6285 thiss!1634) (size!2972 (buf!3401 thiss!1634))))))

(declare-fun b!143590 () Bool)

(declare-fun res!119944 () Bool)

(assert (=> b!143590 (=> (not res!119944) (not e!95655))))

(assert (=> b!143590 (= res!119944 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))))

(declare-fun b!143591 () Bool)

(declare-fun e!95656 () Bool)

(assert (=> b!143591 (= e!95654 (not e!95656))))

(declare-fun res!119940 () Bool)

(assert (=> b!143591 (=> res!119940 e!95656)))

(declare-datatypes ((tuple2!12812 0))(
  ( (tuple2!12813 (_1!6747 BitStream!5202) (_2!6747 BitStream!5202)) )
))
(declare-fun lt!222494 () tuple2!12812)

(declare-fun arr!237 () array!6565)

(declare-datatypes ((tuple2!12814 0))(
  ( (tuple2!12815 (_1!6748 BitStream!5202) (_2!6748 array!6565)) )
))
(declare-fun lt!222489 () tuple2!12814)

(assert (=> b!143591 (= res!119940 (or (not (= (size!2972 (_2!6748 lt!222489)) (size!2972 arr!237))) (not (= (_1!6748 lt!222489) (_2!6747 lt!222494)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5202 array!6565 (_ BitVec 32) (_ BitVec 32)) tuple2!12814)

(assert (=> b!143591 (= lt!222489 (readByteArrayLoopPure!0 (_1!6747 lt!222494) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143591 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!222488)))

(declare-fun lt!222496 () Unit!8944)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5202 array!6565 (_ BitVec 64)) Unit!8944)

(assert (=> b!143591 (= lt!222496 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!222493)) lt!222488))))

(declare-fun reader!0 (BitStream!5202 BitStream!5202) tuple2!12812)

(assert (=> b!143591 (= lt!222494 (reader!0 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(declare-fun b!143592 () Bool)

(declare-fun arrayRangesEq!288 (array!6565 array!6565 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143592 (= e!95656 (not (arrayRangesEq!288 arr!237 (_2!6748 lt!222489) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!119934 () Bool)

(assert (=> start!27808 (=> (not res!119934) (not e!95659))))

(assert (=> start!27808 (= res!119934 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2972 arr!237))))))

(assert (=> start!27808 e!95659))

(assert (=> start!27808 true))

(declare-fun array_inv!2761 (array!6565) Bool)

(assert (=> start!27808 (array_inv!2761 arr!237)))

(declare-fun e!95657 () Bool)

(declare-fun inv!12 (BitStream!5202) Bool)

(assert (=> start!27808 (and (inv!12 thiss!1634) e!95657)))

(declare-fun b!143593 () Bool)

(declare-fun lt!222487 () tuple2!12812)

(assert (=> b!143593 (= e!95659 (not (= (_1!6748 (readByteArrayLoopPure!0 (_1!6747 lt!222487) arr!237 from!447 to!404)) (_2!6747 lt!222487))))))

(assert (=> b!143593 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!222491 () Unit!8944)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5202 array!6565 (_ BitVec 32)) Unit!8944)

(assert (=> b!143593 (= lt!222491 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3401 (_2!6745 lt!222493)) (bvsub to!404 from!447)))))

(declare-fun readBytePure!0 (BitStream!5202) tuple2!12810)

(assert (=> b!143593 (= (_2!6746 (readBytePure!0 (_1!6747 lt!222487))) (select (arr!3695 arr!237) from!447))))

(declare-fun lt!222500 () tuple2!12812)

(assert (=> b!143593 (= lt!222500 (reader!0 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(assert (=> b!143593 (= lt!222487 (reader!0 thiss!1634 (_2!6745 lt!222493)))))

(assert (=> b!143593 e!95658))

(declare-fun res!119935 () Bool)

(assert (=> b!143593 (=> (not res!119935) (not e!95658))))

(assert (=> b!143593 (= res!119935 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!222498))) (currentByte!6285 (_1!6746 lt!222498)) (currentBit!6280 (_1!6746 lt!222498))) (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!222501))) (currentByte!6285 (_1!6746 lt!222501)) (currentBit!6280 (_1!6746 lt!222501)))))))

(declare-fun lt!222502 () Unit!8944)

(declare-fun lt!222492 () BitStream!5202)

(declare-fun readBytePrefixLemma!0 (BitStream!5202 BitStream!5202) Unit!8944)

(assert (=> b!143593 (= lt!222502 (readBytePrefixLemma!0 lt!222492 (_2!6745 lt!222493)))))

(assert (=> b!143593 (= lt!222501 (readBytePure!0 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (=> b!143593 (= lt!222498 (readBytePure!0 lt!222492))))

(assert (=> b!143593 (= lt!222492 (BitStream!5203 (buf!3401 (_2!6745 lt!222486)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(declare-fun e!95661 () Bool)

(assert (=> b!143593 e!95661))

(declare-fun res!119937 () Bool)

(assert (=> b!143593 (=> (not res!119937) (not e!95661))))

(assert (=> b!143593 (= res!119937 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222493)))))

(declare-fun lt!222495 () Unit!8944)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5202 BitStream!5202 BitStream!5202) Unit!8944)

(assert (=> b!143593 (= lt!222495 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(assert (=> b!143593 e!95660))

(declare-fun res!119941 () Bool)

(assert (=> b!143593 (=> (not res!119941) (not e!95660))))

(assert (=> b!143593 (= res!119941 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5202 array!6565 (_ BitVec 32) (_ BitVec 32)) tuple2!12808)

(assert (=> b!143593 (= lt!222493 (appendByteArrayLoop!0 (_2!6745 lt!222486) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!143593 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!222499 () Unit!8944)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5202 BitStream!5202 (_ BitVec 64) (_ BitVec 32)) Unit!8944)

(assert (=> b!143593 (= lt!222499 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6745 lt!222486) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!143593 e!95655))

(declare-fun res!119943 () Bool)

(assert (=> b!143593 (=> (not res!119943) (not e!95655))))

(assert (=> b!143593 (= res!119943 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(declare-fun appendByte!0 (BitStream!5202 (_ BitVec 8)) tuple2!12808)

(assert (=> b!143593 (= lt!222486 (appendByte!0 thiss!1634 (select (arr!3695 arr!237) from!447)))))

(declare-fun b!143594 () Bool)

(assert (=> b!143594 (= e!95657 (array_inv!2761 (buf!3401 thiss!1634)))))

(declare-fun b!143595 () Bool)

(assert (=> b!143595 (= e!95661 (invariant!0 (currentBit!6280 thiss!1634) (currentByte!6285 thiss!1634) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(declare-fun b!143596 () Bool)

(declare-fun res!119939 () Bool)

(assert (=> b!143596 (=> (not res!119939) (not e!95654))))

(assert (=> b!143596 (= res!119939 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(declare-fun b!143597 () Bool)

(declare-fun lt!222497 () tuple2!12810)

(declare-fun lt!222490 () tuple2!12812)

(assert (=> b!143597 (= e!95655 (and (= (_2!6746 lt!222497) (select (arr!3695 arr!237) from!447)) (= (_1!6746 lt!222497) (_2!6747 lt!222490))))))

(assert (=> b!143597 (= lt!222497 (readBytePure!0 (_1!6747 lt!222490)))))

(assert (=> b!143597 (= lt!222490 (reader!0 thiss!1634 (_2!6745 lt!222486)))))

(assert (= (and start!27808 res!119934) b!143586))

(assert (= (and b!143586 res!119936) b!143588))

(assert (= (and b!143588 res!119938) b!143589))

(assert (= (and b!143589 res!119942) b!143593))

(assert (= (and b!143593 res!119943) b!143590))

(assert (= (and b!143590 res!119944) b!143587))

(assert (= (and b!143587 res!119945) b!143597))

(assert (= (and b!143593 res!119941) b!143584))

(assert (= (and b!143584 res!119933) b!143596))

(assert (= (and b!143596 res!119939) b!143591))

(assert (= (and b!143591 (not res!119940)) b!143592))

(assert (= (and b!143593 res!119937) b!143595))

(assert (= (and b!143593 res!119935) b!143585))

(assert (= start!27808 b!143594))

(declare-fun m!220451 () Bool)

(assert (=> b!143586 m!220451))

(declare-fun m!220453 () Bool)

(assert (=> start!27808 m!220453))

(declare-fun m!220455 () Bool)

(assert (=> start!27808 m!220455))

(declare-fun m!220457 () Bool)

(assert (=> b!143597 m!220457))

(declare-fun m!220459 () Bool)

(assert (=> b!143597 m!220459))

(declare-fun m!220461 () Bool)

(assert (=> b!143597 m!220461))

(declare-fun m!220463 () Bool)

(assert (=> b!143594 m!220463))

(declare-fun m!220465 () Bool)

(assert (=> b!143593 m!220465))

(declare-fun m!220467 () Bool)

(assert (=> b!143593 m!220467))

(declare-fun m!220469 () Bool)

(assert (=> b!143593 m!220469))

(declare-fun m!220471 () Bool)

(assert (=> b!143593 m!220471))

(declare-fun m!220473 () Bool)

(assert (=> b!143593 m!220473))

(declare-fun m!220475 () Bool)

(assert (=> b!143593 m!220475))

(declare-fun m!220477 () Bool)

(assert (=> b!143593 m!220477))

(declare-fun m!220479 () Bool)

(assert (=> b!143593 m!220479))

(declare-fun m!220481 () Bool)

(assert (=> b!143593 m!220481))

(declare-fun m!220483 () Bool)

(assert (=> b!143593 m!220483))

(declare-fun m!220485 () Bool)

(assert (=> b!143593 m!220485))

(assert (=> b!143593 m!220457))

(declare-fun m!220487 () Bool)

(assert (=> b!143593 m!220487))

(declare-fun m!220489 () Bool)

(assert (=> b!143593 m!220489))

(declare-fun m!220491 () Bool)

(assert (=> b!143593 m!220491))

(declare-fun m!220493 () Bool)

(assert (=> b!143593 m!220493))

(declare-fun m!220495 () Bool)

(assert (=> b!143593 m!220495))

(assert (=> b!143593 m!220457))

(declare-fun m!220497 () Bool)

(assert (=> b!143593 m!220497))

(declare-fun m!220499 () Bool)

(assert (=> b!143587 m!220499))

(declare-fun m!220501 () Bool)

(assert (=> b!143584 m!220501))

(declare-fun m!220503 () Bool)

(assert (=> b!143584 m!220503))

(declare-fun m!220505 () Bool)

(assert (=> b!143596 m!220505))

(assert (=> b!143590 m!220503))

(declare-fun m!220507 () Bool)

(assert (=> b!143590 m!220507))

(declare-fun m!220509 () Bool)

(assert (=> b!143595 m!220509))

(declare-fun m!220511 () Bool)

(assert (=> b!143589 m!220511))

(declare-fun m!220513 () Bool)

(assert (=> b!143592 m!220513))

(declare-fun m!220515 () Bool)

(assert (=> b!143591 m!220515))

(declare-fun m!220517 () Bool)

(assert (=> b!143591 m!220517))

(declare-fun m!220519 () Bool)

(assert (=> b!143591 m!220519))

(assert (=> b!143591 m!220473))

(check-sat (not b!143586) (not b!143594) (not start!27808) (not b!143593) (not b!143596) (not b!143590) (not b!143595) (not b!143584) (not b!143587) (not b!143592) (not b!143591) (not b!143589) (not b!143597))
(check-sat)
(get-model)

(declare-fun d!45910 () Bool)

(declare-datatypes ((tuple2!12826 0))(
  ( (tuple2!12827 (_1!6755 (_ BitVec 8)) (_2!6755 BitStream!5202)) )
))
(declare-fun lt!222772 () tuple2!12826)

(declare-fun readByte!0 (BitStream!5202) tuple2!12826)

(assert (=> d!45910 (= lt!222772 (readByte!0 (_1!6747 lt!222490)))))

(assert (=> d!45910 (= (readBytePure!0 (_1!6747 lt!222490)) (tuple2!12811 (_2!6755 lt!222772) (_1!6755 lt!222772)))))

(declare-fun bs!11270 () Bool)

(assert (= bs!11270 d!45910))

(declare-fun m!220727 () Bool)

(assert (=> bs!11270 m!220727))

(assert (=> b!143597 d!45910))

(declare-fun b!143766 () Bool)

(declare-fun e!95762 () Unit!8944)

(declare-fun lt!222908 () Unit!8944)

(assert (=> b!143766 (= e!95762 lt!222908)))

(declare-fun lt!222902 () (_ BitVec 64))

(assert (=> b!143766 (= lt!222902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!222900 () (_ BitVec 64))

(assert (=> b!143766 (= lt!222900 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6565 array!6565 (_ BitVec 64) (_ BitVec 64)) Unit!8944)

(assert (=> b!143766 (= lt!222908 (arrayBitRangesEqSymmetric!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222486)) lt!222902 lt!222900))))

(declare-fun arrayBitRangesEq!0 (array!6565 array!6565 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!143766 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 thiss!1634) lt!222902 lt!222900)))

(declare-fun b!143767 () Bool)

(declare-fun res!120092 () Bool)

(declare-fun e!95763 () Bool)

(assert (=> b!143767 (=> (not res!120092) (not e!95763))))

(declare-fun lt!222913 () tuple2!12812)

(assert (=> b!143767 (= res!120092 (isPrefixOf!0 (_2!6747 lt!222913) (_2!6745 lt!222486)))))

(declare-fun b!143768 () Bool)

(declare-fun lt!222905 () (_ BitVec 64))

(declare-fun lt!222910 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5202 (_ BitVec 64)) BitStream!5202)

(assert (=> b!143768 (= e!95763 (= (_1!6747 lt!222913) (withMovedBitIndex!0 (_2!6747 lt!222913) (bvsub lt!222905 lt!222910))))))

(assert (=> b!143768 (or (= (bvand lt!222905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222905 lt!222910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143768 (= lt!222910 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(assert (=> b!143768 (= lt!222905 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(declare-fun d!45914 () Bool)

(assert (=> d!45914 e!95763))

(declare-fun res!120091 () Bool)

(assert (=> d!45914 (=> (not res!120091) (not e!95763))))

(assert (=> d!45914 (= res!120091 (isPrefixOf!0 (_1!6747 lt!222913) (_2!6747 lt!222913)))))

(declare-fun lt!222906 () BitStream!5202)

(assert (=> d!45914 (= lt!222913 (tuple2!12813 lt!222906 (_2!6745 lt!222486)))))

(declare-fun lt!222907 () Unit!8944)

(declare-fun lt!222898 () Unit!8944)

(assert (=> d!45914 (= lt!222907 lt!222898)))

(assert (=> d!45914 (isPrefixOf!0 lt!222906 (_2!6745 lt!222486))))

(assert (=> d!45914 (= lt!222898 (lemmaIsPrefixTransitive!0 lt!222906 (_2!6745 lt!222486) (_2!6745 lt!222486)))))

(declare-fun lt!222896 () Unit!8944)

(declare-fun lt!222911 () Unit!8944)

(assert (=> d!45914 (= lt!222896 lt!222911)))

(assert (=> d!45914 (isPrefixOf!0 lt!222906 (_2!6745 lt!222486))))

(assert (=> d!45914 (= lt!222911 (lemmaIsPrefixTransitive!0 lt!222906 thiss!1634 (_2!6745 lt!222486)))))

(declare-fun lt!222897 () Unit!8944)

(assert (=> d!45914 (= lt!222897 e!95762)))

(declare-fun c!7853 () Bool)

(assert (=> d!45914 (= c!7853 (not (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!222909 () Unit!8944)

(declare-fun lt!222899 () Unit!8944)

(assert (=> d!45914 (= lt!222909 lt!222899)))

(assert (=> d!45914 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222486))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5202) Unit!8944)

(assert (=> d!45914 (= lt!222899 (lemmaIsPrefixRefl!0 (_2!6745 lt!222486)))))

(declare-fun lt!222912 () Unit!8944)

(declare-fun lt!222903 () Unit!8944)

(assert (=> d!45914 (= lt!222912 lt!222903)))

(assert (=> d!45914 (= lt!222903 (lemmaIsPrefixRefl!0 (_2!6745 lt!222486)))))

(declare-fun lt!222895 () Unit!8944)

(declare-fun lt!222904 () Unit!8944)

(assert (=> d!45914 (= lt!222895 lt!222904)))

(assert (=> d!45914 (isPrefixOf!0 lt!222906 lt!222906)))

(assert (=> d!45914 (= lt!222904 (lemmaIsPrefixRefl!0 lt!222906))))

(declare-fun lt!222914 () Unit!8944)

(declare-fun lt!222901 () Unit!8944)

(assert (=> d!45914 (= lt!222914 lt!222901)))

(assert (=> d!45914 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45914 (= lt!222901 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45914 (= lt!222906 (BitStream!5203 (buf!3401 (_2!6745 lt!222486)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(assert (=> d!45914 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222486))))

(assert (=> d!45914 (= (reader!0 thiss!1634 (_2!6745 lt!222486)) lt!222913)))

(declare-fun b!143769 () Bool)

(declare-fun res!120093 () Bool)

(assert (=> b!143769 (=> (not res!120093) (not e!95763))))

(assert (=> b!143769 (= res!120093 (isPrefixOf!0 (_1!6747 lt!222913) thiss!1634))))

(declare-fun b!143770 () Bool)

(declare-fun Unit!8952 () Unit!8944)

(assert (=> b!143770 (= e!95762 Unit!8952)))

(assert (= (and d!45914 c!7853) b!143766))

(assert (= (and d!45914 (not c!7853)) b!143770))

(assert (= (and d!45914 res!120091) b!143769))

(assert (= (and b!143769 res!120093) b!143767))

(assert (= (and b!143767 res!120092) b!143768))

(declare-fun m!220795 () Bool)

(assert (=> b!143767 m!220795))

(declare-fun m!220797 () Bool)

(assert (=> b!143769 m!220797))

(declare-fun m!220799 () Bool)

(assert (=> b!143768 m!220799))

(assert (=> b!143768 m!220503))

(assert (=> b!143768 m!220507))

(assert (=> b!143766 m!220507))

(declare-fun m!220801 () Bool)

(assert (=> b!143766 m!220801))

(declare-fun m!220803 () Bool)

(assert (=> b!143766 m!220803))

(declare-fun m!220805 () Bool)

(assert (=> d!45914 m!220805))

(declare-fun m!220807 () Bool)

(assert (=> d!45914 m!220807))

(assert (=> d!45914 m!220499))

(declare-fun m!220809 () Bool)

(assert (=> d!45914 m!220809))

(declare-fun m!220811 () Bool)

(assert (=> d!45914 m!220811))

(declare-fun m!220813 () Bool)

(assert (=> d!45914 m!220813))

(declare-fun m!220815 () Bool)

(assert (=> d!45914 m!220815))

(declare-fun m!220817 () Bool)

(assert (=> d!45914 m!220817))

(declare-fun m!220819 () Bool)

(assert (=> d!45914 m!220819))

(declare-fun m!220821 () Bool)

(assert (=> d!45914 m!220821))

(declare-fun m!220823 () Bool)

(assert (=> d!45914 m!220823))

(assert (=> b!143597 d!45914))

(declare-fun d!45939 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45939 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11276 () Bool)

(assert (= bs!11276 d!45939))

(declare-fun m!220825 () Bool)

(assert (=> bs!11276 m!220825))

(assert (=> b!143586 d!45939))

(declare-fun d!45941 () Bool)

(declare-fun res!120100 () Bool)

(declare-fun e!95769 () Bool)

(assert (=> d!45941 (=> (not res!120100) (not e!95769))))

(assert (=> d!45941 (= res!120100 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (=> d!45941 (= (isPrefixOf!0 thiss!1634 (_2!6745 lt!222486)) e!95769)))

(declare-fun b!143777 () Bool)

(declare-fun res!120102 () Bool)

(assert (=> b!143777 (=> (not res!120102) (not e!95769))))

(assert (=> b!143777 (= res!120102 (bvsle (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun b!143778 () Bool)

(declare-fun e!95768 () Bool)

(assert (=> b!143778 (= e!95769 e!95768)))

(declare-fun res!120101 () Bool)

(assert (=> b!143778 (=> res!120101 e!95768)))

(assert (=> b!143778 (= res!120101 (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143779 () Bool)

(assert (=> b!143779 (= e!95768 (arrayBitRangesEq!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (= (and d!45941 res!120100) b!143777))

(assert (= (and b!143777 res!120102) b!143778))

(assert (= (and b!143778 (not res!120101)) b!143779))

(assert (=> b!143777 m!220507))

(assert (=> b!143777 m!220503))

(assert (=> b!143779 m!220507))

(assert (=> b!143779 m!220507))

(declare-fun m!220827 () Bool)

(assert (=> b!143779 m!220827))

(assert (=> b!143587 d!45941))

(declare-fun d!45943 () Bool)

(declare-fun e!95772 () Bool)

(assert (=> d!45943 e!95772))

(declare-fun res!120108 () Bool)

(assert (=> d!45943 (=> (not res!120108) (not e!95772))))

(declare-fun lt!222932 () (_ BitVec 64))

(declare-fun lt!222928 () (_ BitVec 64))

(declare-fun lt!222927 () (_ BitVec 64))

(assert (=> d!45943 (= res!120108 (= lt!222927 (bvsub lt!222932 lt!222928)))))

(assert (=> d!45943 (or (= (bvand lt!222932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222932 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222932 lt!222928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45943 (= lt!222928 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222493))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun lt!222929 () (_ BitVec 64))

(declare-fun lt!222931 () (_ BitVec 64))

(assert (=> d!45943 (= lt!222932 (bvmul lt!222929 lt!222931))))

(assert (=> d!45943 (or (= lt!222929 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222931 (bvsdiv (bvmul lt!222929 lt!222931) lt!222929)))))

(assert (=> d!45943 (= lt!222931 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45943 (= lt!222929 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!45943 (= lt!222927 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222493))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222493)))))))

(assert (=> d!45943 (invariant!0 (currentBit!6280 (_2!6745 lt!222493)) (currentByte!6285 (_2!6745 lt!222493)) (size!2972 (buf!3401 (_2!6745 lt!222493))))))

(assert (=> d!45943 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493))) lt!222927)))

(declare-fun b!143784 () Bool)

(declare-fun res!120107 () Bool)

(assert (=> b!143784 (=> (not res!120107) (not e!95772))))

(assert (=> b!143784 (= res!120107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222927))))

(declare-fun b!143785 () Bool)

(declare-fun lt!222930 () (_ BitVec 64))

(assert (=> b!143785 (= e!95772 (bvsle lt!222927 (bvmul lt!222930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143785 (or (= lt!222930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222930)))))

(assert (=> b!143785 (= lt!222930 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (= (and d!45943 res!120108) b!143784))

(assert (= (and b!143784 res!120107) b!143785))

(declare-fun m!220829 () Bool)

(assert (=> d!45943 m!220829))

(declare-fun m!220831 () Bool)

(assert (=> d!45943 m!220831))

(assert (=> b!143584 d!45943))

(declare-fun d!45945 () Bool)

(declare-fun e!95773 () Bool)

(assert (=> d!45945 e!95773))

(declare-fun res!120110 () Bool)

(assert (=> d!45945 (=> (not res!120110) (not e!95773))))

(declare-fun lt!222940 () (_ BitVec 64))

(declare-fun lt!222935 () (_ BitVec 64))

(declare-fun lt!222936 () (_ BitVec 64))

(assert (=> d!45945 (= res!120110 (= lt!222935 (bvsub lt!222940 lt!222936)))))

(assert (=> d!45945 (or (= (bvand lt!222940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!222936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222940 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222940 lt!222936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45945 (= lt!222936 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun lt!222937 () (_ BitVec 64))

(declare-fun lt!222939 () (_ BitVec 64))

(assert (=> d!45945 (= lt!222940 (bvmul lt!222937 lt!222939))))

(assert (=> d!45945 (or (= lt!222937 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!222939 (bvsdiv (bvmul lt!222937 lt!222939) lt!222937)))))

(assert (=> d!45945 (= lt!222939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45945 (= lt!222937 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (=> d!45945 (= lt!222935 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (=> d!45945 (invariant!0 (currentBit!6280 (_2!6745 lt!222486)) (currentByte!6285 (_2!6745 lt!222486)) (size!2972 (buf!3401 (_2!6745 lt!222486))))))

(assert (=> d!45945 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) lt!222935)))

(declare-fun b!143786 () Bool)

(declare-fun res!120109 () Bool)

(assert (=> b!143786 (=> (not res!120109) (not e!95773))))

(assert (=> b!143786 (= res!120109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222935))))

(declare-fun b!143787 () Bool)

(declare-fun lt!222938 () (_ BitVec 64))

(assert (=> b!143787 (= e!95773 (bvsle lt!222935 (bvmul lt!222938 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143787 (or (= lt!222938 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!222938 #b0000000000000000000000000000000000000000000000000000000000001000) lt!222938)))))

(assert (=> b!143787 (= lt!222938 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (= (and d!45945 res!120110) b!143786))

(assert (= (and b!143786 res!120109) b!143787))

(declare-fun m!220833 () Bool)

(assert (=> d!45945 m!220833))

(declare-fun m!220835 () Bool)

(assert (=> d!45945 m!220835))

(assert (=> b!143584 d!45945))

(declare-fun d!45947 () Bool)

(assert (=> d!45947 (= (array_inv!2761 (buf!3401 thiss!1634)) (bvsge (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!143594 d!45947))

(declare-fun d!45949 () Bool)

(assert (=> d!45949 (= (array_inv!2761 arr!237) (bvsge (size!2972 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27808 d!45949))

(declare-fun d!45951 () Bool)

(assert (=> d!45951 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6280 thiss!1634) (currentByte!6285 thiss!1634) (size!2972 (buf!3401 thiss!1634))))))

(declare-fun bs!11277 () Bool)

(assert (= bs!11277 d!45951))

(assert (=> bs!11277 m!220511))

(assert (=> start!27808 d!45951))

(declare-fun d!45953 () Bool)

(declare-fun res!120117 () Bool)

(declare-fun e!95777 () Bool)

(assert (=> d!45953 (=> (not res!120117) (not e!95777))))

(assert (=> d!45953 (= res!120117 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!45953 (= (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222493)) e!95777)))

(declare-fun b!143794 () Bool)

(declare-fun res!120119 () Bool)

(assert (=> b!143794 (=> (not res!120119) (not e!95777))))

(assert (=> b!143794 (= res!120119 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!143795 () Bool)

(declare-fun e!95776 () Bool)

(assert (=> b!143795 (= e!95777 e!95776)))

(declare-fun res!120118 () Bool)

(assert (=> b!143795 (=> res!120118 e!95776)))

(assert (=> b!143795 (= res!120118 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) #b00000000000000000000000000000000))))

(declare-fun b!143796 () Bool)

(assert (=> b!143796 (= e!95776 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (= (and d!45953 res!120117) b!143794))

(assert (= (and b!143794 res!120119) b!143795))

(assert (= (and b!143795 (not res!120118)) b!143796))

(assert (=> b!143794 m!220503))

(assert (=> b!143794 m!220501))

(assert (=> b!143796 m!220503))

(assert (=> b!143796 m!220503))

(declare-fun m!220837 () Bool)

(assert (=> b!143796 m!220837))

(assert (=> b!143596 d!45953))

(declare-fun d!45955 () Bool)

(assert (=> d!45955 (= (invariant!0 (currentBit!6280 thiss!1634) (currentByte!6285 thiss!1634) (size!2972 (buf!3401 (_2!6745 lt!222486)))) (and (bvsge (currentBit!6280 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6280 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6285 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6285 thiss!1634) (size!2972 (buf!3401 (_2!6745 lt!222486)))) (and (= (currentBit!6280 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6285 thiss!1634) (size!2972 (buf!3401 (_2!6745 lt!222486))))))))))

(assert (=> b!143595 d!45955))

(declare-fun d!45961 () Bool)

(declare-fun res!120129 () Bool)

(declare-fun e!95784 () Bool)

(assert (=> d!45961 (=> res!120129 e!95784)))

(assert (=> d!45961 (= res!120129 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45961 (= (arrayRangesEq!288 arr!237 (_2!6748 lt!222489) #b00000000000000000000000000000000 to!404) e!95784)))

(declare-fun b!143806 () Bool)

(declare-fun e!95785 () Bool)

(assert (=> b!143806 (= e!95784 e!95785)))

(declare-fun res!120130 () Bool)

(assert (=> b!143806 (=> (not res!120130) (not e!95785))))

(assert (=> b!143806 (= res!120130 (= (select (arr!3695 arr!237) #b00000000000000000000000000000000) (select (arr!3695 (_2!6748 lt!222489)) #b00000000000000000000000000000000)))))

(declare-fun b!143807 () Bool)

(assert (=> b!143807 (= e!95785 (arrayRangesEq!288 arr!237 (_2!6748 lt!222489) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45961 (not res!120129)) b!143806))

(assert (= (and b!143806 res!120130) b!143807))

(declare-fun m!220857 () Bool)

(assert (=> b!143806 m!220857))

(declare-fun m!220859 () Bool)

(assert (=> b!143806 m!220859))

(declare-fun m!220861 () Bool)

(assert (=> b!143807 m!220861))

(assert (=> b!143592 d!45961))

(declare-datatypes ((tuple3!554 0))(
  ( (tuple3!555 (_1!6757 Unit!8944) (_2!6757 BitStream!5202) (_3!342 array!6565)) )
))
(declare-fun lt!222970 () tuple3!554)

(declare-fun d!45965 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5202 array!6565 (_ BitVec 32) (_ BitVec 32)) tuple3!554)

(assert (=> d!45965 (= lt!222970 (readByteArrayLoop!0 (_1!6747 lt!222494) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45965 (= (readByteArrayLoopPure!0 (_1!6747 lt!222494) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12815 (_2!6757 lt!222970) (_3!342 lt!222970)))))

(declare-fun bs!11279 () Bool)

(assert (= bs!11279 d!45965))

(declare-fun m!220863 () Bool)

(assert (=> bs!11279 m!220863))

(assert (=> b!143591 d!45965))

(declare-fun d!45967 () Bool)

(assert (=> d!45967 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!222488) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) lt!222488))))

(declare-fun bs!11280 () Bool)

(assert (= bs!11280 d!45967))

(declare-fun m!220865 () Bool)

(assert (=> bs!11280 m!220865))

(assert (=> b!143591 d!45967))

(declare-fun d!45969 () Bool)

(assert (=> d!45969 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!222488)))

(declare-fun lt!222984 () Unit!8944)

(declare-fun choose!9 (BitStream!5202 array!6565 (_ BitVec 64) BitStream!5202) Unit!8944)

(assert (=> d!45969 (= lt!222984 (choose!9 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!222493)) lt!222488 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (=> d!45969 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!222493)) lt!222488) lt!222984)))

(declare-fun bs!11282 () Bool)

(assert (= bs!11282 d!45969))

(assert (=> bs!11282 m!220517))

(declare-fun m!220881 () Bool)

(assert (=> bs!11282 m!220881))

(assert (=> b!143591 d!45969))

(declare-fun b!143813 () Bool)

(declare-fun e!95790 () Unit!8944)

(declare-fun lt!222998 () Unit!8944)

(assert (=> b!143813 (= e!95790 lt!222998)))

(declare-fun lt!222992 () (_ BitVec 64))

(assert (=> b!143813 (= lt!222992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!222990 () (_ BitVec 64))

(assert (=> b!143813 (= lt!222990 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(assert (=> b!143813 (= lt!222998 (arrayBitRangesEqSymmetric!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222493)) lt!222992 lt!222990))))

(assert (=> b!143813 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 (_2!6745 lt!222486)) lt!222992 lt!222990)))

(declare-fun b!143814 () Bool)

(declare-fun res!120137 () Bool)

(declare-fun e!95791 () Bool)

(assert (=> b!143814 (=> (not res!120137) (not e!95791))))

(declare-fun lt!223003 () tuple2!12812)

(assert (=> b!143814 (= res!120137 (isPrefixOf!0 (_2!6747 lt!223003) (_2!6745 lt!222493)))))

(declare-fun lt!222995 () (_ BitVec 64))

(declare-fun b!143815 () Bool)

(declare-fun lt!223000 () (_ BitVec 64))

(assert (=> b!143815 (= e!95791 (= (_1!6747 lt!223003) (withMovedBitIndex!0 (_2!6747 lt!223003) (bvsub lt!222995 lt!223000))))))

(assert (=> b!143815 (or (= (bvand lt!222995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!222995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222995 lt!223000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143815 (= lt!223000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493))))))

(assert (=> b!143815 (= lt!222995 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(declare-fun d!45975 () Bool)

(assert (=> d!45975 e!95791))

(declare-fun res!120136 () Bool)

(assert (=> d!45975 (=> (not res!120136) (not e!95791))))

(assert (=> d!45975 (= res!120136 (isPrefixOf!0 (_1!6747 lt!223003) (_2!6747 lt!223003)))))

(declare-fun lt!222996 () BitStream!5202)

(assert (=> d!45975 (= lt!223003 (tuple2!12813 lt!222996 (_2!6745 lt!222493)))))

(declare-fun lt!222997 () Unit!8944)

(declare-fun lt!222988 () Unit!8944)

(assert (=> d!45975 (= lt!222997 lt!222988)))

(assert (=> d!45975 (isPrefixOf!0 lt!222996 (_2!6745 lt!222493))))

(assert (=> d!45975 (= lt!222988 (lemmaIsPrefixTransitive!0 lt!222996 (_2!6745 lt!222493) (_2!6745 lt!222493)))))

(declare-fun lt!222986 () Unit!8944)

(declare-fun lt!223001 () Unit!8944)

(assert (=> d!45975 (= lt!222986 lt!223001)))

(assert (=> d!45975 (isPrefixOf!0 lt!222996 (_2!6745 lt!222493))))

(assert (=> d!45975 (= lt!223001 (lemmaIsPrefixTransitive!0 lt!222996 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(declare-fun lt!222987 () Unit!8944)

(assert (=> d!45975 (= lt!222987 e!95790)))

(declare-fun c!7854 () Bool)

(assert (=> d!45975 (= c!7854 (not (= (size!2972 (buf!3401 (_2!6745 lt!222486))) #b00000000000000000000000000000000)))))

(declare-fun lt!222999 () Unit!8944)

(declare-fun lt!222989 () Unit!8944)

(assert (=> d!45975 (= lt!222999 lt!222989)))

(assert (=> d!45975 (isPrefixOf!0 (_2!6745 lt!222493) (_2!6745 lt!222493))))

(assert (=> d!45975 (= lt!222989 (lemmaIsPrefixRefl!0 (_2!6745 lt!222493)))))

(declare-fun lt!223002 () Unit!8944)

(declare-fun lt!222993 () Unit!8944)

(assert (=> d!45975 (= lt!223002 lt!222993)))

(assert (=> d!45975 (= lt!222993 (lemmaIsPrefixRefl!0 (_2!6745 lt!222493)))))

(declare-fun lt!222985 () Unit!8944)

(declare-fun lt!222994 () Unit!8944)

(assert (=> d!45975 (= lt!222985 lt!222994)))

(assert (=> d!45975 (isPrefixOf!0 lt!222996 lt!222996)))

(assert (=> d!45975 (= lt!222994 (lemmaIsPrefixRefl!0 lt!222996))))

(declare-fun lt!223004 () Unit!8944)

(declare-fun lt!222991 () Unit!8944)

(assert (=> d!45975 (= lt!223004 lt!222991)))

(assert (=> d!45975 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222486))))

(assert (=> d!45975 (= lt!222991 (lemmaIsPrefixRefl!0 (_2!6745 lt!222486)))))

(assert (=> d!45975 (= lt!222996 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(assert (=> d!45975 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222493))))

(assert (=> d!45975 (= (reader!0 (_2!6745 lt!222486) (_2!6745 lt!222493)) lt!223003)))

(declare-fun b!143816 () Bool)

(declare-fun res!120138 () Bool)

(assert (=> b!143816 (=> (not res!120138) (not e!95791))))

(assert (=> b!143816 (= res!120138 (isPrefixOf!0 (_1!6747 lt!223003) (_2!6745 lt!222486)))))

(declare-fun b!143817 () Bool)

(declare-fun Unit!8953 () Unit!8944)

(assert (=> b!143817 (= e!95790 Unit!8953)))

(assert (= (and d!45975 c!7854) b!143813))

(assert (= (and d!45975 (not c!7854)) b!143817))

(assert (= (and d!45975 res!120136) b!143816))

(assert (= (and b!143816 res!120138) b!143814))

(assert (= (and b!143814 res!120137) b!143815))

(declare-fun m!220883 () Bool)

(assert (=> b!143814 m!220883))

(declare-fun m!220885 () Bool)

(assert (=> b!143816 m!220885))

(declare-fun m!220887 () Bool)

(assert (=> b!143815 m!220887))

(assert (=> b!143815 m!220501))

(assert (=> b!143815 m!220503))

(assert (=> b!143813 m!220503))

(declare-fun m!220889 () Bool)

(assert (=> b!143813 m!220889))

(declare-fun m!220891 () Bool)

(assert (=> b!143813 m!220891))

(declare-fun m!220893 () Bool)

(assert (=> d!45975 m!220893))

(declare-fun m!220895 () Bool)

(assert (=> d!45975 m!220895))

(assert (=> d!45975 m!220505))

(declare-fun m!220897 () Bool)

(assert (=> d!45975 m!220897))

(declare-fun m!220899 () Bool)

(assert (=> d!45975 m!220899))

(assert (=> d!45975 m!220817))

(assert (=> d!45975 m!220819))

(declare-fun m!220901 () Bool)

(assert (=> d!45975 m!220901))

(declare-fun m!220903 () Bool)

(assert (=> d!45975 m!220903))

(declare-fun m!220905 () Bool)

(assert (=> d!45975 m!220905))

(declare-fun m!220907 () Bool)

(assert (=> d!45975 m!220907))

(assert (=> b!143591 d!45975))

(declare-fun b!143848 () Bool)

(declare-fun res!120171 () Bool)

(declare-fun e!95813 () Bool)

(assert (=> b!143848 (=> (not res!120171) (not e!95813))))

(declare-fun lt!223074 () tuple2!12808)

(declare-fun lt!223071 () (_ BitVec 64))

(declare-fun lt!223069 () (_ BitVec 64))

(assert (=> b!143848 (= res!120171 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223074))) (currentByte!6285 (_2!6745 lt!223074)) (currentBit!6280 (_2!6745 lt!223074))) (bvadd lt!223069 lt!223071)))))

(assert (=> b!143848 (or (not (= (bvand lt!223069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223071 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223069 lt!223071) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!223066 () (_ BitVec 64))

(assert (=> b!143848 (= lt!223071 (bvmul lt!223066 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!143848 (or (= lt!223066 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223066 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223066)))))

(assert (=> b!143848 (= lt!223066 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!143848 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!143848 (= lt!223069 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(declare-fun lt!223072 () tuple2!12814)

(declare-fun b!143849 () Bool)

(declare-fun e!95812 () Bool)

(assert (=> b!143849 (= e!95812 (arrayRangesEq!288 arr!237 (_2!6748 lt!223072) #b00000000000000000000000000000000 to!404))))

(declare-fun b!143850 () Bool)

(assert (=> b!143850 (= e!95813 e!95812)))

(declare-fun res!120173 () Bool)

(assert (=> b!143850 (=> (not res!120173) (not e!95812))))

(declare-fun lt!223065 () tuple2!12812)

(assert (=> b!143850 (= res!120173 (and (= (size!2972 (_2!6748 lt!223072)) (size!2972 arr!237)) (= (_1!6748 lt!223072) (_2!6747 lt!223065))))))

(assert (=> b!143850 (= lt!223072 (readByteArrayLoopPure!0 (_1!6747 lt!223065) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!223070 () Unit!8944)

(declare-fun lt!223073 () Unit!8944)

(assert (=> b!143850 (= lt!223070 lt!223073)))

(declare-fun lt!223064 () (_ BitVec 64))

(assert (=> b!143850 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!223064)))

(assert (=> b!143850 (= lt!223073 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!223074)) lt!223064))))

(declare-fun e!95814 () Bool)

(assert (=> b!143850 e!95814))

(declare-fun res!120174 () Bool)

(assert (=> b!143850 (=> (not res!120174) (not e!95814))))

(assert (=> b!143850 (= res!120174 (and (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 lt!223074)))) (bvsge lt!223064 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143850 (= lt!223064 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!143850 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!143850 (= lt!223065 (reader!0 (_2!6745 lt!222486) (_2!6745 lt!223074)))))

(declare-fun b!143851 () Bool)

(declare-fun res!120175 () Bool)

(assert (=> b!143851 (=> (not res!120175) (not e!95813))))

(assert (=> b!143851 (= res!120175 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!223074)))))

(declare-fun b!143852 () Bool)

(assert (=> b!143852 (= e!95814 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!223064))))

(declare-fun d!45977 () Bool)

(assert (=> d!45977 e!95813))

(declare-fun res!120172 () Bool)

(assert (=> d!45977 (=> (not res!120172) (not e!95813))))

(assert (=> d!45977 (= res!120172 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 lt!223074)))))))

(declare-fun choose!64 (BitStream!5202 array!6565 (_ BitVec 32) (_ BitVec 32)) tuple2!12808)

(assert (=> d!45977 (= lt!223074 (choose!64 (_2!6745 lt!222486) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45977 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2972 arr!237)))))

(assert (=> d!45977 (= (appendByteArrayLoop!0 (_2!6745 lt!222486) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!223074)))

(assert (= (and d!45977 res!120172) b!143848))

(assert (= (and b!143848 res!120171) b!143851))

(assert (= (and b!143851 res!120175) b!143850))

(assert (= (and b!143850 res!120174) b!143852))

(assert (= (and b!143850 res!120173) b!143849))

(declare-fun m!220933 () Bool)

(assert (=> b!143850 m!220933))

(declare-fun m!220935 () Bool)

(assert (=> b!143850 m!220935))

(declare-fun m!220937 () Bool)

(assert (=> b!143850 m!220937))

(declare-fun m!220939 () Bool)

(assert (=> b!143850 m!220939))

(declare-fun m!220941 () Bool)

(assert (=> b!143848 m!220941))

(assert (=> b!143848 m!220503))

(declare-fun m!220943 () Bool)

(assert (=> b!143851 m!220943))

(declare-fun m!220945 () Bool)

(assert (=> d!45977 m!220945))

(declare-fun m!220947 () Bool)

(assert (=> b!143849 m!220947))

(declare-fun m!220949 () Bool)

(assert (=> b!143852 m!220949))

(assert (=> b!143593 d!45977))

(declare-fun d!45988 () Bool)

(assert (=> d!45988 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222493))))

(declare-fun lt!223109 () Unit!8944)

(declare-fun choose!30 (BitStream!5202 BitStream!5202 BitStream!5202) Unit!8944)

(assert (=> d!45988 (= lt!223109 (choose!30 thiss!1634 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(assert (=> d!45988 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222486))))

(assert (=> d!45988 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6745 lt!222486) (_2!6745 lt!222493)) lt!223109)))

(declare-fun bs!11286 () Bool)

(assert (= bs!11286 d!45988))

(assert (=> bs!11286 m!220495))

(declare-fun m!220965 () Bool)

(assert (=> bs!11286 m!220965))

(assert (=> bs!11286 m!220499))

(assert (=> b!143593 d!45988))

(declare-fun b!143865 () Bool)

(declare-fun e!95818 () Unit!8944)

(declare-fun lt!223123 () Unit!8944)

(assert (=> b!143865 (= e!95818 lt!223123)))

(declare-fun lt!223117 () (_ BitVec 64))

(assert (=> b!143865 (= lt!223117 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223115 () (_ BitVec 64))

(assert (=> b!143865 (= lt!223115 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(assert (=> b!143865 (= lt!223123 (arrayBitRangesEqSymmetric!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222493)) lt!223117 lt!223115))))

(assert (=> b!143865 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 thiss!1634) lt!223117 lt!223115)))

(declare-fun b!143866 () Bool)

(declare-fun res!120185 () Bool)

(declare-fun e!95819 () Bool)

(assert (=> b!143866 (=> (not res!120185) (not e!95819))))

(declare-fun lt!223128 () tuple2!12812)

(assert (=> b!143866 (= res!120185 (isPrefixOf!0 (_2!6747 lt!223128) (_2!6745 lt!222493)))))

(declare-fun lt!223120 () (_ BitVec 64))

(declare-fun b!143867 () Bool)

(declare-fun lt!223125 () (_ BitVec 64))

(assert (=> b!143867 (= e!95819 (= (_1!6747 lt!223128) (withMovedBitIndex!0 (_2!6747 lt!223128) (bvsub lt!223120 lt!223125))))))

(assert (=> b!143867 (or (= (bvand lt!223120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223125 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223120 lt!223125) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143867 (= lt!223125 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493))))))

(assert (=> b!143867 (= lt!223120 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(declare-fun d!45994 () Bool)

(assert (=> d!45994 e!95819))

(declare-fun res!120184 () Bool)

(assert (=> d!45994 (=> (not res!120184) (not e!95819))))

(assert (=> d!45994 (= res!120184 (isPrefixOf!0 (_1!6747 lt!223128) (_2!6747 lt!223128)))))

(declare-fun lt!223121 () BitStream!5202)

(assert (=> d!45994 (= lt!223128 (tuple2!12813 lt!223121 (_2!6745 lt!222493)))))

(declare-fun lt!223122 () Unit!8944)

(declare-fun lt!223113 () Unit!8944)

(assert (=> d!45994 (= lt!223122 lt!223113)))

(assert (=> d!45994 (isPrefixOf!0 lt!223121 (_2!6745 lt!222493))))

(assert (=> d!45994 (= lt!223113 (lemmaIsPrefixTransitive!0 lt!223121 (_2!6745 lt!222493) (_2!6745 lt!222493)))))

(declare-fun lt!223111 () Unit!8944)

(declare-fun lt!223126 () Unit!8944)

(assert (=> d!45994 (= lt!223111 lt!223126)))

(assert (=> d!45994 (isPrefixOf!0 lt!223121 (_2!6745 lt!222493))))

(assert (=> d!45994 (= lt!223126 (lemmaIsPrefixTransitive!0 lt!223121 thiss!1634 (_2!6745 lt!222493)))))

(declare-fun lt!223112 () Unit!8944)

(assert (=> d!45994 (= lt!223112 e!95818)))

(declare-fun c!7856 () Bool)

(assert (=> d!45994 (= c!7856 (not (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!223124 () Unit!8944)

(declare-fun lt!223114 () Unit!8944)

(assert (=> d!45994 (= lt!223124 lt!223114)))

(assert (=> d!45994 (isPrefixOf!0 (_2!6745 lt!222493) (_2!6745 lt!222493))))

(assert (=> d!45994 (= lt!223114 (lemmaIsPrefixRefl!0 (_2!6745 lt!222493)))))

(declare-fun lt!223127 () Unit!8944)

(declare-fun lt!223118 () Unit!8944)

(assert (=> d!45994 (= lt!223127 lt!223118)))

(assert (=> d!45994 (= lt!223118 (lemmaIsPrefixRefl!0 (_2!6745 lt!222493)))))

(declare-fun lt!223110 () Unit!8944)

(declare-fun lt!223119 () Unit!8944)

(assert (=> d!45994 (= lt!223110 lt!223119)))

(assert (=> d!45994 (isPrefixOf!0 lt!223121 lt!223121)))

(assert (=> d!45994 (= lt!223119 (lemmaIsPrefixRefl!0 lt!223121))))

(declare-fun lt!223129 () Unit!8944)

(declare-fun lt!223116 () Unit!8944)

(assert (=> d!45994 (= lt!223129 lt!223116)))

(assert (=> d!45994 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45994 (= lt!223116 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45994 (= lt!223121 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(assert (=> d!45994 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222493))))

(assert (=> d!45994 (= (reader!0 thiss!1634 (_2!6745 lt!222493)) lt!223128)))

(declare-fun b!143868 () Bool)

(declare-fun res!120186 () Bool)

(assert (=> b!143868 (=> (not res!120186) (not e!95819))))

(assert (=> b!143868 (= res!120186 (isPrefixOf!0 (_1!6747 lt!223128) thiss!1634))))

(declare-fun b!143869 () Bool)

(declare-fun Unit!8955 () Unit!8944)

(assert (=> b!143869 (= e!95818 Unit!8955)))

(assert (= (and d!45994 c!7856) b!143865))

(assert (= (and d!45994 (not c!7856)) b!143869))

(assert (= (and d!45994 res!120184) b!143868))

(assert (= (and b!143868 res!120186) b!143866))

(assert (= (and b!143866 res!120185) b!143867))

(declare-fun m!220993 () Bool)

(assert (=> b!143866 m!220993))

(declare-fun m!220995 () Bool)

(assert (=> b!143868 m!220995))

(declare-fun m!220997 () Bool)

(assert (=> b!143867 m!220997))

(assert (=> b!143867 m!220501))

(assert (=> b!143867 m!220507))

(assert (=> b!143865 m!220507))

(declare-fun m!220999 () Bool)

(assert (=> b!143865 m!220999))

(declare-fun m!221001 () Bool)

(assert (=> b!143865 m!221001))

(declare-fun m!221003 () Bool)

(assert (=> d!45994 m!221003))

(declare-fun m!221005 () Bool)

(assert (=> d!45994 m!221005))

(assert (=> d!45994 m!220495))

(declare-fun m!221007 () Bool)

(assert (=> d!45994 m!221007))

(declare-fun m!221009 () Bool)

(assert (=> d!45994 m!221009))

(assert (=> d!45994 m!220813))

(assert (=> d!45994 m!220815))

(assert (=> d!45994 m!220901))

(assert (=> d!45994 m!220903))

(declare-fun m!221011 () Bool)

(assert (=> d!45994 m!221011))

(declare-fun m!221013 () Bool)

(assert (=> d!45994 m!221013))

(assert (=> b!143593 d!45994))

(declare-fun d!45998 () Bool)

(declare-fun lt!223130 () tuple2!12826)

(assert (=> d!45998 (= lt!223130 (readByte!0 (_1!6747 lt!222487)))))

(assert (=> d!45998 (= (readBytePure!0 (_1!6747 lt!222487)) (tuple2!12811 (_2!6755 lt!223130) (_1!6755 lt!223130)))))

(declare-fun bs!11287 () Bool)

(assert (= bs!11287 d!45998))

(declare-fun m!221015 () Bool)

(assert (=> bs!11287 m!221015))

(assert (=> b!143593 d!45998))

(declare-fun d!46000 () Bool)

(assert (=> d!46000 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11288 () Bool)

(assert (= bs!11288 d!46000))

(declare-fun m!221017 () Bool)

(assert (=> bs!11288 m!221017))

(assert (=> b!143593 d!46000))

(declare-fun d!46002 () Bool)

(assert (=> d!46002 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11289 () Bool)

(assert (= bs!11289 d!46002))

(assert (=> bs!11289 m!220833))

(assert (=> b!143593 d!46002))

(declare-fun d!46004 () Bool)

(declare-fun e!95824 () Bool)

(assert (=> d!46004 e!95824))

(declare-fun res!120192 () Bool)

(assert (=> d!46004 (=> (not res!120192) (not e!95824))))

(declare-fun lt!223146 () tuple2!12810)

(declare-fun lt!223144 () tuple2!12810)

(assert (=> d!46004 (= res!120192 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!223146))) (currentByte!6285 (_1!6746 lt!223146)) (currentBit!6280 (_1!6746 lt!223146))) (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!223144))) (currentByte!6285 (_1!6746 lt!223144)) (currentBit!6280 (_1!6746 lt!223144)))))))

(declare-fun lt!223145 () Unit!8944)

(declare-fun lt!223147 () BitStream!5202)

(declare-fun choose!14 (BitStream!5202 BitStream!5202 BitStream!5202 tuple2!12810 tuple2!12810 BitStream!5202 (_ BitVec 8) tuple2!12810 tuple2!12810 BitStream!5202 (_ BitVec 8)) Unit!8944)

(assert (=> d!46004 (= lt!223145 (choose!14 lt!222492 (_2!6745 lt!222493) lt!223147 lt!223146 (tuple2!12811 (_1!6746 lt!223146) (_2!6746 lt!223146)) (_1!6746 lt!223146) (_2!6746 lt!223146) lt!223144 (tuple2!12811 (_1!6746 lt!223144) (_2!6746 lt!223144)) (_1!6746 lt!223144) (_2!6746 lt!223144)))))

(assert (=> d!46004 (= lt!223144 (readBytePure!0 lt!223147))))

(assert (=> d!46004 (= lt!223146 (readBytePure!0 lt!222492))))

(assert (=> d!46004 (= lt!223147 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 lt!222492) (currentBit!6280 lt!222492)))))

(assert (=> d!46004 (= (readBytePrefixLemma!0 lt!222492 (_2!6745 lt!222493)) lt!223145)))

(declare-fun b!143875 () Bool)

(assert (=> b!143875 (= e!95824 (= (_2!6746 lt!223146) (_2!6746 lt!223144)))))

(assert (= (and d!46004 res!120192) b!143875))

(declare-fun m!221029 () Bool)

(assert (=> d!46004 m!221029))

(declare-fun m!221031 () Bool)

(assert (=> d!46004 m!221031))

(declare-fun m!221033 () Bool)

(assert (=> d!46004 m!221033))

(declare-fun m!221035 () Bool)

(assert (=> d!46004 m!221035))

(assert (=> d!46004 m!220493))

(assert (=> b!143593 d!46004))

(declare-fun d!46020 () Bool)

(declare-fun e!95825 () Bool)

(assert (=> d!46020 e!95825))

(declare-fun res!120194 () Bool)

(assert (=> d!46020 (=> (not res!120194) (not e!95825))))

(declare-fun lt!223153 () (_ BitVec 64))

(declare-fun lt!223148 () (_ BitVec 64))

(declare-fun lt!223149 () (_ BitVec 64))

(assert (=> d!46020 (= res!120194 (= lt!223148 (bvsub lt!223153 lt!223149)))))

(assert (=> d!46020 (or (= (bvand lt!223153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223149 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223153 lt!223149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46020 (= lt!223149 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222498)))) ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222498))) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222498)))))))

(declare-fun lt!223150 () (_ BitVec 64))

(declare-fun lt!223152 () (_ BitVec 64))

(assert (=> d!46020 (= lt!223153 (bvmul lt!223150 lt!223152))))

(assert (=> d!46020 (or (= lt!223150 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223152 (bvsdiv (bvmul lt!223150 lt!223152) lt!223150)))))

(assert (=> d!46020 (= lt!223152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46020 (= lt!223150 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222498)))))))

(assert (=> d!46020 (= lt!223148 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222498))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222498)))))))

(assert (=> d!46020 (invariant!0 (currentBit!6280 (_1!6746 lt!222498)) (currentByte!6285 (_1!6746 lt!222498)) (size!2972 (buf!3401 (_1!6746 lt!222498))))))

(assert (=> d!46020 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!222498))) (currentByte!6285 (_1!6746 lt!222498)) (currentBit!6280 (_1!6746 lt!222498))) lt!223148)))

(declare-fun b!143876 () Bool)

(declare-fun res!120193 () Bool)

(assert (=> b!143876 (=> (not res!120193) (not e!95825))))

(assert (=> b!143876 (= res!120193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223148))))

(declare-fun b!143877 () Bool)

(declare-fun lt!223151 () (_ BitVec 64))

(assert (=> b!143877 (= e!95825 (bvsle lt!223148 (bvmul lt!223151 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143877 (or (= lt!223151 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223151 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223151)))))

(assert (=> b!143877 (= lt!223151 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222498)))))))

(assert (= (and d!46020 res!120194) b!143876))

(assert (= (and b!143876 res!120193) b!143877))

(declare-fun m!221037 () Bool)

(assert (=> d!46020 m!221037))

(declare-fun m!221039 () Bool)

(assert (=> d!46020 m!221039))

(assert (=> b!143593 d!46020))

(declare-fun d!46022 () Bool)

(declare-fun lt!223156 () tuple2!12826)

(assert (=> d!46022 (= lt!223156 (readByte!0 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (=> d!46022 (= (readBytePure!0 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) (tuple2!12811 (_2!6755 lt!223156) (_1!6755 lt!223156)))))

(declare-fun bs!11295 () Bool)

(assert (= bs!11295 d!46022))

(declare-fun m!221041 () Bool)

(assert (=> bs!11295 m!221041))

(assert (=> b!143593 d!46022))

(declare-fun d!46024 () Bool)

(declare-fun e!95837 () Bool)

(assert (=> d!46024 e!95837))

(declare-fun res!120208 () Bool)

(assert (=> d!46024 (=> (not res!120208) (not e!95837))))

(assert (=> d!46024 (= res!120208 (and (or (let ((rhs!3206 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3206 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3206) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!46029 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!46029 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!46029 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3205 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3205 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3205) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!223193 () Unit!8944)

(declare-fun choose!57 (BitStream!5202 BitStream!5202 (_ BitVec 64) (_ BitVec 32)) Unit!8944)

(assert (=> d!46024 (= lt!223193 (choose!57 thiss!1634 (_2!6745 lt!222486) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!46024 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6745 lt!222486) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!223193)))

(declare-fun lt!223191 () (_ BitVec 32))

(declare-fun b!143893 () Bool)

(assert (=> b!143893 (= e!95837 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) (bvsub (bvsub to!404 from!447) lt!223191)))))

(assert (=> b!143893 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!223191 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!223191) #b10000000000000000000000000000000)))))

(declare-fun lt!223192 () (_ BitVec 64))

(assert (=> b!143893 (= lt!223191 ((_ extract 31 0) lt!223192))))

(assert (=> b!143893 (and (bvslt lt!223192 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!223192 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!143893 (= lt!223192 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!46024 res!120208) b!143893))

(declare-fun m!221079 () Bool)

(assert (=> d!46024 m!221079))

(declare-fun m!221081 () Bool)

(assert (=> b!143893 m!221081))

(assert (=> b!143593 d!46024))

(declare-fun d!46039 () Bool)

(declare-fun e!95838 () Bool)

(assert (=> d!46039 e!95838))

(declare-fun res!120210 () Bool)

(assert (=> d!46039 (=> (not res!120210) (not e!95838))))

(declare-fun lt!223199 () (_ BitVec 64))

(declare-fun lt!223195 () (_ BitVec 64))

(declare-fun lt!223194 () (_ BitVec 64))

(assert (=> d!46039 (= res!120210 (= lt!223194 (bvsub lt!223199 lt!223195)))))

(assert (=> d!46039 (or (= (bvand lt!223199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223199 lt!223195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46039 (= lt!223195 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222501)))) ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222501))) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222501)))))))

(declare-fun lt!223196 () (_ BitVec 64))

(declare-fun lt!223198 () (_ BitVec 64))

(assert (=> d!46039 (= lt!223199 (bvmul lt!223196 lt!223198))))

(assert (=> d!46039 (or (= lt!223196 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223198 (bvsdiv (bvmul lt!223196 lt!223198) lt!223196)))))

(assert (=> d!46039 (= lt!223198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46039 (= lt!223196 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222501)))))))

(assert (=> d!46039 (= lt!223194 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222501))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222501)))))))

(assert (=> d!46039 (invariant!0 (currentBit!6280 (_1!6746 lt!222501)) (currentByte!6285 (_1!6746 lt!222501)) (size!2972 (buf!3401 (_1!6746 lt!222501))))))

(assert (=> d!46039 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!222501))) (currentByte!6285 (_1!6746 lt!222501)) (currentBit!6280 (_1!6746 lt!222501))) lt!223194)))

(declare-fun b!143894 () Bool)

(declare-fun res!120209 () Bool)

(assert (=> b!143894 (=> (not res!120209) (not e!95838))))

(assert (=> b!143894 (= res!120209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223194))))

(declare-fun b!143895 () Bool)

(declare-fun lt!223197 () (_ BitVec 64))

(assert (=> b!143895 (= e!95838 (bvsle lt!223194 (bvmul lt!223197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143895 (or (= lt!223197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223197)))))

(assert (=> b!143895 (= lt!223197 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222501)))))))

(assert (= (and d!46039 res!120210) b!143894))

(assert (= (and b!143894 res!120209) b!143895))

(declare-fun m!221083 () Bool)

(assert (=> d!46039 m!221083))

(declare-fun m!221085 () Bool)

(assert (=> d!46039 m!221085))

(assert (=> b!143593 d!46039))

(declare-fun d!46041 () Bool)

(declare-fun res!120211 () Bool)

(declare-fun e!95840 () Bool)

(assert (=> d!46041 (=> (not res!120211) (not e!95840))))

(assert (=> d!46041 (= res!120211 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!46041 (= (isPrefixOf!0 thiss!1634 (_2!6745 lt!222493)) e!95840)))

(declare-fun b!143896 () Bool)

(declare-fun res!120213 () Bool)

(assert (=> b!143896 (=> (not res!120213) (not e!95840))))

(assert (=> b!143896 (= res!120213 (bvsle (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!143897 () Bool)

(declare-fun e!95839 () Bool)

(assert (=> b!143897 (= e!95840 e!95839)))

(declare-fun res!120212 () Bool)

(assert (=> b!143897 (=> res!120212 e!95839)))

(assert (=> b!143897 (= res!120212 (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143898 () Bool)

(assert (=> b!143898 (= e!95839 (arrayBitRangesEq!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (= (and d!46041 res!120211) b!143896))

(assert (= (and b!143896 res!120213) b!143897))

(assert (= (and b!143897 (not res!120212)) b!143898))

(assert (=> b!143896 m!220507))

(assert (=> b!143896 m!220501))

(assert (=> b!143898 m!220507))

(assert (=> b!143898 m!220507))

(declare-fun m!221087 () Bool)

(assert (=> b!143898 m!221087))

(assert (=> b!143593 d!46041))

(declare-fun d!46043 () Bool)

(declare-fun lt!223200 () tuple2!12826)

(assert (=> d!46043 (= lt!223200 (readByte!0 lt!222492))))

(assert (=> d!46043 (= (readBytePure!0 lt!222492) (tuple2!12811 (_2!6755 lt!223200) (_1!6755 lt!223200)))))

(declare-fun bs!11298 () Bool)

(assert (= bs!11298 d!46043))

(declare-fun m!221089 () Bool)

(assert (=> bs!11298 m!221089))

(assert (=> b!143593 d!46043))

(declare-fun d!46045 () Bool)

(assert (=> d!46045 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!223203 () Unit!8944)

(declare-fun choose!26 (BitStream!5202 array!6565 (_ BitVec 32) BitStream!5202) Unit!8944)

(assert (=> d!46045 (= lt!223203 (choose!26 thiss!1634 (buf!3401 (_2!6745 lt!222493)) (bvsub to!404 from!447) (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (=> d!46045 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3401 (_2!6745 lt!222493)) (bvsub to!404 from!447)) lt!223203)))

(declare-fun bs!11299 () Bool)

(assert (= bs!11299 d!46045))

(assert (=> bs!11299 m!220483))

(declare-fun m!221091 () Bool)

(assert (=> bs!11299 m!221091))

(assert (=> b!143593 d!46045))

(assert (=> b!143593 d!45975))

(declare-fun d!46047 () Bool)

(declare-fun lt!223204 () tuple3!554)

(assert (=> d!46047 (= lt!223204 (readByteArrayLoop!0 (_1!6747 lt!222487) arr!237 from!447 to!404))))

(assert (=> d!46047 (= (readByteArrayLoopPure!0 (_1!6747 lt!222487) arr!237 from!447 to!404) (tuple2!12815 (_2!6757 lt!223204) (_3!342 lt!223204)))))

(declare-fun bs!11300 () Bool)

(assert (= bs!11300 d!46047))

(declare-fun m!221093 () Bool)

(assert (=> bs!11300 m!221093))

(assert (=> b!143593 d!46047))

(declare-fun d!46049 () Bool)

(declare-fun e!95843 () Bool)

(assert (=> d!46049 e!95843))

(declare-fun res!120221 () Bool)

(assert (=> d!46049 (=> (not res!120221) (not e!95843))))

(declare-fun lt!223217 () tuple2!12808)

(assert (=> d!46049 (= res!120221 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 (_2!6745 lt!223217)))))))

(declare-fun choose!6 (BitStream!5202 (_ BitVec 8)) tuple2!12808)

(assert (=> d!46049 (= lt!223217 (choose!6 thiss!1634 (select (arr!3695 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!46049 (validate_offset_byte!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)))))

(assert (=> d!46049 (= (appendByte!0 thiss!1634 (select (arr!3695 arr!237) from!447)) lt!223217)))

(declare-fun b!143905 () Bool)

(declare-fun res!120220 () Bool)

(assert (=> b!143905 (=> (not res!120220) (not e!95843))))

(declare-fun lt!223218 () (_ BitVec 64))

(declare-fun lt!223219 () (_ BitVec 64))

(assert (=> b!143905 (= res!120220 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223217))) (currentByte!6285 (_2!6745 lt!223217)) (currentBit!6280 (_2!6745 lt!223217))) (bvadd lt!223218 lt!223219)))))

(assert (=> b!143905 (or (not (= (bvand lt!223218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223219 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223218 lt!223219) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143905 (= lt!223219 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!143905 (= lt!223218 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(declare-fun b!143906 () Bool)

(declare-fun res!120222 () Bool)

(assert (=> b!143906 (=> (not res!120222) (not e!95843))))

(assert (=> b!143906 (= res!120222 (isPrefixOf!0 thiss!1634 (_2!6745 lt!223217)))))

(declare-fun b!143907 () Bool)

(declare-fun lt!223216 () tuple2!12810)

(declare-fun lt!223215 () tuple2!12812)

(assert (=> b!143907 (= e!95843 (and (= (_2!6746 lt!223216) (select (arr!3695 arr!237) from!447)) (= (_1!6746 lt!223216) (_2!6747 lt!223215))))))

(assert (=> b!143907 (= lt!223216 (readBytePure!0 (_1!6747 lt!223215)))))

(assert (=> b!143907 (= lt!223215 (reader!0 thiss!1634 (_2!6745 lt!223217)))))

(assert (= (and d!46049 res!120221) b!143905))

(assert (= (and b!143905 res!120220) b!143906))

(assert (= (and b!143906 res!120222) b!143907))

(assert (=> d!46049 m!220457))

(declare-fun m!221095 () Bool)

(assert (=> d!46049 m!221095))

(declare-fun m!221097 () Bool)

(assert (=> d!46049 m!221097))

(declare-fun m!221099 () Bool)

(assert (=> b!143905 m!221099))

(assert (=> b!143905 m!220507))

(declare-fun m!221101 () Bool)

(assert (=> b!143906 m!221101))

(declare-fun m!221103 () Bool)

(assert (=> b!143907 m!221103))

(declare-fun m!221105 () Bool)

(assert (=> b!143907 m!221105))

(assert (=> b!143593 d!46049))

(declare-fun d!46051 () Bool)

(assert (=> d!46051 (= (invariant!0 (currentBit!6280 thiss!1634) (currentByte!6285 thiss!1634) (size!2972 (buf!3401 thiss!1634))) (and (bvsge (currentBit!6280 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6280 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6285 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6285 thiss!1634) (size!2972 (buf!3401 thiss!1634))) (and (= (currentBit!6280 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6285 thiss!1634) (size!2972 (buf!3401 thiss!1634)))))))))

(assert (=> b!143589 d!46051))

(assert (=> b!143590 d!45945))

(declare-fun d!46053 () Bool)

(declare-fun e!95844 () Bool)

(assert (=> d!46053 e!95844))

(declare-fun res!120224 () Bool)

(assert (=> d!46053 (=> (not res!120224) (not e!95844))))

(declare-fun lt!223221 () (_ BitVec 64))

(declare-fun lt!223225 () (_ BitVec 64))

(declare-fun lt!223220 () (_ BitVec 64))

(assert (=> d!46053 (= res!120224 (= lt!223220 (bvsub lt!223225 lt!223221)))))

(assert (=> d!46053 (or (= (bvand lt!223225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223221 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223225 lt!223221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46053 (= lt!223221 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))))))

(declare-fun lt!223222 () (_ BitVec 64))

(declare-fun lt!223224 () (_ BitVec 64))

(assert (=> d!46053 (= lt!223225 (bvmul lt!223222 lt!223224))))

(assert (=> d!46053 (or (= lt!223222 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223224 (bvsdiv (bvmul lt!223222 lt!223224) lt!223222)))))

(assert (=> d!46053 (= lt!223224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46053 (= lt!223222 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))))))

(assert (=> d!46053 (= lt!223220 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 thiss!1634))))))

(assert (=> d!46053 (invariant!0 (currentBit!6280 thiss!1634) (currentByte!6285 thiss!1634) (size!2972 (buf!3401 thiss!1634)))))

(assert (=> d!46053 (= (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) lt!223220)))

(declare-fun b!143908 () Bool)

(declare-fun res!120223 () Bool)

(assert (=> b!143908 (=> (not res!120223) (not e!95844))))

(assert (=> b!143908 (= res!120223 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223220))))

(declare-fun b!143909 () Bool)

(declare-fun lt!223223 () (_ BitVec 64))

(assert (=> b!143909 (= e!95844 (bvsle lt!223220 (bvmul lt!223223 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143909 (or (= lt!223223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223223)))))

(assert (=> b!143909 (= lt!223223 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))))))

(assert (= (and d!46053 res!120224) b!143908))

(assert (= (and b!143908 res!120223) b!143909))

(assert (=> d!46053 m!220825))

(assert (=> d!46053 m!220511))

(assert (=> b!143590 d!46053))

(check-sat (not d!46049) (not b!143813) (not b!143815) (not b!143766) (not b!143768) (not b!143816) (not b!143866) (not b!143767) (not b!143848) (not b!143907) (not b!143868) (not d!46045) (not d!45988) (not b!143852) (not d!46020) (not b!143898) (not d!46022) (not b!143865) (not d!45939) (not b!143893) (not b!143896) (not b!143867) (not b!143849) (not b!143850) (not b!143777) (not b!143807) (not d!45943) (not b!143906) (not d!46043) (not d!46039) (not b!143769) (not b!143814) (not b!143905) (not d!45967) (not b!143851) (not d!46000) (not d!45951) (not d!45998) (not d!46053) (not d!46002) (not d!45969) (not b!143779) (not d!45994) (not d!45910) (not d!45975) (not b!143796) (not d!45965) (not d!45977) (not d!46047) (not d!46024) (not d!45914) (not b!143794) (not d!45945) (not d!46004))
(check-sat)
(get-model)

(declare-fun d!46055 () Bool)

(declare-fun res!120225 () Bool)

(declare-fun e!95846 () Bool)

(assert (=> d!46055 (=> (not res!120225) (not e!95846))))

(assert (=> d!46055 (= res!120225 (= (size!2972 (buf!3401 (_2!6747 lt!223128))) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!46055 (= (isPrefixOf!0 (_2!6747 lt!223128) (_2!6745 lt!222493)) e!95846)))

(declare-fun b!143910 () Bool)

(declare-fun res!120227 () Bool)

(assert (=> b!143910 (=> (not res!120227) (not e!95846))))

(assert (=> b!143910 (= res!120227 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223128))) (currentByte!6285 (_2!6747 lt!223128)) (currentBit!6280 (_2!6747 lt!223128))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!143911 () Bool)

(declare-fun e!95845 () Bool)

(assert (=> b!143911 (= e!95846 e!95845)))

(declare-fun res!120226 () Bool)

(assert (=> b!143911 (=> res!120226 e!95845)))

(assert (=> b!143911 (= res!120226 (= (size!2972 (buf!3401 (_2!6747 lt!223128))) #b00000000000000000000000000000000))))

(declare-fun b!143912 () Bool)

(assert (=> b!143912 (= e!95845 (arrayBitRangesEq!0 (buf!3401 (_2!6747 lt!223128)) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223128))) (currentByte!6285 (_2!6747 lt!223128)) (currentBit!6280 (_2!6747 lt!223128)))))))

(assert (= (and d!46055 res!120225) b!143910))

(assert (= (and b!143910 res!120227) b!143911))

(assert (= (and b!143911 (not res!120226)) b!143912))

(declare-fun m!221107 () Bool)

(assert (=> b!143910 m!221107))

(assert (=> b!143910 m!220501))

(assert (=> b!143912 m!221107))

(assert (=> b!143912 m!221107))

(declare-fun m!221109 () Bool)

(assert (=> b!143912 m!221109))

(assert (=> b!143866 d!46055))

(declare-fun d!46057 () Bool)

(declare-fun res!120228 () Bool)

(declare-fun e!95848 () Bool)

(assert (=> d!46057 (=> (not res!120228) (not e!95848))))

(assert (=> d!46057 (= res!120228 (= (size!2972 (buf!3401 (_2!6747 lt!222913))) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (=> d!46057 (= (isPrefixOf!0 (_2!6747 lt!222913) (_2!6745 lt!222486)) e!95848)))

(declare-fun b!143913 () Bool)

(declare-fun res!120230 () Bool)

(assert (=> b!143913 (=> (not res!120230) (not e!95848))))

(assert (=> b!143913 (= res!120230 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!222913))) (currentByte!6285 (_2!6747 lt!222913)) (currentBit!6280 (_2!6747 lt!222913))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun b!143914 () Bool)

(declare-fun e!95847 () Bool)

(assert (=> b!143914 (= e!95848 e!95847)))

(declare-fun res!120229 () Bool)

(assert (=> b!143914 (=> res!120229 e!95847)))

(assert (=> b!143914 (= res!120229 (= (size!2972 (buf!3401 (_2!6747 lt!222913))) #b00000000000000000000000000000000))))

(declare-fun b!143915 () Bool)

(assert (=> b!143915 (= e!95847 (arrayBitRangesEq!0 (buf!3401 (_2!6747 lt!222913)) (buf!3401 (_2!6745 lt!222486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!222913))) (currentByte!6285 (_2!6747 lt!222913)) (currentBit!6280 (_2!6747 lt!222913)))))))

(assert (= (and d!46057 res!120228) b!143913))

(assert (= (and b!143913 res!120230) b!143914))

(assert (= (and b!143914 (not res!120229)) b!143915))

(declare-fun m!221111 () Bool)

(assert (=> b!143913 m!221111))

(assert (=> b!143913 m!220503))

(assert (=> b!143915 m!221111))

(assert (=> b!143915 m!221111))

(declare-fun m!221113 () Bool)

(assert (=> b!143915 m!221113))

(assert (=> b!143767 d!46057))

(declare-fun d!46059 () Bool)

(declare-fun res!120231 () Bool)

(declare-fun e!95850 () Bool)

(assert (=> d!46059 (=> (not res!120231) (not e!95850))))

(assert (=> d!46059 (= res!120231 (= (size!2972 (buf!3401 (_2!6747 lt!223003))) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!46059 (= (isPrefixOf!0 (_2!6747 lt!223003) (_2!6745 lt!222493)) e!95850)))

(declare-fun b!143916 () Bool)

(declare-fun res!120233 () Bool)

(assert (=> b!143916 (=> (not res!120233) (not e!95850))))

(assert (=> b!143916 (= res!120233 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223003))) (currentByte!6285 (_2!6747 lt!223003)) (currentBit!6280 (_2!6747 lt!223003))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!143917 () Bool)

(declare-fun e!95849 () Bool)

(assert (=> b!143917 (= e!95850 e!95849)))

(declare-fun res!120232 () Bool)

(assert (=> b!143917 (=> res!120232 e!95849)))

(assert (=> b!143917 (= res!120232 (= (size!2972 (buf!3401 (_2!6747 lt!223003))) #b00000000000000000000000000000000))))

(declare-fun b!143918 () Bool)

(assert (=> b!143918 (= e!95849 (arrayBitRangesEq!0 (buf!3401 (_2!6747 lt!223003)) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223003))) (currentByte!6285 (_2!6747 lt!223003)) (currentBit!6280 (_2!6747 lt!223003)))))))

(assert (= (and d!46059 res!120231) b!143916))

(assert (= (and b!143916 res!120233) b!143917))

(assert (= (and b!143917 (not res!120232)) b!143918))

(declare-fun m!221115 () Bool)

(assert (=> b!143916 m!221115))

(assert (=> b!143916 m!220501))

(assert (=> b!143918 m!221115))

(assert (=> b!143918 m!221115))

(declare-fun m!221117 () Bool)

(assert (=> b!143918 m!221117))

(assert (=> b!143814 d!46059))

(declare-fun d!46061 () Bool)

(assert (=> d!46061 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) (bvsub (bvsub to!404 from!447) lt!223191)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!223191)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11301 () Bool)

(assert (= bs!11301 d!46061))

(assert (=> bs!11301 m!220833))

(assert (=> b!143893 d!46061))

(declare-fun d!46063 () Bool)

(assert (=> d!46063 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))))))))

(assert (=> d!45945 d!46063))

(declare-fun d!46065 () Bool)

(assert (=> d!46065 (= (invariant!0 (currentBit!6280 (_2!6745 lt!222486)) (currentByte!6285 (_2!6745 lt!222486)) (size!2972 (buf!3401 (_2!6745 lt!222486)))) (and (bvsge (currentBit!6280 (_2!6745 lt!222486)) #b00000000000000000000000000000000) (bvslt (currentBit!6280 (_2!6745 lt!222486)) #b00000000000000000000000000001000) (bvsge (currentByte!6285 (_2!6745 lt!222486)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6285 (_2!6745 lt!222486)) (size!2972 (buf!3401 (_2!6745 lt!222486)))) (and (= (currentBit!6280 (_2!6745 lt!222486)) #b00000000000000000000000000000000) (= (currentByte!6285 (_2!6745 lt!222486)) (size!2972 (buf!3401 (_2!6745 lt!222486))))))))))

(assert (=> d!45945 d!46065))

(declare-fun d!46067 () Bool)

(assert (=> d!46067 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!46067 true))

(declare-fun _$7!67 () Unit!8944)

(assert (=> d!46067 (= (choose!57 thiss!1634 (_2!6745 lt!222486) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!67)))

(declare-fun bs!11302 () Bool)

(assert (= bs!11302 d!46067))

(declare-fun m!221119 () Bool)

(assert (=> bs!11302 m!221119))

(assert (=> d!46024 d!46067))

(declare-fun d!46069 () Bool)

(declare-fun lt!223245 () (_ BitVec 8))

(declare-fun lt!223244 () (_ BitVec 8))

(assert (=> d!46069 (= lt!223245 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222490))) (currentByte!6285 (_1!6747 lt!222490)))) ((_ sign_extend 24) lt!223244))))))

(assert (=> d!46069 (= lt!223244 ((_ extract 7 0) (currentBit!6280 (_1!6747 lt!222490))))))

(declare-fun e!95856 () Bool)

(assert (=> d!46069 e!95856))

(declare-fun res!120240 () Bool)

(assert (=> d!46069 (=> (not res!120240) (not e!95856))))

(assert (=> d!46069 (= res!120240 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6747 lt!222490)))) ((_ sign_extend 32) (currentByte!6285 (_1!6747 lt!222490))) ((_ sign_extend 32) (currentBit!6280 (_1!6747 lt!222490))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!12830 0))(
  ( (tuple2!12831 (_1!6759 Unit!8944) (_2!6759 (_ BitVec 8))) )
))
(declare-fun Unit!8957 () Unit!8944)

(declare-fun Unit!8958 () Unit!8944)

(assert (=> d!46069 (= (readByte!0 (_1!6747 lt!222490)) (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223244) #b00000000000000000000000000000000) (tuple2!12831 Unit!8957 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223245) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222490))) (bvadd (currentByte!6285 (_1!6747 lt!222490)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223244)))))))) (tuple2!12831 Unit!8958 lt!223245))) (BitStream!5203 (buf!3401 (_1!6747 lt!222490)) (bvadd (currentByte!6285 (_1!6747 lt!222490)) #b00000000000000000000000000000001) (currentBit!6280 (_1!6747 lt!222490)))))))

(declare-fun b!143923 () Bool)

(declare-fun e!95855 () Bool)

(assert (=> b!143923 (= e!95856 e!95855)))

(declare-fun res!120239 () Bool)

(assert (=> b!143923 (=> (not res!120239) (not e!95855))))

(declare-fun lt!223243 () tuple2!12826)

(assert (=> b!143923 (= res!120239 (= (buf!3401 (_2!6755 lt!223243)) (buf!3401 (_1!6747 lt!222490))))))

(declare-fun lt!223246 () (_ BitVec 8))

(declare-fun lt!223242 () (_ BitVec 8))

(declare-fun Unit!8959 () Unit!8944)

(declare-fun Unit!8960 () Unit!8944)

(assert (=> b!143923 (= lt!223243 (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223246) #b00000000000000000000000000000000) (tuple2!12831 Unit!8959 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223242) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222490))) (bvadd (currentByte!6285 (_1!6747 lt!222490)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223246)))))))) (tuple2!12831 Unit!8960 lt!223242))) (BitStream!5203 (buf!3401 (_1!6747 lt!222490)) (bvadd (currentByte!6285 (_1!6747 lt!222490)) #b00000000000000000000000000000001) (currentBit!6280 (_1!6747 lt!222490)))))))

(assert (=> b!143923 (= lt!223242 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222490))) (currentByte!6285 (_1!6747 lt!222490)))) ((_ sign_extend 24) lt!223246))))))

(assert (=> b!143923 (= lt!223246 ((_ extract 7 0) (currentBit!6280 (_1!6747 lt!222490))))))

(declare-fun lt!223241 () (_ BitVec 64))

(declare-fun lt!223240 () (_ BitVec 64))

(declare-fun b!143924 () Bool)

(assert (=> b!143924 (= e!95855 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223243))) (currentByte!6285 (_2!6755 lt!223243)) (currentBit!6280 (_2!6755 lt!223243))) (bvadd lt!223241 lt!223240)))))

(assert (=> b!143924 (or (not (= (bvand lt!223241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223240 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223241 lt!223240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143924 (= lt!223240 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!143924 (= lt!223241 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222490))) (currentByte!6285 (_1!6747 lt!222490)) (currentBit!6280 (_1!6747 lt!222490))))))

(assert (= (and d!46069 res!120240) b!143923))

(assert (= (and b!143923 res!120239) b!143924))

(declare-fun m!221121 () Bool)

(assert (=> d!46069 m!221121))

(declare-fun m!221123 () Bool)

(assert (=> d!46069 m!221123))

(declare-fun m!221125 () Bool)

(assert (=> d!46069 m!221125))

(assert (=> b!143923 m!221125))

(assert (=> b!143923 m!221121))

(declare-fun m!221127 () Bool)

(assert (=> b!143924 m!221127))

(declare-fun m!221129 () Bool)

(assert (=> b!143924 m!221129))

(assert (=> d!45910 d!46069))

(declare-fun d!46071 () Bool)

(declare-fun res!120241 () Bool)

(declare-fun e!95858 () Bool)

(assert (=> d!46071 (=> (not res!120241) (not e!95858))))

(assert (=> d!46071 (= res!120241 (= (size!2972 (buf!3401 (_1!6747 lt!223128))) (size!2972 (buf!3401 thiss!1634))))))

(assert (=> d!46071 (= (isPrefixOf!0 (_1!6747 lt!223128) thiss!1634) e!95858)))

(declare-fun b!143925 () Bool)

(declare-fun res!120243 () Bool)

(assert (=> b!143925 (=> (not res!120243) (not e!95858))))

(assert (=> b!143925 (= res!120243 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223128))) (currentByte!6285 (_1!6747 lt!223128)) (currentBit!6280 (_1!6747 lt!223128))) (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(declare-fun b!143926 () Bool)

(declare-fun e!95857 () Bool)

(assert (=> b!143926 (= e!95858 e!95857)))

(declare-fun res!120242 () Bool)

(assert (=> b!143926 (=> res!120242 e!95857)))

(assert (=> b!143926 (= res!120242 (= (size!2972 (buf!3401 (_1!6747 lt!223128))) #b00000000000000000000000000000000))))

(declare-fun b!143927 () Bool)

(assert (=> b!143927 (= e!95857 (arrayBitRangesEq!0 (buf!3401 (_1!6747 lt!223128)) (buf!3401 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223128))) (currentByte!6285 (_1!6747 lt!223128)) (currentBit!6280 (_1!6747 lt!223128)))))))

(assert (= (and d!46071 res!120241) b!143925))

(assert (= (and b!143925 res!120243) b!143926))

(assert (= (and b!143926 (not res!120242)) b!143927))

(declare-fun m!221131 () Bool)

(assert (=> b!143925 m!221131))

(assert (=> b!143925 m!220507))

(assert (=> b!143927 m!221131))

(assert (=> b!143927 m!221131))

(declare-fun m!221133 () Bool)

(assert (=> b!143927 m!221133))

(assert (=> b!143868 d!46071))

(declare-fun d!46073 () Bool)

(assert (=> d!46073 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 thiss!1634)))))))

(assert (=> d!46000 d!46073))

(declare-fun d!46075 () Bool)

(declare-fun res!120244 () Bool)

(declare-fun e!95859 () Bool)

(assert (=> d!46075 (=> res!120244 e!95859)))

(assert (=> d!46075 (= res!120244 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!46075 (= (arrayRangesEq!288 arr!237 (_2!6748 lt!222489) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!95859)))

(declare-fun b!143928 () Bool)

(declare-fun e!95860 () Bool)

(assert (=> b!143928 (= e!95859 e!95860)))

(declare-fun res!120245 () Bool)

(assert (=> b!143928 (=> (not res!120245) (not e!95860))))

(assert (=> b!143928 (= res!120245 (= (select (arr!3695 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3695 (_2!6748 lt!222489)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!143929 () Bool)

(assert (=> b!143929 (= e!95860 (arrayRangesEq!288 arr!237 (_2!6748 lt!222489) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46075 (not res!120244)) b!143928))

(assert (= (and b!143928 res!120245) b!143929))

(declare-fun m!221135 () Bool)

(assert (=> b!143928 m!221135))

(declare-fun m!221137 () Bool)

(assert (=> b!143928 m!221137))

(declare-fun m!221139 () Bool)

(assert (=> b!143929 m!221139))

(assert (=> b!143807 d!46075))

(declare-fun d!46077 () Bool)

(declare-fun lt!223252 () (_ BitVec 8))

(declare-fun lt!223251 () (_ BitVec 8))

(assert (=> d!46077 (= lt!223252 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))) ((_ sign_extend 24) lt!223251))))))

(assert (=> d!46077 (= lt!223251 ((_ extract 7 0) (currentBit!6280 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))))

(declare-fun e!95862 () Bool)

(assert (=> d!46077 e!95862))

(declare-fun res!120247 () Bool)

(assert (=> d!46077 (=> (not res!120247) (not e!95862))))

(assert (=> d!46077 (= res!120247 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))) ((_ sign_extend 32) (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) ((_ sign_extend 32) (currentBit!6280 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8961 () Unit!8944)

(declare-fun Unit!8962 () Unit!8944)

(assert (=> d!46077 (= (readByte!0 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223251) #b00000000000000000000000000000000) (tuple2!12831 Unit!8961 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223252) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) (bvadd (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223251)))))))) (tuple2!12831 Unit!8962 lt!223252))) (BitStream!5203 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) (bvadd (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6280 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))))

(declare-fun b!143930 () Bool)

(declare-fun e!95861 () Bool)

(assert (=> b!143930 (= e!95862 e!95861)))

(declare-fun res!120246 () Bool)

(assert (=> b!143930 (=> (not res!120246) (not e!95861))))

(declare-fun lt!223250 () tuple2!12826)

(assert (=> b!143930 (= res!120246 (= (buf!3401 (_2!6755 lt!223250)) (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))))

(declare-fun lt!223249 () (_ BitVec 8))

(declare-fun lt!223253 () (_ BitVec 8))

(declare-fun Unit!8963 () Unit!8944)

(declare-fun Unit!8964 () Unit!8944)

(assert (=> b!143930 (= lt!223250 (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223253) #b00000000000000000000000000000000) (tuple2!12831 Unit!8963 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223249) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) (bvadd (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223253)))))))) (tuple2!12831 Unit!8964 lt!223249))) (BitStream!5203 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) (bvadd (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6280 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))))

(assert (=> b!143930 (= lt!223249 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))) ((_ sign_extend 24) lt!223253))))))

(assert (=> b!143930 (= lt!223253 ((_ extract 7 0) (currentBit!6280 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))))

(declare-fun lt!223248 () (_ BitVec 64))

(declare-fun b!143931 () Bool)

(declare-fun lt!223247 () (_ BitVec 64))

(assert (=> b!143931 (= e!95861 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223250))) (currentByte!6285 (_2!6755 lt!223250)) (currentBit!6280 (_2!6755 lt!223250))) (bvadd lt!223248 lt!223247)))))

(assert (=> b!143931 (or (not (= (bvand lt!223248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223247 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223248 lt!223247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143931 (= lt!223247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!143931 (= lt!223248 (bitIndex!0 (size!2972 (buf!3401 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))) (currentByte!6285 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) (currentBit!6280 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))))

(assert (= (and d!46077 res!120247) b!143930))

(assert (= (and b!143930 res!120246) b!143931))

(declare-fun m!221141 () Bool)

(assert (=> d!46077 m!221141))

(declare-fun m!221143 () Bool)

(assert (=> d!46077 m!221143))

(declare-fun m!221145 () Bool)

(assert (=> d!46077 m!221145))

(assert (=> b!143930 m!221145))

(assert (=> b!143930 m!221141))

(declare-fun m!221147 () Bool)

(assert (=> b!143931 m!221147))

(declare-fun m!221149 () Bool)

(assert (=> b!143931 m!221149))

(assert (=> d!46022 d!46077))

(declare-fun d!46079 () Bool)

(assert (=> d!46079 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))))))))

(assert (=> d!45967 d!46079))

(declare-fun d!46081 () Bool)

(assert (=> d!46081 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!223064) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222486)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) lt!223064))))

(declare-fun bs!11303 () Bool)

(assert (= bs!11303 d!46081))

(assert (=> bs!11303 m!220833))

(assert (=> b!143852 d!46081))

(declare-fun d!46083 () Bool)

(assert (=> d!46083 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222493))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222493)))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222493))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222493))))))))

(assert (=> d!45943 d!46083))

(declare-fun d!46085 () Bool)

(assert (=> d!46085 (= (invariant!0 (currentBit!6280 (_2!6745 lt!222493)) (currentByte!6285 (_2!6745 lt!222493)) (size!2972 (buf!3401 (_2!6745 lt!222493)))) (and (bvsge (currentBit!6280 (_2!6745 lt!222493)) #b00000000000000000000000000000000) (bvslt (currentBit!6280 (_2!6745 lt!222493)) #b00000000000000000000000000001000) (bvsge (currentByte!6285 (_2!6745 lt!222493)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6285 (_2!6745 lt!222493)) (size!2972 (buf!3401 (_2!6745 lt!222493)))) (and (= (currentBit!6280 (_2!6745 lt!222493)) #b00000000000000000000000000000000) (= (currentByte!6285 (_2!6745 lt!222493)) (size!2972 (buf!3401 (_2!6745 lt!222493))))))))))

(assert (=> d!45943 d!46085))

(declare-fun e!95879 () Bool)

(declare-datatypes ((tuple4!130 0))(
  ( (tuple4!131 (_1!6760 (_ BitVec 32)) (_2!6760 (_ BitVec 32)) (_3!344 (_ BitVec 32)) (_4!65 (_ BitVec 32))) )
))
(declare-fun lt!223260 () tuple4!130)

(declare-fun b!143946 () Bool)

(assert (=> b!143946 (= e!95879 (arrayRangesEq!288 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222486)) (_1!6760 lt!223260) (_2!6760 lt!223260)))))

(declare-fun b!143947 () Bool)

(declare-fun e!95878 () Bool)

(declare-fun call!1857 () Bool)

(assert (=> b!143947 (= e!95878 call!1857)))

(declare-fun b!143949 () Bool)

(declare-fun e!95880 () Bool)

(declare-fun e!95876 () Bool)

(assert (=> b!143949 (= e!95880 e!95876)))

(declare-fun res!120260 () Bool)

(declare-fun lt!223262 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!143949 (= res!120260 (byteRangesEq!0 (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223260)) (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223260)) lt!223262 #b00000000000000000000000000001000))))

(assert (=> b!143949 (=> (not res!120260) (not e!95876))))

(declare-fun b!143950 () Bool)

(declare-fun res!120262 () Bool)

(declare-fun lt!223261 () (_ BitVec 32))

(assert (=> b!143950 (= res!120262 (= lt!223261 #b00000000000000000000000000000000))))

(assert (=> b!143950 (=> res!120262 e!95878)))

(assert (=> b!143950 (= e!95876 e!95878)))

(declare-fun b!143951 () Bool)

(assert (=> b!143951 (= e!95880 call!1857)))

(declare-fun b!143952 () Bool)

(declare-fun e!95877 () Bool)

(assert (=> b!143952 (= e!95877 e!95880)))

(declare-fun c!7860 () Bool)

(assert (=> b!143952 (= c!7860 (= (_3!344 lt!223260) (_4!65 lt!223260)))))

(declare-fun bm!1854 () Bool)

(assert (=> bm!1854 (= call!1857 (byteRangesEq!0 (ite c!7860 (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223260)) (select (arr!3695 (buf!3401 thiss!1634)) (_4!65 lt!223260))) (ite c!7860 (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223260)) (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_4!65 lt!223260))) (ite c!7860 lt!223262 #b00000000000000000000000000000000) lt!223261))))

(declare-fun b!143948 () Bool)

(declare-fun e!95875 () Bool)

(assert (=> b!143948 (= e!95875 e!95877)))

(declare-fun res!120259 () Bool)

(assert (=> b!143948 (=> (not res!120259) (not e!95877))))

(assert (=> b!143948 (= res!120259 e!95879)))

(declare-fun res!120261 () Bool)

(assert (=> b!143948 (=> res!120261 e!95879)))

(assert (=> b!143948 (= res!120261 (bvsge (_1!6760 lt!223260) (_2!6760 lt!223260)))))

(assert (=> b!143948 (= lt!223261 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143948 (= lt!223262 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!130)

(assert (=> b!143948 (= lt!223260 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(declare-fun d!46087 () Bool)

(declare-fun res!120258 () Bool)

(assert (=> d!46087 (=> res!120258 e!95875)))

(assert (=> d!46087 (= res!120258 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (=> d!46087 (= (arrayBitRangesEq!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) e!95875)))

(assert (= (and d!46087 (not res!120258)) b!143948))

(assert (= (and b!143948 (not res!120261)) b!143946))

(assert (= (and b!143948 res!120259) b!143952))

(assert (= (and b!143952 c!7860) b!143951))

(assert (= (and b!143952 (not c!7860)) b!143949))

(assert (= (and b!143949 res!120260) b!143950))

(assert (= (and b!143950 (not res!120262)) b!143947))

(assert (= (or b!143951 b!143947) bm!1854))

(declare-fun m!221151 () Bool)

(assert (=> b!143946 m!221151))

(declare-fun m!221153 () Bool)

(assert (=> b!143949 m!221153))

(declare-fun m!221155 () Bool)

(assert (=> b!143949 m!221155))

(assert (=> b!143949 m!221153))

(assert (=> b!143949 m!221155))

(declare-fun m!221157 () Bool)

(assert (=> b!143949 m!221157))

(assert (=> bm!1854 m!221155))

(declare-fun m!221159 () Bool)

(assert (=> bm!1854 m!221159))

(declare-fun m!221161 () Bool)

(assert (=> bm!1854 m!221161))

(declare-fun m!221163 () Bool)

(assert (=> bm!1854 m!221163))

(assert (=> bm!1854 m!221153))

(assert (=> b!143948 m!220507))

(declare-fun m!221165 () Bool)

(assert (=> b!143948 m!221165))

(assert (=> b!143779 d!46087))

(assert (=> b!143779 d!46053))

(declare-fun lt!223263 () tuple3!554)

(declare-fun d!46089 () Bool)

(assert (=> d!46089 (= lt!223263 (readByteArrayLoop!0 (_1!6747 lt!223065) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46089 (= (readByteArrayLoopPure!0 (_1!6747 lt!223065) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12815 (_2!6757 lt!223263) (_3!342 lt!223263)))))

(declare-fun bs!11304 () Bool)

(assert (= bs!11304 d!46089))

(declare-fun m!221167 () Bool)

(assert (=> bs!11304 m!221167))

(assert (=> b!143850 d!46089))

(declare-fun d!46091 () Bool)

(assert (=> d!46091 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!223064) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486)))) lt!223064))))

(declare-fun bs!11305 () Bool)

(assert (= bs!11305 d!46091))

(declare-fun m!221169 () Bool)

(assert (=> bs!11305 m!221169))

(assert (=> b!143850 d!46091))

(declare-fun d!46093 () Bool)

(assert (=> d!46093 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!223064)))

(declare-fun lt!223264 () Unit!8944)

(assert (=> d!46093 (= lt!223264 (choose!9 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!223074)) lt!223064 (BitStream!5203 (buf!3401 (_2!6745 lt!223074)) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (=> d!46093 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!223074)) lt!223064) lt!223264)))

(declare-fun bs!11306 () Bool)

(assert (= bs!11306 d!46093))

(assert (=> bs!11306 m!220935))

(declare-fun m!221171 () Bool)

(assert (=> bs!11306 m!221171))

(assert (=> b!143850 d!46093))

(declare-fun b!143953 () Bool)

(declare-fun e!95881 () Unit!8944)

(declare-fun lt!223278 () Unit!8944)

(assert (=> b!143953 (= e!95881 lt!223278)))

(declare-fun lt!223272 () (_ BitVec 64))

(assert (=> b!143953 (= lt!223272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223270 () (_ BitVec 64))

(assert (=> b!143953 (= lt!223270 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(assert (=> b!143953 (= lt!223278 (arrayBitRangesEqSymmetric!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!223074)) lt!223272 lt!223270))))

(assert (=> b!143953 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!223074)) (buf!3401 (_2!6745 lt!222486)) lt!223272 lt!223270)))

(declare-fun b!143954 () Bool)

(declare-fun res!120264 () Bool)

(declare-fun e!95882 () Bool)

(assert (=> b!143954 (=> (not res!120264) (not e!95882))))

(declare-fun lt!223283 () tuple2!12812)

(assert (=> b!143954 (= res!120264 (isPrefixOf!0 (_2!6747 lt!223283) (_2!6745 lt!223074)))))

(declare-fun lt!223275 () (_ BitVec 64))

(declare-fun lt!223280 () (_ BitVec 64))

(declare-fun b!143955 () Bool)

(assert (=> b!143955 (= e!95882 (= (_1!6747 lt!223283) (withMovedBitIndex!0 (_2!6747 lt!223283) (bvsub lt!223275 lt!223280))))))

(assert (=> b!143955 (or (= (bvand lt!223275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223275 lt!223280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143955 (= lt!223280 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223074))) (currentByte!6285 (_2!6745 lt!223074)) (currentBit!6280 (_2!6745 lt!223074))))))

(assert (=> b!143955 (= lt!223275 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(declare-fun d!46095 () Bool)

(assert (=> d!46095 e!95882))

(declare-fun res!120263 () Bool)

(assert (=> d!46095 (=> (not res!120263) (not e!95882))))

(assert (=> d!46095 (= res!120263 (isPrefixOf!0 (_1!6747 lt!223283) (_2!6747 lt!223283)))))

(declare-fun lt!223276 () BitStream!5202)

(assert (=> d!46095 (= lt!223283 (tuple2!12813 lt!223276 (_2!6745 lt!223074)))))

(declare-fun lt!223277 () Unit!8944)

(declare-fun lt!223268 () Unit!8944)

(assert (=> d!46095 (= lt!223277 lt!223268)))

(assert (=> d!46095 (isPrefixOf!0 lt!223276 (_2!6745 lt!223074))))

(assert (=> d!46095 (= lt!223268 (lemmaIsPrefixTransitive!0 lt!223276 (_2!6745 lt!223074) (_2!6745 lt!223074)))))

(declare-fun lt!223266 () Unit!8944)

(declare-fun lt!223281 () Unit!8944)

(assert (=> d!46095 (= lt!223266 lt!223281)))

(assert (=> d!46095 (isPrefixOf!0 lt!223276 (_2!6745 lt!223074))))

(assert (=> d!46095 (= lt!223281 (lemmaIsPrefixTransitive!0 lt!223276 (_2!6745 lt!222486) (_2!6745 lt!223074)))))

(declare-fun lt!223267 () Unit!8944)

(assert (=> d!46095 (= lt!223267 e!95881)))

(declare-fun c!7861 () Bool)

(assert (=> d!46095 (= c!7861 (not (= (size!2972 (buf!3401 (_2!6745 lt!222486))) #b00000000000000000000000000000000)))))

(declare-fun lt!223279 () Unit!8944)

(declare-fun lt!223269 () Unit!8944)

(assert (=> d!46095 (= lt!223279 lt!223269)))

(assert (=> d!46095 (isPrefixOf!0 (_2!6745 lt!223074) (_2!6745 lt!223074))))

(assert (=> d!46095 (= lt!223269 (lemmaIsPrefixRefl!0 (_2!6745 lt!223074)))))

(declare-fun lt!223282 () Unit!8944)

(declare-fun lt!223273 () Unit!8944)

(assert (=> d!46095 (= lt!223282 lt!223273)))

(assert (=> d!46095 (= lt!223273 (lemmaIsPrefixRefl!0 (_2!6745 lt!223074)))))

(declare-fun lt!223265 () Unit!8944)

(declare-fun lt!223274 () Unit!8944)

(assert (=> d!46095 (= lt!223265 lt!223274)))

(assert (=> d!46095 (isPrefixOf!0 lt!223276 lt!223276)))

(assert (=> d!46095 (= lt!223274 (lemmaIsPrefixRefl!0 lt!223276))))

(declare-fun lt!223284 () Unit!8944)

(declare-fun lt!223271 () Unit!8944)

(assert (=> d!46095 (= lt!223284 lt!223271)))

(assert (=> d!46095 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222486))))

(assert (=> d!46095 (= lt!223271 (lemmaIsPrefixRefl!0 (_2!6745 lt!222486)))))

(assert (=> d!46095 (= lt!223276 (BitStream!5203 (buf!3401 (_2!6745 lt!223074)) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))))))

(assert (=> d!46095 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!223074))))

(assert (=> d!46095 (= (reader!0 (_2!6745 lt!222486) (_2!6745 lt!223074)) lt!223283)))

(declare-fun b!143956 () Bool)

(declare-fun res!120265 () Bool)

(assert (=> b!143956 (=> (not res!120265) (not e!95882))))

(assert (=> b!143956 (= res!120265 (isPrefixOf!0 (_1!6747 lt!223283) (_2!6745 lt!222486)))))

(declare-fun b!143957 () Bool)

(declare-fun Unit!8965 () Unit!8944)

(assert (=> b!143957 (= e!95881 Unit!8965)))

(assert (= (and d!46095 c!7861) b!143953))

(assert (= (and d!46095 (not c!7861)) b!143957))

(assert (= (and d!46095 res!120263) b!143956))

(assert (= (and b!143956 res!120265) b!143954))

(assert (= (and b!143954 res!120264) b!143955))

(declare-fun m!221173 () Bool)

(assert (=> b!143954 m!221173))

(declare-fun m!221175 () Bool)

(assert (=> b!143956 m!221175))

(declare-fun m!221177 () Bool)

(assert (=> b!143955 m!221177))

(assert (=> b!143955 m!220941))

(assert (=> b!143955 m!220503))

(assert (=> b!143953 m!220503))

(declare-fun m!221179 () Bool)

(assert (=> b!143953 m!221179))

(declare-fun m!221181 () Bool)

(assert (=> b!143953 m!221181))

(declare-fun m!221183 () Bool)

(assert (=> d!46095 m!221183))

(declare-fun m!221185 () Bool)

(assert (=> d!46095 m!221185))

(assert (=> d!46095 m!220943))

(declare-fun m!221187 () Bool)

(assert (=> d!46095 m!221187))

(declare-fun m!221189 () Bool)

(assert (=> d!46095 m!221189))

(assert (=> d!46095 m!220817))

(assert (=> d!46095 m!220819))

(declare-fun m!221191 () Bool)

(assert (=> d!46095 m!221191))

(declare-fun m!221193 () Bool)

(assert (=> d!46095 m!221193))

(declare-fun m!221195 () Bool)

(assert (=> d!46095 m!221195))

(declare-fun m!221197 () Bool)

(assert (=> d!46095 m!221197))

(assert (=> b!143850 d!46095))

(declare-fun d!46097 () Bool)

(declare-fun lt!223290 () (_ BitVec 8))

(declare-fun lt!223289 () (_ BitVec 8))

(assert (=> d!46097 (= lt!223290 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222487))) (currentByte!6285 (_1!6747 lt!222487)))) ((_ sign_extend 24) lt!223289))))))

(assert (=> d!46097 (= lt!223289 ((_ extract 7 0) (currentBit!6280 (_1!6747 lt!222487))))))

(declare-fun e!95884 () Bool)

(assert (=> d!46097 e!95884))

(declare-fun res!120267 () Bool)

(assert (=> d!46097 (=> (not res!120267) (not e!95884))))

(assert (=> d!46097 (= res!120267 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6747 lt!222487)))) ((_ sign_extend 32) (currentByte!6285 (_1!6747 lt!222487))) ((_ sign_extend 32) (currentBit!6280 (_1!6747 lt!222487))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8966 () Unit!8944)

(declare-fun Unit!8967 () Unit!8944)

(assert (=> d!46097 (= (readByte!0 (_1!6747 lt!222487)) (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223289) #b00000000000000000000000000000000) (tuple2!12831 Unit!8966 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223290) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222487))) (bvadd (currentByte!6285 (_1!6747 lt!222487)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223289)))))))) (tuple2!12831 Unit!8967 lt!223290))) (BitStream!5203 (buf!3401 (_1!6747 lt!222487)) (bvadd (currentByte!6285 (_1!6747 lt!222487)) #b00000000000000000000000000000001) (currentBit!6280 (_1!6747 lt!222487)))))))

(declare-fun b!143958 () Bool)

(declare-fun e!95883 () Bool)

(assert (=> b!143958 (= e!95884 e!95883)))

(declare-fun res!120266 () Bool)

(assert (=> b!143958 (=> (not res!120266) (not e!95883))))

(declare-fun lt!223288 () tuple2!12826)

(assert (=> b!143958 (= res!120266 (= (buf!3401 (_2!6755 lt!223288)) (buf!3401 (_1!6747 lt!222487))))))

(declare-fun lt!223287 () (_ BitVec 8))

(declare-fun lt!223291 () (_ BitVec 8))

(declare-fun Unit!8968 () Unit!8944)

(declare-fun Unit!8969 () Unit!8944)

(assert (=> b!143958 (= lt!223288 (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223291) #b00000000000000000000000000000000) (tuple2!12831 Unit!8968 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223287) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222487))) (bvadd (currentByte!6285 (_1!6747 lt!222487)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223291)))))))) (tuple2!12831 Unit!8969 lt!223287))) (BitStream!5203 (buf!3401 (_1!6747 lt!222487)) (bvadd (currentByte!6285 (_1!6747 lt!222487)) #b00000000000000000000000000000001) (currentBit!6280 (_1!6747 lt!222487)))))))

(assert (=> b!143958 (= lt!223287 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 (_1!6747 lt!222487))) (currentByte!6285 (_1!6747 lt!222487)))) ((_ sign_extend 24) lt!223291))))))

(assert (=> b!143958 (= lt!223291 ((_ extract 7 0) (currentBit!6280 (_1!6747 lt!222487))))))

(declare-fun b!143959 () Bool)

(declare-fun lt!223286 () (_ BitVec 64))

(declare-fun lt!223285 () (_ BitVec 64))

(assert (=> b!143959 (= e!95883 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223288))) (currentByte!6285 (_2!6755 lt!223288)) (currentBit!6280 (_2!6755 lt!223288))) (bvadd lt!223286 lt!223285)))))

(assert (=> b!143959 (or (not (= (bvand lt!223286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223285 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223286 lt!223285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!143959 (= lt!223285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!143959 (= lt!223286 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222487))) (currentByte!6285 (_1!6747 lt!222487)) (currentBit!6280 (_1!6747 lt!222487))))))

(assert (= (and d!46097 res!120267) b!143958))

(assert (= (and b!143958 res!120266) b!143959))

(declare-fun m!221199 () Bool)

(assert (=> d!46097 m!221199))

(declare-fun m!221201 () Bool)

(assert (=> d!46097 m!221201))

(declare-fun m!221203 () Bool)

(assert (=> d!46097 m!221203))

(assert (=> b!143958 m!221203))

(assert (=> b!143958 m!221199))

(declare-fun m!221205 () Bool)

(assert (=> b!143959 m!221205))

(declare-fun m!221207 () Bool)

(assert (=> b!143959 m!221207))

(assert (=> d!45998 d!46097))

(declare-fun d!46099 () Bool)

(assert (=> d!46099 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 thiss!1634)))))))

(assert (=> d!46053 d!46099))

(assert (=> d!46053 d!46051))

(declare-fun d!46101 () Bool)

(declare-fun res!120268 () Bool)

(declare-fun e!95886 () Bool)

(assert (=> d!46101 (=> (not res!120268) (not e!95886))))

(assert (=> d!46101 (= res!120268 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 (_2!6745 lt!223217)))))))

(assert (=> d!46101 (= (isPrefixOf!0 thiss!1634 (_2!6745 lt!223217)) e!95886)))

(declare-fun b!143960 () Bool)

(declare-fun res!120270 () Bool)

(assert (=> b!143960 (=> (not res!120270) (not e!95886))))

(assert (=> b!143960 (= res!120270 (bvsle (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223217))) (currentByte!6285 (_2!6745 lt!223217)) (currentBit!6280 (_2!6745 lt!223217)))))))

(declare-fun b!143961 () Bool)

(declare-fun e!95885 () Bool)

(assert (=> b!143961 (= e!95886 e!95885)))

(declare-fun res!120269 () Bool)

(assert (=> b!143961 (=> res!120269 e!95885)))

(assert (=> b!143961 (= res!120269 (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143962 () Bool)

(assert (=> b!143962 (= e!95885 (arrayBitRangesEq!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!223217)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (= (and d!46101 res!120268) b!143960))

(assert (= (and b!143960 res!120270) b!143961))

(assert (= (and b!143961 (not res!120269)) b!143962))

(assert (=> b!143960 m!220507))

(assert (=> b!143960 m!221099))

(assert (=> b!143962 m!220507))

(assert (=> b!143962 m!220507))

(declare-fun m!221209 () Bool)

(assert (=> b!143962 m!221209))

(assert (=> b!143906 d!46101))

(assert (=> b!143777 d!46053))

(assert (=> b!143777 d!45945))

(declare-fun d!46103 () Bool)

(declare-fun e!95887 () Bool)

(assert (=> d!46103 e!95887))

(declare-fun res!120272 () Bool)

(assert (=> d!46103 (=> (not res!120272) (not e!95887))))

(declare-fun lt!223293 () (_ BitVec 64))

(declare-fun lt!223297 () (_ BitVec 64))

(declare-fun lt!223292 () (_ BitVec 64))

(assert (=> d!46103 (= res!120272 (= lt!223292 (bvsub lt!223297 lt!223293)))))

(assert (=> d!46103 (or (= (bvand lt!223297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223297 lt!223293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46103 (= lt!223293 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!223074))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!223074)))))))

(declare-fun lt!223294 () (_ BitVec 64))

(declare-fun lt!223296 () (_ BitVec 64))

(assert (=> d!46103 (= lt!223297 (bvmul lt!223294 lt!223296))))

(assert (=> d!46103 (or (= lt!223294 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223296 (bvsdiv (bvmul lt!223294 lt!223296) lt!223294)))))

(assert (=> d!46103 (= lt!223296 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46103 (= lt!223294 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))))))

(assert (=> d!46103 (= lt!223292 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!223074))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!223074)))))))

(assert (=> d!46103 (invariant!0 (currentBit!6280 (_2!6745 lt!223074)) (currentByte!6285 (_2!6745 lt!223074)) (size!2972 (buf!3401 (_2!6745 lt!223074))))))

(assert (=> d!46103 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223074))) (currentByte!6285 (_2!6745 lt!223074)) (currentBit!6280 (_2!6745 lt!223074))) lt!223292)))

(declare-fun b!143963 () Bool)

(declare-fun res!120271 () Bool)

(assert (=> b!143963 (=> (not res!120271) (not e!95887))))

(assert (=> b!143963 (= res!120271 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223292))))

(declare-fun b!143964 () Bool)

(declare-fun lt!223295 () (_ BitVec 64))

(assert (=> b!143964 (= e!95887 (bvsle lt!223292 (bvmul lt!223295 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143964 (or (= lt!223295 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223295 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223295)))))

(assert (=> b!143964 (= lt!223295 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223074)))))))

(assert (= (and d!46103 res!120272) b!143963))

(assert (= (and b!143963 res!120271) b!143964))

(declare-fun m!221211 () Bool)

(assert (=> d!46103 m!221211))

(declare-fun m!221213 () Bool)

(assert (=> d!46103 m!221213))

(assert (=> b!143848 d!46103))

(assert (=> b!143848 d!45945))

(assert (=> d!45988 d!46041))

(declare-fun d!46105 () Bool)

(assert (=> d!46105 (isPrefixOf!0 thiss!1634 (_2!6745 lt!222493))))

(assert (=> d!46105 true))

(declare-fun _$15!222 () Unit!8944)

(assert (=> d!46105 (= (choose!30 thiss!1634 (_2!6745 lt!222486) (_2!6745 lt!222493)) _$15!222)))

(declare-fun bs!11307 () Bool)

(assert (= bs!11307 d!46105))

(assert (=> bs!11307 m!220495))

(assert (=> d!45988 d!46105))

(assert (=> d!45988 d!45941))

(assert (=> d!45969 d!45967))

(declare-fun d!46107 () Bool)

(assert (=> d!46107 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!222488)))

(assert (=> d!46107 true))

(declare-fun _$6!301 () Unit!8944)

(assert (=> d!46107 (= (choose!9 (_2!6745 lt!222486) (buf!3401 (_2!6745 lt!222493)) lt!222488 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))) _$6!301)))

(declare-fun bs!11308 () Bool)

(assert (= bs!11308 d!46107))

(assert (=> bs!11308 m!220517))

(assert (=> d!45969 d!46107))

(declare-fun d!46109 () Bool)

(assert (=> d!46109 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222486))))

(declare-fun lt!223300 () Unit!8944)

(declare-fun choose!11 (BitStream!5202) Unit!8944)

(assert (=> d!46109 (= lt!223300 (choose!11 (_2!6745 lt!222486)))))

(assert (=> d!46109 (= (lemmaIsPrefixRefl!0 (_2!6745 lt!222486)) lt!223300)))

(declare-fun bs!11310 () Bool)

(assert (= bs!11310 d!46109))

(assert (=> bs!11310 m!220817))

(declare-fun m!221215 () Bool)

(assert (=> bs!11310 m!221215))

(assert (=> d!45914 d!46109))

(declare-fun d!46111 () Bool)

(assert (=> d!46111 (isPrefixOf!0 lt!222906 (_2!6745 lt!222486))))

(declare-fun lt!223301 () Unit!8944)

(assert (=> d!46111 (= lt!223301 (choose!30 lt!222906 thiss!1634 (_2!6745 lt!222486)))))

(assert (=> d!46111 (isPrefixOf!0 lt!222906 thiss!1634)))

(assert (=> d!46111 (= (lemmaIsPrefixTransitive!0 lt!222906 thiss!1634 (_2!6745 lt!222486)) lt!223301)))

(declare-fun bs!11311 () Bool)

(assert (= bs!11311 d!46111))

(assert (=> bs!11311 m!220823))

(declare-fun m!221217 () Bool)

(assert (=> bs!11311 m!221217))

(declare-fun m!221219 () Bool)

(assert (=> bs!11311 m!221219))

(assert (=> d!45914 d!46111))

(declare-fun d!46113 () Bool)

(declare-fun res!120273 () Bool)

(declare-fun e!95889 () Bool)

(assert (=> d!46113 (=> (not res!120273) (not e!95889))))

(assert (=> d!46113 (= res!120273 (= (size!2972 (buf!3401 lt!222906)) (size!2972 (buf!3401 lt!222906))))))

(assert (=> d!46113 (= (isPrefixOf!0 lt!222906 lt!222906) e!95889)))

(declare-fun b!143965 () Bool)

(declare-fun res!120275 () Bool)

(assert (=> b!143965 (=> (not res!120275) (not e!95889))))

(assert (=> b!143965 (= res!120275 (bvsle (bitIndex!0 (size!2972 (buf!3401 lt!222906)) (currentByte!6285 lt!222906) (currentBit!6280 lt!222906)) (bitIndex!0 (size!2972 (buf!3401 lt!222906)) (currentByte!6285 lt!222906) (currentBit!6280 lt!222906))))))

(declare-fun b!143966 () Bool)

(declare-fun e!95888 () Bool)

(assert (=> b!143966 (= e!95889 e!95888)))

(declare-fun res!120274 () Bool)

(assert (=> b!143966 (=> res!120274 e!95888)))

(assert (=> b!143966 (= res!120274 (= (size!2972 (buf!3401 lt!222906)) #b00000000000000000000000000000000))))

(declare-fun b!143967 () Bool)

(assert (=> b!143967 (= e!95888 (arrayBitRangesEq!0 (buf!3401 lt!222906) (buf!3401 lt!222906) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 lt!222906)) (currentByte!6285 lt!222906) (currentBit!6280 lt!222906))))))

(assert (= (and d!46113 res!120273) b!143965))

(assert (= (and b!143965 res!120275) b!143966))

(assert (= (and b!143966 (not res!120274)) b!143967))

(declare-fun m!221221 () Bool)

(assert (=> b!143965 m!221221))

(assert (=> b!143965 m!221221))

(assert (=> b!143967 m!221221))

(assert (=> b!143967 m!221221))

(declare-fun m!221223 () Bool)

(assert (=> b!143967 m!221223))

(assert (=> d!45914 d!46113))

(declare-fun d!46115 () Bool)

(declare-fun res!120276 () Bool)

(declare-fun e!95891 () Bool)

(assert (=> d!46115 (=> (not res!120276) (not e!95891))))

(assert (=> d!46115 (= res!120276 (= (size!2972 (buf!3401 lt!222906)) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (=> d!46115 (= (isPrefixOf!0 lt!222906 (_2!6745 lt!222486)) e!95891)))

(declare-fun b!143968 () Bool)

(declare-fun res!120278 () Bool)

(assert (=> b!143968 (=> (not res!120278) (not e!95891))))

(assert (=> b!143968 (= res!120278 (bvsle (bitIndex!0 (size!2972 (buf!3401 lt!222906)) (currentByte!6285 lt!222906) (currentBit!6280 lt!222906)) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun b!143969 () Bool)

(declare-fun e!95890 () Bool)

(assert (=> b!143969 (= e!95891 e!95890)))

(declare-fun res!120277 () Bool)

(assert (=> b!143969 (=> res!120277 e!95890)))

(assert (=> b!143969 (= res!120277 (= (size!2972 (buf!3401 lt!222906)) #b00000000000000000000000000000000))))

(declare-fun b!143970 () Bool)

(assert (=> b!143970 (= e!95890 (arrayBitRangesEq!0 (buf!3401 lt!222906) (buf!3401 (_2!6745 lt!222486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 lt!222906)) (currentByte!6285 lt!222906) (currentBit!6280 lt!222906))))))

(assert (= (and d!46115 res!120276) b!143968))

(assert (= (and b!143968 res!120278) b!143969))

(assert (= (and b!143969 (not res!120277)) b!143970))

(assert (=> b!143968 m!221221))

(assert (=> b!143968 m!220503))

(assert (=> b!143970 m!221221))

(assert (=> b!143970 m!221221))

(declare-fun m!221225 () Bool)

(assert (=> b!143970 m!221225))

(assert (=> d!45914 d!46115))

(assert (=> d!45914 d!45941))

(declare-fun d!46117 () Bool)

(assert (=> d!46117 (isPrefixOf!0 lt!222906 (_2!6745 lt!222486))))

(declare-fun lt!223302 () Unit!8944)

(assert (=> d!46117 (= lt!223302 (choose!30 lt!222906 (_2!6745 lt!222486) (_2!6745 lt!222486)))))

(assert (=> d!46117 (isPrefixOf!0 lt!222906 (_2!6745 lt!222486))))

(assert (=> d!46117 (= (lemmaIsPrefixTransitive!0 lt!222906 (_2!6745 lt!222486) (_2!6745 lt!222486)) lt!223302)))

(declare-fun bs!11312 () Bool)

(assert (= bs!11312 d!46117))

(assert (=> bs!11312 m!220823))

(declare-fun m!221227 () Bool)

(assert (=> bs!11312 m!221227))

(assert (=> bs!11312 m!220823))

(assert (=> d!45914 d!46117))

(declare-fun d!46119 () Bool)

(declare-fun res!120279 () Bool)

(declare-fun e!95893 () Bool)

(assert (=> d!46119 (=> (not res!120279) (not e!95893))))

(assert (=> d!46119 (= res!120279 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (=> d!46119 (= (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!222486)) e!95893)))

(declare-fun b!143971 () Bool)

(declare-fun res!120281 () Bool)

(assert (=> b!143971 (=> (not res!120281) (not e!95893))))

(assert (=> b!143971 (= res!120281 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun b!143972 () Bool)

(declare-fun e!95892 () Bool)

(assert (=> b!143972 (= e!95893 e!95892)))

(declare-fun res!120280 () Bool)

(assert (=> b!143972 (=> res!120280 e!95892)))

(assert (=> b!143972 (= res!120280 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) #b00000000000000000000000000000000))))

(declare-fun b!143973 () Bool)

(assert (=> b!143973 (= e!95892 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (= (and d!46119 res!120279) b!143971))

(assert (= (and b!143971 res!120281) b!143972))

(assert (= (and b!143972 (not res!120280)) b!143973))

(assert (=> b!143971 m!220503))

(assert (=> b!143971 m!220503))

(assert (=> b!143973 m!220503))

(assert (=> b!143973 m!220503))

(declare-fun m!221229 () Bool)

(assert (=> b!143973 m!221229))

(assert (=> d!45914 d!46119))

(declare-fun d!46121 () Bool)

(declare-fun res!120282 () Bool)

(declare-fun e!95895 () Bool)

(assert (=> d!46121 (=> (not res!120282) (not e!95895))))

(assert (=> d!46121 (= res!120282 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 thiss!1634))))))

(assert (=> d!46121 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!95895)))

(declare-fun b!143974 () Bool)

(declare-fun res!120284 () Bool)

(assert (=> b!143974 (=> (not res!120284) (not e!95895))))

(assert (=> b!143974 (= res!120284 (bvsle (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(declare-fun b!143975 () Bool)

(declare-fun e!95894 () Bool)

(assert (=> b!143975 (= e!95895 e!95894)))

(declare-fun res!120283 () Bool)

(assert (=> b!143975 (=> res!120283 e!95894)))

(assert (=> b!143975 (= res!120283 (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!143976 () Bool)

(assert (=> b!143976 (= e!95894 (arrayBitRangesEq!0 (buf!3401 thiss!1634) (buf!3401 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (= (and d!46121 res!120282) b!143974))

(assert (= (and b!143974 res!120284) b!143975))

(assert (= (and b!143975 (not res!120283)) b!143976))

(assert (=> b!143974 m!220507))

(assert (=> b!143974 m!220507))

(assert (=> b!143976 m!220507))

(assert (=> b!143976 m!220507))

(declare-fun m!221231 () Bool)

(assert (=> b!143976 m!221231))

(assert (=> d!45914 d!46121))

(declare-fun d!46123 () Bool)

(declare-fun res!120285 () Bool)

(declare-fun e!95897 () Bool)

(assert (=> d!46123 (=> (not res!120285) (not e!95897))))

(assert (=> d!46123 (= res!120285 (= (size!2972 (buf!3401 (_1!6747 lt!222913))) (size!2972 (buf!3401 (_2!6747 lt!222913)))))))

(assert (=> d!46123 (= (isPrefixOf!0 (_1!6747 lt!222913) (_2!6747 lt!222913)) e!95897)))

(declare-fun b!143977 () Bool)

(declare-fun res!120287 () Bool)

(assert (=> b!143977 (=> (not res!120287) (not e!95897))))

(assert (=> b!143977 (= res!120287 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222913))) (currentByte!6285 (_1!6747 lt!222913)) (currentBit!6280 (_1!6747 lt!222913))) (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!222913))) (currentByte!6285 (_2!6747 lt!222913)) (currentBit!6280 (_2!6747 lt!222913)))))))

(declare-fun b!143978 () Bool)

(declare-fun e!95896 () Bool)

(assert (=> b!143978 (= e!95897 e!95896)))

(declare-fun res!120286 () Bool)

(assert (=> b!143978 (=> res!120286 e!95896)))

(assert (=> b!143978 (= res!120286 (= (size!2972 (buf!3401 (_1!6747 lt!222913))) #b00000000000000000000000000000000))))

(declare-fun b!143979 () Bool)

(assert (=> b!143979 (= e!95896 (arrayBitRangesEq!0 (buf!3401 (_1!6747 lt!222913)) (buf!3401 (_2!6747 lt!222913)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222913))) (currentByte!6285 (_1!6747 lt!222913)) (currentBit!6280 (_1!6747 lt!222913)))))))

(assert (= (and d!46123 res!120285) b!143977))

(assert (= (and b!143977 res!120287) b!143978))

(assert (= (and b!143978 (not res!120286)) b!143979))

(declare-fun m!221233 () Bool)

(assert (=> b!143977 m!221233))

(assert (=> b!143977 m!221111))

(assert (=> b!143979 m!221233))

(assert (=> b!143979 m!221233))

(declare-fun m!221235 () Bool)

(assert (=> b!143979 m!221235))

(assert (=> d!45914 d!46123))

(declare-fun d!46125 () Bool)

(assert (=> d!46125 (isPrefixOf!0 lt!222906 lt!222906)))

(declare-fun lt!223303 () Unit!8944)

(assert (=> d!46125 (= lt!223303 (choose!11 lt!222906))))

(assert (=> d!46125 (= (lemmaIsPrefixRefl!0 lt!222906) lt!223303)))

(declare-fun bs!11313 () Bool)

(assert (= bs!11313 d!46125))

(assert (=> bs!11313 m!220821))

(declare-fun m!221237 () Bool)

(assert (=> bs!11313 m!221237))

(assert (=> d!45914 d!46125))

(declare-fun d!46127 () Bool)

(assert (=> d!46127 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!223304 () Unit!8944)

(assert (=> d!46127 (= lt!223304 (choose!11 thiss!1634))))

(assert (=> d!46127 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!223304)))

(declare-fun bs!11314 () Bool)

(assert (= bs!11314 d!46127))

(assert (=> bs!11314 m!220813))

(declare-fun m!221239 () Bool)

(assert (=> bs!11314 m!221239))

(assert (=> d!45914 d!46127))

(assert (=> b!143766 d!46053))

(declare-fun d!46129 () Bool)

(assert (=> d!46129 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 thiss!1634) lt!222902 lt!222900)))

(declare-fun lt!223307 () Unit!8944)

(declare-fun choose!8 (array!6565 array!6565 (_ BitVec 64) (_ BitVec 64)) Unit!8944)

(assert (=> d!46129 (= lt!223307 (choose!8 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222486)) lt!222902 lt!222900))))

(assert (=> d!46129 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222902) (bvsle lt!222902 lt!222900))))

(assert (=> d!46129 (= (arrayBitRangesEqSymmetric!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222486)) lt!222902 lt!222900) lt!223307)))

(declare-fun bs!11315 () Bool)

(assert (= bs!11315 d!46129))

(assert (=> bs!11315 m!220803))

(declare-fun m!221241 () Bool)

(assert (=> bs!11315 m!221241))

(assert (=> b!143766 d!46129))

(declare-fun lt!223308 () tuple4!130)

(declare-fun b!143980 () Bool)

(declare-fun e!95902 () Bool)

(assert (=> b!143980 (= e!95902 (arrayRangesEq!288 (buf!3401 (_2!6745 lt!222486)) (buf!3401 thiss!1634) (_1!6760 lt!223308) (_2!6760 lt!223308)))))

(declare-fun b!143981 () Bool)

(declare-fun e!95901 () Bool)

(declare-fun call!1858 () Bool)

(assert (=> b!143981 (= e!95901 call!1858)))

(declare-fun b!143983 () Bool)

(declare-fun e!95903 () Bool)

(declare-fun e!95899 () Bool)

(assert (=> b!143983 (= e!95903 e!95899)))

(declare-fun lt!223310 () (_ BitVec 32))

(declare-fun res!120290 () Bool)

(assert (=> b!143983 (= res!120290 (byteRangesEq!0 (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223308)) (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223308)) lt!223310 #b00000000000000000000000000001000))))

(assert (=> b!143983 (=> (not res!120290) (not e!95899))))

(declare-fun b!143984 () Bool)

(declare-fun res!120292 () Bool)

(declare-fun lt!223309 () (_ BitVec 32))

(assert (=> b!143984 (= res!120292 (= lt!223309 #b00000000000000000000000000000000))))

(assert (=> b!143984 (=> res!120292 e!95901)))

(assert (=> b!143984 (= e!95899 e!95901)))

(declare-fun b!143985 () Bool)

(assert (=> b!143985 (= e!95903 call!1858)))

(declare-fun b!143986 () Bool)

(declare-fun e!95900 () Bool)

(assert (=> b!143986 (= e!95900 e!95903)))

(declare-fun c!7862 () Bool)

(assert (=> b!143986 (= c!7862 (= (_3!344 lt!223308) (_4!65 lt!223308)))))

(declare-fun bm!1855 () Bool)

(assert (=> bm!1855 (= call!1858 (byteRangesEq!0 (ite c!7862 (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223308)) (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_4!65 lt!223308))) (ite c!7862 (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223308)) (select (arr!3695 (buf!3401 thiss!1634)) (_4!65 lt!223308))) (ite c!7862 lt!223310 #b00000000000000000000000000000000) lt!223309))))

(declare-fun b!143982 () Bool)

(declare-fun e!95898 () Bool)

(assert (=> b!143982 (= e!95898 e!95900)))

(declare-fun res!120289 () Bool)

(assert (=> b!143982 (=> (not res!120289) (not e!95900))))

(assert (=> b!143982 (= res!120289 e!95902)))

(declare-fun res!120291 () Bool)

(assert (=> b!143982 (=> res!120291 e!95902)))

(assert (=> b!143982 (= res!120291 (bvsge (_1!6760 lt!223308) (_2!6760 lt!223308)))))

(assert (=> b!143982 (= lt!223309 ((_ extract 31 0) (bvsrem lt!222900 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143982 (= lt!223310 ((_ extract 31 0) (bvsrem lt!222902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143982 (= lt!223308 (arrayBitIndices!0 lt!222902 lt!222900))))

(declare-fun d!46131 () Bool)

(declare-fun res!120288 () Bool)

(assert (=> d!46131 (=> res!120288 e!95898)))

(assert (=> d!46131 (= res!120288 (bvsge lt!222902 lt!222900))))

(assert (=> d!46131 (= (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 thiss!1634) lt!222902 lt!222900) e!95898)))

(assert (= (and d!46131 (not res!120288)) b!143982))

(assert (= (and b!143982 (not res!120291)) b!143980))

(assert (= (and b!143982 res!120289) b!143986))

(assert (= (and b!143986 c!7862) b!143985))

(assert (= (and b!143986 (not c!7862)) b!143983))

(assert (= (and b!143983 res!120290) b!143984))

(assert (= (and b!143984 (not res!120292)) b!143981))

(assert (= (or b!143985 b!143981) bm!1855))

(declare-fun m!221243 () Bool)

(assert (=> b!143980 m!221243))

(declare-fun m!221245 () Bool)

(assert (=> b!143983 m!221245))

(declare-fun m!221247 () Bool)

(assert (=> b!143983 m!221247))

(assert (=> b!143983 m!221245))

(assert (=> b!143983 m!221247))

(declare-fun m!221249 () Bool)

(assert (=> b!143983 m!221249))

(assert (=> bm!1855 m!221247))

(declare-fun m!221251 () Bool)

(assert (=> bm!1855 m!221251))

(declare-fun m!221253 () Bool)

(assert (=> bm!1855 m!221253))

(declare-fun m!221255 () Bool)

(assert (=> bm!1855 m!221255))

(assert (=> bm!1855 m!221245))

(declare-fun m!221257 () Bool)

(assert (=> b!143982 m!221257))

(assert (=> b!143766 d!46131))

(declare-fun d!46133 () Bool)

(declare-fun e!95906 () Bool)

(assert (=> d!46133 e!95906))

(declare-fun res!120295 () Bool)

(assert (=> d!46133 (=> (not res!120295) (not e!95906))))

(declare-fun lt!223316 () (_ BitVec 64))

(declare-fun lt!223315 () BitStream!5202)

(assert (=> d!46133 (= res!120295 (= (bvadd lt!223316 (bvsub lt!223120 lt!223125)) (bitIndex!0 (size!2972 (buf!3401 lt!223315)) (currentByte!6285 lt!223315) (currentBit!6280 lt!223315))))))

(assert (=> d!46133 (or (not (= (bvand lt!223316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223120 lt!223125) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223316 (bvsub lt!223120 lt!223125)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46133 (= lt!223316 (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223128))) (currentByte!6285 (_2!6747 lt!223128)) (currentBit!6280 (_2!6747 lt!223128))))))

(declare-fun moveBitIndex!0 (BitStream!5202 (_ BitVec 64)) tuple2!12808)

(assert (=> d!46133 (= lt!223315 (_2!6745 (moveBitIndex!0 (_2!6747 lt!223128) (bvsub lt!223120 lt!223125))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5202 (_ BitVec 64)) Bool)

(assert (=> d!46133 (moveBitIndexPrecond!0 (_2!6747 lt!223128) (bvsub lt!223120 lt!223125))))

(assert (=> d!46133 (= (withMovedBitIndex!0 (_2!6747 lt!223128) (bvsub lt!223120 lt!223125)) lt!223315)))

(declare-fun b!143989 () Bool)

(assert (=> b!143989 (= e!95906 (= (size!2972 (buf!3401 (_2!6747 lt!223128))) (size!2972 (buf!3401 lt!223315))))))

(assert (= (and d!46133 res!120295) b!143989))

(declare-fun m!221259 () Bool)

(assert (=> d!46133 m!221259))

(assert (=> d!46133 m!221107))

(declare-fun m!221261 () Bool)

(assert (=> d!46133 m!221261))

(declare-fun m!221263 () Bool)

(assert (=> d!46133 m!221263))

(assert (=> b!143867 d!46133))

(assert (=> b!143867 d!45943))

(assert (=> b!143867 d!46053))

(declare-fun d!46135 () Bool)

(declare-fun e!95907 () Bool)

(assert (=> d!46135 e!95907))

(declare-fun res!120296 () Bool)

(assert (=> d!46135 (=> (not res!120296) (not e!95907))))

(declare-fun lt!223318 () (_ BitVec 64))

(declare-fun lt!223317 () BitStream!5202)

(assert (=> d!46135 (= res!120296 (= (bvadd lt!223318 (bvsub lt!222995 lt!223000)) (bitIndex!0 (size!2972 (buf!3401 lt!223317)) (currentByte!6285 lt!223317) (currentBit!6280 lt!223317))))))

(assert (=> d!46135 (or (not (= (bvand lt!223318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222995 lt!223000) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223318 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223318 (bvsub lt!222995 lt!223000)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46135 (= lt!223318 (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223003))) (currentByte!6285 (_2!6747 lt!223003)) (currentBit!6280 (_2!6747 lt!223003))))))

(assert (=> d!46135 (= lt!223317 (_2!6745 (moveBitIndex!0 (_2!6747 lt!223003) (bvsub lt!222995 lt!223000))))))

(assert (=> d!46135 (moveBitIndexPrecond!0 (_2!6747 lt!223003) (bvsub lt!222995 lt!223000))))

(assert (=> d!46135 (= (withMovedBitIndex!0 (_2!6747 lt!223003) (bvsub lt!222995 lt!223000)) lt!223317)))

(declare-fun b!143990 () Bool)

(assert (=> b!143990 (= e!95907 (= (size!2972 (buf!3401 (_2!6747 lt!223003))) (size!2972 (buf!3401 lt!223317))))))

(assert (= (and d!46135 res!120296) b!143990))

(declare-fun m!221265 () Bool)

(assert (=> d!46135 m!221265))

(assert (=> d!46135 m!221115))

(declare-fun m!221267 () Bool)

(assert (=> d!46135 m!221267))

(declare-fun m!221269 () Bool)

(assert (=> d!46135 m!221269))

(assert (=> b!143815 d!46135))

(assert (=> b!143815 d!45943))

(assert (=> b!143815 d!45945))

(declare-fun d!46137 () Bool)

(declare-fun e!95908 () Bool)

(assert (=> d!46137 e!95908))

(declare-fun res!120297 () Bool)

(assert (=> d!46137 (=> (not res!120297) (not e!95908))))

(declare-fun lt!223319 () BitStream!5202)

(declare-fun lt!223320 () (_ BitVec 64))

(assert (=> d!46137 (= res!120297 (= (bvadd lt!223320 (bvsub lt!222905 lt!222910)) (bitIndex!0 (size!2972 (buf!3401 lt!223319)) (currentByte!6285 lt!223319) (currentBit!6280 lt!223319))))))

(assert (=> d!46137 (or (not (= (bvand lt!223320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!222905 lt!222910) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223320 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223320 (bvsub lt!222905 lt!222910)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46137 (= lt!223320 (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!222913))) (currentByte!6285 (_2!6747 lt!222913)) (currentBit!6280 (_2!6747 lt!222913))))))

(assert (=> d!46137 (= lt!223319 (_2!6745 (moveBitIndex!0 (_2!6747 lt!222913) (bvsub lt!222905 lt!222910))))))

(assert (=> d!46137 (moveBitIndexPrecond!0 (_2!6747 lt!222913) (bvsub lt!222905 lt!222910))))

(assert (=> d!46137 (= (withMovedBitIndex!0 (_2!6747 lt!222913) (bvsub lt!222905 lt!222910)) lt!223319)))

(declare-fun b!143991 () Bool)

(assert (=> b!143991 (= e!95908 (= (size!2972 (buf!3401 (_2!6747 lt!222913))) (size!2972 (buf!3401 lt!223319))))))

(assert (= (and d!46137 res!120297) b!143991))

(declare-fun m!221271 () Bool)

(assert (=> d!46137 m!221271))

(assert (=> d!46137 m!221111))

(declare-fun m!221273 () Bool)

(assert (=> d!46137 m!221273))

(declare-fun m!221275 () Bool)

(assert (=> d!46137 m!221275))

(assert (=> b!143768 d!46137))

(assert (=> b!143768 d!45945))

(assert (=> b!143768 d!46053))

(assert (=> d!46002 d!46063))

(assert (=> d!46045 d!46000))

(declare-fun d!46139 () Bool)

(assert (=> d!46139 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!222493)))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!46139 true))

(declare-fun _$5!56 () Unit!8944)

(assert (=> d!46139 (= (choose!26 thiss!1634 (buf!3401 (_2!6745 lt!222493)) (bvsub to!404 from!447) (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) _$5!56)))

(declare-fun bs!11316 () Bool)

(assert (= bs!11316 d!46139))

(assert (=> bs!11316 m!220483))

(assert (=> d!46045 d!46139))

(assert (=> b!143865 d!46053))

(declare-fun d!46141 () Bool)

(assert (=> d!46141 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 thiss!1634) lt!223117 lt!223115)))

(declare-fun lt!223321 () Unit!8944)

(assert (=> d!46141 (= lt!223321 (choose!8 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222493)) lt!223117 lt!223115))))

(assert (=> d!46141 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223117) (bvsle lt!223117 lt!223115))))

(assert (=> d!46141 (= (arrayBitRangesEqSymmetric!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222493)) lt!223117 lt!223115) lt!223321)))

(declare-fun bs!11317 () Bool)

(assert (= bs!11317 d!46141))

(assert (=> bs!11317 m!221001))

(declare-fun m!221277 () Bool)

(assert (=> bs!11317 m!221277))

(assert (=> b!143865 d!46141))

(declare-fun e!95913 () Bool)

(declare-fun b!143992 () Bool)

(declare-fun lt!223322 () tuple4!130)

(assert (=> b!143992 (= e!95913 (arrayRangesEq!288 (buf!3401 (_2!6745 lt!222493)) (buf!3401 thiss!1634) (_1!6760 lt!223322) (_2!6760 lt!223322)))))

(declare-fun b!143993 () Bool)

(declare-fun e!95912 () Bool)

(declare-fun call!1859 () Bool)

(assert (=> b!143993 (= e!95912 call!1859)))

(declare-fun b!143995 () Bool)

(declare-fun e!95914 () Bool)

(declare-fun e!95910 () Bool)

(assert (=> b!143995 (= e!95914 e!95910)))

(declare-fun lt!223324 () (_ BitVec 32))

(declare-fun res!120300 () Bool)

(assert (=> b!143995 (= res!120300 (byteRangesEq!0 (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223322)) (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223322)) lt!223324 #b00000000000000000000000000001000))))

(assert (=> b!143995 (=> (not res!120300) (not e!95910))))

(declare-fun b!143996 () Bool)

(declare-fun res!120302 () Bool)

(declare-fun lt!223323 () (_ BitVec 32))

(assert (=> b!143996 (= res!120302 (= lt!223323 #b00000000000000000000000000000000))))

(assert (=> b!143996 (=> res!120302 e!95912)))

(assert (=> b!143996 (= e!95910 e!95912)))

(declare-fun b!143997 () Bool)

(assert (=> b!143997 (= e!95914 call!1859)))

(declare-fun b!143998 () Bool)

(declare-fun e!95911 () Bool)

(assert (=> b!143998 (= e!95911 e!95914)))

(declare-fun c!7863 () Bool)

(assert (=> b!143998 (= c!7863 (= (_3!344 lt!223322) (_4!65 lt!223322)))))

(declare-fun bm!1856 () Bool)

(assert (=> bm!1856 (= call!1859 (byteRangesEq!0 (ite c!7863 (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223322)) (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_4!65 lt!223322))) (ite c!7863 (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223322)) (select (arr!3695 (buf!3401 thiss!1634)) (_4!65 lt!223322))) (ite c!7863 lt!223324 #b00000000000000000000000000000000) lt!223323))))

(declare-fun b!143994 () Bool)

(declare-fun e!95909 () Bool)

(assert (=> b!143994 (= e!95909 e!95911)))

(declare-fun res!120299 () Bool)

(assert (=> b!143994 (=> (not res!120299) (not e!95911))))

(assert (=> b!143994 (= res!120299 e!95913)))

(declare-fun res!120301 () Bool)

(assert (=> b!143994 (=> res!120301 e!95913)))

(assert (=> b!143994 (= res!120301 (bvsge (_1!6760 lt!223322) (_2!6760 lt!223322)))))

(assert (=> b!143994 (= lt!223323 ((_ extract 31 0) (bvsrem lt!223115 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143994 (= lt!223324 ((_ extract 31 0) (bvsrem lt!223117 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!143994 (= lt!223322 (arrayBitIndices!0 lt!223117 lt!223115))))

(declare-fun d!46143 () Bool)

(declare-fun res!120298 () Bool)

(assert (=> d!46143 (=> res!120298 e!95909)))

(assert (=> d!46143 (= res!120298 (bvsge lt!223117 lt!223115))))

(assert (=> d!46143 (= (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 thiss!1634) lt!223117 lt!223115) e!95909)))

(assert (= (and d!46143 (not res!120298)) b!143994))

(assert (= (and b!143994 (not res!120301)) b!143992))

(assert (= (and b!143994 res!120299) b!143998))

(assert (= (and b!143998 c!7863) b!143997))

(assert (= (and b!143998 (not c!7863)) b!143995))

(assert (= (and b!143995 res!120300) b!143996))

(assert (= (and b!143996 (not res!120302)) b!143993))

(assert (= (or b!143997 b!143993) bm!1856))

(declare-fun m!221279 () Bool)

(assert (=> b!143992 m!221279))

(declare-fun m!221281 () Bool)

(assert (=> b!143995 m!221281))

(declare-fun m!221283 () Bool)

(assert (=> b!143995 m!221283))

(assert (=> b!143995 m!221281))

(assert (=> b!143995 m!221283))

(declare-fun m!221285 () Bool)

(assert (=> b!143995 m!221285))

(assert (=> bm!1856 m!221283))

(declare-fun m!221287 () Bool)

(assert (=> bm!1856 m!221287))

(declare-fun m!221289 () Bool)

(assert (=> bm!1856 m!221289))

(declare-fun m!221291 () Bool)

(assert (=> bm!1856 m!221291))

(assert (=> bm!1856 m!221281))

(declare-fun m!221293 () Bool)

(assert (=> b!143994 m!221293))

(assert (=> b!143865 d!46143))

(assert (=> b!143813 d!45945))

(declare-fun d!46145 () Bool)

(assert (=> d!46145 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 (_2!6745 lt!222486)) lt!222992 lt!222990)))

(declare-fun lt!223325 () Unit!8944)

(assert (=> d!46145 (= lt!223325 (choose!8 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222493)) lt!222992 lt!222990))))

(assert (=> d!46145 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!222992) (bvsle lt!222992 lt!222990))))

(assert (=> d!46145 (= (arrayBitRangesEqSymmetric!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222493)) lt!222992 lt!222990) lt!223325)))

(declare-fun bs!11318 () Bool)

(assert (= bs!11318 d!46145))

(assert (=> bs!11318 m!220891))

(declare-fun m!221295 () Bool)

(assert (=> bs!11318 m!221295))

(assert (=> b!143813 d!46145))

(declare-fun lt!223326 () tuple4!130)

(declare-fun b!143999 () Bool)

(declare-fun e!95919 () Bool)

(assert (=> b!143999 (= e!95919 (arrayRangesEq!288 (buf!3401 (_2!6745 lt!222493)) (buf!3401 (_2!6745 lt!222486)) (_1!6760 lt!223326) (_2!6760 lt!223326)))))

(declare-fun b!144000 () Bool)

(declare-fun e!95918 () Bool)

(declare-fun call!1860 () Bool)

(assert (=> b!144000 (= e!95918 call!1860)))

(declare-fun b!144002 () Bool)

(declare-fun e!95920 () Bool)

(declare-fun e!95916 () Bool)

(assert (=> b!144002 (= e!95920 e!95916)))

(declare-fun res!120305 () Bool)

(declare-fun lt!223328 () (_ BitVec 32))

(assert (=> b!144002 (= res!120305 (byteRangesEq!0 (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223326)) (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223326)) lt!223328 #b00000000000000000000000000001000))))

(assert (=> b!144002 (=> (not res!120305) (not e!95916))))

(declare-fun b!144003 () Bool)

(declare-fun res!120307 () Bool)

(declare-fun lt!223327 () (_ BitVec 32))

(assert (=> b!144003 (= res!120307 (= lt!223327 #b00000000000000000000000000000000))))

(assert (=> b!144003 (=> res!120307 e!95918)))

(assert (=> b!144003 (= e!95916 e!95918)))

(declare-fun b!144004 () Bool)

(assert (=> b!144004 (= e!95920 call!1860)))

(declare-fun b!144005 () Bool)

(declare-fun e!95917 () Bool)

(assert (=> b!144005 (= e!95917 e!95920)))

(declare-fun c!7864 () Bool)

(assert (=> b!144005 (= c!7864 (= (_3!344 lt!223326) (_4!65 lt!223326)))))

(declare-fun bm!1857 () Bool)

(assert (=> bm!1857 (= call!1860 (byteRangesEq!0 (ite c!7864 (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223326)) (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_4!65 lt!223326))) (ite c!7864 (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223326)) (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_4!65 lt!223326))) (ite c!7864 lt!223328 #b00000000000000000000000000000000) lt!223327))))

(declare-fun b!144001 () Bool)

(declare-fun e!95915 () Bool)

(assert (=> b!144001 (= e!95915 e!95917)))

(declare-fun res!120304 () Bool)

(assert (=> b!144001 (=> (not res!120304) (not e!95917))))

(assert (=> b!144001 (= res!120304 e!95919)))

(declare-fun res!120306 () Bool)

(assert (=> b!144001 (=> res!120306 e!95919)))

(assert (=> b!144001 (= res!120306 (bvsge (_1!6760 lt!223326) (_2!6760 lt!223326)))))

(assert (=> b!144001 (= lt!223327 ((_ extract 31 0) (bvsrem lt!222990 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144001 (= lt!223328 ((_ extract 31 0) (bvsrem lt!222992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144001 (= lt!223326 (arrayBitIndices!0 lt!222992 lt!222990))))

(declare-fun d!46147 () Bool)

(declare-fun res!120303 () Bool)

(assert (=> d!46147 (=> res!120303 e!95915)))

(assert (=> d!46147 (= res!120303 (bvsge lt!222992 lt!222990))))

(assert (=> d!46147 (= (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 (_2!6745 lt!222486)) lt!222992 lt!222990) e!95915)))

(assert (= (and d!46147 (not res!120303)) b!144001))

(assert (= (and b!144001 (not res!120306)) b!143999))

(assert (= (and b!144001 res!120304) b!144005))

(assert (= (and b!144005 c!7864) b!144004))

(assert (= (and b!144005 (not c!7864)) b!144002))

(assert (= (and b!144002 res!120305) b!144003))

(assert (= (and b!144003 (not res!120307)) b!144000))

(assert (= (or b!144004 b!144000) bm!1857))

(declare-fun m!221297 () Bool)

(assert (=> b!143999 m!221297))

(declare-fun m!221299 () Bool)

(assert (=> b!144002 m!221299))

(declare-fun m!221301 () Bool)

(assert (=> b!144002 m!221301))

(assert (=> b!144002 m!221299))

(assert (=> b!144002 m!221301))

(declare-fun m!221303 () Bool)

(assert (=> b!144002 m!221303))

(assert (=> bm!1857 m!221301))

(declare-fun m!221305 () Bool)

(assert (=> bm!1857 m!221305))

(declare-fun m!221307 () Bool)

(assert (=> bm!1857 m!221307))

(declare-fun m!221309 () Bool)

(assert (=> bm!1857 m!221309))

(assert (=> bm!1857 m!221299))

(declare-fun m!221311 () Bool)

(assert (=> b!144001 m!221311))

(assert (=> b!143813 d!46147))

(assert (=> b!143794 d!45945))

(assert (=> b!143794 d!45943))

(declare-fun d!46149 () Bool)

(declare-fun lt!223329 () tuple2!12826)

(assert (=> d!46149 (= lt!223329 (readByte!0 (_1!6747 lt!223215)))))

(assert (=> d!46149 (= (readBytePure!0 (_1!6747 lt!223215)) (tuple2!12811 (_2!6755 lt!223329) (_1!6755 lt!223329)))))

(declare-fun bs!11319 () Bool)

(assert (= bs!11319 d!46149))

(declare-fun m!221313 () Bool)

(assert (=> bs!11319 m!221313))

(assert (=> b!143907 d!46149))

(declare-fun b!144006 () Bool)

(declare-fun e!95921 () Unit!8944)

(declare-fun lt!223343 () Unit!8944)

(assert (=> b!144006 (= e!95921 lt!223343)))

(declare-fun lt!223337 () (_ BitVec 64))

(assert (=> b!144006 (= lt!223337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!223335 () (_ BitVec 64))

(assert (=> b!144006 (= lt!223335 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(assert (=> b!144006 (= lt!223343 (arrayBitRangesEqSymmetric!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!223217)) lt!223337 lt!223335))))

(assert (=> b!144006 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!223217)) (buf!3401 thiss!1634) lt!223337 lt!223335)))

(declare-fun b!144007 () Bool)

(declare-fun res!120309 () Bool)

(declare-fun e!95922 () Bool)

(assert (=> b!144007 (=> (not res!120309) (not e!95922))))

(declare-fun lt!223348 () tuple2!12812)

(assert (=> b!144007 (= res!120309 (isPrefixOf!0 (_2!6747 lt!223348) (_2!6745 lt!223217)))))

(declare-fun b!144008 () Bool)

(declare-fun lt!223340 () (_ BitVec 64))

(declare-fun lt!223345 () (_ BitVec 64))

(assert (=> b!144008 (= e!95922 (= (_1!6747 lt!223348) (withMovedBitIndex!0 (_2!6747 lt!223348) (bvsub lt!223340 lt!223345))))))

(assert (=> b!144008 (or (= (bvand lt!223340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223340 lt!223345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144008 (= lt!223345 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223217))) (currentByte!6285 (_2!6745 lt!223217)) (currentBit!6280 (_2!6745 lt!223217))))))

(assert (=> b!144008 (= lt!223340 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(declare-fun d!46151 () Bool)

(assert (=> d!46151 e!95922))

(declare-fun res!120308 () Bool)

(assert (=> d!46151 (=> (not res!120308) (not e!95922))))

(assert (=> d!46151 (= res!120308 (isPrefixOf!0 (_1!6747 lt!223348) (_2!6747 lt!223348)))))

(declare-fun lt!223341 () BitStream!5202)

(assert (=> d!46151 (= lt!223348 (tuple2!12813 lt!223341 (_2!6745 lt!223217)))))

(declare-fun lt!223342 () Unit!8944)

(declare-fun lt!223333 () Unit!8944)

(assert (=> d!46151 (= lt!223342 lt!223333)))

(assert (=> d!46151 (isPrefixOf!0 lt!223341 (_2!6745 lt!223217))))

(assert (=> d!46151 (= lt!223333 (lemmaIsPrefixTransitive!0 lt!223341 (_2!6745 lt!223217) (_2!6745 lt!223217)))))

(declare-fun lt!223331 () Unit!8944)

(declare-fun lt!223346 () Unit!8944)

(assert (=> d!46151 (= lt!223331 lt!223346)))

(assert (=> d!46151 (isPrefixOf!0 lt!223341 (_2!6745 lt!223217))))

(assert (=> d!46151 (= lt!223346 (lemmaIsPrefixTransitive!0 lt!223341 thiss!1634 (_2!6745 lt!223217)))))

(declare-fun lt!223332 () Unit!8944)

(assert (=> d!46151 (= lt!223332 e!95921)))

(declare-fun c!7865 () Bool)

(assert (=> d!46151 (= c!7865 (not (= (size!2972 (buf!3401 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!223344 () Unit!8944)

(declare-fun lt!223334 () Unit!8944)

(assert (=> d!46151 (= lt!223344 lt!223334)))

(assert (=> d!46151 (isPrefixOf!0 (_2!6745 lt!223217) (_2!6745 lt!223217))))

(assert (=> d!46151 (= lt!223334 (lemmaIsPrefixRefl!0 (_2!6745 lt!223217)))))

(declare-fun lt!223347 () Unit!8944)

(declare-fun lt!223338 () Unit!8944)

(assert (=> d!46151 (= lt!223347 lt!223338)))

(assert (=> d!46151 (= lt!223338 (lemmaIsPrefixRefl!0 (_2!6745 lt!223217)))))

(declare-fun lt!223330 () Unit!8944)

(declare-fun lt!223339 () Unit!8944)

(assert (=> d!46151 (= lt!223330 lt!223339)))

(assert (=> d!46151 (isPrefixOf!0 lt!223341 lt!223341)))

(assert (=> d!46151 (= lt!223339 (lemmaIsPrefixRefl!0 lt!223341))))

(declare-fun lt!223349 () Unit!8944)

(declare-fun lt!223336 () Unit!8944)

(assert (=> d!46151 (= lt!223349 lt!223336)))

(assert (=> d!46151 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!46151 (= lt!223336 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!46151 (= lt!223341 (BitStream!5203 (buf!3401 (_2!6745 lt!223217)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)))))

(assert (=> d!46151 (isPrefixOf!0 thiss!1634 (_2!6745 lt!223217))))

(assert (=> d!46151 (= (reader!0 thiss!1634 (_2!6745 lt!223217)) lt!223348)))

(declare-fun b!144009 () Bool)

(declare-fun res!120310 () Bool)

(assert (=> b!144009 (=> (not res!120310) (not e!95922))))

(assert (=> b!144009 (= res!120310 (isPrefixOf!0 (_1!6747 lt!223348) thiss!1634))))

(declare-fun b!144010 () Bool)

(declare-fun Unit!8970 () Unit!8944)

(assert (=> b!144010 (= e!95921 Unit!8970)))

(assert (= (and d!46151 c!7865) b!144006))

(assert (= (and d!46151 (not c!7865)) b!144010))

(assert (= (and d!46151 res!120308) b!144009))

(assert (= (and b!144009 res!120310) b!144007))

(assert (= (and b!144007 res!120309) b!144008))

(declare-fun m!221315 () Bool)

(assert (=> b!144007 m!221315))

(declare-fun m!221317 () Bool)

(assert (=> b!144009 m!221317))

(declare-fun m!221319 () Bool)

(assert (=> b!144008 m!221319))

(assert (=> b!144008 m!221099))

(assert (=> b!144008 m!220507))

(assert (=> b!144006 m!220507))

(declare-fun m!221321 () Bool)

(assert (=> b!144006 m!221321))

(declare-fun m!221323 () Bool)

(assert (=> b!144006 m!221323))

(declare-fun m!221325 () Bool)

(assert (=> d!46151 m!221325))

(declare-fun m!221327 () Bool)

(assert (=> d!46151 m!221327))

(assert (=> d!46151 m!221101))

(declare-fun m!221329 () Bool)

(assert (=> d!46151 m!221329))

(declare-fun m!221331 () Bool)

(assert (=> d!46151 m!221331))

(assert (=> d!46151 m!220813))

(assert (=> d!46151 m!220815))

(declare-fun m!221333 () Bool)

(assert (=> d!46151 m!221333))

(declare-fun m!221335 () Bool)

(assert (=> d!46151 m!221335))

(declare-fun m!221337 () Bool)

(assert (=> d!46151 m!221337))

(declare-fun m!221339 () Bool)

(assert (=> d!46151 m!221339))

(assert (=> b!143907 d!46151))

(declare-fun b!144011 () Bool)

(declare-fun e!95927 () Bool)

(declare-fun lt!223350 () tuple4!130)

(assert (=> b!144011 (= e!95927 (arrayRangesEq!288 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222493)) (_1!6760 lt!223350) (_2!6760 lt!223350)))))

(declare-fun b!144012 () Bool)

(declare-fun e!95926 () Bool)

(declare-fun call!1861 () Bool)

(assert (=> b!144012 (= e!95926 call!1861)))

(declare-fun b!144014 () Bool)

(declare-fun e!95928 () Bool)

(declare-fun e!95924 () Bool)

(assert (=> b!144014 (= e!95928 e!95924)))

(declare-fun lt!223352 () (_ BitVec 32))

(declare-fun res!120313 () Bool)

(assert (=> b!144014 (= res!120313 (byteRangesEq!0 (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223350)) (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223350)) lt!223352 #b00000000000000000000000000001000))))

(assert (=> b!144014 (=> (not res!120313) (not e!95924))))

(declare-fun b!144015 () Bool)

(declare-fun res!120315 () Bool)

(declare-fun lt!223351 () (_ BitVec 32))

(assert (=> b!144015 (= res!120315 (= lt!223351 #b00000000000000000000000000000000))))

(assert (=> b!144015 (=> res!120315 e!95926)))

(assert (=> b!144015 (= e!95924 e!95926)))

(declare-fun b!144016 () Bool)

(assert (=> b!144016 (= e!95928 call!1861)))

(declare-fun b!144017 () Bool)

(declare-fun e!95925 () Bool)

(assert (=> b!144017 (= e!95925 e!95928)))

(declare-fun c!7866 () Bool)

(assert (=> b!144017 (= c!7866 (= (_3!344 lt!223350) (_4!65 lt!223350)))))

(declare-fun bm!1858 () Bool)

(assert (=> bm!1858 (= call!1861 (byteRangesEq!0 (ite c!7866 (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_3!344 lt!223350)) (select (arr!3695 (buf!3401 (_2!6745 lt!222486))) (_4!65 lt!223350))) (ite c!7866 (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223350)) (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_4!65 lt!223350))) (ite c!7866 lt!223352 #b00000000000000000000000000000000) lt!223351))))

(declare-fun b!144013 () Bool)

(declare-fun e!95923 () Bool)

(assert (=> b!144013 (= e!95923 e!95925)))

(declare-fun res!120312 () Bool)

(assert (=> b!144013 (=> (not res!120312) (not e!95925))))

(assert (=> b!144013 (= res!120312 e!95927)))

(declare-fun res!120314 () Bool)

(assert (=> b!144013 (=> res!120314 e!95927)))

(assert (=> b!144013 (= res!120314 (bvsge (_1!6760 lt!223350) (_2!6760 lt!223350)))))

(assert (=> b!144013 (= lt!223351 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144013 (= lt!223352 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144013 (= lt!223350 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun d!46153 () Bool)

(declare-fun res!120311 () Bool)

(assert (=> d!46153 (=> res!120311 e!95923)))

(assert (=> d!46153 (= res!120311 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (=> d!46153 (= (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))) e!95923)))

(assert (= (and d!46153 (not res!120311)) b!144013))

(assert (= (and b!144013 (not res!120314)) b!144011))

(assert (= (and b!144013 res!120312) b!144017))

(assert (= (and b!144017 c!7866) b!144016))

(assert (= (and b!144017 (not c!7866)) b!144014))

(assert (= (and b!144014 res!120313) b!144015))

(assert (= (and b!144015 (not res!120315)) b!144012))

(assert (= (or b!144016 b!144012) bm!1858))

(declare-fun m!221341 () Bool)

(assert (=> b!144011 m!221341))

(declare-fun m!221343 () Bool)

(assert (=> b!144014 m!221343))

(declare-fun m!221345 () Bool)

(assert (=> b!144014 m!221345))

(assert (=> b!144014 m!221343))

(assert (=> b!144014 m!221345))

(declare-fun m!221347 () Bool)

(assert (=> b!144014 m!221347))

(assert (=> bm!1858 m!221345))

(declare-fun m!221349 () Bool)

(assert (=> bm!1858 m!221349))

(declare-fun m!221351 () Bool)

(assert (=> bm!1858 m!221351))

(declare-fun m!221353 () Bool)

(assert (=> bm!1858 m!221353))

(assert (=> bm!1858 m!221343))

(assert (=> b!144013 m!220503))

(declare-fun m!221355 () Bool)

(assert (=> b!144013 m!221355))

(assert (=> b!143796 d!46153))

(assert (=> b!143796 d!45945))

(declare-fun d!46155 () Bool)

(assert (=> d!46155 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222498)))) ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222498))) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222498)))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222498)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222498))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222498))))))))

(assert (=> d!46020 d!46155))

(declare-fun d!46157 () Bool)

(assert (=> d!46157 (= (invariant!0 (currentBit!6280 (_1!6746 lt!222498)) (currentByte!6285 (_1!6746 lt!222498)) (size!2972 (buf!3401 (_1!6746 lt!222498)))) (and (bvsge (currentBit!6280 (_1!6746 lt!222498)) #b00000000000000000000000000000000) (bvslt (currentBit!6280 (_1!6746 lt!222498)) #b00000000000000000000000000001000) (bvsge (currentByte!6285 (_1!6746 lt!222498)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6285 (_1!6746 lt!222498)) (size!2972 (buf!3401 (_1!6746 lt!222498)))) (and (= (currentBit!6280 (_1!6746 lt!222498)) #b00000000000000000000000000000000) (= (currentByte!6285 (_1!6746 lt!222498)) (size!2972 (buf!3401 (_1!6746 lt!222498))))))))))

(assert (=> d!46020 d!46157))

(assert (=> d!45939 d!46099))

(declare-fun d!46159 () Bool)

(assert (=> d!46159 (isPrefixOf!0 lt!223121 lt!223121)))

(declare-fun lt!223353 () Unit!8944)

(assert (=> d!46159 (= lt!223353 (choose!11 lt!223121))))

(assert (=> d!46159 (= (lemmaIsPrefixRefl!0 lt!223121) lt!223353)))

(declare-fun bs!11320 () Bool)

(assert (= bs!11320 d!46159))

(assert (=> bs!11320 m!221011))

(declare-fun m!221357 () Bool)

(assert (=> bs!11320 m!221357))

(assert (=> d!45994 d!46159))

(declare-fun d!46161 () Bool)

(assert (=> d!46161 (isPrefixOf!0 lt!223121 (_2!6745 lt!222493))))

(declare-fun lt!223354 () Unit!8944)

(assert (=> d!46161 (= lt!223354 (choose!30 lt!223121 thiss!1634 (_2!6745 lt!222493)))))

(assert (=> d!46161 (isPrefixOf!0 lt!223121 thiss!1634)))

(assert (=> d!46161 (= (lemmaIsPrefixTransitive!0 lt!223121 thiss!1634 (_2!6745 lt!222493)) lt!223354)))

(declare-fun bs!11321 () Bool)

(assert (= bs!11321 d!46161))

(assert (=> bs!11321 m!221013))

(declare-fun m!221359 () Bool)

(assert (=> bs!11321 m!221359))

(declare-fun m!221361 () Bool)

(assert (=> bs!11321 m!221361))

(assert (=> d!45994 d!46161))

(declare-fun d!46163 () Bool)

(assert (=> d!46163 (isPrefixOf!0 (_2!6745 lt!222493) (_2!6745 lt!222493))))

(declare-fun lt!223355 () Unit!8944)

(assert (=> d!46163 (= lt!223355 (choose!11 (_2!6745 lt!222493)))))

(assert (=> d!46163 (= (lemmaIsPrefixRefl!0 (_2!6745 lt!222493)) lt!223355)))

(declare-fun bs!11322 () Bool)

(assert (= bs!11322 d!46163))

(assert (=> bs!11322 m!220901))

(declare-fun m!221363 () Bool)

(assert (=> bs!11322 m!221363))

(assert (=> d!45994 d!46163))

(declare-fun d!46165 () Bool)

(declare-fun res!120316 () Bool)

(declare-fun e!95930 () Bool)

(assert (=> d!46165 (=> (not res!120316) (not e!95930))))

(assert (=> d!46165 (= res!120316 (= (size!2972 (buf!3401 (_2!6745 lt!222493))) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!46165 (= (isPrefixOf!0 (_2!6745 lt!222493) (_2!6745 lt!222493)) e!95930)))

(declare-fun b!144018 () Bool)

(declare-fun res!120318 () Bool)

(assert (=> b!144018 (=> (not res!120318) (not e!95930))))

(assert (=> b!144018 (= res!120318 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!144019 () Bool)

(declare-fun e!95929 () Bool)

(assert (=> b!144019 (= e!95930 e!95929)))

(declare-fun res!120317 () Bool)

(assert (=> b!144019 (=> res!120317 e!95929)))

(assert (=> b!144019 (= res!120317 (= (size!2972 (buf!3401 (_2!6745 lt!222493))) #b00000000000000000000000000000000))))

(declare-fun b!144020 () Bool)

(assert (=> b!144020 (= e!95929 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222493)) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(assert (= (and d!46165 res!120316) b!144018))

(assert (= (and b!144018 res!120318) b!144019))

(assert (= (and b!144019 (not res!120317)) b!144020))

(assert (=> b!144018 m!220501))

(assert (=> b!144018 m!220501))

(assert (=> b!144020 m!220501))

(assert (=> b!144020 m!220501))

(declare-fun m!221365 () Bool)

(assert (=> b!144020 m!221365))

(assert (=> d!45994 d!46165))

(assert (=> d!45994 d!46121))

(declare-fun d!46167 () Bool)

(assert (=> d!46167 (isPrefixOf!0 lt!223121 (_2!6745 lt!222493))))

(declare-fun lt!223356 () Unit!8944)

(assert (=> d!46167 (= lt!223356 (choose!30 lt!223121 (_2!6745 lt!222493) (_2!6745 lt!222493)))))

(assert (=> d!46167 (isPrefixOf!0 lt!223121 (_2!6745 lt!222493))))

(assert (=> d!46167 (= (lemmaIsPrefixTransitive!0 lt!223121 (_2!6745 lt!222493) (_2!6745 lt!222493)) lt!223356)))

(declare-fun bs!11323 () Bool)

(assert (= bs!11323 d!46167))

(assert (=> bs!11323 m!221013))

(declare-fun m!221367 () Bool)

(assert (=> bs!11323 m!221367))

(assert (=> bs!11323 m!221013))

(assert (=> d!45994 d!46167))

(assert (=> d!45994 d!46127))

(declare-fun d!46169 () Bool)

(declare-fun res!120319 () Bool)

(declare-fun e!95932 () Bool)

(assert (=> d!46169 (=> (not res!120319) (not e!95932))))

(assert (=> d!46169 (= res!120319 (= (size!2972 (buf!3401 (_1!6747 lt!223128))) (size!2972 (buf!3401 (_2!6747 lt!223128)))))))

(assert (=> d!46169 (= (isPrefixOf!0 (_1!6747 lt!223128) (_2!6747 lt!223128)) e!95932)))

(declare-fun b!144021 () Bool)

(declare-fun res!120321 () Bool)

(assert (=> b!144021 (=> (not res!120321) (not e!95932))))

(assert (=> b!144021 (= res!120321 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223128))) (currentByte!6285 (_1!6747 lt!223128)) (currentBit!6280 (_1!6747 lt!223128))) (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223128))) (currentByte!6285 (_2!6747 lt!223128)) (currentBit!6280 (_2!6747 lt!223128)))))))

(declare-fun b!144022 () Bool)

(declare-fun e!95931 () Bool)

(assert (=> b!144022 (= e!95932 e!95931)))

(declare-fun res!120320 () Bool)

(assert (=> b!144022 (=> res!120320 e!95931)))

(assert (=> b!144022 (= res!120320 (= (size!2972 (buf!3401 (_1!6747 lt!223128))) #b00000000000000000000000000000000))))

(declare-fun b!144023 () Bool)

(assert (=> b!144023 (= e!95931 (arrayBitRangesEq!0 (buf!3401 (_1!6747 lt!223128)) (buf!3401 (_2!6747 lt!223128)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223128))) (currentByte!6285 (_1!6747 lt!223128)) (currentBit!6280 (_1!6747 lt!223128)))))))

(assert (= (and d!46169 res!120319) b!144021))

(assert (= (and b!144021 res!120321) b!144022))

(assert (= (and b!144022 (not res!120320)) b!144023))

(assert (=> b!144021 m!221131))

(assert (=> b!144021 m!221107))

(assert (=> b!144023 m!221131))

(assert (=> b!144023 m!221131))

(declare-fun m!221369 () Bool)

(assert (=> b!144023 m!221369))

(assert (=> d!45994 d!46169))

(declare-fun d!46171 () Bool)

(declare-fun res!120322 () Bool)

(declare-fun e!95934 () Bool)

(assert (=> d!46171 (=> (not res!120322) (not e!95934))))

(assert (=> d!46171 (= res!120322 (= (size!2972 (buf!3401 lt!223121)) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!46171 (= (isPrefixOf!0 lt!223121 (_2!6745 lt!222493)) e!95934)))

(declare-fun b!144024 () Bool)

(declare-fun res!120324 () Bool)

(assert (=> b!144024 (=> (not res!120324) (not e!95934))))

(assert (=> b!144024 (= res!120324 (bvsle (bitIndex!0 (size!2972 (buf!3401 lt!223121)) (currentByte!6285 lt!223121) (currentBit!6280 lt!223121)) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!144025 () Bool)

(declare-fun e!95933 () Bool)

(assert (=> b!144025 (= e!95934 e!95933)))

(declare-fun res!120323 () Bool)

(assert (=> b!144025 (=> res!120323 e!95933)))

(assert (=> b!144025 (= res!120323 (= (size!2972 (buf!3401 lt!223121)) #b00000000000000000000000000000000))))

(declare-fun b!144026 () Bool)

(assert (=> b!144026 (= e!95933 (arrayBitRangesEq!0 (buf!3401 lt!223121) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 lt!223121)) (currentByte!6285 lt!223121) (currentBit!6280 lt!223121))))))

(assert (= (and d!46171 res!120322) b!144024))

(assert (= (and b!144024 res!120324) b!144025))

(assert (= (and b!144025 (not res!120323)) b!144026))

(declare-fun m!221371 () Bool)

(assert (=> b!144024 m!221371))

(assert (=> b!144024 m!220501))

(assert (=> b!144026 m!221371))

(assert (=> b!144026 m!221371))

(declare-fun m!221373 () Bool)

(assert (=> b!144026 m!221373))

(assert (=> d!45994 d!46171))

(assert (=> d!45994 d!46041))

(declare-fun d!46173 () Bool)

(declare-fun res!120325 () Bool)

(declare-fun e!95936 () Bool)

(assert (=> d!46173 (=> (not res!120325) (not e!95936))))

(assert (=> d!46173 (= res!120325 (= (size!2972 (buf!3401 lt!223121)) (size!2972 (buf!3401 lt!223121))))))

(assert (=> d!46173 (= (isPrefixOf!0 lt!223121 lt!223121) e!95936)))

(declare-fun b!144027 () Bool)

(declare-fun res!120327 () Bool)

(assert (=> b!144027 (=> (not res!120327) (not e!95936))))

(assert (=> b!144027 (= res!120327 (bvsle (bitIndex!0 (size!2972 (buf!3401 lt!223121)) (currentByte!6285 lt!223121) (currentBit!6280 lt!223121)) (bitIndex!0 (size!2972 (buf!3401 lt!223121)) (currentByte!6285 lt!223121) (currentBit!6280 lt!223121))))))

(declare-fun b!144028 () Bool)

(declare-fun e!95935 () Bool)

(assert (=> b!144028 (= e!95936 e!95935)))

(declare-fun res!120326 () Bool)

(assert (=> b!144028 (=> res!120326 e!95935)))

(assert (=> b!144028 (= res!120326 (= (size!2972 (buf!3401 lt!223121)) #b00000000000000000000000000000000))))

(declare-fun b!144029 () Bool)

(assert (=> b!144029 (= e!95935 (arrayBitRangesEq!0 (buf!3401 lt!223121) (buf!3401 lt!223121) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 lt!223121)) (currentByte!6285 lt!223121) (currentBit!6280 lt!223121))))))

(assert (= (and d!46173 res!120325) b!144027))

(assert (= (and b!144027 res!120327) b!144028))

(assert (= (and b!144028 (not res!120326)) b!144029))

(assert (=> b!144027 m!221371))

(assert (=> b!144027 m!221371))

(assert (=> b!144029 m!221371))

(assert (=> b!144029 m!221371))

(declare-fun m!221375 () Bool)

(assert (=> b!144029 m!221375))

(assert (=> d!45994 d!46173))

(assert (=> d!45975 d!46109))

(declare-fun d!46175 () Bool)

(declare-fun res!120328 () Bool)

(declare-fun e!95938 () Bool)

(assert (=> d!46175 (=> (not res!120328) (not e!95938))))

(assert (=> d!46175 (= res!120328 (= (size!2972 (buf!3401 lt!222996)) (size!2972 (buf!3401 lt!222996))))))

(assert (=> d!46175 (= (isPrefixOf!0 lt!222996 lt!222996) e!95938)))

(declare-fun b!144030 () Bool)

(declare-fun res!120330 () Bool)

(assert (=> b!144030 (=> (not res!120330) (not e!95938))))

(assert (=> b!144030 (= res!120330 (bvsle (bitIndex!0 (size!2972 (buf!3401 lt!222996)) (currentByte!6285 lt!222996) (currentBit!6280 lt!222996)) (bitIndex!0 (size!2972 (buf!3401 lt!222996)) (currentByte!6285 lt!222996) (currentBit!6280 lt!222996))))))

(declare-fun b!144031 () Bool)

(declare-fun e!95937 () Bool)

(assert (=> b!144031 (= e!95938 e!95937)))

(declare-fun res!120329 () Bool)

(assert (=> b!144031 (=> res!120329 e!95937)))

(assert (=> b!144031 (= res!120329 (= (size!2972 (buf!3401 lt!222996)) #b00000000000000000000000000000000))))

(declare-fun b!144032 () Bool)

(assert (=> b!144032 (= e!95937 (arrayBitRangesEq!0 (buf!3401 lt!222996) (buf!3401 lt!222996) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 lt!222996)) (currentByte!6285 lt!222996) (currentBit!6280 lt!222996))))))

(assert (= (and d!46175 res!120328) b!144030))

(assert (= (and b!144030 res!120330) b!144031))

(assert (= (and b!144031 (not res!120329)) b!144032))

(declare-fun m!221377 () Bool)

(assert (=> b!144030 m!221377))

(assert (=> b!144030 m!221377))

(assert (=> b!144032 m!221377))

(assert (=> b!144032 m!221377))

(declare-fun m!221379 () Bool)

(assert (=> b!144032 m!221379))

(assert (=> d!45975 d!46175))

(declare-fun d!46177 () Bool)

(assert (=> d!46177 (isPrefixOf!0 lt!222996 (_2!6745 lt!222493))))

(declare-fun lt!223357 () Unit!8944)

(assert (=> d!46177 (= lt!223357 (choose!30 lt!222996 (_2!6745 lt!222486) (_2!6745 lt!222493)))))

(assert (=> d!46177 (isPrefixOf!0 lt!222996 (_2!6745 lt!222486))))

(assert (=> d!46177 (= (lemmaIsPrefixTransitive!0 lt!222996 (_2!6745 lt!222486) (_2!6745 lt!222493)) lt!223357)))

(declare-fun bs!11324 () Bool)

(assert (= bs!11324 d!46177))

(assert (=> bs!11324 m!220907))

(declare-fun m!221381 () Bool)

(assert (=> bs!11324 m!221381))

(declare-fun m!221383 () Bool)

(assert (=> bs!11324 m!221383))

(assert (=> d!45975 d!46177))

(assert (=> d!45975 d!46163))

(assert (=> d!45975 d!45953))

(assert (=> d!45975 d!46165))

(assert (=> d!45975 d!46119))

(declare-fun d!46179 () Bool)

(declare-fun res!120331 () Bool)

(declare-fun e!95940 () Bool)

(assert (=> d!46179 (=> (not res!120331) (not e!95940))))

(assert (=> d!46179 (= res!120331 (= (size!2972 (buf!3401 (_1!6747 lt!223003))) (size!2972 (buf!3401 (_2!6747 lt!223003)))))))

(assert (=> d!46179 (= (isPrefixOf!0 (_1!6747 lt!223003) (_2!6747 lt!223003)) e!95940)))

(declare-fun b!144033 () Bool)

(declare-fun res!120333 () Bool)

(assert (=> b!144033 (=> (not res!120333) (not e!95940))))

(assert (=> b!144033 (= res!120333 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223003))) (currentByte!6285 (_1!6747 lt!223003)) (currentBit!6280 (_1!6747 lt!223003))) (bitIndex!0 (size!2972 (buf!3401 (_2!6747 lt!223003))) (currentByte!6285 (_2!6747 lt!223003)) (currentBit!6280 (_2!6747 lt!223003)))))))

(declare-fun b!144034 () Bool)

(declare-fun e!95939 () Bool)

(assert (=> b!144034 (= e!95940 e!95939)))

(declare-fun res!120332 () Bool)

(assert (=> b!144034 (=> res!120332 e!95939)))

(assert (=> b!144034 (= res!120332 (= (size!2972 (buf!3401 (_1!6747 lt!223003))) #b00000000000000000000000000000000))))

(declare-fun b!144035 () Bool)

(assert (=> b!144035 (= e!95939 (arrayBitRangesEq!0 (buf!3401 (_1!6747 lt!223003)) (buf!3401 (_2!6747 lt!223003)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223003))) (currentByte!6285 (_1!6747 lt!223003)) (currentBit!6280 (_1!6747 lt!223003)))))))

(assert (= (and d!46179 res!120331) b!144033))

(assert (= (and b!144033 res!120333) b!144034))

(assert (= (and b!144034 (not res!120332)) b!144035))

(declare-fun m!221385 () Bool)

(assert (=> b!144033 m!221385))

(assert (=> b!144033 m!221115))

(assert (=> b!144035 m!221385))

(assert (=> b!144035 m!221385))

(declare-fun m!221387 () Bool)

(assert (=> b!144035 m!221387))

(assert (=> d!45975 d!46179))

(declare-fun d!46181 () Bool)

(assert (=> d!46181 (isPrefixOf!0 lt!222996 lt!222996)))

(declare-fun lt!223358 () Unit!8944)

(assert (=> d!46181 (= lt!223358 (choose!11 lt!222996))))

(assert (=> d!46181 (= (lemmaIsPrefixRefl!0 lt!222996) lt!223358)))

(declare-fun bs!11325 () Bool)

(assert (= bs!11325 d!46181))

(assert (=> bs!11325 m!220905))

(declare-fun m!221389 () Bool)

(assert (=> bs!11325 m!221389))

(assert (=> d!45975 d!46181))

(declare-fun d!46183 () Bool)

(assert (=> d!46183 (isPrefixOf!0 lt!222996 (_2!6745 lt!222493))))

(declare-fun lt!223359 () Unit!8944)

(assert (=> d!46183 (= lt!223359 (choose!30 lt!222996 (_2!6745 lt!222493) (_2!6745 lt!222493)))))

(assert (=> d!46183 (isPrefixOf!0 lt!222996 (_2!6745 lt!222493))))

(assert (=> d!46183 (= (lemmaIsPrefixTransitive!0 lt!222996 (_2!6745 lt!222493) (_2!6745 lt!222493)) lt!223359)))

(declare-fun bs!11326 () Bool)

(assert (= bs!11326 d!46183))

(assert (=> bs!11326 m!220907))

(declare-fun m!221391 () Bool)

(assert (=> bs!11326 m!221391))

(assert (=> bs!11326 m!220907))

(assert (=> d!45975 d!46183))

(declare-fun d!46185 () Bool)

(declare-fun res!120334 () Bool)

(declare-fun e!95942 () Bool)

(assert (=> d!46185 (=> (not res!120334) (not e!95942))))

(assert (=> d!46185 (= res!120334 (= (size!2972 (buf!3401 lt!222996)) (size!2972 (buf!3401 (_2!6745 lt!222493)))))))

(assert (=> d!46185 (= (isPrefixOf!0 lt!222996 (_2!6745 lt!222493)) e!95942)))

(declare-fun b!144036 () Bool)

(declare-fun res!120336 () Bool)

(assert (=> b!144036 (=> (not res!120336) (not e!95942))))

(assert (=> b!144036 (= res!120336 (bvsle (bitIndex!0 (size!2972 (buf!3401 lt!222996)) (currentByte!6285 lt!222996) (currentBit!6280 lt!222996)) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222493))) (currentByte!6285 (_2!6745 lt!222493)) (currentBit!6280 (_2!6745 lt!222493)))))))

(declare-fun b!144037 () Bool)

(declare-fun e!95941 () Bool)

(assert (=> b!144037 (= e!95942 e!95941)))

(declare-fun res!120335 () Bool)

(assert (=> b!144037 (=> res!120335 e!95941)))

(assert (=> b!144037 (= res!120335 (= (size!2972 (buf!3401 lt!222996)) #b00000000000000000000000000000000))))

(declare-fun b!144038 () Bool)

(assert (=> b!144038 (= e!95941 (arrayBitRangesEq!0 (buf!3401 lt!222996) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 lt!222996)) (currentByte!6285 lt!222996) (currentBit!6280 lt!222996))))))

(assert (= (and d!46185 res!120334) b!144036))

(assert (= (and b!144036 res!120336) b!144037))

(assert (= (and b!144037 (not res!120335)) b!144038))

(assert (=> b!144036 m!221377))

(assert (=> b!144036 m!220501))

(assert (=> b!144038 m!221377))

(assert (=> b!144038 m!221377))

(declare-fun m!221393 () Bool)

(assert (=> b!144038 m!221393))

(assert (=> d!45975 d!46185))

(declare-fun b!144048 () Bool)

(declare-fun res!120344 () Bool)

(declare-fun e!95951 () Bool)

(assert (=> b!144048 (=> (not res!120344) (not e!95951))))

(declare-fun _$37!32 () tuple2!12808)

(assert (=> b!144048 (= res!120344 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 _$37!32))) (currentByte!6285 (_2!6745 _$37!32)) (currentBit!6280 (_2!6745 _$37!32))) (bvadd (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!144049 () Bool)

(declare-fun res!120345 () Bool)

(assert (=> b!144049 (=> (not res!120345) (not e!95951))))

(assert (=> b!144049 (= res!120345 (isPrefixOf!0 thiss!1634 (_2!6745 _$37!32)))))

(declare-fun b!144047 () Bool)

(declare-fun e!95949 () Bool)

(assert (=> b!144047 (= e!95949 (array_inv!2761 (buf!3401 (_2!6745 _$37!32))))))

(declare-fun d!46187 () Bool)

(assert (=> d!46187 e!95951))

(declare-fun res!120343 () Bool)

(assert (=> d!46187 (=> (not res!120343) (not e!95951))))

(assert (=> d!46187 (= res!120343 (= (size!2972 (buf!3401 thiss!1634)) (size!2972 (buf!3401 (_2!6745 _$37!32)))))))

(assert (=> d!46187 (and (inv!12 (_2!6745 _$37!32)) e!95949)))

(assert (=> d!46187 (= (choose!6 thiss!1634 (select (arr!3695 arr!237) from!447)) _$37!32)))

(declare-fun b!144050 () Bool)

(declare-fun lt!223365 () tuple2!12810)

(declare-fun lt!223364 () tuple2!12812)

(assert (=> b!144050 (= e!95951 (and (= (_2!6746 lt!223365) (select (arr!3695 arr!237) from!447)) (= (_1!6746 lt!223365) (_2!6747 lt!223364))))))

(assert (=> b!144050 (= lt!223365 (readBytePure!0 (_1!6747 lt!223364)))))

(assert (=> b!144050 (= lt!223364 (reader!0 thiss!1634 (_2!6745 _$37!32)))))

(assert (= d!46187 b!144047))

(assert (= (and d!46187 res!120343) b!144048))

(assert (= (and b!144048 res!120344) b!144049))

(assert (= (and b!144049 res!120345) b!144050))

(declare-fun m!221395 () Bool)

(assert (=> b!144047 m!221395))

(declare-fun m!221397 () Bool)

(assert (=> b!144050 m!221397))

(declare-fun m!221399 () Bool)

(assert (=> b!144050 m!221399))

(declare-fun m!221401 () Bool)

(assert (=> d!46187 m!221401))

(declare-fun m!221403 () Bool)

(assert (=> b!144049 m!221403))

(declare-fun m!221405 () Bool)

(assert (=> b!144048 m!221405))

(assert (=> b!144048 m!220507))

(assert (=> d!46049 d!46187))

(declare-fun d!46189 () Bool)

(assert (=> d!46189 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 thiss!1634))) ((_ sign_extend 32) (currentByte!6285 thiss!1634)) ((_ sign_extend 32) (currentBit!6280 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11327 () Bool)

(assert (= bs!11327 d!46189))

(assert (=> bs!11327 m!220825))

(assert (=> d!46049 d!46189))

(declare-fun d!46191 () Bool)

(declare-fun res!120346 () Bool)

(declare-fun e!95952 () Bool)

(assert (=> d!46191 (=> res!120346 e!95952)))

(assert (=> d!46191 (= res!120346 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!46191 (= (arrayRangesEq!288 arr!237 (_2!6748 lt!223072) #b00000000000000000000000000000000 to!404) e!95952)))

(declare-fun b!144051 () Bool)

(declare-fun e!95953 () Bool)

(assert (=> b!144051 (= e!95952 e!95953)))

(declare-fun res!120347 () Bool)

(assert (=> b!144051 (=> (not res!120347) (not e!95953))))

(assert (=> b!144051 (= res!120347 (= (select (arr!3695 arr!237) #b00000000000000000000000000000000) (select (arr!3695 (_2!6748 lt!223072)) #b00000000000000000000000000000000)))))

(declare-fun b!144052 () Bool)

(assert (=> b!144052 (= e!95953 (arrayRangesEq!288 arr!237 (_2!6748 lt!223072) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!46191 (not res!120346)) b!144051))

(assert (= (and b!144051 res!120347) b!144052))

(assert (=> b!144051 m!220857))

(declare-fun m!221407 () Bool)

(assert (=> b!144051 m!221407))

(declare-fun m!221409 () Bool)

(assert (=> b!144052 m!221409))

(assert (=> b!143849 d!46191))

(declare-fun b!144063 () Bool)

(declare-fun lt!223469 () tuple3!554)

(declare-fun e!95960 () Bool)

(assert (=> b!144063 (= e!95960 (arrayRangesEq!288 arr!237 (_3!342 lt!223469) #b00000000000000000000000000000000 from!447))))

(declare-fun b!144064 () Bool)

(declare-fun e!95961 () tuple3!554)

(declare-fun lt!223455 () Unit!8944)

(declare-fun lt!223441 () tuple3!554)

(assert (=> b!144064 (= e!95961 (tuple3!555 lt!223455 (_2!6757 lt!223441) (_3!342 lt!223441)))))

(declare-fun lt!223471 () tuple2!12826)

(assert (=> b!144064 (= lt!223471 (readByte!0 (_1!6747 lt!222487)))))

(declare-fun lt!223452 () array!6565)

(assert (=> b!144064 (= lt!223452 (array!6566 (store (arr!3695 arr!237) from!447 (_1!6755 lt!223471)) (size!2972 arr!237)))))

(declare-fun lt!223465 () (_ BitVec 64))

(assert (=> b!144064 (= lt!223465 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!223460 () (_ BitVec 32))

(assert (=> b!144064 (= lt!223460 (bvsub to!404 from!447))))

(declare-fun lt!223457 () Unit!8944)

(assert (=> b!144064 (= lt!223457 (validateOffsetBytesFromBitIndexLemma!0 (_1!6747 lt!222487) (_2!6755 lt!223471) lt!223465 lt!223460))))

(assert (=> b!144064 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6755 lt!223471)))) ((_ sign_extend 32) (currentByte!6285 (_2!6755 lt!223471))) ((_ sign_extend 32) (currentBit!6280 (_2!6755 lt!223471))) (bvsub lt!223460 ((_ extract 31 0) (bvsdiv (bvadd lt!223465 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!223438 () Unit!8944)

(assert (=> b!144064 (= lt!223438 lt!223457)))

(assert (=> b!144064 (= lt!223441 (readByteArrayLoop!0 (_2!6755 lt!223471) lt!223452 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!144064 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223471))) (currentByte!6285 (_2!6755 lt!223471)) (currentBit!6280 (_2!6755 lt!223471))) (bvadd (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222487))) (currentByte!6285 (_1!6747 lt!222487)) (currentBit!6280 (_1!6747 lt!222487))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!223444 () Unit!8944)

(declare-fun Unit!8971 () Unit!8944)

(assert (=> b!144064 (= lt!223444 Unit!8971)))

(declare-fun call!1870 () (_ BitVec 64))

(assert (=> b!144064 (= (bvadd (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223471))) (currentByte!6285 (_2!6755 lt!223471)) (currentBit!6280 (_2!6755 lt!223471))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1870)))

(declare-fun lt!223449 () Unit!8944)

(declare-fun Unit!8972 () Unit!8944)

(assert (=> b!144064 (= lt!223449 Unit!8972)))

(assert (=> b!144064 (= (bvadd (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222487))) (currentByte!6285 (_1!6747 lt!222487)) (currentBit!6280 (_1!6747 lt!222487))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1870)))

(declare-fun lt!223450 () Unit!8944)

(declare-fun Unit!8973 () Unit!8944)

(assert (=> b!144064 (= lt!223450 Unit!8973)))

(assert (=> b!144064 (and (= (buf!3401 (_1!6747 lt!222487)) (buf!3401 (_2!6757 lt!223441))) (= (size!2972 arr!237) (size!2972 (_3!342 lt!223441))))))

(declare-fun lt!223472 () Unit!8944)

(declare-fun Unit!8974 () Unit!8944)

(assert (=> b!144064 (= lt!223472 Unit!8974)))

(declare-fun lt!223461 () Unit!8944)

(declare-fun arrayUpdatedAtPrefixLemma!8 (array!6565 (_ BitVec 32) (_ BitVec 8)) Unit!8944)

(assert (=> b!144064 (= lt!223461 (arrayUpdatedAtPrefixLemma!8 arr!237 from!447 (_1!6755 lt!223471)))))

(assert (=> b!144064 (arrayRangesEq!288 arr!237 (array!6566 (store (arr!3695 arr!237) from!447 (_1!6755 lt!223471)) (size!2972 arr!237)) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!223454 () Unit!8944)

(assert (=> b!144064 (= lt!223454 lt!223461)))

(declare-fun lt!223458 () (_ BitVec 32))

(assert (=> b!144064 (= lt!223458 #b00000000000000000000000000000000)))

(declare-fun lt!223440 () Unit!8944)

(declare-fun arrayRangesEqTransitive!48 (array!6565 array!6565 array!6565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8944)

(assert (=> b!144064 (= lt!223440 (arrayRangesEqTransitive!48 arr!237 lt!223452 (_3!342 lt!223441) lt!223458 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(declare-fun call!1868 () Bool)

(assert (=> b!144064 call!1868))

(declare-fun lt!223443 () Unit!8944)

(assert (=> b!144064 (= lt!223443 lt!223440)))

(declare-fun call!1869 () Bool)

(assert (=> b!144064 call!1869))

(declare-fun lt!223451 () Unit!8944)

(declare-fun Unit!8975 () Unit!8944)

(assert (=> b!144064 (= lt!223451 Unit!8975)))

(declare-fun lt!223453 () Unit!8944)

(declare-fun arrayRangesEqImpliesEq!8 (array!6565 array!6565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8944)

(assert (=> b!144064 (= lt!223453 (arrayRangesEqImpliesEq!8 lt!223452 (_3!342 lt!223441) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!144064 (= (select (store (arr!3695 arr!237) from!447 (_1!6755 lt!223471)) from!447) (select (arr!3695 (_3!342 lt!223441)) from!447))))

(declare-fun lt!223468 () Unit!8944)

(assert (=> b!144064 (= lt!223468 lt!223453)))

(declare-fun lt!223464 () Bool)

(assert (=> b!144064 (= lt!223464 (= (select (arr!3695 (_3!342 lt!223441)) from!447) (_1!6755 lt!223471)))))

(declare-fun Unit!8976 () Unit!8944)

(assert (=> b!144064 (= lt!223455 Unit!8976)))

(assert (=> b!144064 lt!223464))

(declare-fun b!144065 () Bool)

(declare-fun res!120354 () Bool)

(assert (=> b!144065 (=> (not res!120354) (not e!95960))))

(assert (=> b!144065 (= res!120354 (and (= (buf!3401 (_1!6747 lt!222487)) (buf!3401 (_2!6757 lt!223469))) (= (size!2972 arr!237) (size!2972 (_3!342 lt!223469)))))))

(declare-fun d!46193 () Bool)

(declare-fun e!95962 () Bool)

(assert (=> d!46193 e!95962))

(declare-fun res!120356 () Bool)

(assert (=> d!46193 (=> res!120356 e!95962)))

(assert (=> d!46193 (= res!120356 (bvsge from!447 to!404))))

(declare-fun lt!223459 () Bool)

(assert (=> d!46193 (= lt!223459 e!95960)))

(declare-fun res!120355 () Bool)

(assert (=> d!46193 (=> (not res!120355) (not e!95960))))

(declare-fun lt!223473 () (_ BitVec 64))

(declare-fun lt!223446 () (_ BitVec 64))

(assert (=> d!46193 (= res!120355 (= (bvadd lt!223446 lt!223473) (bitIndex!0 (size!2972 (buf!3401 (_2!6757 lt!223469))) (currentByte!6285 (_2!6757 lt!223469)) (currentBit!6280 (_2!6757 lt!223469)))))))

(assert (=> d!46193 (or (not (= (bvand lt!223446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223473 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223446 lt!223473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!223447 () (_ BitVec 64))

(assert (=> d!46193 (= lt!223473 (bvmul lt!223447 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!46193 (or (= lt!223447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223447)))))

(assert (=> d!46193 (= lt!223447 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!46193 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!46193 (= lt!223446 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222487))) (currentByte!6285 (_1!6747 lt!222487)) (currentBit!6280 (_1!6747 lt!222487))))))

(assert (=> d!46193 (= lt!223469 e!95961)))

(declare-fun c!7869 () Bool)

(assert (=> d!46193 (= c!7869 (bvslt from!447 to!404))))

(assert (=> d!46193 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2972 arr!237)))))

(assert (=> d!46193 (= (readByteArrayLoop!0 (_1!6747 lt!222487) arr!237 from!447 to!404) lt!223469)))

(declare-fun lt!223470 () array!6565)

(declare-fun lt!223463 () (_ BitVec 32))

(declare-fun lt!223448 () array!6565)

(declare-fun bm!1865 () Bool)

(declare-fun lt!223467 () (_ BitVec 32))

(assert (=> bm!1865 (= call!1868 (arrayRangesEq!288 (ite c!7869 arr!237 lt!223448) (ite c!7869 (_3!342 lt!223441) lt!223470) (ite c!7869 lt!223458 lt!223467) (ite c!7869 from!447 lt!223463)))))

(declare-fun b!144066 () Bool)

(assert (=> b!144066 (= e!95962 (= (select (arr!3695 (_3!342 lt!223469)) from!447) (_2!6746 (readBytePure!0 (_1!6747 lt!222487)))))))

(assert (=> b!144066 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2972 (_3!342 lt!223469))))))

(declare-fun bm!1866 () Bool)

(assert (=> bm!1866 (= call!1869 (arrayRangesEq!288 arr!237 (ite c!7869 (_3!342 lt!223441) arr!237) #b00000000000000000000000000000000 (ite c!7869 from!447 (size!2972 arr!237))))))

(declare-fun bm!1867 () Bool)

(assert (=> bm!1867 (= call!1870 (bitIndex!0 (ite c!7869 (size!2972 (buf!3401 (_2!6757 lt!223441))) (size!2972 (buf!3401 (_1!6747 lt!222487)))) (ite c!7869 (currentByte!6285 (_2!6757 lt!223441)) (currentByte!6285 (_1!6747 lt!222487))) (ite c!7869 (currentBit!6280 (_2!6757 lt!223441)) (currentBit!6280 (_1!6747 lt!222487)))))))

(declare-fun lt!223466 () Unit!8944)

(declare-fun b!144067 () Bool)

(assert (=> b!144067 (= e!95961 (tuple3!555 lt!223466 (_1!6747 lt!222487) arr!237))))

(assert (=> b!144067 (= call!1870 call!1870)))

(declare-fun lt!223456 () Unit!8944)

(declare-fun Unit!8977 () Unit!8944)

(assert (=> b!144067 (= lt!223456 Unit!8977)))

(declare-fun lt!223442 () Unit!8944)

(declare-fun arrayRangesEqReflexiveLemma!8 (array!6565) Unit!8944)

(assert (=> b!144067 (= lt!223442 (arrayRangesEqReflexiveLemma!8 arr!237))))

(assert (=> b!144067 call!1869))

(declare-fun lt!223462 () Unit!8944)

(assert (=> b!144067 (= lt!223462 lt!223442)))

(assert (=> b!144067 (= lt!223448 arr!237)))

(assert (=> b!144067 (= lt!223470 arr!237)))

(declare-fun lt!223445 () (_ BitVec 32))

(assert (=> b!144067 (= lt!223445 #b00000000000000000000000000000000)))

(declare-fun lt!223439 () (_ BitVec 32))

(assert (=> b!144067 (= lt!223439 (size!2972 arr!237))))

(assert (=> b!144067 (= lt!223467 #b00000000000000000000000000000000)))

(assert (=> b!144067 (= lt!223463 from!447)))

(declare-fun arrayRangesEqSlicedLemma!8 (array!6565 array!6565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8944)

(assert (=> b!144067 (= lt!223466 (arrayRangesEqSlicedLemma!8 lt!223448 lt!223470 lt!223445 lt!223439 lt!223467 lt!223463))))

(assert (=> b!144067 call!1868))

(assert (= (and d!46193 c!7869) b!144064))

(assert (= (and d!46193 (not c!7869)) b!144067))

(assert (= (or b!144064 b!144067) bm!1866))

(assert (= (or b!144064 b!144067) bm!1865))

(assert (= (or b!144064 b!144067) bm!1867))

(assert (= (and d!46193 res!120355) b!144065))

(assert (= (and b!144065 res!120354) b!144063))

(assert (= (and d!46193 (not res!120356)) b!144066))

(declare-fun m!221411 () Bool)

(assert (=> b!144067 m!221411))

(declare-fun m!221413 () Bool)

(assert (=> b!144067 m!221413))

(declare-fun m!221415 () Bool)

(assert (=> d!46193 m!221415))

(assert (=> d!46193 m!221207))

(declare-fun m!221417 () Bool)

(assert (=> bm!1865 m!221417))

(declare-fun m!221419 () Bool)

(assert (=> b!144064 m!221419))

(declare-fun m!221421 () Bool)

(assert (=> b!144064 m!221421))

(assert (=> b!144064 m!221207))

(declare-fun m!221423 () Bool)

(assert (=> b!144064 m!221423))

(assert (=> b!144064 m!221015))

(declare-fun m!221425 () Bool)

(assert (=> b!144064 m!221425))

(declare-fun m!221427 () Bool)

(assert (=> b!144064 m!221427))

(declare-fun m!221429 () Bool)

(assert (=> b!144064 m!221429))

(declare-fun m!221431 () Bool)

(assert (=> b!144064 m!221431))

(declare-fun m!221433 () Bool)

(assert (=> b!144064 m!221433))

(declare-fun m!221435 () Bool)

(assert (=> b!144064 m!221435))

(declare-fun m!221437 () Bool)

(assert (=> b!144064 m!221437))

(declare-fun m!221439 () Bool)

(assert (=> b!144064 m!221439))

(declare-fun m!221441 () Bool)

(assert (=> bm!1866 m!221441))

(declare-fun m!221443 () Bool)

(assert (=> b!144066 m!221443))

(assert (=> b!144066 m!220479))

(declare-fun m!221445 () Bool)

(assert (=> b!144063 m!221445))

(declare-fun m!221447 () Bool)

(assert (=> bm!1867 m!221447))

(assert (=> d!46047 d!46193))

(declare-fun b!144068 () Bool)

(declare-fun lt!223474 () tuple4!130)

(declare-fun e!95967 () Bool)

(assert (=> b!144068 (= e!95967 (arrayRangesEq!288 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222493)) (_1!6760 lt!223474) (_2!6760 lt!223474)))))

(declare-fun b!144069 () Bool)

(declare-fun e!95966 () Bool)

(declare-fun call!1871 () Bool)

(assert (=> b!144069 (= e!95966 call!1871)))

(declare-fun b!144071 () Bool)

(declare-fun e!95968 () Bool)

(declare-fun e!95964 () Bool)

(assert (=> b!144071 (= e!95968 e!95964)))

(declare-fun res!120359 () Bool)

(declare-fun lt!223476 () (_ BitVec 32))

(assert (=> b!144071 (= res!120359 (byteRangesEq!0 (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223474)) (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223474)) lt!223476 #b00000000000000000000000000001000))))

(assert (=> b!144071 (=> (not res!120359) (not e!95964))))

(declare-fun b!144072 () Bool)

(declare-fun res!120361 () Bool)

(declare-fun lt!223475 () (_ BitVec 32))

(assert (=> b!144072 (= res!120361 (= lt!223475 #b00000000000000000000000000000000))))

(assert (=> b!144072 (=> res!120361 e!95966)))

(assert (=> b!144072 (= e!95964 e!95966)))

(declare-fun b!144073 () Bool)

(assert (=> b!144073 (= e!95968 call!1871)))

(declare-fun b!144074 () Bool)

(declare-fun e!95965 () Bool)

(assert (=> b!144074 (= e!95965 e!95968)))

(declare-fun c!7870 () Bool)

(assert (=> b!144074 (= c!7870 (= (_3!344 lt!223474) (_4!65 lt!223474)))))

(declare-fun bm!1868 () Bool)

(assert (=> bm!1868 (= call!1871 (byteRangesEq!0 (ite c!7870 (select (arr!3695 (buf!3401 thiss!1634)) (_3!344 lt!223474)) (select (arr!3695 (buf!3401 thiss!1634)) (_4!65 lt!223474))) (ite c!7870 (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_3!344 lt!223474)) (select (arr!3695 (buf!3401 (_2!6745 lt!222493))) (_4!65 lt!223474))) (ite c!7870 lt!223476 #b00000000000000000000000000000000) lt!223475))))

(declare-fun b!144070 () Bool)

(declare-fun e!95963 () Bool)

(assert (=> b!144070 (= e!95963 e!95965)))

(declare-fun res!120358 () Bool)

(assert (=> b!144070 (=> (not res!120358) (not e!95965))))

(assert (=> b!144070 (= res!120358 e!95967)))

(declare-fun res!120360 () Bool)

(assert (=> b!144070 (=> res!120360 e!95967)))

(assert (=> b!144070 (= res!120360 (bvsge (_1!6760 lt!223474) (_2!6760 lt!223474)))))

(assert (=> b!144070 (= lt!223475 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144070 (= lt!223476 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144070 (= lt!223474 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(declare-fun d!46195 () Bool)

(declare-fun res!120357 () Bool)

(assert (=> d!46195 (=> res!120357 e!95963)))

(assert (=> d!46195 (= res!120357 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(assert (=> d!46195 (= (arrayBitRangesEq!0 (buf!3401 thiss!1634) (buf!3401 (_2!6745 lt!222493)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))) e!95963)))

(assert (= (and d!46195 (not res!120357)) b!144070))

(assert (= (and b!144070 (not res!120360)) b!144068))

(assert (= (and b!144070 res!120358) b!144074))

(assert (= (and b!144074 c!7870) b!144073))

(assert (= (and b!144074 (not c!7870)) b!144071))

(assert (= (and b!144071 res!120359) b!144072))

(assert (= (and b!144072 (not res!120361)) b!144069))

(assert (= (or b!144073 b!144069) bm!1868))

(declare-fun m!221449 () Bool)

(assert (=> b!144068 m!221449))

(declare-fun m!221451 () Bool)

(assert (=> b!144071 m!221451))

(declare-fun m!221453 () Bool)

(assert (=> b!144071 m!221453))

(assert (=> b!144071 m!221451))

(assert (=> b!144071 m!221453))

(declare-fun m!221455 () Bool)

(assert (=> b!144071 m!221455))

(assert (=> bm!1868 m!221453))

(declare-fun m!221457 () Bool)

(assert (=> bm!1868 m!221457))

(declare-fun m!221459 () Bool)

(assert (=> bm!1868 m!221459))

(declare-fun m!221461 () Bool)

(assert (=> bm!1868 m!221461))

(assert (=> bm!1868 m!221451))

(assert (=> b!144070 m!220507))

(assert (=> b!144070 m!221165))

(assert (=> b!143898 d!46195))

(assert (=> b!143898 d!46053))

(declare-fun d!46197 () Bool)

(declare-fun res!120362 () Bool)

(declare-fun e!95970 () Bool)

(assert (=> d!46197 (=> (not res!120362) (not e!95970))))

(assert (=> d!46197 (= res!120362 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 lt!223074)))))))

(assert (=> d!46197 (= (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 lt!223074)) e!95970)))

(declare-fun b!144075 () Bool)

(declare-fun res!120364 () Bool)

(assert (=> b!144075 (=> (not res!120364) (not e!95970))))

(assert (=> b!144075 (= res!120364 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223074))) (currentByte!6285 (_2!6745 lt!223074)) (currentBit!6280 (_2!6745 lt!223074)))))))

(declare-fun b!144076 () Bool)

(declare-fun e!95969 () Bool)

(assert (=> b!144076 (= e!95970 e!95969)))

(declare-fun res!120363 () Bool)

(assert (=> b!144076 (=> res!120363 e!95969)))

(assert (=> b!144076 (= res!120363 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) #b00000000000000000000000000000000))))

(declare-fun b!144077 () Bool)

(assert (=> b!144077 (= e!95969 (arrayBitRangesEq!0 (buf!3401 (_2!6745 lt!222486)) (buf!3401 (_2!6745 lt!223074)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(assert (= (and d!46197 res!120362) b!144075))

(assert (= (and b!144075 res!120364) b!144076))

(assert (= (and b!144076 (not res!120363)) b!144077))

(assert (=> b!144075 m!220503))

(assert (=> b!144075 m!220941))

(assert (=> b!144077 m!220503))

(assert (=> b!144077 m!220503))

(declare-fun m!221463 () Bool)

(assert (=> b!144077 m!221463))

(assert (=> b!143851 d!46197))

(declare-fun d!46199 () Bool)

(declare-fun lt!223482 () (_ BitVec 8))

(declare-fun lt!223481 () (_ BitVec 8))

(assert (=> d!46199 (= lt!223482 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 lt!222492)) (currentByte!6285 lt!222492))) ((_ sign_extend 24) lt!223481))))))

(assert (=> d!46199 (= lt!223481 ((_ extract 7 0) (currentBit!6280 lt!222492)))))

(declare-fun e!95972 () Bool)

(assert (=> d!46199 e!95972))

(declare-fun res!120366 () Bool)

(assert (=> d!46199 (=> (not res!120366) (not e!95972))))

(assert (=> d!46199 (= res!120366 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 lt!222492))) ((_ sign_extend 32) (currentByte!6285 lt!222492)) ((_ sign_extend 32) (currentBit!6280 lt!222492)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8978 () Unit!8944)

(declare-fun Unit!8979 () Unit!8944)

(assert (=> d!46199 (= (readByte!0 lt!222492) (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223481) #b00000000000000000000000000000000) (tuple2!12831 Unit!8978 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223482) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 lt!222492)) (bvadd (currentByte!6285 lt!222492) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223481)))))))) (tuple2!12831 Unit!8979 lt!223482))) (BitStream!5203 (buf!3401 lt!222492) (bvadd (currentByte!6285 lt!222492) #b00000000000000000000000000000001) (currentBit!6280 lt!222492))))))

(declare-fun b!144078 () Bool)

(declare-fun e!95971 () Bool)

(assert (=> b!144078 (= e!95972 e!95971)))

(declare-fun res!120365 () Bool)

(assert (=> b!144078 (=> (not res!120365) (not e!95971))))

(declare-fun lt!223480 () tuple2!12826)

(assert (=> b!144078 (= res!120365 (= (buf!3401 (_2!6755 lt!223480)) (buf!3401 lt!222492)))))

(declare-fun lt!223483 () (_ BitVec 8))

(declare-fun lt!223479 () (_ BitVec 8))

(declare-fun Unit!8980 () Unit!8944)

(declare-fun Unit!8981 () Unit!8944)

(assert (=> b!144078 (= lt!223480 (tuple2!12827 (_2!6759 (ite (bvsgt ((_ sign_extend 24) lt!223483) #b00000000000000000000000000000000) (tuple2!12831 Unit!8980 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!223479) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3695 (buf!3401 lt!222492)) (bvadd (currentByte!6285 lt!222492) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!223483)))))))) (tuple2!12831 Unit!8981 lt!223479))) (BitStream!5203 (buf!3401 lt!222492) (bvadd (currentByte!6285 lt!222492) #b00000000000000000000000000000001) (currentBit!6280 lt!222492))))))

(assert (=> b!144078 (= lt!223479 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3695 (buf!3401 lt!222492)) (currentByte!6285 lt!222492))) ((_ sign_extend 24) lt!223483))))))

(assert (=> b!144078 (= lt!223483 ((_ extract 7 0) (currentBit!6280 lt!222492)))))

(declare-fun b!144079 () Bool)

(declare-fun lt!223477 () (_ BitVec 64))

(declare-fun lt!223478 () (_ BitVec 64))

(assert (=> b!144079 (= e!95971 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223480))) (currentByte!6285 (_2!6755 lt!223480)) (currentBit!6280 (_2!6755 lt!223480))) (bvadd lt!223478 lt!223477)))))

(assert (=> b!144079 (or (not (= (bvand lt!223478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223477 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223478 lt!223477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!144079 (= lt!223477 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!144079 (= lt!223478 (bitIndex!0 (size!2972 (buf!3401 lt!222492)) (currentByte!6285 lt!222492) (currentBit!6280 lt!222492)))))

(assert (= (and d!46199 res!120366) b!144078))

(assert (= (and b!144078 res!120365) b!144079))

(declare-fun m!221465 () Bool)

(assert (=> d!46199 m!221465))

(declare-fun m!221467 () Bool)

(assert (=> d!46199 m!221467))

(declare-fun m!221469 () Bool)

(assert (=> d!46199 m!221469))

(assert (=> b!144078 m!221469))

(assert (=> b!144078 m!221465))

(declare-fun m!221471 () Bool)

(assert (=> b!144079 m!221471))

(declare-fun m!221473 () Bool)

(assert (=> b!144079 m!221473))

(assert (=> d!46043 d!46199))

(declare-fun d!46201 () Bool)

(declare-fun e!95973 () Bool)

(assert (=> d!46201 e!95973))

(declare-fun res!120368 () Bool)

(assert (=> d!46201 (=> (not res!120368) (not e!95973))))

(declare-fun lt!223489 () (_ BitVec 64))

(declare-fun lt!223484 () (_ BitVec 64))

(declare-fun lt!223485 () (_ BitVec 64))

(assert (=> d!46201 (= res!120368 (= lt!223484 (bvsub lt!223489 lt!223485)))))

(assert (=> d!46201 (or (= (bvand lt!223489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223485 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223489 lt!223485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46201 (= lt!223485 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223217)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!223217))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!223217)))))))

(declare-fun lt!223486 () (_ BitVec 64))

(declare-fun lt!223488 () (_ BitVec 64))

(assert (=> d!46201 (= lt!223489 (bvmul lt!223486 lt!223488))))

(assert (=> d!46201 (or (= lt!223486 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223488 (bvsdiv (bvmul lt!223486 lt!223488) lt!223486)))))

(assert (=> d!46201 (= lt!223488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46201 (= lt!223486 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223217)))))))

(assert (=> d!46201 (= lt!223484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!223217))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!223217)))))))

(assert (=> d!46201 (invariant!0 (currentBit!6280 (_2!6745 lt!223217)) (currentByte!6285 (_2!6745 lt!223217)) (size!2972 (buf!3401 (_2!6745 lt!223217))))))

(assert (=> d!46201 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!223217))) (currentByte!6285 (_2!6745 lt!223217)) (currentBit!6280 (_2!6745 lt!223217))) lt!223484)))

(declare-fun b!144080 () Bool)

(declare-fun res!120367 () Bool)

(assert (=> b!144080 (=> (not res!120367) (not e!95973))))

(assert (=> b!144080 (= res!120367 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223484))))

(declare-fun b!144081 () Bool)

(declare-fun lt!223487 () (_ BitVec 64))

(assert (=> b!144081 (= e!95973 (bvsle lt!223484 (bvmul lt!223487 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144081 (or (= lt!223487 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223487 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223487)))))

(assert (=> b!144081 (= lt!223487 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 lt!223217)))))))

(assert (= (and d!46201 res!120368) b!144080))

(assert (= (and b!144080 res!120367) b!144081))

(declare-fun m!221475 () Bool)

(assert (=> d!46201 m!221475))

(declare-fun m!221477 () Bool)

(assert (=> d!46201 m!221477))

(assert (=> b!143905 d!46201))

(assert (=> b!143905 d!46053))

(declare-fun d!46203 () Bool)

(declare-fun e!95983 () Bool)

(assert (=> d!46203 e!95983))

(declare-fun res!120380 () Bool)

(assert (=> d!46203 (=> (not res!120380) (not e!95983))))

(declare-fun _$39!36 () tuple2!12808)

(assert (=> d!46203 (= res!120380 (= (size!2972 (buf!3401 (_2!6745 lt!222486))) (size!2972 (buf!3401 (_2!6745 _$39!36)))))))

(declare-fun e!95982 () Bool)

(assert (=> d!46203 (and (inv!12 (_2!6745 _$39!36)) e!95982)))

(assert (=> d!46203 (= (choose!64 (_2!6745 lt!222486) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!36)))

(declare-fun b!144092 () Bool)

(declare-fun res!120378 () Bool)

(assert (=> b!144092 (=> (not res!120378) (not e!95983))))

(assert (=> b!144092 (= res!120378 (isPrefixOf!0 (_2!6745 lt!222486) (_2!6745 _$39!36)))))

(declare-fun lt!223501 () tuple2!12814)

(declare-fun e!95984 () Bool)

(declare-fun b!144093 () Bool)

(assert (=> b!144093 (= e!95984 (arrayRangesEq!288 arr!237 (_2!6748 lt!223501) #b00000000000000000000000000000000 to!404))))

(declare-fun b!144094 () Bool)

(assert (=> b!144094 (= e!95983 e!95984)))

(declare-fun res!120377 () Bool)

(assert (=> b!144094 (=> (not res!120377) (not e!95984))))

(declare-fun lt!223503 () tuple2!12812)

(assert (=> b!144094 (= res!120377 (and (= (size!2972 (_2!6748 lt!223501)) (size!2972 arr!237)) (= (_1!6748 lt!223501) (_2!6747 lt!223503))))))

(assert (=> b!144094 (= lt!223501 (readByteArrayLoopPure!0 (_1!6747 lt!223503) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!223500 () Unit!8944)

(declare-fun lt!223504 () Unit!8944)

(assert (=> b!144094 (= lt!223500 lt!223504)))

(declare-fun lt!223502 () (_ BitVec 64))

(assert (=> b!144094 (validate_offset_bits!1 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6745 _$39!36)))) ((_ sign_extend 32) (currentByte!6285 (_2!6745 lt!222486))) ((_ sign_extend 32) (currentBit!6280 (_2!6745 lt!222486))) lt!223502)))

(assert (=> b!144094 (= lt!223504 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6745 lt!222486) (buf!3401 (_2!6745 _$39!36)) lt!223502))))

(assert (=> b!144094 (= lt!223502 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!144094 (= lt!223503 (reader!0 (_2!6745 lt!222486) (_2!6745 _$39!36)))))

(declare-fun b!144095 () Bool)

(assert (=> b!144095 (= e!95982 (array_inv!2761 (buf!3401 (_2!6745 _$39!36))))))

(declare-fun b!144096 () Bool)

(declare-fun res!120379 () Bool)

(assert (=> b!144096 (=> (not res!120379) (not e!95983))))

(assert (=> b!144096 (= res!120379 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6745 _$39!36))) (currentByte!6285 (_2!6745 _$39!36)) (currentBit!6280 (_2!6745 _$39!36))) (bvadd (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= d!46203 b!144095))

(assert (= (and d!46203 res!120380) b!144096))

(assert (= (and b!144096 res!120379) b!144092))

(assert (= (and b!144092 res!120378) b!144094))

(assert (= (and b!144094 res!120377) b!144093))

(declare-fun m!221479 () Bool)

(assert (=> b!144096 m!221479))

(assert (=> b!144096 m!220503))

(declare-fun m!221481 () Bool)

(assert (=> b!144094 m!221481))

(declare-fun m!221483 () Bool)

(assert (=> b!144094 m!221483))

(declare-fun m!221485 () Bool)

(assert (=> b!144094 m!221485))

(declare-fun m!221487 () Bool)

(assert (=> b!144094 m!221487))

(declare-fun m!221489 () Bool)

(assert (=> b!144092 m!221489))

(declare-fun m!221491 () Bool)

(assert (=> b!144093 m!221491))

(declare-fun m!221493 () Bool)

(assert (=> b!144095 m!221493))

(declare-fun m!221495 () Bool)

(assert (=> d!46203 m!221495))

(assert (=> d!45977 d!46203))

(declare-fun d!46205 () Bool)

(declare-fun lt!223505 () tuple2!12826)

(assert (=> d!46205 (= lt!223505 (readByte!0 lt!223147))))

(assert (=> d!46205 (= (readBytePure!0 lt!223147) (tuple2!12811 (_2!6755 lt!223505) (_1!6755 lt!223505)))))

(declare-fun bs!11328 () Bool)

(assert (= bs!11328 d!46205))

(declare-fun m!221497 () Bool)

(assert (=> bs!11328 m!221497))

(assert (=> d!46004 d!46205))

(declare-fun d!46207 () Bool)

(declare-fun e!95986 () Bool)

(assert (=> d!46207 e!95986))

(declare-fun res!120382 () Bool)

(assert (=> d!46207 (=> (not res!120382) (not e!95986))))

(declare-fun lt!223506 () (_ BitVec 64))

(declare-fun lt!223507 () (_ BitVec 64))

(declare-fun lt!223511 () (_ BitVec 64))

(assert (=> d!46207 (= res!120382 (= lt!223506 (bvsub lt!223511 lt!223507)))))

(assert (=> d!46207 (or (= (bvand lt!223511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223507 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223511 lt!223507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46207 (= lt!223507 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!223146)))) ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!223146))) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!223146)))))))

(declare-fun lt!223508 () (_ BitVec 64))

(declare-fun lt!223510 () (_ BitVec 64))

(assert (=> d!46207 (= lt!223511 (bvmul lt!223508 lt!223510))))

(assert (=> d!46207 (or (= lt!223508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223510 (bvsdiv (bvmul lt!223508 lt!223510) lt!223508)))))

(assert (=> d!46207 (= lt!223510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46207 (= lt!223508 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!223146)))))))

(assert (=> d!46207 (= lt!223506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!223146))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!223146)))))))

(assert (=> d!46207 (invariant!0 (currentBit!6280 (_1!6746 lt!223146)) (currentByte!6285 (_1!6746 lt!223146)) (size!2972 (buf!3401 (_1!6746 lt!223146))))))

(assert (=> d!46207 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!223146))) (currentByte!6285 (_1!6746 lt!223146)) (currentBit!6280 (_1!6746 lt!223146))) lt!223506)))

(declare-fun b!144097 () Bool)

(declare-fun res!120381 () Bool)

(assert (=> b!144097 (=> (not res!120381) (not e!95986))))

(assert (=> b!144097 (= res!120381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223506))))

(declare-fun b!144098 () Bool)

(declare-fun lt!223509 () (_ BitVec 64))

(assert (=> b!144098 (= e!95986 (bvsle lt!223506 (bvmul lt!223509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144098 (or (= lt!223509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223509)))))

(assert (=> b!144098 (= lt!223509 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!223146)))))))

(assert (= (and d!46207 res!120382) b!144097))

(assert (= (and b!144097 res!120381) b!144098))

(declare-fun m!221499 () Bool)

(assert (=> d!46207 m!221499))

(declare-fun m!221501 () Bool)

(assert (=> d!46207 m!221501))

(assert (=> d!46004 d!46207))

(assert (=> d!46004 d!46043))

(declare-fun d!46209 () Bool)

(declare-fun e!95989 () Bool)

(assert (=> d!46209 e!95989))

(declare-fun res!120385 () Bool)

(assert (=> d!46209 (=> (not res!120385) (not e!95989))))

(declare-fun lt!223516 () tuple2!12810)

(declare-fun lt!223517 () tuple2!12810)

(assert (=> d!46209 (= res!120385 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!223516))) (currentByte!6285 (_1!6746 lt!223516)) (currentBit!6280 (_1!6746 lt!223516))) (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!223517))) (currentByte!6285 (_1!6746 lt!223517)) (currentBit!6280 (_1!6746 lt!223517)))))))

(assert (=> d!46209 (= lt!223517 (readBytePure!0 (BitStream!5203 (buf!3401 (_2!6745 lt!222493)) (currentByte!6285 lt!222492) (currentBit!6280 lt!222492))))))

(assert (=> d!46209 (= lt!223516 (readBytePure!0 lt!222492))))

(assert (=> d!46209 true))

(declare-fun _$8!75 () Unit!8944)

(assert (=> d!46209 (= (choose!14 lt!222492 (_2!6745 lt!222493) lt!223147 lt!223146 (tuple2!12811 (_1!6746 lt!223146) (_2!6746 lt!223146)) (_1!6746 lt!223146) (_2!6746 lt!223146) lt!223144 (tuple2!12811 (_1!6746 lt!223144) (_2!6746 lt!223144)) (_1!6746 lt!223144) (_2!6746 lt!223144)) _$8!75)))

(declare-fun b!144101 () Bool)

(assert (=> b!144101 (= e!95989 (= (_2!6746 lt!223516) (_2!6746 lt!223517)))))

(assert (= (and d!46209 res!120385) b!144101))

(declare-fun m!221503 () Bool)

(assert (=> d!46209 m!221503))

(declare-fun m!221505 () Bool)

(assert (=> d!46209 m!221505))

(declare-fun m!221507 () Bool)

(assert (=> d!46209 m!221507))

(assert (=> d!46209 m!220493))

(assert (=> d!46004 d!46209))

(declare-fun d!46211 () Bool)

(declare-fun e!95990 () Bool)

(assert (=> d!46211 e!95990))

(declare-fun res!120387 () Bool)

(assert (=> d!46211 (=> (not res!120387) (not e!95990))))

(declare-fun lt!223523 () (_ BitVec 64))

(declare-fun lt!223519 () (_ BitVec 64))

(declare-fun lt!223518 () (_ BitVec 64))

(assert (=> d!46211 (= res!120387 (= lt!223518 (bvsub lt!223523 lt!223519)))))

(assert (=> d!46211 (or (= (bvand lt!223523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223519 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!223523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!223523 lt!223519) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46211 (= lt!223519 (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!223144)))) ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!223144))) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!223144)))))))

(declare-fun lt!223520 () (_ BitVec 64))

(declare-fun lt!223522 () (_ BitVec 64))

(assert (=> d!46211 (= lt!223523 (bvmul lt!223520 lt!223522))))

(assert (=> d!46211 (or (= lt!223520 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!223522 (bvsdiv (bvmul lt!223520 lt!223522) lt!223520)))))

(assert (=> d!46211 (= lt!223522 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!46211 (= lt!223520 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!223144)))))))

(assert (=> d!46211 (= lt!223518 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!223144))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!223144)))))))

(assert (=> d!46211 (invariant!0 (currentBit!6280 (_1!6746 lt!223144)) (currentByte!6285 (_1!6746 lt!223144)) (size!2972 (buf!3401 (_1!6746 lt!223144))))))

(assert (=> d!46211 (= (bitIndex!0 (size!2972 (buf!3401 (_1!6746 lt!223144))) (currentByte!6285 (_1!6746 lt!223144)) (currentBit!6280 (_1!6746 lt!223144))) lt!223518)))

(declare-fun b!144102 () Bool)

(declare-fun res!120386 () Bool)

(assert (=> b!144102 (=> (not res!120386) (not e!95990))))

(assert (=> b!144102 (= res!120386 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!223518))))

(declare-fun b!144103 () Bool)

(declare-fun lt!223521 () (_ BitVec 64))

(assert (=> b!144103 (= e!95990 (bvsle lt!223518 (bvmul lt!223521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!144103 (or (= lt!223521 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223521 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223521)))))

(assert (=> b!144103 (= lt!223521 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!223144)))))))

(assert (= (and d!46211 res!120387) b!144102))

(assert (= (and b!144102 res!120386) b!144103))

(declare-fun m!221509 () Bool)

(assert (=> d!46211 m!221509))

(declare-fun m!221511 () Bool)

(assert (=> d!46211 m!221511))

(assert (=> d!46004 d!46211))

(declare-fun d!46213 () Bool)

(assert (=> d!46213 (= (remainingBits!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222501)))) ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222501))) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222501)))) (bvsub (bvmul ((_ sign_extend 32) (size!2972 (buf!3401 (_1!6746 lt!222501)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6285 (_1!6746 lt!222501))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6280 (_1!6746 lt!222501))))))))

(assert (=> d!46039 d!46213))

(declare-fun d!46215 () Bool)

(assert (=> d!46215 (= (invariant!0 (currentBit!6280 (_1!6746 lt!222501)) (currentByte!6285 (_1!6746 lt!222501)) (size!2972 (buf!3401 (_1!6746 lt!222501)))) (and (bvsge (currentBit!6280 (_1!6746 lt!222501)) #b00000000000000000000000000000000) (bvslt (currentBit!6280 (_1!6746 lt!222501)) #b00000000000000000000000000001000) (bvsge (currentByte!6285 (_1!6746 lt!222501)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6285 (_1!6746 lt!222501)) (size!2972 (buf!3401 (_1!6746 lt!222501)))) (and (= (currentBit!6280 (_1!6746 lt!222501)) #b00000000000000000000000000000000) (= (currentByte!6285 (_1!6746 lt!222501)) (size!2972 (buf!3401 (_1!6746 lt!222501))))))))))

(assert (=> d!46039 d!46215))

(declare-fun d!46217 () Bool)

(declare-fun res!120388 () Bool)

(declare-fun e!95992 () Bool)

(assert (=> d!46217 (=> (not res!120388) (not e!95992))))

(assert (=> d!46217 (= res!120388 (= (size!2972 (buf!3401 (_1!6747 lt!222913))) (size!2972 (buf!3401 thiss!1634))))))

(assert (=> d!46217 (= (isPrefixOf!0 (_1!6747 lt!222913) thiss!1634) e!95992)))

(declare-fun b!144104 () Bool)

(declare-fun res!120390 () Bool)

(assert (=> b!144104 (=> (not res!120390) (not e!95992))))

(assert (=> b!144104 (= res!120390 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222913))) (currentByte!6285 (_1!6747 lt!222913)) (currentBit!6280 (_1!6747 lt!222913))) (bitIndex!0 (size!2972 (buf!3401 thiss!1634)) (currentByte!6285 thiss!1634) (currentBit!6280 thiss!1634))))))

(declare-fun b!144105 () Bool)

(declare-fun e!95991 () Bool)

(assert (=> b!144105 (= e!95992 e!95991)))

(declare-fun res!120389 () Bool)

(assert (=> b!144105 (=> res!120389 e!95991)))

(assert (=> b!144105 (= res!120389 (= (size!2972 (buf!3401 (_1!6747 lt!222913))) #b00000000000000000000000000000000))))

(declare-fun b!144106 () Bool)

(assert (=> b!144106 (= e!95991 (arrayBitRangesEq!0 (buf!3401 (_1!6747 lt!222913)) (buf!3401 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222913))) (currentByte!6285 (_1!6747 lt!222913)) (currentBit!6280 (_1!6747 lt!222913)))))))

(assert (= (and d!46217 res!120388) b!144104))

(assert (= (and b!144104 res!120390) b!144105))

(assert (= (and b!144105 (not res!120389)) b!144106))

(assert (=> b!144104 m!221233))

(assert (=> b!144104 m!220507))

(assert (=> b!144106 m!221233))

(assert (=> b!144106 m!221233))

(declare-fun m!221513 () Bool)

(assert (=> b!144106 m!221513))

(assert (=> b!143769 d!46217))

(declare-fun lt!223555 () tuple3!554)

(declare-fun b!144107 () Bool)

(declare-fun e!95993 () Bool)

(assert (=> b!144107 (= e!95993 (arrayRangesEq!288 arr!237 (_3!342 lt!223555) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!144108 () Bool)

(declare-fun e!95994 () tuple3!554)

(declare-fun lt!223541 () Unit!8944)

(declare-fun lt!223527 () tuple3!554)

(assert (=> b!144108 (= e!95994 (tuple3!555 lt!223541 (_2!6757 lt!223527) (_3!342 lt!223527)))))

(declare-fun lt!223557 () tuple2!12826)

(assert (=> b!144108 (= lt!223557 (readByte!0 (_1!6747 lt!222494)))))

(declare-fun lt!223538 () array!6565)

(assert (=> b!144108 (= lt!223538 (array!6566 (store (arr!3695 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6755 lt!223557)) (size!2972 arr!237)))))

(declare-fun lt!223551 () (_ BitVec 64))

(assert (=> b!144108 (= lt!223551 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!223546 () (_ BitVec 32))

(assert (=> b!144108 (= lt!223546 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!223543 () Unit!8944)

(assert (=> b!144108 (= lt!223543 (validateOffsetBytesFromBitIndexLemma!0 (_1!6747 lt!222494) (_2!6755 lt!223557) lt!223551 lt!223546))))

(assert (=> b!144108 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2972 (buf!3401 (_2!6755 lt!223557)))) ((_ sign_extend 32) (currentByte!6285 (_2!6755 lt!223557))) ((_ sign_extend 32) (currentBit!6280 (_2!6755 lt!223557))) (bvsub lt!223546 ((_ extract 31 0) (bvsdiv (bvadd lt!223551 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!223524 () Unit!8944)

(assert (=> b!144108 (= lt!223524 lt!223543)))

(assert (=> b!144108 (= lt!223527 (readByteArrayLoop!0 (_2!6755 lt!223557) lt!223538 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!144108 (= (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223557))) (currentByte!6285 (_2!6755 lt!223557)) (currentBit!6280 (_2!6755 lt!223557))) (bvadd (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222494))) (currentByte!6285 (_1!6747 lt!222494)) (currentBit!6280 (_1!6747 lt!222494))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!223530 () Unit!8944)

(declare-fun Unit!8982 () Unit!8944)

(assert (=> b!144108 (= lt!223530 Unit!8982)))

(declare-fun call!1874 () (_ BitVec 64))

(assert (=> b!144108 (= (bvadd (bitIndex!0 (size!2972 (buf!3401 (_2!6755 lt!223557))) (currentByte!6285 (_2!6755 lt!223557)) (currentBit!6280 (_2!6755 lt!223557))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1874)))

(declare-fun lt!223535 () Unit!8944)

(declare-fun Unit!8983 () Unit!8944)

(assert (=> b!144108 (= lt!223535 Unit!8983)))

(assert (=> b!144108 (= (bvadd (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222494))) (currentByte!6285 (_1!6747 lt!222494)) (currentBit!6280 (_1!6747 lt!222494))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1874)))

(declare-fun lt!223536 () Unit!8944)

(declare-fun Unit!8984 () Unit!8944)

(assert (=> b!144108 (= lt!223536 Unit!8984)))

(assert (=> b!144108 (and (= (buf!3401 (_1!6747 lt!222494)) (buf!3401 (_2!6757 lt!223527))) (= (size!2972 arr!237) (size!2972 (_3!342 lt!223527))))))

(declare-fun lt!223558 () Unit!8944)

(declare-fun Unit!8985 () Unit!8944)

(assert (=> b!144108 (= lt!223558 Unit!8985)))

(declare-fun lt!223547 () Unit!8944)

(assert (=> b!144108 (= lt!223547 (arrayUpdatedAtPrefixLemma!8 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6755 lt!223557)))))

(assert (=> b!144108 (arrayRangesEq!288 arr!237 (array!6566 (store (arr!3695 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6755 lt!223557)) (size!2972 arr!237)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!223540 () Unit!8944)

(assert (=> b!144108 (= lt!223540 lt!223547)))

(declare-fun lt!223544 () (_ BitVec 32))

(assert (=> b!144108 (= lt!223544 #b00000000000000000000000000000000)))

(declare-fun lt!223526 () Unit!8944)

(assert (=> b!144108 (= lt!223526 (arrayRangesEqTransitive!48 arr!237 lt!223538 (_3!342 lt!223527) lt!223544 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(declare-fun call!1872 () Bool)

(assert (=> b!144108 call!1872))

(declare-fun lt!223529 () Unit!8944)

(assert (=> b!144108 (= lt!223529 lt!223526)))

(declare-fun call!1873 () Bool)

(assert (=> b!144108 call!1873))

(declare-fun lt!223537 () Unit!8944)

(declare-fun Unit!8986 () Unit!8944)

(assert (=> b!144108 (= lt!223537 Unit!8986)))

(declare-fun lt!223539 () Unit!8944)

(assert (=> b!144108 (= lt!223539 (arrayRangesEqImpliesEq!8 lt!223538 (_3!342 lt!223527) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!144108 (= (select (store (arr!3695 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6755 lt!223557)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3695 (_3!342 lt!223527)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!223554 () Unit!8944)

(assert (=> b!144108 (= lt!223554 lt!223539)))

(declare-fun lt!223550 () Bool)

(assert (=> b!144108 (= lt!223550 (= (select (arr!3695 (_3!342 lt!223527)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6755 lt!223557)))))

(declare-fun Unit!8987 () Unit!8944)

(assert (=> b!144108 (= lt!223541 Unit!8987)))

(assert (=> b!144108 lt!223550))

(declare-fun b!144109 () Bool)

(declare-fun res!120391 () Bool)

(assert (=> b!144109 (=> (not res!120391) (not e!95993))))

(assert (=> b!144109 (= res!120391 (and (= (buf!3401 (_1!6747 lt!222494)) (buf!3401 (_2!6757 lt!223555))) (= (size!2972 arr!237) (size!2972 (_3!342 lt!223555)))))))

(declare-fun d!46219 () Bool)

(declare-fun e!95995 () Bool)

(assert (=> d!46219 e!95995))

(declare-fun res!120393 () Bool)

(assert (=> d!46219 (=> res!120393 e!95995)))

(assert (=> d!46219 (= res!120393 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!223545 () Bool)

(assert (=> d!46219 (= lt!223545 e!95993)))

(declare-fun res!120392 () Bool)

(assert (=> d!46219 (=> (not res!120392) (not e!95993))))

(declare-fun lt!223532 () (_ BitVec 64))

(declare-fun lt!223559 () (_ BitVec 64))

(assert (=> d!46219 (= res!120392 (= (bvadd lt!223532 lt!223559) (bitIndex!0 (size!2972 (buf!3401 (_2!6757 lt!223555))) (currentByte!6285 (_2!6757 lt!223555)) (currentBit!6280 (_2!6757 lt!223555)))))))

(assert (=> d!46219 (or (not (= (bvand lt!223532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!223559 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!223532 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!223532 lt!223559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!223533 () (_ BitVec 64))

(assert (=> d!46219 (= lt!223559 (bvmul lt!223533 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!46219 (or (= lt!223533 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!223533 #b0000000000000000000000000000000000000000000000000000000000001000) lt!223533)))))

(assert (=> d!46219 (= lt!223533 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!46219 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!46219 (= lt!223532 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!222494))) (currentByte!6285 (_1!6747 lt!222494)) (currentBit!6280 (_1!6747 lt!222494))))))

(assert (=> d!46219 (= lt!223555 e!95994)))

(declare-fun c!7871 () Bool)

(assert (=> d!46219 (= c!7871 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!46219 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2972 arr!237)))))

(assert (=> d!46219 (= (readByteArrayLoop!0 (_1!6747 lt!222494) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!223555)))

(declare-fun bm!1869 () Bool)

(declare-fun lt!223534 () array!6565)

(declare-fun lt!223549 () (_ BitVec 32))

(declare-fun lt!223556 () array!6565)

(declare-fun lt!223553 () (_ BitVec 32))

(assert (=> bm!1869 (= call!1872 (arrayRangesEq!288 (ite c!7871 arr!237 lt!223534) (ite c!7871 (_3!342 lt!223527) lt!223556) (ite c!7871 lt!223544 lt!223553) (ite c!7871 (bvadd #b00000000000000000000000000000001 from!447) lt!223549)))))

(declare-fun b!144110 () Bool)

(assert (=> b!144110 (= e!95995 (= (select (arr!3695 (_3!342 lt!223555)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6746 (readBytePure!0 (_1!6747 lt!222494)))))))

(assert (=> b!144110 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2972 (_3!342 lt!223555))))))

(declare-fun bm!1870 () Bool)

(assert (=> bm!1870 (= call!1873 (arrayRangesEq!288 arr!237 (ite c!7871 (_3!342 lt!223527) arr!237) #b00000000000000000000000000000000 (ite c!7871 (bvadd #b00000000000000000000000000000001 from!447) (size!2972 arr!237))))))

(declare-fun bm!1871 () Bool)

(assert (=> bm!1871 (= call!1874 (bitIndex!0 (ite c!7871 (size!2972 (buf!3401 (_2!6757 lt!223527))) (size!2972 (buf!3401 (_1!6747 lt!222494)))) (ite c!7871 (currentByte!6285 (_2!6757 lt!223527)) (currentByte!6285 (_1!6747 lt!222494))) (ite c!7871 (currentBit!6280 (_2!6757 lt!223527)) (currentBit!6280 (_1!6747 lt!222494)))))))

(declare-fun lt!223552 () Unit!8944)

(declare-fun b!144111 () Bool)

(assert (=> b!144111 (= e!95994 (tuple3!555 lt!223552 (_1!6747 lt!222494) arr!237))))

(assert (=> b!144111 (= call!1874 call!1874)))

(declare-fun lt!223542 () Unit!8944)

(declare-fun Unit!8988 () Unit!8944)

(assert (=> b!144111 (= lt!223542 Unit!8988)))

(declare-fun lt!223528 () Unit!8944)

(assert (=> b!144111 (= lt!223528 (arrayRangesEqReflexiveLemma!8 arr!237))))

(assert (=> b!144111 call!1873))

(declare-fun lt!223548 () Unit!8944)

(assert (=> b!144111 (= lt!223548 lt!223528)))

(assert (=> b!144111 (= lt!223534 arr!237)))

(assert (=> b!144111 (= lt!223556 arr!237)))

(declare-fun lt!223531 () (_ BitVec 32))

(assert (=> b!144111 (= lt!223531 #b00000000000000000000000000000000)))

(declare-fun lt!223525 () (_ BitVec 32))

(assert (=> b!144111 (= lt!223525 (size!2972 arr!237))))

(assert (=> b!144111 (= lt!223553 #b00000000000000000000000000000000)))

(assert (=> b!144111 (= lt!223549 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!144111 (= lt!223552 (arrayRangesEqSlicedLemma!8 lt!223534 lt!223556 lt!223531 lt!223525 lt!223553 lt!223549))))

(assert (=> b!144111 call!1872))

(assert (= (and d!46219 c!7871) b!144108))

(assert (= (and d!46219 (not c!7871)) b!144111))

(assert (= (or b!144108 b!144111) bm!1870))

(assert (= (or b!144108 b!144111) bm!1869))

(assert (= (or b!144108 b!144111) bm!1871))

(assert (= (and d!46219 res!120392) b!144109))

(assert (= (and b!144109 res!120391) b!144107))

(assert (= (and d!46219 (not res!120393)) b!144110))

(assert (=> b!144111 m!221411))

(declare-fun m!221515 () Bool)

(assert (=> b!144111 m!221515))

(declare-fun m!221517 () Bool)

(assert (=> d!46219 m!221517))

(declare-fun m!221519 () Bool)

(assert (=> d!46219 m!221519))

(declare-fun m!221521 () Bool)

(assert (=> bm!1869 m!221521))

(declare-fun m!221523 () Bool)

(assert (=> b!144108 m!221523))

(declare-fun m!221525 () Bool)

(assert (=> b!144108 m!221525))

(assert (=> b!144108 m!221519))

(declare-fun m!221527 () Bool)

(assert (=> b!144108 m!221527))

(declare-fun m!221529 () Bool)

(assert (=> b!144108 m!221529))

(declare-fun m!221531 () Bool)

(assert (=> b!144108 m!221531))

(declare-fun m!221533 () Bool)

(assert (=> b!144108 m!221533))

(declare-fun m!221535 () Bool)

(assert (=> b!144108 m!221535))

(declare-fun m!221537 () Bool)

(assert (=> b!144108 m!221537))

(declare-fun m!221539 () Bool)

(assert (=> b!144108 m!221539))

(declare-fun m!221541 () Bool)

(assert (=> b!144108 m!221541))

(declare-fun m!221543 () Bool)

(assert (=> b!144108 m!221543))

(declare-fun m!221545 () Bool)

(assert (=> b!144108 m!221545))

(declare-fun m!221547 () Bool)

(assert (=> bm!1870 m!221547))

(declare-fun m!221549 () Bool)

(assert (=> b!144110 m!221549))

(declare-fun m!221551 () Bool)

(assert (=> b!144110 m!221551))

(declare-fun m!221553 () Bool)

(assert (=> b!144107 m!221553))

(declare-fun m!221555 () Bool)

(assert (=> bm!1871 m!221555))

(assert (=> d!45965 d!46219))

(declare-fun d!46221 () Bool)

(declare-fun res!120394 () Bool)

(declare-fun e!95997 () Bool)

(assert (=> d!46221 (=> (not res!120394) (not e!95997))))

(assert (=> d!46221 (= res!120394 (= (size!2972 (buf!3401 (_1!6747 lt!223003))) (size!2972 (buf!3401 (_2!6745 lt!222486)))))))

(assert (=> d!46221 (= (isPrefixOf!0 (_1!6747 lt!223003) (_2!6745 lt!222486)) e!95997)))

(declare-fun b!144112 () Bool)

(declare-fun res!120396 () Bool)

(assert (=> b!144112 (=> (not res!120396) (not e!95997))))

(assert (=> b!144112 (= res!120396 (bvsle (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223003))) (currentByte!6285 (_1!6747 lt!223003)) (currentBit!6280 (_1!6747 lt!223003))) (bitIndex!0 (size!2972 (buf!3401 (_2!6745 lt!222486))) (currentByte!6285 (_2!6745 lt!222486)) (currentBit!6280 (_2!6745 lt!222486)))))))

(declare-fun b!144113 () Bool)

(declare-fun e!95996 () Bool)

(assert (=> b!144113 (= e!95997 e!95996)))

(declare-fun res!120395 () Bool)

(assert (=> b!144113 (=> res!120395 e!95996)))

(assert (=> b!144113 (= res!120395 (= (size!2972 (buf!3401 (_1!6747 lt!223003))) #b00000000000000000000000000000000))))

(declare-fun b!144114 () Bool)

(assert (=> b!144114 (= e!95996 (arrayBitRangesEq!0 (buf!3401 (_1!6747 lt!223003)) (buf!3401 (_2!6745 lt!222486)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2972 (buf!3401 (_1!6747 lt!223003))) (currentByte!6285 (_1!6747 lt!223003)) (currentBit!6280 (_1!6747 lt!223003)))))))

(assert (= (and d!46221 res!120394) b!144112))

(assert (= (and b!144112 res!120396) b!144113))

(assert (= (and b!144113 (not res!120395)) b!144114))

(assert (=> b!144112 m!221385))

(assert (=> b!144112 m!220503))

(assert (=> b!144114 m!221385))

(assert (=> b!144114 m!221385))

(declare-fun m!221557 () Bool)

(assert (=> b!144114 m!221557))

(assert (=> b!143816 d!46221))

(assert (=> b!143896 d!46053))

(assert (=> b!143896 d!45943))

(assert (=> d!45951 d!46051))

(check-sat (not b!144032) (not d!46161) (not b!144021) (not d!46109) (not b!143955) (not bm!1866) (not b!143925) (not b!144024) (not bm!1856) (not d!46159) (not b!144023) (not d!46127) (not b!143912) (not b!144094) (not b!144108) (not d!46103) (not b!143976) (not b!144013) (not d!46095) (not d!46203) (not b!143948) (not b!144079) (not d!46167) (not b!143913) (not b!144063) (not d!46183) (not b!144048) (not d!46207) (not d!46077) (not b!143910) (not d!46141) (not b!144092) (not b!144020) (not bm!1871) (not b!144047) (not b!143983) (not d!46133) (not b!144067) (not b!144075) (not b!144107) (not d!46081) (not b!144027) (not d!46151) (not d!46199) (not d!46069) (not b!143979) (not b!144112) (not b!144035) (not b!143960) (not d!46107) (not d!46205) (not b!144001) (not bm!1855) (not b!143916) (not b!144049) (not d!46137) (not d!46091) (not b!143918) (not b!144006) (not d!46139) (not b!143971) (not d!46211) (not d!46061) (not b!143949) (not d!46201) (not b!144064) (not b!143953) (not d!46067) (not b!144093) (not b!144030) (not b!143999) (not bm!1869) (not b!144002) (not b!144011) (not b!144106) (not bm!1857) (not b!144050) (not d!46117) (not b!144071) (not b!143968) (not d!46187) (not b!143980) (not d!46093) (not b!143954) (not b!143956) (not b!144029) (not b!144033) (not d!46135) (not d!46189) (not b!144104) (not bm!1865) (not b!143967) (not b!144096) (not d!46209) (not b!143982) (not b!144009) (not b!144052) (not d!46181) (not b!144036) (not b!144038) (not d!46219) (not b!143931) (not bm!1868) (not d!46149) (not bm!1867) (not bm!1858) (not b!144018) (not d!46105) (not b!143962) (not b!143995) (not b!143994) (not b!144077) (not b!143927) (not b!144026) (not b!144068) (not b!143974) (not b!144070) (not b!143965) (not d!46129) (not b!144007) (not b!144008) (not b!143992) (not d!46111) (not b!144111) (not d!46163) (not d!46145) (not b!144110) (not b!143946) (not bm!1870) (not b!143915) (not d!46193) (not b!144066) (not b!143924) (not d!46125) (not b!143959) (not bm!1854) (not b!143929) (not b!143973) (not b!144114) (not d!46089) (not b!143970) (not b!144014) (not b!144095) (not d!46097) (not b!143977) (not d!46177))
(check-sat)
