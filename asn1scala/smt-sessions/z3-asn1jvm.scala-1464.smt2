; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40198 () Bool)

(assert start!40198)

(declare-fun b!183915 () Bool)

(declare-fun e!127461 () Bool)

(declare-fun e!127458 () Bool)

(assert (=> b!183915 (= e!127461 e!127458)))

(declare-fun res!152970 () Bool)

(assert (=> b!183915 (=> (not res!152970) (not e!127458))))

(declare-datatypes ((array!9766 0))(
  ( (array!9767 (arr!5237 (Array (_ BitVec 32) (_ BitVec 8))) (size!4307 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7722 0))(
  ( (BitStream!7723 (buf!4762 array!9766) (currentByte!8996 (_ BitVec 32)) (currentBit!8991 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7722)

(declare-fun lt!282933 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183915 (= res!152970 (validate_offset_bits!1 ((_ sign_extend 32) (size!4307 (buf!4762 thiss!1204))) ((_ sign_extend 32) (currentByte!8996 thiss!1204)) ((_ sign_extend 32) (currentBit!8991 thiss!1204)) lt!282933))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!183915 (= lt!282933 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183917 () Bool)

(declare-fun e!127459 () Bool)

(declare-datatypes ((Unit!13189 0))(
  ( (Unit!13190) )
))
(declare-datatypes ((tuple2!15892 0))(
  ( (tuple2!15893 (_1!8591 Unit!13189) (_2!8591 BitStream!7722)) )
))
(declare-fun lt!282950 () tuple2!15892)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183917 (= e!127459 (invariant!0 (currentBit!8991 thiss!1204) (currentByte!8996 thiss!1204) (size!4307 (buf!4762 (_2!8591 lt!282950)))))))

(declare-fun b!183918 () Bool)

(declare-fun e!127454 () Bool)

(declare-datatypes ((tuple2!15894 0))(
  ( (tuple2!15895 (_1!8592 BitStream!7722) (_2!8592 Bool)) )
))
(declare-fun lt!282954 () tuple2!15894)

(declare-fun lt!282953 () tuple2!15894)

(assert (=> b!183918 (= e!127454 (= (_2!8592 lt!282954) (_2!8592 lt!282953)))))

(declare-fun b!183919 () Bool)

(declare-fun res!152967 () Bool)

(declare-fun e!127456 () Bool)

(assert (=> b!183919 (=> res!152967 e!127456)))

(declare-fun lt!282949 () tuple2!15892)

(declare-fun isPrefixOf!0 (BitStream!7722 BitStream!7722) Bool)

(assert (=> b!183919 (= res!152967 (not (isPrefixOf!0 thiss!1204 (_2!8591 lt!282949))))))

(declare-fun b!183920 () Bool)

(declare-fun e!127453 () Bool)

(declare-fun e!127455 () Bool)

(assert (=> b!183920 (= e!127453 e!127455)))

(declare-fun res!152964 () Bool)

(assert (=> b!183920 (=> (not res!152964) (not e!127455))))

(declare-fun lt!282938 () (_ BitVec 64))

(declare-fun lt!282941 () (_ BitVec 64))

(assert (=> b!183920 (= res!152964 (= lt!282938 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282941)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183920 (= lt!282938 (bitIndex!0 (size!4307 (buf!4762 (_2!8591 lt!282949))) (currentByte!8996 (_2!8591 lt!282949)) (currentBit!8991 (_2!8591 lt!282949))))))

(assert (=> b!183920 (= lt!282941 (bitIndex!0 (size!4307 (buf!4762 thiss!1204)) (currentByte!8996 thiss!1204) (currentBit!8991 thiss!1204)))))

(declare-fun b!183921 () Bool)

(declare-fun res!152961 () Bool)

(assert (=> b!183921 (=> (not res!152961) (not e!127455))))

(assert (=> b!183921 (= res!152961 (isPrefixOf!0 thiss!1204 (_2!8591 lt!282949)))))

(declare-fun b!183922 () Bool)

(declare-fun e!127460 () Bool)

(assert (=> b!183922 (= e!127460 true)))

(declare-fun lt!282943 () (_ BitVec 64))

(declare-datatypes ((tuple2!15896 0))(
  ( (tuple2!15897 (_1!8593 BitStream!7722) (_2!8593 BitStream!7722)) )
))
(declare-fun lt!282934 () tuple2!15896)

(declare-datatypes ((tuple2!15898 0))(
  ( (tuple2!15899 (_1!8594 BitStream!7722) (_2!8594 (_ BitVec 64))) )
))
(declare-fun lt!282939 () tuple2!15898)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15898)

(declare-fun withMovedBitIndex!0 (BitStream!7722 (_ BitVec 64)) BitStream!7722)

(assert (=> b!183922 (= lt!282939 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8593 lt!282934) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282943))))

(declare-fun b!183923 () Bool)

(declare-fun res!152959 () Bool)

(assert (=> b!183923 (=> res!152959 e!127456)))

(assert (=> b!183923 (= res!152959 (not (isPrefixOf!0 (_2!8591 lt!282949) (_2!8591 lt!282950))))))

(declare-fun b!183924 () Bool)

(declare-fun res!152955 () Bool)

(assert (=> b!183924 (=> res!152955 e!127456)))

(declare-fun lt!282951 () (_ BitVec 64))

(declare-fun lt!282948 () (_ BitVec 64))

(assert (=> b!183924 (= res!152955 (or (not (= (size!4307 (buf!4762 (_2!8591 lt!282950))) (size!4307 (buf!4762 thiss!1204)))) (not (= lt!282948 (bvsub (bvadd lt!282951 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183925 () Bool)

(declare-fun res!152969 () Bool)

(assert (=> b!183925 (=> res!152969 e!127460)))

(declare-fun lt!282932 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183925 (= res!152969 (not (= (bvand lt!282932 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183916 () Bool)

(declare-fun e!127457 () Bool)

(declare-fun array_inv!4048 (array!9766) Bool)

(assert (=> b!183916 (= e!127457 (array_inv!4048 (buf!4762 thiss!1204)))))

(declare-fun res!152956 () Bool)

(assert (=> start!40198 (=> (not res!152956) (not e!127461))))

(assert (=> start!40198 (= res!152956 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40198 e!127461))

(assert (=> start!40198 true))

(declare-fun inv!12 (BitStream!7722) Bool)

(assert (=> start!40198 (and (inv!12 thiss!1204) e!127457)))

(declare-fun b!183926 () Bool)

(declare-fun res!152968 () Bool)

(assert (=> b!183926 (=> res!152968 e!127460)))

(assert (=> b!183926 (= res!152968 (bvsge i!590 nBits!348))))

(declare-fun b!183927 () Bool)

(declare-fun res!152951 () Bool)

(assert (=> b!183927 (=> res!152951 e!127456)))

(assert (=> b!183927 (= res!152951 (not (invariant!0 (currentBit!8991 (_2!8591 lt!282950)) (currentByte!8996 (_2!8591 lt!282950)) (size!4307 (buf!4762 (_2!8591 lt!282950))))))))

(declare-fun b!183928 () Bool)

(declare-fun e!127452 () Bool)

(declare-fun lt!282942 () tuple2!15894)

(assert (=> b!183928 (= e!127452 (= (bitIndex!0 (size!4307 (buf!4762 (_1!8592 lt!282942))) (currentByte!8996 (_1!8592 lt!282942)) (currentBit!8991 (_1!8592 lt!282942))) lt!282938))))

(declare-fun b!183929 () Bool)

(declare-fun res!152966 () Bool)

(assert (=> b!183929 (=> (not res!152966) (not e!127458))))

(assert (=> b!183929 (= res!152966 (not (= i!590 nBits!348)))))

(declare-fun b!183930 () Bool)

(declare-fun res!152952 () Bool)

(assert (=> b!183930 (=> res!152952 e!127460)))

(assert (=> b!183930 (= res!152952 (not (= (bvand lt!282932 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282932)))))

(declare-fun b!183931 () Bool)

(declare-fun e!127462 () Bool)

(assert (=> b!183931 (= e!127462 e!127456)))

(declare-fun res!152963 () Bool)

(assert (=> b!183931 (=> res!152963 e!127456)))

(declare-fun lt!282931 () (_ BitVec 64))

(assert (=> b!183931 (= res!152963 (not (= lt!282948 (bvsub (bvsub (bvadd lt!282931 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183931 (= lt!282948 (bitIndex!0 (size!4307 (buf!4762 (_2!8591 lt!282950))) (currentByte!8996 (_2!8591 lt!282950)) (currentBit!8991 (_2!8591 lt!282950))))))

(assert (=> b!183931 (isPrefixOf!0 thiss!1204 (_2!8591 lt!282950))))

(declare-fun lt!282944 () Unit!13189)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7722 BitStream!7722 BitStream!7722) Unit!13189)

(assert (=> b!183931 (= lt!282944 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8591 lt!282949) (_2!8591 lt!282950)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7722 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15892)

(assert (=> b!183931 (= lt!282950 (appendBitsLSBFirstLoopTR!0 (_2!8591 lt!282949) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183932 () Bool)

(assert (=> b!183932 (= e!127455 e!127452)))

(declare-fun res!152954 () Bool)

(assert (=> b!183932 (=> (not res!152954) (not e!127452))))

(declare-fun lt!282956 () Bool)

(assert (=> b!183932 (= res!152954 (and (= (_2!8592 lt!282942) lt!282956) (= (_1!8592 lt!282942) (_2!8591 lt!282949))))))

(declare-fun readBitPure!0 (BitStream!7722) tuple2!15894)

(declare-fun readerFrom!0 (BitStream!7722 (_ BitVec 32) (_ BitVec 32)) BitStream!7722)

(assert (=> b!183932 (= lt!282942 (readBitPure!0 (readerFrom!0 (_2!8591 lt!282949) (currentBit!8991 thiss!1204) (currentByte!8996 thiss!1204))))))

(declare-fun b!183933 () Bool)

(declare-fun res!152958 () Bool)

(assert (=> b!183933 (=> (not res!152958) (not e!127458))))

(assert (=> b!183933 (= res!152958 (invariant!0 (currentBit!8991 thiss!1204) (currentByte!8996 thiss!1204) (size!4307 (buf!4762 thiss!1204))))))

(declare-fun b!183934 () Bool)

(assert (=> b!183934 (= e!127458 (not e!127462))))

(declare-fun res!152957 () Bool)

(assert (=> b!183934 (=> res!152957 e!127462)))

(assert (=> b!183934 (= res!152957 (not (= lt!282931 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282951))))))

(assert (=> b!183934 (= lt!282931 (bitIndex!0 (size!4307 (buf!4762 (_2!8591 lt!282949))) (currentByte!8996 (_2!8591 lt!282949)) (currentBit!8991 (_2!8591 lt!282949))))))

(assert (=> b!183934 (= lt!282951 (bitIndex!0 (size!4307 (buf!4762 thiss!1204)) (currentByte!8996 thiss!1204) (currentBit!8991 thiss!1204)))))

(assert (=> b!183934 e!127453))

(declare-fun res!152950 () Bool)

(assert (=> b!183934 (=> (not res!152950) (not e!127453))))

(assert (=> b!183934 (= res!152950 (= (size!4307 (buf!4762 thiss!1204)) (size!4307 (buf!4762 (_2!8591 lt!282949)))))))

(declare-fun appendBit!0 (BitStream!7722 Bool) tuple2!15892)

(assert (=> b!183934 (= lt!282949 (appendBit!0 thiss!1204 lt!282956))))

(declare-fun lt!282952 () (_ BitVec 64))

(assert (=> b!183934 (= lt!282956 (not (= (bvand v!189 lt!282952) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183934 (= lt!282952 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183935 () Bool)

(declare-fun res!152960 () Bool)

(assert (=> b!183935 (=> res!152960 e!127460)))

(assert (=> b!183935 (= res!152960 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4307 (buf!4762 (_1!8593 lt!282934)))) ((_ sign_extend 32) (currentByte!8996 (_1!8593 lt!282934))) ((_ sign_extend 32) (currentBit!8991 (_1!8593 lt!282934))) lt!282933)))))

(declare-fun b!183936 () Bool)

(assert (=> b!183936 (= e!127456 e!127460)))

(declare-fun res!152965 () Bool)

(assert (=> b!183936 (=> res!152965 e!127460)))

(declare-fun lt!282936 () tuple2!15896)

(assert (=> b!183936 (= res!152965 (not (= (_1!8594 (readNBitsLSBFirstsLoopPure!0 (_1!8593 lt!282936) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282943)) (_2!8593 lt!282936))))))

(declare-fun lt!282946 () (_ BitVec 64))

(assert (=> b!183936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4307 (buf!4762 (_2!8591 lt!282950)))) ((_ sign_extend 32) (currentByte!8996 (_2!8591 lt!282949))) ((_ sign_extend 32) (currentBit!8991 (_2!8591 lt!282949))) lt!282946)))

(declare-fun lt!282945 () Unit!13189)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7722 array!9766 (_ BitVec 64)) Unit!13189)

(assert (=> b!183936 (= lt!282945 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8591 lt!282949) (buf!4762 (_2!8591 lt!282950)) lt!282946))))

(assert (=> b!183936 (= lt!282946 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282935 () tuple2!15894)

(assert (=> b!183936 (= lt!282943 (bvor lt!282932 (ite (_2!8592 lt!282935) lt!282952 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282947 () tuple2!15898)

(assert (=> b!183936 (= lt!282947 (readNBitsLSBFirstsLoopPure!0 (_1!8593 lt!282934) nBits!348 i!590 lt!282932))))

(assert (=> b!183936 (validate_offset_bits!1 ((_ sign_extend 32) (size!4307 (buf!4762 (_2!8591 lt!282950)))) ((_ sign_extend 32) (currentByte!8996 thiss!1204)) ((_ sign_extend 32) (currentBit!8991 thiss!1204)) lt!282933)))

(declare-fun lt!282955 () Unit!13189)

(assert (=> b!183936 (= lt!282955 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4762 (_2!8591 lt!282950)) lt!282933))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183936 (= lt!282932 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!183936 (= (_2!8592 lt!282935) lt!282956)))

(assert (=> b!183936 (= lt!282935 (readBitPure!0 (_1!8593 lt!282934)))))

(declare-fun reader!0 (BitStream!7722 BitStream!7722) tuple2!15896)

(assert (=> b!183936 (= lt!282936 (reader!0 (_2!8591 lt!282949) (_2!8591 lt!282950)))))

(assert (=> b!183936 (= lt!282934 (reader!0 thiss!1204 (_2!8591 lt!282950)))))

(assert (=> b!183936 e!127454))

(declare-fun res!152962 () Bool)

(assert (=> b!183936 (=> (not res!152962) (not e!127454))))

(assert (=> b!183936 (= res!152962 (= (bitIndex!0 (size!4307 (buf!4762 (_1!8592 lt!282954))) (currentByte!8996 (_1!8592 lt!282954)) (currentBit!8991 (_1!8592 lt!282954))) (bitIndex!0 (size!4307 (buf!4762 (_1!8592 lt!282953))) (currentByte!8996 (_1!8592 lt!282953)) (currentBit!8991 (_1!8592 lt!282953)))))))

(declare-fun lt!282940 () Unit!13189)

(declare-fun lt!282937 () BitStream!7722)

(declare-fun readBitPrefixLemma!0 (BitStream!7722 BitStream!7722) Unit!13189)

(assert (=> b!183936 (= lt!282940 (readBitPrefixLemma!0 lt!282937 (_2!8591 lt!282950)))))

(assert (=> b!183936 (= lt!282953 (readBitPure!0 (BitStream!7723 (buf!4762 (_2!8591 lt!282950)) (currentByte!8996 thiss!1204) (currentBit!8991 thiss!1204))))))

(assert (=> b!183936 (= lt!282954 (readBitPure!0 lt!282937))))

(assert (=> b!183936 e!127459))

(declare-fun res!152953 () Bool)

(assert (=> b!183936 (=> (not res!152953) (not e!127459))))

(assert (=> b!183936 (= res!152953 (invariant!0 (currentBit!8991 thiss!1204) (currentByte!8996 thiss!1204) (size!4307 (buf!4762 (_2!8591 lt!282949)))))))

(assert (=> b!183936 (= lt!282937 (BitStream!7723 (buf!4762 (_2!8591 lt!282949)) (currentByte!8996 thiss!1204) (currentBit!8991 thiss!1204)))))

(assert (= (and start!40198 res!152956) b!183915))

(assert (= (and b!183915 res!152970) b!183933))

(assert (= (and b!183933 res!152958) b!183929))

(assert (= (and b!183929 res!152966) b!183934))

(assert (= (and b!183934 res!152950) b!183920))

(assert (= (and b!183920 res!152964) b!183921))

(assert (= (and b!183921 res!152961) b!183932))

(assert (= (and b!183932 res!152954) b!183928))

(assert (= (and b!183934 (not res!152957)) b!183931))

(assert (= (and b!183931 (not res!152963)) b!183927))

(assert (= (and b!183927 (not res!152951)) b!183924))

(assert (= (and b!183924 (not res!152955)) b!183923))

(assert (= (and b!183923 (not res!152959)) b!183919))

(assert (= (and b!183919 (not res!152967)) b!183936))

(assert (= (and b!183936 res!152953) b!183917))

(assert (= (and b!183936 res!152962) b!183918))

(assert (= (and b!183936 (not res!152965)) b!183926))

(assert (= (and b!183926 (not res!152968)) b!183935))

(assert (= (and b!183935 (not res!152960)) b!183925))

(assert (= (and b!183925 (not res!152969)) b!183930))

(assert (= (and b!183930 (not res!152952)) b!183922))

(assert (= start!40198 b!183916))

(declare-fun m!285905 () Bool)

(assert (=> b!183931 m!285905))

(declare-fun m!285907 () Bool)

(assert (=> b!183931 m!285907))

(declare-fun m!285909 () Bool)

(assert (=> b!183931 m!285909))

(declare-fun m!285911 () Bool)

(assert (=> b!183931 m!285911))

(declare-fun m!285913 () Bool)

(assert (=> b!183923 m!285913))

(declare-fun m!285915 () Bool)

(assert (=> b!183916 m!285915))

(declare-fun m!285917 () Bool)

(assert (=> b!183932 m!285917))

(assert (=> b!183932 m!285917))

(declare-fun m!285919 () Bool)

(assert (=> b!183932 m!285919))

(declare-fun m!285921 () Bool)

(assert (=> b!183922 m!285921))

(assert (=> b!183922 m!285921))

(declare-fun m!285923 () Bool)

(assert (=> b!183922 m!285923))

(declare-fun m!285925 () Bool)

(assert (=> b!183934 m!285925))

(declare-fun m!285927 () Bool)

(assert (=> b!183934 m!285927))

(declare-fun m!285929 () Bool)

(assert (=> b!183934 m!285929))

(declare-fun m!285931 () Bool)

(assert (=> b!183928 m!285931))

(declare-fun m!285933 () Bool)

(assert (=> b!183936 m!285933))

(declare-fun m!285935 () Bool)

(assert (=> b!183936 m!285935))

(declare-fun m!285937 () Bool)

(assert (=> b!183936 m!285937))

(declare-fun m!285939 () Bool)

(assert (=> b!183936 m!285939))

(declare-fun m!285941 () Bool)

(assert (=> b!183936 m!285941))

(declare-fun m!285943 () Bool)

(assert (=> b!183936 m!285943))

(declare-fun m!285945 () Bool)

(assert (=> b!183936 m!285945))

(declare-fun m!285947 () Bool)

(assert (=> b!183936 m!285947))

(declare-fun m!285949 () Bool)

(assert (=> b!183936 m!285949))

(declare-fun m!285951 () Bool)

(assert (=> b!183936 m!285951))

(declare-fun m!285953 () Bool)

(assert (=> b!183936 m!285953))

(declare-fun m!285955 () Bool)

(assert (=> b!183936 m!285955))

(declare-fun m!285957 () Bool)

(assert (=> b!183936 m!285957))

(declare-fun m!285959 () Bool)

(assert (=> b!183936 m!285959))

(declare-fun m!285961 () Bool)

(assert (=> b!183936 m!285961))

(declare-fun m!285963 () Bool)

(assert (=> b!183936 m!285963))

(declare-fun m!285965 () Bool)

(assert (=> b!183921 m!285965))

(declare-fun m!285967 () Bool)

(assert (=> b!183915 m!285967))

(declare-fun m!285969 () Bool)

(assert (=> b!183925 m!285969))

(declare-fun m!285971 () Bool)

(assert (=> b!183935 m!285971))

(assert (=> b!183919 m!285965))

(declare-fun m!285973 () Bool)

(assert (=> b!183927 m!285973))

(declare-fun m!285975 () Bool)

(assert (=> b!183933 m!285975))

(declare-fun m!285977 () Bool)

(assert (=> start!40198 m!285977))

(assert (=> b!183920 m!285925))

(assert (=> b!183920 m!285927))

(declare-fun m!285979 () Bool)

(assert (=> b!183917 m!285979))

(check-sat (not start!40198) (not b!183935) (not b!183923) (not b!183920) (not b!183925) (not b!183927) (not b!183932) (not b!183931) (not b!183919) (not b!183934) (not b!183936) (not b!183922) (not b!183928) (not b!183933) (not b!183921) (not b!183917) (not b!183916) (not b!183915))
