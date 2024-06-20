; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12878 () Bool)

(assert start!12878)

(declare-fun b!66024 () Bool)

(declare-fun e!43376 () Bool)

(declare-datatypes ((array!2844 0))(
  ( (array!2845 (arr!1875 (Array (_ BitVec 32) (_ BitVec 8))) (size!1311 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2256 0))(
  ( (BitStream!2257 (buf!1692 array!2844) (currentByte!3364 (_ BitVec 32)) (currentBit!3359 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2256)

(declare-fun array_inv!1187 (array!2844) Bool)

(assert (=> b!66024 (= e!43376 (array_inv!1187 (buf!1692 thiss!1379)))))

(declare-fun b!66025 () Bool)

(declare-fun res!54737 () Bool)

(declare-fun e!43380 () Bool)

(assert (=> b!66025 (=> res!54737 e!43380)))

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5848 0))(
  ( (tuple2!5849 (_1!3035 BitStream!2256) (_2!3035 BitStream!2256)) )
))
(declare-fun lt!104807 () tuple2!5848)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!104813 () tuple2!5848)

(declare-datatypes ((Unit!4459 0))(
  ( (Unit!4460) )
))
(declare-datatypes ((tuple2!5850 0))(
  ( (tuple2!5851 (_1!3036 Unit!4459) (_2!3036 BitStream!2256)) )
))
(declare-fun lt!104804 () tuple2!5850)

(declare-fun lt!104809 () (_ BitVec 64))

(assert (=> b!66025 (= res!54737 (or (not (= (buf!1692 (_1!3035 lt!104813)) (buf!1692 (_1!3035 lt!104807)))) (not (= (buf!1692 (_1!3035 lt!104813)) (buf!1692 (_2!3036 lt!104804)))) (bvsge lt!104809 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!66026 () Bool)

(declare-fun res!54741 () Bool)

(declare-fun e!43382 () Bool)

(assert (=> b!66026 (=> res!54741 e!43382)))

(declare-fun lt!104820 () tuple2!5850)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66026 (= res!54741 (not (invariant!0 (currentBit!3359 (_2!3036 lt!104820)) (currentByte!3364 (_2!3036 lt!104820)) (size!1311 (buf!1692 (_2!3036 lt!104820))))))))

(declare-fun b!66027 () Bool)

(declare-fun e!43385 () Bool)

(declare-fun e!43375 () Bool)

(assert (=> b!66027 (= e!43385 e!43375)))

(declare-fun res!54738 () Bool)

(assert (=> b!66027 (=> res!54738 e!43375)))

(declare-fun isPrefixOf!0 (BitStream!2256 BitStream!2256) Bool)

(assert (=> b!66027 (= res!54738 (not (isPrefixOf!0 (_2!3036 lt!104820) (_2!3036 lt!104804))))))

(assert (=> b!66027 (isPrefixOf!0 thiss!1379 (_2!3036 lt!104804))))

(declare-fun lt!104805 () Unit!4459)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2256 BitStream!2256 BitStream!2256) Unit!4459)

(assert (=> b!66027 (= lt!104805 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3036 lt!104820) (_2!3036 lt!104804)))))

(declare-fun srcBuffer!2 () array!2844)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2256 array!2844 (_ BitVec 64) (_ BitVec 64)) tuple2!5850)

(assert (=> b!66027 (= lt!104804 (appendBitsMSBFirstLoop!0 (_2!3036 lt!104820) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43381 () Bool)

(assert (=> b!66027 e!43381))

(declare-fun res!54731 () Bool)

(assert (=> b!66027 (=> (not res!54731) (not e!43381))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66027 (= res!54731 (validate_offset_bits!1 ((_ sign_extend 32) (size!1311 (buf!1692 (_2!3036 lt!104820)))) ((_ sign_extend 32) (currentByte!3364 thiss!1379)) ((_ sign_extend 32) (currentBit!3359 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104811 () Unit!4459)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2256 array!2844 (_ BitVec 64)) Unit!4459)

(assert (=> b!66027 (= lt!104811 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1692 (_2!3036 lt!104820)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104816 () tuple2!5848)

(declare-fun reader!0 (BitStream!2256 BitStream!2256) tuple2!5848)

(assert (=> b!66027 (= lt!104816 (reader!0 thiss!1379 (_2!3036 lt!104820)))))

(declare-fun b!66028 () Bool)

(declare-fun e!43384 () Bool)

(assert (=> b!66028 (= e!43375 e!43384)))

(declare-fun res!54733 () Bool)

(assert (=> b!66028 (=> res!54733 e!43384)))

(declare-fun lt!104817 () (_ BitVec 64))

(assert (=> b!66028 (= res!54733 (not (= lt!104809 (bvsub (bvadd lt!104817 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66028 (= lt!104809 (bitIndex!0 (size!1311 (buf!1692 (_2!3036 lt!104804))) (currentByte!3364 (_2!3036 lt!104804)) (currentBit!3359 (_2!3036 lt!104804))))))

(declare-fun b!66029 () Bool)

(declare-fun res!54728 () Bool)

(assert (=> b!66029 (=> res!54728 e!43380)))

(declare-datatypes ((List!703 0))(
  ( (Nil!700) (Cons!699 (h!818 Bool) (t!1453 List!703)) )
))
(declare-fun lt!104818 () List!703)

(declare-fun length!331 (List!703) Int)

(assert (=> b!66029 (= res!54728 (<= (length!331 lt!104818) 0))))

(declare-fun b!66030 () Bool)

(assert (=> b!66030 (= e!43384 e!43382)))

(declare-fun res!54724 () Bool)

(assert (=> b!66030 (=> res!54724 e!43382)))

(assert (=> b!66030 (= res!54724 (not (= (size!1311 (buf!1692 (_2!3036 lt!104820))) (size!1311 (buf!1692 (_2!3036 lt!104804))))))))

(declare-fun e!43374 () Bool)

(assert (=> b!66030 e!43374))

(declare-fun res!54723 () Bool)

(assert (=> b!66030 (=> (not res!54723) (not e!43374))))

(assert (=> b!66030 (= res!54723 (= (size!1311 (buf!1692 (_2!3036 lt!104804))) (size!1311 (buf!1692 thiss!1379))))))

(declare-fun b!66031 () Bool)

(declare-fun e!43379 () Bool)

(declare-fun e!43378 () Bool)

(assert (=> b!66031 (= e!43379 (not e!43378))))

(declare-fun res!54730 () Bool)

(assert (=> b!66031 (=> res!54730 e!43378)))

(assert (=> b!66031 (= res!54730 (bvsge i!635 to!314))))

(assert (=> b!66031 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!104819 () Unit!4459)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2256) Unit!4459)

(assert (=> b!66031 (= lt!104819 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66031 (= lt!104817 (bitIndex!0 (size!1311 (buf!1692 thiss!1379)) (currentByte!3364 thiss!1379) (currentBit!3359 thiss!1379)))))

(declare-fun b!66032 () Bool)

(declare-fun res!54725 () Bool)

(assert (=> b!66032 (=> res!54725 e!43384)))

(assert (=> b!66032 (= res!54725 (not (invariant!0 (currentBit!3359 (_2!3036 lt!104804)) (currentByte!3364 (_2!3036 lt!104804)) (size!1311 (buf!1692 (_2!3036 lt!104804))))))))

(declare-fun b!66033 () Bool)

(declare-fun head!522 (List!703) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2256 array!2844 (_ BitVec 64) (_ BitVec 64)) List!703)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2256 BitStream!2256 (_ BitVec 64)) List!703)

(assert (=> b!66033 (= e!43381 (= (head!522 (byteArrayBitContentToList!0 (_2!3036 lt!104820) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!522 (bitStreamReadBitsIntoList!0 (_2!3036 lt!104820) (_1!3035 lt!104816) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!66034 () Bool)

(assert (=> b!66034 (= e!43382 e!43380)))

(declare-fun res!54735 () Bool)

(assert (=> b!66034 (=> res!54735 e!43380)))

(assert (=> b!66034 (= res!54735 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104812 () (_ BitVec 64))

(declare-fun lt!104810 () List!703)

(assert (=> b!66034 (= lt!104810 (bitStreamReadBitsIntoList!0 (_2!3036 lt!104804) (_1!3035 lt!104807) lt!104812))))

(assert (=> b!66034 (= lt!104818 (bitStreamReadBitsIntoList!0 (_2!3036 lt!104804) (_1!3035 lt!104813) (bvsub to!314 i!635)))))

(assert (=> b!66034 (validate_offset_bits!1 ((_ sign_extend 32) (size!1311 (buf!1692 (_2!3036 lt!104804)))) ((_ sign_extend 32) (currentByte!3364 (_2!3036 lt!104820))) ((_ sign_extend 32) (currentBit!3359 (_2!3036 lt!104820))) lt!104812)))

(declare-fun lt!104815 () Unit!4459)

(assert (=> b!66034 (= lt!104815 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3036 lt!104820) (buf!1692 (_2!3036 lt!104804)) lt!104812))))

(assert (=> b!66034 (= lt!104807 (reader!0 (_2!3036 lt!104820) (_2!3036 lt!104804)))))

(assert (=> b!66034 (validate_offset_bits!1 ((_ sign_extend 32) (size!1311 (buf!1692 (_2!3036 lt!104804)))) ((_ sign_extend 32) (currentByte!3364 thiss!1379)) ((_ sign_extend 32) (currentBit!3359 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!104814 () Unit!4459)

(assert (=> b!66034 (= lt!104814 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1692 (_2!3036 lt!104804)) (bvsub to!314 i!635)))))

(assert (=> b!66034 (= lt!104813 (reader!0 thiss!1379 (_2!3036 lt!104804)))))

(declare-fun b!66035 () Bool)

(declare-fun res!54736 () Bool)

(assert (=> b!66035 (=> res!54736 e!43382)))

(assert (=> b!66035 (= res!54736 (not (invariant!0 (currentBit!3359 (_2!3036 lt!104820)) (currentByte!3364 (_2!3036 lt!104820)) (size!1311 (buf!1692 (_2!3036 lt!104804))))))))

(declare-fun b!66036 () Bool)

(declare-fun res!54727 () Bool)

(assert (=> b!66036 (=> res!54727 e!43380)))

(assert (=> b!66036 (= res!54727 (not (isPrefixOf!0 (_1!3035 lt!104813) (_2!3036 lt!104804))))))

(declare-fun b!66037 () Bool)

(assert (=> b!66037 (= e!43378 e!43385)))

(declare-fun res!54740 () Bool)

(assert (=> b!66037 (=> res!54740 e!43385)))

(assert (=> b!66037 (= res!54740 (not (isPrefixOf!0 thiss!1379 (_2!3036 lt!104820))))))

(assert (=> b!66037 (validate_offset_bits!1 ((_ sign_extend 32) (size!1311 (buf!1692 (_2!3036 lt!104820)))) ((_ sign_extend 32) (currentByte!3364 (_2!3036 lt!104820))) ((_ sign_extend 32) (currentBit!3359 (_2!3036 lt!104820))) lt!104812)))

(assert (=> b!66037 (= lt!104812 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104806 () Unit!4459)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2256 BitStream!2256 (_ BitVec 64) (_ BitVec 64)) Unit!4459)

(assert (=> b!66037 (= lt!104806 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3036 lt!104820) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2256 (_ BitVec 8) (_ BitVec 32)) tuple2!5850)

(assert (=> b!66037 (= lt!104820 (appendBitFromByte!0 thiss!1379 (select (arr!1875 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!54734 () Bool)

(assert (=> start!12878 (=> (not res!54734) (not e!43379))))

(assert (=> start!12878 (= res!54734 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1311 srcBuffer!2))))))))

(assert (=> start!12878 e!43379))

(assert (=> start!12878 true))

(assert (=> start!12878 (array_inv!1187 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2256) Bool)

(assert (=> start!12878 (and (inv!12 thiss!1379) e!43376)))

(declare-fun b!66038 () Bool)

(assert (=> b!66038 (= e!43374 (= lt!104809 (bvsub (bvsub (bvadd (bitIndex!0 (size!1311 (buf!1692 (_2!3036 lt!104820))) (currentByte!3364 (_2!3036 lt!104820)) (currentBit!3359 (_2!3036 lt!104820))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!66039 () Bool)

(assert (=> b!66039 (= e!43380 true)))

(declare-fun lt!104821 () (_ BitVec 64))

(assert (=> b!66039 (= lt!104821 (bitIndex!0 (size!1311 (buf!1692 (_1!3035 lt!104807))) (currentByte!3364 (_1!3035 lt!104807)) (currentBit!3359 (_1!3035 lt!104807))))))

(declare-fun lt!104808 () (_ BitVec 64))

(assert (=> b!66039 (= lt!104808 (bitIndex!0 (size!1311 (buf!1692 (_1!3035 lt!104813))) (currentByte!3364 (_1!3035 lt!104813)) (currentBit!3359 (_1!3035 lt!104813))))))

(declare-fun b!66040 () Bool)

(declare-fun res!54726 () Bool)

(assert (=> b!66040 (=> (not res!54726) (not e!43379))))

(assert (=> b!66040 (= res!54726 (validate_offset_bits!1 ((_ sign_extend 32) (size!1311 (buf!1692 thiss!1379))) ((_ sign_extend 32) (currentByte!3364 thiss!1379)) ((_ sign_extend 32) (currentBit!3359 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!66041 () Bool)

(declare-fun res!54739 () Bool)

(assert (=> b!66041 (=> res!54739 e!43380)))

(assert (=> b!66041 (= res!54739 (not (isPrefixOf!0 (_1!3035 lt!104813) (_1!3035 lt!104807))))))

(declare-fun b!66042 () Bool)

(declare-fun res!54729 () Bool)

(assert (=> b!66042 (=> res!54729 e!43384)))

(assert (=> b!66042 (= res!54729 (not (= (size!1311 (buf!1692 thiss!1379)) (size!1311 (buf!1692 (_2!3036 lt!104804))))))))

(declare-fun b!66043 () Bool)

(declare-fun res!54732 () Bool)

(assert (=> b!66043 (=> res!54732 e!43380)))

(assert (=> b!66043 (= res!54732 (not (isPrefixOf!0 (_1!3035 lt!104807) (_2!3036 lt!104804))))))

(assert (= (and start!12878 res!54734) b!66040))

(assert (= (and b!66040 res!54726) b!66031))

(assert (= (and b!66031 (not res!54730)) b!66037))

(assert (= (and b!66037 (not res!54740)) b!66027))

(assert (= (and b!66027 res!54731) b!66033))

(assert (= (and b!66027 (not res!54738)) b!66028))

(assert (= (and b!66028 (not res!54733)) b!66032))

(assert (= (and b!66032 (not res!54725)) b!66042))

(assert (= (and b!66042 (not res!54729)) b!66030))

(assert (= (and b!66030 res!54723) b!66038))

(assert (= (and b!66030 (not res!54724)) b!66026))

(assert (= (and b!66026 (not res!54741)) b!66035))

(assert (= (and b!66035 (not res!54736)) b!66034))

(assert (= (and b!66034 (not res!54735)) b!66029))

(assert (= (and b!66029 (not res!54728)) b!66036))

(assert (= (and b!66036 (not res!54727)) b!66043))

(assert (= (and b!66043 (not res!54732)) b!66041))

(assert (= (and b!66041 (not res!54739)) b!66025))

(assert (= (and b!66025 (not res!54737)) b!66039))

(assert (= start!12878 b!66024))

(declare-fun m!104905 () Bool)

(assert (=> b!66026 m!104905))

(declare-fun m!104907 () Bool)

(assert (=> b!66028 m!104907))

(declare-fun m!104909 () Bool)

(assert (=> b!66036 m!104909))

(declare-fun m!104911 () Bool)

(assert (=> b!66040 m!104911))

(declare-fun m!104913 () Bool)

(assert (=> b!66038 m!104913))

(declare-fun m!104915 () Bool)

(assert (=> b!66032 m!104915))

(declare-fun m!104917 () Bool)

(assert (=> start!12878 m!104917))

(declare-fun m!104919 () Bool)

(assert (=> start!12878 m!104919))

(declare-fun m!104921 () Bool)

(assert (=> b!66034 m!104921))

(declare-fun m!104923 () Bool)

(assert (=> b!66034 m!104923))

(declare-fun m!104925 () Bool)

(assert (=> b!66034 m!104925))

(declare-fun m!104927 () Bool)

(assert (=> b!66034 m!104927))

(declare-fun m!104929 () Bool)

(assert (=> b!66034 m!104929))

(declare-fun m!104931 () Bool)

(assert (=> b!66034 m!104931))

(declare-fun m!104933 () Bool)

(assert (=> b!66034 m!104933))

(declare-fun m!104935 () Bool)

(assert (=> b!66034 m!104935))

(declare-fun m!104937 () Bool)

(assert (=> b!66024 m!104937))

(declare-fun m!104939 () Bool)

(assert (=> b!66041 m!104939))

(declare-fun m!104941 () Bool)

(assert (=> b!66037 m!104941))

(declare-fun m!104943 () Bool)

(assert (=> b!66037 m!104943))

(declare-fun m!104945 () Bool)

(assert (=> b!66037 m!104945))

(declare-fun m!104947 () Bool)

(assert (=> b!66037 m!104947))

(assert (=> b!66037 m!104941))

(declare-fun m!104949 () Bool)

(assert (=> b!66037 m!104949))

(declare-fun m!104951 () Bool)

(assert (=> b!66035 m!104951))

(declare-fun m!104953 () Bool)

(assert (=> b!66033 m!104953))

(assert (=> b!66033 m!104953))

(declare-fun m!104955 () Bool)

(assert (=> b!66033 m!104955))

(declare-fun m!104957 () Bool)

(assert (=> b!66033 m!104957))

(assert (=> b!66033 m!104957))

(declare-fun m!104959 () Bool)

(assert (=> b!66033 m!104959))

(declare-fun m!104961 () Bool)

(assert (=> b!66039 m!104961))

(declare-fun m!104963 () Bool)

(assert (=> b!66039 m!104963))

(declare-fun m!104965 () Bool)

(assert (=> b!66043 m!104965))

(declare-fun m!104967 () Bool)

(assert (=> b!66031 m!104967))

(declare-fun m!104969 () Bool)

(assert (=> b!66031 m!104969))

(declare-fun m!104971 () Bool)

(assert (=> b!66031 m!104971))

(declare-fun m!104973 () Bool)

(assert (=> b!66027 m!104973))

(declare-fun m!104975 () Bool)

(assert (=> b!66027 m!104975))

(declare-fun m!104977 () Bool)

(assert (=> b!66027 m!104977))

(declare-fun m!104979 () Bool)

(assert (=> b!66027 m!104979))

(declare-fun m!104981 () Bool)

(assert (=> b!66027 m!104981))

(declare-fun m!104983 () Bool)

(assert (=> b!66027 m!104983))

(declare-fun m!104985 () Bool)

(assert (=> b!66027 m!104985))

(declare-fun m!104987 () Bool)

(assert (=> b!66029 m!104987))

(check-sat (not b!66043) (not b!66029) (not b!66033) (not b!66032) (not b!66041) (not start!12878) (not b!66038) (not b!66028) (not b!66026) (not b!66031) (not b!66037) (not b!66039) (not b!66036) (not b!66034) (not b!66035) (not b!66024) (not b!66040) (not b!66027))
