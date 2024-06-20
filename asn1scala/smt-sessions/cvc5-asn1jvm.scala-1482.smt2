; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41000 () Bool)

(assert start!41000)

(declare-fun b!189595 () Bool)

(declare-fun res!158089 () Bool)

(declare-fun e!130892 () Bool)

(assert (=> b!189595 (=> (not res!158089) (not e!130892))))

(declare-datatypes ((array!9890 0))(
  ( (array!9891 (arr!5290 (Array (_ BitVec 32) (_ BitVec 8))) (size!4360 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7828 0))(
  ( (BitStream!7829 (buf!4834 array!9890) (currentByte!9106 (_ BitVec 32)) (currentBit!9101 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7828)

(declare-datatypes ((Unit!13519 0))(
  ( (Unit!13520) )
))
(declare-datatypes ((tuple2!16388 0))(
  ( (tuple2!16389 (_1!8839 Unit!13519) (_2!8839 BitStream!7828)) )
))
(declare-fun lt!294371 () tuple2!16388)

(declare-fun isPrefixOf!0 (BitStream!7828 BitStream!7828) Bool)

(assert (=> b!189595 (= res!158089 (isPrefixOf!0 thiss!1204 (_2!8839 lt!294371)))))

(declare-fun b!189596 () Bool)

(declare-fun e!130895 () Bool)

(declare-fun e!130901 () Bool)

(assert (=> b!189596 (= e!130895 e!130901)))

(declare-fun res!158081 () Bool)

(assert (=> b!189596 (=> res!158081 e!130901)))

(declare-datatypes ((tuple2!16390 0))(
  ( (tuple2!16391 (_1!8840 BitStream!7828) (_2!8840 (_ BitVec 64))) )
))
(declare-fun lt!294365 () tuple2!16390)

(declare-datatypes ((tuple2!16392 0))(
  ( (tuple2!16393 (_1!8841 BitStream!7828) (_2!8841 BitStream!7828)) )
))
(declare-fun lt!294369 () tuple2!16392)

(assert (=> b!189596 (= res!158081 (not (= (_1!8840 lt!294365) (_2!8841 lt!294369))))))

(declare-fun lt!294381 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16390)

(assert (=> b!189596 (= lt!294365 (readNBitsLSBFirstsLoopPure!0 (_1!8841 lt!294369) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294381))))

(declare-fun lt!294363 () tuple2!16388)

(declare-fun lt!294382 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189596 (validate_offset_bits!1 ((_ sign_extend 32) (size!4360 (buf!4834 (_2!8839 lt!294363)))) ((_ sign_extend 32) (currentByte!9106 (_2!8839 lt!294371))) ((_ sign_extend 32) (currentBit!9101 (_2!8839 lt!294371))) lt!294382)))

(declare-fun lt!294380 () Unit!13519)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7828 array!9890 (_ BitVec 64)) Unit!13519)

(assert (=> b!189596 (= lt!294380 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8839 lt!294371) (buf!4834 (_2!8839 lt!294363)) lt!294382))))

(assert (=> b!189596 (= lt!294382 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16394 0))(
  ( (tuple2!16395 (_1!8842 BitStream!7828) (_2!8842 Bool)) )
))
(declare-fun lt!294362 () tuple2!16394)

(declare-fun lt!294378 () (_ BitVec 64))

(declare-fun lt!294361 () (_ BitVec 64))

(assert (=> b!189596 (= lt!294381 (bvor lt!294361 (ite (_2!8842 lt!294362) lt!294378 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!294358 () tuple2!16392)

(declare-fun lt!294359 () tuple2!16390)

(assert (=> b!189596 (= lt!294359 (readNBitsLSBFirstsLoopPure!0 (_1!8841 lt!294358) nBits!348 i!590 lt!294361))))

(declare-fun lt!294375 () (_ BitVec 64))

(assert (=> b!189596 (validate_offset_bits!1 ((_ sign_extend 32) (size!4360 (buf!4834 (_2!8839 lt!294363)))) ((_ sign_extend 32) (currentByte!9106 thiss!1204)) ((_ sign_extend 32) (currentBit!9101 thiss!1204)) lt!294375)))

(declare-fun lt!294368 () Unit!13519)

(assert (=> b!189596 (= lt!294368 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4834 (_2!8839 lt!294363)) lt!294375))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189596 (= lt!294361 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!294377 () Bool)

(assert (=> b!189596 (= (_2!8842 lt!294362) lt!294377)))

(declare-fun readBitPure!0 (BitStream!7828) tuple2!16394)

(assert (=> b!189596 (= lt!294362 (readBitPure!0 (_1!8841 lt!294358)))))

(declare-fun reader!0 (BitStream!7828 BitStream!7828) tuple2!16392)

(assert (=> b!189596 (= lt!294369 (reader!0 (_2!8839 lt!294371) (_2!8839 lt!294363)))))

(assert (=> b!189596 (= lt!294358 (reader!0 thiss!1204 (_2!8839 lt!294363)))))

(declare-fun e!130900 () Bool)

(assert (=> b!189596 e!130900))

(declare-fun res!158084 () Bool)

(assert (=> b!189596 (=> (not res!158084) (not e!130900))))

(declare-fun lt!294364 () tuple2!16394)

(declare-fun lt!294376 () tuple2!16394)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189596 (= res!158084 (= (bitIndex!0 (size!4360 (buf!4834 (_1!8842 lt!294364))) (currentByte!9106 (_1!8842 lt!294364)) (currentBit!9101 (_1!8842 lt!294364))) (bitIndex!0 (size!4360 (buf!4834 (_1!8842 lt!294376))) (currentByte!9106 (_1!8842 lt!294376)) (currentBit!9101 (_1!8842 lt!294376)))))))

(declare-fun lt!294357 () Unit!13519)

(declare-fun lt!294379 () BitStream!7828)

(declare-fun readBitPrefixLemma!0 (BitStream!7828 BitStream!7828) Unit!13519)

(assert (=> b!189596 (= lt!294357 (readBitPrefixLemma!0 lt!294379 (_2!8839 lt!294363)))))

(assert (=> b!189596 (= lt!294376 (readBitPure!0 (BitStream!7829 (buf!4834 (_2!8839 lt!294363)) (currentByte!9106 thiss!1204) (currentBit!9101 thiss!1204))))))

(assert (=> b!189596 (= lt!294364 (readBitPure!0 lt!294379))))

(declare-fun e!130889 () Bool)

(assert (=> b!189596 e!130889))

(declare-fun res!158095 () Bool)

(assert (=> b!189596 (=> (not res!158095) (not e!130889))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189596 (= res!158095 (invariant!0 (currentBit!9101 thiss!1204) (currentByte!9106 thiss!1204) (size!4360 (buf!4834 (_2!8839 lt!294371)))))))

(assert (=> b!189596 (= lt!294379 (BitStream!7829 (buf!4834 (_2!8839 lt!294371)) (currentByte!9106 thiss!1204) (currentBit!9101 thiss!1204)))))

(declare-fun b!189597 () Bool)

(declare-fun res!158080 () Bool)

(assert (=> b!189597 (=> res!158080 e!130895)))

(declare-fun lt!294355 () (_ BitVec 64))

(declare-fun lt!294354 () (_ BitVec 64))

(assert (=> b!189597 (= res!158080 (or (not (= (size!4360 (buf!4834 (_2!8839 lt!294363))) (size!4360 (buf!4834 thiss!1204)))) (not (= lt!294355 (bvsub (bvadd lt!294354 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!189598 () Bool)

(declare-fun e!130890 () Bool)

(declare-fun e!130899 () Bool)

(assert (=> b!189598 (= e!130890 (not e!130899))))

(declare-fun res!158076 () Bool)

(assert (=> b!189598 (=> res!158076 e!130899)))

(declare-fun lt!294356 () (_ BitVec 64))

(assert (=> b!189598 (= res!158076 (not (= lt!294356 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294354))))))

(assert (=> b!189598 (= lt!294356 (bitIndex!0 (size!4360 (buf!4834 (_2!8839 lt!294371))) (currentByte!9106 (_2!8839 lt!294371)) (currentBit!9101 (_2!8839 lt!294371))))))

(assert (=> b!189598 (= lt!294354 (bitIndex!0 (size!4360 (buf!4834 thiss!1204)) (currentByte!9106 thiss!1204) (currentBit!9101 thiss!1204)))))

(declare-fun e!130898 () Bool)

(assert (=> b!189598 e!130898))

(declare-fun res!158077 () Bool)

(assert (=> b!189598 (=> (not res!158077) (not e!130898))))

(assert (=> b!189598 (= res!158077 (= (size!4360 (buf!4834 thiss!1204)) (size!4360 (buf!4834 (_2!8839 lt!294371)))))))

(declare-fun appendBit!0 (BitStream!7828 Bool) tuple2!16388)

(assert (=> b!189598 (= lt!294371 (appendBit!0 thiss!1204 lt!294377))))

(assert (=> b!189598 (= lt!294377 (not (= (bvand v!189 lt!294378) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189598 (= lt!294378 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189599 () Bool)

(declare-fun e!130894 () Bool)

(assert (=> b!189599 (= e!130892 e!130894)))

(declare-fun res!158086 () Bool)

(assert (=> b!189599 (=> (not res!158086) (not e!130894))))

(declare-fun lt!294370 () tuple2!16394)

(assert (=> b!189599 (= res!158086 (and (= (_2!8842 lt!294370) lt!294377) (= (_1!8842 lt!294370) (_2!8839 lt!294371))))))

(declare-fun readerFrom!0 (BitStream!7828 (_ BitVec 32) (_ BitVec 32)) BitStream!7828)

(assert (=> b!189599 (= lt!294370 (readBitPure!0 (readerFrom!0 (_2!8839 lt!294371) (currentBit!9101 thiss!1204) (currentByte!9106 thiss!1204))))))

(declare-fun b!189600 () Bool)

(declare-fun res!158078 () Bool)

(assert (=> b!189600 (=> (not res!158078) (not e!130890))))

(assert (=> b!189600 (= res!158078 (invariant!0 (currentBit!9101 thiss!1204) (currentByte!9106 thiss!1204) (size!4360 (buf!4834 thiss!1204))))))

(declare-fun res!158083 () Bool)

(declare-fun e!130896 () Bool)

(assert (=> start!41000 (=> (not res!158083) (not e!130896))))

(assert (=> start!41000 (= res!158083 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41000 e!130896))

(assert (=> start!41000 true))

(declare-fun e!130888 () Bool)

(declare-fun inv!12 (BitStream!7828) Bool)

(assert (=> start!41000 (and (inv!12 thiss!1204) e!130888)))

(declare-fun b!189601 () Bool)

(assert (=> b!189601 (= e!130898 e!130892)))

(declare-fun res!158094 () Bool)

(assert (=> b!189601 (=> (not res!158094) (not e!130892))))

(declare-fun lt!294372 () (_ BitVec 64))

(declare-fun lt!294366 () (_ BitVec 64))

(assert (=> b!189601 (= res!158094 (= lt!294372 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294366)))))

(assert (=> b!189601 (= lt!294372 (bitIndex!0 (size!4360 (buf!4834 (_2!8839 lt!294371))) (currentByte!9106 (_2!8839 lt!294371)) (currentBit!9101 (_2!8839 lt!294371))))))

(assert (=> b!189601 (= lt!294366 (bitIndex!0 (size!4360 (buf!4834 thiss!1204)) (currentByte!9106 thiss!1204) (currentBit!9101 thiss!1204)))))

(declare-fun b!189602 () Bool)

(assert (=> b!189602 (= e!130899 e!130895)))

(declare-fun res!158090 () Bool)

(assert (=> b!189602 (=> res!158090 e!130895)))

(assert (=> b!189602 (= res!158090 (not (= lt!294355 (bvsub (bvsub (bvadd lt!294356 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!189602 (= lt!294355 (bitIndex!0 (size!4360 (buf!4834 (_2!8839 lt!294363))) (currentByte!9106 (_2!8839 lt!294363)) (currentBit!9101 (_2!8839 lt!294363))))))

(assert (=> b!189602 (isPrefixOf!0 thiss!1204 (_2!8839 lt!294363))))

(declare-fun lt!294360 () Unit!13519)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7828 BitStream!7828 BitStream!7828) Unit!13519)

(assert (=> b!189602 (= lt!294360 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8839 lt!294371) (_2!8839 lt!294363)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7828 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16388)

(assert (=> b!189602 (= lt!294363 (appendBitsLSBFirstLoopTR!0 (_2!8839 lt!294371) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun e!130891 () Bool)

(declare-fun b!189603 () Bool)

(declare-fun lt!294373 () BitStream!7828)

(assert (=> b!189603 (= e!130891 (and (= lt!294354 (bvsub lt!294356 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8841 lt!294369) lt!294373)) (= (_2!8840 lt!294359) (_2!8840 lt!294365)))))))

(declare-fun b!189604 () Bool)

(declare-fun res!158096 () Bool)

(assert (=> b!189604 (=> (not res!158096) (not e!130890))))

(assert (=> b!189604 (= res!158096 (not (= i!590 nBits!348)))))

(declare-fun b!189605 () Bool)

(declare-fun res!158092 () Bool)

(assert (=> b!189605 (=> (not res!158092) (not e!130891))))

(declare-fun withMovedBitIndex!0 (BitStream!7828 (_ BitVec 64)) BitStream!7828)

(assert (=> b!189605 (= res!158092 (= (_1!8841 lt!294358) (withMovedBitIndex!0 (_2!8841 lt!294358) (bvsub lt!294354 lt!294355))))))

(declare-fun b!189606 () Bool)

(declare-fun array_inv!4101 (array!9890) Bool)

(assert (=> b!189606 (= e!130888 (array_inv!4101 (buf!4834 thiss!1204)))))

(declare-fun b!189607 () Bool)

(declare-fun e!130897 () Bool)

(assert (=> b!189607 (= e!130897 true)))

(assert (=> b!189607 (= (size!4360 (buf!4834 thiss!1204)) (size!4360 (buf!4834 (_2!8839 lt!294363))))))

(declare-fun b!189608 () Bool)

(assert (=> b!189608 (= e!130901 e!130897)))

(declare-fun res!158097 () Bool)

(assert (=> b!189608 (=> res!158097 e!130897)))

(assert (=> b!189608 (= res!158097 (not (= (_1!8841 lt!294369) lt!294373)))))

(assert (=> b!189608 e!130891))

(declare-fun res!158085 () Bool)

(assert (=> b!189608 (=> (not res!158085) (not e!130891))))

(declare-fun lt!294374 () tuple2!16390)

(assert (=> b!189608 (= res!158085 (and (= (_2!8840 lt!294359) (_2!8840 lt!294374)) (= (_1!8840 lt!294359) (_1!8840 lt!294374))))))

(declare-fun lt!294367 () Unit!13519)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13519)

(assert (=> b!189608 (= lt!294367 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8841 lt!294358) nBits!348 i!590 lt!294361))))

(assert (=> b!189608 (= lt!294374 (readNBitsLSBFirstsLoopPure!0 lt!294373 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294381))))

(assert (=> b!189608 (= lt!294373 (withMovedBitIndex!0 (_1!8841 lt!294358) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189609 () Bool)

(declare-fun res!158088 () Bool)

(assert (=> b!189609 (=> res!158088 e!130895)))

(assert (=> b!189609 (= res!158088 (not (isPrefixOf!0 thiss!1204 (_2!8839 lt!294371))))))

(declare-fun b!189610 () Bool)

(declare-fun res!158079 () Bool)

(assert (=> b!189610 (=> res!158079 e!130897)))

(assert (=> b!189610 (= res!158079 (not (= (bitIndex!0 (size!4360 (buf!4834 (_1!8840 lt!294359))) (currentByte!9106 (_1!8840 lt!294359)) (currentBit!9101 (_1!8840 lt!294359))) (bitIndex!0 (size!4360 (buf!4834 (_2!8841 lt!294358))) (currentByte!9106 (_2!8841 lt!294358)) (currentBit!9101 (_2!8841 lt!294358))))))))

(declare-fun b!189611 () Bool)

(declare-fun res!158082 () Bool)

(assert (=> b!189611 (=> (not res!158082) (not e!130891))))

(assert (=> b!189611 (= res!158082 (= (_1!8841 lt!294369) (withMovedBitIndex!0 (_2!8841 lt!294369) (bvsub lt!294356 lt!294355))))))

(declare-fun b!189612 () Bool)

(assert (=> b!189612 (= e!130889 (invariant!0 (currentBit!9101 thiss!1204) (currentByte!9106 thiss!1204) (size!4360 (buf!4834 (_2!8839 lt!294363)))))))

(declare-fun b!189613 () Bool)

(declare-fun res!158093 () Bool)

(assert (=> b!189613 (=> res!158093 e!130895)))

(assert (=> b!189613 (= res!158093 (not (isPrefixOf!0 (_2!8839 lt!294371) (_2!8839 lt!294363))))))

(declare-fun b!189614 () Bool)

(assert (=> b!189614 (= e!130900 (= (_2!8842 lt!294364) (_2!8842 lt!294376)))))

(declare-fun b!189615 () Bool)

(declare-fun res!158091 () Bool)

(assert (=> b!189615 (=> res!158091 e!130895)))

(assert (=> b!189615 (= res!158091 (not (invariant!0 (currentBit!9101 (_2!8839 lt!294363)) (currentByte!9106 (_2!8839 lt!294363)) (size!4360 (buf!4834 (_2!8839 lt!294363))))))))

(declare-fun b!189616 () Bool)

(assert (=> b!189616 (= e!130894 (= (bitIndex!0 (size!4360 (buf!4834 (_1!8842 lt!294370))) (currentByte!9106 (_1!8842 lt!294370)) (currentBit!9101 (_1!8842 lt!294370))) lt!294372))))

(declare-fun b!189617 () Bool)

(assert (=> b!189617 (= e!130896 e!130890)))

(declare-fun res!158087 () Bool)

(assert (=> b!189617 (=> (not res!158087) (not e!130890))))

(assert (=> b!189617 (= res!158087 (validate_offset_bits!1 ((_ sign_extend 32) (size!4360 (buf!4834 thiss!1204))) ((_ sign_extend 32) (currentByte!9106 thiss!1204)) ((_ sign_extend 32) (currentBit!9101 thiss!1204)) lt!294375))))

(assert (=> b!189617 (= lt!294375 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!41000 res!158083) b!189617))

(assert (= (and b!189617 res!158087) b!189600))

(assert (= (and b!189600 res!158078) b!189604))

(assert (= (and b!189604 res!158096) b!189598))

(assert (= (and b!189598 res!158077) b!189601))

(assert (= (and b!189601 res!158094) b!189595))

(assert (= (and b!189595 res!158089) b!189599))

(assert (= (and b!189599 res!158086) b!189616))

(assert (= (and b!189598 (not res!158076)) b!189602))

(assert (= (and b!189602 (not res!158090)) b!189615))

(assert (= (and b!189615 (not res!158091)) b!189597))

(assert (= (and b!189597 (not res!158080)) b!189613))

(assert (= (and b!189613 (not res!158093)) b!189609))

(assert (= (and b!189609 (not res!158088)) b!189596))

(assert (= (and b!189596 res!158095) b!189612))

(assert (= (and b!189596 res!158084) b!189614))

(assert (= (and b!189596 (not res!158081)) b!189608))

(assert (= (and b!189608 res!158085) b!189605))

(assert (= (and b!189605 res!158092) b!189611))

(assert (= (and b!189611 res!158082) b!189603))

(assert (= (and b!189608 (not res!158097)) b!189610))

(assert (= (and b!189610 (not res!158079)) b!189607))

(assert (= start!41000 b!189606))

(declare-fun m!294635 () Bool)

(assert (=> b!189609 m!294635))

(declare-fun m!294637 () Bool)

(assert (=> b!189601 m!294637))

(declare-fun m!294639 () Bool)

(assert (=> b!189601 m!294639))

(declare-fun m!294641 () Bool)

(assert (=> b!189608 m!294641))

(declare-fun m!294643 () Bool)

(assert (=> b!189608 m!294643))

(declare-fun m!294645 () Bool)

(assert (=> b!189608 m!294645))

(declare-fun m!294647 () Bool)

(assert (=> b!189610 m!294647))

(declare-fun m!294649 () Bool)

(assert (=> b!189610 m!294649))

(declare-fun m!294651 () Bool)

(assert (=> b!189612 m!294651))

(declare-fun m!294653 () Bool)

(assert (=> b!189605 m!294653))

(declare-fun m!294655 () Bool)

(assert (=> b!189606 m!294655))

(assert (=> b!189598 m!294637))

(assert (=> b!189598 m!294639))

(declare-fun m!294657 () Bool)

(assert (=> b!189598 m!294657))

(declare-fun m!294659 () Bool)

(assert (=> b!189599 m!294659))

(assert (=> b!189599 m!294659))

(declare-fun m!294661 () Bool)

(assert (=> b!189599 m!294661))

(declare-fun m!294663 () Bool)

(assert (=> b!189600 m!294663))

(declare-fun m!294665 () Bool)

(assert (=> b!189596 m!294665))

(declare-fun m!294667 () Bool)

(assert (=> b!189596 m!294667))

(declare-fun m!294669 () Bool)

(assert (=> b!189596 m!294669))

(declare-fun m!294671 () Bool)

(assert (=> b!189596 m!294671))

(declare-fun m!294673 () Bool)

(assert (=> b!189596 m!294673))

(declare-fun m!294675 () Bool)

(assert (=> b!189596 m!294675))

(declare-fun m!294677 () Bool)

(assert (=> b!189596 m!294677))

(declare-fun m!294679 () Bool)

(assert (=> b!189596 m!294679))

(declare-fun m!294681 () Bool)

(assert (=> b!189596 m!294681))

(declare-fun m!294683 () Bool)

(assert (=> b!189596 m!294683))

(declare-fun m!294685 () Bool)

(assert (=> b!189596 m!294685))

(declare-fun m!294687 () Bool)

(assert (=> b!189596 m!294687))

(declare-fun m!294689 () Bool)

(assert (=> b!189596 m!294689))

(declare-fun m!294691 () Bool)

(assert (=> b!189596 m!294691))

(declare-fun m!294693 () Bool)

(assert (=> b!189596 m!294693))

(declare-fun m!294695 () Bool)

(assert (=> b!189596 m!294695))

(declare-fun m!294697 () Bool)

(assert (=> b!189616 m!294697))

(assert (=> b!189595 m!294635))

(declare-fun m!294699 () Bool)

(assert (=> b!189613 m!294699))

(declare-fun m!294701 () Bool)

(assert (=> b!189602 m!294701))

(declare-fun m!294703 () Bool)

(assert (=> b!189602 m!294703))

(declare-fun m!294705 () Bool)

(assert (=> b!189602 m!294705))

(declare-fun m!294707 () Bool)

(assert (=> b!189602 m!294707))

(declare-fun m!294709 () Bool)

(assert (=> b!189615 m!294709))

(declare-fun m!294711 () Bool)

(assert (=> b!189617 m!294711))

(declare-fun m!294713 () Bool)

(assert (=> start!41000 m!294713))

(declare-fun m!294715 () Bool)

(assert (=> b!189611 m!294715))

(push 1)

(assert (not start!41000))

(assert (not b!189600))

(assert (not b!189608))

(assert (not b!189598))

(assert (not b!189613))

(assert (not b!189616))

(assert (not b!189605))

(assert (not b!189611))

(assert (not b!189599))

(assert (not b!189610))

(assert (not b!189606))

(assert (not b!189609))

(assert (not b!189601))

(assert (not b!189612))

(assert (not b!189602))

(assert (not b!189595))

(assert (not b!189617))

(assert (not b!189596))

(assert (not b!189615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

