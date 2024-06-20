; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6758 () Bool)

(assert start!6758)

(declare-fun b!31833 () Bool)

(declare-fun res!27250 () Bool)

(declare-fun e!21103 () Bool)

(assert (=> b!31833 (=> res!27250 e!21103)))

(declare-datatypes ((List!396 0))(
  ( (Nil!393) (Cons!392 (h!511 Bool) (t!1146 List!396)) )
))
(declare-fun lt!46932 () List!396)

(declare-fun lt!46923 () Bool)

(declare-fun head!233 (List!396) Bool)

(assert (=> b!31833 (= res!27250 (not (= (head!233 lt!46932) lt!46923)))))

(declare-fun b!31834 () Bool)

(declare-fun e!21100 () Bool)

(declare-fun e!21096 () Bool)

(assert (=> b!31834 (= e!21100 e!21096)))

(declare-fun res!27257 () Bool)

(assert (=> b!31834 (=> res!27257 e!21096)))

(declare-datatypes ((array!1811 0))(
  ( (array!1812 (arr!1268 (Array (_ BitVec 32) (_ BitVec 8))) (size!796 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1390 0))(
  ( (BitStream!1391 (buf!1124 array!1811) (currentByte!2485 (_ BitVec 32)) (currentBit!2480 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1390)

(declare-datatypes ((Unit!2423 0))(
  ( (Unit!2424) )
))
(declare-datatypes ((tuple2!3286 0))(
  ( (tuple2!3287 (_1!1730 Unit!2423) (_2!1730 BitStream!1390)) )
))
(declare-fun lt!46927 () tuple2!3286)

(declare-fun isPrefixOf!0 (BitStream!1390 BitStream!1390) Bool)

(assert (=> b!31834 (= res!27257 (not (isPrefixOf!0 thiss!1379 (_2!1730 lt!46927))))))

(declare-fun lt!46926 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31834 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!46926)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!31834 (= lt!46926 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46918 () Unit!2423)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1390 BitStream!1390 (_ BitVec 64) (_ BitVec 64)) Unit!2423)

(assert (=> b!31834 (= lt!46918 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1730 lt!46927) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1811)

(declare-fun appendBitFromByte!0 (BitStream!1390 (_ BitVec 8) (_ BitVec 32)) tuple2!3286)

(assert (=> b!31834 (= lt!46927 (appendBitFromByte!0 thiss!1379 (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!3288 0))(
  ( (tuple2!3289 (_1!1731 BitStream!1390) (_2!1731 BitStream!1390)) )
))
(declare-fun lt!46922 () tuple2!3288)

(declare-fun b!31835 () Bool)

(declare-fun e!21106 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1390 array!1811 (_ BitVec 64) (_ BitVec 64)) List!396)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1390 BitStream!1390 (_ BitVec 64)) List!396)

(assert (=> b!31835 (= e!21106 (= (head!233 (byteArrayBitContentToList!0 (_2!1730 lt!46927) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!233 (bitStreamReadBitsIntoList!0 (_2!1730 lt!46927) (_1!1731 lt!46922) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31836 () Bool)

(declare-fun e!21102 () Bool)

(declare-fun array_inv!748 (array!1811) Bool)

(assert (=> b!31836 (= e!21102 (array_inv!748 (buf!1124 thiss!1379)))))

(declare-fun b!31837 () Bool)

(declare-fun e!21105 () Bool)

(declare-fun e!21098 () Bool)

(assert (=> b!31837 (= e!21105 e!21098)))

(declare-fun res!27254 () Bool)

(assert (=> b!31837 (=> res!27254 e!21098)))

(declare-fun lt!46930 () List!396)

(declare-fun lt!46931 () List!396)

(assert (=> b!31837 (= res!27254 (not (= lt!46930 lt!46931)))))

(assert (=> b!31837 (= lt!46931 lt!46930)))

(declare-fun tail!113 (List!396) List!396)

(assert (=> b!31837 (= lt!46930 (tail!113 lt!46932))))

(declare-fun lt!46928 () Unit!2423)

(declare-fun lt!46919 () tuple2!3288)

(declare-fun lt!46933 () tuple2!3288)

(declare-fun lt!46917 () tuple2!3286)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1390 BitStream!1390 BitStream!1390 BitStream!1390 (_ BitVec 64) List!396) Unit!2423)

(assert (=> b!31837 (= lt!46928 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1730 lt!46917) (_2!1730 lt!46917) (_1!1731 lt!46919) (_1!1731 lt!46933) (bvsub to!314 i!635) lt!46932))))

(declare-fun b!31838 () Bool)

(declare-fun e!21101 () Bool)

(assert (=> b!31838 (= e!21101 (not e!21100))))

(declare-fun res!27244 () Bool)

(assert (=> b!31838 (=> res!27244 e!21100)))

(assert (=> b!31838 (= res!27244 (bvsge i!635 to!314))))

(assert (=> b!31838 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!46920 () Unit!2423)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1390) Unit!2423)

(assert (=> b!31838 (= lt!46920 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!46916 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31838 (= lt!46916 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(declare-fun e!21097 () Bool)

(declare-fun lt!46924 () (_ BitVec 64))

(declare-fun b!31839 () Bool)

(assert (=> b!31839 (= e!21097 (= lt!46924 (bvsub (bvsub (bvadd (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31840 () Bool)

(declare-fun res!27259 () Bool)

(assert (=> b!31840 (=> res!27259 e!21105)))

(declare-fun length!122 (List!396) Int)

(assert (=> b!31840 (= res!27259 (<= (length!122 lt!46932) 0))))

(declare-fun b!31841 () Bool)

(declare-fun res!27260 () Bool)

(declare-fun e!21093 () Bool)

(assert (=> b!31841 (=> res!27260 e!21093)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31841 (= res!27260 (not (invariant!0 (currentBit!2480 (_2!1730 lt!46917)) (currentByte!2485 (_2!1730 lt!46917)) (size!796 (buf!1124 (_2!1730 lt!46917))))))))

(declare-fun b!31842 () Bool)

(declare-fun res!27249 () Bool)

(declare-fun e!21104 () Bool)

(assert (=> b!31842 (=> res!27249 e!21104)))

(assert (=> b!31842 (= res!27249 (not (invariant!0 (currentBit!2480 (_2!1730 lt!46927)) (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46917))))))))

(declare-fun b!31843 () Bool)

(declare-fun e!21094 () Bool)

(assert (=> b!31843 (= e!21094 e!21093)))

(declare-fun res!27243 () Bool)

(assert (=> b!31843 (=> res!27243 e!21093)))

(assert (=> b!31843 (= res!27243 (not (= lt!46924 (bvsub (bvadd lt!46916 to!314) i!635))))))

(assert (=> b!31843 (= lt!46924 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46917))) (currentByte!2485 (_2!1730 lt!46917)) (currentBit!2480 (_2!1730 lt!46917))))))

(declare-fun b!31844 () Bool)

(assert (=> b!31844 (= e!21093 e!21104)))

(declare-fun res!27256 () Bool)

(assert (=> b!31844 (=> res!27256 e!21104)))

(assert (=> b!31844 (= res!27256 (not (= (size!796 (buf!1124 (_2!1730 lt!46927))) (size!796 (buf!1124 (_2!1730 lt!46917))))))))

(assert (=> b!31844 e!21097))

(declare-fun res!27251 () Bool)

(assert (=> b!31844 (=> (not res!27251) (not e!21097))))

(assert (=> b!31844 (= res!27251 (= (size!796 (buf!1124 (_2!1730 lt!46917))) (size!796 (buf!1124 thiss!1379))))))

(declare-fun b!31845 () Bool)

(declare-fun res!27252 () Bool)

(assert (=> b!31845 (=> (not res!27252) (not e!21101))))

(assert (=> b!31845 (= res!27252 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 thiss!1379))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31846 () Bool)

(declare-fun res!27247 () Bool)

(assert (=> b!31846 (=> res!27247 e!21103)))

(declare-fun bitAt!0 (array!1811 (_ BitVec 64)) Bool)

(assert (=> b!31846 (= res!27247 (not (= (head!233 (byteArrayBitContentToList!0 (_2!1730 lt!46917) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635))))))

(declare-fun b!31847 () Bool)

(assert (=> b!31847 (= e!21103 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!46916) (bvslt lt!46916 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927))))))))))

(declare-fun b!31848 () Bool)

(assert (=> b!31848 (= e!21096 e!21094)))

(declare-fun res!27245 () Bool)

(assert (=> b!31848 (=> res!27245 e!21094)))

(assert (=> b!31848 (= res!27245 (not (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!46917))))))

(assert (=> b!31848 (isPrefixOf!0 thiss!1379 (_2!1730 lt!46917))))

(declare-fun lt!46921 () Unit!2423)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1390 BitStream!1390 BitStream!1390) Unit!2423)

(assert (=> b!31848 (= lt!46921 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1730 lt!46927) (_2!1730 lt!46917)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1390 array!1811 (_ BitVec 64) (_ BitVec 64)) tuple2!3286)

(assert (=> b!31848 (= lt!46917 (appendBitsMSBFirstLoop!0 (_2!1730 lt!46927) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!31848 e!21106))

(declare-fun res!27246 () Bool)

(assert (=> b!31848 (=> (not res!27246) (not e!21106))))

(assert (=> b!31848 (= res!27246 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46925 () Unit!2423)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1390 array!1811 (_ BitVec 64)) Unit!2423)

(assert (=> b!31848 (= lt!46925 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1124 (_2!1730 lt!46927)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1390 BitStream!1390) tuple2!3288)

(assert (=> b!31848 (= lt!46922 (reader!0 thiss!1379 (_2!1730 lt!46927)))))

(declare-fun b!31849 () Bool)

(assert (=> b!31849 (= e!21098 e!21103)))

(declare-fun res!27253 () Bool)

(assert (=> b!31849 (=> res!27253 e!21103)))

(assert (=> b!31849 (= res!27253 (not (= lt!46923 (bitAt!0 (buf!1124 (_1!1731 lt!46933)) lt!46916))))))

(assert (=> b!31849 (= lt!46923 (bitAt!0 (buf!1124 (_1!1731 lt!46919)) lt!46916))))

(declare-fun res!27255 () Bool)

(assert (=> start!6758 (=> (not res!27255) (not e!21101))))

(assert (=> start!6758 (= res!27255 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!796 srcBuffer!2))))))))

(assert (=> start!6758 e!21101))

(assert (=> start!6758 true))

(assert (=> start!6758 (array_inv!748 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1390) Bool)

(assert (=> start!6758 (and (inv!12 thiss!1379) e!21102)))

(declare-fun b!31850 () Bool)

(declare-fun res!27261 () Bool)

(assert (=> b!31850 (=> res!27261 e!21104)))

(assert (=> b!31850 (= res!27261 (not (invariant!0 (currentBit!2480 (_2!1730 lt!46927)) (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46927))))))))

(declare-fun b!31851 () Bool)

(assert (=> b!31851 (= e!21104 e!21105)))

(declare-fun res!27258 () Bool)

(assert (=> b!31851 (=> res!27258 e!21105)))

(assert (=> b!31851 (= res!27258 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!31851 (= lt!46931 (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_1!1731 lt!46933) lt!46926))))

(assert (=> b!31851 (= lt!46932 (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_1!1731 lt!46919) (bvsub to!314 i!635)))))

(assert (=> b!31851 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!46926)))

(declare-fun lt!46929 () Unit!2423)

(assert (=> b!31851 (= lt!46929 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1730 lt!46927) (buf!1124 (_2!1730 lt!46917)) lt!46926))))

(assert (=> b!31851 (= lt!46933 (reader!0 (_2!1730 lt!46927) (_2!1730 lt!46917)))))

(assert (=> b!31851 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46915 () Unit!2423)

(assert (=> b!31851 (= lt!46915 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1124 (_2!1730 lt!46917)) (bvsub to!314 i!635)))))

(assert (=> b!31851 (= lt!46919 (reader!0 thiss!1379 (_2!1730 lt!46917)))))

(declare-fun b!31852 () Bool)

(declare-fun res!27248 () Bool)

(assert (=> b!31852 (=> res!27248 e!21093)))

(assert (=> b!31852 (= res!27248 (not (= (size!796 (buf!1124 thiss!1379)) (size!796 (buf!1124 (_2!1730 lt!46917))))))))

(assert (= (and start!6758 res!27255) b!31845))

(assert (= (and b!31845 res!27252) b!31838))

(assert (= (and b!31838 (not res!27244)) b!31834))

(assert (= (and b!31834 (not res!27257)) b!31848))

(assert (= (and b!31848 res!27246) b!31835))

(assert (= (and b!31848 (not res!27245)) b!31843))

(assert (= (and b!31843 (not res!27243)) b!31841))

(assert (= (and b!31841 (not res!27260)) b!31852))

(assert (= (and b!31852 (not res!27248)) b!31844))

(assert (= (and b!31844 res!27251) b!31839))

(assert (= (and b!31844 (not res!27256)) b!31850))

(assert (= (and b!31850 (not res!27261)) b!31842))

(assert (= (and b!31842 (not res!27249)) b!31851))

(assert (= (and b!31851 (not res!27258)) b!31840))

(assert (= (and b!31840 (not res!27259)) b!31837))

(assert (= (and b!31837 (not res!27254)) b!31849))

(assert (= (and b!31849 (not res!27253)) b!31833))

(assert (= (and b!31833 (not res!27250)) b!31846))

(assert (= (and b!31846 (not res!27247)) b!31847))

(assert (= start!6758 b!31836))

(declare-fun m!46905 () Bool)

(assert (=> b!31846 m!46905))

(assert (=> b!31846 m!46905))

(declare-fun m!46907 () Bool)

(assert (=> b!31846 m!46907))

(declare-fun m!46909 () Bool)

(assert (=> b!31846 m!46909))

(declare-fun m!46911 () Bool)

(assert (=> b!31841 m!46911))

(declare-fun m!46913 () Bool)

(assert (=> b!31838 m!46913))

(declare-fun m!46915 () Bool)

(assert (=> b!31838 m!46915))

(declare-fun m!46917 () Bool)

(assert (=> b!31838 m!46917))

(declare-fun m!46919 () Bool)

(assert (=> start!6758 m!46919))

(declare-fun m!46921 () Bool)

(assert (=> start!6758 m!46921))

(declare-fun m!46923 () Bool)

(assert (=> b!31834 m!46923))

(declare-fun m!46925 () Bool)

(assert (=> b!31834 m!46925))

(declare-fun m!46927 () Bool)

(assert (=> b!31834 m!46927))

(assert (=> b!31834 m!46923))

(declare-fun m!46929 () Bool)

(assert (=> b!31834 m!46929))

(declare-fun m!46931 () Bool)

(assert (=> b!31834 m!46931))

(declare-fun m!46933 () Bool)

(assert (=> b!31842 m!46933))

(declare-fun m!46935 () Bool)

(assert (=> b!31835 m!46935))

(assert (=> b!31835 m!46935))

(declare-fun m!46937 () Bool)

(assert (=> b!31835 m!46937))

(declare-fun m!46939 () Bool)

(assert (=> b!31835 m!46939))

(assert (=> b!31835 m!46939))

(declare-fun m!46941 () Bool)

(assert (=> b!31835 m!46941))

(declare-fun m!46943 () Bool)

(assert (=> b!31839 m!46943))

(declare-fun m!46945 () Bool)

(assert (=> b!31845 m!46945))

(declare-fun m!46947 () Bool)

(assert (=> b!31843 m!46947))

(declare-fun m!46949 () Bool)

(assert (=> b!31836 m!46949))

(declare-fun m!46951 () Bool)

(assert (=> b!31851 m!46951))

(declare-fun m!46953 () Bool)

(assert (=> b!31851 m!46953))

(declare-fun m!46955 () Bool)

(assert (=> b!31851 m!46955))

(declare-fun m!46957 () Bool)

(assert (=> b!31851 m!46957))

(declare-fun m!46959 () Bool)

(assert (=> b!31851 m!46959))

(declare-fun m!46961 () Bool)

(assert (=> b!31851 m!46961))

(declare-fun m!46963 () Bool)

(assert (=> b!31851 m!46963))

(declare-fun m!46965 () Bool)

(assert (=> b!31851 m!46965))

(declare-fun m!46967 () Bool)

(assert (=> b!31833 m!46967))

(declare-fun m!46969 () Bool)

(assert (=> b!31837 m!46969))

(declare-fun m!46971 () Bool)

(assert (=> b!31837 m!46971))

(declare-fun m!46973 () Bool)

(assert (=> b!31848 m!46973))

(declare-fun m!46975 () Bool)

(assert (=> b!31848 m!46975))

(declare-fun m!46977 () Bool)

(assert (=> b!31848 m!46977))

(declare-fun m!46979 () Bool)

(assert (=> b!31848 m!46979))

(declare-fun m!46981 () Bool)

(assert (=> b!31848 m!46981))

(declare-fun m!46983 () Bool)

(assert (=> b!31848 m!46983))

(declare-fun m!46985 () Bool)

(assert (=> b!31848 m!46985))

(declare-fun m!46987 () Bool)

(assert (=> b!31849 m!46987))

(declare-fun m!46989 () Bool)

(assert (=> b!31849 m!46989))

(declare-fun m!46991 () Bool)

(assert (=> b!31850 m!46991))

(declare-fun m!46993 () Bool)

(assert (=> b!31840 m!46993))

(push 1)

(assert (not start!6758))

(assert (not b!31838))

(assert (not b!31849))

(assert (not b!31843))

(assert (not b!31835))

(assert (not b!31834))

(assert (not b!31833))

(assert (not b!31845))

(assert (not b!31839))

(assert (not b!31837))

(assert (not b!31846))

(assert (not b!31836))

(assert (not b!31850))

(assert (not b!31848))

(assert (not b!31841))

(assert (not b!31842))

(assert (not b!31851))

(assert (not b!31840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9334 () Bool)

(assert (=> d!9334 (= (invariant!0 (currentBit!2480 (_2!1730 lt!46927)) (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46927)))) (and (bvsge (currentBit!2480 (_2!1730 lt!46927)) #b00000000000000000000000000000000) (bvslt (currentBit!2480 (_2!1730 lt!46927)) #b00000000000000000000000000001000) (bvsge (currentByte!2485 (_2!1730 lt!46927)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46927)))) (and (= (currentBit!2480 (_2!1730 lt!46927)) #b00000000000000000000000000000000) (= (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46927))))))))))

(assert (=> b!31850 d!9334))

(declare-fun d!9336 () Bool)

(declare-fun e!21230 () Bool)

(assert (=> d!9336 e!21230))

(declare-fun res!27428 () Bool)

(assert (=> d!9336 (=> (not res!27428) (not e!21230))))

(declare-fun lt!47196 () (_ BitVec 64))

(declare-fun lt!47199 () (_ BitVec 64))

(declare-fun lt!47195 () (_ BitVec 64))

(assert (=> d!9336 (= res!27428 (= lt!47196 (bvsub lt!47195 lt!47199)))))

(assert (=> d!9336 (or (= (bvand lt!47195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47199 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47195 lt!47199) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9336 (= lt!47199 (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927)))))))

(declare-fun lt!47197 () (_ BitVec 64))

(declare-fun lt!47198 () (_ BitVec 64))

(assert (=> d!9336 (= lt!47195 (bvmul lt!47197 lt!47198))))

(assert (=> d!9336 (or (= lt!47197 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47198 (bvsdiv (bvmul lt!47197 lt!47198) lt!47197)))))

(assert (=> d!9336 (= lt!47198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9336 (= lt!47197 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))))))

(assert (=> d!9336 (= lt!47196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927)))))))

(assert (=> d!9336 (invariant!0 (currentBit!2480 (_2!1730 lt!46927)) (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46927))))))

(assert (=> d!9336 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))) lt!47196)))

(declare-fun b!32050 () Bool)

(declare-fun res!27429 () Bool)

(assert (=> b!32050 (=> (not res!27429) (not e!21230))))

(assert (=> b!32050 (= res!27429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47196))))

(declare-fun b!32051 () Bool)

(declare-fun lt!47200 () (_ BitVec 64))

(assert (=> b!32051 (= e!21230 (bvsle lt!47196 (bvmul lt!47200 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32051 (or (= lt!47200 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47200 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47200)))))

(assert (=> b!32051 (= lt!47200 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))))))

(assert (= (and d!9336 res!27428) b!32050))

(assert (= (and b!32050 res!27429) b!32051))

(declare-fun m!47293 () Bool)

(assert (=> d!9336 m!47293))

(assert (=> d!9336 m!46991))

(assert (=> b!31839 d!9336))

(declare-fun d!9348 () Bool)

(declare-fun size!800 (List!396) Int)

(assert (=> d!9348 (= (length!122 lt!46932) (size!800 lt!46932))))

(declare-fun bs!2568 () Bool)

(assert (= bs!2568 d!9348))

(declare-fun m!47295 () Bool)

(assert (=> bs!2568 m!47295))

(assert (=> b!31840 d!9348))

(declare-fun b!32091 () Bool)

(declare-fun res!27459 () Bool)

(declare-fun e!21253 () Bool)

(assert (=> b!32091 (=> (not res!27459) (not e!21253))))

(declare-fun lt!47308 () tuple2!3288)

(assert (=> b!32091 (= res!27459 (isPrefixOf!0 (_1!1731 lt!47308) (_2!1730 lt!46927)))))

(declare-fun b!32092 () Bool)

(declare-fun e!21252 () Unit!2423)

(declare-fun Unit!2439 () Unit!2423)

(assert (=> b!32092 (= e!21252 Unit!2439)))

(declare-fun b!32093 () Bool)

(declare-fun res!27457 () Bool)

(assert (=> b!32093 (=> (not res!27457) (not e!21253))))

(assert (=> b!32093 (= res!27457 (isPrefixOf!0 (_2!1731 lt!47308) (_2!1730 lt!46917)))))

(declare-fun lt!47298 () (_ BitVec 64))

(declare-fun lt!47293 () (_ BitVec 64))

(declare-fun b!32094 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1390 (_ BitVec 64)) BitStream!1390)

(assert (=> b!32094 (= e!21253 (= (_1!1731 lt!47308) (withMovedBitIndex!0 (_2!1731 lt!47308) (bvsub lt!47293 lt!47298))))))

(assert (=> b!32094 (or (= (bvand lt!47293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47293 lt!47298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32094 (= lt!47298 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46917))) (currentByte!2485 (_2!1730 lt!46917)) (currentBit!2480 (_2!1730 lt!46917))))))

(assert (=> b!32094 (= lt!47293 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))))))

(declare-fun d!9350 () Bool)

(assert (=> d!9350 e!21253))

(declare-fun res!27458 () Bool)

(assert (=> d!9350 (=> (not res!27458) (not e!21253))))

(assert (=> d!9350 (= res!27458 (isPrefixOf!0 (_1!1731 lt!47308) (_2!1731 lt!47308)))))

(declare-fun lt!47306 () BitStream!1390)

(assert (=> d!9350 (= lt!47308 (tuple2!3289 lt!47306 (_2!1730 lt!46917)))))

(declare-fun lt!47305 () Unit!2423)

(declare-fun lt!47307 () Unit!2423)

(assert (=> d!9350 (= lt!47305 lt!47307)))

(assert (=> d!9350 (isPrefixOf!0 lt!47306 (_2!1730 lt!46917))))

(assert (=> d!9350 (= lt!47307 (lemmaIsPrefixTransitive!0 lt!47306 (_2!1730 lt!46917) (_2!1730 lt!46917)))))

(declare-fun lt!47302 () Unit!2423)

(declare-fun lt!47309 () Unit!2423)

(assert (=> d!9350 (= lt!47302 lt!47309)))

(assert (=> d!9350 (isPrefixOf!0 lt!47306 (_2!1730 lt!46917))))

(assert (=> d!9350 (= lt!47309 (lemmaIsPrefixTransitive!0 lt!47306 (_2!1730 lt!46927) (_2!1730 lt!46917)))))

(declare-fun lt!47291 () Unit!2423)

(assert (=> d!9350 (= lt!47291 e!21252)))

(declare-fun c!2176 () Bool)

(assert (=> d!9350 (= c!2176 (not (= (size!796 (buf!1124 (_2!1730 lt!46927))) #b00000000000000000000000000000000)))))

(declare-fun lt!47294 () Unit!2423)

(declare-fun lt!47304 () Unit!2423)

(assert (=> d!9350 (= lt!47294 lt!47304)))

(assert (=> d!9350 (isPrefixOf!0 (_2!1730 lt!46917) (_2!1730 lt!46917))))

(assert (=> d!9350 (= lt!47304 (lemmaIsPrefixRefl!0 (_2!1730 lt!46917)))))

(declare-fun lt!47292 () Unit!2423)

(declare-fun lt!47310 () Unit!2423)

(assert (=> d!9350 (= lt!47292 lt!47310)))

(assert (=> d!9350 (= lt!47310 (lemmaIsPrefixRefl!0 (_2!1730 lt!46917)))))

(declare-fun lt!47296 () Unit!2423)

(declare-fun lt!47300 () Unit!2423)

(assert (=> d!9350 (= lt!47296 lt!47300)))

(assert (=> d!9350 (isPrefixOf!0 lt!47306 lt!47306)))

(assert (=> d!9350 (= lt!47300 (lemmaIsPrefixRefl!0 lt!47306))))

(declare-fun lt!47303 () Unit!2423)

(declare-fun lt!47295 () Unit!2423)

(assert (=> d!9350 (= lt!47303 lt!47295)))

(assert (=> d!9350 (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!46927))))

(assert (=> d!9350 (= lt!47295 (lemmaIsPrefixRefl!0 (_2!1730 lt!46927)))))

(assert (=> d!9350 (= lt!47306 (BitStream!1391 (buf!1124 (_2!1730 lt!46917)) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))))))

(assert (=> d!9350 (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!46917))))

(assert (=> d!9350 (= (reader!0 (_2!1730 lt!46927) (_2!1730 lt!46917)) lt!47308)))

(declare-fun b!32095 () Bool)

(declare-fun lt!47297 () Unit!2423)

(assert (=> b!32095 (= e!21252 lt!47297)))

(declare-fun lt!47301 () (_ BitVec 64))

(assert (=> b!32095 (= lt!47301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47299 () (_ BitVec 64))

(assert (=> b!32095 (= lt!47299 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1811 array!1811 (_ BitVec 64) (_ BitVec 64)) Unit!2423)

(assert (=> b!32095 (= lt!47297 (arrayBitRangesEqSymmetric!0 (buf!1124 (_2!1730 lt!46927)) (buf!1124 (_2!1730 lt!46917)) lt!47301 lt!47299))))

(declare-fun arrayBitRangesEq!0 (array!1811 array!1811 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32095 (arrayBitRangesEq!0 (buf!1124 (_2!1730 lt!46917)) (buf!1124 (_2!1730 lt!46927)) lt!47301 lt!47299)))

(assert (= (and d!9350 c!2176) b!32095))

(assert (= (and d!9350 (not c!2176)) b!32092))

(assert (= (and d!9350 res!27458) b!32091))

(assert (= (and b!32091 res!27459) b!32093))

(assert (= (and b!32093 res!27457) b!32094))

(declare-fun m!47341 () Bool)

(assert (=> b!32094 m!47341))

(assert (=> b!32094 m!46947))

(assert (=> b!32094 m!46943))

(declare-fun m!47343 () Bool)

(assert (=> b!32091 m!47343))

(assert (=> b!32095 m!46943))

(declare-fun m!47345 () Bool)

(assert (=> b!32095 m!47345))

(declare-fun m!47347 () Bool)

(assert (=> b!32095 m!47347))

(declare-fun m!47349 () Bool)

(assert (=> b!32093 m!47349))

(assert (=> d!9350 m!46985))

(declare-fun m!47351 () Bool)

(assert (=> d!9350 m!47351))

(declare-fun m!47353 () Bool)

(assert (=> d!9350 m!47353))

(declare-fun m!47355 () Bool)

(assert (=> d!9350 m!47355))

(declare-fun m!47357 () Bool)

(assert (=> d!9350 m!47357))

(declare-fun m!47359 () Bool)

(assert (=> d!9350 m!47359))

(declare-fun m!47361 () Bool)

(assert (=> d!9350 m!47361))

(declare-fun m!47363 () Bool)

(assert (=> d!9350 m!47363))

(declare-fun m!47365 () Bool)

(assert (=> d!9350 m!47365))

(declare-fun m!47367 () Bool)

(assert (=> d!9350 m!47367))

(declare-fun m!47369 () Bool)

(assert (=> d!9350 m!47369))

(assert (=> b!31851 d!9350))

(declare-fun d!9378 () Bool)

(assert (=> d!9378 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!46926) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927)))) lt!46926))))

(declare-fun bs!2574 () Bool)

(assert (= bs!2574 d!9378))

(declare-fun m!47371 () Bool)

(assert (=> bs!2574 m!47371))

(assert (=> b!31851 d!9378))

(declare-fun d!9380 () Bool)

(assert (=> d!9380 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!46926)))

(declare-fun lt!47313 () Unit!2423)

(declare-fun choose!9 (BitStream!1390 array!1811 (_ BitVec 64) BitStream!1390) Unit!2423)

(assert (=> d!9380 (= lt!47313 (choose!9 (_2!1730 lt!46927) (buf!1124 (_2!1730 lt!46917)) lt!46926 (BitStream!1391 (buf!1124 (_2!1730 lt!46917)) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927)))))))

(assert (=> d!9380 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1730 lt!46927) (buf!1124 (_2!1730 lt!46917)) lt!46926) lt!47313)))

(declare-fun bs!2575 () Bool)

(assert (= bs!2575 d!9380))

(assert (=> bs!2575 m!46959))

(declare-fun m!47373 () Bool)

(assert (=> bs!2575 m!47373))

(assert (=> b!31851 d!9380))

(declare-fun b!32096 () Bool)

(declare-fun res!27462 () Bool)

(declare-fun e!21255 () Bool)

(assert (=> b!32096 (=> (not res!27462) (not e!21255))))

(declare-fun lt!47331 () tuple2!3288)

(assert (=> b!32096 (= res!27462 (isPrefixOf!0 (_1!1731 lt!47331) thiss!1379))))

(declare-fun b!32097 () Bool)

(declare-fun e!21254 () Unit!2423)

(declare-fun Unit!2440 () Unit!2423)

(assert (=> b!32097 (= e!21254 Unit!2440)))

(declare-fun b!32098 () Bool)

(declare-fun res!27460 () Bool)

(assert (=> b!32098 (=> (not res!27460) (not e!21255))))

(assert (=> b!32098 (= res!27460 (isPrefixOf!0 (_2!1731 lt!47331) (_2!1730 lt!46917)))))

(declare-fun b!32099 () Bool)

(declare-fun lt!47321 () (_ BitVec 64))

(declare-fun lt!47316 () (_ BitVec 64))

(assert (=> b!32099 (= e!21255 (= (_1!1731 lt!47331) (withMovedBitIndex!0 (_2!1731 lt!47331) (bvsub lt!47316 lt!47321))))))

(assert (=> b!32099 (or (= (bvand lt!47316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47316 lt!47321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32099 (= lt!47321 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46917))) (currentByte!2485 (_2!1730 lt!46917)) (currentBit!2480 (_2!1730 lt!46917))))))

(assert (=> b!32099 (= lt!47316 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(declare-fun d!9382 () Bool)

(assert (=> d!9382 e!21255))

(declare-fun res!27461 () Bool)

(assert (=> d!9382 (=> (not res!27461) (not e!21255))))

(assert (=> d!9382 (= res!27461 (isPrefixOf!0 (_1!1731 lt!47331) (_2!1731 lt!47331)))))

(declare-fun lt!47329 () BitStream!1390)

(assert (=> d!9382 (= lt!47331 (tuple2!3289 lt!47329 (_2!1730 lt!46917)))))

(declare-fun lt!47328 () Unit!2423)

(declare-fun lt!47330 () Unit!2423)

(assert (=> d!9382 (= lt!47328 lt!47330)))

(assert (=> d!9382 (isPrefixOf!0 lt!47329 (_2!1730 lt!46917))))

(assert (=> d!9382 (= lt!47330 (lemmaIsPrefixTransitive!0 lt!47329 (_2!1730 lt!46917) (_2!1730 lt!46917)))))

(declare-fun lt!47325 () Unit!2423)

(declare-fun lt!47332 () Unit!2423)

(assert (=> d!9382 (= lt!47325 lt!47332)))

(assert (=> d!9382 (isPrefixOf!0 lt!47329 (_2!1730 lt!46917))))

(assert (=> d!9382 (= lt!47332 (lemmaIsPrefixTransitive!0 lt!47329 thiss!1379 (_2!1730 lt!46917)))))

(declare-fun lt!47314 () Unit!2423)

(assert (=> d!9382 (= lt!47314 e!21254)))

(declare-fun c!2177 () Bool)

(assert (=> d!9382 (= c!2177 (not (= (size!796 (buf!1124 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!47317 () Unit!2423)

(declare-fun lt!47327 () Unit!2423)

(assert (=> d!9382 (= lt!47317 lt!47327)))

(assert (=> d!9382 (isPrefixOf!0 (_2!1730 lt!46917) (_2!1730 lt!46917))))

(assert (=> d!9382 (= lt!47327 (lemmaIsPrefixRefl!0 (_2!1730 lt!46917)))))

(declare-fun lt!47315 () Unit!2423)

(declare-fun lt!47333 () Unit!2423)

(assert (=> d!9382 (= lt!47315 lt!47333)))

(assert (=> d!9382 (= lt!47333 (lemmaIsPrefixRefl!0 (_2!1730 lt!46917)))))

(declare-fun lt!47319 () Unit!2423)

(declare-fun lt!47323 () Unit!2423)

(assert (=> d!9382 (= lt!47319 lt!47323)))

(assert (=> d!9382 (isPrefixOf!0 lt!47329 lt!47329)))

(assert (=> d!9382 (= lt!47323 (lemmaIsPrefixRefl!0 lt!47329))))

(declare-fun lt!47326 () Unit!2423)

(declare-fun lt!47318 () Unit!2423)

(assert (=> d!9382 (= lt!47326 lt!47318)))

(assert (=> d!9382 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9382 (= lt!47318 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9382 (= lt!47329 (BitStream!1391 (buf!1124 (_2!1730 lt!46917)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(assert (=> d!9382 (isPrefixOf!0 thiss!1379 (_2!1730 lt!46917))))

(assert (=> d!9382 (= (reader!0 thiss!1379 (_2!1730 lt!46917)) lt!47331)))

(declare-fun b!32100 () Bool)

(declare-fun lt!47320 () Unit!2423)

(assert (=> b!32100 (= e!21254 lt!47320)))

(declare-fun lt!47324 () (_ BitVec 64))

(assert (=> b!32100 (= lt!47324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47322 () (_ BitVec 64))

(assert (=> b!32100 (= lt!47322 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(assert (=> b!32100 (= lt!47320 (arrayBitRangesEqSymmetric!0 (buf!1124 thiss!1379) (buf!1124 (_2!1730 lt!46917)) lt!47324 lt!47322))))

(assert (=> b!32100 (arrayBitRangesEq!0 (buf!1124 (_2!1730 lt!46917)) (buf!1124 thiss!1379) lt!47324 lt!47322)))

(assert (= (and d!9382 c!2177) b!32100))

(assert (= (and d!9382 (not c!2177)) b!32097))

(assert (= (and d!9382 res!27461) b!32096))

(assert (= (and b!32096 res!27462) b!32098))

(assert (= (and b!32098 res!27460) b!32099))

(declare-fun m!47375 () Bool)

(assert (=> b!32099 m!47375))

(assert (=> b!32099 m!46947))

(assert (=> b!32099 m!46917))

(declare-fun m!47377 () Bool)

(assert (=> b!32096 m!47377))

(assert (=> b!32100 m!46917))

(declare-fun m!47379 () Bool)

(assert (=> b!32100 m!47379))

(declare-fun m!47381 () Bool)

(assert (=> b!32100 m!47381))

(declare-fun m!47383 () Bool)

(assert (=> b!32098 m!47383))

(assert (=> d!9382 m!46973))

(assert (=> d!9382 m!47351))

(declare-fun m!47385 () Bool)

(assert (=> d!9382 m!47385))

(declare-fun m!47387 () Bool)

(assert (=> d!9382 m!47387))

(declare-fun m!47389 () Bool)

(assert (=> d!9382 m!47389))

(assert (=> d!9382 m!46913))

(declare-fun m!47391 () Bool)

(assert (=> d!9382 m!47391))

(declare-fun m!47393 () Bool)

(assert (=> d!9382 m!47393))

(assert (=> d!9382 m!47365))

(declare-fun m!47395 () Bool)

(assert (=> d!9382 m!47395))

(assert (=> d!9382 m!46915))

(assert (=> b!31851 d!9382))

(declare-fun d!9384 () Bool)

(declare-fun e!21261 () Bool)

(assert (=> d!9384 e!21261))

(declare-fun c!2182 () Bool)

(assert (=> d!9384 (= c!2182 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!47342 () List!396)

(declare-datatypes ((tuple2!3306 0))(
  ( (tuple2!3307 (_1!1740 List!396) (_2!1740 BitStream!1390)) )
))
(declare-fun e!21260 () tuple2!3306)

(assert (=> d!9384 (= lt!47342 (_1!1740 e!21260))))

(declare-fun c!2183 () Bool)

(assert (=> d!9384 (= c!2183 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9384 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9384 (= (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_1!1731 lt!46919) (bvsub to!314 i!635)) lt!47342)))

(declare-fun b!32110 () Bool)

(declare-fun lt!47341 () (_ BitVec 64))

(declare-datatypes ((tuple2!3308 0))(
  ( (tuple2!3309 (_1!1741 Bool) (_2!1741 BitStream!1390)) )
))
(declare-fun lt!47340 () tuple2!3308)

(assert (=> b!32110 (= e!21260 (tuple2!3307 (Cons!392 (_1!1741 lt!47340) (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_2!1741 lt!47340) (bvsub (bvsub to!314 i!635) lt!47341))) (_2!1741 lt!47340)))))

(declare-fun readBit!0 (BitStream!1390) tuple2!3308)

(assert (=> b!32110 (= lt!47340 (readBit!0 (_1!1731 lt!46919)))))

(assert (=> b!32110 (= lt!47341 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32112 () Bool)

(assert (=> b!32112 (= e!21261 (> (length!122 lt!47342) 0))))

(declare-fun b!32109 () Bool)

(assert (=> b!32109 (= e!21260 (tuple2!3307 Nil!393 (_1!1731 lt!46919)))))

(declare-fun b!32111 () Bool)

(declare-fun isEmpty!88 (List!396) Bool)

(assert (=> b!32111 (= e!21261 (isEmpty!88 lt!47342))))

(assert (= (and d!9384 c!2183) b!32109))

(assert (= (and d!9384 (not c!2183)) b!32110))

(assert (= (and d!9384 c!2182) b!32111))

(assert (= (and d!9384 (not c!2182)) b!32112))

(declare-fun m!47397 () Bool)

(assert (=> b!32110 m!47397))

(declare-fun m!47399 () Bool)

(assert (=> b!32110 m!47399))

(declare-fun m!47401 () Bool)

(assert (=> b!32112 m!47401))

(declare-fun m!47403 () Bool)

(assert (=> b!32111 m!47403))

(assert (=> b!31851 d!9384))

(declare-fun d!9386 () Bool)

(declare-fun e!21263 () Bool)

(assert (=> d!9386 e!21263))

(declare-fun c!2184 () Bool)

(assert (=> d!9386 (= c!2184 (= lt!46926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!47345 () List!396)

(declare-fun e!21262 () tuple2!3306)

(assert (=> d!9386 (= lt!47345 (_1!1740 e!21262))))

(declare-fun c!2185 () Bool)

(assert (=> d!9386 (= c!2185 (= lt!46926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9386 (bvsge lt!46926 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9386 (= (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_1!1731 lt!46933) lt!46926) lt!47345)))

(declare-fun lt!47343 () tuple2!3308)

(declare-fun b!32114 () Bool)

(declare-fun lt!47344 () (_ BitVec 64))

(assert (=> b!32114 (= e!21262 (tuple2!3307 (Cons!392 (_1!1741 lt!47343) (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_2!1741 lt!47343) (bvsub lt!46926 lt!47344))) (_2!1741 lt!47343)))))

(assert (=> b!32114 (= lt!47343 (readBit!0 (_1!1731 lt!46933)))))

(assert (=> b!32114 (= lt!47344 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32116 () Bool)

(assert (=> b!32116 (= e!21263 (> (length!122 lt!47345) 0))))

(declare-fun b!32113 () Bool)

(assert (=> b!32113 (= e!21262 (tuple2!3307 Nil!393 (_1!1731 lt!46933)))))

(declare-fun b!32115 () Bool)

(assert (=> b!32115 (= e!21263 (isEmpty!88 lt!47345))))

(assert (= (and d!9386 c!2185) b!32113))

(assert (= (and d!9386 (not c!2185)) b!32114))

(assert (= (and d!9386 c!2184) b!32115))

(assert (= (and d!9386 (not c!2184)) b!32116))

(declare-fun m!47405 () Bool)

(assert (=> b!32114 m!47405))

(declare-fun m!47407 () Bool)

(assert (=> b!32114 m!47407))

(declare-fun m!47409 () Bool)

(assert (=> b!32116 m!47409))

(declare-fun m!47411 () Bool)

(assert (=> b!32115 m!47411))

(assert (=> b!31851 d!9386))

(declare-fun d!9388 () Bool)

(assert (=> d!9388 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!47346 () Unit!2423)

(assert (=> d!9388 (= lt!47346 (choose!9 thiss!1379 (buf!1124 (_2!1730 lt!46917)) (bvsub to!314 i!635) (BitStream!1391 (buf!1124 (_2!1730 lt!46917)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379))))))

(assert (=> d!9388 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1124 (_2!1730 lt!46917)) (bvsub to!314 i!635)) lt!47346)))

(declare-fun bs!2576 () Bool)

(assert (= bs!2576 d!9388))

(assert (=> bs!2576 m!46961))

(declare-fun m!47413 () Bool)

(assert (=> bs!2576 m!47413))

(assert (=> b!31851 d!9388))

(declare-fun d!9390 () Bool)

(assert (=> d!9390 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2577 () Bool)

(assert (= bs!2577 d!9390))

(declare-fun m!47415 () Bool)

(assert (=> bs!2577 m!47415))

(assert (=> b!31851 d!9390))

(declare-fun d!9392 () Bool)

(assert (=> d!9392 (= (invariant!0 (currentBit!2480 (_2!1730 lt!46917)) (currentByte!2485 (_2!1730 lt!46917)) (size!796 (buf!1124 (_2!1730 lt!46917)))) (and (bvsge (currentBit!2480 (_2!1730 lt!46917)) #b00000000000000000000000000000000) (bvslt (currentBit!2480 (_2!1730 lt!46917)) #b00000000000000000000000000001000) (bvsge (currentByte!2485 (_2!1730 lt!46917)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2485 (_2!1730 lt!46917)) (size!796 (buf!1124 (_2!1730 lt!46917)))) (and (= (currentBit!2480 (_2!1730 lt!46917)) #b00000000000000000000000000000000) (= (currentByte!2485 (_2!1730 lt!46917)) (size!796 (buf!1124 (_2!1730 lt!46917))))))))))

(assert (=> b!31841 d!9392))

(declare-fun b!32279 () Bool)

(declare-fun e!21345 () tuple2!3286)

(declare-fun lt!47816 () tuple2!3286)

(declare-fun Unit!2441 () Unit!2423)

(assert (=> b!32279 (= e!21345 (tuple2!3287 Unit!2441 (_2!1730 lt!47816)))))

(declare-fun lt!47823 () tuple2!3286)

(assert (=> b!32279 (= lt!47823 (appendBitFromByte!0 (_2!1730 lt!46927) (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!47799 () (_ BitVec 64))

(assert (=> b!32279 (= lt!47799 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47806 () (_ BitVec 64))

(assert (=> b!32279 (= lt!47806 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47800 () Unit!2423)

(assert (=> b!32279 (= lt!47800 (validateOffsetBitsIneqLemma!0 (_2!1730 lt!46927) (_2!1730 lt!47823) lt!47799 lt!47806))))

(assert (=> b!32279 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!47823)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!47823))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!47823))) (bvsub lt!47799 lt!47806))))

(declare-fun lt!47814 () Unit!2423)

(assert (=> b!32279 (= lt!47814 lt!47800)))

(declare-fun lt!47795 () tuple2!3288)

(declare-fun call!415 () tuple2!3288)

(assert (=> b!32279 (= lt!47795 call!415)))

(declare-fun lt!47801 () (_ BitVec 64))

(assert (=> b!32279 (= lt!47801 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47785 () Unit!2423)

(assert (=> b!32279 (= lt!47785 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1730 lt!46927) (buf!1124 (_2!1730 lt!47823)) lt!47801))))

(assert (=> b!32279 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!47823)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!47801)))

(declare-fun lt!47798 () Unit!2423)

(assert (=> b!32279 (= lt!47798 lt!47785)))

(assert (=> b!32279 (= (head!233 (byteArrayBitContentToList!0 (_2!1730 lt!47823) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!233 (bitStreamReadBitsIntoList!0 (_2!1730 lt!47823) (_1!1731 lt!47795) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!47813 () Unit!2423)

(declare-fun Unit!2442 () Unit!2423)

(assert (=> b!32279 (= lt!47813 Unit!2442)))

(assert (=> b!32279 (= lt!47816 (appendBitsMSBFirstLoop!0 (_2!1730 lt!47823) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!47783 () Unit!2423)

(assert (=> b!32279 (= lt!47783 (lemmaIsPrefixTransitive!0 (_2!1730 lt!46927) (_2!1730 lt!47823) (_2!1730 lt!47816)))))

(assert (=> b!32279 (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!47816))))

(declare-fun lt!47782 () Unit!2423)

(assert (=> b!32279 (= lt!47782 lt!47783)))

(assert (=> b!32279 (= (size!796 (buf!1124 (_2!1730 lt!47816))) (size!796 (buf!1124 (_2!1730 lt!46927))))))

(declare-fun lt!47818 () Unit!2423)

(declare-fun Unit!2443 () Unit!2423)

(assert (=> b!32279 (= lt!47818 Unit!2443)))

(assert (=> b!32279 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47816))) (currentByte!2485 (_2!1730 lt!47816)) (currentBit!2480 (_2!1730 lt!47816))) (bvsub (bvadd (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47792 () Unit!2423)

(declare-fun Unit!2444 () Unit!2423)

(assert (=> b!32279 (= lt!47792 Unit!2444)))

(assert (=> b!32279 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47816))) (currentByte!2485 (_2!1730 lt!47816)) (currentBit!2480 (_2!1730 lt!47816))) (bvsub (bvsub (bvadd (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47823))) (currentByte!2485 (_2!1730 lt!47823)) (currentBit!2480 (_2!1730 lt!47823))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!47781 () Unit!2423)

(declare-fun Unit!2445 () Unit!2423)

(assert (=> b!32279 (= lt!47781 Unit!2445)))

(declare-fun lt!47807 () tuple2!3288)

(assert (=> b!32279 (= lt!47807 (reader!0 (_2!1730 lt!46927) (_2!1730 lt!47816)))))

(declare-fun lt!47784 () (_ BitVec 64))

(assert (=> b!32279 (= lt!47784 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47822 () Unit!2423)

(assert (=> b!32279 (= lt!47822 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1730 lt!46927) (buf!1124 (_2!1730 lt!47816)) lt!47784))))

(assert (=> b!32279 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!47816)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!47784)))

(declare-fun lt!47824 () Unit!2423)

(assert (=> b!32279 (= lt!47824 lt!47822)))

(declare-fun lt!47789 () tuple2!3288)

(assert (=> b!32279 (= lt!47789 (reader!0 (_2!1730 lt!47823) (_2!1730 lt!47816)))))

(declare-fun lt!47821 () (_ BitVec 64))

(assert (=> b!32279 (= lt!47821 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!47790 () Unit!2423)

(assert (=> b!32279 (= lt!47790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1730 lt!47823) (buf!1124 (_2!1730 lt!47816)) lt!47821))))

(assert (=> b!32279 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!47816)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!47823))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!47823))) lt!47821)))

(declare-fun lt!47811 () Unit!2423)

(assert (=> b!32279 (= lt!47811 lt!47790)))

(declare-fun lt!47793 () List!396)

(assert (=> b!32279 (= lt!47793 (byteArrayBitContentToList!0 (_2!1730 lt!47816) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!47815 () List!396)

(assert (=> b!32279 (= lt!47815 (byteArrayBitContentToList!0 (_2!1730 lt!47816) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!47810 () List!396)

(assert (=> b!32279 (= lt!47810 (bitStreamReadBitsIntoList!0 (_2!1730 lt!47816) (_1!1731 lt!47807) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!47786 () List!396)

(assert (=> b!32279 (= lt!47786 (bitStreamReadBitsIntoList!0 (_2!1730 lt!47816) (_1!1731 lt!47789) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!47812 () (_ BitVec 64))

(assert (=> b!32279 (= lt!47812 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47817 () Unit!2423)

(assert (=> b!32279 (= lt!47817 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1730 lt!47816) (_2!1730 lt!47816) (_1!1731 lt!47807) (_1!1731 lt!47789) lt!47812 lt!47810))))

(assert (=> b!32279 (= (bitStreamReadBitsIntoList!0 (_2!1730 lt!47816) (_1!1731 lt!47789) (bvsub lt!47812 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!113 lt!47810))))

(declare-fun lt!47805 () Unit!2423)

(assert (=> b!32279 (= lt!47805 lt!47817)))

(declare-fun lt!47808 () Unit!2423)

(declare-fun lt!47802 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1811 array!1811 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2423)

(assert (=> b!32279 (= lt!47808 (arrayBitRangesEqImpliesEq!0 (buf!1124 (_2!1730 lt!47823)) (buf!1124 (_2!1730 lt!47816)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!47802 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47823))) (currentByte!2485 (_2!1730 lt!47823)) (currentBit!2480 (_2!1730 lt!47823)))))))

(assert (=> b!32279 (= (bitAt!0 (buf!1124 (_2!1730 lt!47823)) lt!47802) (bitAt!0 (buf!1124 (_2!1730 lt!47816)) lt!47802))))

(declare-fun lt!47796 () Unit!2423)

(assert (=> b!32279 (= lt!47796 lt!47808)))

(declare-fun b!32280 () Bool)

(declare-fun res!27574 () Bool)

(declare-fun e!21343 () Bool)

(assert (=> b!32280 (=> (not res!27574) (not e!21343))))

(declare-fun lt!47797 () tuple2!3286)

(assert (=> b!32280 (= res!27574 (invariant!0 (currentBit!2480 (_2!1730 lt!47797)) (currentByte!2485 (_2!1730 lt!47797)) (size!796 (buf!1124 (_2!1730 lt!47797)))))))

(declare-fun b!32281 () Bool)

(declare-fun res!27575 () Bool)

(assert (=> b!32281 (=> (not res!27575) (not e!21343))))

(assert (=> b!32281 (= res!27575 (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!47797)))))

(declare-fun lt!47803 () tuple2!3288)

(declare-fun b!32282 () Bool)

(assert (=> b!32282 (= e!21343 (= (bitStreamReadBitsIntoList!0 (_2!1730 lt!47797) (_1!1731 lt!47803) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1730 lt!47797) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!32282 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32282 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!47820 () Unit!2423)

(declare-fun lt!47788 () Unit!2423)

(assert (=> b!32282 (= lt!47820 lt!47788)))

(declare-fun lt!47804 () (_ BitVec 64))

(assert (=> b!32282 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!47797)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!47804)))

(assert (=> b!32282 (= lt!47788 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1730 lt!46927) (buf!1124 (_2!1730 lt!47797)) lt!47804))))

(declare-fun e!21344 () Bool)

(assert (=> b!32282 e!21344))

(declare-fun res!27572 () Bool)

(assert (=> b!32282 (=> (not res!27572) (not e!21344))))

(assert (=> b!32282 (= res!27572 (and (= (size!796 (buf!1124 (_2!1730 lt!46927))) (size!796 (buf!1124 (_2!1730 lt!47797)))) (bvsge lt!47804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32282 (= lt!47804 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!32282 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32282 (= lt!47803 (reader!0 (_2!1730 lt!46927) (_2!1730 lt!47797)))))

(declare-fun b!32283 () Bool)

(assert (=> b!32283 (= e!21344 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!47804))))

(declare-fun b!32284 () Bool)

(declare-fun res!27571 () Bool)

(assert (=> b!32284 (=> (not res!27571) (not e!21343))))

(assert (=> b!32284 (= res!27571 (= (size!796 (buf!1124 (_2!1730 lt!46927))) (size!796 (buf!1124 (_2!1730 lt!47797)))))))

(declare-fun b!32285 () Bool)

(declare-fun res!27573 () Bool)

(assert (=> b!32285 (=> (not res!27573) (not e!21343))))

(assert (=> b!32285 (= res!27573 (= (size!796 (buf!1124 (_2!1730 lt!47797))) (size!796 (buf!1124 (_2!1730 lt!46927)))))))

(declare-fun d!9394 () Bool)

(assert (=> d!9394 e!21343))

(declare-fun res!27570 () Bool)

(assert (=> d!9394 (=> (not res!27570) (not e!21343))))

(declare-fun lt!47809 () (_ BitVec 64))

(assert (=> d!9394 (= res!27570 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47797))) (currentByte!2485 (_2!1730 lt!47797)) (currentBit!2480 (_2!1730 lt!47797))) (bvsub lt!47809 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9394 (or (= (bvand lt!47809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47809 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47809 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!47794 () (_ BitVec 64))

(assert (=> d!9394 (= lt!47809 (bvadd lt!47794 to!314))))

(assert (=> d!9394 (or (not (= (bvand lt!47794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!47794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!47794 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9394 (= lt!47794 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))))))

(assert (=> d!9394 (= lt!47797 e!21345)))

(declare-fun c!2213 () Bool)

(assert (=> d!9394 (= c!2213 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!47791 () Unit!2423)

(declare-fun lt!47787 () Unit!2423)

(assert (=> d!9394 (= lt!47791 lt!47787)))

(assert (=> d!9394 (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!46927))))

(assert (=> d!9394 (= lt!47787 (lemmaIsPrefixRefl!0 (_2!1730 lt!46927)))))

(assert (=> d!9394 (= lt!47802 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))))))

(assert (=> d!9394 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9394 (= (appendBitsMSBFirstLoop!0 (_2!1730 lt!46927) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!47797)))

(declare-fun bm!412 () Bool)

(assert (=> bm!412 (= call!415 (reader!0 (_2!1730 lt!46927) (ite c!2213 (_2!1730 lt!47823) (_2!1730 lt!46927))))))

(declare-fun b!32286 () Bool)

(declare-fun Unit!2446 () Unit!2423)

(assert (=> b!32286 (= e!21345 (tuple2!3287 Unit!2446 (_2!1730 lt!46927)))))

(assert (=> b!32286 (= (size!796 (buf!1124 (_2!1730 lt!46927))) (size!796 (buf!1124 (_2!1730 lt!46927))))))

(declare-fun lt!47819 () Unit!2423)

(declare-fun Unit!2447 () Unit!2423)

(assert (=> b!32286 (= lt!47819 Unit!2447)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1390 array!1811 array!1811 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3310 0))(
  ( (tuple2!3311 (_1!1742 array!1811) (_2!1742 BitStream!1390)) )
))
(declare-fun readBits!0 (BitStream!1390 (_ BitVec 64)) tuple2!3310)

(assert (=> b!32286 (checkByteArrayBitContent!0 (_2!1730 lt!46927) srcBuffer!2 (_1!1742 (readBits!0 (_1!1731 call!415) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!9394 c!2213) b!32279))

(assert (= (and d!9394 (not c!2213)) b!32286))

(assert (= (or b!32279 b!32286) bm!412))

(assert (= (and d!9394 res!27570) b!32280))

(assert (= (and b!32280 res!27574) b!32284))

(assert (= (and b!32284 res!27571) b!32281))

(assert (= (and b!32281 res!27575) b!32285))

(assert (= (and b!32285 res!27573) b!32282))

(assert (= (and b!32282 res!27572) b!32283))

(declare-fun m!47693 () Bool)

(assert (=> b!32286 m!47693))

(declare-fun m!47695 () Bool)

(assert (=> b!32286 m!47695))

(assert (=> b!32279 m!46943))

(declare-fun m!47697 () Bool)

(assert (=> b!32279 m!47697))

(declare-fun m!47699 () Bool)

(assert (=> b!32279 m!47699))

(declare-fun m!47701 () Bool)

(assert (=> b!32279 m!47701))

(declare-fun m!47703 () Bool)

(assert (=> b!32279 m!47703))

(declare-fun m!47705 () Bool)

(assert (=> b!32279 m!47705))

(declare-fun m!47707 () Bool)

(assert (=> b!32279 m!47707))

(declare-fun m!47709 () Bool)

(assert (=> b!32279 m!47709))

(declare-fun m!47711 () Bool)

(assert (=> b!32279 m!47711))

(declare-fun m!47713 () Bool)

(assert (=> b!32279 m!47713))

(assert (=> b!32279 m!47697))

(declare-fun m!47715 () Bool)

(assert (=> b!32279 m!47715))

(declare-fun m!47717 () Bool)

(assert (=> b!32279 m!47717))

(declare-fun m!47719 () Bool)

(assert (=> b!32279 m!47719))

(declare-fun m!47721 () Bool)

(assert (=> b!32279 m!47721))

(declare-fun m!47723 () Bool)

(assert (=> b!32279 m!47723))

(declare-fun m!47725 () Bool)

(assert (=> b!32279 m!47725))

(declare-fun m!47727 () Bool)

(assert (=> b!32279 m!47727))

(declare-fun m!47729 () Bool)

(assert (=> b!32279 m!47729))

(declare-fun m!47731 () Bool)

(assert (=> b!32279 m!47731))

(assert (=> b!32279 m!47717))

(declare-fun m!47733 () Bool)

(assert (=> b!32279 m!47733))

(declare-fun m!47735 () Bool)

(assert (=> b!32279 m!47735))

(declare-fun m!47737 () Bool)

(assert (=> b!32279 m!47737))

(declare-fun m!47739 () Bool)

(assert (=> b!32279 m!47739))

(declare-fun m!47741 () Bool)

(assert (=> b!32279 m!47741))

(assert (=> b!32279 m!47731))

(declare-fun m!47743 () Bool)

(assert (=> b!32279 m!47743))

(declare-fun m!47745 () Bool)

(assert (=> b!32279 m!47745))

(declare-fun m!47747 () Bool)

(assert (=> b!32279 m!47747))

(declare-fun m!47749 () Bool)

(assert (=> b!32279 m!47749))

(assert (=> b!32279 m!47741))

(declare-fun m!47751 () Bool)

(assert (=> b!32279 m!47751))

(declare-fun m!47753 () Bool)

(assert (=> b!32279 m!47753))

(declare-fun m!47755 () Bool)

(assert (=> b!32279 m!47755))

(declare-fun m!47757 () Bool)

(assert (=> b!32279 m!47757))

(declare-fun m!47759 () Bool)

(assert (=> b!32282 m!47759))

(declare-fun m!47761 () Bool)

(assert (=> b!32282 m!47761))

(declare-fun m!47763 () Bool)

(assert (=> b!32282 m!47763))

(declare-fun m!47765 () Bool)

(assert (=> b!32282 m!47765))

(declare-fun m!47767 () Bool)

(assert (=> b!32282 m!47767))

(declare-fun m!47769 () Bool)

(assert (=> b!32283 m!47769))

(declare-fun m!47771 () Bool)

(assert (=> bm!412 m!47771))

(declare-fun m!47773 () Bool)

(assert (=> b!32281 m!47773))

(declare-fun m!47775 () Bool)

(assert (=> b!32280 m!47775))

(declare-fun m!47777 () Bool)

(assert (=> d!9394 m!47777))

(assert (=> d!9394 m!46943))

(assert (=> d!9394 m!47359))

(assert (=> d!9394 m!47369))

(assert (=> b!31848 d!9394))

(declare-fun d!9504 () Bool)

(assert (=> d!9504 (isPrefixOf!0 thiss!1379 (_2!1730 lt!46917))))

(declare-fun lt!47827 () Unit!2423)

(declare-fun choose!30 (BitStream!1390 BitStream!1390 BitStream!1390) Unit!2423)

(assert (=> d!9504 (= lt!47827 (choose!30 thiss!1379 (_2!1730 lt!46927) (_2!1730 lt!46917)))))

(assert (=> d!9504 (isPrefixOf!0 thiss!1379 (_2!1730 lt!46927))))

(assert (=> d!9504 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1730 lt!46927) (_2!1730 lt!46917)) lt!47827)))

(declare-fun bs!2596 () Bool)

(assert (= bs!2596 d!9504))

(assert (=> bs!2596 m!46973))

(declare-fun m!47779 () Bool)

(assert (=> bs!2596 m!47779))

(assert (=> bs!2596 m!46931))

(assert (=> b!31848 d!9504))

(declare-fun d!9506 () Bool)

(declare-fun res!27584 () Bool)

(declare-fun e!21351 () Bool)

(assert (=> d!9506 (=> (not res!27584) (not e!21351))))

(assert (=> d!9506 (= res!27584 (= (size!796 (buf!1124 thiss!1379)) (size!796 (buf!1124 (_2!1730 lt!46917)))))))

(assert (=> d!9506 (= (isPrefixOf!0 thiss!1379 (_2!1730 lt!46917)) e!21351)))

(declare-fun b!32293 () Bool)

(declare-fun res!27583 () Bool)

(assert (=> b!32293 (=> (not res!27583) (not e!21351))))

(assert (=> b!32293 (= res!27583 (bvsle (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)) (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46917))) (currentByte!2485 (_2!1730 lt!46917)) (currentBit!2480 (_2!1730 lt!46917)))))))

(declare-fun b!32294 () Bool)

(declare-fun e!21350 () Bool)

(assert (=> b!32294 (= e!21351 e!21350)))

(declare-fun res!27582 () Bool)

(assert (=> b!32294 (=> res!27582 e!21350)))

(assert (=> b!32294 (= res!27582 (= (size!796 (buf!1124 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32295 () Bool)

(assert (=> b!32295 (= e!21350 (arrayBitRangesEq!0 (buf!1124 thiss!1379) (buf!1124 (_2!1730 lt!46917)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379))))))

(assert (= (and d!9506 res!27584) b!32293))

(assert (= (and b!32293 res!27583) b!32294))

(assert (= (and b!32294 (not res!27582)) b!32295))

(assert (=> b!32293 m!46917))

(assert (=> b!32293 m!46947))

(assert (=> b!32295 m!46917))

(assert (=> b!32295 m!46917))

(declare-fun m!47781 () Bool)

(assert (=> b!32295 m!47781))

(assert (=> b!31848 d!9506))

(declare-fun d!9508 () Bool)

(declare-fun res!27587 () Bool)

(declare-fun e!21353 () Bool)

(assert (=> d!9508 (=> (not res!27587) (not e!21353))))

(assert (=> d!9508 (= res!27587 (= (size!796 (buf!1124 (_2!1730 lt!46927))) (size!796 (buf!1124 (_2!1730 lt!46917)))))))

(assert (=> d!9508 (= (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!46917)) e!21353)))

(declare-fun b!32296 () Bool)

(declare-fun res!27586 () Bool)

(assert (=> b!32296 (=> (not res!27586) (not e!21353))))

(assert (=> b!32296 (= res!27586 (bvsle (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))) (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46917))) (currentByte!2485 (_2!1730 lt!46917)) (currentBit!2480 (_2!1730 lt!46917)))))))

(declare-fun b!32297 () Bool)

(declare-fun e!21352 () Bool)

(assert (=> b!32297 (= e!21353 e!21352)))

(declare-fun res!27585 () Bool)

(assert (=> b!32297 (=> res!27585 e!21352)))

(assert (=> b!32297 (= res!27585 (= (size!796 (buf!1124 (_2!1730 lt!46927))) #b00000000000000000000000000000000))))

(declare-fun b!32298 () Bool)

(assert (=> b!32298 (= e!21352 (arrayBitRangesEq!0 (buf!1124 (_2!1730 lt!46927)) (buf!1124 (_2!1730 lt!46917)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927)))))))

(assert (= (and d!9508 res!27587) b!32296))

(assert (= (and b!32296 res!27586) b!32297))

(assert (= (and b!32297 (not res!27585)) b!32298))

(assert (=> b!32296 m!46943))

(assert (=> b!32296 m!46947))

(assert (=> b!32298 m!46943))

(assert (=> b!32298 m!46943))

(declare-fun m!47783 () Bool)

(assert (=> b!32298 m!47783))

(assert (=> b!31848 d!9508))

(declare-fun d!9510 () Bool)

(assert (=> d!9510 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47828 () Unit!2423)

(assert (=> d!9510 (= lt!47828 (choose!9 thiss!1379 (buf!1124 (_2!1730 lt!46927)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1391 (buf!1124 (_2!1730 lt!46927)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379))))))

(assert (=> d!9510 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1124 (_2!1730 lt!46927)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47828)))

(declare-fun bs!2597 () Bool)

(assert (= bs!2597 d!9510))

(assert (=> bs!2597 m!46977))

(declare-fun m!47785 () Bool)

(assert (=> bs!2597 m!47785))

(assert (=> b!31848 d!9510))

(declare-fun d!9512 () Bool)

(assert (=> d!9512 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2598 () Bool)

(assert (= bs!2598 d!9512))

(declare-fun m!47787 () Bool)

(assert (=> bs!2598 m!47787))

(assert (=> b!31848 d!9512))

(declare-fun b!32299 () Bool)

(declare-fun res!27590 () Bool)

(declare-fun e!21355 () Bool)

(assert (=> b!32299 (=> (not res!27590) (not e!21355))))

(declare-fun lt!47846 () tuple2!3288)

(assert (=> b!32299 (= res!27590 (isPrefixOf!0 (_1!1731 lt!47846) thiss!1379))))

(declare-fun b!32300 () Bool)

(declare-fun e!21354 () Unit!2423)

(declare-fun Unit!2448 () Unit!2423)

(assert (=> b!32300 (= e!21354 Unit!2448)))

(declare-fun b!32301 () Bool)

(declare-fun res!27588 () Bool)

(assert (=> b!32301 (=> (not res!27588) (not e!21355))))

(assert (=> b!32301 (= res!27588 (isPrefixOf!0 (_2!1731 lt!47846) (_2!1730 lt!46927)))))

(declare-fun lt!47831 () (_ BitVec 64))

(declare-fun b!32302 () Bool)

(declare-fun lt!47836 () (_ BitVec 64))

(assert (=> b!32302 (= e!21355 (= (_1!1731 lt!47846) (withMovedBitIndex!0 (_2!1731 lt!47846) (bvsub lt!47831 lt!47836))))))

(assert (=> b!32302 (or (= (bvand lt!47831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47836 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47831 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47831 lt!47836) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32302 (= lt!47836 (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927))))))

(assert (=> b!32302 (= lt!47831 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(declare-fun d!9514 () Bool)

(assert (=> d!9514 e!21355))

(declare-fun res!27589 () Bool)

(assert (=> d!9514 (=> (not res!27589) (not e!21355))))

(assert (=> d!9514 (= res!27589 (isPrefixOf!0 (_1!1731 lt!47846) (_2!1731 lt!47846)))))

(declare-fun lt!47844 () BitStream!1390)

(assert (=> d!9514 (= lt!47846 (tuple2!3289 lt!47844 (_2!1730 lt!46927)))))

(declare-fun lt!47843 () Unit!2423)

(declare-fun lt!47845 () Unit!2423)

(assert (=> d!9514 (= lt!47843 lt!47845)))

(assert (=> d!9514 (isPrefixOf!0 lt!47844 (_2!1730 lt!46927))))

(assert (=> d!9514 (= lt!47845 (lemmaIsPrefixTransitive!0 lt!47844 (_2!1730 lt!46927) (_2!1730 lt!46927)))))

(declare-fun lt!47840 () Unit!2423)

(declare-fun lt!47847 () Unit!2423)

(assert (=> d!9514 (= lt!47840 lt!47847)))

(assert (=> d!9514 (isPrefixOf!0 lt!47844 (_2!1730 lt!46927))))

(assert (=> d!9514 (= lt!47847 (lemmaIsPrefixTransitive!0 lt!47844 thiss!1379 (_2!1730 lt!46927)))))

(declare-fun lt!47829 () Unit!2423)

(assert (=> d!9514 (= lt!47829 e!21354)))

(declare-fun c!2214 () Bool)

(assert (=> d!9514 (= c!2214 (not (= (size!796 (buf!1124 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!47832 () Unit!2423)

(declare-fun lt!47842 () Unit!2423)

(assert (=> d!9514 (= lt!47832 lt!47842)))

(assert (=> d!9514 (isPrefixOf!0 (_2!1730 lt!46927) (_2!1730 lt!46927))))

(assert (=> d!9514 (= lt!47842 (lemmaIsPrefixRefl!0 (_2!1730 lt!46927)))))

(declare-fun lt!47830 () Unit!2423)

(declare-fun lt!47848 () Unit!2423)

(assert (=> d!9514 (= lt!47830 lt!47848)))

(assert (=> d!9514 (= lt!47848 (lemmaIsPrefixRefl!0 (_2!1730 lt!46927)))))

(declare-fun lt!47834 () Unit!2423)

(declare-fun lt!47838 () Unit!2423)

(assert (=> d!9514 (= lt!47834 lt!47838)))

(assert (=> d!9514 (isPrefixOf!0 lt!47844 lt!47844)))

(assert (=> d!9514 (= lt!47838 (lemmaIsPrefixRefl!0 lt!47844))))

(declare-fun lt!47841 () Unit!2423)

(declare-fun lt!47833 () Unit!2423)

(assert (=> d!9514 (= lt!47841 lt!47833)))

(assert (=> d!9514 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9514 (= lt!47833 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9514 (= lt!47844 (BitStream!1391 (buf!1124 (_2!1730 lt!46927)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(assert (=> d!9514 (isPrefixOf!0 thiss!1379 (_2!1730 lt!46927))))

(assert (=> d!9514 (= (reader!0 thiss!1379 (_2!1730 lt!46927)) lt!47846)))

(declare-fun b!32303 () Bool)

(declare-fun lt!47835 () Unit!2423)

(assert (=> b!32303 (= e!21354 lt!47835)))

(declare-fun lt!47839 () (_ BitVec 64))

(assert (=> b!32303 (= lt!47839 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47837 () (_ BitVec 64))

(assert (=> b!32303 (= lt!47837 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(assert (=> b!32303 (= lt!47835 (arrayBitRangesEqSymmetric!0 (buf!1124 thiss!1379) (buf!1124 (_2!1730 lt!46927)) lt!47839 lt!47837))))

(assert (=> b!32303 (arrayBitRangesEq!0 (buf!1124 (_2!1730 lt!46927)) (buf!1124 thiss!1379) lt!47839 lt!47837)))

(assert (= (and d!9514 c!2214) b!32303))

(assert (= (and d!9514 (not c!2214)) b!32300))

(assert (= (and d!9514 res!27589) b!32299))

(assert (= (and b!32299 res!27590) b!32301))

(assert (= (and b!32301 res!27588) b!32302))

(declare-fun m!47789 () Bool)

(assert (=> b!32302 m!47789))

(assert (=> b!32302 m!46943))

(assert (=> b!32302 m!46917))

(declare-fun m!47791 () Bool)

(assert (=> b!32299 m!47791))

(assert (=> b!32303 m!46917))

(declare-fun m!47793 () Bool)

(assert (=> b!32303 m!47793))

(declare-fun m!47795 () Bool)

(assert (=> b!32303 m!47795))

(declare-fun m!47797 () Bool)

(assert (=> b!32301 m!47797))

(assert (=> d!9514 m!46931))

(assert (=> d!9514 m!47359))

(declare-fun m!47799 () Bool)

(assert (=> d!9514 m!47799))

(declare-fun m!47801 () Bool)

(assert (=> d!9514 m!47801))

(declare-fun m!47803 () Bool)

(assert (=> d!9514 m!47803))

(assert (=> d!9514 m!46913))

(declare-fun m!47805 () Bool)

(assert (=> d!9514 m!47805))

(declare-fun m!47807 () Bool)

(assert (=> d!9514 m!47807))

(assert (=> d!9514 m!47369))

(declare-fun m!47809 () Bool)

(assert (=> d!9514 m!47809))

(assert (=> d!9514 m!46915))

(assert (=> b!31848 d!9514))

(declare-fun d!9516 () Bool)

(assert (=> d!9516 (= (tail!113 lt!46932) (t!1146 lt!46932))))

(assert (=> b!31837 d!9516))

(declare-fun d!9518 () Bool)

(declare-fun e!21358 () Bool)

(assert (=> d!9518 e!21358))

(declare-fun res!27593 () Bool)

(assert (=> d!9518 (=> (not res!27593) (not e!21358))))

(declare-fun lt!47854 () (_ BitVec 64))

(assert (=> d!9518 (= res!27593 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!47854) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9518 (= lt!47854 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47853 () Unit!2423)

(declare-fun choose!42 (BitStream!1390 BitStream!1390 BitStream!1390 BitStream!1390 (_ BitVec 64) List!396) Unit!2423)

(assert (=> d!9518 (= lt!47853 (choose!42 (_2!1730 lt!46917) (_2!1730 lt!46917) (_1!1731 lt!46919) (_1!1731 lt!46933) (bvsub to!314 i!635) lt!46932))))

(assert (=> d!9518 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9518 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1730 lt!46917) (_2!1730 lt!46917) (_1!1731 lt!46919) (_1!1731 lt!46933) (bvsub to!314 i!635) lt!46932) lt!47853)))

(declare-fun b!32306 () Bool)

(assert (=> b!32306 (= e!21358 (= (bitStreamReadBitsIntoList!0 (_2!1730 lt!46917) (_1!1731 lt!46933) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!113 lt!46932)))))

(assert (= (and d!9518 res!27593) b!32306))

(declare-fun m!47811 () Bool)

(assert (=> d!9518 m!47811))

(declare-fun m!47813 () Bool)

(assert (=> b!32306 m!47813))

(assert (=> b!32306 m!46969))

(assert (=> b!31837 d!9518))

(declare-fun d!9520 () Bool)

(declare-fun res!27596 () Bool)

(declare-fun e!21360 () Bool)

(assert (=> d!9520 (=> (not res!27596) (not e!21360))))

(assert (=> d!9520 (= res!27596 (= (size!796 (buf!1124 thiss!1379)) (size!796 (buf!1124 thiss!1379))))))

(assert (=> d!9520 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!21360)))

(declare-fun b!32307 () Bool)

(declare-fun res!27595 () Bool)

(assert (=> b!32307 (=> (not res!27595) (not e!21360))))

(assert (=> b!32307 (= res!27595 (bvsle (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)) (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379))))))

(declare-fun b!32308 () Bool)

(declare-fun e!21359 () Bool)

(assert (=> b!32308 (= e!21360 e!21359)))

(declare-fun res!27594 () Bool)

(assert (=> b!32308 (=> res!27594 e!21359)))

(assert (=> b!32308 (= res!27594 (= (size!796 (buf!1124 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32309 () Bool)

(assert (=> b!32309 (= e!21359 (arrayBitRangesEq!0 (buf!1124 thiss!1379) (buf!1124 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379))))))

(assert (= (and d!9520 res!27596) b!32307))

(assert (= (and b!32307 res!27595) b!32308))

(assert (= (and b!32308 (not res!27594)) b!32309))

(assert (=> b!32307 m!46917))

(assert (=> b!32307 m!46917))

(assert (=> b!32309 m!46917))

(assert (=> b!32309 m!46917))

(declare-fun m!47815 () Bool)

(assert (=> b!32309 m!47815))

(assert (=> b!31838 d!9520))

(declare-fun d!9522 () Bool)

(assert (=> d!9522 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!47857 () Unit!2423)

(declare-fun choose!11 (BitStream!1390) Unit!2423)

(assert (=> d!9522 (= lt!47857 (choose!11 thiss!1379))))

(assert (=> d!9522 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!47857)))

(declare-fun bs!2600 () Bool)

(assert (= bs!2600 d!9522))

(assert (=> bs!2600 m!46913))

(declare-fun m!47817 () Bool)

(assert (=> bs!2600 m!47817))

(assert (=> b!31838 d!9522))

(declare-fun d!9524 () Bool)

(declare-fun e!21361 () Bool)

(assert (=> d!9524 e!21361))

(declare-fun res!27597 () Bool)

(assert (=> d!9524 (=> (not res!27597) (not e!21361))))

(declare-fun lt!47859 () (_ BitVec 64))

(declare-fun lt!47862 () (_ BitVec 64))

(declare-fun lt!47858 () (_ BitVec 64))

(assert (=> d!9524 (= res!27597 (= lt!47859 (bvsub lt!47858 lt!47862)))))

(assert (=> d!9524 (or (= (bvand lt!47858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47858 lt!47862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9524 (= lt!47862 (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 thiss!1379))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379))))))

(declare-fun lt!47860 () (_ BitVec 64))

(declare-fun lt!47861 () (_ BitVec 64))

(assert (=> d!9524 (= lt!47858 (bvmul lt!47860 lt!47861))))

(assert (=> d!9524 (or (= lt!47860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47861 (bvsdiv (bvmul lt!47860 lt!47861) lt!47860)))))

(assert (=> d!9524 (= lt!47861 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9524 (= lt!47860 ((_ sign_extend 32) (size!796 (buf!1124 thiss!1379))))))

(assert (=> d!9524 (= lt!47859 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2485 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2480 thiss!1379))))))

(assert (=> d!9524 (invariant!0 (currentBit!2480 thiss!1379) (currentByte!2485 thiss!1379) (size!796 (buf!1124 thiss!1379)))))

(assert (=> d!9524 (= (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)) lt!47859)))

(declare-fun b!32310 () Bool)

(declare-fun res!27598 () Bool)

(assert (=> b!32310 (=> (not res!27598) (not e!21361))))

(assert (=> b!32310 (= res!27598 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47859))))

(declare-fun b!32311 () Bool)

(declare-fun lt!47863 () (_ BitVec 64))

(assert (=> b!32311 (= e!21361 (bvsle lt!47859 (bvmul lt!47863 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32311 (or (= lt!47863 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47863 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47863)))))

(assert (=> b!32311 (= lt!47863 ((_ sign_extend 32) (size!796 (buf!1124 thiss!1379))))))

(assert (= (and d!9524 res!27597) b!32310))

(assert (= (and b!32310 res!27598) b!32311))

(declare-fun m!47819 () Bool)

(assert (=> d!9524 m!47819))

(declare-fun m!47821 () Bool)

(assert (=> d!9524 m!47821))

(assert (=> b!31838 d!9524))

(declare-fun d!9526 () Bool)

(assert (=> d!9526 (= (array_inv!748 srcBuffer!2) (bvsge (size!796 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6758 d!9526))

(declare-fun d!9528 () Bool)

(assert (=> d!9528 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2480 thiss!1379) (currentByte!2485 thiss!1379) (size!796 (buf!1124 thiss!1379))))))

(declare-fun bs!2601 () Bool)

(assert (= bs!2601 d!9528))

(assert (=> bs!2601 m!47821))

(assert (=> start!6758 d!9528))

(declare-fun d!9530 () Bool)

(assert (=> d!9530 (= (bitAt!0 (buf!1124 (_1!1731 lt!46933)) lt!46916) (not (= (bvand ((_ sign_extend 24) (select (arr!1268 (buf!1124 (_1!1731 lt!46933))) ((_ extract 31 0) (bvsdiv lt!46916 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!46916 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2602 () Bool)

(assert (= bs!2602 d!9530))

(declare-fun m!47823 () Bool)

(assert (=> bs!2602 m!47823))

(declare-fun m!47825 () Bool)

(assert (=> bs!2602 m!47825))

(assert (=> b!31849 d!9530))

(declare-fun d!9532 () Bool)

(assert (=> d!9532 (= (bitAt!0 (buf!1124 (_1!1731 lt!46919)) lt!46916) (not (= (bvand ((_ sign_extend 24) (select (arr!1268 (buf!1124 (_1!1731 lt!46919))) ((_ extract 31 0) (bvsdiv lt!46916 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!46916 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2603 () Bool)

(assert (= bs!2603 d!9532))

(declare-fun m!47827 () Bool)

(assert (=> bs!2603 m!47827))

(assert (=> bs!2603 m!47825))

(assert (=> b!31849 d!9532))

(declare-fun d!9534 () Bool)

(declare-fun res!27601 () Bool)

(declare-fun e!21363 () Bool)

(assert (=> d!9534 (=> (not res!27601) (not e!21363))))

(assert (=> d!9534 (= res!27601 (= (size!796 (buf!1124 thiss!1379)) (size!796 (buf!1124 (_2!1730 lt!46927)))))))

(assert (=> d!9534 (= (isPrefixOf!0 thiss!1379 (_2!1730 lt!46927)) e!21363)))

(declare-fun b!32312 () Bool)

(declare-fun res!27600 () Bool)

(assert (=> b!32312 (=> (not res!27600) (not e!21363))))

(assert (=> b!32312 (= res!27600 (bvsle (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)) (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46927))) (currentByte!2485 (_2!1730 lt!46927)) (currentBit!2480 (_2!1730 lt!46927)))))))

(declare-fun b!32313 () Bool)

(declare-fun e!21362 () Bool)

(assert (=> b!32313 (= e!21363 e!21362)))

(declare-fun res!27599 () Bool)

(assert (=> b!32313 (=> res!27599 e!21362)))

(assert (=> b!32313 (= res!27599 (= (size!796 (buf!1124 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32314 () Bool)

(assert (=> b!32314 (= e!21362 (arrayBitRangesEq!0 (buf!1124 thiss!1379) (buf!1124 (_2!1730 lt!46927)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379))))))

(assert (= (and d!9534 res!27601) b!32312))

(assert (= (and b!32312 res!27600) b!32313))

(assert (= (and b!32313 (not res!27599)) b!32314))

(assert (=> b!32312 m!46917))

(assert (=> b!32312 m!46943))

(assert (=> b!32314 m!46917))

(assert (=> b!32314 m!46917))

(declare-fun m!47829 () Bool)

(assert (=> b!32314 m!47829))

(assert (=> b!31834 d!9534))

(declare-fun d!9536 () Bool)

(assert (=> d!9536 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) lt!46926) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927)))) lt!46926))))

(declare-fun bs!2604 () Bool)

(assert (= bs!2604 d!9536))

(assert (=> bs!2604 m!47293))

(assert (=> b!31834 d!9536))

(declare-fun d!9538 () Bool)

(declare-fun e!21366 () Bool)

(assert (=> d!9538 e!21366))

(declare-fun res!27604 () Bool)

(assert (=> d!9538 (=> (not res!27604) (not e!21366))))

(assert (=> d!9538 (= res!27604 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!47866 () Unit!2423)

(declare-fun choose!27 (BitStream!1390 BitStream!1390 (_ BitVec 64) (_ BitVec 64)) Unit!2423)

(assert (=> d!9538 (= lt!47866 (choose!27 thiss!1379 (_2!1730 lt!46927) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9538 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1730 lt!46927) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47866)))

(declare-fun b!32317 () Bool)

(assert (=> b!32317 (= e!21366 (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46927)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46927))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46927))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9538 res!27604) b!32317))

(declare-fun m!47831 () Bool)

(assert (=> d!9538 m!47831))

(declare-fun m!47833 () Bool)

(assert (=> b!32317 m!47833))

(assert (=> b!31834 d!9538))

(declare-fun d!9540 () Bool)

(declare-fun e!21375 () Bool)

(assert (=> d!9540 e!21375))

(declare-fun res!27626 () Bool)

(assert (=> d!9540 (=> (not res!27626) (not e!21375))))

(declare-fun lt!47891 () tuple2!3286)

(assert (=> d!9540 (= res!27626 (= (size!796 (buf!1124 (_2!1730 lt!47891))) (size!796 (buf!1124 thiss!1379))))))

(declare-fun lt!47895 () (_ BitVec 8))

(declare-fun lt!47902 () array!1811)

(assert (=> d!9540 (= lt!47895 (select (arr!1268 lt!47902) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9540 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!796 lt!47902)))))

(assert (=> d!9540 (= lt!47902 (array!1812 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!47898 () tuple2!3286)

(assert (=> d!9540 (= lt!47891 (tuple2!3287 (_1!1730 lt!47898) (_2!1730 lt!47898)))))

(declare-fun lt!47892 () tuple2!3286)

(assert (=> d!9540 (= lt!47898 lt!47892)))

(declare-fun e!21376 () Bool)

(assert (=> d!9540 e!21376))

(declare-fun res!27625 () Bool)

(assert (=> d!9540 (=> (not res!27625) (not e!21376))))

(assert (=> d!9540 (= res!27625 (= (size!796 (buf!1124 thiss!1379)) (size!796 (buf!1124 (_2!1730 lt!47892)))))))

(declare-fun lt!47893 () Bool)

(declare-fun appendBit!0 (BitStream!1390 Bool) tuple2!3286)

(assert (=> d!9540 (= lt!47892 (appendBit!0 thiss!1379 lt!47893))))

(assert (=> d!9540 (= lt!47893 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9540 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9540 (= (appendBitFromByte!0 thiss!1379 (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!47891)))

(declare-fun b!32335 () Bool)

(declare-fun res!27623 () Bool)

(assert (=> b!32335 (=> (not res!27623) (not e!21376))))

(assert (=> b!32335 (= res!27623 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47892))) (currentByte!2485 (_2!1730 lt!47892)) (currentBit!2480 (_2!1730 lt!47892))) (bvadd (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32336 () Bool)

(declare-fun res!27628 () Bool)

(assert (=> b!32336 (=> (not res!27628) (not e!21375))))

(assert (=> b!32336 (= res!27628 (isPrefixOf!0 thiss!1379 (_2!1730 lt!47891)))))

(declare-fun b!32337 () Bool)

(declare-fun e!21378 () Bool)

(declare-datatypes ((tuple2!3312 0))(
  ( (tuple2!3313 (_1!1743 BitStream!1390) (_2!1743 Bool)) )
))
(declare-fun lt!47900 () tuple2!3312)

(assert (=> b!32337 (= e!21378 (= (bitIndex!0 (size!796 (buf!1124 (_1!1743 lt!47900))) (currentByte!2485 (_1!1743 lt!47900)) (currentBit!2480 (_1!1743 lt!47900))) (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47891))) (currentByte!2485 (_2!1730 lt!47891)) (currentBit!2480 (_2!1730 lt!47891)))))))

(declare-fun b!32338 () Bool)

(declare-fun res!27621 () Bool)

(assert (=> b!32338 (=> (not res!27621) (not e!21376))))

(assert (=> b!32338 (= res!27621 (isPrefixOf!0 thiss!1379 (_2!1730 lt!47892)))))

(declare-fun b!32339 () Bool)

(declare-fun res!27624 () Bool)

(assert (=> b!32339 (=> (not res!27624) (not e!21375))))

(declare-fun lt!47894 () (_ BitVec 64))

(declare-fun lt!47901 () (_ BitVec 64))

(assert (=> b!32339 (= res!27624 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47891))) (currentByte!2485 (_2!1730 lt!47891)) (currentBit!2480 (_2!1730 lt!47891))) (bvadd lt!47901 lt!47894)))))

(assert (=> b!32339 (or (not (= (bvand lt!47901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47894 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!47901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!47901 lt!47894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32339 (= lt!47894 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!32339 (= lt!47901 (bitIndex!0 (size!796 (buf!1124 thiss!1379)) (currentByte!2485 thiss!1379) (currentBit!2480 thiss!1379)))))

(declare-fun b!32340 () Bool)

(assert (=> b!32340 (= e!21375 e!21378)))

(declare-fun res!27627 () Bool)

(assert (=> b!32340 (=> (not res!27627) (not e!21378))))

(assert (=> b!32340 (= res!27627 (and (= (_2!1743 lt!47900) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!47895)) #b00000000000000000000000000000000))) (= (_1!1743 lt!47900) (_2!1730 lt!47891))))))

(declare-fun lt!47897 () tuple2!3310)

(declare-fun lt!47896 () BitStream!1390)

(assert (=> b!32340 (= lt!47897 (readBits!0 lt!47896 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1390) tuple2!3312)

(assert (=> b!32340 (= lt!47900 (readBitPure!0 lt!47896))))

(declare-fun readerFrom!0 (BitStream!1390 (_ BitVec 32) (_ BitVec 32)) BitStream!1390)

(assert (=> b!32340 (= lt!47896 (readerFrom!0 (_2!1730 lt!47891) (currentBit!2480 thiss!1379) (currentByte!2485 thiss!1379)))))

(declare-fun b!32341 () Bool)

(declare-fun e!21377 () Bool)

(assert (=> b!32341 (= e!21376 e!21377)))

(declare-fun res!27622 () Bool)

(assert (=> b!32341 (=> (not res!27622) (not e!21377))))

(declare-fun lt!47899 () tuple2!3312)

(assert (=> b!32341 (= res!27622 (and (= (_2!1743 lt!47899) lt!47893) (= (_1!1743 lt!47899) (_2!1730 lt!47892))))))

(assert (=> b!32341 (= lt!47899 (readBitPure!0 (readerFrom!0 (_2!1730 lt!47892) (currentBit!2480 thiss!1379) (currentByte!2485 thiss!1379))))))

(declare-fun b!32342 () Bool)

(assert (=> b!32342 (= e!21377 (= (bitIndex!0 (size!796 (buf!1124 (_1!1743 lt!47899))) (currentByte!2485 (_1!1743 lt!47899)) (currentBit!2480 (_1!1743 lt!47899))) (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!47892))) (currentByte!2485 (_2!1730 lt!47892)) (currentBit!2480 (_2!1730 lt!47892)))))))

(assert (= (and d!9540 res!27625) b!32335))

(assert (= (and b!32335 res!27623) b!32338))

(assert (= (and b!32338 res!27621) b!32341))

(assert (= (and b!32341 res!27622) b!32342))

(assert (= (and d!9540 res!27626) b!32339))

(assert (= (and b!32339 res!27624) b!32336))

(assert (= (and b!32336 res!27628) b!32340))

(assert (= (and b!32340 res!27627) b!32337))

(declare-fun m!47835 () Bool)

(assert (=> b!32336 m!47835))

(declare-fun m!47837 () Bool)

(assert (=> d!9540 m!47837))

(declare-fun m!47839 () Bool)

(assert (=> d!9540 m!47839))

(declare-fun m!47841 () Bool)

(assert (=> d!9540 m!47841))

(declare-fun m!47843 () Bool)

(assert (=> b!32335 m!47843))

(assert (=> b!32335 m!46917))

(declare-fun m!47845 () Bool)

(assert (=> b!32341 m!47845))

(assert (=> b!32341 m!47845))

(declare-fun m!47847 () Bool)

(assert (=> b!32341 m!47847))

(declare-fun m!47849 () Bool)

(assert (=> b!32338 m!47849))

(declare-fun m!47851 () Bool)

(assert (=> b!32337 m!47851))

(declare-fun m!47853 () Bool)

(assert (=> b!32337 m!47853))

(assert (=> b!32339 m!47853))

(assert (=> b!32339 m!46917))

(declare-fun m!47855 () Bool)

(assert (=> b!32342 m!47855))

(assert (=> b!32342 m!47843))

(declare-fun m!47857 () Bool)

(assert (=> b!32340 m!47857))

(declare-fun m!47859 () Bool)

(assert (=> b!32340 m!47859))

(declare-fun m!47861 () Bool)

(assert (=> b!32340 m!47861))

(assert (=> b!31834 d!9540))

(declare-fun d!9542 () Bool)

(assert (=> d!9542 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!796 (buf!1124 thiss!1379))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 thiss!1379))) ((_ sign_extend 32) (currentByte!2485 thiss!1379)) ((_ sign_extend 32) (currentBit!2480 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2605 () Bool)

(assert (= bs!2605 d!9542))

(assert (=> bs!2605 m!47819))

(assert (=> b!31845 d!9542))

(declare-fun d!9544 () Bool)

(assert (=> d!9544 (= (head!233 (byteArrayBitContentToList!0 (_2!1730 lt!46917) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!511 (byteArrayBitContentToList!0 (_2!1730 lt!46917) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!31846 d!9544))

(declare-fun d!9546 () Bool)

(declare-fun c!2217 () Bool)

(assert (=> d!9546 (= c!2217 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21381 () List!396)

(assert (=> d!9546 (= (byteArrayBitContentToList!0 (_2!1730 lt!46917) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!21381)))

(declare-fun b!32347 () Bool)

(assert (=> b!32347 (= e!21381 Nil!393)))

(declare-fun b!32348 () Bool)

(assert (=> b!32348 (= e!21381 (Cons!392 (not (= (bvand ((_ sign_extend 24) (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1730 lt!46917) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9546 c!2217) b!32347))

(assert (= (and d!9546 (not c!2217)) b!32348))

(assert (=> b!32348 m!46923))

(assert (=> b!32348 m!47841))

(declare-fun m!47863 () Bool)

(assert (=> b!32348 m!47863))

(assert (=> b!31846 d!9546))

(declare-fun d!9548 () Bool)

(assert (=> d!9548 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2606 () Bool)

(assert (= bs!2606 d!9548))

(assert (=> bs!2606 m!46923))

(assert (=> bs!2606 m!47841))

(assert (=> b!31846 d!9548))

(declare-fun d!9550 () Bool)

(assert (=> d!9550 (= (head!233 (byteArrayBitContentToList!0 (_2!1730 lt!46927) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!511 (byteArrayBitContentToList!0 (_2!1730 lt!46927) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31835 d!9550))

(declare-fun d!9552 () Bool)

(declare-fun c!2218 () Bool)

(assert (=> d!9552 (= c!2218 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21382 () List!396)

(assert (=> d!9552 (= (byteArrayBitContentToList!0 (_2!1730 lt!46927) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!21382)))

(declare-fun b!32349 () Bool)

(assert (=> b!32349 (= e!21382 Nil!393)))

(declare-fun b!32350 () Bool)

(assert (=> b!32350 (= e!21382 (Cons!392 (not (= (bvand ((_ sign_extend 24) (select (arr!1268 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1730 lt!46927) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9552 c!2218) b!32349))

(assert (= (and d!9552 (not c!2218)) b!32350))

(assert (=> b!32350 m!46923))

(assert (=> b!32350 m!47841))

(declare-fun m!47865 () Bool)

(assert (=> b!32350 m!47865))

(assert (=> b!31835 d!9552))

(declare-fun d!9554 () Bool)

(assert (=> d!9554 (= (head!233 (bitStreamReadBitsIntoList!0 (_2!1730 lt!46927) (_1!1731 lt!46922) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!511 (bitStreamReadBitsIntoList!0 (_2!1730 lt!46927) (_1!1731 lt!46922) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31835 d!9554))

(declare-fun d!9556 () Bool)

(declare-fun e!21384 () Bool)

(assert (=> d!9556 e!21384))

(declare-fun c!2219 () Bool)

(assert (=> d!9556 (= c!2219 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!47905 () List!396)

(declare-fun e!21383 () tuple2!3306)

(assert (=> d!9556 (= lt!47905 (_1!1740 e!21383))))

(declare-fun c!2220 () Bool)

(assert (=> d!9556 (= c!2220 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9556 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9556 (= (bitStreamReadBitsIntoList!0 (_2!1730 lt!46927) (_1!1731 lt!46922) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47905)))

(declare-fun lt!47903 () tuple2!3308)

(declare-fun b!32352 () Bool)

(declare-fun lt!47904 () (_ BitVec 64))

(assert (=> b!32352 (= e!21383 (tuple2!3307 (Cons!392 (_1!1741 lt!47903) (bitStreamReadBitsIntoList!0 (_2!1730 lt!46927) (_2!1741 lt!47903) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!47904))) (_2!1741 lt!47903)))))

(assert (=> b!32352 (= lt!47903 (readBit!0 (_1!1731 lt!46922)))))

(assert (=> b!32352 (= lt!47904 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32354 () Bool)

(assert (=> b!32354 (= e!21384 (> (length!122 lt!47905) 0))))

(declare-fun b!32351 () Bool)

(assert (=> b!32351 (= e!21383 (tuple2!3307 Nil!393 (_1!1731 lt!46922)))))

(declare-fun b!32353 () Bool)

(assert (=> b!32353 (= e!21384 (isEmpty!88 lt!47905))))

(assert (= (and d!9556 c!2220) b!32351))

(assert (= (and d!9556 (not c!2220)) b!32352))

(assert (= (and d!9556 c!2219) b!32353))

(assert (= (and d!9556 (not c!2219)) b!32354))

(declare-fun m!47867 () Bool)

(assert (=> b!32352 m!47867))

(declare-fun m!47869 () Bool)

(assert (=> b!32352 m!47869))

(declare-fun m!47871 () Bool)

(assert (=> b!32354 m!47871))

(declare-fun m!47873 () Bool)

(assert (=> b!32353 m!47873))

(assert (=> b!31835 d!9556))

(declare-fun d!9558 () Bool)

(assert (=> d!9558 (= (array_inv!748 (buf!1124 thiss!1379)) (bvsge (size!796 (buf!1124 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!31836 d!9558))

(declare-fun d!9560 () Bool)

(assert (=> d!9560 (= (invariant!0 (currentBit!2480 (_2!1730 lt!46927)) (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46917)))) (and (bvsge (currentBit!2480 (_2!1730 lt!46927)) #b00000000000000000000000000000000) (bvslt (currentBit!2480 (_2!1730 lt!46927)) #b00000000000000000000000000001000) (bvsge (currentByte!2485 (_2!1730 lt!46927)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46917)))) (and (= (currentBit!2480 (_2!1730 lt!46927)) #b00000000000000000000000000000000) (= (currentByte!2485 (_2!1730 lt!46927)) (size!796 (buf!1124 (_2!1730 lt!46917))))))))))

(assert (=> b!31842 d!9560))

(declare-fun d!9562 () Bool)

(declare-fun e!21385 () Bool)

(assert (=> d!9562 e!21385))

(declare-fun res!27629 () Bool)

(assert (=> d!9562 (=> (not res!27629) (not e!21385))))

(declare-fun lt!47906 () (_ BitVec 64))

(declare-fun lt!47910 () (_ BitVec 64))

(declare-fun lt!47907 () (_ BitVec 64))

(assert (=> d!9562 (= res!27629 (= lt!47907 (bvsub lt!47906 lt!47910)))))

(assert (=> d!9562 (or (= (bvand lt!47906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47906 lt!47910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9562 (= lt!47910 (remainingBits!0 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))) ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46917))) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46917)))))))

(declare-fun lt!47908 () (_ BitVec 64))

(declare-fun lt!47909 () (_ BitVec 64))

(assert (=> d!9562 (= lt!47906 (bvmul lt!47908 lt!47909))))

(assert (=> d!9562 (or (= lt!47908 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47909 (bvsdiv (bvmul lt!47908 lt!47909) lt!47908)))))

(assert (=> d!9562 (= lt!47909 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9562 (= lt!47908 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))))))

(assert (=> d!9562 (= lt!47907 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2485 (_2!1730 lt!46917))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2480 (_2!1730 lt!46917)))))))

(assert (=> d!9562 (invariant!0 (currentBit!2480 (_2!1730 lt!46917)) (currentByte!2485 (_2!1730 lt!46917)) (size!796 (buf!1124 (_2!1730 lt!46917))))))

(assert (=> d!9562 (= (bitIndex!0 (size!796 (buf!1124 (_2!1730 lt!46917))) (currentByte!2485 (_2!1730 lt!46917)) (currentBit!2480 (_2!1730 lt!46917))) lt!47907)))

(declare-fun b!32355 () Bool)

(declare-fun res!27630 () Bool)

(assert (=> b!32355 (=> (not res!27630) (not e!21385))))

(assert (=> b!32355 (= res!27630 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47907))))

(declare-fun b!32356 () Bool)

(declare-fun lt!47911 () (_ BitVec 64))

(assert (=> b!32356 (= e!21385 (bvsle lt!47907 (bvmul lt!47911 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32356 (or (= lt!47911 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47911 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47911)))))

(assert (=> b!32356 (= lt!47911 ((_ sign_extend 32) (size!796 (buf!1124 (_2!1730 lt!46917)))))))

(assert (= (and d!9562 res!27629) b!32355))

(assert (= (and b!32355 res!27630) b!32356))

(declare-fun m!47875 () Bool)

(assert (=> d!9562 m!47875))

(assert (=> d!9562 m!46911))

(assert (=> b!31843 d!9562))

(declare-fun d!9564 () Bool)

(assert (=> d!9564 (= (head!233 lt!46932) (h!511 lt!46932))))

(assert (=> b!31833 d!9564))

(push 1)

(assert (not b!32098))

(assert (not b!32337))

(assert (not b!32296))

(assert (not b!32335))

(assert (not b!32353))

(assert (not b!32317))

(assert (not b!32298))

(assert (not d!9348))

(assert (not d!9540))

(assert (not d!9528))

(assert (not b!32301))

(assert (not d!9514))

(assert (not b!32339))

(assert (not b!32314))

(assert (not d!9542))

(assert (not d!9394))

(assert (not b!32336))

(assert (not b!32111))

(assert (not d!9336))

(assert (not b!32307))

(assert (not b!32350))

(assert (not b!32115))

(assert (not b!32280))

(assert (not b!32342))

(assert (not d!9538))

(assert (not b!32299))

(assert (not b!32282))

(assert (not b!32283))

(assert (not b!32114))

(assert (not d!9562))

(assert (not b!32281))

(assert (not d!9350))

(assert (not b!32286))

(assert (not d!9388))

(assert (not b!32293))

(assert (not b!32279))

(assert (not b!32352))

(assert (not d!9518))

(assert (not b!32341))

(assert (not b!32099))

(assert (not d!9522))

(assert (not d!9382))

(assert (not b!32112))

(assert (not b!32100))

(assert (not b!32348))

(assert (not d!9536))

(assert (not b!32340))

(assert (not b!32303))

(assert (not d!9390))

(assert (not b!32116))

(assert (not b!32110))

(assert (not d!9378))

(assert (not b!32338))

(assert (not b!32302))

(assert (not b!32094))

(assert (not d!9512))

(assert (not b!32309))

(assert (not d!9504))

(assert (not b!32093))

(assert (not b!32096))

(assert (not b!32091))

(assert (not b!32354))

(assert (not b!32306))

(assert (not bm!412))

(assert (not d!9524))

(assert (not d!9380))

(assert (not b!32095))

(assert (not b!32312))

(assert (not d!9510))

(assert (not b!32295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

