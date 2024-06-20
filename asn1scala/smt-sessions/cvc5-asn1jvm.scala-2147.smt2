; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54648 () Bool)

(assert start!54648)

(declare-fun b!255933 () Bool)

(declare-fun e!177314 () Bool)

(declare-datatypes ((array!13795 0))(
  ( (array!13796 (arr!7039 (Array (_ BitVec 32) (_ BitVec 8))) (size!6052 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11026 0))(
  ( (BitStream!11027 (buf!6569 array!13795) (currentByte!12048 (_ BitVec 32)) (currentBit!12043 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21900 0))(
  ( (tuple2!21901 (_1!11884 BitStream!11026) (_2!11884 Bool)) )
))
(declare-fun lt!397434 () tuple2!21900)

(declare-fun lt!397423 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255933 (= e!177314 (= (bitIndex!0 (size!6052 (buf!6569 (_1!11884 lt!397434))) (currentByte!12048 (_1!11884 lt!397434)) (currentBit!12043 (_1!11884 lt!397434))) lt!397423))))

(declare-fun b!255934 () Bool)

(declare-fun e!177304 () Bool)

(declare-fun e!177311 () Bool)

(assert (=> b!255934 (= e!177304 (not e!177311))))

(declare-fun res!214571 () Bool)

(assert (=> b!255934 (=> res!214571 e!177311)))

(declare-fun lt!397430 () tuple2!21900)

(declare-datatypes ((tuple2!21902 0))(
  ( (tuple2!21903 (_1!11885 BitStream!11026) (_2!11885 BitStream!11026)) )
))
(declare-fun lt!397443 () tuple2!21902)

(assert (=> b!255934 (= res!214571 (not (= (_1!11884 lt!397430) (_2!11885 lt!397443))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!11026 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21900)

(assert (=> b!255934 (= lt!397430 (checkBitsLoopPure!0 (_1!11885 lt!397443) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18312 0))(
  ( (Unit!18313) )
))
(declare-datatypes ((tuple2!21904 0))(
  ( (tuple2!21905 (_1!11886 Unit!18312) (_2!11886 BitStream!11026)) )
))
(declare-fun lt!397431 () tuple2!21904)

(declare-fun lt!397435 () tuple2!21904)

(declare-fun lt!397427 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255934 (validate_offset_bits!1 ((_ sign_extend 32) (size!6052 (buf!6569 (_2!11886 lt!397431)))) ((_ sign_extend 32) (currentByte!12048 (_2!11886 lt!397435))) ((_ sign_extend 32) (currentBit!12043 (_2!11886 lt!397435))) lt!397427)))

(declare-fun lt!397437 () Unit!18312)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11026 array!13795 (_ BitVec 64)) Unit!18312)

(assert (=> b!255934 (= lt!397437 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11886 lt!397435) (buf!6569 (_2!11886 lt!397431)) lt!397427))))

(declare-fun lt!397439 () tuple2!21900)

(declare-fun lt!397438 () tuple2!21902)

(assert (=> b!255934 (= lt!397439 (checkBitsLoopPure!0 (_1!11885 lt!397438) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!11026)

(assert (=> b!255934 (validate_offset_bits!1 ((_ sign_extend 32) (size!6052 (buf!6569 (_2!11886 lt!397431)))) ((_ sign_extend 32) (currentByte!12048 thiss!1005)) ((_ sign_extend 32) (currentBit!12043 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397433 () Unit!18312)

(assert (=> b!255934 (= lt!397433 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6569 (_2!11886 lt!397431)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!11026) tuple2!21900)

(assert (=> b!255934 (= (_2!11884 (readBitPure!0 (_1!11885 lt!397438))) bit!26)))

(declare-fun reader!0 (BitStream!11026 BitStream!11026) tuple2!21902)

(assert (=> b!255934 (= lt!397443 (reader!0 (_2!11886 lt!397435) (_2!11886 lt!397431)))))

(assert (=> b!255934 (= lt!397438 (reader!0 thiss!1005 (_2!11886 lt!397431)))))

(declare-fun e!177313 () Bool)

(assert (=> b!255934 e!177313))

(declare-fun res!214568 () Bool)

(assert (=> b!255934 (=> (not res!214568) (not e!177313))))

(declare-fun lt!397428 () tuple2!21900)

(declare-fun lt!397432 () tuple2!21900)

(assert (=> b!255934 (= res!214568 (= (bitIndex!0 (size!6052 (buf!6569 (_1!11884 lt!397428))) (currentByte!12048 (_1!11884 lt!397428)) (currentBit!12043 (_1!11884 lt!397428))) (bitIndex!0 (size!6052 (buf!6569 (_1!11884 lt!397432))) (currentByte!12048 (_1!11884 lt!397432)) (currentBit!12043 (_1!11884 lt!397432)))))))

(declare-fun lt!397442 () Unit!18312)

(declare-fun lt!397426 () BitStream!11026)

(declare-fun readBitPrefixLemma!0 (BitStream!11026 BitStream!11026) Unit!18312)

(assert (=> b!255934 (= lt!397442 (readBitPrefixLemma!0 lt!397426 (_2!11886 lt!397431)))))

(assert (=> b!255934 (= lt!397432 (readBitPure!0 (BitStream!11027 (buf!6569 (_2!11886 lt!397431)) (currentByte!12048 thiss!1005) (currentBit!12043 thiss!1005))))))

(assert (=> b!255934 (= lt!397428 (readBitPure!0 lt!397426))))

(assert (=> b!255934 (= lt!397426 (BitStream!11027 (buf!6569 (_2!11886 lt!397435)) (currentByte!12048 thiss!1005) (currentBit!12043 thiss!1005)))))

(declare-fun e!177310 () Bool)

(assert (=> b!255934 e!177310))

(declare-fun res!214574 () Bool)

(assert (=> b!255934 (=> (not res!214574) (not e!177310))))

(declare-fun isPrefixOf!0 (BitStream!11026 BitStream!11026) Bool)

(assert (=> b!255934 (= res!214574 (isPrefixOf!0 thiss!1005 (_2!11886 lt!397431)))))

(declare-fun lt!397425 () Unit!18312)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11026 BitStream!11026 BitStream!11026) Unit!18312)

(assert (=> b!255934 (= lt!397425 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11886 lt!397435) (_2!11886 lt!397431)))))

(declare-fun e!177308 () Bool)

(assert (=> b!255934 e!177308))

(declare-fun res!214577 () Bool)

(assert (=> b!255934 (=> (not res!214577) (not e!177308))))

(assert (=> b!255934 (= res!214577 (= (size!6052 (buf!6569 (_2!11886 lt!397435))) (size!6052 (buf!6569 (_2!11886 lt!397431)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11026 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21904)

(assert (=> b!255934 (= lt!397431 (appendNBitsLoop!0 (_2!11886 lt!397435) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255934 (validate_offset_bits!1 ((_ sign_extend 32) (size!6052 (buf!6569 (_2!11886 lt!397435)))) ((_ sign_extend 32) (currentByte!12048 (_2!11886 lt!397435))) ((_ sign_extend 32) (currentBit!12043 (_2!11886 lt!397435))) lt!397427)))

(assert (=> b!255934 (= lt!397427 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397422 () Unit!18312)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11026 BitStream!11026 (_ BitVec 64) (_ BitVec 64)) Unit!18312)

(assert (=> b!255934 (= lt!397422 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11886 lt!397435) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!177303 () Bool)

(assert (=> b!255934 e!177303))

(declare-fun res!214564 () Bool)

(assert (=> b!255934 (=> (not res!214564) (not e!177303))))

(assert (=> b!255934 (= res!214564 (= (size!6052 (buf!6569 thiss!1005)) (size!6052 (buf!6569 (_2!11886 lt!397435)))))))

(declare-fun appendBit!0 (BitStream!11026 Bool) tuple2!21904)

(assert (=> b!255934 (= lt!397435 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255935 () Bool)

(declare-fun e!177307 () Bool)

(declare-fun array_inv!5793 (array!13795) Bool)

(assert (=> b!255935 (= e!177307 (array_inv!5793 (buf!6569 thiss!1005)))))

(declare-fun b!255936 () Bool)

(declare-fun res!214572 () Bool)

(assert (=> b!255936 (=> (not res!214572) (not e!177310))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255936 (= res!214572 (invariant!0 (currentBit!12043 thiss!1005) (currentByte!12048 thiss!1005) (size!6052 (buf!6569 (_2!11886 lt!397435)))))))

(declare-fun b!255937 () Bool)

(declare-fun e!177305 () Bool)

(assert (=> b!255937 (= e!177305 (_2!11884 lt!397439))))

(declare-fun b!255938 () Bool)

(declare-fun e!177306 () Bool)

(declare-fun lt!397440 () tuple2!21900)

(declare-fun lt!397429 () tuple2!21902)

(assert (=> b!255938 (= e!177306 (not (or (not (_2!11884 lt!397440)) (not (= (_1!11884 lt!397440) (_2!11885 lt!397429))))))))

(assert (=> b!255938 (= lt!397440 (checkBitsLoopPure!0 (_1!11885 lt!397429) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397441 () (_ BitVec 64))

(assert (=> b!255938 (validate_offset_bits!1 ((_ sign_extend 32) (size!6052 (buf!6569 (_2!11886 lt!397431)))) ((_ sign_extend 32) (currentByte!12048 (_2!11886 lt!397435))) ((_ sign_extend 32) (currentBit!12043 (_2!11886 lt!397435))) lt!397441)))

(declare-fun lt!397436 () Unit!18312)

(assert (=> b!255938 (= lt!397436 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11886 lt!397435) (buf!6569 (_2!11886 lt!397431)) lt!397441))))

(assert (=> b!255938 (= lt!397429 (reader!0 (_2!11886 lt!397435) (_2!11886 lt!397431)))))

(declare-fun b!255939 () Bool)

(declare-fun res!214573 () Bool)

(assert (=> b!255939 (=> (not res!214573) (not e!177304))))

(assert (=> b!255939 (= res!214573 (bvslt from!289 nBits!297))))

(declare-fun b!255940 () Bool)

(declare-fun res!214578 () Bool)

(assert (=> b!255940 (=> res!214578 e!177311)))

(declare-fun withMovedBitIndex!0 (BitStream!11026 (_ BitVec 64)) BitStream!11026)

(assert (=> b!255940 (= res!214578 (not (= (_1!11885 lt!397443) (withMovedBitIndex!0 (_1!11885 lt!397438) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255941 () Bool)

(declare-fun res!214565 () Bool)

(assert (=> b!255941 (=> (not res!214565) (not e!177305))))

(assert (=> b!255941 (= res!214565 (= (bitIndex!0 (size!6052 (buf!6569 (_2!11886 lt!397431))) (currentByte!12048 (_2!11886 lt!397431)) (currentBit!12043 (_2!11886 lt!397431))) (bvadd (bitIndex!0 (size!6052 (buf!6569 thiss!1005)) (currentByte!12048 thiss!1005) (currentBit!12043 thiss!1005)) (bvsub nBits!297 from!289))))))

(declare-fun b!255942 () Bool)

(assert (=> b!255942 (= e!177313 (= (_2!11884 lt!397428) (_2!11884 lt!397432)))))

(declare-fun b!255943 () Bool)

(declare-fun res!214566 () Bool)

(declare-fun e!177309 () Bool)

(assert (=> b!255943 (=> (not res!214566) (not e!177309))))

(assert (=> b!255943 (= res!214566 (isPrefixOf!0 thiss!1005 (_2!11886 lt!397435)))))

(declare-fun b!255944 () Bool)

(assert (=> b!255944 (= e!177311 e!177305)))

(declare-fun res!214570 () Bool)

(assert (=> b!255944 (=> (not res!214570) (not e!177305))))

(assert (=> b!255944 (= res!214570 (= (size!6052 (buf!6569 thiss!1005)) (size!6052 (buf!6569 (_2!11886 lt!397431)))))))

(assert (=> b!255944 (and (= (_2!11884 lt!397439) (_2!11884 lt!397430)) (= (_1!11884 lt!397439) (_2!11885 lt!397438)))))

(declare-fun b!255945 () Bool)

(assert (=> b!255945 (= e!177310 (invariant!0 (currentBit!12043 thiss!1005) (currentByte!12048 thiss!1005) (size!6052 (buf!6569 (_2!11886 lt!397431)))))))

(declare-fun b!255946 () Bool)

(assert (=> b!255946 (= e!177303 e!177309)))

(declare-fun res!214576 () Bool)

(assert (=> b!255946 (=> (not res!214576) (not e!177309))))

(declare-fun lt!397424 () (_ BitVec 64))

(assert (=> b!255946 (= res!214576 (= lt!397423 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397424)))))

(assert (=> b!255946 (= lt!397423 (bitIndex!0 (size!6052 (buf!6569 (_2!11886 lt!397435))) (currentByte!12048 (_2!11886 lt!397435)) (currentBit!12043 (_2!11886 lt!397435))))))

(assert (=> b!255946 (= lt!397424 (bitIndex!0 (size!6052 (buf!6569 thiss!1005)) (currentByte!12048 thiss!1005) (currentBit!12043 thiss!1005)))))

(declare-fun b!255947 () Bool)

(assert (=> b!255947 (= e!177308 e!177306)))

(declare-fun res!214575 () Bool)

(assert (=> b!255947 (=> (not res!214575) (not e!177306))))

(assert (=> b!255947 (= res!214575 (= (bitIndex!0 (size!6052 (buf!6569 (_2!11886 lt!397431))) (currentByte!12048 (_2!11886 lt!397431)) (currentBit!12043 (_2!11886 lt!397431))) (bvadd (bitIndex!0 (size!6052 (buf!6569 (_2!11886 lt!397435))) (currentByte!12048 (_2!11886 lt!397435)) (currentBit!12043 (_2!11886 lt!397435))) lt!397441)))))

(assert (=> b!255947 (= lt!397441 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!214567 () Bool)

(assert (=> start!54648 (=> (not res!214567) (not e!177304))))

(assert (=> start!54648 (= res!214567 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54648 e!177304))

(assert (=> start!54648 true))

(declare-fun inv!12 (BitStream!11026) Bool)

(assert (=> start!54648 (and (inv!12 thiss!1005) e!177307)))

(declare-fun b!255948 () Bool)

(declare-fun res!214563 () Bool)

(assert (=> b!255948 (=> (not res!214563) (not e!177306))))

(assert (=> b!255948 (= res!214563 (isPrefixOf!0 (_2!11886 lt!397435) (_2!11886 lt!397431)))))

(declare-fun b!255949 () Bool)

(declare-fun res!214569 () Bool)

(assert (=> b!255949 (=> (not res!214569) (not e!177304))))

(assert (=> b!255949 (= res!214569 (validate_offset_bits!1 ((_ sign_extend 32) (size!6052 (buf!6569 thiss!1005))) ((_ sign_extend 32) (currentByte!12048 thiss!1005)) ((_ sign_extend 32) (currentBit!12043 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255950 () Bool)

(assert (=> b!255950 (= e!177309 e!177314)))

(declare-fun res!214562 () Bool)

(assert (=> b!255950 (=> (not res!214562) (not e!177314))))

(assert (=> b!255950 (= res!214562 (and (= (_2!11884 lt!397434) bit!26) (= (_1!11884 lt!397434) (_2!11886 lt!397435))))))

(declare-fun readerFrom!0 (BitStream!11026 (_ BitVec 32) (_ BitVec 32)) BitStream!11026)

(assert (=> b!255950 (= lt!397434 (readBitPure!0 (readerFrom!0 (_2!11886 lt!397435) (currentBit!12043 thiss!1005) (currentByte!12048 thiss!1005))))))

(assert (= (and start!54648 res!214567) b!255949))

(assert (= (and b!255949 res!214569) b!255939))

(assert (= (and b!255939 res!214573) b!255934))

(assert (= (and b!255934 res!214564) b!255946))

(assert (= (and b!255946 res!214576) b!255943))

(assert (= (and b!255943 res!214566) b!255950))

(assert (= (and b!255950 res!214562) b!255933))

(assert (= (and b!255934 res!214577) b!255947))

(assert (= (and b!255947 res!214575) b!255948))

(assert (= (and b!255948 res!214563) b!255938))

(assert (= (and b!255934 res!214574) b!255936))

(assert (= (and b!255936 res!214572) b!255945))

(assert (= (and b!255934 res!214568) b!255942))

(assert (= (and b!255934 (not res!214571)) b!255940))

(assert (= (and b!255940 (not res!214578)) b!255944))

(assert (= (and b!255944 res!214570) b!255941))

(assert (= (and b!255941 res!214565) b!255937))

(assert (= start!54648 b!255935))

(declare-fun m!385503 () Bool)

(assert (=> b!255946 m!385503))

(declare-fun m!385505 () Bool)

(assert (=> b!255946 m!385505))

(declare-fun m!385507 () Bool)

(assert (=> b!255947 m!385507))

(assert (=> b!255947 m!385503))

(assert (=> b!255941 m!385507))

(assert (=> b!255941 m!385505))

(declare-fun m!385509 () Bool)

(assert (=> b!255950 m!385509))

(assert (=> b!255950 m!385509))

(declare-fun m!385511 () Bool)

(assert (=> b!255950 m!385511))

(declare-fun m!385513 () Bool)

(assert (=> b!255943 m!385513))

(declare-fun m!385515 () Bool)

(assert (=> start!54648 m!385515))

(declare-fun m!385517 () Bool)

(assert (=> b!255936 m!385517))

(declare-fun m!385519 () Bool)

(assert (=> b!255945 m!385519))

(declare-fun m!385521 () Bool)

(assert (=> b!255935 m!385521))

(declare-fun m!385523 () Bool)

(assert (=> b!255934 m!385523))

(declare-fun m!385525 () Bool)

(assert (=> b!255934 m!385525))

(declare-fun m!385527 () Bool)

(assert (=> b!255934 m!385527))

(declare-fun m!385529 () Bool)

(assert (=> b!255934 m!385529))

(declare-fun m!385531 () Bool)

(assert (=> b!255934 m!385531))

(declare-fun m!385533 () Bool)

(assert (=> b!255934 m!385533))

(declare-fun m!385535 () Bool)

(assert (=> b!255934 m!385535))

(declare-fun m!385537 () Bool)

(assert (=> b!255934 m!385537))

(declare-fun m!385539 () Bool)

(assert (=> b!255934 m!385539))

(declare-fun m!385541 () Bool)

(assert (=> b!255934 m!385541))

(declare-fun m!385543 () Bool)

(assert (=> b!255934 m!385543))

(declare-fun m!385545 () Bool)

(assert (=> b!255934 m!385545))

(declare-fun m!385547 () Bool)

(assert (=> b!255934 m!385547))

(declare-fun m!385549 () Bool)

(assert (=> b!255934 m!385549))

(declare-fun m!385551 () Bool)

(assert (=> b!255934 m!385551))

(declare-fun m!385553 () Bool)

(assert (=> b!255934 m!385553))

(declare-fun m!385555 () Bool)

(assert (=> b!255934 m!385555))

(declare-fun m!385557 () Bool)

(assert (=> b!255934 m!385557))

(declare-fun m!385559 () Bool)

(assert (=> b!255934 m!385559))

(declare-fun m!385561 () Bool)

(assert (=> b!255934 m!385561))

(declare-fun m!385563 () Bool)

(assert (=> b!255933 m!385563))

(declare-fun m!385565 () Bool)

(assert (=> b!255949 m!385565))

(declare-fun m!385567 () Bool)

(assert (=> b!255948 m!385567))

(declare-fun m!385569 () Bool)

(assert (=> b!255940 m!385569))

(declare-fun m!385571 () Bool)

(assert (=> b!255938 m!385571))

(declare-fun m!385573 () Bool)

(assert (=> b!255938 m!385573))

(declare-fun m!385575 () Bool)

(assert (=> b!255938 m!385575))

(assert (=> b!255938 m!385529))

(push 1)

(assert (not b!255933))

(assert (not b!255940))

(assert (not b!255943))

(assert (not b!255948))

(assert (not b!255935))

(assert (not b!255950))

(assert (not b!255936))

(assert (not b!255934))

(assert (not b!255938))

(assert (not b!255949))

(assert (not start!54648))

(assert (not b!255946))

(assert (not b!255947))

(assert (not b!255941))

(assert (not b!255945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

