; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43864 () Bool)

(assert start!43864)

(declare-fun b!208892 () Bool)

(declare-fun res!175339 () Bool)

(declare-fun e!142668 () Bool)

(assert (=> b!208892 (=> (not res!175339) (not e!142668))))

(declare-datatypes ((array!10461 0))(
  ( (array!10462 (arr!5529 (Array (_ BitVec 32) (_ BitVec 8))) (size!4599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8306 0))(
  ( (BitStream!8307 (buf!5110 array!10461) (currentByte!9640 (_ BitVec 32)) (currentBit!9635 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8306)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!208892 (= res!175339 (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 thiss!1204))))))

(declare-fun b!208893 () Bool)

(declare-fun e!142662 () Bool)

(declare-fun e!142666 () Bool)

(assert (=> b!208893 (= e!142662 e!142666)))

(declare-fun res!175348 () Bool)

(assert (=> b!208893 (=> res!175348 e!142666)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!326683 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!326679 () (_ BitVec 64))

(assert (=> b!208893 (= res!175348 (not (= lt!326679 (bvsub (bvsub (bvadd lt!326683 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!14870 0))(
  ( (Unit!14871) )
))
(declare-datatypes ((tuple2!17922 0))(
  ( (tuple2!17923 (_1!9616 Unit!14870) (_2!9616 BitStream!8306)) )
))
(declare-fun lt!326668 () tuple2!17922)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208893 (= lt!326679 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326668))) (currentByte!9640 (_2!9616 lt!326668)) (currentBit!9635 (_2!9616 lt!326668))))))

(declare-fun isPrefixOf!0 (BitStream!8306 BitStream!8306) Bool)

(assert (=> b!208893 (isPrefixOf!0 thiss!1204 (_2!9616 lt!326668))))

(declare-fun lt!326667 () tuple2!17922)

(declare-fun lt!326686 () Unit!14870)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8306 BitStream!8306 BitStream!8306) Unit!14870)

(assert (=> b!208893 (= lt!326686 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9616 lt!326667) (_2!9616 lt!326668)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8306 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17922)

(assert (=> b!208893 (= lt!326668 (appendBitsLSBFirstLoopTR!0 (_2!9616 lt!326667) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!208894 () Bool)

(declare-fun res!175331 () Bool)

(assert (=> b!208894 (=> res!175331 e!142666)))

(declare-fun lt!326678 () (_ BitVec 64))

(assert (=> b!208894 (= res!175331 (or (not (= (size!4599 (buf!5110 (_2!9616 lt!326668))) (size!4599 (buf!5110 thiss!1204)))) (not (= lt!326679 (bvsub (bvadd lt!326678 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!208895 () Bool)

(assert (=> b!208895 (= e!142668 (not e!142662))))

(declare-fun res!175332 () Bool)

(assert (=> b!208895 (=> res!175332 e!142662)))

(assert (=> b!208895 (= res!175332 (not (= lt!326683 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!326678))))))

(assert (=> b!208895 (= lt!326683 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(assert (=> b!208895 (= lt!326678 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(declare-fun e!142664 () Bool)

(assert (=> b!208895 e!142664))

(declare-fun res!175334 () Bool)

(assert (=> b!208895 (=> (not res!175334) (not e!142664))))

(assert (=> b!208895 (= res!175334 (= (size!4599 (buf!5110 thiss!1204)) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(declare-fun lt!326664 () Bool)

(declare-fun appendBit!0 (BitStream!8306 Bool) tuple2!17922)

(assert (=> b!208895 (= lt!326667 (appendBit!0 thiss!1204 lt!326664))))

(declare-fun lt!326674 () (_ BitVec 64))

(assert (=> b!208895 (= lt!326664 (not (= (bvand v!189 lt!326674) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!208895 (= lt!326674 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!208897 () Bool)

(declare-fun res!175347 () Bool)

(assert (=> b!208897 (=> res!175347 e!142666)))

(assert (=> b!208897 (= res!175347 (not (isPrefixOf!0 (_2!9616 lt!326667) (_2!9616 lt!326668))))))

(declare-fun b!208898 () Bool)

(declare-fun res!175342 () Bool)

(declare-fun e!142670 () Bool)

(assert (=> b!208898 (=> res!175342 e!142670)))

(assert (=> b!208898 (= res!175342 (bvsge i!590 nBits!348))))

(declare-fun b!208899 () Bool)

(declare-fun lt!326681 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208899 (= e!142670 (= (bvand lt!326681 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!208900 () Bool)

(declare-fun res!175343 () Bool)

(assert (=> b!208900 (=> (not res!175343) (not e!142668))))

(assert (=> b!208900 (= res!175343 (not (= i!590 nBits!348)))))

(declare-fun b!208901 () Bool)

(declare-fun e!142661 () Bool)

(declare-fun e!142667 () Bool)

(assert (=> b!208901 (= e!142661 e!142667)))

(declare-fun res!175345 () Bool)

(assert (=> b!208901 (=> (not res!175345) (not e!142667))))

(declare-datatypes ((tuple2!17924 0))(
  ( (tuple2!17925 (_1!9617 BitStream!8306) (_2!9617 Bool)) )
))
(declare-fun lt!326673 () tuple2!17924)

(assert (=> b!208901 (= res!175345 (and (= (_2!9617 lt!326673) lt!326664) (= (_1!9617 lt!326673) (_2!9616 lt!326667))))))

(declare-fun readBitPure!0 (BitStream!8306) tuple2!17924)

(declare-fun readerFrom!0 (BitStream!8306 (_ BitVec 32) (_ BitVec 32)) BitStream!8306)

(assert (=> b!208901 (= lt!326673 (readBitPure!0 (readerFrom!0 (_2!9616 lt!326667) (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204))))))

(declare-fun b!208902 () Bool)

(declare-fun e!142665 () Bool)

(assert (=> b!208902 (= e!142665 e!142668)))

(declare-fun res!175333 () Bool)

(assert (=> b!208902 (=> (not res!175333) (not e!142668))))

(declare-fun lt!326669 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!208902 (= res!175333 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204)) lt!326669))))

(assert (=> b!208902 (= lt!326669 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!208903 () Bool)

(declare-fun e!142671 () Bool)

(declare-fun array_inv!4340 (array!10461) Bool)

(assert (=> b!208903 (= e!142671 (array_inv!4340 (buf!5110 thiss!1204)))))

(declare-fun b!208904 () Bool)

(declare-fun e!142663 () Bool)

(declare-fun lt!326672 () tuple2!17924)

(declare-fun lt!326665 () tuple2!17924)

(assert (=> b!208904 (= e!142663 (= (_2!9617 lt!326672) (_2!9617 lt!326665)))))

(declare-fun b!208905 () Bool)

(declare-fun e!142669 () Bool)

(assert (=> b!208905 (= e!142669 (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326668)))))))

(declare-fun res!175341 () Bool)

(assert (=> start!43864 (=> (not res!175341) (not e!142665))))

(assert (=> start!43864 (= res!175341 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43864 e!142665))

(assert (=> start!43864 true))

(declare-fun inv!12 (BitStream!8306) Bool)

(assert (=> start!43864 (and (inv!12 thiss!1204) e!142671)))

(declare-fun b!208896 () Bool)

(declare-fun res!175337 () Bool)

(assert (=> b!208896 (=> res!175337 e!142666)))

(assert (=> b!208896 (= res!175337 (not (invariant!0 (currentBit!9635 (_2!9616 lt!326668)) (currentByte!9640 (_2!9616 lt!326668)) (size!4599 (buf!5110 (_2!9616 lt!326668))))))))

(declare-fun b!208906 () Bool)

(declare-fun res!175336 () Bool)

(assert (=> b!208906 (=> res!175336 e!142666)))

(assert (=> b!208906 (= res!175336 (not (isPrefixOf!0 thiss!1204 (_2!9616 lt!326667))))))

(declare-fun b!208907 () Bool)

(assert (=> b!208907 (= e!142666 e!142670)))

(declare-fun res!175346 () Bool)

(assert (=> b!208907 (=> res!175346 e!142670)))

(declare-datatypes ((tuple2!17926 0))(
  ( (tuple2!17927 (_1!9618 BitStream!8306) (_2!9618 BitStream!8306)) )
))
(declare-fun lt!326677 () tuple2!17926)

(declare-fun lt!326666 () tuple2!17924)

(declare-datatypes ((tuple2!17928 0))(
  ( (tuple2!17929 (_1!9619 BitStream!8306) (_2!9619 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17928)

(assert (=> b!208907 (= res!175346 (not (= (_1!9619 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!326677) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326681 (ite (_2!9617 lt!326666) lt!326674 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!9618 lt!326677))))))

(declare-fun lt!326670 () (_ BitVec 64))

(assert (=> b!208907 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!326670)))

(declare-fun lt!326675 () Unit!14870)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8306 array!10461 (_ BitVec 64)) Unit!14870)

(assert (=> b!208907 (= lt!326675 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9616 lt!326667) (buf!5110 (_2!9616 lt!326668)) lt!326670))))

(assert (=> b!208907 (= lt!326670 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!326680 () tuple2!17926)

(declare-fun lt!326682 () tuple2!17928)

(assert (=> b!208907 (= lt!326682 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!326680) nBits!348 i!590 lt!326681))))

(assert (=> b!208907 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204)) lt!326669)))

(declare-fun lt!326685 () Unit!14870)

(assert (=> b!208907 (= lt!326685 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5110 (_2!9616 lt!326668)) lt!326669))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!208907 (= lt!326681 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!208907 (= (_2!9617 lt!326666) lt!326664)))

(assert (=> b!208907 (= lt!326666 (readBitPure!0 (_1!9618 lt!326680)))))

(declare-fun reader!0 (BitStream!8306 BitStream!8306) tuple2!17926)

(assert (=> b!208907 (= lt!326677 (reader!0 (_2!9616 lt!326667) (_2!9616 lt!326668)))))

(assert (=> b!208907 (= lt!326680 (reader!0 thiss!1204 (_2!9616 lt!326668)))))

(assert (=> b!208907 e!142663))

(declare-fun res!175344 () Bool)

(assert (=> b!208907 (=> (not res!175344) (not e!142663))))

(assert (=> b!208907 (= res!175344 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!326672))) (currentByte!9640 (_1!9617 lt!326672)) (currentBit!9635 (_1!9617 lt!326672))) (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!326665))) (currentByte!9640 (_1!9617 lt!326665)) (currentBit!9635 (_1!9617 lt!326665)))))))

(declare-fun lt!326671 () Unit!14870)

(declare-fun lt!326687 () BitStream!8306)

(declare-fun readBitPrefixLemma!0 (BitStream!8306 BitStream!8306) Unit!14870)

(assert (=> b!208907 (= lt!326671 (readBitPrefixLemma!0 lt!326687 (_2!9616 lt!326668)))))

(assert (=> b!208907 (= lt!326665 (readBitPure!0 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204))))))

(assert (=> b!208907 (= lt!326672 (readBitPure!0 lt!326687))))

(assert (=> b!208907 e!142669))

(declare-fun res!175338 () Bool)

(assert (=> b!208907 (=> (not res!175338) (not e!142669))))

(assert (=> b!208907 (= res!175338 (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(assert (=> b!208907 (= lt!326687 (BitStream!8307 (buf!5110 (_2!9616 lt!326667)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(declare-fun b!208908 () Bool)

(declare-fun lt!326676 () (_ BitVec 64))

(assert (=> b!208908 (= e!142667 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!326673))) (currentByte!9640 (_1!9617 lt!326673)) (currentBit!9635 (_1!9617 lt!326673))) lt!326676))))

(declare-fun b!208909 () Bool)

(declare-fun res!175335 () Bool)

(assert (=> b!208909 (=> res!175335 e!142670)))

(assert (=> b!208909 (= res!175335 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9618 lt!326680)))) ((_ sign_extend 32) (currentByte!9640 (_1!9618 lt!326680))) ((_ sign_extend 32) (currentBit!9635 (_1!9618 lt!326680))) lt!326669)))))

(declare-fun b!208910 () Bool)

(assert (=> b!208910 (= e!142664 e!142661)))

(declare-fun res!175349 () Bool)

(assert (=> b!208910 (=> (not res!175349) (not e!142661))))

(declare-fun lt!326684 () (_ BitVec 64))

(assert (=> b!208910 (= res!175349 (= lt!326676 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!326684)))))

(assert (=> b!208910 (= lt!326676 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(assert (=> b!208910 (= lt!326684 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(declare-fun b!208911 () Bool)

(declare-fun res!175340 () Bool)

(assert (=> b!208911 (=> (not res!175340) (not e!142661))))

(assert (=> b!208911 (= res!175340 (isPrefixOf!0 thiss!1204 (_2!9616 lt!326667)))))

(assert (= (and start!43864 res!175341) b!208902))

(assert (= (and b!208902 res!175333) b!208892))

(assert (= (and b!208892 res!175339) b!208900))

(assert (= (and b!208900 res!175343) b!208895))

(assert (= (and b!208895 res!175334) b!208910))

(assert (= (and b!208910 res!175349) b!208911))

(assert (= (and b!208911 res!175340) b!208901))

(assert (= (and b!208901 res!175345) b!208908))

(assert (= (and b!208895 (not res!175332)) b!208893))

(assert (= (and b!208893 (not res!175348)) b!208896))

(assert (= (and b!208896 (not res!175337)) b!208894))

(assert (= (and b!208894 (not res!175331)) b!208897))

(assert (= (and b!208897 (not res!175347)) b!208906))

(assert (= (and b!208906 (not res!175336)) b!208907))

(assert (= (and b!208907 res!175338) b!208905))

(assert (= (and b!208907 res!175344) b!208904))

(assert (= (and b!208907 (not res!175346)) b!208898))

(assert (= (and b!208898 (not res!175342)) b!208909))

(assert (= (and b!208909 (not res!175335)) b!208899))

(assert (= start!43864 b!208903))

(declare-fun m!321405 () Bool)

(assert (=> b!208897 m!321405))

(declare-fun m!321407 () Bool)

(assert (=> b!208892 m!321407))

(declare-fun m!321409 () Bool)

(assert (=> b!208908 m!321409))

(declare-fun m!321411 () Bool)

(assert (=> b!208902 m!321411))

(declare-fun m!321413 () Bool)

(assert (=> b!208911 m!321413))

(declare-fun m!321415 () Bool)

(assert (=> b!208901 m!321415))

(assert (=> b!208901 m!321415))

(declare-fun m!321417 () Bool)

(assert (=> b!208901 m!321417))

(declare-fun m!321419 () Bool)

(assert (=> b!208910 m!321419))

(declare-fun m!321421 () Bool)

(assert (=> b!208910 m!321421))

(declare-fun m!321423 () Bool)

(assert (=> b!208909 m!321423))

(declare-fun m!321425 () Bool)

(assert (=> start!43864 m!321425))

(assert (=> b!208906 m!321413))

(declare-fun m!321427 () Bool)

(assert (=> b!208893 m!321427))

(declare-fun m!321429 () Bool)

(assert (=> b!208893 m!321429))

(declare-fun m!321431 () Bool)

(assert (=> b!208893 m!321431))

(declare-fun m!321433 () Bool)

(assert (=> b!208893 m!321433))

(declare-fun m!321435 () Bool)

(assert (=> b!208899 m!321435))

(declare-fun m!321437 () Bool)

(assert (=> b!208896 m!321437))

(declare-fun m!321439 () Bool)

(assert (=> b!208903 m!321439))

(declare-fun m!321441 () Bool)

(assert (=> b!208905 m!321441))

(assert (=> b!208895 m!321419))

(assert (=> b!208895 m!321421))

(declare-fun m!321443 () Bool)

(assert (=> b!208895 m!321443))

(declare-fun m!321445 () Bool)

(assert (=> b!208907 m!321445))

(declare-fun m!321447 () Bool)

(assert (=> b!208907 m!321447))

(declare-fun m!321449 () Bool)

(assert (=> b!208907 m!321449))

(declare-fun m!321451 () Bool)

(assert (=> b!208907 m!321451))

(declare-fun m!321453 () Bool)

(assert (=> b!208907 m!321453))

(declare-fun m!321455 () Bool)

(assert (=> b!208907 m!321455))

(declare-fun m!321457 () Bool)

(assert (=> b!208907 m!321457))

(declare-fun m!321459 () Bool)

(assert (=> b!208907 m!321459))

(declare-fun m!321461 () Bool)

(assert (=> b!208907 m!321461))

(declare-fun m!321463 () Bool)

(assert (=> b!208907 m!321463))

(declare-fun m!321465 () Bool)

(assert (=> b!208907 m!321465))

(declare-fun m!321467 () Bool)

(assert (=> b!208907 m!321467))

(declare-fun m!321469 () Bool)

(assert (=> b!208907 m!321469))

(declare-fun m!321471 () Bool)

(assert (=> b!208907 m!321471))

(declare-fun m!321473 () Bool)

(assert (=> b!208907 m!321473))

(declare-fun m!321475 () Bool)

(assert (=> b!208907 m!321475))

(push 1)

(assert (not b!208897))

(assert (not b!208895))

(assert (not b!208892))

(assert (not b!208906))

(assert (not b!208911))

(assert (not b!208907))

(assert (not b!208909))

(assert (not b!208893))

(assert (not b!208910))

(assert (not start!43864))

(assert (not b!208899))

(assert (not b!208908))

(assert (not b!208896))

(assert (not b!208905))

(assert (not b!208903))

(assert (not b!208902))

(assert (not b!208901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70685 () Bool)

(declare-fun res!175440 () Bool)

(declare-fun e!142729 () Bool)

(assert (=> d!70685 (=> (not res!175440) (not e!142729))))

(assert (=> d!70685 (= res!175440 (= (size!4599 (buf!5110 thiss!1204)) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(assert (=> d!70685 (= (isPrefixOf!0 thiss!1204 (_2!9616 lt!326667)) e!142729)))

(declare-fun b!209015 () Bool)

(declare-fun res!175438 () Bool)

(assert (=> b!209015 (=> (not res!175438) (not e!142729))))

(assert (=> b!209015 (= res!175438 (bvsle (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667)))))))

(declare-fun b!209016 () Bool)

(declare-fun e!142730 () Bool)

(assert (=> b!209016 (= e!142729 e!142730)))

(declare-fun res!175439 () Bool)

(assert (=> b!209016 (=> res!175439 e!142730)))

(assert (=> b!209016 (= res!175439 (= (size!4599 (buf!5110 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209017 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10461 array!10461 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!209017 (= e!142730 (arrayBitRangesEq!0 (buf!5110 thiss!1204) (buf!5110 (_2!9616 lt!326667)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204))))))

(assert (= (and d!70685 res!175440) b!209015))

(assert (= (and b!209015 res!175438) b!209016))

(assert (= (and b!209016 (not res!175439)) b!209017))

(assert (=> b!209015 m!321421))

(assert (=> b!209015 m!321419))

(assert (=> b!209017 m!321421))

(assert (=> b!209017 m!321421))

(declare-fun m!321689 () Bool)

(assert (=> b!209017 m!321689))

(assert (=> b!208911 d!70685))

(declare-fun d!70687 () Bool)

(declare-fun e!142733 () Bool)

(assert (=> d!70687 e!142733))

(declare-fun res!175446 () Bool)

(assert (=> d!70687 (=> (not res!175446) (not e!142733))))

(declare-fun lt!326994 () (_ BitVec 64))

(declare-fun lt!326989 () (_ BitVec 64))

(declare-fun lt!326991 () (_ BitVec 64))

(assert (=> d!70687 (= res!175446 (= lt!326994 (bvsub lt!326989 lt!326991)))))

(assert (=> d!70687 (or (= (bvand lt!326989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326991 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326989 lt!326991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!70687 (= lt!326991 (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326667)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667)))))))

(declare-fun lt!326992 () (_ BitVec 64))

(declare-fun lt!326990 () (_ BitVec 64))

(assert (=> d!70687 (= lt!326989 (bvmul lt!326992 lt!326990))))

(assert (=> d!70687 (or (= lt!326992 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326990 (bvsdiv (bvmul lt!326992 lt!326990) lt!326992)))))

(assert (=> d!70687 (= lt!326990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70687 (= lt!326992 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(assert (=> d!70687 (= lt!326994 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667)))))))

(assert (=> d!70687 (invariant!0 (currentBit!9635 (_2!9616 lt!326667)) (currentByte!9640 (_2!9616 lt!326667)) (size!4599 (buf!5110 (_2!9616 lt!326667))))))

(assert (=> d!70687 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))) lt!326994)))

(declare-fun b!209022 () Bool)

(declare-fun res!175445 () Bool)

(assert (=> b!209022 (=> (not res!175445) (not e!142733))))

(assert (=> b!209022 (= res!175445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!326994))))

(declare-fun b!209023 () Bool)

(declare-fun lt!326993 () (_ BitVec 64))

(assert (=> b!209023 (= e!142733 (bvsle lt!326994 (bvmul lt!326993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209023 (or (= lt!326993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326993)))))

(assert (=> b!209023 (= lt!326993 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(assert (= (and d!70687 res!175446) b!209022))

(assert (= (and b!209022 res!175445) b!209023))

(declare-fun m!321691 () Bool)

(assert (=> d!70687 m!321691))

(declare-fun m!321693 () Bool)

(assert (=> d!70687 m!321693))

(assert (=> b!208910 d!70687))

(declare-fun d!70689 () Bool)

(declare-fun e!142734 () Bool)

(assert (=> d!70689 e!142734))

(declare-fun res!175448 () Bool)

(assert (=> d!70689 (=> (not res!175448) (not e!142734))))

(declare-fun lt!326997 () (_ BitVec 64))

(declare-fun lt!327000 () (_ BitVec 64))

(declare-fun lt!326995 () (_ BitVec 64))

(assert (=> d!70689 (= res!175448 (= lt!327000 (bvsub lt!326995 lt!326997)))))

(assert (=> d!70689 (or (= (bvand lt!326995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!326997 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!326995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!326995 lt!326997) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70689 (= lt!326997 (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204))))))

(declare-fun lt!326998 () (_ BitVec 64))

(declare-fun lt!326996 () (_ BitVec 64))

(assert (=> d!70689 (= lt!326995 (bvmul lt!326998 lt!326996))))

(assert (=> d!70689 (or (= lt!326998 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!326996 (bvsdiv (bvmul lt!326998 lt!326996) lt!326998)))))

(assert (=> d!70689 (= lt!326996 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70689 (= lt!326998 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))))))

(assert (=> d!70689 (= lt!327000 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9640 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9635 thiss!1204))))))

(assert (=> d!70689 (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 thiss!1204)))))

(assert (=> d!70689 (= (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)) lt!327000)))

(declare-fun b!209024 () Bool)

(declare-fun res!175447 () Bool)

(assert (=> b!209024 (=> (not res!175447) (not e!142734))))

(assert (=> b!209024 (= res!175447 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327000))))

(declare-fun b!209025 () Bool)

(declare-fun lt!326999 () (_ BitVec 64))

(assert (=> b!209025 (= e!142734 (bvsle lt!327000 (bvmul lt!326999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209025 (or (= lt!326999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!326999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!326999)))))

(assert (=> b!209025 (= lt!326999 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))))))

(assert (= (and d!70689 res!175448) b!209024))

(assert (= (and b!209024 res!175447) b!209025))

(declare-fun m!321695 () Bool)

(assert (=> d!70689 m!321695))

(assert (=> d!70689 m!321407))

(assert (=> b!208910 d!70689))

(declare-fun d!70691 () Bool)

(assert (=> d!70691 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 thiss!1204))))))

(declare-fun bs!17370 () Bool)

(assert (= bs!17370 d!70691))

(assert (=> bs!17370 m!321407))

(assert (=> start!43864 d!70691))

(declare-fun d!70693 () Bool)

(assert (=> d!70693 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!208899 d!70693))

(declare-fun d!70695 () Bool)

(assert (=> d!70695 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9618 lt!326680)))) ((_ sign_extend 32) (currentByte!9640 (_1!9618 lt!326680))) ((_ sign_extend 32) (currentBit!9635 (_1!9618 lt!326680))) lt!326669) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9618 lt!326680)))) ((_ sign_extend 32) (currentByte!9640 (_1!9618 lt!326680))) ((_ sign_extend 32) (currentBit!9635 (_1!9618 lt!326680)))) lt!326669))))

(declare-fun bs!17371 () Bool)

(assert (= bs!17371 d!70695))

(declare-fun m!321697 () Bool)

(assert (=> bs!17371 m!321697))

(assert (=> b!208909 d!70695))

(declare-fun d!70697 () Bool)

(declare-fun e!142735 () Bool)

(assert (=> d!70697 e!142735))

(declare-fun res!175450 () Bool)

(assert (=> d!70697 (=> (not res!175450) (not e!142735))))

(declare-fun lt!327006 () (_ BitVec 64))

(declare-fun lt!327001 () (_ BitVec 64))

(declare-fun lt!327003 () (_ BitVec 64))

(assert (=> d!70697 (= res!175450 (= lt!327006 (bvsub lt!327001 lt!327003)))))

(assert (=> d!70697 (or (= (bvand lt!327001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327003 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327001 lt!327003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70697 (= lt!327003 (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326673)))) ((_ sign_extend 32) (currentByte!9640 (_1!9617 lt!326673))) ((_ sign_extend 32) (currentBit!9635 (_1!9617 lt!326673)))))))

(declare-fun lt!327004 () (_ BitVec 64))

(declare-fun lt!327002 () (_ BitVec 64))

(assert (=> d!70697 (= lt!327001 (bvmul lt!327004 lt!327002))))

(assert (=> d!70697 (or (= lt!327004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327002 (bvsdiv (bvmul lt!327004 lt!327002) lt!327004)))))

(assert (=> d!70697 (= lt!327002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70697 (= lt!327004 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326673)))))))

(assert (=> d!70697 (= lt!327006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9640 (_1!9617 lt!326673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9635 (_1!9617 lt!326673)))))))

(assert (=> d!70697 (invariant!0 (currentBit!9635 (_1!9617 lt!326673)) (currentByte!9640 (_1!9617 lt!326673)) (size!4599 (buf!5110 (_1!9617 lt!326673))))))

(assert (=> d!70697 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!326673))) (currentByte!9640 (_1!9617 lt!326673)) (currentBit!9635 (_1!9617 lt!326673))) lt!327006)))

(declare-fun b!209026 () Bool)

(declare-fun res!175449 () Bool)

(assert (=> b!209026 (=> (not res!175449) (not e!142735))))

(assert (=> b!209026 (= res!175449 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327006))))

(declare-fun b!209027 () Bool)

(declare-fun lt!327005 () (_ BitVec 64))

(assert (=> b!209027 (= e!142735 (bvsle lt!327006 (bvmul lt!327005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209027 (or (= lt!327005 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327005 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327005)))))

(assert (=> b!209027 (= lt!327005 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326673)))))))

(assert (= (and d!70697 res!175450) b!209026))

(assert (= (and b!209026 res!175449) b!209027))

(declare-fun m!321699 () Bool)

(assert (=> d!70697 m!321699))

(declare-fun m!321701 () Bool)

(assert (=> d!70697 m!321701))

(assert (=> b!208908 d!70697))

(declare-fun d!70699 () Bool)

(declare-fun res!175453 () Bool)

(declare-fun e!142736 () Bool)

(assert (=> d!70699 (=> (not res!175453) (not e!142736))))

(assert (=> d!70699 (= res!175453 (= (size!4599 (buf!5110 (_2!9616 lt!326667))) (size!4599 (buf!5110 (_2!9616 lt!326668)))))))

(assert (=> d!70699 (= (isPrefixOf!0 (_2!9616 lt!326667) (_2!9616 lt!326668)) e!142736)))

(declare-fun b!209028 () Bool)

(declare-fun res!175451 () Bool)

(assert (=> b!209028 (=> (not res!175451) (not e!142736))))

(assert (=> b!209028 (= res!175451 (bvsle (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326668))) (currentByte!9640 (_2!9616 lt!326668)) (currentBit!9635 (_2!9616 lt!326668)))))))

(declare-fun b!209029 () Bool)

(declare-fun e!142737 () Bool)

(assert (=> b!209029 (= e!142736 e!142737)))

(declare-fun res!175452 () Bool)

(assert (=> b!209029 (=> res!175452 e!142737)))

(assert (=> b!209029 (= res!175452 (= (size!4599 (buf!5110 (_2!9616 lt!326667))) #b00000000000000000000000000000000))))

(declare-fun b!209030 () Bool)

(assert (=> b!209030 (= e!142737 (arrayBitRangesEq!0 (buf!5110 (_2!9616 lt!326667)) (buf!5110 (_2!9616 lt!326668)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667)))))))

(assert (= (and d!70699 res!175453) b!209028))

(assert (= (and b!209028 res!175451) b!209029))

(assert (= (and b!209029 (not res!175452)) b!209030))

(assert (=> b!209028 m!321419))

(assert (=> b!209028 m!321427))

(assert (=> b!209030 m!321419))

(assert (=> b!209030 m!321419))

(declare-fun m!321703 () Bool)

(assert (=> b!209030 m!321703))

(assert (=> b!208897 d!70699))

(declare-fun d!70701 () Bool)

(assert (=> d!70701 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!326670) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667)))) lt!326670))))

(declare-fun bs!17372 () Bool)

(assert (= bs!17372 d!70701))

(declare-fun m!321705 () Bool)

(assert (=> bs!17372 m!321705))

(assert (=> b!208907 d!70701))

(declare-fun b!209041 () Bool)

(declare-fun e!142742 () Unit!14870)

(declare-fun lt!327062 () Unit!14870)

(assert (=> b!209041 (= e!142742 lt!327062)))

(declare-fun lt!327054 () (_ BitVec 64))

(assert (=> b!209041 (= lt!327054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!327059 () (_ BitVec 64))

(assert (=> b!209041 (= lt!327059 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!10461 array!10461 (_ BitVec 64) (_ BitVec 64)) Unit!14870)

(assert (=> b!209041 (= lt!327062 (arrayBitRangesEqSymmetric!0 (buf!5110 (_2!9616 lt!326667)) (buf!5110 (_2!9616 lt!326668)) lt!327054 lt!327059))))

(assert (=> b!209041 (arrayBitRangesEq!0 (buf!5110 (_2!9616 lt!326668)) (buf!5110 (_2!9616 lt!326667)) lt!327054 lt!327059)))

(declare-fun d!70703 () Bool)

(declare-fun e!142743 () Bool)

(assert (=> d!70703 e!142743))

(declare-fun res!175462 () Bool)

(assert (=> d!70703 (=> (not res!175462) (not e!142743))))

(declare-fun lt!327058 () tuple2!17926)

(assert (=> d!70703 (= res!175462 (isPrefixOf!0 (_1!9618 lt!327058) (_2!9618 lt!327058)))))

(declare-fun lt!327050 () BitStream!8306)

(assert (=> d!70703 (= lt!327058 (tuple2!17927 lt!327050 (_2!9616 lt!326668)))))

(declare-fun lt!327055 () Unit!14870)

(declare-fun lt!327065 () Unit!14870)

(assert (=> d!70703 (= lt!327055 lt!327065)))

(assert (=> d!70703 (isPrefixOf!0 lt!327050 (_2!9616 lt!326668))))

(assert (=> d!70703 (= lt!327065 (lemmaIsPrefixTransitive!0 lt!327050 (_2!9616 lt!326668) (_2!9616 lt!326668)))))

(declare-fun lt!327066 () Unit!14870)

(declare-fun lt!327052 () Unit!14870)

(assert (=> d!70703 (= lt!327066 lt!327052)))

(assert (=> d!70703 (isPrefixOf!0 lt!327050 (_2!9616 lt!326668))))

(assert (=> d!70703 (= lt!327052 (lemmaIsPrefixTransitive!0 lt!327050 (_2!9616 lt!326667) (_2!9616 lt!326668)))))

(declare-fun lt!327064 () Unit!14870)

(assert (=> d!70703 (= lt!327064 e!142742)))

(declare-fun c!10279 () Bool)

(assert (=> d!70703 (= c!10279 (not (= (size!4599 (buf!5110 (_2!9616 lt!326667))) #b00000000000000000000000000000000)))))

(declare-fun lt!327057 () Unit!14870)

(declare-fun lt!327047 () Unit!14870)

(assert (=> d!70703 (= lt!327057 lt!327047)))

(assert (=> d!70703 (isPrefixOf!0 (_2!9616 lt!326668) (_2!9616 lt!326668))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8306) Unit!14870)

(assert (=> d!70703 (= lt!327047 (lemmaIsPrefixRefl!0 (_2!9616 lt!326668)))))

(declare-fun lt!327056 () Unit!14870)

(declare-fun lt!327049 () Unit!14870)

(assert (=> d!70703 (= lt!327056 lt!327049)))

(assert (=> d!70703 (= lt!327049 (lemmaIsPrefixRefl!0 (_2!9616 lt!326668)))))

(declare-fun lt!327063 () Unit!14870)

(declare-fun lt!327048 () Unit!14870)

(assert (=> d!70703 (= lt!327063 lt!327048)))

(assert (=> d!70703 (isPrefixOf!0 lt!327050 lt!327050)))

(assert (=> d!70703 (= lt!327048 (lemmaIsPrefixRefl!0 lt!327050))))

(declare-fun lt!327061 () Unit!14870)

(declare-fun lt!327053 () Unit!14870)

(assert (=> d!70703 (= lt!327061 lt!327053)))

(assert (=> d!70703 (isPrefixOf!0 (_2!9616 lt!326667) (_2!9616 lt!326667))))

(assert (=> d!70703 (= lt!327053 (lemmaIsPrefixRefl!0 (_2!9616 lt!326667)))))

(assert (=> d!70703 (= lt!327050 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(assert (=> d!70703 (isPrefixOf!0 (_2!9616 lt!326667) (_2!9616 lt!326668))))

(assert (=> d!70703 (= (reader!0 (_2!9616 lt!326667) (_2!9616 lt!326668)) lt!327058)))

(declare-fun b!209042 () Bool)

(declare-fun res!175460 () Bool)

(assert (=> b!209042 (=> (not res!175460) (not e!142743))))

(assert (=> b!209042 (= res!175460 (isPrefixOf!0 (_2!9618 lt!327058) (_2!9616 lt!326668)))))

(declare-fun b!209043 () Bool)

(declare-fun res!175461 () Bool)

(assert (=> b!209043 (=> (not res!175461) (not e!142743))))

(assert (=> b!209043 (= res!175461 (isPrefixOf!0 (_1!9618 lt!327058) (_2!9616 lt!326667)))))

(declare-fun b!209044 () Bool)

(declare-fun Unit!14898 () Unit!14870)

(assert (=> b!209044 (= e!142742 Unit!14898)))

(declare-fun b!209045 () Bool)

(declare-fun lt!327060 () (_ BitVec 64))

(declare-fun lt!327051 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8306 (_ BitVec 64)) BitStream!8306)

(assert (=> b!209045 (= e!142743 (= (_1!9618 lt!327058) (withMovedBitIndex!0 (_2!9618 lt!327058) (bvsub lt!327060 lt!327051))))))

(assert (=> b!209045 (or (= (bvand lt!327060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327051 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327060 lt!327051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209045 (= lt!327051 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326668))) (currentByte!9640 (_2!9616 lt!326668)) (currentBit!9635 (_2!9616 lt!326668))))))

(assert (=> b!209045 (= lt!327060 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(assert (= (and d!70703 c!10279) b!209041))

(assert (= (and d!70703 (not c!10279)) b!209044))

(assert (= (and d!70703 res!175462) b!209043))

(assert (= (and b!209043 res!175461) b!209042))

(assert (= (and b!209042 res!175460) b!209045))

(declare-fun m!321707 () Bool)

(assert (=> b!209042 m!321707))

(declare-fun m!321709 () Bool)

(assert (=> d!70703 m!321709))

(declare-fun m!321711 () Bool)

(assert (=> d!70703 m!321711))

(declare-fun m!321713 () Bool)

(assert (=> d!70703 m!321713))

(declare-fun m!321715 () Bool)

(assert (=> d!70703 m!321715))

(declare-fun m!321717 () Bool)

(assert (=> d!70703 m!321717))

(declare-fun m!321719 () Bool)

(assert (=> d!70703 m!321719))

(declare-fun m!321721 () Bool)

(assert (=> d!70703 m!321721))

(declare-fun m!321723 () Bool)

(assert (=> d!70703 m!321723))

(declare-fun m!321725 () Bool)

(assert (=> d!70703 m!321725))

(declare-fun m!321727 () Bool)

(assert (=> d!70703 m!321727))

(assert (=> d!70703 m!321405))

(declare-fun m!321729 () Bool)

(assert (=> b!209043 m!321729))

(declare-fun m!321731 () Bool)

(assert (=> b!209045 m!321731))

(assert (=> b!209045 m!321427))

(assert (=> b!209045 m!321419))

(assert (=> b!209041 m!321419))

(declare-fun m!321733 () Bool)

(assert (=> b!209041 m!321733))

(declare-fun m!321735 () Bool)

(assert (=> b!209041 m!321735))

(assert (=> b!208907 d!70703))

(declare-datatypes ((tuple2!17938 0))(
  ( (tuple2!17939 (_1!9624 (_ BitVec 64)) (_2!9624 BitStream!8306)) )
))
(declare-fun lt!327069 () tuple2!17938)

(declare-fun d!70705 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17938)

(assert (=> d!70705 (= lt!327069 (readNBitsLSBFirstsLoop!0 (_1!9618 lt!326680) nBits!348 i!590 lt!326681))))

(assert (=> d!70705 (= (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!326680) nBits!348 i!590 lt!326681) (tuple2!17929 (_2!9624 lt!327069) (_1!9624 lt!327069)))))

(declare-fun bs!17373 () Bool)

(assert (= bs!17373 d!70705))

(declare-fun m!321737 () Bool)

(assert (=> bs!17373 m!321737))

(assert (=> b!208907 d!70705))

(declare-fun d!70707 () Bool)

(assert (=> d!70707 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204)) lt!326669)))

(declare-fun lt!327072 () Unit!14870)

(declare-fun choose!9 (BitStream!8306 array!10461 (_ BitVec 64) BitStream!8306) Unit!14870)

(assert (=> d!70707 (= lt!327072 (choose!9 thiss!1204 (buf!5110 (_2!9616 lt!326668)) lt!326669 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204))))))

(assert (=> d!70707 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5110 (_2!9616 lt!326668)) lt!326669) lt!327072)))

(declare-fun bs!17374 () Bool)

(assert (= bs!17374 d!70707))

(assert (=> bs!17374 m!321445))

(declare-fun m!321739 () Bool)

(assert (=> bs!17374 m!321739))

(assert (=> b!208907 d!70707))

(declare-fun lt!327073 () tuple2!17938)

(declare-fun d!70709 () Bool)

(assert (=> d!70709 (= lt!327073 (readNBitsLSBFirstsLoop!0 (_1!9618 lt!326677) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326681 (ite (_2!9617 lt!326666) lt!326674 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!70709 (= (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!326677) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvor lt!326681 (ite (_2!9617 lt!326666) lt!326674 #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!17929 (_2!9624 lt!327073) (_1!9624 lt!327073)))))

(declare-fun bs!17375 () Bool)

(assert (= bs!17375 d!70709))

(declare-fun m!321741 () Bool)

(assert (=> bs!17375 m!321741))

(assert (=> b!208907 d!70709))

(declare-fun d!70711 () Bool)

(declare-datatypes ((tuple2!17940 0))(
  ( (tuple2!17941 (_1!9625 Bool) (_2!9625 BitStream!8306)) )
))
(declare-fun lt!327076 () tuple2!17940)

(declare-fun readBit!0 (BitStream!8306) tuple2!17940)

(assert (=> d!70711 (= lt!327076 (readBit!0 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204))))))

(assert (=> d!70711 (= (readBitPure!0 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204))) (tuple2!17925 (_2!9625 lt!327076) (_1!9625 lt!327076)))))

(declare-fun bs!17376 () Bool)

(assert (= bs!17376 d!70711))

(declare-fun m!321743 () Bool)

(assert (=> bs!17376 m!321743))

(assert (=> b!208907 d!70711))

(declare-fun d!70713 () Bool)

(assert (=> d!70713 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204)) lt!326669) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204))) lt!326669))))

(declare-fun bs!17377 () Bool)

(assert (= bs!17377 d!70713))

(declare-fun m!321745 () Bool)

(assert (=> bs!17377 m!321745))

(assert (=> b!208907 d!70713))

(declare-fun d!70715 () Bool)

(assert (=> d!70715 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!208907 d!70715))

(declare-fun d!70717 () Bool)

(declare-fun lt!327077 () tuple2!17940)

(assert (=> d!70717 (= lt!327077 (readBit!0 (_1!9618 lt!326680)))))

(assert (=> d!70717 (= (readBitPure!0 (_1!9618 lt!326680)) (tuple2!17925 (_2!9625 lt!327077) (_1!9625 lt!327077)))))

(declare-fun bs!17378 () Bool)

(assert (= bs!17378 d!70717))

(declare-fun m!321747 () Bool)

(assert (=> bs!17378 m!321747))

(assert (=> b!208907 d!70717))

(declare-fun b!209046 () Bool)

(declare-fun e!142744 () Unit!14870)

(declare-fun lt!327093 () Unit!14870)

(assert (=> b!209046 (= e!142744 lt!327093)))

(declare-fun lt!327085 () (_ BitVec 64))

(assert (=> b!209046 (= lt!327085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!327090 () (_ BitVec 64))

(assert (=> b!209046 (= lt!327090 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(assert (=> b!209046 (= lt!327093 (arrayBitRangesEqSymmetric!0 (buf!5110 thiss!1204) (buf!5110 (_2!9616 lt!326668)) lt!327085 lt!327090))))

(assert (=> b!209046 (arrayBitRangesEq!0 (buf!5110 (_2!9616 lt!326668)) (buf!5110 thiss!1204) lt!327085 lt!327090)))

(declare-fun d!70719 () Bool)

(declare-fun e!142745 () Bool)

(assert (=> d!70719 e!142745))

(declare-fun res!175465 () Bool)

(assert (=> d!70719 (=> (not res!175465) (not e!142745))))

(declare-fun lt!327089 () tuple2!17926)

(assert (=> d!70719 (= res!175465 (isPrefixOf!0 (_1!9618 lt!327089) (_2!9618 lt!327089)))))

(declare-fun lt!327081 () BitStream!8306)

(assert (=> d!70719 (= lt!327089 (tuple2!17927 lt!327081 (_2!9616 lt!326668)))))

(declare-fun lt!327086 () Unit!14870)

(declare-fun lt!327096 () Unit!14870)

(assert (=> d!70719 (= lt!327086 lt!327096)))

(assert (=> d!70719 (isPrefixOf!0 lt!327081 (_2!9616 lt!326668))))

(assert (=> d!70719 (= lt!327096 (lemmaIsPrefixTransitive!0 lt!327081 (_2!9616 lt!326668) (_2!9616 lt!326668)))))

(declare-fun lt!327097 () Unit!14870)

(declare-fun lt!327083 () Unit!14870)

(assert (=> d!70719 (= lt!327097 lt!327083)))

(assert (=> d!70719 (isPrefixOf!0 lt!327081 (_2!9616 lt!326668))))

(assert (=> d!70719 (= lt!327083 (lemmaIsPrefixTransitive!0 lt!327081 thiss!1204 (_2!9616 lt!326668)))))

(declare-fun lt!327095 () Unit!14870)

(assert (=> d!70719 (= lt!327095 e!142744)))

(declare-fun c!10280 () Bool)

(assert (=> d!70719 (= c!10280 (not (= (size!4599 (buf!5110 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!327088 () Unit!14870)

(declare-fun lt!327078 () Unit!14870)

(assert (=> d!70719 (= lt!327088 lt!327078)))

(assert (=> d!70719 (isPrefixOf!0 (_2!9616 lt!326668) (_2!9616 lt!326668))))

(assert (=> d!70719 (= lt!327078 (lemmaIsPrefixRefl!0 (_2!9616 lt!326668)))))

(declare-fun lt!327087 () Unit!14870)

(declare-fun lt!327080 () Unit!14870)

(assert (=> d!70719 (= lt!327087 lt!327080)))

(assert (=> d!70719 (= lt!327080 (lemmaIsPrefixRefl!0 (_2!9616 lt!326668)))))

(declare-fun lt!327094 () Unit!14870)

(declare-fun lt!327079 () Unit!14870)

(assert (=> d!70719 (= lt!327094 lt!327079)))

(assert (=> d!70719 (isPrefixOf!0 lt!327081 lt!327081)))

(assert (=> d!70719 (= lt!327079 (lemmaIsPrefixRefl!0 lt!327081))))

(declare-fun lt!327092 () Unit!14870)

(declare-fun lt!327084 () Unit!14870)

(assert (=> d!70719 (= lt!327092 lt!327084)))

(assert (=> d!70719 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!70719 (= lt!327084 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!70719 (= lt!327081 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(assert (=> d!70719 (isPrefixOf!0 thiss!1204 (_2!9616 lt!326668))))

(assert (=> d!70719 (= (reader!0 thiss!1204 (_2!9616 lt!326668)) lt!327089)))

(declare-fun b!209047 () Bool)

(declare-fun res!175463 () Bool)

(assert (=> b!209047 (=> (not res!175463) (not e!142745))))

(assert (=> b!209047 (= res!175463 (isPrefixOf!0 (_2!9618 lt!327089) (_2!9616 lt!326668)))))

(declare-fun b!209048 () Bool)

(declare-fun res!175464 () Bool)

(assert (=> b!209048 (=> (not res!175464) (not e!142745))))

(assert (=> b!209048 (= res!175464 (isPrefixOf!0 (_1!9618 lt!327089) thiss!1204))))

(declare-fun b!209049 () Bool)

(declare-fun Unit!14899 () Unit!14870)

(assert (=> b!209049 (= e!142744 Unit!14899)))

(declare-fun lt!327082 () (_ BitVec 64))

(declare-fun lt!327091 () (_ BitVec 64))

(declare-fun b!209050 () Bool)

(assert (=> b!209050 (= e!142745 (= (_1!9618 lt!327089) (withMovedBitIndex!0 (_2!9618 lt!327089) (bvsub lt!327091 lt!327082))))))

(assert (=> b!209050 (or (= (bvand lt!327091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327082 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327091 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327091 lt!327082) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209050 (= lt!327082 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326668))) (currentByte!9640 (_2!9616 lt!326668)) (currentBit!9635 (_2!9616 lt!326668))))))

(assert (=> b!209050 (= lt!327091 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(assert (= (and d!70719 c!10280) b!209046))

(assert (= (and d!70719 (not c!10280)) b!209049))

(assert (= (and d!70719 res!175465) b!209048))

(assert (= (and b!209048 res!175464) b!209047))

(assert (= (and b!209047 res!175463) b!209050))

(declare-fun m!321749 () Bool)

(assert (=> b!209047 m!321749))

(declare-fun m!321751 () Bool)

(assert (=> d!70719 m!321751))

(declare-fun m!321753 () Bool)

(assert (=> d!70719 m!321753))

(assert (=> d!70719 m!321713))

(declare-fun m!321755 () Bool)

(assert (=> d!70719 m!321755))

(declare-fun m!321757 () Bool)

(assert (=> d!70719 m!321757))

(declare-fun m!321759 () Bool)

(assert (=> d!70719 m!321759))

(declare-fun m!321761 () Bool)

(assert (=> d!70719 m!321761))

(declare-fun m!321763 () Bool)

(assert (=> d!70719 m!321763))

(assert (=> d!70719 m!321725))

(declare-fun m!321765 () Bool)

(assert (=> d!70719 m!321765))

(assert (=> d!70719 m!321429))

(declare-fun m!321767 () Bool)

(assert (=> b!209048 m!321767))

(declare-fun m!321769 () Bool)

(assert (=> b!209050 m!321769))

(assert (=> b!209050 m!321427))

(assert (=> b!209050 m!321421))

(assert (=> b!209046 m!321421))

(declare-fun m!321771 () Bool)

(assert (=> b!209046 m!321771))

(declare-fun m!321773 () Bool)

(assert (=> b!209046 m!321773))

(assert (=> b!208907 d!70719))

(declare-fun d!70721 () Bool)

(declare-fun e!142748 () Bool)

(assert (=> d!70721 e!142748))

(declare-fun res!175468 () Bool)

(assert (=> d!70721 (=> (not res!175468) (not e!142748))))

(declare-fun lt!327109 () tuple2!17924)

(declare-fun lt!327108 () tuple2!17924)

(assert (=> d!70721 (= res!175468 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!327109))) (currentByte!9640 (_1!9617 lt!327109)) (currentBit!9635 (_1!9617 lt!327109))) (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!327108))) (currentByte!9640 (_1!9617 lt!327108)) (currentBit!9635 (_1!9617 lt!327108)))))))

(declare-fun lt!327106 () BitStream!8306)

(declare-fun lt!327107 () Unit!14870)

(declare-fun choose!50 (BitStream!8306 BitStream!8306 BitStream!8306 tuple2!17924 tuple2!17924 BitStream!8306 Bool tuple2!17924 tuple2!17924 BitStream!8306 Bool) Unit!14870)

(assert (=> d!70721 (= lt!327107 (choose!50 lt!326687 (_2!9616 lt!326668) lt!327106 lt!327109 (tuple2!17925 (_1!9617 lt!327109) (_2!9617 lt!327109)) (_1!9617 lt!327109) (_2!9617 lt!327109) lt!327108 (tuple2!17925 (_1!9617 lt!327108) (_2!9617 lt!327108)) (_1!9617 lt!327108) (_2!9617 lt!327108)))))

(assert (=> d!70721 (= lt!327108 (readBitPure!0 lt!327106))))

(assert (=> d!70721 (= lt!327109 (readBitPure!0 lt!326687))))

(assert (=> d!70721 (= lt!327106 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 lt!326687) (currentBit!9635 lt!326687)))))

(assert (=> d!70721 (invariant!0 (currentBit!9635 lt!326687) (currentByte!9640 lt!326687) (size!4599 (buf!5110 (_2!9616 lt!326668))))))

(assert (=> d!70721 (= (readBitPrefixLemma!0 lt!326687 (_2!9616 lt!326668)) lt!327107)))

(declare-fun b!209053 () Bool)

(assert (=> b!209053 (= e!142748 (= (_2!9617 lt!327109) (_2!9617 lt!327108)))))

(assert (= (and d!70721 res!175468) b!209053))

(declare-fun m!321775 () Bool)

(assert (=> d!70721 m!321775))

(declare-fun m!321777 () Bool)

(assert (=> d!70721 m!321777))

(assert (=> d!70721 m!321459))

(declare-fun m!321779 () Bool)

(assert (=> d!70721 m!321779))

(declare-fun m!321781 () Bool)

(assert (=> d!70721 m!321781))

(declare-fun m!321783 () Bool)

(assert (=> d!70721 m!321783))

(assert (=> b!208907 d!70721))

(declare-fun d!70723 () Bool)

(assert (=> d!70723 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!326670)))

(declare-fun lt!327110 () Unit!14870)

(assert (=> d!70723 (= lt!327110 (choose!9 (_2!9616 lt!326667) (buf!5110 (_2!9616 lt!326668)) lt!326670 (BitStream!8307 (buf!5110 (_2!9616 lt!326668)) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667)))))))

(assert (=> d!70723 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9616 lt!326667) (buf!5110 (_2!9616 lt!326668)) lt!326670) lt!327110)))

(declare-fun bs!17379 () Bool)

(assert (= bs!17379 d!70723))

(assert (=> bs!17379 m!321463))

(declare-fun m!321785 () Bool)

(assert (=> bs!17379 m!321785))

(assert (=> b!208907 d!70723))

(declare-fun d!70725 () Bool)

(declare-fun lt!327111 () tuple2!17940)

(assert (=> d!70725 (= lt!327111 (readBit!0 lt!326687))))

(assert (=> d!70725 (= (readBitPure!0 lt!326687) (tuple2!17925 (_2!9625 lt!327111) (_1!9625 lt!327111)))))

(declare-fun bs!17380 () Bool)

(assert (= bs!17380 d!70725))

(declare-fun m!321787 () Bool)

(assert (=> bs!17380 m!321787))

(assert (=> b!208907 d!70725))

(declare-fun d!70727 () Bool)

(assert (=> d!70727 (= (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326667)))) (and (bvsge (currentBit!9635 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9635 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9640 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326667)))) (and (= (currentBit!9635 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326667))))))))))

(assert (=> b!208907 d!70727))

(declare-fun d!70729 () Bool)

(declare-fun e!142749 () Bool)

(assert (=> d!70729 e!142749))

(declare-fun res!175470 () Bool)

(assert (=> d!70729 (=> (not res!175470) (not e!142749))))

(declare-fun lt!327117 () (_ BitVec 64))

(declare-fun lt!327112 () (_ BitVec 64))

(declare-fun lt!327114 () (_ BitVec 64))

(assert (=> d!70729 (= res!175470 (= lt!327117 (bvsub lt!327112 lt!327114)))))

(assert (=> d!70729 (or (= (bvand lt!327112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327114 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327112 lt!327114) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70729 (= lt!327114 (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326665)))) ((_ sign_extend 32) (currentByte!9640 (_1!9617 lt!326665))) ((_ sign_extend 32) (currentBit!9635 (_1!9617 lt!326665)))))))

(declare-fun lt!327115 () (_ BitVec 64))

(declare-fun lt!327113 () (_ BitVec 64))

(assert (=> d!70729 (= lt!327112 (bvmul lt!327115 lt!327113))))

(assert (=> d!70729 (or (= lt!327115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327113 (bvsdiv (bvmul lt!327115 lt!327113) lt!327115)))))

(assert (=> d!70729 (= lt!327113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70729 (= lt!327115 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326665)))))))

(assert (=> d!70729 (= lt!327117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9640 (_1!9617 lt!326665))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9635 (_1!9617 lt!326665)))))))

(assert (=> d!70729 (invariant!0 (currentBit!9635 (_1!9617 lt!326665)) (currentByte!9640 (_1!9617 lt!326665)) (size!4599 (buf!5110 (_1!9617 lt!326665))))))

(assert (=> d!70729 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!326665))) (currentByte!9640 (_1!9617 lt!326665)) (currentBit!9635 (_1!9617 lt!326665))) lt!327117)))

(declare-fun b!209054 () Bool)

(declare-fun res!175469 () Bool)

(assert (=> b!209054 (=> (not res!175469) (not e!142749))))

(assert (=> b!209054 (= res!175469 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327117))))

(declare-fun b!209055 () Bool)

(declare-fun lt!327116 () (_ BitVec 64))

(assert (=> b!209055 (= e!142749 (bvsle lt!327117 (bvmul lt!327116 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209055 (or (= lt!327116 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327116 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327116)))))

(assert (=> b!209055 (= lt!327116 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326665)))))))

(assert (= (and d!70729 res!175470) b!209054))

(assert (= (and b!209054 res!175469) b!209055))

(declare-fun m!321789 () Bool)

(assert (=> d!70729 m!321789))

(declare-fun m!321791 () Bool)

(assert (=> d!70729 m!321791))

(assert (=> b!208907 d!70729))

(declare-fun d!70731 () Bool)

(declare-fun e!142750 () Bool)

(assert (=> d!70731 e!142750))

(declare-fun res!175472 () Bool)

(assert (=> d!70731 (=> (not res!175472) (not e!142750))))

(declare-fun lt!327120 () (_ BitVec 64))

(declare-fun lt!327118 () (_ BitVec 64))

(declare-fun lt!327123 () (_ BitVec 64))

(assert (=> d!70731 (= res!175472 (= lt!327123 (bvsub lt!327118 lt!327120)))))

(assert (=> d!70731 (or (= (bvand lt!327118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327118 lt!327120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70731 (= lt!327120 (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326672)))) ((_ sign_extend 32) (currentByte!9640 (_1!9617 lt!326672))) ((_ sign_extend 32) (currentBit!9635 (_1!9617 lt!326672)))))))

(declare-fun lt!327121 () (_ BitVec 64))

(declare-fun lt!327119 () (_ BitVec 64))

(assert (=> d!70731 (= lt!327118 (bvmul lt!327121 lt!327119))))

(assert (=> d!70731 (or (= lt!327121 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327119 (bvsdiv (bvmul lt!327121 lt!327119) lt!327121)))))

(assert (=> d!70731 (= lt!327119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70731 (= lt!327121 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326672)))))))

(assert (=> d!70731 (= lt!327123 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9640 (_1!9617 lt!326672))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9635 (_1!9617 lt!326672)))))))

(assert (=> d!70731 (invariant!0 (currentBit!9635 (_1!9617 lt!326672)) (currentByte!9640 (_1!9617 lt!326672)) (size!4599 (buf!5110 (_1!9617 lt!326672))))))

(assert (=> d!70731 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!326672))) (currentByte!9640 (_1!9617 lt!326672)) (currentBit!9635 (_1!9617 lt!326672))) lt!327123)))

(declare-fun b!209056 () Bool)

(declare-fun res!175471 () Bool)

(assert (=> b!209056 (=> (not res!175471) (not e!142750))))

(assert (=> b!209056 (= res!175471 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327123))))

(declare-fun b!209057 () Bool)

(declare-fun lt!327122 () (_ BitVec 64))

(assert (=> b!209057 (= e!142750 (bvsle lt!327123 (bvmul lt!327122 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209057 (or (= lt!327122 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327122 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327122)))))

(assert (=> b!209057 (= lt!327122 ((_ sign_extend 32) (size!4599 (buf!5110 (_1!9617 lt!326672)))))))

(assert (= (and d!70731 res!175472) b!209056))

(assert (= (and b!209056 res!175471) b!209057))

(declare-fun m!321793 () Bool)

(assert (=> d!70731 m!321793))

(declare-fun m!321795 () Bool)

(assert (=> d!70731 m!321795))

(assert (=> b!208907 d!70731))

(declare-fun d!70733 () Bool)

(assert (=> d!70733 (= (invariant!0 (currentBit!9635 (_2!9616 lt!326668)) (currentByte!9640 (_2!9616 lt!326668)) (size!4599 (buf!5110 (_2!9616 lt!326668)))) (and (bvsge (currentBit!9635 (_2!9616 lt!326668)) #b00000000000000000000000000000000) (bvslt (currentBit!9635 (_2!9616 lt!326668)) #b00000000000000000000000000001000) (bvsge (currentByte!9640 (_2!9616 lt!326668)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9640 (_2!9616 lt!326668)) (size!4599 (buf!5110 (_2!9616 lt!326668)))) (and (= (currentBit!9635 (_2!9616 lt!326668)) #b00000000000000000000000000000000) (= (currentByte!9640 (_2!9616 lt!326668)) (size!4599 (buf!5110 (_2!9616 lt!326668))))))))))

(assert (=> b!208896 d!70733))

(assert (=> b!208906 d!70685))

(assert (=> b!208895 d!70687))

(assert (=> b!208895 d!70689))

(declare-fun d!70735 () Bool)

(declare-fun e!142755 () Bool)

(assert (=> d!70735 e!142755))

(declare-fun res!175481 () Bool)

(assert (=> d!70735 (=> (not res!175481) (not e!142755))))

(declare-fun lt!327134 () tuple2!17922)

(assert (=> d!70735 (= res!175481 (= (size!4599 (buf!5110 thiss!1204)) (size!4599 (buf!5110 (_2!9616 lt!327134)))))))

(declare-fun choose!16 (BitStream!8306 Bool) tuple2!17922)

(assert (=> d!70735 (= lt!327134 (choose!16 thiss!1204 lt!326664))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!70735 (validate_offset_bit!0 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204)))))

(assert (=> d!70735 (= (appendBit!0 thiss!1204 lt!326664) lt!327134)))

(declare-fun b!209069 () Bool)

(declare-fun e!142756 () Bool)

(assert (=> b!209069 (= e!142755 e!142756)))

(declare-fun res!175482 () Bool)

(assert (=> b!209069 (=> (not res!175482) (not e!142756))))

(declare-fun lt!327133 () tuple2!17924)

(assert (=> b!209069 (= res!175482 (and (= (_2!9617 lt!327133) lt!326664) (= (_1!9617 lt!327133) (_2!9616 lt!327134))))))

(assert (=> b!209069 (= lt!327133 (readBitPure!0 (readerFrom!0 (_2!9616 lt!327134) (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204))))))

(declare-fun b!209067 () Bool)

(declare-fun res!175484 () Bool)

(assert (=> b!209067 (=> (not res!175484) (not e!142755))))

(declare-fun lt!327132 () (_ BitVec 64))

(declare-fun lt!327135 () (_ BitVec 64))

(assert (=> b!209067 (= res!175484 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327134))) (currentByte!9640 (_2!9616 lt!327134)) (currentBit!9635 (_2!9616 lt!327134))) (bvadd lt!327135 lt!327132)))))

(assert (=> b!209067 (or (not (= (bvand lt!327135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327132 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!327135 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!327135 lt!327132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209067 (= lt!327132 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!209067 (= lt!327135 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(declare-fun b!209070 () Bool)

(assert (=> b!209070 (= e!142756 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!327133))) (currentByte!9640 (_1!9617 lt!327133)) (currentBit!9635 (_1!9617 lt!327133))) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327134))) (currentByte!9640 (_2!9616 lt!327134)) (currentBit!9635 (_2!9616 lt!327134)))))))

(declare-fun b!209068 () Bool)

(declare-fun res!175483 () Bool)

(assert (=> b!209068 (=> (not res!175483) (not e!142755))))

(assert (=> b!209068 (= res!175483 (isPrefixOf!0 thiss!1204 (_2!9616 lt!327134)))))

(assert (= (and d!70735 res!175481) b!209067))

(assert (= (and b!209067 res!175484) b!209068))

(assert (= (and b!209068 res!175483) b!209069))

(assert (= (and b!209069 res!175482) b!209070))

(declare-fun m!321797 () Bool)

(assert (=> b!209069 m!321797))

(assert (=> b!209069 m!321797))

(declare-fun m!321799 () Bool)

(assert (=> b!209069 m!321799))

(declare-fun m!321801 () Bool)

(assert (=> b!209068 m!321801))

(declare-fun m!321803 () Bool)

(assert (=> b!209070 m!321803))

(declare-fun m!321805 () Bool)

(assert (=> b!209070 m!321805))

(declare-fun m!321807 () Bool)

(assert (=> d!70735 m!321807))

(declare-fun m!321809 () Bool)

(assert (=> d!70735 m!321809))

(assert (=> b!209067 m!321805))

(assert (=> b!209067 m!321421))

(assert (=> b!208895 d!70735))

(declare-fun d!70737 () Bool)

(assert (=> d!70737 (= (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326668)))) (and (bvsge (currentBit!9635 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9635 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9640 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326668)))) (and (= (currentBit!9635 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326668))))))))))

(assert (=> b!208905 d!70737))

(declare-fun d!70739 () Bool)

(declare-fun e!142757 () Bool)

(assert (=> d!70739 e!142757))

(declare-fun res!175486 () Bool)

(assert (=> d!70739 (=> (not res!175486) (not e!142757))))

(declare-fun lt!327136 () (_ BitVec 64))

(declare-fun lt!327141 () (_ BitVec 64))

(declare-fun lt!327138 () (_ BitVec 64))

(assert (=> d!70739 (= res!175486 (= lt!327141 (bvsub lt!327136 lt!327138)))))

(assert (=> d!70739 (or (= (bvand lt!327136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327136 lt!327138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!70739 (= lt!327138 (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326668))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326668)))))))

(declare-fun lt!327139 () (_ BitVec 64))

(declare-fun lt!327137 () (_ BitVec 64))

(assert (=> d!70739 (= lt!327136 (bvmul lt!327139 lt!327137))))

(assert (=> d!70739 (or (= lt!327139 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327137 (bvsdiv (bvmul lt!327139 lt!327137) lt!327139)))))

(assert (=> d!70739 (= lt!327137 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!70739 (= lt!327139 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))))))

(assert (=> d!70739 (= lt!327141 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326668))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326668)))))))

(assert (=> d!70739 (invariant!0 (currentBit!9635 (_2!9616 lt!326668)) (currentByte!9640 (_2!9616 lt!326668)) (size!4599 (buf!5110 (_2!9616 lt!326668))))))

(assert (=> d!70739 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326668))) (currentByte!9640 (_2!9616 lt!326668)) (currentBit!9635 (_2!9616 lt!326668))) lt!327141)))

(declare-fun b!209071 () Bool)

(declare-fun res!175485 () Bool)

(assert (=> b!209071 (=> (not res!175485) (not e!142757))))

(assert (=> b!209071 (= res!175485 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!327141))))

(declare-fun b!209072 () Bool)

(declare-fun lt!327140 () (_ BitVec 64))

(assert (=> b!209072 (= e!142757 (bvsle lt!327141 (bvmul lt!327140 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!209072 (or (= lt!327140 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!327140 #b0000000000000000000000000000000000000000000000000000000000001000) lt!327140)))))

(assert (=> b!209072 (= lt!327140 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326668)))))))

(assert (= (and d!70739 res!175486) b!209071))

(assert (= (and b!209071 res!175485) b!209072))

(declare-fun m!321811 () Bool)

(assert (=> d!70739 m!321811))

(assert (=> d!70739 m!321437))

(assert (=> b!208893 d!70739))

(declare-fun d!70741 () Bool)

(declare-fun res!175489 () Bool)

(declare-fun e!142758 () Bool)

(assert (=> d!70741 (=> (not res!175489) (not e!142758))))

(assert (=> d!70741 (= res!175489 (= (size!4599 (buf!5110 thiss!1204)) (size!4599 (buf!5110 (_2!9616 lt!326668)))))))

(assert (=> d!70741 (= (isPrefixOf!0 thiss!1204 (_2!9616 lt!326668)) e!142758)))

(declare-fun b!209073 () Bool)

(declare-fun res!175487 () Bool)

(assert (=> b!209073 (=> (not res!175487) (not e!142758))))

(assert (=> b!209073 (= res!175487 (bvsle (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326668))) (currentByte!9640 (_2!9616 lt!326668)) (currentBit!9635 (_2!9616 lt!326668)))))))

(declare-fun b!209074 () Bool)

(declare-fun e!142759 () Bool)

(assert (=> b!209074 (= e!142758 e!142759)))

(declare-fun res!175488 () Bool)

(assert (=> b!209074 (=> res!175488 e!142759)))

(assert (=> b!209074 (= res!175488 (= (size!4599 (buf!5110 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!209075 () Bool)

(assert (=> b!209075 (= e!142759 (arrayBitRangesEq!0 (buf!5110 thiss!1204) (buf!5110 (_2!9616 lt!326668)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4599 (buf!5110 thiss!1204)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204))))))

(assert (= (and d!70741 res!175489) b!209073))

(assert (= (and b!209073 res!175487) b!209074))

(assert (= (and b!209074 (not res!175488)) b!209075))

(assert (=> b!209073 m!321421))

(assert (=> b!209073 m!321427))

(assert (=> b!209075 m!321421))

(assert (=> b!209075 m!321421))

(declare-fun m!321813 () Bool)

(assert (=> b!209075 m!321813))

(assert (=> b!208893 d!70741))

(declare-fun d!70743 () Bool)

(assert (=> d!70743 (isPrefixOf!0 thiss!1204 (_2!9616 lt!326668))))

(declare-fun lt!327144 () Unit!14870)

(declare-fun choose!30 (BitStream!8306 BitStream!8306 BitStream!8306) Unit!14870)

(assert (=> d!70743 (= lt!327144 (choose!30 thiss!1204 (_2!9616 lt!326667) (_2!9616 lt!326668)))))

(assert (=> d!70743 (isPrefixOf!0 thiss!1204 (_2!9616 lt!326667))))

(assert (=> d!70743 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9616 lt!326667) (_2!9616 lt!326668)) lt!327144)))

(declare-fun bs!17381 () Bool)

(assert (= bs!17381 d!70743))

(assert (=> bs!17381 m!321429))

(declare-fun m!321815 () Bool)

(assert (=> bs!17381 m!321815))

(assert (=> bs!17381 m!321413))

(assert (=> b!208893 d!70743))

(declare-fun b!209247 () Bool)

(declare-fun res!175632 () Bool)

(declare-fun e!142856 () Bool)

(assert (=> b!209247 (=> (not res!175632) (not e!142856))))

(declare-fun lt!327650 () tuple2!17922)

(assert (=> b!209247 (= res!175632 (= (size!4599 (buf!5110 (_2!9616 lt!326667))) (size!4599 (buf!5110 (_2!9616 lt!327650)))))))

(declare-fun b!209248 () Bool)

(declare-fun res!175630 () Bool)

(declare-fun lt!327688 () tuple2!17922)

(assert (=> b!209248 (= res!175630 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327688))) (currentByte!9640 (_2!9616 lt!327688)) (currentBit!9635 (_2!9616 lt!327688))) (bvadd (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!142861 () Bool)

(assert (=> b!209248 (=> (not res!175630) (not e!142861))))

(declare-fun b!209250 () Bool)

(declare-fun e!142862 () tuple2!17922)

(declare-fun lt!327697 () tuple2!17922)

(assert (=> b!209250 (= e!142862 (tuple2!17923 (_1!9616 lt!327697) (_2!9616 lt!327697)))))

(declare-fun lt!327673 () Bool)

(assert (=> b!209250 (= lt!327673 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209250 (= lt!327688 (appendBit!0 (_2!9616 lt!326667) lt!327673))))

(declare-fun res!175634 () Bool)

(assert (=> b!209250 (= res!175634 (= (size!4599 (buf!5110 (_2!9616 lt!326667))) (size!4599 (buf!5110 (_2!9616 lt!327688)))))))

(assert (=> b!209250 (=> (not res!175634) (not e!142861))))

(assert (=> b!209250 e!142861))

(declare-fun lt!327679 () tuple2!17922)

(assert (=> b!209250 (= lt!327679 lt!327688)))

(assert (=> b!209250 (= lt!327697 (appendBitsLSBFirstLoopTR!0 (_2!9616 lt!327679) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!327656 () Unit!14870)

(assert (=> b!209250 (= lt!327656 (lemmaIsPrefixTransitive!0 (_2!9616 lt!326667) (_2!9616 lt!327679) (_2!9616 lt!327697)))))

(assert (=> b!209250 (isPrefixOf!0 (_2!9616 lt!326667) (_2!9616 lt!327697))))

(declare-fun lt!327643 () Unit!14870)

(assert (=> b!209250 (= lt!327643 lt!327656)))

(assert (=> b!209250 (invariant!0 (currentBit!9635 (_2!9616 lt!326667)) (currentByte!9640 (_2!9616 lt!326667)) (size!4599 (buf!5110 (_2!9616 lt!327679))))))

(declare-fun lt!327687 () BitStream!8306)

(assert (=> b!209250 (= lt!327687 (BitStream!8307 (buf!5110 (_2!9616 lt!327679)) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(assert (=> b!209250 (invariant!0 (currentBit!9635 lt!327687) (currentByte!9640 lt!327687) (size!4599 (buf!5110 (_2!9616 lt!327697))))))

(declare-fun lt!327646 () BitStream!8306)

(assert (=> b!209250 (= lt!327646 (BitStream!8307 (buf!5110 (_2!9616 lt!327697)) (currentByte!9640 lt!327687) (currentBit!9635 lt!327687)))))

(declare-fun lt!327671 () tuple2!17924)

(assert (=> b!209250 (= lt!327671 (readBitPure!0 lt!327687))))

(declare-fun lt!327692 () tuple2!17924)

(assert (=> b!209250 (= lt!327692 (readBitPure!0 lt!327646))))

(declare-fun lt!327676 () Unit!14870)

(assert (=> b!209250 (= lt!327676 (readBitPrefixLemma!0 lt!327687 (_2!9616 lt!327697)))))

(declare-fun res!175636 () Bool)

(assert (=> b!209250 (= res!175636 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!327671))) (currentByte!9640 (_1!9617 lt!327671)) (currentBit!9635 (_1!9617 lt!327671))) (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!327692))) (currentByte!9640 (_1!9617 lt!327692)) (currentBit!9635 (_1!9617 lt!327692)))))))

(declare-fun e!142859 () Bool)

(assert (=> b!209250 (=> (not res!175636) (not e!142859))))

(assert (=> b!209250 e!142859))

(declare-fun lt!327693 () Unit!14870)

(assert (=> b!209250 (= lt!327693 lt!327676)))

(declare-fun lt!327669 () tuple2!17926)

(assert (=> b!209250 (= lt!327669 (reader!0 (_2!9616 lt!326667) (_2!9616 lt!327697)))))

(declare-fun lt!327696 () tuple2!17926)

(assert (=> b!209250 (= lt!327696 (reader!0 (_2!9616 lt!327679) (_2!9616 lt!327697)))))

(declare-fun lt!327655 () tuple2!17924)

(assert (=> b!209250 (= lt!327655 (readBitPure!0 (_1!9618 lt!327669)))))

(assert (=> b!209250 (= (_2!9617 lt!327655) lt!327673)))

(declare-fun lt!327653 () Unit!14870)

(declare-fun Unit!14900 () Unit!14870)

(assert (=> b!209250 (= lt!327653 Unit!14900)))

(declare-fun lt!327690 () (_ BitVec 64))

(assert (=> b!209250 (= lt!327690 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327659 () (_ BitVec 64))

(assert (=> b!209250 (= lt!327659 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327666 () Unit!14870)

(assert (=> b!209250 (= lt!327666 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9616 lt!326667) (buf!5110 (_2!9616 lt!327697)) lt!327659))))

(assert (=> b!209250 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!327697)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!327659)))

(declare-fun lt!327667 () Unit!14870)

(assert (=> b!209250 (= lt!327667 lt!327666)))

(declare-fun lt!327686 () tuple2!17928)

(assert (=> b!209250 (= lt!327686 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!327669) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327690))))

(declare-fun lt!327668 () (_ BitVec 64))

(assert (=> b!209250 (= lt!327668 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!327661 () Unit!14870)

(assert (=> b!209250 (= lt!327661 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9616 lt!327679) (buf!5110 (_2!9616 lt!327697)) lt!327668))))

(assert (=> b!209250 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!327697)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!327679))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!327679))) lt!327668)))

(declare-fun lt!327652 () Unit!14870)

(assert (=> b!209250 (= lt!327652 lt!327661)))

(declare-fun lt!327662 () tuple2!17928)

(assert (=> b!209250 (= lt!327662 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!327696) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!327690 (ite (_2!9617 lt!327655) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!327665 () tuple2!17928)

(assert (=> b!209250 (= lt!327665 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!327669) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327690))))

(declare-fun c!10297 () Bool)

(assert (=> b!209250 (= c!10297 (_2!9617 (readBitPure!0 (_1!9618 lt!327669))))))

(declare-fun lt!327691 () tuple2!17928)

(declare-fun e!142857 () (_ BitVec 64))

(assert (=> b!209250 (= lt!327691 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9618 lt!327669) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!327690 e!142857)))))

(declare-fun lt!327670 () Unit!14870)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8306 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14870)

(assert (=> b!209250 (= lt!327670 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9618 lt!327669) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!327690))))

(assert (=> b!209250 (and (= (_2!9619 lt!327665) (_2!9619 lt!327691)) (= (_1!9619 lt!327665) (_1!9619 lt!327691)))))

(declare-fun lt!327648 () Unit!14870)

(assert (=> b!209250 (= lt!327648 lt!327670)))

(assert (=> b!209250 (= (_1!9618 lt!327669) (withMovedBitIndex!0 (_2!9618 lt!327669) (bvsub (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327697))) (currentByte!9640 (_2!9616 lt!327697)) (currentBit!9635 (_2!9616 lt!327697))))))))

(declare-fun lt!327658 () Unit!14870)

(declare-fun Unit!14901 () Unit!14870)

(assert (=> b!209250 (= lt!327658 Unit!14901)))

(assert (=> b!209250 (= (_1!9618 lt!327696) (withMovedBitIndex!0 (_2!9618 lt!327696) (bvsub (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327679))) (currentByte!9640 (_2!9616 lt!327679)) (currentBit!9635 (_2!9616 lt!327679))) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327697))) (currentByte!9640 (_2!9616 lt!327697)) (currentBit!9635 (_2!9616 lt!327697))))))))

(declare-fun lt!327657 () Unit!14870)

(declare-fun Unit!14902 () Unit!14870)

(assert (=> b!209250 (= lt!327657 Unit!14902)))

(assert (=> b!209250 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))) (bvsub (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327679))) (currentByte!9640 (_2!9616 lt!327679)) (currentBit!9635 (_2!9616 lt!327679))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!327685 () Unit!14870)

(declare-fun Unit!14903 () Unit!14870)

(assert (=> b!209250 (= lt!327685 Unit!14903)))

(assert (=> b!209250 (= (_2!9619 lt!327686) (_2!9619 lt!327662))))

(declare-fun lt!327647 () Unit!14870)

(declare-fun Unit!14904 () Unit!14870)

(assert (=> b!209250 (= lt!327647 Unit!14904)))

(assert (=> b!209250 (invariant!0 (currentBit!9635 (_2!9616 lt!327697)) (currentByte!9640 (_2!9616 lt!327697)) (size!4599 (buf!5110 (_2!9616 lt!327697))))))

(declare-fun lt!327677 () Unit!14870)

(declare-fun Unit!14905 () Unit!14870)

(assert (=> b!209250 (= lt!327677 Unit!14905)))

(assert (=> b!209250 (= (size!4599 (buf!5110 (_2!9616 lt!326667))) (size!4599 (buf!5110 (_2!9616 lt!327697))))))

(declare-fun lt!327684 () Unit!14870)

(declare-fun Unit!14906 () Unit!14870)

(assert (=> b!209250 (= lt!327684 Unit!14906)))

(assert (=> b!209250 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327697))) (currentByte!9640 (_2!9616 lt!327697)) (currentBit!9635 (_2!9616 lt!327697))) (bvsub (bvadd (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327663 () Unit!14870)

(declare-fun Unit!14907 () Unit!14870)

(assert (=> b!209250 (= lt!327663 Unit!14907)))

(declare-fun lt!327683 () Unit!14870)

(declare-fun Unit!14908 () Unit!14870)

(assert (=> b!209250 (= lt!327683 Unit!14908)))

(declare-fun lt!327651 () tuple2!17926)

(assert (=> b!209250 (= lt!327651 (reader!0 (_2!9616 lt!326667) (_2!9616 lt!327697)))))

(declare-fun lt!327660 () (_ BitVec 64))

(assert (=> b!209250 (= lt!327660 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!327654 () Unit!14870)

(assert (=> b!209250 (= lt!327654 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9616 lt!326667) (buf!5110 (_2!9616 lt!327697)) lt!327660))))

(assert (=> b!209250 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!327697)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!327660)))

(declare-fun lt!327672 () Unit!14870)

(assert (=> b!209250 (= lt!327672 lt!327654)))

(declare-fun lt!327645 () tuple2!17928)

(assert (=> b!209250 (= lt!327645 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!327651) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!175639 () Bool)

(assert (=> b!209250 (= res!175639 (= (_2!9619 lt!327645) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!142863 () Bool)

(assert (=> b!209250 (=> (not res!175639) (not e!142863))))

(assert (=> b!209250 e!142863))

(declare-fun lt!327644 () Unit!14870)

(declare-fun Unit!14909 () Unit!14870)

(assert (=> b!209250 (= lt!327644 Unit!14909)))

(declare-fun bm!3294 () Bool)

(declare-fun c!10298 () Bool)

(declare-fun call!3297 () Bool)

(assert (=> bm!3294 (= call!3297 (isPrefixOf!0 (_2!9616 lt!326667) (ite c!10298 (_2!9616 lt!326667) (_2!9616 lt!327688))))))

(declare-fun b!209251 () Bool)

(declare-fun Unit!14910 () Unit!14870)

(assert (=> b!209251 (= e!142862 (tuple2!17923 Unit!14910 (_2!9616 lt!326667)))))

(declare-fun lt!327642 () Unit!14870)

(assert (=> b!209251 (= lt!327642 (lemmaIsPrefixRefl!0 (_2!9616 lt!326667)))))

(assert (=> b!209251 call!3297))

(declare-fun lt!327649 () Unit!14870)

(assert (=> b!209251 (= lt!327649 lt!327642)))

(declare-fun b!209252 () Bool)

(declare-fun e!142860 () Bool)

(declare-fun lt!327694 () tuple2!17928)

(declare-fun lt!327674 () tuple2!17926)

(assert (=> b!209252 (= e!142860 (= (_1!9619 lt!327694) (_2!9618 lt!327674)))))

(declare-fun b!209253 () Bool)

(assert (=> b!209253 (= e!142859 (= (_2!9617 lt!327671) (_2!9617 lt!327692)))))

(declare-fun b!209254 () Bool)

(assert (=> b!209254 (= e!142863 (= (_1!9619 lt!327645) (_2!9618 lt!327651)))))

(declare-fun b!209255 () Bool)

(declare-fun res!175633 () Bool)

(assert (=> b!209255 (=> (not res!175633) (not e!142856))))

(declare-fun lt!327682 () (_ BitVec 64))

(declare-fun lt!327689 () (_ BitVec 64))

(assert (=> b!209255 (= res!175633 (= (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327650))) (currentByte!9640 (_2!9616 lt!327650)) (currentBit!9635 (_2!9616 lt!327650))) (bvsub lt!327689 lt!327682)))))

(assert (=> b!209255 (or (= (bvand lt!327689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!327689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!327689 lt!327682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209255 (= lt!327682 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!327678 () (_ BitVec 64))

(declare-fun lt!327675 () (_ BitVec 64))

(assert (=> b!209255 (= lt!327689 (bvadd lt!327678 lt!327675))))

(assert (=> b!209255 (or (not (= (bvand lt!327678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!327675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!327678 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!327678 lt!327675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209255 (= lt!327675 ((_ sign_extend 32) nBits!348))))

(assert (=> b!209255 (= lt!327678 (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!326667))) (currentByte!9640 (_2!9616 lt!326667)) (currentBit!9635 (_2!9616 lt!326667))))))

(declare-fun b!209256 () Bool)

(declare-fun res!175628 () Bool)

(assert (=> b!209256 (=> (not res!175628) (not e!142856))))

(assert (=> b!209256 (= res!175628 (isPrefixOf!0 (_2!9616 lt!326667) (_2!9616 lt!327650)))))

(declare-fun b!209249 () Bool)

(assert (=> b!209249 (= e!142857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun d!70745 () Bool)

(assert (=> d!70745 e!142856))

(declare-fun res!175629 () Bool)

(assert (=> d!70745 (=> (not res!175629) (not e!142856))))

(assert (=> d!70745 (= res!175629 (invariant!0 (currentBit!9635 (_2!9616 lt!327650)) (currentByte!9640 (_2!9616 lt!327650)) (size!4599 (buf!5110 (_2!9616 lt!327650)))))))

(assert (=> d!70745 (= lt!327650 e!142862)))

(assert (=> d!70745 (= c!10298 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!70745 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!70745 (= (appendBitsLSBFirstLoopTR!0 (_2!9616 lt!326667) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!327650)))

(declare-fun b!209257 () Bool)

(assert (=> b!209257 (= e!142857 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!209258 () Bool)

(declare-fun e!142855 () Bool)

(declare-fun lt!327695 () (_ BitVec 64))

(assert (=> b!209258 (= e!142855 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!326667)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!327695))))

(declare-fun b!209259 () Bool)

(declare-fun lt!327680 () tuple2!17924)

(assert (=> b!209259 (= lt!327680 (readBitPure!0 (readerFrom!0 (_2!9616 lt!327688) (currentBit!9635 (_2!9616 lt!326667)) (currentByte!9640 (_2!9616 lt!326667)))))))

(declare-fun res!175631 () Bool)

(assert (=> b!209259 (= res!175631 (and (= (_2!9617 lt!327680) lt!327673) (= (_1!9617 lt!327680) (_2!9616 lt!327688))))))

(declare-fun e!142858 () Bool)

(assert (=> b!209259 (=> (not res!175631) (not e!142858))))

(assert (=> b!209259 (= e!142861 e!142858)))

(declare-fun b!209260 () Bool)

(declare-fun res!175638 () Bool)

(assert (=> b!209260 (= res!175638 call!3297)))

(assert (=> b!209260 (=> (not res!175638) (not e!142861))))

(declare-fun b!209261 () Bool)

(assert (=> b!209261 (= e!142856 e!142860)))

(declare-fun res!175637 () Bool)

(assert (=> b!209261 (=> (not res!175637) (not e!142860))))

(assert (=> b!209261 (= res!175637 (= (_2!9619 lt!327694) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!209261 (= lt!327694 (readNBitsLSBFirstsLoopPure!0 (_1!9618 lt!327674) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!327681 () Unit!14870)

(declare-fun lt!327664 () Unit!14870)

(assert (=> b!209261 (= lt!327681 lt!327664)))

(assert (=> b!209261 (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 (_2!9616 lt!327650)))) ((_ sign_extend 32) (currentByte!9640 (_2!9616 lt!326667))) ((_ sign_extend 32) (currentBit!9635 (_2!9616 lt!326667))) lt!327695)))

(assert (=> b!209261 (= lt!327664 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9616 lt!326667) (buf!5110 (_2!9616 lt!327650)) lt!327695))))

(assert (=> b!209261 e!142855))

(declare-fun res!175635 () Bool)

(assert (=> b!209261 (=> (not res!175635) (not e!142855))))

(assert (=> b!209261 (= res!175635 (and (= (size!4599 (buf!5110 (_2!9616 lt!326667))) (size!4599 (buf!5110 (_2!9616 lt!327650)))) (bvsge lt!327695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!209261 (= lt!327695 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!209261 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!209261 (= lt!327674 (reader!0 (_2!9616 lt!326667) (_2!9616 lt!327650)))))

(declare-fun b!209262 () Bool)

(assert (=> b!209262 (= e!142858 (= (bitIndex!0 (size!4599 (buf!5110 (_1!9617 lt!327680))) (currentByte!9640 (_1!9617 lt!327680)) (currentBit!9635 (_1!9617 lt!327680))) (bitIndex!0 (size!4599 (buf!5110 (_2!9616 lt!327688))) (currentByte!9640 (_2!9616 lt!327688)) (currentBit!9635 (_2!9616 lt!327688)))))))

(assert (= (and d!70745 c!10298) b!209251))

(assert (= (and d!70745 (not c!10298)) b!209250))

(assert (= (and b!209250 res!175634) b!209248))

(assert (= (and b!209248 res!175630) b!209260))

(assert (= (and b!209260 res!175638) b!209259))

(assert (= (and b!209259 res!175631) b!209262))

(assert (= (and b!209250 res!175636) b!209253))

(assert (= (and b!209250 c!10297) b!209257))

(assert (= (and b!209250 (not c!10297)) b!209249))

(assert (= (and b!209250 res!175639) b!209254))

(assert (= (or b!209251 b!209260) bm!3294))

(assert (= (and d!70745 res!175629) b!209247))

(assert (= (and b!209247 res!175632) b!209255))

(assert (= (and b!209255 res!175633) b!209256))

(assert (= (and b!209256 res!175628) b!209261))

(assert (= (and b!209261 res!175635) b!209258))

(assert (= (and b!209261 res!175637) b!209252))

(declare-fun m!322049 () Bool)

(assert (=> b!209255 m!322049))

(assert (=> b!209255 m!321419))

(assert (=> b!209251 m!321715))

(declare-fun m!322051 () Bool)

(assert (=> b!209250 m!322051))

(declare-fun m!322053 () Bool)

(assert (=> b!209250 m!322053))

(declare-fun m!322055 () Bool)

(assert (=> b!209250 m!322055))

(declare-fun m!322057 () Bool)

(assert (=> b!209250 m!322057))

(declare-fun m!322059 () Bool)

(assert (=> b!209250 m!322059))

(declare-fun m!322061 () Bool)

(assert (=> b!209250 m!322061))

(declare-fun m!322063 () Bool)

(assert (=> b!209250 m!322063))

(declare-fun m!322065 () Bool)

(assert (=> b!209250 m!322065))

(declare-fun m!322067 () Bool)

(assert (=> b!209250 m!322067))

(declare-fun m!322069 () Bool)

(assert (=> b!209250 m!322069))

(declare-fun m!322071 () Bool)

(assert (=> b!209250 m!322071))

(declare-fun m!322073 () Bool)

(assert (=> b!209250 m!322073))

(assert (=> b!209250 m!321419))

(declare-fun m!322075 () Bool)

(assert (=> b!209250 m!322075))

(declare-fun m!322077 () Bool)

(assert (=> b!209250 m!322077))

(declare-fun m!322079 () Bool)

(assert (=> b!209250 m!322079))

(declare-fun m!322081 () Bool)

(assert (=> b!209250 m!322081))

(declare-fun m!322083 () Bool)

(assert (=> b!209250 m!322083))

(declare-fun m!322085 () Bool)

(assert (=> b!209250 m!322085))

(declare-fun m!322087 () Bool)

(assert (=> b!209250 m!322087))

(declare-fun m!322089 () Bool)

(assert (=> b!209250 m!322089))

(declare-fun m!322091 () Bool)

(assert (=> b!209250 m!322091))

(declare-fun m!322093 () Bool)

(assert (=> b!209250 m!322093))

(declare-fun m!322095 () Bool)

(assert (=> b!209250 m!322095))

(declare-fun m!322097 () Bool)

(assert (=> b!209250 m!322097))

(declare-fun m!322099 () Bool)

(assert (=> b!209250 m!322099))

(assert (=> b!209250 m!322057))

(declare-fun m!322101 () Bool)

(assert (=> b!209250 m!322101))

(declare-fun m!322103 () Bool)

(assert (=> b!209250 m!322103))

(declare-fun m!322105 () Bool)

(assert (=> b!209250 m!322105))

(declare-fun m!322107 () Bool)

(assert (=> b!209250 m!322107))

(declare-fun m!322109 () Bool)

(assert (=> b!209250 m!322109))

(declare-fun m!322111 () Bool)

(assert (=> b!209250 m!322111))

(declare-fun m!322113 () Bool)

(assert (=> b!209250 m!322113))

(declare-fun m!322115 () Bool)

(assert (=> b!209250 m!322115))

(declare-fun m!322117 () Bool)

(assert (=> d!70745 m!322117))

(declare-fun m!322119 () Bool)

(assert (=> b!209262 m!322119))

(declare-fun m!322121 () Bool)

(assert (=> b!209262 m!322121))

(declare-fun m!322123 () Bool)

(assert (=> b!209258 m!322123))

(declare-fun m!322125 () Bool)

(assert (=> b!209259 m!322125))

(assert (=> b!209259 m!322125))

(declare-fun m!322127 () Bool)

(assert (=> b!209259 m!322127))

(assert (=> b!209248 m!322121))

(assert (=> b!209248 m!321419))

(assert (=> b!209261 m!322073))

(declare-fun m!322129 () Bool)

(assert (=> b!209261 m!322129))

(declare-fun m!322131 () Bool)

(assert (=> b!209261 m!322131))

(declare-fun m!322133 () Bool)

(assert (=> b!209261 m!322133))

(assert (=> b!209261 m!322085))

(declare-fun m!322135 () Bool)

(assert (=> b!209261 m!322135))

(declare-fun m!322137 () Bool)

(assert (=> b!209256 m!322137))

(declare-fun m!322139 () Bool)

(assert (=> bm!3294 m!322139))

(assert (=> b!208893 d!70745))

(declare-fun d!70789 () Bool)

(assert (=> d!70789 (= (array_inv!4340 (buf!5110 thiss!1204)) (bvsge (size!4599 (buf!5110 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!208903 d!70789))

(declare-fun d!70791 () Bool)

(assert (=> d!70791 (= (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 thiss!1204))) (and (bvsge (currentBit!9635 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9635 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9640 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9640 thiss!1204) (size!4599 (buf!5110 thiss!1204))) (and (= (currentBit!9635 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9640 thiss!1204) (size!4599 (buf!5110 thiss!1204)))))))))

(assert (=> b!208892 d!70791))

(declare-fun d!70793 () Bool)

(assert (=> d!70793 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204)) lt!326669) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4599 (buf!5110 thiss!1204))) ((_ sign_extend 32) (currentByte!9640 thiss!1204)) ((_ sign_extend 32) (currentBit!9635 thiss!1204))) lt!326669))))

(declare-fun bs!17389 () Bool)

(assert (= bs!17389 d!70793))

(assert (=> bs!17389 m!321695))

(assert (=> b!208902 d!70793))

(declare-fun d!70795 () Bool)

(declare-fun lt!327698 () tuple2!17940)

(assert (=> d!70795 (= lt!327698 (readBit!0 (readerFrom!0 (_2!9616 lt!326667) (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204))))))

(assert (=> d!70795 (= (readBitPure!0 (readerFrom!0 (_2!9616 lt!326667) (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204))) (tuple2!17925 (_2!9625 lt!327698) (_1!9625 lt!327698)))))

(declare-fun bs!17390 () Bool)

(assert (= bs!17390 d!70795))

(assert (=> bs!17390 m!321415))

(declare-fun m!322141 () Bool)

(assert (=> bs!17390 m!322141))

(assert (=> b!208901 d!70795))

(declare-fun d!70797 () Bool)

(declare-fun e!142866 () Bool)

(assert (=> d!70797 e!142866))

(declare-fun res!175643 () Bool)

(assert (=> d!70797 (=> (not res!175643) (not e!142866))))

(assert (=> d!70797 (= res!175643 (invariant!0 (currentBit!9635 (_2!9616 lt!326667)) (currentByte!9640 (_2!9616 lt!326667)) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(assert (=> d!70797 (= (readerFrom!0 (_2!9616 lt!326667) (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204)) (BitStream!8307 (buf!5110 (_2!9616 lt!326667)) (currentByte!9640 thiss!1204) (currentBit!9635 thiss!1204)))))

(declare-fun b!209265 () Bool)

(assert (=> b!209265 (= e!142866 (invariant!0 (currentBit!9635 thiss!1204) (currentByte!9640 thiss!1204) (size!4599 (buf!5110 (_2!9616 lt!326667)))))))

(assert (= (and d!70797 res!175643) b!209265))

(assert (=> d!70797 m!321693))

(assert (=> b!209265 m!321467))

(assert (=> b!208901 d!70797))

(push 1)

(assert (not b!209256))

(assert (not d!70719))

(assert (not d!70797))

(assert (not d!70703))

(assert (not d!70723))

(assert (not d!70717))

(assert (not d!70701))

(assert (not b!209042))

(assert (not b!209075))

(assert (not d!70711))

(assert (not d!70687))

(assert (not b!209041))

(assert (not b!209261))

(assert (not b!209047))

(assert (not d!70729))

(assert (not d!70709))

(assert (not d!70691))

(assert (not b!209046))

(assert (not d!70725))

(assert (not b!209258))

(assert (not b!209030))

(assert (not b!209015))

(assert (not d!70705))

(assert (not d!70745))

(assert (not b!209250))

(assert (not d!70739))

(assert (not d!70689))

(assert (not d!70795))

(assert (not b!209255))

(assert (not b!209073))

(assert (not b!209048))

(assert (not d!70713))

(assert (not d!70707))

(assert (not d!70731))

(assert (not b!209069))

(assert (not b!209248))

(assert (not d!70793))

(assert (not b!209050))

(assert (not d!70721))

(assert (not b!209262))

(assert (not b!209259))

(assert (not bm!3294))

(assert (not d!70743))

(assert (not d!70697))

(assert (not b!209017))

(assert (not b!209265))

(assert (not b!209067))

(assert (not b!209028))

(assert (not d!70695))

(assert (not b!209043))

(assert (not b!209045))

(assert (not d!70735))

(assert (not b!209068))

(assert (not b!209251))

(assert (not b!209070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

