; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41286 () Bool)

(assert start!41286)

(declare-fun b!192662 () Bool)

(declare-fun res!160942 () Bool)

(declare-fun e!132729 () Bool)

(assert (=> b!192662 (=> res!160942 e!132729)))

(declare-datatypes ((array!9960 0))(
  ( (array!9961 (arr!5322 (Array (_ BitVec 32) (_ BitVec 8))) (size!4392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7892 0))(
  ( (BitStream!7893 (buf!4872 array!9960) (currentByte!9156 (_ BitVec 32)) (currentBit!9151 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16668 0))(
  ( (tuple2!16669 (_1!8979 BitStream!7892) (_2!8979 (_ BitVec 64))) )
))
(declare-fun lt!299424 () tuple2!16668)

(declare-datatypes ((tuple2!16670 0))(
  ( (tuple2!16671 (_1!8980 BitStream!7892) (_2!8980 BitStream!7892)) )
))
(declare-fun lt!299432 () tuple2!16670)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192662 (= res!160942 (not (= (bitIndex!0 (size!4392 (buf!4872 (_1!8979 lt!299424))) (currentByte!9156 (_1!8979 lt!299424)) (currentBit!9151 (_1!8979 lt!299424))) (bitIndex!0 (size!4392 (buf!4872 (_2!8980 lt!299432))) (currentByte!9156 (_2!8980 lt!299432)) (currentBit!9151 (_2!8980 lt!299432))))))))

(declare-fun res!160949 () Bool)

(declare-fun e!132723 () Bool)

(assert (=> start!41286 (=> (not res!160949) (not e!132723))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41286 (= res!160949 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41286 e!132723))

(assert (=> start!41286 true))

(declare-fun thiss!1204 () BitStream!7892)

(declare-fun e!132720 () Bool)

(declare-fun inv!12 (BitStream!7892) Bool)

(assert (=> start!41286 (and (inv!12 thiss!1204) e!132720)))

(declare-fun b!192663 () Bool)

(declare-fun e!132717 () Bool)

(declare-fun e!132724 () Bool)

(assert (=> b!192663 (= e!132717 e!132724)))

(declare-fun res!160937 () Bool)

(assert (=> b!192663 (=> (not res!160937) (not e!132724))))

(declare-fun lt!299430 () (_ BitVec 64))

(declare-fun lt!299416 () (_ BitVec 64))

(assert (=> b!192663 (= res!160937 (= lt!299430 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299416)))))

(declare-datatypes ((Unit!13661 0))(
  ( (Unit!13662) )
))
(declare-datatypes ((tuple2!16672 0))(
  ( (tuple2!16673 (_1!8981 Unit!13661) (_2!8981 BitStream!7892)) )
))
(declare-fun lt!299423 () tuple2!16672)

(assert (=> b!192663 (= lt!299430 (bitIndex!0 (size!4392 (buf!4872 (_2!8981 lt!299423))) (currentByte!9156 (_2!8981 lt!299423)) (currentBit!9151 (_2!8981 lt!299423))))))

(assert (=> b!192663 (= lt!299416 (bitIndex!0 (size!4392 (buf!4872 thiss!1204)) (currentByte!9156 thiss!1204) (currentBit!9151 thiss!1204)))))

(declare-fun lt!299425 () tuple2!16670)

(declare-fun e!132731 () Bool)

(declare-fun lt!299407 () (_ BitVec 64))

(declare-fun lt!299419 () (_ BitVec 64))

(declare-fun lt!299421 () tuple2!16668)

(declare-fun lt!299409 () BitStream!7892)

(declare-fun b!192664 () Bool)

(assert (=> b!192664 (= e!132731 (and (= lt!299419 (bvsub lt!299407 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8980 lt!299425) lt!299409)) (= (_2!8979 lt!299424) (_2!8979 lt!299421)))))))

(declare-fun b!192665 () Bool)

(declare-fun e!132725 () Bool)

(declare-fun e!132722 () Bool)

(assert (=> b!192665 (= e!132725 e!132722)))

(declare-fun res!160941 () Bool)

(assert (=> b!192665 (=> res!160941 e!132722)))

(declare-fun lt!299418 () (_ BitVec 64))

(assert (=> b!192665 (= res!160941 (not (= lt!299418 (bvsub (bvsub (bvadd lt!299407 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!299420 () tuple2!16672)

(assert (=> b!192665 (= lt!299418 (bitIndex!0 (size!4392 (buf!4872 (_2!8981 lt!299420))) (currentByte!9156 (_2!8981 lt!299420)) (currentBit!9151 (_2!8981 lt!299420))))))

(declare-fun isPrefixOf!0 (BitStream!7892 BitStream!7892) Bool)

(assert (=> b!192665 (isPrefixOf!0 thiss!1204 (_2!8981 lt!299420))))

(declare-fun lt!299434 () Unit!13661)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7892 BitStream!7892 BitStream!7892) Unit!13661)

(assert (=> b!192665 (= lt!299434 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8981 lt!299423) (_2!8981 lt!299420)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7892 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16672)

(assert (=> b!192665 (= lt!299420 (appendBitsLSBFirstLoopTR!0 (_2!8981 lt!299423) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!192666 () Bool)

(declare-fun e!132730 () Bool)

(assert (=> b!192666 (= e!132723 e!132730)))

(declare-fun res!160935 () Bool)

(assert (=> b!192666 (=> (not res!160935) (not e!132730))))

(declare-fun lt!299412 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!192666 (= res!160935 (validate_offset_bits!1 ((_ sign_extend 32) (size!4392 (buf!4872 thiss!1204))) ((_ sign_extend 32) (currentByte!9156 thiss!1204)) ((_ sign_extend 32) (currentBit!9151 thiss!1204)) lt!299412))))

(assert (=> b!192666 (= lt!299412 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192667 () Bool)

(declare-fun res!160932 () Bool)

(declare-fun e!132727 () Bool)

(assert (=> b!192667 (=> (not res!160932) (not e!132727))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192667 (= res!160932 (= (_2!8979 lt!299424) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun b!192668 () Bool)

(assert (=> b!192668 (= e!132727 (= (_1!8979 lt!299424) (_2!8980 lt!299432)))))

(declare-fun b!192669 () Bool)

(declare-fun e!132718 () Bool)

(assert (=> b!192669 (= e!132724 e!132718)))

(declare-fun res!160934 () Bool)

(assert (=> b!192669 (=> (not res!160934) (not e!132718))))

(declare-fun lt!299406 () Bool)

(declare-datatypes ((tuple2!16674 0))(
  ( (tuple2!16675 (_1!8982 BitStream!7892) (_2!8982 Bool)) )
))
(declare-fun lt!299411 () tuple2!16674)

(assert (=> b!192669 (= res!160934 (and (= (_2!8982 lt!299411) lt!299406) (= (_1!8982 lt!299411) (_2!8981 lt!299423))))))

(declare-fun readBitPure!0 (BitStream!7892) tuple2!16674)

(declare-fun readerFrom!0 (BitStream!7892 (_ BitVec 32) (_ BitVec 32)) BitStream!7892)

(assert (=> b!192669 (= lt!299411 (readBitPure!0 (readerFrom!0 (_2!8981 lt!299423) (currentBit!9151 thiss!1204) (currentByte!9156 thiss!1204))))))

(declare-fun b!192670 () Bool)

(declare-fun e!132726 () Bool)

(assert (=> b!192670 (= e!132722 e!132726)))

(declare-fun res!160945 () Bool)

(assert (=> b!192670 (=> res!160945 e!132726)))

(assert (=> b!192670 (= res!160945 (not (= (_1!8979 lt!299421) (_2!8980 lt!299425))))))

(declare-fun lt!299415 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16668)

(assert (=> b!192670 (= lt!299421 (readNBitsLSBFirstsLoopPure!0 (_1!8980 lt!299425) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299415))))

(declare-fun lt!299422 () (_ BitVec 64))

(assert (=> b!192670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4392 (buf!4872 (_2!8981 lt!299420)))) ((_ sign_extend 32) (currentByte!9156 (_2!8981 lt!299423))) ((_ sign_extend 32) (currentBit!9151 (_2!8981 lt!299423))) lt!299422)))

(declare-fun lt!299413 () Unit!13661)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7892 array!9960 (_ BitVec 64)) Unit!13661)

(assert (=> b!192670 (= lt!299413 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8981 lt!299423) (buf!4872 (_2!8981 lt!299420)) lt!299422))))

(assert (=> b!192670 (= lt!299422 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!299429 () tuple2!16674)

(declare-fun lt!299408 () (_ BitVec 64))

(declare-fun lt!299414 () (_ BitVec 64))

(assert (=> b!192670 (= lt!299415 (bvor lt!299414 (ite (_2!8982 lt!299429) lt!299408 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192670 (= lt!299424 (readNBitsLSBFirstsLoopPure!0 (_1!8980 lt!299432) nBits!348 i!590 lt!299414))))

(assert (=> b!192670 (validate_offset_bits!1 ((_ sign_extend 32) (size!4392 (buf!4872 (_2!8981 lt!299420)))) ((_ sign_extend 32) (currentByte!9156 thiss!1204)) ((_ sign_extend 32) (currentBit!9151 thiss!1204)) lt!299412)))

(declare-fun lt!299410 () Unit!13661)

(assert (=> b!192670 (= lt!299410 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4872 (_2!8981 lt!299420)) lt!299412))))

(assert (=> b!192670 (= lt!299414 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!192670 (= (_2!8982 lt!299429) lt!299406)))

(assert (=> b!192670 (= lt!299429 (readBitPure!0 (_1!8980 lt!299432)))))

(declare-fun reader!0 (BitStream!7892 BitStream!7892) tuple2!16670)

(assert (=> b!192670 (= lt!299425 (reader!0 (_2!8981 lt!299423) (_2!8981 lt!299420)))))

(assert (=> b!192670 (= lt!299432 (reader!0 thiss!1204 (_2!8981 lt!299420)))))

(declare-fun e!132719 () Bool)

(assert (=> b!192670 e!132719))

(declare-fun res!160933 () Bool)

(assert (=> b!192670 (=> (not res!160933) (not e!132719))))

(declare-fun lt!299433 () tuple2!16674)

(declare-fun lt!299426 () tuple2!16674)

(assert (=> b!192670 (= res!160933 (= (bitIndex!0 (size!4392 (buf!4872 (_1!8982 lt!299433))) (currentByte!9156 (_1!8982 lt!299433)) (currentBit!9151 (_1!8982 lt!299433))) (bitIndex!0 (size!4392 (buf!4872 (_1!8982 lt!299426))) (currentByte!9156 (_1!8982 lt!299426)) (currentBit!9151 (_1!8982 lt!299426)))))))

(declare-fun lt!299428 () Unit!13661)

(declare-fun lt!299417 () BitStream!7892)

(declare-fun readBitPrefixLemma!0 (BitStream!7892 BitStream!7892) Unit!13661)

(assert (=> b!192670 (= lt!299428 (readBitPrefixLemma!0 lt!299417 (_2!8981 lt!299420)))))

(assert (=> b!192670 (= lt!299426 (readBitPure!0 (BitStream!7893 (buf!4872 (_2!8981 lt!299420)) (currentByte!9156 thiss!1204) (currentBit!9151 thiss!1204))))))

(assert (=> b!192670 (= lt!299433 (readBitPure!0 lt!299417))))

(declare-fun e!132728 () Bool)

(assert (=> b!192670 e!132728))

(declare-fun res!160946 () Bool)

(assert (=> b!192670 (=> (not res!160946) (not e!132728))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192670 (= res!160946 (invariant!0 (currentBit!9151 thiss!1204) (currentByte!9156 thiss!1204) (size!4392 (buf!4872 (_2!8981 lt!299423)))))))

(assert (=> b!192670 (= lt!299417 (BitStream!7893 (buf!4872 (_2!8981 lt!299423)) (currentByte!9156 thiss!1204) (currentBit!9151 thiss!1204)))))

(declare-fun b!192671 () Bool)

(declare-fun res!160940 () Bool)

(assert (=> b!192671 (=> res!160940 e!132722)))

(assert (=> b!192671 (= res!160940 (not (isPrefixOf!0 thiss!1204 (_2!8981 lt!299423))))))

(declare-fun b!192672 () Bool)

(declare-fun res!160928 () Bool)

(assert (=> b!192672 (=> (not res!160928) (not e!132731))))

(declare-fun withMovedBitIndex!0 (BitStream!7892 (_ BitVec 64)) BitStream!7892)

(assert (=> b!192672 (= res!160928 (= (_1!8980 lt!299425) (withMovedBitIndex!0 (_2!8980 lt!299425) (bvsub lt!299407 lt!299418))))))

(declare-fun b!192673 () Bool)

(declare-fun res!160938 () Bool)

(assert (=> b!192673 (=> res!160938 e!132722)))

(assert (=> b!192673 (= res!160938 (not (isPrefixOf!0 (_2!8981 lt!299423) (_2!8981 lt!299420))))))

(declare-fun b!192674 () Bool)

(declare-fun res!160950 () Bool)

(assert (=> b!192674 (=> (not res!160950) (not e!132730))))

(assert (=> b!192674 (= res!160950 (invariant!0 (currentBit!9151 thiss!1204) (currentByte!9156 thiss!1204) (size!4392 (buf!4872 thiss!1204))))))

(declare-fun b!192675 () Bool)

(assert (=> b!192675 (= e!132719 (= (_2!8982 lt!299433) (_2!8982 lt!299426)))))

(declare-fun b!192676 () Bool)

(declare-fun array_inv!4133 (array!9960) Bool)

(assert (=> b!192676 (= e!132720 (array_inv!4133 (buf!4872 thiss!1204)))))

(declare-fun b!192677 () Bool)

(declare-fun res!160947 () Bool)

(assert (=> b!192677 (=> (not res!160947) (not e!132724))))

(assert (=> b!192677 (= res!160947 (isPrefixOf!0 thiss!1204 (_2!8981 lt!299423)))))

(declare-fun b!192678 () Bool)

(declare-fun res!160939 () Bool)

(assert (=> b!192678 (=> (not res!160939) (not e!132731))))

(assert (=> b!192678 (= res!160939 (= (_1!8980 lt!299432) (withMovedBitIndex!0 (_2!8980 lt!299432) (bvsub lt!299419 lt!299418))))))

(declare-fun b!192679 () Bool)

(assert (=> b!192679 (= e!132729 (bvsle i!590 #b00000000000000000000000001000000))))

(assert (=> b!192679 e!132727))

(declare-fun res!160927 () Bool)

(assert (=> b!192679 (=> (not res!160927) (not e!132727))))

(assert (=> b!192679 (= res!160927 (= (size!4392 (buf!4872 thiss!1204)) (size!4392 (buf!4872 (_2!8981 lt!299420)))))))

(declare-fun b!192680 () Bool)

(declare-fun res!160929 () Bool)

(assert (=> b!192680 (=> (not res!160929) (not e!132730))))

(assert (=> b!192680 (= res!160929 (not (= i!590 nBits!348)))))

(declare-fun b!192681 () Bool)

(declare-fun res!160931 () Bool)

(assert (=> b!192681 (=> res!160931 e!132722)))

(assert (=> b!192681 (= res!160931 (or (not (= (size!4392 (buf!4872 (_2!8981 lt!299420))) (size!4392 (buf!4872 thiss!1204)))) (not (= lt!299418 (bvsub (bvadd lt!299419 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192682 () Bool)

(assert (=> b!192682 (= e!132728 (invariant!0 (currentBit!9151 thiss!1204) (currentByte!9156 thiss!1204) (size!4392 (buf!4872 (_2!8981 lt!299420)))))))

(declare-fun b!192683 () Bool)

(assert (=> b!192683 (= e!132730 (not e!132725))))

(declare-fun res!160948 () Bool)

(assert (=> b!192683 (=> res!160948 e!132725)))

(assert (=> b!192683 (= res!160948 (not (= lt!299407 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!299419))))))

(assert (=> b!192683 (= lt!299407 (bitIndex!0 (size!4392 (buf!4872 (_2!8981 lt!299423))) (currentByte!9156 (_2!8981 lt!299423)) (currentBit!9151 (_2!8981 lt!299423))))))

(assert (=> b!192683 (= lt!299419 (bitIndex!0 (size!4392 (buf!4872 thiss!1204)) (currentByte!9156 thiss!1204) (currentBit!9151 thiss!1204)))))

(assert (=> b!192683 e!132717))

(declare-fun res!160936 () Bool)

(assert (=> b!192683 (=> (not res!160936) (not e!132717))))

(assert (=> b!192683 (= res!160936 (= (size!4392 (buf!4872 thiss!1204)) (size!4392 (buf!4872 (_2!8981 lt!299423)))))))

(declare-fun appendBit!0 (BitStream!7892 Bool) tuple2!16672)

(assert (=> b!192683 (= lt!299423 (appendBit!0 thiss!1204 lt!299406))))

(assert (=> b!192683 (= lt!299406 (not (= (bvand v!189 lt!299408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192683 (= lt!299408 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192684 () Bool)

(assert (=> b!192684 (= e!132718 (= (bitIndex!0 (size!4392 (buf!4872 (_1!8982 lt!299411))) (currentByte!9156 (_1!8982 lt!299411)) (currentBit!9151 (_1!8982 lt!299411))) lt!299430))))

(declare-fun b!192685 () Bool)

(assert (=> b!192685 (= e!132726 e!132729)))

(declare-fun res!160930 () Bool)

(assert (=> b!192685 (=> res!160930 e!132729)))

(assert (=> b!192685 (= res!160930 (not (= (_1!8980 lt!299425) lt!299409)))))

(assert (=> b!192685 e!132731))

(declare-fun res!160943 () Bool)

(assert (=> b!192685 (=> (not res!160943) (not e!132731))))

(declare-fun lt!299427 () tuple2!16668)

(assert (=> b!192685 (= res!160943 (and (= (_2!8979 lt!299424) (_2!8979 lt!299427)) (= (_1!8979 lt!299424) (_1!8979 lt!299427))))))

(declare-fun lt!299431 () Unit!13661)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13661)

(assert (=> b!192685 (= lt!299431 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8980 lt!299432) nBits!348 i!590 lt!299414))))

(assert (=> b!192685 (= lt!299427 (readNBitsLSBFirstsLoopPure!0 lt!299409 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!299415))))

(assert (=> b!192685 (= lt!299409 (withMovedBitIndex!0 (_1!8980 lt!299432) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192686 () Bool)

(declare-fun res!160944 () Bool)

(assert (=> b!192686 (=> res!160944 e!132722)))

(assert (=> b!192686 (= res!160944 (not (invariant!0 (currentBit!9151 (_2!8981 lt!299420)) (currentByte!9156 (_2!8981 lt!299420)) (size!4392 (buf!4872 (_2!8981 lt!299420))))))))

(assert (= (and start!41286 res!160949) b!192666))

(assert (= (and b!192666 res!160935) b!192674))

(assert (= (and b!192674 res!160950) b!192680))

(assert (= (and b!192680 res!160929) b!192683))

(assert (= (and b!192683 res!160936) b!192663))

(assert (= (and b!192663 res!160937) b!192677))

(assert (= (and b!192677 res!160947) b!192669))

(assert (= (and b!192669 res!160934) b!192684))

(assert (= (and b!192683 (not res!160948)) b!192665))

(assert (= (and b!192665 (not res!160941)) b!192686))

(assert (= (and b!192686 (not res!160944)) b!192681))

(assert (= (and b!192681 (not res!160931)) b!192673))

(assert (= (and b!192673 (not res!160938)) b!192671))

(assert (= (and b!192671 (not res!160940)) b!192670))

(assert (= (and b!192670 res!160946) b!192682))

(assert (= (and b!192670 res!160933) b!192675))

(assert (= (and b!192670 (not res!160945)) b!192685))

(assert (= (and b!192685 res!160943) b!192678))

(assert (= (and b!192678 res!160939) b!192672))

(assert (= (and b!192672 res!160928) b!192664))

(assert (= (and b!192685 (not res!160930)) b!192662))

(assert (= (and b!192662 (not res!160942)) b!192679))

(assert (= (and b!192679 res!160927) b!192667))

(assert (= (and b!192667 res!160932) b!192668))

(assert (= start!41286 b!192676))

(declare-fun m!298859 () Bool)

(assert (=> b!192676 m!298859))

(declare-fun m!298861 () Bool)

(assert (=> b!192685 m!298861))

(declare-fun m!298863 () Bool)

(assert (=> b!192685 m!298863))

(declare-fun m!298865 () Bool)

(assert (=> b!192685 m!298865))

(declare-fun m!298867 () Bool)

(assert (=> b!192671 m!298867))

(declare-fun m!298869 () Bool)

(assert (=> b!192666 m!298869))

(declare-fun m!298871 () Bool)

(assert (=> b!192670 m!298871))

(declare-fun m!298873 () Bool)

(assert (=> b!192670 m!298873))

(declare-fun m!298875 () Bool)

(assert (=> b!192670 m!298875))

(declare-fun m!298877 () Bool)

(assert (=> b!192670 m!298877))

(declare-fun m!298879 () Bool)

(assert (=> b!192670 m!298879))

(declare-fun m!298881 () Bool)

(assert (=> b!192670 m!298881))

(declare-fun m!298883 () Bool)

(assert (=> b!192670 m!298883))

(declare-fun m!298885 () Bool)

(assert (=> b!192670 m!298885))

(declare-fun m!298887 () Bool)

(assert (=> b!192670 m!298887))

(declare-fun m!298889 () Bool)

(assert (=> b!192670 m!298889))

(declare-fun m!298891 () Bool)

(assert (=> b!192670 m!298891))

(declare-fun m!298893 () Bool)

(assert (=> b!192670 m!298893))

(declare-fun m!298895 () Bool)

(assert (=> b!192670 m!298895))

(declare-fun m!298897 () Bool)

(assert (=> b!192670 m!298897))

(declare-fun m!298899 () Bool)

(assert (=> b!192670 m!298899))

(declare-fun m!298901 () Bool)

(assert (=> b!192670 m!298901))

(declare-fun m!298903 () Bool)

(assert (=> b!192682 m!298903))

(declare-fun m!298905 () Bool)

(assert (=> b!192678 m!298905))

(declare-fun m!298907 () Bool)

(assert (=> b!192672 m!298907))

(assert (=> b!192677 m!298867))

(declare-fun m!298909 () Bool)

(assert (=> b!192674 m!298909))

(declare-fun m!298911 () Bool)

(assert (=> b!192683 m!298911))

(declare-fun m!298913 () Bool)

(assert (=> b!192683 m!298913))

(declare-fun m!298915 () Bool)

(assert (=> b!192683 m!298915))

(declare-fun m!298917 () Bool)

(assert (=> b!192669 m!298917))

(assert (=> b!192669 m!298917))

(declare-fun m!298919 () Bool)

(assert (=> b!192669 m!298919))

(declare-fun m!298921 () Bool)

(assert (=> b!192686 m!298921))

(assert (=> b!192663 m!298911))

(assert (=> b!192663 m!298913))

(declare-fun m!298923 () Bool)

(assert (=> start!41286 m!298923))

(declare-fun m!298925 () Bool)

(assert (=> b!192684 m!298925))

(declare-fun m!298927 () Bool)

(assert (=> b!192667 m!298927))

(declare-fun m!298929 () Bool)

(assert (=> b!192673 m!298929))

(declare-fun m!298931 () Bool)

(assert (=> b!192665 m!298931))

(declare-fun m!298933 () Bool)

(assert (=> b!192665 m!298933))

(declare-fun m!298935 () Bool)

(assert (=> b!192665 m!298935))

(declare-fun m!298937 () Bool)

(assert (=> b!192665 m!298937))

(declare-fun m!298939 () Bool)

(assert (=> b!192662 m!298939))

(declare-fun m!298941 () Bool)

(assert (=> b!192662 m!298941))

(push 1)

(assert (not b!192677))

(assert (not b!192669))

(assert (not b!192670))

(assert (not b!192667))

(assert (not b!192673))

(assert (not b!192678))

(assert (not b!192676))

(assert (not b!192685))

(assert (not b!192682))

(assert (not b!192683))

(assert (not b!192671))

(assert (not b!192684))

(assert (not b!192672))

(assert (not b!192665))

(assert (not b!192666))

(assert (not b!192674))

(assert (not start!41286))

(assert (not b!192663))

(assert (not b!192686))

(assert (not b!192662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

