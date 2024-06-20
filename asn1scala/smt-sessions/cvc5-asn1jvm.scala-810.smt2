; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23906 () Bool)

(assert start!23906)

(declare-fun b!120823 () Bool)

(declare-fun e!79108 () Bool)

(declare-datatypes ((array!5366 0))(
  ( (array!5367 (arr!3021 (Array (_ BitVec 32) (_ BitVec 8))) (size!2428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4330 0))(
  ( (BitStream!4331 (buf!2862 array!5366) (currentByte!5547 (_ BitVec 32)) (currentBit!5542 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10120 0))(
  ( (tuple2!10121 (_1!5325 BitStream!4330) (_2!5325 Bool)) )
))
(declare-fun lt!188625 () tuple2!10120)

(declare-fun lt!188637 () tuple2!10120)

(assert (=> b!120823 (= e!79108 (= (_2!5325 lt!188625) (_2!5325 lt!188637)))))

(declare-fun b!120824 () Bool)

(declare-fun e!79112 () Bool)

(declare-fun e!79109 () Bool)

(assert (=> b!120824 (= e!79112 e!79109)))

(declare-fun res!100039 () Bool)

(assert (=> b!120824 (=> (not res!100039) (not e!79109))))

(declare-fun thiss!1305 () BitStream!4330)

(declare-fun lt!188640 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120824 (= res!100039 (validate_offset_bits!1 ((_ sign_extend 32) (size!2428 (buf!2862 thiss!1305))) ((_ sign_extend 32) (currentByte!5547 thiss!1305)) ((_ sign_extend 32) (currentBit!5542 thiss!1305)) lt!188640))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!120824 (= lt!188640 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!100041 () Bool)

(assert (=> start!23906 (=> (not res!100041) (not e!79112))))

(assert (=> start!23906 (= res!100041 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23906 e!79112))

(assert (=> start!23906 true))

(declare-fun e!79107 () Bool)

(declare-fun inv!12 (BitStream!4330) Bool)

(assert (=> start!23906 (and (inv!12 thiss!1305) e!79107)))

(declare-fun b!120825 () Bool)

(declare-fun e!79114 () Bool)

(declare-fun e!79113 () Bool)

(assert (=> b!120825 (= e!79114 e!79113)))

(declare-fun res!100043 () Bool)

(assert (=> b!120825 (=> (not res!100043) (not e!79113))))

(declare-fun lt!188617 () (_ BitVec 64))

(declare-fun lt!188615 () (_ BitVec 64))

(assert (=> b!120825 (= res!100043 (= lt!188617 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!188615)))))

(declare-datatypes ((Unit!7447 0))(
  ( (Unit!7448) )
))
(declare-datatypes ((tuple2!10122 0))(
  ( (tuple2!10123 (_1!5326 Unit!7447) (_2!5326 BitStream!4330)) )
))
(declare-fun lt!188635 () tuple2!10122)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120825 (= lt!188617 (bitIndex!0 (size!2428 (buf!2862 (_2!5326 lt!188635))) (currentByte!5547 (_2!5326 lt!188635)) (currentBit!5542 (_2!5326 lt!188635))))))

(assert (=> b!120825 (= lt!188615 (bitIndex!0 (size!2428 (buf!2862 thiss!1305)) (currentByte!5547 thiss!1305) (currentBit!5542 thiss!1305)))))

(declare-fun b!120826 () Bool)

(declare-fun res!100036 () Bool)

(assert (=> b!120826 (=> (not res!100036) (not e!79113))))

(declare-fun isPrefixOf!0 (BitStream!4330 BitStream!4330) Bool)

(assert (=> b!120826 (= res!100036 (isPrefixOf!0 thiss!1305 (_2!5326 lt!188635)))))

(declare-fun b!120827 () Bool)

(declare-fun res!100042 () Bool)

(assert (=> b!120827 (=> (not res!100042) (not e!79109))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120827 (= res!100042 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120828 () Bool)

(declare-fun e!79110 () Bool)

(assert (=> b!120828 (= e!79113 e!79110)))

(declare-fun res!100033 () Bool)

(assert (=> b!120828 (=> (not res!100033) (not e!79110))))

(declare-fun lt!188633 () tuple2!10120)

(declare-fun lt!188634 () Bool)

(assert (=> b!120828 (= res!100033 (and (= (_2!5325 lt!188633) lt!188634) (= (_1!5325 lt!188633) (_2!5326 lt!188635))))))

(declare-fun readBitPure!0 (BitStream!4330) tuple2!10120)

(declare-fun readerFrom!0 (BitStream!4330 (_ BitVec 32) (_ BitVec 32)) BitStream!4330)

(assert (=> b!120828 (= lt!188633 (readBitPure!0 (readerFrom!0 (_2!5326 lt!188635) (currentBit!5542 thiss!1305) (currentByte!5547 thiss!1305))))))

(declare-fun b!120829 () Bool)

(declare-fun e!79115 () Bool)

(declare-fun lt!188619 () tuple2!10122)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120829 (= e!79115 (invariant!0 (currentBit!5542 thiss!1305) (currentByte!5547 thiss!1305) (size!2428 (buf!2862 (_2!5326 lt!188619)))))))

(declare-fun b!120830 () Bool)

(declare-fun e!79111 () Bool)

(declare-fun lt!188623 () (_ BitVec 64))

(declare-fun lt!188636 () (_ BitVec 64))

(assert (=> b!120830 (= e!79111 (= lt!188623 (bvsub lt!188636 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!10124 0))(
  ( (tuple2!10125 (_1!5327 BitStream!4330) (_2!5327 BitStream!4330)) )
))
(declare-fun lt!188621 () tuple2!10124)

(declare-fun lt!188622 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4330 (_ BitVec 64)) BitStream!4330)

(assert (=> b!120830 (= (_1!5327 lt!188621) (withMovedBitIndex!0 (_2!5327 lt!188621) (bvsub lt!188636 lt!188622)))))

(assert (=> b!120830 (= lt!188636 (bitIndex!0 (size!2428 (buf!2862 (_2!5326 lt!188635))) (currentByte!5547 (_2!5326 lt!188635)) (currentBit!5542 (_2!5326 lt!188635))))))

(declare-fun lt!188620 () tuple2!10124)

(assert (=> b!120830 (= (_1!5327 lt!188620) (withMovedBitIndex!0 (_2!5327 lt!188620) (bvsub lt!188623 lt!188622)))))

(assert (=> b!120830 (= lt!188622 (bitIndex!0 (size!2428 (buf!2862 (_2!5326 lt!188619))) (currentByte!5547 (_2!5326 lt!188619)) (currentBit!5542 (_2!5326 lt!188619))))))

(assert (=> b!120830 (= lt!188623 (bitIndex!0 (size!2428 (buf!2862 thiss!1305)) (currentByte!5547 thiss!1305) (currentBit!5542 thiss!1305)))))

(declare-datatypes ((tuple2!10126 0))(
  ( (tuple2!10127 (_1!5328 BitStream!4330) (_2!5328 (_ BitVec 64))) )
))
(declare-fun lt!188639 () tuple2!10126)

(declare-fun lt!188618 () tuple2!10126)

(assert (=> b!120830 (and (= (_2!5328 lt!188639) (_2!5328 lt!188618)) (= (_1!5328 lt!188639) (_1!5328 lt!188618)))))

(declare-fun lt!188638 () Unit!7447)

(declare-fun lt!188631 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7447)

(assert (=> b!120830 (= lt!188638 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5327 lt!188620) nBits!396 i!615 lt!188631))))

(declare-fun lt!188632 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10126)

(assert (=> b!120830 (= lt!188618 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5327 lt!188620) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188632))))

(declare-fun b!120831 () Bool)

(declare-fun res!100037 () Bool)

(assert (=> b!120831 (=> (not res!100037) (not e!79115))))

(assert (=> b!120831 (= res!100037 (invariant!0 (currentBit!5542 thiss!1305) (currentByte!5547 thiss!1305) (size!2428 (buf!2862 (_2!5326 lt!188635)))))))

(declare-fun b!120832 () Bool)

(declare-fun res!100044 () Bool)

(assert (=> b!120832 (=> (not res!100044) (not e!79109))))

(assert (=> b!120832 (= res!100044 (bvslt i!615 nBits!396))))

(declare-fun b!120833 () Bool)

(declare-fun array_inv!2230 (array!5366) Bool)

(assert (=> b!120833 (= e!79107 (array_inv!2230 (buf!2862 thiss!1305)))))

(declare-fun b!120834 () Bool)

(assert (=> b!120834 (= e!79110 (= (bitIndex!0 (size!2428 (buf!2862 (_1!5325 lt!188633))) (currentByte!5547 (_1!5325 lt!188633)) (currentBit!5542 (_1!5325 lt!188633))) lt!188617))))

(declare-fun b!120835 () Bool)

(assert (=> b!120835 (= e!79109 (not e!79111))))

(declare-fun res!100040 () Bool)

(assert (=> b!120835 (=> res!100040 e!79111)))

(assert (=> b!120835 (= res!100040 (not (= (_1!5328 (readNLeastSignificantBitsLoopPure!0 (_1!5327 lt!188621) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188632)) (_2!5327 lt!188621))))))

(declare-fun lt!188629 () (_ BitVec 64))

(assert (=> b!120835 (validate_offset_bits!1 ((_ sign_extend 32) (size!2428 (buf!2862 (_2!5326 lt!188619)))) ((_ sign_extend 32) (currentByte!5547 (_2!5326 lt!188635))) ((_ sign_extend 32) (currentBit!5542 (_2!5326 lt!188635))) lt!188629)))

(declare-fun lt!188624 () Unit!7447)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4330 array!5366 (_ BitVec 64)) Unit!7447)

(assert (=> b!120835 (= lt!188624 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5326 lt!188635) (buf!2862 (_2!5326 lt!188619)) lt!188629))))

(assert (=> b!120835 (= lt!188629 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!188626 () tuple2!10120)

(declare-fun lt!188614 () (_ BitVec 64))

(assert (=> b!120835 (= lt!188632 (bvor lt!188631 (ite (_2!5325 lt!188626) lt!188614 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120835 (= lt!188639 (readNLeastSignificantBitsLoopPure!0 (_1!5327 lt!188620) nBits!396 i!615 lt!188631))))

(assert (=> b!120835 (validate_offset_bits!1 ((_ sign_extend 32) (size!2428 (buf!2862 (_2!5326 lt!188619)))) ((_ sign_extend 32) (currentByte!5547 thiss!1305)) ((_ sign_extend 32) (currentBit!5542 thiss!1305)) lt!188640)))

(declare-fun lt!188627 () Unit!7447)

(assert (=> b!120835 (= lt!188627 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2862 (_2!5326 lt!188619)) lt!188640))))

(assert (=> b!120835 (= lt!188631 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!120835 (= (_2!5325 lt!188626) lt!188634)))

(assert (=> b!120835 (= lt!188626 (readBitPure!0 (_1!5327 lt!188620)))))

(declare-fun reader!0 (BitStream!4330 BitStream!4330) tuple2!10124)

(assert (=> b!120835 (= lt!188621 (reader!0 (_2!5326 lt!188635) (_2!5326 lt!188619)))))

(assert (=> b!120835 (= lt!188620 (reader!0 thiss!1305 (_2!5326 lt!188619)))))

(assert (=> b!120835 e!79108))

(declare-fun res!100034 () Bool)

(assert (=> b!120835 (=> (not res!100034) (not e!79108))))

(assert (=> b!120835 (= res!100034 (= (bitIndex!0 (size!2428 (buf!2862 (_1!5325 lt!188625))) (currentByte!5547 (_1!5325 lt!188625)) (currentBit!5542 (_1!5325 lt!188625))) (bitIndex!0 (size!2428 (buf!2862 (_1!5325 lt!188637))) (currentByte!5547 (_1!5325 lt!188637)) (currentBit!5542 (_1!5325 lt!188637)))))))

(declare-fun lt!188616 () Unit!7447)

(declare-fun lt!188628 () BitStream!4330)

(declare-fun readBitPrefixLemma!0 (BitStream!4330 BitStream!4330) Unit!7447)

(assert (=> b!120835 (= lt!188616 (readBitPrefixLemma!0 lt!188628 (_2!5326 lt!188619)))))

(assert (=> b!120835 (= lt!188637 (readBitPure!0 (BitStream!4331 (buf!2862 (_2!5326 lt!188619)) (currentByte!5547 thiss!1305) (currentBit!5542 thiss!1305))))))

(assert (=> b!120835 (= lt!188625 (readBitPure!0 lt!188628))))

(assert (=> b!120835 (= lt!188628 (BitStream!4331 (buf!2862 (_2!5326 lt!188635)) (currentByte!5547 thiss!1305) (currentBit!5542 thiss!1305)))))

(assert (=> b!120835 e!79115))

(declare-fun res!100035 () Bool)

(assert (=> b!120835 (=> (not res!100035) (not e!79115))))

(assert (=> b!120835 (= res!100035 (isPrefixOf!0 thiss!1305 (_2!5326 lt!188619)))))

(declare-fun lt!188630 () Unit!7447)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4330 BitStream!4330 BitStream!4330) Unit!7447)

(assert (=> b!120835 (= lt!188630 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5326 lt!188635) (_2!5326 lt!188619)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4330 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10122)

(assert (=> b!120835 (= lt!188619 (appendNLeastSignificantBitsLoop!0 (_2!5326 lt!188635) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!120835 e!79114))

(declare-fun res!100038 () Bool)

(assert (=> b!120835 (=> (not res!100038) (not e!79114))))

(assert (=> b!120835 (= res!100038 (= (size!2428 (buf!2862 thiss!1305)) (size!2428 (buf!2862 (_2!5326 lt!188635)))))))

(declare-fun appendBit!0 (BitStream!4330 Bool) tuple2!10122)

(assert (=> b!120835 (= lt!188635 (appendBit!0 thiss!1305 lt!188634))))

(assert (=> b!120835 (= lt!188634 (not (= (bvand v!199 lt!188614) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120835 (= lt!188614 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(assert (= (and start!23906 res!100041) b!120824))

(assert (= (and b!120824 res!100039) b!120827))

(assert (= (and b!120827 res!100042) b!120832))

(assert (= (and b!120832 res!100044) b!120835))

(assert (= (and b!120835 res!100038) b!120825))

(assert (= (and b!120825 res!100043) b!120826))

(assert (= (and b!120826 res!100036) b!120828))

(assert (= (and b!120828 res!100033) b!120834))

(assert (= (and b!120835 res!100035) b!120831))

(assert (= (and b!120831 res!100037) b!120829))

(assert (= (and b!120835 res!100034) b!120823))

(assert (= (and b!120835 (not res!100040)) b!120830))

(assert (= start!23906 b!120833))

(declare-fun m!182807 () Bool)

(assert (=> b!120831 m!182807))

(declare-fun m!182809 () Bool)

(assert (=> b!120828 m!182809))

(assert (=> b!120828 m!182809))

(declare-fun m!182811 () Bool)

(assert (=> b!120828 m!182811))

(declare-fun m!182813 () Bool)

(assert (=> b!120835 m!182813))

(declare-fun m!182815 () Bool)

(assert (=> b!120835 m!182815))

(declare-fun m!182817 () Bool)

(assert (=> b!120835 m!182817))

(declare-fun m!182819 () Bool)

(assert (=> b!120835 m!182819))

(declare-fun m!182821 () Bool)

(assert (=> b!120835 m!182821))

(declare-fun m!182823 () Bool)

(assert (=> b!120835 m!182823))

(declare-fun m!182825 () Bool)

(assert (=> b!120835 m!182825))

(declare-fun m!182827 () Bool)

(assert (=> b!120835 m!182827))

(declare-fun m!182829 () Bool)

(assert (=> b!120835 m!182829))

(declare-fun m!182831 () Bool)

(assert (=> b!120835 m!182831))

(declare-fun m!182833 () Bool)

(assert (=> b!120835 m!182833))

(declare-fun m!182835 () Bool)

(assert (=> b!120835 m!182835))

(declare-fun m!182837 () Bool)

(assert (=> b!120835 m!182837))

(declare-fun m!182839 () Bool)

(assert (=> b!120835 m!182839))

(declare-fun m!182841 () Bool)

(assert (=> b!120835 m!182841))

(declare-fun m!182843 () Bool)

(assert (=> b!120835 m!182843))

(declare-fun m!182845 () Bool)

(assert (=> b!120835 m!182845))

(declare-fun m!182847 () Bool)

(assert (=> b!120835 m!182847))

(declare-fun m!182849 () Bool)

(assert (=> b!120835 m!182849))

(declare-fun m!182851 () Bool)

(assert (=> b!120825 m!182851))

(declare-fun m!182853 () Bool)

(assert (=> b!120825 m!182853))

(declare-fun m!182855 () Bool)

(assert (=> b!120833 m!182855))

(declare-fun m!182857 () Bool)

(assert (=> b!120827 m!182857))

(declare-fun m!182859 () Bool)

(assert (=> start!23906 m!182859))

(declare-fun m!182861 () Bool)

(assert (=> b!120834 m!182861))

(assert (=> b!120830 m!182851))

(declare-fun m!182863 () Bool)

(assert (=> b!120830 m!182863))

(declare-fun m!182865 () Bool)

(assert (=> b!120830 m!182865))

(assert (=> b!120830 m!182853))

(declare-fun m!182867 () Bool)

(assert (=> b!120830 m!182867))

(assert (=> b!120830 m!182863))

(declare-fun m!182869 () Bool)

(assert (=> b!120830 m!182869))

(declare-fun m!182871 () Bool)

(assert (=> b!120830 m!182871))

(declare-fun m!182873 () Bool)

(assert (=> b!120830 m!182873))

(declare-fun m!182875 () Bool)

(assert (=> b!120824 m!182875))

(declare-fun m!182877 () Bool)

(assert (=> b!120829 m!182877))

(declare-fun m!182879 () Bool)

(assert (=> b!120826 m!182879))

(push 1)

(assert (not b!120831))

(assert (not b!120824))

(assert (not b!120833))

(assert (not b!120830))

(assert (not b!120829))

(assert (not b!120828))

(assert (not b!120834))

(assert (not start!23906))

(assert (not b!120825))

(assert (not b!120835))

(assert (not b!120826))

(assert (not b!120827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

