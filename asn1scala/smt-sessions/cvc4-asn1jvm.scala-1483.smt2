; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41010 () Bool)

(assert start!41010)

(declare-fun b!189940 () Bool)

(declare-fun e!131111 () Bool)

(declare-fun e!131099 () Bool)

(assert (=> b!189940 (= e!131111 e!131099)))

(declare-fun res!158427 () Bool)

(assert (=> b!189940 (=> (not res!158427) (not e!131099))))

(declare-fun lt!294805 () (_ BitVec 64))

(declare-fun lt!294801 () (_ BitVec 64))

(assert (=> b!189940 (= res!158427 (= lt!294805 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294801)))))

(declare-datatypes ((array!9900 0))(
  ( (array!9901 (arr!5295 (Array (_ BitVec 32) (_ BitVec 8))) (size!4365 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7838 0))(
  ( (BitStream!7839 (buf!4839 array!9900) (currentByte!9111 (_ BitVec 32)) (currentBit!9106 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13529 0))(
  ( (Unit!13530) )
))
(declare-datatypes ((tuple2!16428 0))(
  ( (tuple2!16429 (_1!8859 Unit!13529) (_2!8859 BitStream!7838)) )
))
(declare-fun lt!294809 () tuple2!16428)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189940 (= lt!294805 (bitIndex!0 (size!4365 (buf!4839 (_2!8859 lt!294809))) (currentByte!9111 (_2!8859 lt!294809)) (currentBit!9106 (_2!8859 lt!294809))))))

(declare-fun thiss!1204 () BitStream!7838)

(assert (=> b!189940 (= lt!294801 (bitIndex!0 (size!4365 (buf!4839 thiss!1204)) (currentByte!9111 thiss!1204) (currentBit!9106 thiss!1204)))))

(declare-fun b!189941 () Bool)

(declare-fun res!158410 () Bool)

(declare-fun e!131100 () Bool)

(assert (=> b!189941 (=> (not res!158410) (not e!131100))))

(declare-fun lt!294813 () (_ BitVec 64))

(declare-fun lt!294817 () (_ BitVec 64))

(declare-datatypes ((tuple2!16430 0))(
  ( (tuple2!16431 (_1!8860 BitStream!7838) (_2!8860 BitStream!7838)) )
))
(declare-fun lt!294800 () tuple2!16430)

(declare-fun withMovedBitIndex!0 (BitStream!7838 (_ BitVec 64)) BitStream!7838)

(assert (=> b!189941 (= res!158410 (= (_1!8860 lt!294800) (withMovedBitIndex!0 (_2!8860 lt!294800) (bvsub lt!294817 lt!294813))))))

(declare-fun b!189942 () Bool)

(declare-fun res!158424 () Bool)

(declare-fun e!131108 () Bool)

(assert (=> b!189942 (=> res!158424 e!131108)))

(declare-fun lt!294815 () tuple2!16428)

(declare-fun isPrefixOf!0 (BitStream!7838 BitStream!7838) Bool)

(assert (=> b!189942 (= res!158424 (not (isPrefixOf!0 (_2!8859 lt!294809) (_2!8859 lt!294815))))))

(declare-fun b!189943 () Bool)

(declare-fun res!158425 () Bool)

(assert (=> b!189943 (=> res!158425 e!131108)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!189943 (= res!158425 (or (not (= (size!4365 (buf!4839 (_2!8859 lt!294815))) (size!4365 (buf!4839 thiss!1204)))) (not (= lt!294813 (bvsub (bvadd lt!294817 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!189944 () Bool)

(declare-fun e!131104 () Bool)

(declare-fun e!131109 () Bool)

(assert (=> b!189944 (= e!131104 e!131109)))

(declare-fun res!158415 () Bool)

(assert (=> b!189944 (=> (not res!158415) (not e!131109))))

(declare-fun lt!294802 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189944 (= res!158415 (validate_offset_bits!1 ((_ sign_extend 32) (size!4365 (buf!4839 thiss!1204))) ((_ sign_extend 32) (currentByte!9111 thiss!1204)) ((_ sign_extend 32) (currentBit!9106 thiss!1204)) lt!294802))))

(assert (=> b!189944 (= lt!294802 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!189945 () Bool)

(declare-fun e!131102 () Bool)

(declare-datatypes ((tuple2!16432 0))(
  ( (tuple2!16433 (_1!8861 BitStream!7838) (_2!8861 Bool)) )
))
(declare-fun lt!294799 () tuple2!16432)

(assert (=> b!189945 (= e!131102 (= (bitIndex!0 (size!4365 (buf!4839 (_1!8861 lt!294799))) (currentByte!9111 (_1!8861 lt!294799)) (currentBit!9106 (_1!8861 lt!294799))) lt!294805))))

(declare-fun b!189946 () Bool)

(declare-fun e!131098 () Bool)

(declare-fun array_inv!4106 (array!9900) Bool)

(assert (=> b!189946 (= e!131098 (array_inv!4106 (buf!4839 thiss!1204)))))

(declare-fun b!189947 () Bool)

(declare-fun e!131106 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189947 (= e!131106 (invariant!0 (currentBit!9106 thiss!1204) (currentByte!9111 thiss!1204) (size!4365 (buf!4839 (_2!8859 lt!294815)))))))

(declare-fun b!189948 () Bool)

(declare-fun res!158426 () Bool)

(assert (=> b!189948 (=> res!158426 e!131108)))

(assert (=> b!189948 (= res!158426 (not (invariant!0 (currentBit!9106 (_2!8859 lt!294815)) (currentByte!9111 (_2!8859 lt!294815)) (size!4365 (buf!4839 (_2!8859 lt!294815))))))))

(declare-fun b!189949 () Bool)

(declare-fun res!158422 () Bool)

(assert (=> b!189949 (=> res!158422 e!131108)))

(assert (=> b!189949 (= res!158422 (not (isPrefixOf!0 thiss!1204 (_2!8859 lt!294809))))))

(declare-fun res!158411 () Bool)

(assert (=> start!41010 (=> (not res!158411) (not e!131104))))

(assert (=> start!41010 (= res!158411 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41010 e!131104))

(assert (=> start!41010 true))

(declare-fun inv!12 (BitStream!7838) Bool)

(assert (=> start!41010 (and (inv!12 thiss!1204) e!131098)))

(declare-fun b!189950 () Bool)

(assert (=> b!189950 (= e!131099 e!131102)))

(declare-fun res!158412 () Bool)

(assert (=> b!189950 (=> (not res!158412) (not e!131102))))

(declare-fun lt!294792 () Bool)

(assert (=> b!189950 (= res!158412 (and (= (_2!8861 lt!294799) lt!294792) (= (_1!8861 lt!294799) (_2!8859 lt!294809))))))

(declare-fun readBitPure!0 (BitStream!7838) tuple2!16432)

(declare-fun readerFrom!0 (BitStream!7838 (_ BitVec 32) (_ BitVec 32)) BitStream!7838)

(assert (=> b!189950 (= lt!294799 (readBitPure!0 (readerFrom!0 (_2!8859 lt!294809) (currentBit!9106 thiss!1204) (currentByte!9111 thiss!1204))))))

(declare-fun b!189951 () Bool)

(declare-fun lt!294814 () (_ BitVec 64))

(declare-fun lt!294796 () tuple2!16430)

(declare-fun lt!294804 () BitStream!7838)

(declare-datatypes ((tuple2!16434 0))(
  ( (tuple2!16435 (_1!8862 BitStream!7838) (_2!8862 (_ BitVec 64))) )
))
(declare-fun lt!294798 () tuple2!16434)

(declare-fun lt!294806 () tuple2!16434)

(assert (=> b!189951 (= e!131100 (and (= lt!294817 (bvsub lt!294814 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8860 lt!294796) lt!294804)) (= (_2!8862 lt!294806) (_2!8862 lt!294798)))))))

(declare-fun b!189952 () Bool)

(declare-fun e!131107 () Bool)

(assert (=> b!189952 (= e!131107 e!131108)))

(declare-fun res!158420 () Bool)

(assert (=> b!189952 (=> res!158420 e!131108)))

(assert (=> b!189952 (= res!158420 (not (= lt!294813 (bvsub (bvsub (bvadd lt!294814 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!189952 (= lt!294813 (bitIndex!0 (size!4365 (buf!4839 (_2!8859 lt!294815))) (currentByte!9111 (_2!8859 lt!294815)) (currentBit!9106 (_2!8859 lt!294815))))))

(assert (=> b!189952 (isPrefixOf!0 thiss!1204 (_2!8859 lt!294815))))

(declare-fun lt!294816 () Unit!13529)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7838 BitStream!7838 BitStream!7838) Unit!13529)

(assert (=> b!189952 (= lt!294816 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8859 lt!294809) (_2!8859 lt!294815)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7838 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16428)

(assert (=> b!189952 (= lt!294815 (appendBitsLSBFirstLoopTR!0 (_2!8859 lt!294809) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!189953 () Bool)

(assert (=> b!189953 (= e!131109 (not e!131107))))

(declare-fun res!158419 () Bool)

(assert (=> b!189953 (=> res!158419 e!131107)))

(assert (=> b!189953 (= res!158419 (not (= lt!294814 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!294817))))))

(assert (=> b!189953 (= lt!294814 (bitIndex!0 (size!4365 (buf!4839 (_2!8859 lt!294809))) (currentByte!9111 (_2!8859 lt!294809)) (currentBit!9106 (_2!8859 lt!294809))))))

(assert (=> b!189953 (= lt!294817 (bitIndex!0 (size!4365 (buf!4839 thiss!1204)) (currentByte!9111 thiss!1204) (currentBit!9106 thiss!1204)))))

(assert (=> b!189953 e!131111))

(declare-fun res!158406 () Bool)

(assert (=> b!189953 (=> (not res!158406) (not e!131111))))

(assert (=> b!189953 (= res!158406 (= (size!4365 (buf!4839 thiss!1204)) (size!4365 (buf!4839 (_2!8859 lt!294809)))))))

(declare-fun appendBit!0 (BitStream!7838 Bool) tuple2!16428)

(assert (=> b!189953 (= lt!294809 (appendBit!0 thiss!1204 lt!294792))))

(declare-fun lt!294807 () (_ BitVec 64))

(assert (=> b!189953 (= lt!294792 (not (= (bvand v!189 lt!294807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189953 (= lt!294807 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189954 () Bool)

(declare-fun e!131103 () Bool)

(declare-fun e!131101 () Bool)

(assert (=> b!189954 (= e!131103 e!131101)))

(declare-fun res!158413 () Bool)

(assert (=> b!189954 (=> res!158413 e!131101)))

(assert (=> b!189954 (= res!158413 (not (= (_1!8860 lt!294796) lt!294804)))))

(assert (=> b!189954 e!131100))

(declare-fun res!158417 () Bool)

(assert (=> b!189954 (=> (not res!158417) (not e!131100))))

(declare-fun lt!294808 () tuple2!16434)

(assert (=> b!189954 (= res!158417 (and (= (_2!8862 lt!294806) (_2!8862 lt!294808)) (= (_1!8862 lt!294806) (_1!8862 lt!294808))))))

(declare-fun lt!294789 () (_ BitVec 64))

(declare-fun lt!294791 () Unit!13529)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13529)

(assert (=> b!189954 (= lt!294791 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8860 lt!294800) nBits!348 i!590 lt!294789))))

(declare-fun lt!294811 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16434)

(assert (=> b!189954 (= lt!294808 (readNBitsLSBFirstsLoopPure!0 lt!294804 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294811))))

(assert (=> b!189954 (= lt!294804 (withMovedBitIndex!0 (_1!8860 lt!294800) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189955 () Bool)

(declare-fun res!158409 () Bool)

(assert (=> b!189955 (=> res!158409 e!131101)))

(assert (=> b!189955 (= res!158409 (not (= (bitIndex!0 (size!4365 (buf!4839 (_1!8862 lt!294806))) (currentByte!9111 (_1!8862 lt!294806)) (currentBit!9106 (_1!8862 lt!294806))) (bitIndex!0 (size!4365 (buf!4839 (_2!8860 lt!294800))) (currentByte!9111 (_2!8860 lt!294800)) (currentBit!9106 (_2!8860 lt!294800))))))))

(declare-fun b!189956 () Bool)

(declare-fun res!158408 () Bool)

(assert (=> b!189956 (=> (not res!158408) (not e!131100))))

(assert (=> b!189956 (= res!158408 (= (_1!8860 lt!294796) (withMovedBitIndex!0 (_2!8860 lt!294796) (bvsub lt!294814 lt!294813))))))

(declare-fun b!189957 () Bool)

(assert (=> b!189957 (= e!131101 true)))

(assert (=> b!189957 (= (size!4365 (buf!4839 thiss!1204)) (size!4365 (buf!4839 (_2!8859 lt!294815))))))

(declare-fun b!189958 () Bool)

(declare-fun res!158416 () Bool)

(assert (=> b!189958 (=> (not res!158416) (not e!131099))))

(assert (=> b!189958 (= res!158416 (isPrefixOf!0 thiss!1204 (_2!8859 lt!294809)))))

(declare-fun b!189959 () Bool)

(assert (=> b!189959 (= e!131108 e!131103)))

(declare-fun res!158414 () Bool)

(assert (=> b!189959 (=> res!158414 e!131103)))

(assert (=> b!189959 (= res!158414 (not (= (_1!8862 lt!294798) (_2!8860 lt!294796))))))

(assert (=> b!189959 (= lt!294798 (readNBitsLSBFirstsLoopPure!0 (_1!8860 lt!294796) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!294811))))

(declare-fun lt!294810 () (_ BitVec 64))

(assert (=> b!189959 (validate_offset_bits!1 ((_ sign_extend 32) (size!4365 (buf!4839 (_2!8859 lt!294815)))) ((_ sign_extend 32) (currentByte!9111 (_2!8859 lt!294809))) ((_ sign_extend 32) (currentBit!9106 (_2!8859 lt!294809))) lt!294810)))

(declare-fun lt!294793 () Unit!13529)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7838 array!9900 (_ BitVec 64)) Unit!13529)

(assert (=> b!189959 (= lt!294793 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8859 lt!294809) (buf!4839 (_2!8859 lt!294815)) lt!294810))))

(assert (=> b!189959 (= lt!294810 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!294795 () tuple2!16432)

(assert (=> b!189959 (= lt!294811 (bvor lt!294789 (ite (_2!8861 lt!294795) lt!294807 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189959 (= lt!294806 (readNBitsLSBFirstsLoopPure!0 (_1!8860 lt!294800) nBits!348 i!590 lt!294789))))

(assert (=> b!189959 (validate_offset_bits!1 ((_ sign_extend 32) (size!4365 (buf!4839 (_2!8859 lt!294815)))) ((_ sign_extend 32) (currentByte!9111 thiss!1204)) ((_ sign_extend 32) (currentBit!9106 thiss!1204)) lt!294802)))

(declare-fun lt!294794 () Unit!13529)

(assert (=> b!189959 (= lt!294794 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4839 (_2!8859 lt!294815)) lt!294802))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189959 (= lt!294789 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!189959 (= (_2!8861 lt!294795) lt!294792)))

(assert (=> b!189959 (= lt!294795 (readBitPure!0 (_1!8860 lt!294800)))))

(declare-fun reader!0 (BitStream!7838 BitStream!7838) tuple2!16430)

(assert (=> b!189959 (= lt!294796 (reader!0 (_2!8859 lt!294809) (_2!8859 lt!294815)))))

(assert (=> b!189959 (= lt!294800 (reader!0 thiss!1204 (_2!8859 lt!294815)))))

(declare-fun e!131110 () Bool)

(assert (=> b!189959 e!131110))

(declare-fun res!158421 () Bool)

(assert (=> b!189959 (=> (not res!158421) (not e!131110))))

(declare-fun lt!294797 () tuple2!16432)

(declare-fun lt!294803 () tuple2!16432)

(assert (=> b!189959 (= res!158421 (= (bitIndex!0 (size!4365 (buf!4839 (_1!8861 lt!294797))) (currentByte!9111 (_1!8861 lt!294797)) (currentBit!9106 (_1!8861 lt!294797))) (bitIndex!0 (size!4365 (buf!4839 (_1!8861 lt!294803))) (currentByte!9111 (_1!8861 lt!294803)) (currentBit!9106 (_1!8861 lt!294803)))))))

(declare-fun lt!294790 () Unit!13529)

(declare-fun lt!294812 () BitStream!7838)

(declare-fun readBitPrefixLemma!0 (BitStream!7838 BitStream!7838) Unit!13529)

(assert (=> b!189959 (= lt!294790 (readBitPrefixLemma!0 lt!294812 (_2!8859 lt!294815)))))

(assert (=> b!189959 (= lt!294803 (readBitPure!0 (BitStream!7839 (buf!4839 (_2!8859 lt!294815)) (currentByte!9111 thiss!1204) (currentBit!9106 thiss!1204))))))

(assert (=> b!189959 (= lt!294797 (readBitPure!0 lt!294812))))

(assert (=> b!189959 e!131106))

(declare-fun res!158423 () Bool)

(assert (=> b!189959 (=> (not res!158423) (not e!131106))))

(assert (=> b!189959 (= res!158423 (invariant!0 (currentBit!9106 thiss!1204) (currentByte!9111 thiss!1204) (size!4365 (buf!4839 (_2!8859 lt!294809)))))))

(assert (=> b!189959 (= lt!294812 (BitStream!7839 (buf!4839 (_2!8859 lt!294809)) (currentByte!9111 thiss!1204) (currentBit!9106 thiss!1204)))))

(declare-fun b!189960 () Bool)

(declare-fun res!158407 () Bool)

(assert (=> b!189960 (=> (not res!158407) (not e!131109))))

(assert (=> b!189960 (= res!158407 (not (= i!590 nBits!348)))))

(declare-fun b!189961 () Bool)

(assert (=> b!189961 (= e!131110 (= (_2!8861 lt!294797) (_2!8861 lt!294803)))))

(declare-fun b!189962 () Bool)

(declare-fun res!158418 () Bool)

(assert (=> b!189962 (=> (not res!158418) (not e!131109))))

(assert (=> b!189962 (= res!158418 (invariant!0 (currentBit!9106 thiss!1204) (currentByte!9111 thiss!1204) (size!4365 (buf!4839 thiss!1204))))))

(assert (= (and start!41010 res!158411) b!189944))

(assert (= (and b!189944 res!158415) b!189962))

(assert (= (and b!189962 res!158418) b!189960))

(assert (= (and b!189960 res!158407) b!189953))

(assert (= (and b!189953 res!158406) b!189940))

(assert (= (and b!189940 res!158427) b!189958))

(assert (= (and b!189958 res!158416) b!189950))

(assert (= (and b!189950 res!158412) b!189945))

(assert (= (and b!189953 (not res!158419)) b!189952))

(assert (= (and b!189952 (not res!158420)) b!189948))

(assert (= (and b!189948 (not res!158426)) b!189943))

(assert (= (and b!189943 (not res!158425)) b!189942))

(assert (= (and b!189942 (not res!158424)) b!189949))

(assert (= (and b!189949 (not res!158422)) b!189959))

(assert (= (and b!189959 res!158423) b!189947))

(assert (= (and b!189959 res!158421) b!189961))

(assert (= (and b!189959 (not res!158414)) b!189954))

(assert (= (and b!189954 res!158417) b!189941))

(assert (= (and b!189941 res!158410) b!189956))

(assert (= (and b!189956 res!158408) b!189951))

(assert (= (and b!189954 (not res!158413)) b!189955))

(assert (= (and b!189955 (not res!158409)) b!189957))

(assert (= start!41010 b!189946))

(declare-fun m!295045 () Bool)

(assert (=> b!189948 m!295045))

(declare-fun m!295047 () Bool)

(assert (=> b!189940 m!295047))

(declare-fun m!295049 () Bool)

(assert (=> b!189940 m!295049))

(declare-fun m!295051 () Bool)

(assert (=> b!189945 m!295051))

(assert (=> b!189953 m!295047))

(assert (=> b!189953 m!295049))

(declare-fun m!295053 () Bool)

(assert (=> b!189953 m!295053))

(declare-fun m!295055 () Bool)

(assert (=> start!41010 m!295055))

(declare-fun m!295057 () Bool)

(assert (=> b!189962 m!295057))

(declare-fun m!295059 () Bool)

(assert (=> b!189950 m!295059))

(assert (=> b!189950 m!295059))

(declare-fun m!295061 () Bool)

(assert (=> b!189950 m!295061))

(declare-fun m!295063 () Bool)

(assert (=> b!189949 m!295063))

(declare-fun m!295065 () Bool)

(assert (=> b!189959 m!295065))

(declare-fun m!295067 () Bool)

(assert (=> b!189959 m!295067))

(declare-fun m!295069 () Bool)

(assert (=> b!189959 m!295069))

(declare-fun m!295071 () Bool)

(assert (=> b!189959 m!295071))

(declare-fun m!295073 () Bool)

(assert (=> b!189959 m!295073))

(declare-fun m!295075 () Bool)

(assert (=> b!189959 m!295075))

(declare-fun m!295077 () Bool)

(assert (=> b!189959 m!295077))

(declare-fun m!295079 () Bool)

(assert (=> b!189959 m!295079))

(declare-fun m!295081 () Bool)

(assert (=> b!189959 m!295081))

(declare-fun m!295083 () Bool)

(assert (=> b!189959 m!295083))

(declare-fun m!295085 () Bool)

(assert (=> b!189959 m!295085))

(declare-fun m!295087 () Bool)

(assert (=> b!189959 m!295087))

(declare-fun m!295089 () Bool)

(assert (=> b!189959 m!295089))

(declare-fun m!295091 () Bool)

(assert (=> b!189959 m!295091))

(declare-fun m!295093 () Bool)

(assert (=> b!189959 m!295093))

(declare-fun m!295095 () Bool)

(assert (=> b!189959 m!295095))

(declare-fun m!295097 () Bool)

(assert (=> b!189941 m!295097))

(declare-fun m!295099 () Bool)

(assert (=> b!189946 m!295099))

(declare-fun m!295101 () Bool)

(assert (=> b!189954 m!295101))

(declare-fun m!295103 () Bool)

(assert (=> b!189954 m!295103))

(declare-fun m!295105 () Bool)

(assert (=> b!189954 m!295105))

(declare-fun m!295107 () Bool)

(assert (=> b!189956 m!295107))

(assert (=> b!189958 m!295063))

(declare-fun m!295109 () Bool)

(assert (=> b!189942 m!295109))

(declare-fun m!295111 () Bool)

(assert (=> b!189952 m!295111))

(declare-fun m!295113 () Bool)

(assert (=> b!189952 m!295113))

(declare-fun m!295115 () Bool)

(assert (=> b!189952 m!295115))

(declare-fun m!295117 () Bool)

(assert (=> b!189952 m!295117))

(declare-fun m!295119 () Bool)

(assert (=> b!189947 m!295119))

(declare-fun m!295121 () Bool)

(assert (=> b!189955 m!295121))

(declare-fun m!295123 () Bool)

(assert (=> b!189955 m!295123))

(declare-fun m!295125 () Bool)

(assert (=> b!189944 m!295125))

(push 1)

(assert (not b!189962))

(assert (not b!189942))

(assert (not b!189946))

(assert (not b!189953))

(assert (not b!189940))

(assert (not b!189952))

(assert (not b!189959))

(assert (not b!189955))

(assert (not b!189949))

(assert (not b!189948))

(assert (not b!189944))

(assert (not b!189950))

(assert (not start!41010))

(assert (not b!189945))

(assert (not b!189941))

(assert (not b!189956))

(assert (not b!189958))

(assert (not b!189947))

(assert (not b!189954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

