; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40222 () Bool)

(assert start!40222)

(declare-fun b!184615 () Bool)

(declare-fun res!153621 () Bool)

(declare-fun e!127893 () Bool)

(assert (=> b!184615 (=> (not res!153621) (not e!127893))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184615 (= res!153621 (not (= i!590 nBits!348)))))

(declare-fun b!184616 () Bool)

(declare-fun res!153625 () Bool)

(declare-fun e!127894 () Bool)

(assert (=> b!184616 (=> res!153625 e!127894)))

(declare-datatypes ((array!9790 0))(
  ( (array!9791 (arr!5249 (Array (_ BitVec 32) (_ BitVec 8))) (size!4319 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7746 0))(
  ( (BitStream!7747 (buf!4774 array!9790) (currentByte!9008 (_ BitVec 32)) (currentBit!9003 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7746)

(declare-datatypes ((Unit!13213 0))(
  ( (Unit!13214) )
))
(declare-datatypes ((tuple2!15988 0))(
  ( (tuple2!15989 (_1!8639 Unit!13213) (_2!8639 BitStream!7746)) )
))
(declare-fun lt!283904 () tuple2!15988)

(declare-fun isPrefixOf!0 (BitStream!7746 BitStream!7746) Bool)

(assert (=> b!184616 (= res!153625 (not (isPrefixOf!0 thiss!1204 (_2!8639 lt!283904))))))

(declare-fun b!184617 () Bool)

(declare-fun e!127888 () Bool)

(declare-datatypes ((tuple2!15990 0))(
  ( (tuple2!15991 (_1!8640 BitStream!7746) (_2!8640 Bool)) )
))
(declare-fun lt!283894 () tuple2!15990)

(declare-fun lt!283915 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184617 (= e!127888 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!283894))) (currentByte!9008 (_1!8640 lt!283894)) (currentBit!9003 (_1!8640 lt!283894))) lt!283915))))

(declare-fun b!184619 () Bool)

(declare-fun e!127883 () Bool)

(declare-fun lt!283910 () tuple2!15988)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184619 (= e!127883 (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283910)))))))

(declare-fun b!184620 () Bool)

(declare-fun res!153626 () Bool)

(assert (=> b!184620 (=> res!153626 e!127894)))

(assert (=> b!184620 (= res!153626 (not (isPrefixOf!0 (_2!8639 lt!283904) (_2!8639 lt!283910))))))

(declare-fun b!184621 () Bool)

(declare-fun e!127885 () Bool)

(declare-fun array_inv!4060 (array!9790) Bool)

(assert (=> b!184621 (= e!127885 (array_inv!4060 (buf!4774 thiss!1204)))))

(declare-fun b!184622 () Bool)

(declare-fun e!127886 () Bool)

(assert (=> b!184622 (= e!127893 (not e!127886))))

(declare-fun res!153619 () Bool)

(assert (=> b!184622 (=> res!153619 e!127886)))

(declare-fun lt!283896 () (_ BitVec 64))

(declare-fun lt!283903 () (_ BitVec 64))

(assert (=> b!184622 (= res!153619 (not (= lt!283896 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283903))))))

(assert (=> b!184622 (= lt!283896 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(assert (=> b!184622 (= lt!283903 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(declare-fun e!127884 () Bool)

(assert (=> b!184622 e!127884))

(declare-fun res!153614 () Bool)

(assert (=> b!184622 (=> (not res!153614) (not e!127884))))

(assert (=> b!184622 (= res!153614 (= (size!4319 (buf!4774 thiss!1204)) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(declare-fun lt!283916 () Bool)

(declare-fun appendBit!0 (BitStream!7746 Bool) tuple2!15988)

(assert (=> b!184622 (= lt!283904 (appendBit!0 thiss!1204 lt!283916))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!283907 () (_ BitVec 64))

(assert (=> b!184622 (= lt!283916 (not (= (bvand v!189 lt!283907) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184622 (= lt!283907 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184623 () Bool)

(declare-fun res!153620 () Bool)

(assert (=> b!184623 (=> (not res!153620) (not e!127893))))

(assert (=> b!184623 (= res!153620 (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 thiss!1204))))))

(declare-fun b!184624 () Bool)

(declare-fun e!127891 () Bool)

(assert (=> b!184624 (= e!127891 e!127893)))

(declare-fun res!153622 () Bool)

(assert (=> b!184624 (=> (not res!153622) (not e!127893))))

(declare-fun lt!283914 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184624 (= res!153622 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204)) lt!283914))))

(assert (=> b!184624 (= lt!283914 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184625 () Bool)

(declare-fun e!127887 () Bool)

(assert (=> b!184625 (= e!127894 e!127887)))

(declare-fun res!153616 () Bool)

(assert (=> b!184625 (=> res!153616 e!127887)))

(declare-datatypes ((tuple2!15992 0))(
  ( (tuple2!15993 (_1!8641 BitStream!7746) (_2!8641 BitStream!7746)) )
))
(declare-fun lt!283905 () tuple2!15992)

(declare-fun lt!283897 () (_ BitVec 64))

(declare-datatypes ((tuple2!15994 0))(
  ( (tuple2!15995 (_1!8642 BitStream!7746) (_2!8642 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15994)

(assert (=> b!184625 (= res!153616 (not (= (_1!8642 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!283905) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283897)) (_2!8641 lt!283905))))))

(declare-fun lt!283912 () (_ BitVec 64))

(assert (=> b!184625 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!283912)))

(declare-fun lt!283893 () Unit!13213)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7746 array!9790 (_ BitVec 64)) Unit!13213)

(assert (=> b!184625 (= lt!283893 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8639 lt!283904) (buf!4774 (_2!8639 lt!283910)) lt!283912))))

(assert (=> b!184625 (= lt!283912 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283909 () tuple2!15990)

(declare-fun lt!283901 () (_ BitVec 64))

(assert (=> b!184625 (= lt!283897 (bvor lt!283901 (ite (_2!8640 lt!283909) lt!283907 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283891 () tuple2!15992)

(declare-fun lt!283895 () tuple2!15994)

(assert (=> b!184625 (= lt!283895 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!283891) nBits!348 i!590 lt!283901))))

(assert (=> b!184625 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204)) lt!283914)))

(declare-fun lt!283898 () Unit!13213)

(assert (=> b!184625 (= lt!283898 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4774 (_2!8639 lt!283910)) lt!283914))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184625 (= lt!283901 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184625 (= (_2!8640 lt!283909) lt!283916)))

(declare-fun readBitPure!0 (BitStream!7746) tuple2!15990)

(assert (=> b!184625 (= lt!283909 (readBitPure!0 (_1!8641 lt!283891)))))

(declare-fun reader!0 (BitStream!7746 BitStream!7746) tuple2!15992)

(assert (=> b!184625 (= lt!283905 (reader!0 (_2!8639 lt!283904) (_2!8639 lt!283910)))))

(assert (=> b!184625 (= lt!283891 (reader!0 thiss!1204 (_2!8639 lt!283910)))))

(declare-fun e!127892 () Bool)

(assert (=> b!184625 e!127892))

(declare-fun res!153630 () Bool)

(assert (=> b!184625 (=> (not res!153630) (not e!127892))))

(declare-fun lt!283911 () tuple2!15990)

(declare-fun lt!283906 () tuple2!15990)

(assert (=> b!184625 (= res!153630 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!283911))) (currentByte!9008 (_1!8640 lt!283911)) (currentBit!9003 (_1!8640 lt!283911))) (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!283906))) (currentByte!9008 (_1!8640 lt!283906)) (currentBit!9003 (_1!8640 lt!283906)))))))

(declare-fun lt!283892 () Unit!13213)

(declare-fun lt!283890 () BitStream!7746)

(declare-fun readBitPrefixLemma!0 (BitStream!7746 BitStream!7746) Unit!13213)

(assert (=> b!184625 (= lt!283892 (readBitPrefixLemma!0 lt!283890 (_2!8639 lt!283910)))))

(assert (=> b!184625 (= lt!283906 (readBitPure!0 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204))))))

(assert (=> b!184625 (= lt!283911 (readBitPure!0 lt!283890))))

(assert (=> b!184625 e!127883))

(declare-fun res!153624 () Bool)

(assert (=> b!184625 (=> (not res!153624) (not e!127883))))

(assert (=> b!184625 (= res!153624 (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(assert (=> b!184625 (= lt!283890 (BitStream!7747 (buf!4774 (_2!8639 lt!283904)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(declare-fun b!184626 () Bool)

(declare-fun res!153615 () Bool)

(assert (=> b!184626 (=> res!153615 e!127894)))

(declare-fun lt!283899 () (_ BitVec 64))

(assert (=> b!184626 (= res!153615 (or (not (= (size!4319 (buf!4774 (_2!8639 lt!283910))) (size!4319 (buf!4774 thiss!1204)))) (not (= lt!283899 (bvsub (bvadd lt!283903 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184627 () Bool)

(assert (=> b!184627 (= e!127886 e!127894)))

(declare-fun res!153623 () Bool)

(assert (=> b!184627 (=> res!153623 e!127894)))

(assert (=> b!184627 (= res!153623 (not (= lt!283899 (bvsub (bvsub (bvadd lt!283896 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184627 (= lt!283899 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283910))) (currentByte!9008 (_2!8639 lt!283910)) (currentBit!9003 (_2!8639 lt!283910))))))

(assert (=> b!184627 (isPrefixOf!0 thiss!1204 (_2!8639 lt!283910))))

(declare-fun lt!283902 () Unit!13213)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7746 BitStream!7746 BitStream!7746) Unit!13213)

(assert (=> b!184627 (= lt!283902 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8639 lt!283904) (_2!8639 lt!283910)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7746 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15988)

(assert (=> b!184627 (= lt!283910 (appendBitsLSBFirstLoopTR!0 (_2!8639 lt!283904) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184628 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7746 (_ BitVec 64)) Bool)

(assert (=> b!184628 (= e!127887 (moveBitIndexPrecond!0 (_2!8641 lt!283891) (bvsub lt!283903 lt!283899)))))

(declare-fun lt!283913 () tuple2!15994)

(assert (=> b!184628 (and (= (_2!8642 lt!283895) (_2!8642 lt!283913)) (= (_1!8642 lt!283895) (_1!8642 lt!283913)))))

(declare-fun lt!283908 () Unit!13213)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13213)

(assert (=> b!184628 (= lt!283908 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8641 lt!283891) nBits!348 i!590 lt!283901))))

(declare-fun withMovedBitIndex!0 (BitStream!7746 (_ BitVec 64)) BitStream!7746)

(assert (=> b!184628 (= lt!283913 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283897))))

(declare-fun b!184629 () Bool)

(declare-fun res!153629 () Bool)

(assert (=> b!184629 (=> res!153629 e!127894)))

(assert (=> b!184629 (= res!153629 (not (invariant!0 (currentBit!9003 (_2!8639 lt!283910)) (currentByte!9008 (_2!8639 lt!283910)) (size!4319 (buf!4774 (_2!8639 lt!283910))))))))

(declare-fun b!184630 () Bool)

(declare-fun e!127889 () Bool)

(assert (=> b!184630 (= e!127884 e!127889)))

(declare-fun res!153617 () Bool)

(assert (=> b!184630 (=> (not res!153617) (not e!127889))))

(declare-fun lt!283900 () (_ BitVec 64))

(assert (=> b!184630 (= res!153617 (= lt!283915 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283900)))))

(assert (=> b!184630 (= lt!283915 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(assert (=> b!184630 (= lt!283900 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(declare-fun b!184618 () Bool)

(assert (=> b!184618 (= e!127892 (= (_2!8640 lt!283911) (_2!8640 lt!283906)))))

(declare-fun res!153618 () Bool)

(assert (=> start!40222 (=> (not res!153618) (not e!127891))))

(assert (=> start!40222 (= res!153618 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40222 e!127891))

(assert (=> start!40222 true))

(declare-fun inv!12 (BitStream!7746) Bool)

(assert (=> start!40222 (and (inv!12 thiss!1204) e!127885)))

(declare-fun b!184631 () Bool)

(declare-fun res!153628 () Bool)

(assert (=> b!184631 (=> (not res!153628) (not e!127889))))

(assert (=> b!184631 (= res!153628 (isPrefixOf!0 thiss!1204 (_2!8639 lt!283904)))))

(declare-fun b!184632 () Bool)

(assert (=> b!184632 (= e!127889 e!127888)))

(declare-fun res!153627 () Bool)

(assert (=> b!184632 (=> (not res!153627) (not e!127888))))

(assert (=> b!184632 (= res!153627 (and (= (_2!8640 lt!283894) lt!283916) (= (_1!8640 lt!283894) (_2!8639 lt!283904))))))

(declare-fun readerFrom!0 (BitStream!7746 (_ BitVec 32) (_ BitVec 32)) BitStream!7746)

(assert (=> b!184632 (= lt!283894 (readBitPure!0 (readerFrom!0 (_2!8639 lt!283904) (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204))))))

(assert (= (and start!40222 res!153618) b!184624))

(assert (= (and b!184624 res!153622) b!184623))

(assert (= (and b!184623 res!153620) b!184615))

(assert (= (and b!184615 res!153621) b!184622))

(assert (= (and b!184622 res!153614) b!184630))

(assert (= (and b!184630 res!153617) b!184631))

(assert (= (and b!184631 res!153628) b!184632))

(assert (= (and b!184632 res!153627) b!184617))

(assert (= (and b!184622 (not res!153619)) b!184627))

(assert (= (and b!184627 (not res!153623)) b!184629))

(assert (= (and b!184629 (not res!153629)) b!184626))

(assert (= (and b!184626 (not res!153615)) b!184620))

(assert (= (and b!184620 (not res!153626)) b!184616))

(assert (= (and b!184616 (not res!153625)) b!184625))

(assert (= (and b!184625 res!153624) b!184619))

(assert (= (and b!184625 res!153630) b!184618))

(assert (= (and b!184625 (not res!153616)) b!184628))

(assert (= start!40222 b!184621))

(declare-fun m!286805 () Bool)

(assert (=> b!184627 m!286805))

(declare-fun m!286807 () Bool)

(assert (=> b!184627 m!286807))

(declare-fun m!286809 () Bool)

(assert (=> b!184627 m!286809))

(declare-fun m!286811 () Bool)

(assert (=> b!184627 m!286811))

(declare-fun m!286813 () Bool)

(assert (=> b!184628 m!286813))

(declare-fun m!286815 () Bool)

(assert (=> b!184628 m!286815))

(declare-fun m!286817 () Bool)

(assert (=> b!184628 m!286817))

(assert (=> b!184628 m!286817))

(declare-fun m!286819 () Bool)

(assert (=> b!184628 m!286819))

(declare-fun m!286821 () Bool)

(assert (=> b!184631 m!286821))

(declare-fun m!286823 () Bool)

(assert (=> b!184625 m!286823))

(declare-fun m!286825 () Bool)

(assert (=> b!184625 m!286825))

(declare-fun m!286827 () Bool)

(assert (=> b!184625 m!286827))

(declare-fun m!286829 () Bool)

(assert (=> b!184625 m!286829))

(declare-fun m!286831 () Bool)

(assert (=> b!184625 m!286831))

(declare-fun m!286833 () Bool)

(assert (=> b!184625 m!286833))

(declare-fun m!286835 () Bool)

(assert (=> b!184625 m!286835))

(declare-fun m!286837 () Bool)

(assert (=> b!184625 m!286837))

(declare-fun m!286839 () Bool)

(assert (=> b!184625 m!286839))

(declare-fun m!286841 () Bool)

(assert (=> b!184625 m!286841))

(declare-fun m!286843 () Bool)

(assert (=> b!184625 m!286843))

(declare-fun m!286845 () Bool)

(assert (=> b!184625 m!286845))

(declare-fun m!286847 () Bool)

(assert (=> b!184625 m!286847))

(declare-fun m!286849 () Bool)

(assert (=> b!184625 m!286849))

(declare-fun m!286851 () Bool)

(assert (=> b!184625 m!286851))

(declare-fun m!286853 () Bool)

(assert (=> b!184625 m!286853))

(declare-fun m!286855 () Bool)

(assert (=> b!184621 m!286855))

(declare-fun m!286857 () Bool)

(assert (=> b!184617 m!286857))

(declare-fun m!286859 () Bool)

(assert (=> b!184632 m!286859))

(assert (=> b!184632 m!286859))

(declare-fun m!286861 () Bool)

(assert (=> b!184632 m!286861))

(declare-fun m!286863 () Bool)

(assert (=> b!184619 m!286863))

(declare-fun m!286865 () Bool)

(assert (=> b!184630 m!286865))

(declare-fun m!286867 () Bool)

(assert (=> b!184630 m!286867))

(assert (=> b!184622 m!286865))

(assert (=> b!184622 m!286867))

(declare-fun m!286869 () Bool)

(assert (=> b!184622 m!286869))

(declare-fun m!286871 () Bool)

(assert (=> b!184620 m!286871))

(declare-fun m!286873 () Bool)

(assert (=> start!40222 m!286873))

(declare-fun m!286875 () Bool)

(assert (=> b!184629 m!286875))

(declare-fun m!286877 () Bool)

(assert (=> b!184624 m!286877))

(assert (=> b!184616 m!286821))

(declare-fun m!286879 () Bool)

(assert (=> b!184623 m!286879))

(check-sat (not b!184627) (not b!184619) (not b!184628) (not start!40222) (not b!184620) (not b!184632) (not b!184616) (not b!184630) (not b!184629) (not b!184625) (not b!184617) (not b!184622) (not b!184623) (not b!184631) (not b!184621) (not b!184624))
(check-sat)
(get-model)

(declare-fun d!63635 () Bool)

(declare-fun res!153690 () Bool)

(declare-fun e!127935 () Bool)

(assert (=> d!63635 (=> (not res!153690) (not e!127935))))

(assert (=> d!63635 (= res!153690 (= (size!4319 (buf!4774 thiss!1204)) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(assert (=> d!63635 (= (isPrefixOf!0 thiss!1204 (_2!8639 lt!283904)) e!127935)))

(declare-fun b!184693 () Bool)

(declare-fun res!153688 () Bool)

(assert (=> b!184693 (=> (not res!153688) (not e!127935))))

(assert (=> b!184693 (= res!153688 (bvsle (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904)))))))

(declare-fun b!184694 () Bool)

(declare-fun e!127936 () Bool)

(assert (=> b!184694 (= e!127935 e!127936)))

(declare-fun res!153689 () Bool)

(assert (=> b!184694 (=> res!153689 e!127936)))

(assert (=> b!184694 (= res!153689 (= (size!4319 (buf!4774 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!184695 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9790 array!9790 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184695 (= e!127936 (arrayBitRangesEq!0 (buf!4774 thiss!1204) (buf!4774 (_2!8639 lt!283904)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204))))))

(assert (= (and d!63635 res!153690) b!184693))

(assert (= (and b!184693 res!153688) b!184694))

(assert (= (and b!184694 (not res!153689)) b!184695))

(assert (=> b!184693 m!286867))

(assert (=> b!184693 m!286865))

(assert (=> b!184695 m!286867))

(assert (=> b!184695 m!286867))

(declare-fun m!286957 () Bool)

(assert (=> b!184695 m!286957))

(assert (=> b!184631 d!63635))

(declare-fun d!63637 () Bool)

(declare-datatypes ((tuple2!16004 0))(
  ( (tuple2!16005 (_1!8647 Bool) (_2!8647 BitStream!7746)) )
))
(declare-fun lt!284000 () tuple2!16004)

(declare-fun readBit!0 (BitStream!7746) tuple2!16004)

(assert (=> d!63637 (= lt!284000 (readBit!0 (readerFrom!0 (_2!8639 lt!283904) (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204))))))

(assert (=> d!63637 (= (readBitPure!0 (readerFrom!0 (_2!8639 lt!283904) (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204))) (tuple2!15991 (_2!8647 lt!284000) (_1!8647 lt!284000)))))

(declare-fun bs!15853 () Bool)

(assert (= bs!15853 d!63637))

(assert (=> bs!15853 m!286859))

(declare-fun m!286959 () Bool)

(assert (=> bs!15853 m!286959))

(assert (=> b!184632 d!63637))

(declare-fun d!63639 () Bool)

(declare-fun e!127939 () Bool)

(assert (=> d!63639 e!127939))

(declare-fun res!153694 () Bool)

(assert (=> d!63639 (=> (not res!153694) (not e!127939))))

(assert (=> d!63639 (= res!153694 (invariant!0 (currentBit!9003 (_2!8639 lt!283904)) (currentByte!9008 (_2!8639 lt!283904)) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(assert (=> d!63639 (= (readerFrom!0 (_2!8639 lt!283904) (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204)) (BitStream!7747 (buf!4774 (_2!8639 lt!283904)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(declare-fun b!184698 () Bool)

(assert (=> b!184698 (= e!127939 (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(assert (= (and d!63639 res!153694) b!184698))

(declare-fun m!286961 () Bool)

(assert (=> d!63639 m!286961))

(assert (=> b!184698 m!286831))

(assert (=> b!184632 d!63639))

(declare-fun d!63641 () Bool)

(assert (=> d!63641 (= (array_inv!4060 (buf!4774 thiss!1204)) (bvsge (size!4319 (buf!4774 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!184621 d!63641))

(declare-fun d!63643 () Bool)

(declare-fun e!127942 () Bool)

(assert (=> d!63643 e!127942))

(declare-fun res!153700 () Bool)

(assert (=> d!63643 (=> (not res!153700) (not e!127942))))

(declare-fun lt!284013 () (_ BitVec 64))

(declare-fun lt!284017 () (_ BitVec 64))

(declare-fun lt!284018 () (_ BitVec 64))

(assert (=> d!63643 (= res!153700 (= lt!284018 (bvsub lt!284013 lt!284017)))))

(assert (=> d!63643 (or (= (bvand lt!284013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284013 lt!284017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!63643 (= lt!284017 (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283904)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904)))))))

(declare-fun lt!284016 () (_ BitVec 64))

(declare-fun lt!284014 () (_ BitVec 64))

(assert (=> d!63643 (= lt!284013 (bvmul lt!284016 lt!284014))))

(assert (=> d!63643 (or (= lt!284016 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284014 (bvsdiv (bvmul lt!284016 lt!284014) lt!284016)))))

(assert (=> d!63643 (= lt!284014 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63643 (= lt!284016 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(assert (=> d!63643 (= lt!284018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904)))))))

(assert (=> d!63643 (invariant!0 (currentBit!9003 (_2!8639 lt!283904)) (currentByte!9008 (_2!8639 lt!283904)) (size!4319 (buf!4774 (_2!8639 lt!283904))))))

(assert (=> d!63643 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))) lt!284018)))

(declare-fun b!184703 () Bool)

(declare-fun res!153699 () Bool)

(assert (=> b!184703 (=> (not res!153699) (not e!127942))))

(assert (=> b!184703 (= res!153699 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284018))))

(declare-fun b!184704 () Bool)

(declare-fun lt!284015 () (_ BitVec 64))

(assert (=> b!184704 (= e!127942 (bvsle lt!284018 (bvmul lt!284015 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184704 (or (= lt!284015 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284015 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284015)))))

(assert (=> b!184704 (= lt!284015 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283904)))))))

(assert (= (and d!63643 res!153700) b!184703))

(assert (= (and b!184703 res!153699) b!184704))

(declare-fun m!286963 () Bool)

(assert (=> d!63643 m!286963))

(assert (=> d!63643 m!286961))

(assert (=> b!184630 d!63643))

(declare-fun d!63645 () Bool)

(declare-fun e!127943 () Bool)

(assert (=> d!63645 e!127943))

(declare-fun res!153702 () Bool)

(assert (=> d!63645 (=> (not res!153702) (not e!127943))))

(declare-fun lt!284023 () (_ BitVec 64))

(declare-fun lt!284019 () (_ BitVec 64))

(declare-fun lt!284024 () (_ BitVec 64))

(assert (=> d!63645 (= res!153702 (= lt!284024 (bvsub lt!284019 lt!284023)))))

(assert (=> d!63645 (or (= (bvand lt!284019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284023 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284019 lt!284023) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63645 (= lt!284023 (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204))))))

(declare-fun lt!284022 () (_ BitVec 64))

(declare-fun lt!284020 () (_ BitVec 64))

(assert (=> d!63645 (= lt!284019 (bvmul lt!284022 lt!284020))))

(assert (=> d!63645 (or (= lt!284022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284020 (bvsdiv (bvmul lt!284022 lt!284020) lt!284022)))))

(assert (=> d!63645 (= lt!284020 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63645 (= lt!284022 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))))))

(assert (=> d!63645 (= lt!284024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9008 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9003 thiss!1204))))))

(assert (=> d!63645 (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 thiss!1204)))))

(assert (=> d!63645 (= (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)) lt!284024)))

(declare-fun b!184705 () Bool)

(declare-fun res!153701 () Bool)

(assert (=> b!184705 (=> (not res!153701) (not e!127943))))

(assert (=> b!184705 (= res!153701 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284024))))

(declare-fun b!184706 () Bool)

(declare-fun lt!284021 () (_ BitVec 64))

(assert (=> b!184706 (= e!127943 (bvsle lt!284024 (bvmul lt!284021 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184706 (or (= lt!284021 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284021 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284021)))))

(assert (=> b!184706 (= lt!284021 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))))))

(assert (= (and d!63645 res!153702) b!184705))

(assert (= (and b!184705 res!153701) b!184706))

(declare-fun m!286965 () Bool)

(assert (=> d!63645 m!286965))

(assert (=> d!63645 m!286879))

(assert (=> b!184630 d!63645))

(declare-fun d!63647 () Bool)

(assert (=> d!63647 (= (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283910)))) (and (bvsge (currentBit!9003 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9003 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9008 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283910)))) (and (= (currentBit!9003 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283910))))))))))

(assert (=> b!184619 d!63647))

(declare-fun d!63649 () Bool)

(declare-fun res!153705 () Bool)

(declare-fun e!127944 () Bool)

(assert (=> d!63649 (=> (not res!153705) (not e!127944))))

(assert (=> d!63649 (= res!153705 (= (size!4319 (buf!4774 (_2!8639 lt!283904))) (size!4319 (buf!4774 (_2!8639 lt!283910)))))))

(assert (=> d!63649 (= (isPrefixOf!0 (_2!8639 lt!283904) (_2!8639 lt!283910)) e!127944)))

(declare-fun b!184707 () Bool)

(declare-fun res!153703 () Bool)

(assert (=> b!184707 (=> (not res!153703) (not e!127944))))

(assert (=> b!184707 (= res!153703 (bvsle (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283910))) (currentByte!9008 (_2!8639 lt!283910)) (currentBit!9003 (_2!8639 lt!283910)))))))

(declare-fun b!184708 () Bool)

(declare-fun e!127945 () Bool)

(assert (=> b!184708 (= e!127944 e!127945)))

(declare-fun res!153704 () Bool)

(assert (=> b!184708 (=> res!153704 e!127945)))

(assert (=> b!184708 (= res!153704 (= (size!4319 (buf!4774 (_2!8639 lt!283904))) #b00000000000000000000000000000000))))

(declare-fun b!184709 () Bool)

(assert (=> b!184709 (= e!127945 (arrayBitRangesEq!0 (buf!4774 (_2!8639 lt!283904)) (buf!4774 (_2!8639 lt!283910)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904)))))))

(assert (= (and d!63649 res!153705) b!184707))

(assert (= (and b!184707 res!153703) b!184708))

(assert (= (and b!184708 (not res!153704)) b!184709))

(assert (=> b!184707 m!286865))

(assert (=> b!184707 m!286805))

(assert (=> b!184709 m!286865))

(assert (=> b!184709 m!286865))

(declare-fun m!286967 () Bool)

(assert (=> b!184709 m!286967))

(assert (=> b!184620 d!63649))

(declare-fun d!63651 () Bool)

(assert (=> d!63651 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 thiss!1204))))))

(declare-fun bs!15854 () Bool)

(assert (= bs!15854 d!63651))

(assert (=> bs!15854 m!286879))

(assert (=> start!40222 d!63651))

(declare-fun d!63653 () Bool)

(assert (=> d!63653 (= (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 thiss!1204))) (and (bvsge (currentBit!9003 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9003 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9008 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9008 thiss!1204) (size!4319 (buf!4774 thiss!1204))) (and (= (currentBit!9003 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9008 thiss!1204) (size!4319 (buf!4774 thiss!1204)))))))))

(assert (=> b!184623 d!63653))

(declare-fun d!63655 () Bool)

(assert (=> d!63655 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204)) lt!283914) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204))) lt!283914))))

(declare-fun bs!15855 () Bool)

(assert (= bs!15855 d!63655))

(assert (=> bs!15855 m!286965))

(assert (=> b!184624 d!63655))

(assert (=> b!184622 d!63643))

(assert (=> b!184622 d!63645))

(declare-fun b!184720 () Bool)

(declare-fun res!153717 () Bool)

(declare-fun e!127950 () Bool)

(assert (=> b!184720 (=> (not res!153717) (not e!127950))))

(declare-fun lt!284034 () tuple2!15988)

(assert (=> b!184720 (= res!153717 (isPrefixOf!0 thiss!1204 (_2!8639 lt!284034)))))

(declare-fun d!63657 () Bool)

(assert (=> d!63657 e!127950))

(declare-fun res!153714 () Bool)

(assert (=> d!63657 (=> (not res!153714) (not e!127950))))

(assert (=> d!63657 (= res!153714 (= (size!4319 (buf!4774 thiss!1204)) (size!4319 (buf!4774 (_2!8639 lt!284034)))))))

(declare-fun choose!16 (BitStream!7746 Bool) tuple2!15988)

(assert (=> d!63657 (= lt!284034 (choose!16 thiss!1204 lt!283916))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!63657 (validate_offset_bit!0 ((_ sign_extend 32) (size!4319 (buf!4774 thiss!1204))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204)))))

(assert (=> d!63657 (= (appendBit!0 thiss!1204 lt!283916) lt!284034)))

(declare-fun b!184721 () Bool)

(declare-fun e!127951 () Bool)

(assert (=> b!184721 (= e!127950 e!127951)))

(declare-fun res!153716 () Bool)

(assert (=> b!184721 (=> (not res!153716) (not e!127951))))

(declare-fun lt!284036 () tuple2!15990)

(assert (=> b!184721 (= res!153716 (and (= (_2!8640 lt!284036) lt!283916) (= (_1!8640 lt!284036) (_2!8639 lt!284034))))))

(assert (=> b!184721 (= lt!284036 (readBitPure!0 (readerFrom!0 (_2!8639 lt!284034) (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204))))))

(declare-fun b!184719 () Bool)

(declare-fun res!153715 () Bool)

(assert (=> b!184719 (=> (not res!153715) (not e!127950))))

(declare-fun lt!284035 () (_ BitVec 64))

(declare-fun lt!284033 () (_ BitVec 64))

(assert (=> b!184719 (= res!153715 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284034))) (currentByte!9008 (_2!8639 lt!284034)) (currentBit!9003 (_2!8639 lt!284034))) (bvadd lt!284035 lt!284033)))))

(assert (=> b!184719 (or (not (= (bvand lt!284035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284033 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284035 lt!284033) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184719 (= lt!284033 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!184719 (= lt!284035 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(declare-fun b!184722 () Bool)

(assert (=> b!184722 (= e!127951 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!284036))) (currentByte!9008 (_1!8640 lt!284036)) (currentBit!9003 (_1!8640 lt!284036))) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284034))) (currentByte!9008 (_2!8639 lt!284034)) (currentBit!9003 (_2!8639 lt!284034)))))))

(assert (= (and d!63657 res!153714) b!184719))

(assert (= (and b!184719 res!153715) b!184720))

(assert (= (and b!184720 res!153717) b!184721))

(assert (= (and b!184721 res!153716) b!184722))

(declare-fun m!286969 () Bool)

(assert (=> b!184720 m!286969))

(declare-fun m!286971 () Bool)

(assert (=> b!184722 m!286971))

(declare-fun m!286973 () Bool)

(assert (=> b!184722 m!286973))

(declare-fun m!286975 () Bool)

(assert (=> d!63657 m!286975))

(declare-fun m!286977 () Bool)

(assert (=> d!63657 m!286977))

(assert (=> b!184719 m!286973))

(assert (=> b!184719 m!286867))

(declare-fun m!286979 () Bool)

(assert (=> b!184721 m!286979))

(assert (=> b!184721 m!286979))

(declare-fun m!286981 () Bool)

(assert (=> b!184721 m!286981))

(assert (=> b!184622 d!63657))

(assert (=> b!184616 d!63635))

(declare-fun b!184733 () Bool)

(declare-fun res!153726 () Bool)

(declare-fun e!127956 () Bool)

(assert (=> b!184733 (=> (not res!153726) (not e!127956))))

(declare-fun lt!284095 () tuple2!15992)

(assert (=> b!184733 (= res!153726 (isPrefixOf!0 (_1!8641 lt!284095) (_2!8639 lt!283904)))))

(declare-fun b!184734 () Bool)

(declare-fun e!127957 () Unit!13213)

(declare-fun lt!284093 () Unit!13213)

(assert (=> b!184734 (= e!127957 lt!284093)))

(declare-fun lt!284096 () (_ BitVec 64))

(assert (=> b!184734 (= lt!284096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!284086 () (_ BitVec 64))

(assert (=> b!184734 (= lt!284086 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9790 array!9790 (_ BitVec 64) (_ BitVec 64)) Unit!13213)

(assert (=> b!184734 (= lt!284093 (arrayBitRangesEqSymmetric!0 (buf!4774 (_2!8639 lt!283904)) (buf!4774 (_2!8639 lt!283910)) lt!284096 lt!284086))))

(assert (=> b!184734 (arrayBitRangesEq!0 (buf!4774 (_2!8639 lt!283910)) (buf!4774 (_2!8639 lt!283904)) lt!284096 lt!284086)))

(declare-fun lt!284088 () (_ BitVec 64))

(declare-fun lt!284082 () (_ BitVec 64))

(declare-fun b!184735 () Bool)

(assert (=> b!184735 (= e!127956 (= (_1!8641 lt!284095) (withMovedBitIndex!0 (_2!8641 lt!284095) (bvsub lt!284082 lt!284088))))))

(assert (=> b!184735 (or (= (bvand lt!284082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284088 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284082 lt!284088) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184735 (= lt!284088 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283910))) (currentByte!9008 (_2!8639 lt!283910)) (currentBit!9003 (_2!8639 lt!283910))))))

(assert (=> b!184735 (= lt!284082 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(declare-fun d!63659 () Bool)

(assert (=> d!63659 e!127956))

(declare-fun res!153725 () Bool)

(assert (=> d!63659 (=> (not res!153725) (not e!127956))))

(assert (=> d!63659 (= res!153725 (isPrefixOf!0 (_1!8641 lt!284095) (_2!8641 lt!284095)))))

(declare-fun lt!284090 () BitStream!7746)

(assert (=> d!63659 (= lt!284095 (tuple2!15993 lt!284090 (_2!8639 lt!283910)))))

(declare-fun lt!284087 () Unit!13213)

(declare-fun lt!284085 () Unit!13213)

(assert (=> d!63659 (= lt!284087 lt!284085)))

(assert (=> d!63659 (isPrefixOf!0 lt!284090 (_2!8639 lt!283910))))

(assert (=> d!63659 (= lt!284085 (lemmaIsPrefixTransitive!0 lt!284090 (_2!8639 lt!283910) (_2!8639 lt!283910)))))

(declare-fun lt!284079 () Unit!13213)

(declare-fun lt!284081 () Unit!13213)

(assert (=> d!63659 (= lt!284079 lt!284081)))

(assert (=> d!63659 (isPrefixOf!0 lt!284090 (_2!8639 lt!283910))))

(assert (=> d!63659 (= lt!284081 (lemmaIsPrefixTransitive!0 lt!284090 (_2!8639 lt!283904) (_2!8639 lt!283910)))))

(declare-fun lt!284094 () Unit!13213)

(assert (=> d!63659 (= lt!284094 e!127957)))

(declare-fun c!9429 () Bool)

(assert (=> d!63659 (= c!9429 (not (= (size!4319 (buf!4774 (_2!8639 lt!283904))) #b00000000000000000000000000000000)))))

(declare-fun lt!284092 () Unit!13213)

(declare-fun lt!284083 () Unit!13213)

(assert (=> d!63659 (= lt!284092 lt!284083)))

(assert (=> d!63659 (isPrefixOf!0 (_2!8639 lt!283910) (_2!8639 lt!283910))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7746) Unit!13213)

(assert (=> d!63659 (= lt!284083 (lemmaIsPrefixRefl!0 (_2!8639 lt!283910)))))

(declare-fun lt!284078 () Unit!13213)

(declare-fun lt!284080 () Unit!13213)

(assert (=> d!63659 (= lt!284078 lt!284080)))

(assert (=> d!63659 (= lt!284080 (lemmaIsPrefixRefl!0 (_2!8639 lt!283910)))))

(declare-fun lt!284084 () Unit!13213)

(declare-fun lt!284089 () Unit!13213)

(assert (=> d!63659 (= lt!284084 lt!284089)))

(assert (=> d!63659 (isPrefixOf!0 lt!284090 lt!284090)))

(assert (=> d!63659 (= lt!284089 (lemmaIsPrefixRefl!0 lt!284090))))

(declare-fun lt!284077 () Unit!13213)

(declare-fun lt!284091 () Unit!13213)

(assert (=> d!63659 (= lt!284077 lt!284091)))

(assert (=> d!63659 (isPrefixOf!0 (_2!8639 lt!283904) (_2!8639 lt!283904))))

(assert (=> d!63659 (= lt!284091 (lemmaIsPrefixRefl!0 (_2!8639 lt!283904)))))

(assert (=> d!63659 (= lt!284090 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(assert (=> d!63659 (isPrefixOf!0 (_2!8639 lt!283904) (_2!8639 lt!283910))))

(assert (=> d!63659 (= (reader!0 (_2!8639 lt!283904) (_2!8639 lt!283910)) lt!284095)))

(declare-fun b!184736 () Bool)

(declare-fun res!153724 () Bool)

(assert (=> b!184736 (=> (not res!153724) (not e!127956))))

(assert (=> b!184736 (= res!153724 (isPrefixOf!0 (_2!8641 lt!284095) (_2!8639 lt!283910)))))

(declare-fun b!184737 () Bool)

(declare-fun Unit!13217 () Unit!13213)

(assert (=> b!184737 (= e!127957 Unit!13217)))

(assert (= (and d!63659 c!9429) b!184734))

(assert (= (and d!63659 (not c!9429)) b!184737))

(assert (= (and d!63659 res!153725) b!184733))

(assert (= (and b!184733 res!153726) b!184736))

(assert (= (and b!184736 res!153724) b!184735))

(assert (=> b!184734 m!286865))

(declare-fun m!286983 () Bool)

(assert (=> b!184734 m!286983))

(declare-fun m!286985 () Bool)

(assert (=> b!184734 m!286985))

(declare-fun m!286987 () Bool)

(assert (=> b!184733 m!286987))

(declare-fun m!286989 () Bool)

(assert (=> b!184735 m!286989))

(assert (=> b!184735 m!286805))

(assert (=> b!184735 m!286865))

(declare-fun m!286991 () Bool)

(assert (=> b!184736 m!286991))

(declare-fun m!286993 () Bool)

(assert (=> d!63659 m!286993))

(assert (=> d!63659 m!286871))

(declare-fun m!286995 () Bool)

(assert (=> d!63659 m!286995))

(declare-fun m!286997 () Bool)

(assert (=> d!63659 m!286997))

(declare-fun m!286999 () Bool)

(assert (=> d!63659 m!286999))

(declare-fun m!287001 () Bool)

(assert (=> d!63659 m!287001))

(declare-fun m!287003 () Bool)

(assert (=> d!63659 m!287003))

(declare-fun m!287005 () Bool)

(assert (=> d!63659 m!287005))

(declare-fun m!287007 () Bool)

(assert (=> d!63659 m!287007))

(declare-fun m!287009 () Bool)

(assert (=> d!63659 m!287009))

(declare-fun m!287011 () Bool)

(assert (=> d!63659 m!287011))

(assert (=> b!184625 d!63659))

(declare-fun d!63661 () Bool)

(assert (=> d!63661 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!184625 d!63661))

(declare-fun d!63663 () Bool)

(declare-datatypes ((tuple2!16006 0))(
  ( (tuple2!16007 (_1!8648 (_ BitVec 64)) (_2!8648 BitStream!7746)) )
))
(declare-fun lt!284099 () tuple2!16006)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16006)

(assert (=> d!63663 (= lt!284099 (readNBitsLSBFirstsLoop!0 (_1!8641 lt!283905) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283897))))

(assert (=> d!63663 (= (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!283905) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283897) (tuple2!15995 (_2!8648 lt!284099) (_1!8648 lt!284099)))))

(declare-fun bs!15856 () Bool)

(assert (= bs!15856 d!63663))

(declare-fun m!287013 () Bool)

(assert (=> bs!15856 m!287013))

(assert (=> b!184625 d!63663))

(declare-fun d!63665 () Bool)

(declare-fun e!127958 () Bool)

(assert (=> d!63665 e!127958))

(declare-fun res!153728 () Bool)

(assert (=> d!63665 (=> (not res!153728) (not e!127958))))

(declare-fun lt!284100 () (_ BitVec 64))

(declare-fun lt!284105 () (_ BitVec 64))

(declare-fun lt!284104 () (_ BitVec 64))

(assert (=> d!63665 (= res!153728 (= lt!284105 (bvsub lt!284100 lt!284104)))))

(assert (=> d!63665 (or (= (bvand lt!284100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284104 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284100 lt!284104) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63665 (= lt!284104 (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283911)))) ((_ sign_extend 32) (currentByte!9008 (_1!8640 lt!283911))) ((_ sign_extend 32) (currentBit!9003 (_1!8640 lt!283911)))))))

(declare-fun lt!284103 () (_ BitVec 64))

(declare-fun lt!284101 () (_ BitVec 64))

(assert (=> d!63665 (= lt!284100 (bvmul lt!284103 lt!284101))))

(assert (=> d!63665 (or (= lt!284103 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284101 (bvsdiv (bvmul lt!284103 lt!284101) lt!284103)))))

(assert (=> d!63665 (= lt!284101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63665 (= lt!284103 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283911)))))))

(assert (=> d!63665 (= lt!284105 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9008 (_1!8640 lt!283911))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9003 (_1!8640 lt!283911)))))))

(assert (=> d!63665 (invariant!0 (currentBit!9003 (_1!8640 lt!283911)) (currentByte!9008 (_1!8640 lt!283911)) (size!4319 (buf!4774 (_1!8640 lt!283911))))))

(assert (=> d!63665 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!283911))) (currentByte!9008 (_1!8640 lt!283911)) (currentBit!9003 (_1!8640 lt!283911))) lt!284105)))

(declare-fun b!184738 () Bool)

(declare-fun res!153727 () Bool)

(assert (=> b!184738 (=> (not res!153727) (not e!127958))))

(assert (=> b!184738 (= res!153727 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284105))))

(declare-fun b!184739 () Bool)

(declare-fun lt!284102 () (_ BitVec 64))

(assert (=> b!184739 (= e!127958 (bvsle lt!284105 (bvmul lt!284102 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184739 (or (= lt!284102 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284102 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284102)))))

(assert (=> b!184739 (= lt!284102 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283911)))))))

(assert (= (and d!63665 res!153728) b!184738))

(assert (= (and b!184738 res!153727) b!184739))

(declare-fun m!287015 () Bool)

(assert (=> d!63665 m!287015))

(declare-fun m!287017 () Bool)

(assert (=> d!63665 m!287017))

(assert (=> b!184625 d!63665))

(declare-fun d!63667 () Bool)

(declare-fun lt!284106 () tuple2!16004)

(assert (=> d!63667 (= lt!284106 (readBit!0 lt!283890))))

(assert (=> d!63667 (= (readBitPure!0 lt!283890) (tuple2!15991 (_2!8647 lt!284106) (_1!8647 lt!284106)))))

(declare-fun bs!15857 () Bool)

(assert (= bs!15857 d!63667))

(declare-fun m!287019 () Bool)

(assert (=> bs!15857 m!287019))

(assert (=> b!184625 d!63667))

(declare-fun d!63669 () Bool)

(assert (=> d!63669 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!283912) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904)))) lt!283912))))

(declare-fun bs!15858 () Bool)

(assert (= bs!15858 d!63669))

(declare-fun m!287021 () Bool)

(assert (=> bs!15858 m!287021))

(assert (=> b!184625 d!63669))

(declare-fun d!63671 () Bool)

(assert (=> d!63671 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!283912)))

(declare-fun lt!284109 () Unit!13213)

(declare-fun choose!9 (BitStream!7746 array!9790 (_ BitVec 64) BitStream!7746) Unit!13213)

(assert (=> d!63671 (= lt!284109 (choose!9 (_2!8639 lt!283904) (buf!4774 (_2!8639 lt!283910)) lt!283912 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904)))))))

(assert (=> d!63671 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8639 lt!283904) (buf!4774 (_2!8639 lt!283910)) lt!283912) lt!284109)))

(declare-fun bs!15859 () Bool)

(assert (= bs!15859 d!63671))

(assert (=> bs!15859 m!286843))

(declare-fun m!287023 () Bool)

(assert (=> bs!15859 m!287023))

(assert (=> b!184625 d!63671))

(declare-fun d!63673 () Bool)

(declare-fun lt!284110 () tuple2!16004)

(assert (=> d!63673 (= lt!284110 (readBit!0 (_1!8641 lt!283891)))))

(assert (=> d!63673 (= (readBitPure!0 (_1!8641 lt!283891)) (tuple2!15991 (_2!8647 lt!284110) (_1!8647 lt!284110)))))

(declare-fun bs!15860 () Bool)

(assert (= bs!15860 d!63673))

(declare-fun m!287025 () Bool)

(assert (=> bs!15860 m!287025))

(assert (=> b!184625 d!63673))

(declare-fun d!63675 () Bool)

(assert (=> d!63675 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204)) lt!283914)))

(declare-fun lt!284111 () Unit!13213)

(assert (=> d!63675 (= lt!284111 (choose!9 thiss!1204 (buf!4774 (_2!8639 lt!283910)) lt!283914 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204))))))

(assert (=> d!63675 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4774 (_2!8639 lt!283910)) lt!283914) lt!284111)))

(declare-fun bs!15861 () Bool)

(assert (= bs!15861 d!63675))

(assert (=> bs!15861 m!286841))

(declare-fun m!287027 () Bool)

(assert (=> bs!15861 m!287027))

(assert (=> b!184625 d!63675))

(declare-fun d!63677 () Bool)

(declare-fun e!127959 () Bool)

(assert (=> d!63677 e!127959))

(declare-fun res!153730 () Bool)

(assert (=> d!63677 (=> (not res!153730) (not e!127959))))

(declare-fun lt!284117 () (_ BitVec 64))

(declare-fun lt!284112 () (_ BitVec 64))

(declare-fun lt!284116 () (_ BitVec 64))

(assert (=> d!63677 (= res!153730 (= lt!284117 (bvsub lt!284112 lt!284116)))))

(assert (=> d!63677 (or (= (bvand lt!284112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284116 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284112 lt!284116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63677 (= lt!284116 (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283906)))) ((_ sign_extend 32) (currentByte!9008 (_1!8640 lt!283906))) ((_ sign_extend 32) (currentBit!9003 (_1!8640 lt!283906)))))))

(declare-fun lt!284115 () (_ BitVec 64))

(declare-fun lt!284113 () (_ BitVec 64))

(assert (=> d!63677 (= lt!284112 (bvmul lt!284115 lt!284113))))

(assert (=> d!63677 (or (= lt!284115 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284113 (bvsdiv (bvmul lt!284115 lt!284113) lt!284115)))))

(assert (=> d!63677 (= lt!284113 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63677 (= lt!284115 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283906)))))))

(assert (=> d!63677 (= lt!284117 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9008 (_1!8640 lt!283906))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9003 (_1!8640 lt!283906)))))))

(assert (=> d!63677 (invariant!0 (currentBit!9003 (_1!8640 lt!283906)) (currentByte!9008 (_1!8640 lt!283906)) (size!4319 (buf!4774 (_1!8640 lt!283906))))))

(assert (=> d!63677 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!283906))) (currentByte!9008 (_1!8640 lt!283906)) (currentBit!9003 (_1!8640 lt!283906))) lt!284117)))

(declare-fun b!184740 () Bool)

(declare-fun res!153729 () Bool)

(assert (=> b!184740 (=> (not res!153729) (not e!127959))))

(assert (=> b!184740 (= res!153729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284117))))

(declare-fun b!184741 () Bool)

(declare-fun lt!284114 () (_ BitVec 64))

(assert (=> b!184741 (= e!127959 (bvsle lt!284117 (bvmul lt!284114 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184741 (or (= lt!284114 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284114 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284114)))))

(assert (=> b!184741 (= lt!284114 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283906)))))))

(assert (= (and d!63677 res!153730) b!184740))

(assert (= (and b!184740 res!153729) b!184741))

(declare-fun m!287029 () Bool)

(assert (=> d!63677 m!287029))

(declare-fun m!287031 () Bool)

(assert (=> d!63677 m!287031))

(assert (=> b!184625 d!63677))

(declare-fun b!184742 () Bool)

(declare-fun res!153733 () Bool)

(declare-fun e!127960 () Bool)

(assert (=> b!184742 (=> (not res!153733) (not e!127960))))

(declare-fun lt!284136 () tuple2!15992)

(assert (=> b!184742 (= res!153733 (isPrefixOf!0 (_1!8641 lt!284136) thiss!1204))))

(declare-fun b!184743 () Bool)

(declare-fun e!127961 () Unit!13213)

(declare-fun lt!284134 () Unit!13213)

(assert (=> b!184743 (= e!127961 lt!284134)))

(declare-fun lt!284137 () (_ BitVec 64))

(assert (=> b!184743 (= lt!284137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!284127 () (_ BitVec 64))

(assert (=> b!184743 (= lt!284127 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(assert (=> b!184743 (= lt!284134 (arrayBitRangesEqSymmetric!0 (buf!4774 thiss!1204) (buf!4774 (_2!8639 lt!283910)) lt!284137 lt!284127))))

(assert (=> b!184743 (arrayBitRangesEq!0 (buf!4774 (_2!8639 lt!283910)) (buf!4774 thiss!1204) lt!284137 lt!284127)))

(declare-fun b!184744 () Bool)

(declare-fun lt!284129 () (_ BitVec 64))

(declare-fun lt!284123 () (_ BitVec 64))

(assert (=> b!184744 (= e!127960 (= (_1!8641 lt!284136) (withMovedBitIndex!0 (_2!8641 lt!284136) (bvsub lt!284123 lt!284129))))))

(assert (=> b!184744 (or (= (bvand lt!284123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284129 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284123 lt!284129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184744 (= lt!284129 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283910))) (currentByte!9008 (_2!8639 lt!283910)) (currentBit!9003 (_2!8639 lt!283910))))))

(assert (=> b!184744 (= lt!284123 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(declare-fun d!63679 () Bool)

(assert (=> d!63679 e!127960))

(declare-fun res!153732 () Bool)

(assert (=> d!63679 (=> (not res!153732) (not e!127960))))

(assert (=> d!63679 (= res!153732 (isPrefixOf!0 (_1!8641 lt!284136) (_2!8641 lt!284136)))))

(declare-fun lt!284131 () BitStream!7746)

(assert (=> d!63679 (= lt!284136 (tuple2!15993 lt!284131 (_2!8639 lt!283910)))))

(declare-fun lt!284128 () Unit!13213)

(declare-fun lt!284126 () Unit!13213)

(assert (=> d!63679 (= lt!284128 lt!284126)))

(assert (=> d!63679 (isPrefixOf!0 lt!284131 (_2!8639 lt!283910))))

(assert (=> d!63679 (= lt!284126 (lemmaIsPrefixTransitive!0 lt!284131 (_2!8639 lt!283910) (_2!8639 lt!283910)))))

(declare-fun lt!284120 () Unit!13213)

(declare-fun lt!284122 () Unit!13213)

(assert (=> d!63679 (= lt!284120 lt!284122)))

(assert (=> d!63679 (isPrefixOf!0 lt!284131 (_2!8639 lt!283910))))

(assert (=> d!63679 (= lt!284122 (lemmaIsPrefixTransitive!0 lt!284131 thiss!1204 (_2!8639 lt!283910)))))

(declare-fun lt!284135 () Unit!13213)

(assert (=> d!63679 (= lt!284135 e!127961)))

(declare-fun c!9430 () Bool)

(assert (=> d!63679 (= c!9430 (not (= (size!4319 (buf!4774 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!284133 () Unit!13213)

(declare-fun lt!284124 () Unit!13213)

(assert (=> d!63679 (= lt!284133 lt!284124)))

(assert (=> d!63679 (isPrefixOf!0 (_2!8639 lt!283910) (_2!8639 lt!283910))))

(assert (=> d!63679 (= lt!284124 (lemmaIsPrefixRefl!0 (_2!8639 lt!283910)))))

(declare-fun lt!284119 () Unit!13213)

(declare-fun lt!284121 () Unit!13213)

(assert (=> d!63679 (= lt!284119 lt!284121)))

(assert (=> d!63679 (= lt!284121 (lemmaIsPrefixRefl!0 (_2!8639 lt!283910)))))

(declare-fun lt!284125 () Unit!13213)

(declare-fun lt!284130 () Unit!13213)

(assert (=> d!63679 (= lt!284125 lt!284130)))

(assert (=> d!63679 (isPrefixOf!0 lt!284131 lt!284131)))

(assert (=> d!63679 (= lt!284130 (lemmaIsPrefixRefl!0 lt!284131))))

(declare-fun lt!284118 () Unit!13213)

(declare-fun lt!284132 () Unit!13213)

(assert (=> d!63679 (= lt!284118 lt!284132)))

(assert (=> d!63679 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!63679 (= lt!284132 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!63679 (= lt!284131 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)))))

(assert (=> d!63679 (isPrefixOf!0 thiss!1204 (_2!8639 lt!283910))))

(assert (=> d!63679 (= (reader!0 thiss!1204 (_2!8639 lt!283910)) lt!284136)))

(declare-fun b!184745 () Bool)

(declare-fun res!153731 () Bool)

(assert (=> b!184745 (=> (not res!153731) (not e!127960))))

(assert (=> b!184745 (= res!153731 (isPrefixOf!0 (_2!8641 lt!284136) (_2!8639 lt!283910)))))

(declare-fun b!184746 () Bool)

(declare-fun Unit!13218 () Unit!13213)

(assert (=> b!184746 (= e!127961 Unit!13218)))

(assert (= (and d!63679 c!9430) b!184743))

(assert (= (and d!63679 (not c!9430)) b!184746))

(assert (= (and d!63679 res!153732) b!184742))

(assert (= (and b!184742 res!153733) b!184745))

(assert (= (and b!184745 res!153731) b!184744))

(assert (=> b!184743 m!286867))

(declare-fun m!287033 () Bool)

(assert (=> b!184743 m!287033))

(declare-fun m!287035 () Bool)

(assert (=> b!184743 m!287035))

(declare-fun m!287037 () Bool)

(assert (=> b!184742 m!287037))

(declare-fun m!287039 () Bool)

(assert (=> b!184744 m!287039))

(assert (=> b!184744 m!286805))

(assert (=> b!184744 m!286867))

(declare-fun m!287041 () Bool)

(assert (=> b!184745 m!287041))

(assert (=> d!63679 m!286993))

(assert (=> d!63679 m!286807))

(declare-fun m!287043 () Bool)

(assert (=> d!63679 m!287043))

(declare-fun m!287045 () Bool)

(assert (=> d!63679 m!287045))

(declare-fun m!287047 () Bool)

(assert (=> d!63679 m!287047))

(declare-fun m!287049 () Bool)

(assert (=> d!63679 m!287049))

(declare-fun m!287051 () Bool)

(assert (=> d!63679 m!287051))

(declare-fun m!287053 () Bool)

(assert (=> d!63679 m!287053))

(assert (=> d!63679 m!287007))

(declare-fun m!287055 () Bool)

(assert (=> d!63679 m!287055))

(declare-fun m!287057 () Bool)

(assert (=> d!63679 m!287057))

(assert (=> b!184625 d!63679))

(declare-fun d!63681 () Bool)

(declare-fun e!127964 () Bool)

(assert (=> d!63681 e!127964))

(declare-fun res!153736 () Bool)

(assert (=> d!63681 (=> (not res!153736) (not e!127964))))

(declare-fun lt!284146 () tuple2!15990)

(declare-fun lt!284149 () tuple2!15990)

(assert (=> d!63681 (= res!153736 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!284146))) (currentByte!9008 (_1!8640 lt!284146)) (currentBit!9003 (_1!8640 lt!284146))) (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!284149))) (currentByte!9008 (_1!8640 lt!284149)) (currentBit!9003 (_1!8640 lt!284149)))))))

(declare-fun lt!284148 () Unit!13213)

(declare-fun lt!284147 () BitStream!7746)

(declare-fun choose!50 (BitStream!7746 BitStream!7746 BitStream!7746 tuple2!15990 tuple2!15990 BitStream!7746 Bool tuple2!15990 tuple2!15990 BitStream!7746 Bool) Unit!13213)

(assert (=> d!63681 (= lt!284148 (choose!50 lt!283890 (_2!8639 lt!283910) lt!284147 lt!284146 (tuple2!15991 (_1!8640 lt!284146) (_2!8640 lt!284146)) (_1!8640 lt!284146) (_2!8640 lt!284146) lt!284149 (tuple2!15991 (_1!8640 lt!284149) (_2!8640 lt!284149)) (_1!8640 lt!284149) (_2!8640 lt!284149)))))

(assert (=> d!63681 (= lt!284149 (readBitPure!0 lt!284147))))

(assert (=> d!63681 (= lt!284146 (readBitPure!0 lt!283890))))

(assert (=> d!63681 (= lt!284147 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 lt!283890) (currentBit!9003 lt!283890)))))

(assert (=> d!63681 (invariant!0 (currentBit!9003 lt!283890) (currentByte!9008 lt!283890) (size!4319 (buf!4774 (_2!8639 lt!283910))))))

(assert (=> d!63681 (= (readBitPrefixLemma!0 lt!283890 (_2!8639 lt!283910)) lt!284148)))

(declare-fun b!184749 () Bool)

(assert (=> b!184749 (= e!127964 (= (_2!8640 lt!284146) (_2!8640 lt!284149)))))

(assert (= (and d!63681 res!153736) b!184749))

(declare-fun m!287059 () Bool)

(assert (=> d!63681 m!287059))

(declare-fun m!287061 () Bool)

(assert (=> d!63681 m!287061))

(assert (=> d!63681 m!286835))

(declare-fun m!287063 () Bool)

(assert (=> d!63681 m!287063))

(declare-fun m!287065 () Bool)

(assert (=> d!63681 m!287065))

(declare-fun m!287067 () Bool)

(assert (=> d!63681 m!287067))

(assert (=> b!184625 d!63681))

(declare-fun d!63683 () Bool)

(assert (=> d!63683 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204)) lt!283914) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 thiss!1204)) ((_ sign_extend 32) (currentBit!9003 thiss!1204))) lt!283914))))

(declare-fun bs!15862 () Bool)

(assert (= bs!15862 d!63683))

(declare-fun m!287069 () Bool)

(assert (=> bs!15862 m!287069))

(assert (=> b!184625 d!63683))

(declare-fun d!63685 () Bool)

(declare-fun lt!284150 () tuple2!16004)

(assert (=> d!63685 (= lt!284150 (readBit!0 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204))))))

(assert (=> d!63685 (= (readBitPure!0 (BitStream!7747 (buf!4774 (_2!8639 lt!283910)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204))) (tuple2!15991 (_2!8647 lt!284150) (_1!8647 lt!284150)))))

(declare-fun bs!15863 () Bool)

(assert (= bs!15863 d!63685))

(declare-fun m!287071 () Bool)

(assert (=> bs!15863 m!287071))

(assert (=> b!184625 d!63685))

(declare-fun lt!284151 () tuple2!16006)

(declare-fun d!63687 () Bool)

(assert (=> d!63687 (= lt!284151 (readNBitsLSBFirstsLoop!0 (_1!8641 lt!283891) nBits!348 i!590 lt!283901))))

(assert (=> d!63687 (= (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!283891) nBits!348 i!590 lt!283901) (tuple2!15995 (_2!8648 lt!284151) (_1!8648 lt!284151)))))

(declare-fun bs!15864 () Bool)

(assert (= bs!15864 d!63687))

(declare-fun m!287073 () Bool)

(assert (=> bs!15864 m!287073))

(assert (=> b!184625 d!63687))

(declare-fun d!63689 () Bool)

(assert (=> d!63689 (= (invariant!0 (currentBit!9003 thiss!1204) (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283904)))) (and (bvsge (currentBit!9003 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9003 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9008 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283904)))) (and (= (currentBit!9003 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9008 thiss!1204) (size!4319 (buf!4774 (_2!8639 lt!283904))))))))))

(assert (=> b!184625 d!63689))

(declare-fun d!63691 () Bool)

(assert (=> d!63691 (= (invariant!0 (currentBit!9003 (_2!8639 lt!283910)) (currentByte!9008 (_2!8639 lt!283910)) (size!4319 (buf!4774 (_2!8639 lt!283910)))) (and (bvsge (currentBit!9003 (_2!8639 lt!283910)) #b00000000000000000000000000000000) (bvslt (currentBit!9003 (_2!8639 lt!283910)) #b00000000000000000000000000001000) (bvsge (currentByte!9008 (_2!8639 lt!283910)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9008 (_2!8639 lt!283910)) (size!4319 (buf!4774 (_2!8639 lt!283910)))) (and (= (currentBit!9003 (_2!8639 lt!283910)) #b00000000000000000000000000000000) (= (currentByte!9008 (_2!8639 lt!283910)) (size!4319 (buf!4774 (_2!8639 lt!283910))))))))))

(assert (=> b!184629 d!63691))

(declare-fun d!63693 () Bool)

(declare-fun e!127965 () Bool)

(assert (=> d!63693 e!127965))

(declare-fun res!153738 () Bool)

(assert (=> d!63693 (=> (not res!153738) (not e!127965))))

(declare-fun lt!284157 () (_ BitVec 64))

(declare-fun lt!284152 () (_ BitVec 64))

(declare-fun lt!284156 () (_ BitVec 64))

(assert (=> d!63693 (= res!153738 (= lt!284157 (bvsub lt!284152 lt!284156)))))

(assert (=> d!63693 (or (= (bvand lt!284152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284152 lt!284156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63693 (= lt!284156 (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283910))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283910)))))))

(declare-fun lt!284155 () (_ BitVec 64))

(declare-fun lt!284153 () (_ BitVec 64))

(assert (=> d!63693 (= lt!284152 (bvmul lt!284155 lt!284153))))

(assert (=> d!63693 (or (= lt!284155 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284153 (bvsdiv (bvmul lt!284155 lt!284153) lt!284155)))))

(assert (=> d!63693 (= lt!284153 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63693 (= lt!284155 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))))))

(assert (=> d!63693 (= lt!284157 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283910))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283910)))))))

(assert (=> d!63693 (invariant!0 (currentBit!9003 (_2!8639 lt!283910)) (currentByte!9008 (_2!8639 lt!283910)) (size!4319 (buf!4774 (_2!8639 lt!283910))))))

(assert (=> d!63693 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283910))) (currentByte!9008 (_2!8639 lt!283910)) (currentBit!9003 (_2!8639 lt!283910))) lt!284157)))

(declare-fun b!184750 () Bool)

(declare-fun res!153737 () Bool)

(assert (=> b!184750 (=> (not res!153737) (not e!127965))))

(assert (=> b!184750 (= res!153737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284157))))

(declare-fun b!184751 () Bool)

(declare-fun lt!284154 () (_ BitVec 64))

(assert (=> b!184751 (= e!127965 (bvsle lt!284157 (bvmul lt!284154 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184751 (or (= lt!284154 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284154 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284154)))))

(assert (=> b!184751 (= lt!284154 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283910)))))))

(assert (= (and d!63693 res!153738) b!184750))

(assert (= (and b!184750 res!153737) b!184751))

(declare-fun m!287075 () Bool)

(assert (=> d!63693 m!287075))

(assert (=> d!63693 m!286875))

(assert (=> b!184627 d!63693))

(declare-fun d!63695 () Bool)

(declare-fun res!153741 () Bool)

(declare-fun e!127966 () Bool)

(assert (=> d!63695 (=> (not res!153741) (not e!127966))))

(assert (=> d!63695 (= res!153741 (= (size!4319 (buf!4774 thiss!1204)) (size!4319 (buf!4774 (_2!8639 lt!283910)))))))

(assert (=> d!63695 (= (isPrefixOf!0 thiss!1204 (_2!8639 lt!283910)) e!127966)))

(declare-fun b!184752 () Bool)

(declare-fun res!153739 () Bool)

(assert (=> b!184752 (=> (not res!153739) (not e!127966))))

(assert (=> b!184752 (= res!153739 (bvsle (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204)) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283910))) (currentByte!9008 (_2!8639 lt!283910)) (currentBit!9003 (_2!8639 lt!283910)))))))

(declare-fun b!184753 () Bool)

(declare-fun e!127967 () Bool)

(assert (=> b!184753 (= e!127966 e!127967)))

(declare-fun res!153740 () Bool)

(assert (=> b!184753 (=> res!153740 e!127967)))

(assert (=> b!184753 (= res!153740 (= (size!4319 (buf!4774 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!184754 () Bool)

(assert (=> b!184754 (= e!127967 (arrayBitRangesEq!0 (buf!4774 thiss!1204) (buf!4774 (_2!8639 lt!283910)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4319 (buf!4774 thiss!1204)) (currentByte!9008 thiss!1204) (currentBit!9003 thiss!1204))))))

(assert (= (and d!63695 res!153741) b!184752))

(assert (= (and b!184752 res!153739) b!184753))

(assert (= (and b!184753 (not res!153740)) b!184754))

(assert (=> b!184752 m!286867))

(assert (=> b!184752 m!286805))

(assert (=> b!184754 m!286867))

(assert (=> b!184754 m!286867))

(declare-fun m!287077 () Bool)

(assert (=> b!184754 m!287077))

(assert (=> b!184627 d!63695))

(declare-fun d!63697 () Bool)

(assert (=> d!63697 (isPrefixOf!0 thiss!1204 (_2!8639 lt!283910))))

(declare-fun lt!284160 () Unit!13213)

(declare-fun choose!30 (BitStream!7746 BitStream!7746 BitStream!7746) Unit!13213)

(assert (=> d!63697 (= lt!284160 (choose!30 thiss!1204 (_2!8639 lt!283904) (_2!8639 lt!283910)))))

(assert (=> d!63697 (isPrefixOf!0 thiss!1204 (_2!8639 lt!283904))))

(assert (=> d!63697 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8639 lt!283904) (_2!8639 lt!283910)) lt!284160)))

(declare-fun bs!15865 () Bool)

(assert (= bs!15865 d!63697))

(assert (=> bs!15865 m!286807))

(declare-fun m!287079 () Bool)

(assert (=> bs!15865 m!287079))

(assert (=> bs!15865 m!286821))

(assert (=> b!184627 d!63697))

(declare-fun b!184886 () Bool)

(declare-fun lt!284543 () tuple2!15990)

(declare-fun lt!284526 () tuple2!15988)

(assert (=> b!184886 (= lt!284543 (readBitPure!0 (readerFrom!0 (_2!8639 lt!284526) (currentBit!9003 (_2!8639 lt!283904)) (currentByte!9008 (_2!8639 lt!283904)))))))

(declare-fun lt!284569 () Bool)

(declare-fun res!153855 () Bool)

(assert (=> b!184886 (= res!153855 (and (= (_2!8640 lt!284543) lt!284569) (= (_1!8640 lt!284543) (_2!8639 lt!284526))))))

(declare-fun e!128050 () Bool)

(assert (=> b!184886 (=> (not res!153855) (not e!128050))))

(declare-fun e!128048 () Bool)

(assert (=> b!184886 (= e!128048 e!128050)))

(declare-fun b!184887 () Bool)

(declare-fun e!128044 () (_ BitVec 64))

(assert (=> b!184887 (= e!128044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!184888 () Bool)

(declare-fun e!128051 () Bool)

(declare-fun lt!284528 () tuple2!15990)

(declare-fun lt!284573 () tuple2!15990)

(assert (=> b!184888 (= e!128051 (= (_2!8640 lt!284528) (_2!8640 lt!284573)))))

(declare-fun d!63699 () Bool)

(declare-fun e!128046 () Bool)

(assert (=> d!63699 e!128046))

(declare-fun res!153865 () Bool)

(assert (=> d!63699 (=> (not res!153865) (not e!128046))))

(declare-fun lt!284547 () tuple2!15988)

(assert (=> d!63699 (= res!153865 (invariant!0 (currentBit!9003 (_2!8639 lt!284547)) (currentByte!9008 (_2!8639 lt!284547)) (size!4319 (buf!4774 (_2!8639 lt!284547)))))))

(declare-fun e!128049 () tuple2!15988)

(assert (=> d!63699 (= lt!284547 e!128049)))

(declare-fun c!9439 () Bool)

(assert (=> d!63699 (= c!9439 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!63699 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!63699 (= (appendBitsLSBFirstLoopTR!0 (_2!8639 lt!283904) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!284547)))

(declare-fun b!184889 () Bool)

(declare-fun res!153863 () Bool)

(assert (=> b!184889 (=> (not res!153863) (not e!128046))))

(declare-fun lt!284523 () (_ BitVec 64))

(declare-fun lt!284554 () (_ BitVec 64))

(assert (=> b!184889 (= res!153863 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284547))) (currentByte!9008 (_2!8639 lt!284547)) (currentBit!9003 (_2!8639 lt!284547))) (bvsub lt!284554 lt!284523)))))

(assert (=> b!184889 (or (= (bvand lt!284554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284523 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284554 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284554 lt!284523) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184889 (= lt!284523 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!284557 () (_ BitVec 64))

(declare-fun lt!284558 () (_ BitVec 64))

(assert (=> b!184889 (= lt!284554 (bvadd lt!284557 lt!284558))))

(assert (=> b!184889 (or (not (= (bvand lt!284557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284558 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284557 lt!284558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184889 (= lt!284558 ((_ sign_extend 32) nBits!348))))

(assert (=> b!184889 (= lt!284557 (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(declare-fun b!184890 () Bool)

(declare-fun res!153862 () Bool)

(assert (=> b!184890 (= res!153862 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284526))) (currentByte!9008 (_2!8639 lt!284526)) (currentBit!9003 (_2!8639 lt!284526))) (bvadd (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!184890 (=> (not res!153862) (not e!128048))))

(declare-fun b!184891 () Bool)

(declare-fun res!153858 () Bool)

(assert (=> b!184891 (= res!153858 (isPrefixOf!0 (_2!8639 lt!283904) (_2!8639 lt!284526)))))

(assert (=> b!184891 (=> (not res!153858) (not e!128048))))

(declare-fun b!184892 () Bool)

(declare-fun lt!284541 () tuple2!15988)

(assert (=> b!184892 (= e!128049 (tuple2!15989 (_1!8639 lt!284541) (_2!8639 lt!284541)))))

(assert (=> b!184892 (= lt!284569 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184892 (= lt!284526 (appendBit!0 (_2!8639 lt!283904) lt!284569))))

(declare-fun res!153864 () Bool)

(assert (=> b!184892 (= res!153864 (= (size!4319 (buf!4774 (_2!8639 lt!283904))) (size!4319 (buf!4774 (_2!8639 lt!284526)))))))

(assert (=> b!184892 (=> (not res!153864) (not e!128048))))

(assert (=> b!184892 e!128048))

(declare-fun lt!284532 () tuple2!15988)

(assert (=> b!184892 (= lt!284532 lt!284526)))

(assert (=> b!184892 (= lt!284541 (appendBitsLSBFirstLoopTR!0 (_2!8639 lt!284532) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!284527 () Unit!13213)

(assert (=> b!184892 (= lt!284527 (lemmaIsPrefixTransitive!0 (_2!8639 lt!283904) (_2!8639 lt!284532) (_2!8639 lt!284541)))))

(declare-fun call!2975 () Bool)

(assert (=> b!184892 call!2975))

(declare-fun lt!284568 () Unit!13213)

(assert (=> b!184892 (= lt!284568 lt!284527)))

(assert (=> b!184892 (invariant!0 (currentBit!9003 (_2!8639 lt!283904)) (currentByte!9008 (_2!8639 lt!283904)) (size!4319 (buf!4774 (_2!8639 lt!284532))))))

(declare-fun lt!284575 () BitStream!7746)

(assert (=> b!184892 (= lt!284575 (BitStream!7747 (buf!4774 (_2!8639 lt!284532)) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))))))

(assert (=> b!184892 (invariant!0 (currentBit!9003 lt!284575) (currentByte!9008 lt!284575) (size!4319 (buf!4774 (_2!8639 lt!284541))))))

(declare-fun lt!284561 () BitStream!7746)

(assert (=> b!184892 (= lt!284561 (BitStream!7747 (buf!4774 (_2!8639 lt!284541)) (currentByte!9008 lt!284575) (currentBit!9003 lt!284575)))))

(assert (=> b!184892 (= lt!284528 (readBitPure!0 lt!284575))))

(assert (=> b!184892 (= lt!284573 (readBitPure!0 lt!284561))))

(declare-fun lt!284533 () Unit!13213)

(assert (=> b!184892 (= lt!284533 (readBitPrefixLemma!0 lt!284575 (_2!8639 lt!284541)))))

(declare-fun res!153854 () Bool)

(assert (=> b!184892 (= res!153854 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!284528))) (currentByte!9008 (_1!8640 lt!284528)) (currentBit!9003 (_1!8640 lt!284528))) (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!284573))) (currentByte!9008 (_1!8640 lt!284573)) (currentBit!9003 (_1!8640 lt!284573)))))))

(assert (=> b!184892 (=> (not res!153854) (not e!128051))))

(assert (=> b!184892 e!128051))

(declare-fun lt!284537 () Unit!13213)

(assert (=> b!184892 (= lt!284537 lt!284533)))

(declare-fun lt!284522 () tuple2!15992)

(assert (=> b!184892 (= lt!284522 (reader!0 (_2!8639 lt!283904) (_2!8639 lt!284541)))))

(declare-fun lt!284567 () tuple2!15992)

(assert (=> b!184892 (= lt!284567 (reader!0 (_2!8639 lt!284532) (_2!8639 lt!284541)))))

(declare-fun lt!284520 () tuple2!15990)

(assert (=> b!184892 (= lt!284520 (readBitPure!0 (_1!8641 lt!284522)))))

(assert (=> b!184892 (= (_2!8640 lt!284520) lt!284569)))

(declare-fun lt!284556 () Unit!13213)

(declare-fun Unit!13219 () Unit!13213)

(assert (=> b!184892 (= lt!284556 Unit!13219)))

(declare-fun lt!284560 () (_ BitVec 64))

(assert (=> b!184892 (= lt!284560 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284536 () (_ BitVec 64))

(assert (=> b!184892 (= lt!284536 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284538 () Unit!13213)

(assert (=> b!184892 (= lt!284538 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8639 lt!283904) (buf!4774 (_2!8639 lt!284541)) lt!284536))))

(assert (=> b!184892 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!284541)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!284536)))

(declare-fun lt!284539 () Unit!13213)

(assert (=> b!184892 (= lt!284539 lt!284538)))

(declare-fun lt!284553 () tuple2!15994)

(assert (=> b!184892 (= lt!284553 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!284522) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284560))))

(declare-fun lt!284525 () (_ BitVec 64))

(assert (=> b!184892 (= lt!284525 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!284545 () Unit!13213)

(assert (=> b!184892 (= lt!284545 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8639 lt!284532) (buf!4774 (_2!8639 lt!284541)) lt!284525))))

(assert (=> b!184892 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!284541)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!284532))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!284532))) lt!284525)))

(declare-fun lt!284535 () Unit!13213)

(assert (=> b!184892 (= lt!284535 lt!284545)))

(declare-fun lt!284548 () tuple2!15994)

(assert (=> b!184892 (= lt!284548 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!284567) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!284560 (ite (_2!8640 lt!284520) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!284572 () tuple2!15994)

(assert (=> b!184892 (= lt!284572 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!284522) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284560))))

(declare-fun c!9440 () Bool)

(assert (=> b!184892 (= c!9440 (_2!8640 (readBitPure!0 (_1!8641 lt!284522))))))

(declare-fun lt!284546 () tuple2!15994)

(assert (=> b!184892 (= lt!284546 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8641 lt!284522) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!284560 e!128044)))))

(declare-fun lt!284521 () Unit!13213)

(assert (=> b!184892 (= lt!284521 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8641 lt!284522) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!284560))))

(assert (=> b!184892 (and (= (_2!8642 lt!284572) (_2!8642 lt!284546)) (= (_1!8642 lt!284572) (_1!8642 lt!284546)))))

(declare-fun lt!284564 () Unit!13213)

(assert (=> b!184892 (= lt!284564 lt!284521)))

(assert (=> b!184892 (= (_1!8641 lt!284522) (withMovedBitIndex!0 (_2!8641 lt!284522) (bvsub (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284541))) (currentByte!9008 (_2!8639 lt!284541)) (currentBit!9003 (_2!8639 lt!284541))))))))

(declare-fun lt!284574 () Unit!13213)

(declare-fun Unit!13220 () Unit!13213)

(assert (=> b!184892 (= lt!284574 Unit!13220)))

(assert (=> b!184892 (= (_1!8641 lt!284567) (withMovedBitIndex!0 (_2!8641 lt!284567) (bvsub (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284532))) (currentByte!9008 (_2!8639 lt!284532)) (currentBit!9003 (_2!8639 lt!284532))) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284541))) (currentByte!9008 (_2!8639 lt!284541)) (currentBit!9003 (_2!8639 lt!284541))))))))

(declare-fun lt!284563 () Unit!13213)

(declare-fun Unit!13221 () Unit!13213)

(assert (=> b!184892 (= lt!284563 Unit!13221)))

(assert (=> b!184892 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))) (bvsub (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284532))) (currentByte!9008 (_2!8639 lt!284532)) (currentBit!9003 (_2!8639 lt!284532))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!284562 () Unit!13213)

(declare-fun Unit!13222 () Unit!13213)

(assert (=> b!184892 (= lt!284562 Unit!13222)))

(assert (=> b!184892 (= (_2!8642 lt!284553) (_2!8642 lt!284548))))

(declare-fun lt!284566 () Unit!13213)

(declare-fun Unit!13223 () Unit!13213)

(assert (=> b!184892 (= lt!284566 Unit!13223)))

(assert (=> b!184892 (invariant!0 (currentBit!9003 (_2!8639 lt!284541)) (currentByte!9008 (_2!8639 lt!284541)) (size!4319 (buf!4774 (_2!8639 lt!284541))))))

(declare-fun lt!284551 () Unit!13213)

(declare-fun Unit!13224 () Unit!13213)

(assert (=> b!184892 (= lt!284551 Unit!13224)))

(assert (=> b!184892 (= (size!4319 (buf!4774 (_2!8639 lt!283904))) (size!4319 (buf!4774 (_2!8639 lt!284541))))))

(declare-fun lt!284542 () Unit!13213)

(declare-fun Unit!13225 () Unit!13213)

(assert (=> b!184892 (= lt!284542 Unit!13225)))

(assert (=> b!184892 (= (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284541))) (currentByte!9008 (_2!8639 lt!284541)) (currentBit!9003 (_2!8639 lt!284541))) (bvsub (bvadd (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!283904))) (currentByte!9008 (_2!8639 lt!283904)) (currentBit!9003 (_2!8639 lt!283904))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284555 () Unit!13213)

(declare-fun Unit!13227 () Unit!13213)

(assert (=> b!184892 (= lt!284555 Unit!13227)))

(declare-fun lt!284529 () Unit!13213)

(declare-fun Unit!13228 () Unit!13213)

(assert (=> b!184892 (= lt!284529 Unit!13228)))

(declare-fun lt!284531 () tuple2!15992)

(assert (=> b!184892 (= lt!284531 (reader!0 (_2!8639 lt!283904) (_2!8639 lt!284541)))))

(declare-fun lt!284571 () (_ BitVec 64))

(assert (=> b!184892 (= lt!284571 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!284549 () Unit!13213)

(assert (=> b!184892 (= lt!284549 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8639 lt!283904) (buf!4774 (_2!8639 lt!284541)) lt!284571))))

(assert (=> b!184892 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!284541)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!284571)))

(declare-fun lt!284550 () Unit!13213)

(assert (=> b!184892 (= lt!284550 lt!284549)))

(declare-fun lt!284552 () tuple2!15994)

(assert (=> b!184892 (= lt!284552 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!284531) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!153856 () Bool)

(assert (=> b!184892 (= res!153856 (= (_2!8642 lt!284552) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!128045 () Bool)

(assert (=> b!184892 (=> (not res!153856) (not e!128045))))

(assert (=> b!184892 e!128045))

(declare-fun lt!284540 () Unit!13213)

(declare-fun Unit!13229 () Unit!13213)

(assert (=> b!184892 (= lt!284540 Unit!13229)))

(declare-fun b!184893 () Bool)

(declare-fun e!128052 () Bool)

(assert (=> b!184893 (= e!128046 e!128052)))

(declare-fun res!153860 () Bool)

(assert (=> b!184893 (=> (not res!153860) (not e!128052))))

(declare-fun lt!284570 () tuple2!15994)

(assert (=> b!184893 (= res!153860 (= (_2!8642 lt!284570) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!284559 () tuple2!15992)

(assert (=> b!184893 (= lt!284570 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!284559) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!284544 () Unit!13213)

(declare-fun lt!284565 () Unit!13213)

(assert (=> b!184893 (= lt!284544 lt!284565)))

(declare-fun lt!284530 () (_ BitVec 64))

(assert (=> b!184893 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!284547)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!284530)))

(assert (=> b!184893 (= lt!284565 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8639 lt!283904) (buf!4774 (_2!8639 lt!284547)) lt!284530))))

(declare-fun e!128047 () Bool)

(assert (=> b!184893 e!128047))

(declare-fun res!153861 () Bool)

(assert (=> b!184893 (=> (not res!153861) (not e!128047))))

(assert (=> b!184893 (= res!153861 (and (= (size!4319 (buf!4774 (_2!8639 lt!283904))) (size!4319 (buf!4774 (_2!8639 lt!284547)))) (bvsge lt!284530 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184893 (= lt!284530 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!184893 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!184893 (= lt!284559 (reader!0 (_2!8639 lt!283904) (_2!8639 lt!284547)))))

(declare-fun b!184894 () Bool)

(assert (=> b!184894 (= e!128044 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!184895 () Bool)

(assert (=> b!184895 (= e!128045 (= (_1!8642 lt!284552) (_2!8641 lt!284531)))))

(declare-fun b!184896 () Bool)

(assert (=> b!184896 (= e!128047 (validate_offset_bits!1 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8639 lt!283904)))) ((_ sign_extend 32) (currentByte!9008 (_2!8639 lt!283904))) ((_ sign_extend 32) (currentBit!9003 (_2!8639 lt!283904))) lt!284530))))

(declare-fun bm!2972 () Bool)

(assert (=> bm!2972 (= call!2975 (isPrefixOf!0 (_2!8639 lt!283904) (ite c!9439 (_2!8639 lt!283904) (_2!8639 lt!284541))))))

(declare-fun b!184897 () Bool)

(declare-fun res!153859 () Bool)

(assert (=> b!184897 (=> (not res!153859) (not e!128046))))

(assert (=> b!184897 (= res!153859 (isPrefixOf!0 (_2!8639 lt!283904) (_2!8639 lt!284547)))))

(declare-fun b!184898 () Bool)

(declare-fun Unit!13230 () Unit!13213)

(assert (=> b!184898 (= e!128049 (tuple2!15989 Unit!13230 (_2!8639 lt!283904)))))

(declare-fun lt!284524 () Unit!13213)

(assert (=> b!184898 (= lt!284524 (lemmaIsPrefixRefl!0 (_2!8639 lt!283904)))))

(assert (=> b!184898 call!2975))

(declare-fun lt!284534 () Unit!13213)

(assert (=> b!184898 (= lt!284534 lt!284524)))

(declare-fun b!184899 () Bool)

(assert (=> b!184899 (= e!128052 (= (_1!8642 lt!284570) (_2!8641 lt!284559)))))

(declare-fun b!184900 () Bool)

(assert (=> b!184900 (= e!128050 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!284543))) (currentByte!9008 (_1!8640 lt!284543)) (currentBit!9003 (_1!8640 lt!284543))) (bitIndex!0 (size!4319 (buf!4774 (_2!8639 lt!284526))) (currentByte!9008 (_2!8639 lt!284526)) (currentBit!9003 (_2!8639 lt!284526)))))))

(declare-fun b!184901 () Bool)

(declare-fun res!153857 () Bool)

(assert (=> b!184901 (=> (not res!153857) (not e!128046))))

(assert (=> b!184901 (= res!153857 (= (size!4319 (buf!4774 (_2!8639 lt!283904))) (size!4319 (buf!4774 (_2!8639 lt!284547)))))))

(assert (= (and d!63699 c!9439) b!184898))

(assert (= (and d!63699 (not c!9439)) b!184892))

(assert (= (and b!184892 res!153864) b!184890))

(assert (= (and b!184890 res!153862) b!184891))

(assert (= (and b!184891 res!153858) b!184886))

(assert (= (and b!184886 res!153855) b!184900))

(assert (= (and b!184892 res!153854) b!184888))

(assert (= (and b!184892 c!9440) b!184894))

(assert (= (and b!184892 (not c!9440)) b!184887))

(assert (= (and b!184892 res!153856) b!184895))

(assert (= (or b!184898 b!184892) bm!2972))

(assert (= (and d!63699 res!153865) b!184901))

(assert (= (and b!184901 res!153857) b!184889))

(assert (= (and b!184889 res!153863) b!184897))

(assert (= (and b!184897 res!153859) b!184893))

(assert (= (and b!184893 res!153861) b!184896))

(assert (= (and b!184893 res!153860) b!184899))

(declare-fun m!287249 () Bool)

(assert (=> b!184889 m!287249))

(assert (=> b!184889 m!286865))

(declare-fun m!287251 () Bool)

(assert (=> d!63699 m!287251))

(declare-fun m!287253 () Bool)

(assert (=> bm!2972 m!287253))

(declare-fun m!287255 () Bool)

(assert (=> b!184886 m!287255))

(assert (=> b!184886 m!287255))

(declare-fun m!287257 () Bool)

(assert (=> b!184886 m!287257))

(declare-fun m!287259 () Bool)

(assert (=> b!184891 m!287259))

(declare-fun m!287261 () Bool)

(assert (=> b!184896 m!287261))

(assert (=> b!184898 m!286995))

(declare-fun m!287263 () Bool)

(assert (=> b!184897 m!287263))

(declare-fun m!287265 () Bool)

(assert (=> b!184890 m!287265))

(assert (=> b!184890 m!286865))

(assert (=> b!184892 m!286865))

(declare-fun m!287267 () Bool)

(assert (=> b!184892 m!287267))

(declare-fun m!287269 () Bool)

(assert (=> b!184892 m!287269))

(declare-fun m!287271 () Bool)

(assert (=> b!184892 m!287271))

(declare-fun m!287273 () Bool)

(assert (=> b!184892 m!287273))

(declare-fun m!287275 () Bool)

(assert (=> b!184892 m!287275))

(declare-fun m!287277 () Bool)

(assert (=> b!184892 m!287277))

(declare-fun m!287279 () Bool)

(assert (=> b!184892 m!287279))

(declare-fun m!287281 () Bool)

(assert (=> b!184892 m!287281))

(declare-fun m!287283 () Bool)

(assert (=> b!184892 m!287283))

(declare-fun m!287285 () Bool)

(assert (=> b!184892 m!287285))

(declare-fun m!287287 () Bool)

(assert (=> b!184892 m!287287))

(declare-fun m!287289 () Bool)

(assert (=> b!184892 m!287289))

(declare-fun m!287291 () Bool)

(assert (=> b!184892 m!287291))

(declare-fun m!287293 () Bool)

(assert (=> b!184892 m!287293))

(declare-fun m!287295 () Bool)

(assert (=> b!184892 m!287295))

(assert (=> b!184892 m!287293))

(declare-fun m!287297 () Bool)

(assert (=> b!184892 m!287297))

(declare-fun m!287299 () Bool)

(assert (=> b!184892 m!287299))

(declare-fun m!287301 () Bool)

(assert (=> b!184892 m!287301))

(declare-fun m!287303 () Bool)

(assert (=> b!184892 m!287303))

(declare-fun m!287305 () Bool)

(assert (=> b!184892 m!287305))

(declare-fun m!287307 () Bool)

(assert (=> b!184892 m!287307))

(declare-fun m!287309 () Bool)

(assert (=> b!184892 m!287309))

(declare-fun m!287311 () Bool)

(assert (=> b!184892 m!287311))

(declare-fun m!287313 () Bool)

(assert (=> b!184892 m!287313))

(declare-fun m!287315 () Bool)

(assert (=> b!184892 m!287315))

(declare-fun m!287317 () Bool)

(assert (=> b!184892 m!287317))

(declare-fun m!287319 () Bool)

(assert (=> b!184892 m!287319))

(declare-fun m!287321 () Bool)

(assert (=> b!184892 m!287321))

(declare-fun m!287323 () Bool)

(assert (=> b!184892 m!287323))

(declare-fun m!287325 () Bool)

(assert (=> b!184892 m!287325))

(declare-fun m!287327 () Bool)

(assert (=> b!184892 m!287327))

(declare-fun m!287329 () Bool)

(assert (=> b!184892 m!287329))

(declare-fun m!287331 () Bool)

(assert (=> b!184900 m!287331))

(assert (=> b!184900 m!287265))

(declare-fun m!287333 () Bool)

(assert (=> b!184893 m!287333))

(declare-fun m!287335 () Bool)

(assert (=> b!184893 m!287335))

(assert (=> b!184893 m!287309))

(declare-fun m!287337 () Bool)

(assert (=> b!184893 m!287337))

(assert (=> b!184893 m!287285))

(declare-fun m!287339 () Bool)

(assert (=> b!184893 m!287339))

(assert (=> b!184627 d!63699))

(declare-fun d!63799 () Bool)

(declare-fun res!153868 () Bool)

(declare-fun e!128055 () Bool)

(assert (=> d!63799 (=> (not res!153868) (not e!128055))))

(assert (=> d!63799 (= res!153868 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8641 lt!283891))))) (bvsub lt!283903 lt!283899)) (bvsle (bvsub lt!283903 lt!283899) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8641 lt!283891))))))))))

(assert (=> d!63799 (= (moveBitIndexPrecond!0 (_2!8641 lt!283891) (bvsub lt!283903 lt!283899)) e!128055)))

(declare-fun b!184905 () Bool)

(declare-fun lt!284578 () (_ BitVec 64))

(assert (=> b!184905 (= e!128055 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284578) (bvsle lt!284578 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4319 (buf!4774 (_2!8641 lt!283891))))))))))

(assert (=> b!184905 (= lt!284578 (bvadd (bitIndex!0 (size!4319 (buf!4774 (_2!8641 lt!283891))) (currentByte!9008 (_2!8641 lt!283891)) (currentBit!9003 (_2!8641 lt!283891))) (bvsub lt!283903 lt!283899)))))

(assert (= (and d!63799 res!153868) b!184905))

(declare-fun m!287341 () Bool)

(assert (=> b!184905 m!287341))

(assert (=> b!184628 d!63799))

(declare-fun d!63801 () Bool)

(declare-fun lt!284595 () tuple2!15994)

(declare-fun lt!284596 () tuple2!15994)

(assert (=> d!63801 (and (= (_2!8642 lt!284595) (_2!8642 lt!284596)) (= (_1!8642 lt!284595) (_1!8642 lt!284596)))))

(declare-fun lt!284592 () Unit!13213)

(declare-fun lt!284594 () BitStream!7746)

(declare-fun lt!284591 () Bool)

(declare-fun lt!284593 () (_ BitVec 64))

(declare-fun choose!56 (BitStream!7746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!15994 tuple2!15994 BitStream!7746 (_ BitVec 64) Bool BitStream!7746 (_ BitVec 64) tuple2!15994 tuple2!15994 BitStream!7746 (_ BitVec 64)) Unit!13213)

(assert (=> d!63801 (= lt!284592 (choose!56 (_1!8641 lt!283891) nBits!348 i!590 lt!283901 lt!284595 (tuple2!15995 (_1!8642 lt!284595) (_2!8642 lt!284595)) (_1!8642 lt!284595) (_2!8642 lt!284595) lt!284591 lt!284594 lt!284593 lt!284596 (tuple2!15995 (_1!8642 lt!284596) (_2!8642 lt!284596)) (_1!8642 lt!284596) (_2!8642 lt!284596)))))

(assert (=> d!63801 (= lt!284596 (readNBitsLSBFirstsLoopPure!0 lt!284594 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!284593))))

(assert (=> d!63801 (= lt!284593 (bvor lt!283901 (ite lt!284591 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63801 (= lt!284594 (withMovedBitIndex!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!63801 (= lt!284591 (_2!8640 (readBitPure!0 (_1!8641 lt!283891))))))

(assert (=> d!63801 (= lt!284595 (readNBitsLSBFirstsLoopPure!0 (_1!8641 lt!283891) nBits!348 i!590 lt!283901))))

(assert (=> d!63801 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8641 lt!283891) nBits!348 i!590 lt!283901) lt!284592)))

(declare-fun bs!15888 () Bool)

(assert (= bs!15888 d!63801))

(assert (=> bs!15888 m!286853))

(assert (=> bs!15888 m!286827))

(declare-fun m!287343 () Bool)

(assert (=> bs!15888 m!287343))

(assert (=> bs!15888 m!286817))

(declare-fun m!287345 () Bool)

(assert (=> bs!15888 m!287345))

(assert (=> b!184628 d!63801))

(declare-fun lt!284597 () tuple2!16006)

(declare-fun d!63803 () Bool)

(assert (=> d!63803 (= lt!284597 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283897))))

(assert (=> d!63803 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283897) (tuple2!15995 (_2!8648 lt!284597) (_1!8648 lt!284597)))))

(declare-fun bs!15889 () Bool)

(assert (= bs!15889 d!63803))

(assert (=> bs!15889 m!286817))

(declare-fun m!287347 () Bool)

(assert (=> bs!15889 m!287347))

(assert (=> b!184628 d!63803))

(declare-fun d!63805 () Bool)

(declare-fun e!128058 () Bool)

(assert (=> d!63805 e!128058))

(declare-fun res!153871 () Bool)

(assert (=> d!63805 (=> (not res!153871) (not e!128058))))

(declare-fun lt!284603 () (_ BitVec 64))

(declare-fun lt!284602 () BitStream!7746)

(assert (=> d!63805 (= res!153871 (= (bvadd lt!284603 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4319 (buf!4774 lt!284602)) (currentByte!9008 lt!284602) (currentBit!9003 lt!284602))))))

(assert (=> d!63805 (or (not (= (bvand lt!284603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!284603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!284603 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63805 (= lt!284603 (bitIndex!0 (size!4319 (buf!4774 (_1!8641 lt!283891))) (currentByte!9008 (_1!8641 lt!283891)) (currentBit!9003 (_1!8641 lt!283891))))))

(declare-fun moveBitIndex!0 (BitStream!7746 (_ BitVec 64)) tuple2!15988)

(assert (=> d!63805 (= lt!284602 (_2!8639 (moveBitIndex!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!63805 (moveBitIndexPrecond!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!63805 (= (withMovedBitIndex!0 (_1!8641 lt!283891) #b0000000000000000000000000000000000000000000000000000000000000001) lt!284602)))

(declare-fun b!184908 () Bool)

(assert (=> b!184908 (= e!128058 (= (size!4319 (buf!4774 (_1!8641 lt!283891))) (size!4319 (buf!4774 lt!284602))))))

(assert (= (and d!63805 res!153871) b!184908))

(declare-fun m!287349 () Bool)

(assert (=> d!63805 m!287349))

(declare-fun m!287351 () Bool)

(assert (=> d!63805 m!287351))

(declare-fun m!287353 () Bool)

(assert (=> d!63805 m!287353))

(declare-fun m!287355 () Bool)

(assert (=> d!63805 m!287355))

(assert (=> b!184628 d!63805))

(declare-fun d!63807 () Bool)

(declare-fun e!128059 () Bool)

(assert (=> d!63807 e!128059))

(declare-fun res!153873 () Bool)

(assert (=> d!63807 (=> (not res!153873) (not e!128059))))

(declare-fun lt!284604 () (_ BitVec 64))

(declare-fun lt!284609 () (_ BitVec 64))

(declare-fun lt!284608 () (_ BitVec 64))

(assert (=> d!63807 (= res!153873 (= lt!284609 (bvsub lt!284604 lt!284608)))))

(assert (=> d!63807 (or (= (bvand lt!284604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!284608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!284604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!284604 lt!284608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63807 (= lt!284608 (remainingBits!0 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283894)))) ((_ sign_extend 32) (currentByte!9008 (_1!8640 lt!283894))) ((_ sign_extend 32) (currentBit!9003 (_1!8640 lt!283894)))))))

(declare-fun lt!284607 () (_ BitVec 64))

(declare-fun lt!284605 () (_ BitVec 64))

(assert (=> d!63807 (= lt!284604 (bvmul lt!284607 lt!284605))))

(assert (=> d!63807 (or (= lt!284607 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!284605 (bvsdiv (bvmul lt!284607 lt!284605) lt!284607)))))

(assert (=> d!63807 (= lt!284605 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!63807 (= lt!284607 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283894)))))))

(assert (=> d!63807 (= lt!284609 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9008 (_1!8640 lt!283894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9003 (_1!8640 lt!283894)))))))

(assert (=> d!63807 (invariant!0 (currentBit!9003 (_1!8640 lt!283894)) (currentByte!9008 (_1!8640 lt!283894)) (size!4319 (buf!4774 (_1!8640 lt!283894))))))

(assert (=> d!63807 (= (bitIndex!0 (size!4319 (buf!4774 (_1!8640 lt!283894))) (currentByte!9008 (_1!8640 lt!283894)) (currentBit!9003 (_1!8640 lt!283894))) lt!284609)))

(declare-fun b!184909 () Bool)

(declare-fun res!153872 () Bool)

(assert (=> b!184909 (=> (not res!153872) (not e!128059))))

(assert (=> b!184909 (= res!153872 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!284609))))

(declare-fun b!184910 () Bool)

(declare-fun lt!284606 () (_ BitVec 64))

(assert (=> b!184910 (= e!128059 (bvsle lt!284609 (bvmul lt!284606 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!184910 (or (= lt!284606 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!284606 #b0000000000000000000000000000000000000000000000000000000000001000) lt!284606)))))

(assert (=> b!184910 (= lt!284606 ((_ sign_extend 32) (size!4319 (buf!4774 (_1!8640 lt!283894)))))))

(assert (= (and d!63807 res!153873) b!184909))

(assert (= (and b!184909 res!153872) b!184910))

(declare-fun m!287357 () Bool)

(assert (=> d!63807 m!287357))

(declare-fun m!287359 () Bool)

(assert (=> d!63807 m!287359))

(assert (=> b!184617 d!63807))

(check-sat (not d!63679) (not b!184900) (not d!63677) (not b!184743) (not d!63645) (not d!63683) (not b!184693) (not b!184742) (not b!184889) (not d!63643) (not b!184707) (not d!63669) (not b!184905) (not d!63663) (not d!63681) (not b!184736) (not b!184754) (not d!63685) (not b!184744) (not d!63671) (not b!184886) (not d!63659) (not d!63667) (not d!63803) (not d!63665) (not b!184891) (not b!184720) (not d!63805) (not d!63637) (not b!184893) (not b!184735) (not b!184896) (not d!63657) (not b!184733) (not b!184721) (not d!63673) (not b!184722) (not d!63699) (not b!184892) (not b!184709) (not d!63697) (not d!63807) (not d!63693) (not d!63675) (not d!63687) (not d!63655) (not b!184890) (not b!184698) (not b!184898) (not bm!2972) (not b!184719) (not b!184695) (not b!184745) (not d!63801) (not d!63639) (not b!184897) (not b!184752) (not b!184734) (not d!63651))
(check-sat)
