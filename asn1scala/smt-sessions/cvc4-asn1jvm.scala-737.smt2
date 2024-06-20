; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20594 () Bool)

(assert start!20594)

(declare-fun b!103939 () Bool)

(declare-fun res!85557 () Bool)

(declare-fun e!68060 () Bool)

(assert (=> b!103939 (=> res!85557 e!68060)))

(declare-datatypes ((array!4852 0))(
  ( (array!4853 (arr!2807 (Array (_ BitVec 32) (_ BitVec 8))) (size!2214 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3902 0))(
  ( (BitStream!3903 (buf!2580 array!4852) (currentByte!5065 (_ BitVec 32)) (currentBit!5060 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8558 0))(
  ( (tuple2!8559 (_1!4534 BitStream!3902) (_2!4534 BitStream!3902)) )
))
(declare-fun lt!152238 () tuple2!8558)

(declare-fun lt!152239 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!103939 (= res!85557 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2214 (buf!2580 (_1!4534 lt!152238)))) ((_ sign_extend 32) (currentByte!5065 (_1!4534 lt!152238))) ((_ sign_extend 32) (currentBit!5060 (_1!4534 lt!152238))) lt!152239)))))

(declare-fun b!103940 () Bool)

(declare-fun res!85556 () Bool)

(declare-fun e!68061 () Bool)

(assert (=> b!103940 (=> (not res!85556) (not e!68061))))

(declare-fun thiss!1305 () BitStream!3902)

(declare-datatypes ((Unit!6372 0))(
  ( (Unit!6373) )
))
(declare-datatypes ((tuple2!8560 0))(
  ( (tuple2!8561 (_1!4535 Unit!6372) (_2!4535 BitStream!3902)) )
))
(declare-fun lt!152231 () tuple2!8560)

(declare-fun isPrefixOf!0 (BitStream!3902 BitStream!3902) Bool)

(assert (=> b!103940 (= res!85556 (isPrefixOf!0 thiss!1305 (_2!4535 lt!152231)))))

(declare-fun res!85554 () Bool)

(declare-fun e!68057 () Bool)

(assert (=> start!20594 (=> (not res!85554) (not e!68057))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!20594 (= res!85554 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20594 e!68057))

(assert (=> start!20594 true))

(declare-fun e!68062 () Bool)

(declare-fun inv!12 (BitStream!3902) Bool)

(assert (=> start!20594 (and (inv!12 thiss!1305) e!68062)))

(declare-fun b!103941 () Bool)

(assert (=> b!103941 (= e!68060 true)))

(declare-fun lt!152229 () (_ BitVec 64))

(declare-datatypes ((tuple2!8562 0))(
  ( (tuple2!8563 (_1!4536 BitStream!3902) (_2!4536 (_ BitVec 64))) )
))
(declare-fun lt!152232 () tuple2!8562)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8562)

(declare-fun withMovedBitIndex!0 (BitStream!3902 (_ BitVec 64)) BitStream!3902)

(assert (=> b!103941 (= lt!152232 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4534 lt!152238) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152229))))

(declare-fun b!103942 () Bool)

(declare-fun res!85559 () Bool)

(declare-fun e!68066 () Bool)

(assert (=> b!103942 (=> (not res!85559) (not e!68066))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!103942 (= res!85559 (invariant!0 (currentBit!5060 thiss!1305) (currentByte!5065 thiss!1305) (size!2214 (buf!2580 (_2!4535 lt!152231)))))))

(declare-fun b!103943 () Bool)

(declare-fun e!68067 () Bool)

(assert (=> b!103943 (= e!68067 (not e!68060))))

(declare-fun res!85552 () Bool)

(assert (=> b!103943 (=> res!85552 e!68060)))

(declare-fun lt!152237 () tuple2!8558)

(assert (=> b!103943 (= res!85552 (not (= (_1!4536 (readNLeastSignificantBitsLoopPure!0 (_1!4534 lt!152237) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152229)) (_2!4534 lt!152237))))))

(declare-fun lt!152223 () tuple2!8560)

(declare-fun lt!152216 () (_ BitVec 64))

(assert (=> b!103943 (validate_offset_bits!1 ((_ sign_extend 32) (size!2214 (buf!2580 (_2!4535 lt!152223)))) ((_ sign_extend 32) (currentByte!5065 (_2!4535 lt!152231))) ((_ sign_extend 32) (currentBit!5060 (_2!4535 lt!152231))) lt!152216)))

(declare-fun lt!152222 () Unit!6372)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3902 array!4852 (_ BitVec 64)) Unit!6372)

(assert (=> b!103943 (= lt!152222 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4535 lt!152231) (buf!2580 (_2!4535 lt!152223)) lt!152216))))

(assert (=> b!103943 (= lt!152216 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152235 () (_ BitVec 64))

(declare-fun lt!152217 () (_ BitVec 64))

(declare-datatypes ((tuple2!8564 0))(
  ( (tuple2!8565 (_1!4537 BitStream!3902) (_2!4537 Bool)) )
))
(declare-fun lt!152224 () tuple2!8564)

(assert (=> b!103943 (= lt!152229 (bvor lt!152217 (ite (_2!4537 lt!152224) lt!152235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152220 () tuple2!8562)

(assert (=> b!103943 (= lt!152220 (readNLeastSignificantBitsLoopPure!0 (_1!4534 lt!152238) nBits!396 i!615 lt!152217))))

(assert (=> b!103943 (validate_offset_bits!1 ((_ sign_extend 32) (size!2214 (buf!2580 (_2!4535 lt!152223)))) ((_ sign_extend 32) (currentByte!5065 thiss!1305)) ((_ sign_extend 32) (currentBit!5060 thiss!1305)) lt!152239)))

(declare-fun lt!152225 () Unit!6372)

(assert (=> b!103943 (= lt!152225 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2580 (_2!4535 lt!152223)) lt!152239))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!152215 () (_ BitVec 64))

(assert (=> b!103943 (= lt!152217 (bvand v!199 (bvnot lt!152215)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103943 (= lt!152215 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!152226 () Bool)

(assert (=> b!103943 (= (_2!4537 lt!152224) lt!152226)))

(declare-fun readBitPure!0 (BitStream!3902) tuple2!8564)

(assert (=> b!103943 (= lt!152224 (readBitPure!0 (_1!4534 lt!152238)))))

(declare-fun reader!0 (BitStream!3902 BitStream!3902) tuple2!8558)

(assert (=> b!103943 (= lt!152237 (reader!0 (_2!4535 lt!152231) (_2!4535 lt!152223)))))

(assert (=> b!103943 (= lt!152238 (reader!0 thiss!1305 (_2!4535 lt!152223)))))

(declare-fun e!68058 () Bool)

(assert (=> b!103943 e!68058))

(declare-fun res!85551 () Bool)

(assert (=> b!103943 (=> (not res!85551) (not e!68058))))

(declare-fun lt!152233 () tuple2!8564)

(declare-fun lt!152228 () tuple2!8564)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!103943 (= res!85551 (= (bitIndex!0 (size!2214 (buf!2580 (_1!4537 lt!152233))) (currentByte!5065 (_1!4537 lt!152233)) (currentBit!5060 (_1!4537 lt!152233))) (bitIndex!0 (size!2214 (buf!2580 (_1!4537 lt!152228))) (currentByte!5065 (_1!4537 lt!152228)) (currentBit!5060 (_1!4537 lt!152228)))))))

(declare-fun lt!152221 () Unit!6372)

(declare-fun lt!152236 () BitStream!3902)

(declare-fun readBitPrefixLemma!0 (BitStream!3902 BitStream!3902) Unit!6372)

(assert (=> b!103943 (= lt!152221 (readBitPrefixLemma!0 lt!152236 (_2!4535 lt!152223)))))

(assert (=> b!103943 (= lt!152228 (readBitPure!0 (BitStream!3903 (buf!2580 (_2!4535 lt!152223)) (currentByte!5065 thiss!1305) (currentBit!5060 thiss!1305))))))

(assert (=> b!103943 (= lt!152233 (readBitPure!0 lt!152236))))

(assert (=> b!103943 (= lt!152236 (BitStream!3903 (buf!2580 (_2!4535 lt!152231)) (currentByte!5065 thiss!1305) (currentBit!5060 thiss!1305)))))

(assert (=> b!103943 e!68066))

(declare-fun res!85547 () Bool)

(assert (=> b!103943 (=> (not res!85547) (not e!68066))))

(assert (=> b!103943 (= res!85547 (isPrefixOf!0 thiss!1305 (_2!4535 lt!152223)))))

(declare-fun lt!152218 () Unit!6372)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3902 BitStream!3902 BitStream!3902) Unit!6372)

(assert (=> b!103943 (= lt!152218 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4535 lt!152231) (_2!4535 lt!152223)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3902 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8560)

(assert (=> b!103943 (= lt!152223 (appendNLeastSignificantBitsLoop!0 (_2!4535 lt!152231) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!68064 () Bool)

(assert (=> b!103943 e!68064))

(declare-fun res!85548 () Bool)

(assert (=> b!103943 (=> (not res!85548) (not e!68064))))

(assert (=> b!103943 (= res!85548 (= (size!2214 (buf!2580 thiss!1305)) (size!2214 (buf!2580 (_2!4535 lt!152231)))))))

(declare-fun appendBit!0 (BitStream!3902 Bool) tuple2!8560)

(assert (=> b!103943 (= lt!152231 (appendBit!0 thiss!1305 lt!152226))))

(assert (=> b!103943 (= lt!152226 (not (= (bvand v!199 lt!152235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!103943 (= lt!152235 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!103944 () Bool)

(assert (=> b!103944 (= e!68064 e!68061)))

(declare-fun res!85553 () Bool)

(assert (=> b!103944 (=> (not res!85553) (not e!68061))))

(declare-fun lt!152230 () (_ BitVec 64))

(declare-fun lt!152219 () (_ BitVec 64))

(assert (=> b!103944 (= res!85553 (= lt!152230 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152219)))))

(assert (=> b!103944 (= lt!152230 (bitIndex!0 (size!2214 (buf!2580 (_2!4535 lt!152231))) (currentByte!5065 (_2!4535 lt!152231)) (currentBit!5060 (_2!4535 lt!152231))))))

(assert (=> b!103944 (= lt!152219 (bitIndex!0 (size!2214 (buf!2580 thiss!1305)) (currentByte!5065 thiss!1305) (currentBit!5060 thiss!1305)))))

(declare-fun b!103945 () Bool)

(declare-fun res!85549 () Bool)

(assert (=> b!103945 (=> res!85549 e!68060)))

(declare-fun lt!152227 () (_ BitVec 64))

(assert (=> b!103945 (= res!85549 (or (not (= (bvand lt!152217 lt!152215) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152217 lt!152227) lt!152217))))))

(declare-fun b!103946 () Bool)

(declare-fun e!68065 () Bool)

(assert (=> b!103946 (= e!68057 e!68065)))

(declare-fun res!85558 () Bool)

(assert (=> b!103946 (=> (not res!85558) (not e!68065))))

(assert (=> b!103946 (= res!85558 (validate_offset_bits!1 ((_ sign_extend 32) (size!2214 (buf!2580 thiss!1305))) ((_ sign_extend 32) (currentByte!5065 thiss!1305)) ((_ sign_extend 32) (currentBit!5060 thiss!1305)) lt!152239))))

(assert (=> b!103946 (= lt!152239 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!103947 () Bool)

(declare-fun array_inv!2016 (array!4852) Bool)

(assert (=> b!103947 (= e!68062 (array_inv!2016 (buf!2580 thiss!1305)))))

(declare-fun b!103948 () Bool)

(declare-fun e!68063 () Bool)

(declare-fun lt!152234 () tuple2!8564)

(assert (=> b!103948 (= e!68063 (= (bitIndex!0 (size!2214 (buf!2580 (_1!4537 lt!152234))) (currentByte!5065 (_1!4537 lt!152234)) (currentBit!5060 (_1!4537 lt!152234))) lt!152230))))

(declare-fun b!103949 () Bool)

(assert (=> b!103949 (= e!68065 e!68067)))

(declare-fun res!85555 () Bool)

(assert (=> b!103949 (=> (not res!85555) (not e!68067))))

(assert (=> b!103949 (= res!85555 (and (= (bvand v!199 lt!152227) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!103949 (= lt!152227 (onesLSBLong!0 nBits!396))))

(declare-fun b!103950 () Bool)

(assert (=> b!103950 (= e!68066 (invariant!0 (currentBit!5060 thiss!1305) (currentByte!5065 thiss!1305) (size!2214 (buf!2580 (_2!4535 lt!152223)))))))

(declare-fun b!103951 () Bool)

(assert (=> b!103951 (= e!68061 e!68063)))

(declare-fun res!85550 () Bool)

(assert (=> b!103951 (=> (not res!85550) (not e!68063))))

(assert (=> b!103951 (= res!85550 (and (= (_2!4537 lt!152234) lt!152226) (= (_1!4537 lt!152234) (_2!4535 lt!152231))))))

(declare-fun readerFrom!0 (BitStream!3902 (_ BitVec 32) (_ BitVec 32)) BitStream!3902)

(assert (=> b!103951 (= lt!152234 (readBitPure!0 (readerFrom!0 (_2!4535 lt!152231) (currentBit!5060 thiss!1305) (currentByte!5065 thiss!1305))))))

(declare-fun b!103952 () Bool)

(assert (=> b!103952 (= e!68058 (= (_2!4537 lt!152233) (_2!4537 lt!152228)))))

(assert (= (and start!20594 res!85554) b!103946))

(assert (= (and b!103946 res!85558) b!103949))

(assert (= (and b!103949 res!85555) b!103943))

(assert (= (and b!103943 res!85548) b!103944))

(assert (= (and b!103944 res!85553) b!103940))

(assert (= (and b!103940 res!85556) b!103951))

(assert (= (and b!103951 res!85550) b!103948))

(assert (= (and b!103943 res!85547) b!103942))

(assert (= (and b!103942 res!85559) b!103950))

(assert (= (and b!103943 res!85551) b!103952))

(assert (= (and b!103943 (not res!85552)) b!103939))

(assert (= (and b!103939 (not res!85557)) b!103945))

(assert (= (and b!103945 (not res!85549)) b!103941))

(assert (= start!20594 b!103947))

(declare-fun m!151841 () Bool)

(assert (=> b!103941 m!151841))

(assert (=> b!103941 m!151841))

(declare-fun m!151843 () Bool)

(assert (=> b!103941 m!151843))

(declare-fun m!151845 () Bool)

(assert (=> b!103946 m!151845))

(declare-fun m!151847 () Bool)

(assert (=> b!103940 m!151847))

(declare-fun m!151849 () Bool)

(assert (=> b!103939 m!151849))

(declare-fun m!151851 () Bool)

(assert (=> b!103948 m!151851))

(declare-fun m!151853 () Bool)

(assert (=> b!103950 m!151853))

(declare-fun m!151855 () Bool)

(assert (=> b!103943 m!151855))

(declare-fun m!151857 () Bool)

(assert (=> b!103943 m!151857))

(declare-fun m!151859 () Bool)

(assert (=> b!103943 m!151859))

(declare-fun m!151861 () Bool)

(assert (=> b!103943 m!151861))

(declare-fun m!151863 () Bool)

(assert (=> b!103943 m!151863))

(declare-fun m!151865 () Bool)

(assert (=> b!103943 m!151865))

(declare-fun m!151867 () Bool)

(assert (=> b!103943 m!151867))

(declare-fun m!151869 () Bool)

(assert (=> b!103943 m!151869))

(declare-fun m!151871 () Bool)

(assert (=> b!103943 m!151871))

(declare-fun m!151873 () Bool)

(assert (=> b!103943 m!151873))

(declare-fun m!151875 () Bool)

(assert (=> b!103943 m!151875))

(declare-fun m!151877 () Bool)

(assert (=> b!103943 m!151877))

(declare-fun m!151879 () Bool)

(assert (=> b!103943 m!151879))

(declare-fun m!151881 () Bool)

(assert (=> b!103943 m!151881))

(declare-fun m!151883 () Bool)

(assert (=> b!103943 m!151883))

(declare-fun m!151885 () Bool)

(assert (=> b!103943 m!151885))

(declare-fun m!151887 () Bool)

(assert (=> b!103943 m!151887))

(declare-fun m!151889 () Bool)

(assert (=> b!103943 m!151889))

(declare-fun m!151891 () Bool)

(assert (=> b!103943 m!151891))

(declare-fun m!151893 () Bool)

(assert (=> b!103942 m!151893))

(declare-fun m!151895 () Bool)

(assert (=> start!20594 m!151895))

(declare-fun m!151897 () Bool)

(assert (=> b!103949 m!151897))

(declare-fun m!151899 () Bool)

(assert (=> b!103947 m!151899))

(declare-fun m!151901 () Bool)

(assert (=> b!103944 m!151901))

(declare-fun m!151903 () Bool)

(assert (=> b!103944 m!151903))

(declare-fun m!151905 () Bool)

(assert (=> b!103951 m!151905))

(assert (=> b!103951 m!151905))

(declare-fun m!151907 () Bool)

(assert (=> b!103951 m!151907))

(push 1)

(assert (not b!103942))

(assert (not b!103947))

(assert (not b!103949))

(assert (not b!103946))

(assert (not start!20594))

(assert (not b!103948))

(assert (not b!103939))

(assert (not b!103950))

(assert (not b!103940))

(assert (not b!103951))

(assert (not b!103944))

(assert (not b!103941))

(assert (not b!103943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

