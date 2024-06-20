; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22134 () Bool)

(assert start!22134)

(declare-fun b!111870 () Bool)

(declare-fun e!73415 () Bool)

(declare-fun lt!169898 () (_ BitVec 64))

(declare-fun lt!169892 () (_ BitVec 64))

(assert (=> b!111870 (= e!73415 (= lt!169898 (bvsub lt!169892 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!111871 () Bool)

(declare-fun e!73411 () Bool)

(declare-fun e!73416 () Bool)

(assert (=> b!111871 (= e!73411 (not e!73416))))

(declare-fun res!92383 () Bool)

(assert (=> b!111871 (=> res!92383 e!73416)))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!169879 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((array!5092 0))(
  ( (array!5093 (arr!2908 (Array (_ BitVec 32) (_ BitVec 8))) (size!2315 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4104 0))(
  ( (BitStream!4105 (buf!2718 array!5092) (currentByte!5284 (_ BitVec 32)) (currentBit!5279 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9260 0))(
  ( (tuple2!9261 (_1!4890 BitStream!4104) (_2!4890 BitStream!4104)) )
))
(declare-fun lt!169889 () tuple2!9260)

(declare-datatypes ((tuple2!9262 0))(
  ( (tuple2!9263 (_1!4891 BitStream!4104) (_2!4891 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9262)

(assert (=> b!111871 (= res!92383 (not (= (_1!4891 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!169889) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169879)) (_2!4890 lt!169889))))))

(declare-datatypes ((Unit!6849 0))(
  ( (Unit!6850) )
))
(declare-datatypes ((tuple2!9264 0))(
  ( (tuple2!9265 (_1!4892 Unit!6849) (_2!4892 BitStream!4104)) )
))
(declare-fun lt!169891 () tuple2!9264)

(declare-fun lt!169880 () tuple2!9264)

(declare-fun lt!169876 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!111871 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880))) lt!169876)))

(declare-fun lt!169877 () Unit!6849)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4104 array!5092 (_ BitVec 64)) Unit!6849)

(assert (=> b!111871 (= lt!169877 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4892 lt!169880) (buf!2718 (_2!4892 lt!169891)) lt!169876))))

(assert (=> b!111871 (= lt!169876 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!169890 () (_ BitVec 64))

(declare-fun lt!169875 () (_ BitVec 64))

(declare-datatypes ((tuple2!9266 0))(
  ( (tuple2!9267 (_1!4893 BitStream!4104) (_2!4893 Bool)) )
))
(declare-fun lt!169871 () tuple2!9266)

(assert (=> b!111871 (= lt!169879 (bvor lt!169875 (ite (_2!4893 lt!169871) lt!169890 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!169874 () tuple2!9260)

(declare-fun lt!169888 () tuple2!9262)

(assert (=> b!111871 (= lt!169888 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!169874) nBits!396 i!615 lt!169875))))

(declare-fun thiss!1305 () BitStream!4104)

(declare-fun lt!169873 () (_ BitVec 64))

(assert (=> b!111871 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305)) lt!169873)))

(declare-fun lt!169884 () Unit!6849)

(assert (=> b!111871 (= lt!169884 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2718 (_2!4892 lt!169891)) lt!169873))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!111871 (= lt!169875 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!169896 () Bool)

(assert (=> b!111871 (= (_2!4893 lt!169871) lt!169896)))

(declare-fun readBitPure!0 (BitStream!4104) tuple2!9266)

(assert (=> b!111871 (= lt!169871 (readBitPure!0 (_1!4890 lt!169874)))))

(declare-fun reader!0 (BitStream!4104 BitStream!4104) tuple2!9260)

(assert (=> b!111871 (= lt!169889 (reader!0 (_2!4892 lt!169880) (_2!4892 lt!169891)))))

(assert (=> b!111871 (= lt!169874 (reader!0 thiss!1305 (_2!4892 lt!169891)))))

(declare-fun e!73412 () Bool)

(assert (=> b!111871 e!73412))

(declare-fun res!92382 () Bool)

(assert (=> b!111871 (=> (not res!92382) (not e!73412))))

(declare-fun lt!169883 () tuple2!9266)

(declare-fun lt!169894 () tuple2!9266)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!111871 (= res!92382 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!169883))) (currentByte!5284 (_1!4893 lt!169883)) (currentBit!5279 (_1!4893 lt!169883))) (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!169894))) (currentByte!5284 (_1!4893 lt!169894)) (currentBit!5279 (_1!4893 lt!169894)))))))

(declare-fun lt!169893 () Unit!6849)

(declare-fun lt!169878 () BitStream!4104)

(declare-fun readBitPrefixLemma!0 (BitStream!4104 BitStream!4104) Unit!6849)

(assert (=> b!111871 (= lt!169893 (readBitPrefixLemma!0 lt!169878 (_2!4892 lt!169891)))))

(assert (=> b!111871 (= lt!169894 (readBitPure!0 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305))))))

(assert (=> b!111871 (= lt!169883 (readBitPure!0 lt!169878))))

(assert (=> b!111871 (= lt!169878 (BitStream!4105 (buf!2718 (_2!4892 lt!169880)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun e!73417 () Bool)

(assert (=> b!111871 e!73417))

(declare-fun res!92379 () Bool)

(assert (=> b!111871 (=> (not res!92379) (not e!73417))))

(declare-fun isPrefixOf!0 (BitStream!4104 BitStream!4104) Bool)

(assert (=> b!111871 (= res!92379 (isPrefixOf!0 thiss!1305 (_2!4892 lt!169891)))))

(declare-fun lt!169872 () Unit!6849)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4104 BitStream!4104 BitStream!4104) Unit!6849)

(assert (=> b!111871 (= lt!169872 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4892 lt!169880) (_2!4892 lt!169891)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4104 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9264)

(assert (=> b!111871 (= lt!169891 (appendNLeastSignificantBitsLoop!0 (_2!4892 lt!169880) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!73410 () Bool)

(assert (=> b!111871 e!73410))

(declare-fun res!92373 () Bool)

(assert (=> b!111871 (=> (not res!92373) (not e!73410))))

(assert (=> b!111871 (= res!92373 (= (size!2315 (buf!2718 thiss!1305)) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(declare-fun appendBit!0 (BitStream!4104 Bool) tuple2!9264)

(assert (=> b!111871 (= lt!169880 (appendBit!0 thiss!1305 lt!169896))))

(assert (=> b!111871 (= lt!169896 (not (= (bvand v!199 lt!169890) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!111871 (= lt!169890 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!111872 () Bool)

(declare-fun res!92374 () Bool)

(assert (=> b!111872 (=> (not res!92374) (not e!73411))))

(assert (=> b!111872 (= res!92374 (bvslt i!615 nBits!396))))

(declare-fun b!111873 () Bool)

(declare-fun e!73409 () Bool)

(declare-fun lt!169881 () tuple2!9266)

(declare-fun lt!169885 () (_ BitVec 64))

(assert (=> b!111873 (= e!73409 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!169881))) (currentByte!5284 (_1!4893 lt!169881)) (currentBit!5279 (_1!4893 lt!169881))) lt!169885))))

(declare-fun b!111874 () Bool)

(declare-fun res!92376 () Bool)

(assert (=> b!111874 (=> (not res!92376) (not e!73411))))

(assert (=> b!111874 (= res!92376 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!92375 () Bool)

(declare-fun e!73413 () Bool)

(assert (=> start!22134 (=> (not res!92375) (not e!73413))))

(assert (=> start!22134 (= res!92375 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22134 e!73413))

(assert (=> start!22134 true))

(declare-fun e!73418 () Bool)

(declare-fun inv!12 (BitStream!4104) Bool)

(assert (=> start!22134 (and (inv!12 thiss!1305) e!73418)))

(declare-fun b!111875 () Bool)

(declare-fun res!92378 () Bool)

(assert (=> b!111875 (=> (not res!92378) (not e!73417))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!111875 (= res!92378 (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(declare-fun b!111876 () Bool)

(declare-fun e!73414 () Bool)

(assert (=> b!111876 (= e!73410 e!73414)))

(declare-fun res!92380 () Bool)

(assert (=> b!111876 (=> (not res!92380) (not e!73414))))

(declare-fun lt!169887 () (_ BitVec 64))

(assert (=> b!111876 (= res!92380 (= lt!169885 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!169887)))))

(assert (=> b!111876 (= lt!169885 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(assert (=> b!111876 (= lt!169887 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun b!111877 () Bool)

(assert (=> b!111877 (= e!73417 (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169891)))))))

(declare-fun b!111878 () Bool)

(declare-fun array_inv!2117 (array!5092) Bool)

(assert (=> b!111878 (= e!73418 (array_inv!2117 (buf!2718 thiss!1305)))))

(declare-fun b!111879 () Bool)

(assert (=> b!111879 (= e!73412 (= (_2!4893 lt!169883) (_2!4893 lt!169894)))))

(declare-fun b!111880 () Bool)

(assert (=> b!111880 (= e!73413 e!73411)))

(declare-fun res!92371 () Bool)

(assert (=> b!111880 (=> (not res!92371) (not e!73411))))

(assert (=> b!111880 (= res!92371 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305)) lt!169873))))

(assert (=> b!111880 (= lt!169873 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!111881 () Bool)

(assert (=> b!111881 (= e!73414 e!73409)))

(declare-fun res!92372 () Bool)

(assert (=> b!111881 (=> (not res!92372) (not e!73409))))

(assert (=> b!111881 (= res!92372 (and (= (_2!4893 lt!169881) lt!169896) (= (_1!4893 lt!169881) (_2!4892 lt!169880))))))

(declare-fun readerFrom!0 (BitStream!4104 (_ BitVec 32) (_ BitVec 32)) BitStream!4104)

(assert (=> b!111881 (= lt!169881 (readBitPure!0 (readerFrom!0 (_2!4892 lt!169880) (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305))))))

(declare-fun b!111882 () Bool)

(declare-fun res!92377 () Bool)

(assert (=> b!111882 (=> (not res!92377) (not e!73414))))

(assert (=> b!111882 (= res!92377 (isPrefixOf!0 thiss!1305 (_2!4892 lt!169880)))))

(declare-fun b!111883 () Bool)

(declare-fun lt!169895 () BitStream!4104)

(assert (=> b!111883 (= e!73416 (= (_1!4890 lt!169889) lt!169895))))

(assert (=> b!111883 e!73415))

(declare-fun res!92381 () Bool)

(assert (=> b!111883 (=> (not res!92381) (not e!73415))))

(declare-fun lt!169897 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4104 (_ BitVec 64)) BitStream!4104)

(assert (=> b!111883 (= res!92381 (= (_1!4890 lt!169889) (withMovedBitIndex!0 (_2!4890 lt!169889) (bvsub lt!169892 lt!169897))))))

(assert (=> b!111883 (= lt!169892 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(assert (=> b!111883 (= (_1!4890 lt!169874) (withMovedBitIndex!0 (_2!4890 lt!169874) (bvsub lt!169898 lt!169897)))))

(assert (=> b!111883 (= lt!169897 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169891))) (currentByte!5284 (_2!4892 lt!169891)) (currentBit!5279 (_2!4892 lt!169891))))))

(assert (=> b!111883 (= lt!169898 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun lt!169882 () tuple2!9262)

(assert (=> b!111883 (and (= (_2!4891 lt!169888) (_2!4891 lt!169882)) (= (_1!4891 lt!169888) (_1!4891 lt!169882)))))

(declare-fun lt!169886 () Unit!6849)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6849)

(assert (=> b!111883 (= lt!169886 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4890 lt!169874) nBits!396 i!615 lt!169875))))

(assert (=> b!111883 (= lt!169882 (readNLeastSignificantBitsLoopPure!0 lt!169895 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169879))))

(assert (=> b!111883 (= lt!169895 (withMovedBitIndex!0 (_1!4890 lt!169874) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!22134 res!92375) b!111880))

(assert (= (and b!111880 res!92371) b!111874))

(assert (= (and b!111874 res!92376) b!111872))

(assert (= (and b!111872 res!92374) b!111871))

(assert (= (and b!111871 res!92373) b!111876))

(assert (= (and b!111876 res!92380) b!111882))

(assert (= (and b!111882 res!92377) b!111881))

(assert (= (and b!111881 res!92372) b!111873))

(assert (= (and b!111871 res!92379) b!111875))

(assert (= (and b!111875 res!92378) b!111877))

(assert (= (and b!111871 res!92382) b!111879))

(assert (= (and b!111871 (not res!92383)) b!111883))

(assert (= (and b!111883 res!92381) b!111870))

(assert (= start!22134 b!111878))

(declare-fun m!166855 () Bool)

(assert (=> b!111881 m!166855))

(assert (=> b!111881 m!166855))

(declare-fun m!166857 () Bool)

(assert (=> b!111881 m!166857))

(declare-fun m!166859 () Bool)

(assert (=> b!111873 m!166859))

(declare-fun m!166861 () Bool)

(assert (=> b!111876 m!166861))

(declare-fun m!166863 () Bool)

(assert (=> b!111876 m!166863))

(declare-fun m!166865 () Bool)

(assert (=> start!22134 m!166865))

(declare-fun m!166867 () Bool)

(assert (=> b!111882 m!166867))

(declare-fun m!166869 () Bool)

(assert (=> b!111874 m!166869))

(declare-fun m!166871 () Bool)

(assert (=> b!111880 m!166871))

(declare-fun m!166873 () Bool)

(assert (=> b!111871 m!166873))

(declare-fun m!166875 () Bool)

(assert (=> b!111871 m!166875))

(declare-fun m!166877 () Bool)

(assert (=> b!111871 m!166877))

(declare-fun m!166879 () Bool)

(assert (=> b!111871 m!166879))

(declare-fun m!166881 () Bool)

(assert (=> b!111871 m!166881))

(declare-fun m!166883 () Bool)

(assert (=> b!111871 m!166883))

(declare-fun m!166885 () Bool)

(assert (=> b!111871 m!166885))

(declare-fun m!166887 () Bool)

(assert (=> b!111871 m!166887))

(declare-fun m!166889 () Bool)

(assert (=> b!111871 m!166889))

(declare-fun m!166891 () Bool)

(assert (=> b!111871 m!166891))

(declare-fun m!166893 () Bool)

(assert (=> b!111871 m!166893))

(declare-fun m!166895 () Bool)

(assert (=> b!111871 m!166895))

(declare-fun m!166897 () Bool)

(assert (=> b!111871 m!166897))

(declare-fun m!166899 () Bool)

(assert (=> b!111871 m!166899))

(declare-fun m!166901 () Bool)

(assert (=> b!111871 m!166901))

(declare-fun m!166903 () Bool)

(assert (=> b!111871 m!166903))

(declare-fun m!166905 () Bool)

(assert (=> b!111871 m!166905))

(declare-fun m!166907 () Bool)

(assert (=> b!111871 m!166907))

(declare-fun m!166909 () Bool)

(assert (=> b!111871 m!166909))

(declare-fun m!166911 () Bool)

(assert (=> b!111875 m!166911))

(declare-fun m!166913 () Bool)

(assert (=> b!111883 m!166913))

(assert (=> b!111883 m!166861))

(declare-fun m!166915 () Bool)

(assert (=> b!111883 m!166915))

(assert (=> b!111883 m!166863))

(declare-fun m!166917 () Bool)

(assert (=> b!111883 m!166917))

(declare-fun m!166919 () Bool)

(assert (=> b!111883 m!166919))

(declare-fun m!166921 () Bool)

(assert (=> b!111883 m!166921))

(declare-fun m!166923 () Bool)

(assert (=> b!111883 m!166923))

(declare-fun m!166925 () Bool)

(assert (=> b!111878 m!166925))

(declare-fun m!166927 () Bool)

(assert (=> b!111877 m!166927))

(check-sat (not b!111878) (not b!111876) (not b!111883) (not b!111881) (not b!111875) (not b!111880) (not b!111873) (not b!111874) (not b!111882) (not b!111877) (not start!22134) (not b!111871))
(check-sat)
(get-model)

(declare-fun d!35640 () Bool)

(declare-fun e!73454 () Bool)

(assert (=> d!35640 e!73454))

(declare-fun res!92428 () Bool)

(assert (=> d!35640 (=> (not res!92428) (not e!73454))))

(declare-fun lt!169996 () (_ BitVec 64))

(declare-fun lt!169999 () (_ BitVec 64))

(declare-fun lt!170000 () (_ BitVec 64))

(assert (=> d!35640 (= res!92428 (= lt!169999 (bvsub lt!169996 lt!170000)))))

(assert (=> d!35640 (or (= (bvand lt!169996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!169996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169996 lt!170000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!35640 (= lt!170000 (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169881)))) ((_ sign_extend 32) (currentByte!5284 (_1!4893 lt!169881))) ((_ sign_extend 32) (currentBit!5279 (_1!4893 lt!169881)))))))

(declare-fun lt!169995 () (_ BitVec 64))

(declare-fun lt!169997 () (_ BitVec 64))

(assert (=> d!35640 (= lt!169996 (bvmul lt!169995 lt!169997))))

(assert (=> d!35640 (or (= lt!169995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!169997 (bvsdiv (bvmul lt!169995 lt!169997) lt!169995)))))

(assert (=> d!35640 (= lt!169997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35640 (= lt!169995 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169881)))))))

(assert (=> d!35640 (= lt!169999 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5284 (_1!4893 lt!169881))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5279 (_1!4893 lt!169881)))))))

(assert (=> d!35640 (invariant!0 (currentBit!5279 (_1!4893 lt!169881)) (currentByte!5284 (_1!4893 lt!169881)) (size!2315 (buf!2718 (_1!4893 lt!169881))))))

(assert (=> d!35640 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!169881))) (currentByte!5284 (_1!4893 lt!169881)) (currentBit!5279 (_1!4893 lt!169881))) lt!169999)))

(declare-fun b!111930 () Bool)

(declare-fun res!92427 () Bool)

(assert (=> b!111930 (=> (not res!92427) (not e!73454))))

(assert (=> b!111930 (= res!92427 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!169999))))

(declare-fun b!111931 () Bool)

(declare-fun lt!169998 () (_ BitVec 64))

(assert (=> b!111931 (= e!73454 (bvsle lt!169999 (bvmul lt!169998 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111931 (or (= lt!169998 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!169998 #b0000000000000000000000000000000000000000000000000000000000001000) lt!169998)))))

(assert (=> b!111931 (= lt!169998 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169881)))))))

(assert (= (and d!35640 res!92428) b!111930))

(assert (= (and b!111930 res!92427) b!111931))

(declare-fun m!167003 () Bool)

(assert (=> d!35640 m!167003))

(declare-fun m!167005 () Bool)

(assert (=> d!35640 m!167005))

(assert (=> b!111873 d!35640))

(declare-fun d!35642 () Bool)

(assert (=> d!35642 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!111874 d!35642))

(declare-fun d!35644 () Bool)

(assert (=> d!35644 (= (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169880)))) (and (bvsge (currentBit!5279 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5279 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5284 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169880)))) (and (= (currentBit!5279 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169880))))))))))

(assert (=> b!111875 d!35644))

(declare-fun d!35646 () Bool)

(declare-fun e!73455 () Bool)

(assert (=> d!35646 e!73455))

(declare-fun res!92430 () Bool)

(assert (=> d!35646 (=> (not res!92430) (not e!73455))))

(declare-fun lt!170002 () (_ BitVec 64))

(declare-fun lt!170006 () (_ BitVec 64))

(declare-fun lt!170005 () (_ BitVec 64))

(assert (=> d!35646 (= res!92430 (= lt!170005 (bvsub lt!170002 lt!170006)))))

(assert (=> d!35646 (or (= (bvand lt!170002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170006 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170002 lt!170006) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35646 (= lt!170006 (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169880)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880)))))))

(declare-fun lt!170001 () (_ BitVec 64))

(declare-fun lt!170003 () (_ BitVec 64))

(assert (=> d!35646 (= lt!170002 (bvmul lt!170001 lt!170003))))

(assert (=> d!35646 (or (= lt!170001 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170003 (bvsdiv (bvmul lt!170001 lt!170003) lt!170001)))))

(assert (=> d!35646 (= lt!170003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35646 (= lt!170001 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(assert (=> d!35646 (= lt!170005 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880)))))))

(assert (=> d!35646 (invariant!0 (currentBit!5279 (_2!4892 lt!169880)) (currentByte!5284 (_2!4892 lt!169880)) (size!2315 (buf!2718 (_2!4892 lt!169880))))))

(assert (=> d!35646 (= (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))) lt!170005)))

(declare-fun b!111932 () Bool)

(declare-fun res!92429 () Bool)

(assert (=> b!111932 (=> (not res!92429) (not e!73455))))

(assert (=> b!111932 (= res!92429 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170005))))

(declare-fun b!111933 () Bool)

(declare-fun lt!170004 () (_ BitVec 64))

(assert (=> b!111933 (= e!73455 (bvsle lt!170005 (bvmul lt!170004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111933 (or (= lt!170004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170004)))))

(assert (=> b!111933 (= lt!170004 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(assert (= (and d!35646 res!92430) b!111932))

(assert (= (and b!111932 res!92429) b!111933))

(declare-fun m!167007 () Bool)

(assert (=> d!35646 m!167007))

(declare-fun m!167009 () Bool)

(assert (=> d!35646 m!167009))

(assert (=> b!111876 d!35646))

(declare-fun d!35648 () Bool)

(declare-fun e!73456 () Bool)

(assert (=> d!35648 e!73456))

(declare-fun res!92432 () Bool)

(assert (=> d!35648 (=> (not res!92432) (not e!73456))))

(declare-fun lt!170012 () (_ BitVec 64))

(declare-fun lt!170011 () (_ BitVec 64))

(declare-fun lt!170008 () (_ BitVec 64))

(assert (=> d!35648 (= res!92432 (= lt!170011 (bvsub lt!170008 lt!170012)))))

(assert (=> d!35648 (or (= (bvand lt!170008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170012 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170008 lt!170012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35648 (= lt!170012 (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305))))))

(declare-fun lt!170007 () (_ BitVec 64))

(declare-fun lt!170009 () (_ BitVec 64))

(assert (=> d!35648 (= lt!170008 (bvmul lt!170007 lt!170009))))

(assert (=> d!35648 (or (= lt!170007 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170009 (bvsdiv (bvmul lt!170007 lt!170009) lt!170007)))))

(assert (=> d!35648 (= lt!170009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35648 (= lt!170007 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))))))

(assert (=> d!35648 (= lt!170011 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5284 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5279 thiss!1305))))))

(assert (=> d!35648 (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 thiss!1305)))))

(assert (=> d!35648 (= (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)) lt!170011)))

(declare-fun b!111934 () Bool)

(declare-fun res!92431 () Bool)

(assert (=> b!111934 (=> (not res!92431) (not e!73456))))

(assert (=> b!111934 (= res!92431 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170011))))

(declare-fun b!111935 () Bool)

(declare-fun lt!170010 () (_ BitVec 64))

(assert (=> b!111935 (= e!73456 (bvsle lt!170011 (bvmul lt!170010 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111935 (or (= lt!170010 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170010 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170010)))))

(assert (=> b!111935 (= lt!170010 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))))))

(assert (= (and d!35648 res!92432) b!111934))

(assert (= (and b!111934 res!92431) b!111935))

(declare-fun m!167011 () Bool)

(assert (=> d!35648 m!167011))

(declare-fun m!167013 () Bool)

(assert (=> d!35648 m!167013))

(assert (=> b!111876 d!35648))

(declare-fun d!35650 () Bool)

(assert (=> d!35650 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 thiss!1305))))))

(declare-fun bs!8693 () Bool)

(assert (= bs!8693 d!35650))

(assert (=> bs!8693 m!167013))

(assert (=> start!22134 d!35650))

(declare-fun d!35652 () Bool)

(assert (=> d!35652 (= (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169891)))) (and (bvsge (currentBit!5279 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5279 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5284 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169891)))) (and (= (currentBit!5279 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169891))))))))))

(assert (=> b!111877 d!35652))

(declare-fun d!35654 () Bool)

(assert (=> d!35654 (= (array_inv!2117 (buf!2718 thiss!1305)) (bvsge (size!2315 (buf!2718 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!111878 d!35654))

(declare-fun d!35656 () Bool)

(assert (=> d!35656 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305)) lt!169873) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305))) lt!169873))))

(declare-fun bs!8694 () Bool)

(assert (= bs!8694 d!35656))

(assert (=> bs!8694 m!167011))

(assert (=> b!111880 d!35656))

(declare-fun d!35658 () Bool)

(declare-datatypes ((tuple2!9276 0))(
  ( (tuple2!9277 (_1!4898 Bool) (_2!4898 BitStream!4104)) )
))
(declare-fun lt!170015 () tuple2!9276)

(declare-fun readBit!0 (BitStream!4104) tuple2!9276)

(assert (=> d!35658 (= lt!170015 (readBit!0 (readerFrom!0 (_2!4892 lt!169880) (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305))))))

(assert (=> d!35658 (= (readBitPure!0 (readerFrom!0 (_2!4892 lt!169880) (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305))) (tuple2!9267 (_2!4898 lt!170015) (_1!4898 lt!170015)))))

(declare-fun bs!8695 () Bool)

(assert (= bs!8695 d!35658))

(assert (=> bs!8695 m!166855))

(declare-fun m!167015 () Bool)

(assert (=> bs!8695 m!167015))

(assert (=> b!111881 d!35658))

(declare-fun d!35660 () Bool)

(declare-fun e!73459 () Bool)

(assert (=> d!35660 e!73459))

(declare-fun res!92436 () Bool)

(assert (=> d!35660 (=> (not res!92436) (not e!73459))))

(assert (=> d!35660 (= res!92436 (invariant!0 (currentBit!5279 (_2!4892 lt!169880)) (currentByte!5284 (_2!4892 lt!169880)) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(assert (=> d!35660 (= (readerFrom!0 (_2!4892 lt!169880) (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305)) (BitStream!4105 (buf!2718 (_2!4892 lt!169880)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun b!111938 () Bool)

(assert (=> b!111938 (= e!73459 (invariant!0 (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(assert (= (and d!35660 res!92436) b!111938))

(assert (=> d!35660 m!167009))

(assert (=> b!111938 m!166911))

(assert (=> b!111881 d!35660))

(declare-fun d!35662 () Bool)

(declare-fun lt!170016 () tuple2!9276)

(assert (=> d!35662 (= lt!170016 (readBit!0 (_1!4890 lt!169874)))))

(assert (=> d!35662 (= (readBitPure!0 (_1!4890 lt!169874)) (tuple2!9267 (_2!4898 lt!170016) (_1!4898 lt!170016)))))

(declare-fun bs!8696 () Bool)

(assert (= bs!8696 d!35662))

(declare-fun m!167017 () Bool)

(assert (=> bs!8696 m!167017))

(assert (=> b!111871 d!35662))

(declare-fun d!35664 () Bool)

(declare-fun lt!170017 () tuple2!9276)

(assert (=> d!35664 (= lt!170017 (readBit!0 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305))))))

(assert (=> d!35664 (= (readBitPure!0 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305))) (tuple2!9267 (_2!4898 lt!170017) (_1!4898 lt!170017)))))

(declare-fun bs!8697 () Bool)

(assert (= bs!8697 d!35664))

(declare-fun m!167019 () Bool)

(assert (=> bs!8697 m!167019))

(assert (=> b!111871 d!35664))

(declare-fun d!35666 () Bool)

(assert (=> d!35666 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305)) lt!169873)))

(declare-fun lt!170020 () Unit!6849)

(declare-fun choose!9 (BitStream!4104 array!5092 (_ BitVec 64) BitStream!4104) Unit!6849)

(assert (=> d!35666 (= lt!170020 (choose!9 thiss!1305 (buf!2718 (_2!4892 lt!169891)) lt!169873 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305))))))

(assert (=> d!35666 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2718 (_2!4892 lt!169891)) lt!169873) lt!170020)))

(declare-fun bs!8698 () Bool)

(assert (= bs!8698 d!35666))

(assert (=> bs!8698 m!166903))

(declare-fun m!167021 () Bool)

(assert (=> bs!8698 m!167021))

(assert (=> b!111871 d!35666))

(declare-fun d!35668 () Bool)

(declare-datatypes ((tuple2!9278 0))(
  ( (tuple2!9279 (_1!4899 (_ BitVec 64)) (_2!4899 BitStream!4104)) )
))
(declare-fun lt!170023 () tuple2!9278)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9278)

(assert (=> d!35668 (= lt!170023 (readNLeastSignificantBitsLoop!0 (_1!4890 lt!169889) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169879))))

(assert (=> d!35668 (= (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!169889) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169879) (tuple2!9263 (_2!4899 lt!170023) (_1!4899 lt!170023)))))

(declare-fun bs!8699 () Bool)

(assert (= bs!8699 d!35668))

(declare-fun m!167023 () Bool)

(assert (=> bs!8699 m!167023))

(assert (=> b!111871 d!35668))

(declare-fun d!35670 () Bool)

(assert (=> d!35670 (isPrefixOf!0 thiss!1305 (_2!4892 lt!169891))))

(declare-fun lt!170026 () Unit!6849)

(declare-fun choose!30 (BitStream!4104 BitStream!4104 BitStream!4104) Unit!6849)

(assert (=> d!35670 (= lt!170026 (choose!30 thiss!1305 (_2!4892 lt!169880) (_2!4892 lt!169891)))))

(assert (=> d!35670 (isPrefixOf!0 thiss!1305 (_2!4892 lt!169880))))

(assert (=> d!35670 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4892 lt!169880) (_2!4892 lt!169891)) lt!170026)))

(declare-fun bs!8700 () Bool)

(assert (= bs!8700 d!35670))

(assert (=> bs!8700 m!166893))

(declare-fun m!167025 () Bool)

(assert (=> bs!8700 m!167025))

(assert (=> bs!8700 m!166867))

(assert (=> b!111871 d!35670))

(declare-fun d!35672 () Bool)

(declare-fun e!73460 () Bool)

(assert (=> d!35672 e!73460))

(declare-fun res!92438 () Bool)

(assert (=> d!35672 (=> (not res!92438) (not e!73460))))

(declare-fun lt!170032 () (_ BitVec 64))

(declare-fun lt!170028 () (_ BitVec 64))

(declare-fun lt!170031 () (_ BitVec 64))

(assert (=> d!35672 (= res!92438 (= lt!170031 (bvsub lt!170028 lt!170032)))))

(assert (=> d!35672 (or (= (bvand lt!170028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170028 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170028 lt!170032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35672 (= lt!170032 (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169883)))) ((_ sign_extend 32) (currentByte!5284 (_1!4893 lt!169883))) ((_ sign_extend 32) (currentBit!5279 (_1!4893 lt!169883)))))))

(declare-fun lt!170027 () (_ BitVec 64))

(declare-fun lt!170029 () (_ BitVec 64))

(assert (=> d!35672 (= lt!170028 (bvmul lt!170027 lt!170029))))

(assert (=> d!35672 (or (= lt!170027 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170029 (bvsdiv (bvmul lt!170027 lt!170029) lt!170027)))))

(assert (=> d!35672 (= lt!170029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35672 (= lt!170027 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169883)))))))

(assert (=> d!35672 (= lt!170031 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5284 (_1!4893 lt!169883))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5279 (_1!4893 lt!169883)))))))

(assert (=> d!35672 (invariant!0 (currentBit!5279 (_1!4893 lt!169883)) (currentByte!5284 (_1!4893 lt!169883)) (size!2315 (buf!2718 (_1!4893 lt!169883))))))

(assert (=> d!35672 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!169883))) (currentByte!5284 (_1!4893 lt!169883)) (currentBit!5279 (_1!4893 lt!169883))) lt!170031)))

(declare-fun b!111939 () Bool)

(declare-fun res!92437 () Bool)

(assert (=> b!111939 (=> (not res!92437) (not e!73460))))

(assert (=> b!111939 (= res!92437 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170031))))

(declare-fun b!111940 () Bool)

(declare-fun lt!170030 () (_ BitVec 64))

(assert (=> b!111940 (= e!73460 (bvsle lt!170031 (bvmul lt!170030 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!111940 (or (= lt!170030 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170030 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170030)))))

(assert (=> b!111940 (= lt!170030 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169883)))))))

(assert (= (and d!35672 res!92438) b!111939))

(assert (= (and b!111939 res!92437) b!111940))

(declare-fun m!167027 () Bool)

(assert (=> d!35672 m!167027))

(declare-fun m!167029 () Bool)

(assert (=> d!35672 m!167029))

(assert (=> b!111871 d!35672))

(declare-fun b!112016 () Bool)

(declare-fun res!92507 () Bool)

(declare-fun e!73509 () Bool)

(assert (=> b!112016 (=> (not res!92507) (not e!73509))))

(declare-fun lt!170311 () (_ BitVec 64))

(declare-fun lt!170305 () (_ BitVec 64))

(declare-fun lt!170300 () tuple2!9264)

(assert (=> b!112016 (= res!92507 (= (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170300))) (currentByte!5284 (_2!4892 lt!170300)) (currentBit!5279 (_2!4892 lt!170300))) (bvadd lt!170305 lt!170311)))))

(assert (=> b!112016 (or (not (= (bvand lt!170305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170311 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170305 lt!170311) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112016 (= lt!170311 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112016 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112016 (= lt!170305 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(declare-fun b!112017 () Bool)

(declare-fun e!73507 () Bool)

(declare-fun lt!170321 () tuple2!9266)

(declare-fun lt!170294 () tuple2!9266)

(assert (=> b!112017 (= e!73507 (= (_2!4893 lt!170321) (_2!4893 lt!170294)))))

(declare-fun d!35674 () Bool)

(assert (=> d!35674 e!73509))

(declare-fun res!92501 () Bool)

(assert (=> d!35674 (=> (not res!92501) (not e!73509))))

(assert (=> d!35674 (= res!92501 (= (size!2315 (buf!2718 (_2!4892 lt!169880))) (size!2315 (buf!2718 (_2!4892 lt!170300)))))))

(declare-fun e!73510 () tuple2!9264)

(assert (=> d!35674 (= lt!170300 e!73510)))

(declare-fun c!6811 () Bool)

(assert (=> d!35674 (= c!6811 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!35674 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!35674 (= (appendNLeastSignificantBitsLoop!0 (_2!4892 lt!169880) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!170300)))

(declare-fun b!112018 () Bool)

(declare-fun e!73506 () Bool)

(declare-fun lt!170307 () tuple2!9266)

(declare-fun lt!170295 () tuple2!9264)

(assert (=> b!112018 (= e!73506 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!170307))) (currentByte!5284 (_1!4893 lt!170307)) (currentBit!5279 (_1!4893 lt!170307))) (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170295))) (currentByte!5284 (_2!4892 lt!170295)) (currentBit!5279 (_2!4892 lt!170295)))))))

(declare-fun lt!170298 () tuple2!9264)

(declare-fun lt!170306 () BitStream!4104)

(declare-fun call!1419 () Bool)

(declare-fun bm!1416 () Bool)

(assert (=> bm!1416 (= call!1419 (isPrefixOf!0 (ite c!6811 (_2!4892 lt!169880) lt!170306) (ite c!6811 (_2!4892 lt!170298) lt!170306)))))

(declare-fun b!112019 () Bool)

(declare-fun e!73505 () Bool)

(declare-fun lt!170312 () (_ BitVec 64))

(assert (=> b!112019 (= e!73505 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169880)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880))) lt!170312))))

(declare-fun b!112020 () Bool)

(declare-fun Unit!6853 () Unit!6849)

(assert (=> b!112020 (= e!73510 (tuple2!9265 Unit!6853 (_2!4892 lt!170298)))))

(declare-fun lt!170293 () Bool)

(assert (=> b!112020 (= lt!170293 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112020 (= lt!170295 (appendBit!0 (_2!4892 lt!169880) lt!170293))))

(declare-fun res!92502 () Bool)

(assert (=> b!112020 (= res!92502 (= (size!2315 (buf!2718 (_2!4892 lt!169880))) (size!2315 (buf!2718 (_2!4892 lt!170295)))))))

(declare-fun e!73508 () Bool)

(assert (=> b!112020 (=> (not res!92502) (not e!73508))))

(assert (=> b!112020 e!73508))

(declare-fun lt!170290 () tuple2!9264)

(assert (=> b!112020 (= lt!170290 lt!170295)))

(assert (=> b!112020 (= lt!170298 (appendNLeastSignificantBitsLoop!0 (_2!4892 lt!170290) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!170320 () Unit!6849)

(assert (=> b!112020 (= lt!170320 (lemmaIsPrefixTransitive!0 (_2!4892 lt!169880) (_2!4892 lt!170290) (_2!4892 lt!170298)))))

(assert (=> b!112020 call!1419))

(declare-fun lt!170283 () Unit!6849)

(assert (=> b!112020 (= lt!170283 lt!170320)))

(assert (=> b!112020 (invariant!0 (currentBit!5279 (_2!4892 lt!169880)) (currentByte!5284 (_2!4892 lt!169880)) (size!2315 (buf!2718 (_2!4892 lt!170290))))))

(declare-fun lt!170299 () BitStream!4104)

(assert (=> b!112020 (= lt!170299 (BitStream!4105 (buf!2718 (_2!4892 lt!170290)) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(assert (=> b!112020 (invariant!0 (currentBit!5279 lt!170299) (currentByte!5284 lt!170299) (size!2315 (buf!2718 (_2!4892 lt!170298))))))

(declare-fun lt!170324 () BitStream!4104)

(assert (=> b!112020 (= lt!170324 (BitStream!4105 (buf!2718 (_2!4892 lt!170298)) (currentByte!5284 lt!170299) (currentBit!5279 lt!170299)))))

(assert (=> b!112020 (= lt!170321 (readBitPure!0 lt!170299))))

(assert (=> b!112020 (= lt!170294 (readBitPure!0 lt!170324))))

(declare-fun lt!170285 () Unit!6849)

(assert (=> b!112020 (= lt!170285 (readBitPrefixLemma!0 lt!170299 (_2!4892 lt!170298)))))

(declare-fun res!92504 () Bool)

(assert (=> b!112020 (= res!92504 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!170321))) (currentByte!5284 (_1!4893 lt!170321)) (currentBit!5279 (_1!4893 lt!170321))) (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!170294))) (currentByte!5284 (_1!4893 lt!170294)) (currentBit!5279 (_1!4893 lt!170294)))))))

(assert (=> b!112020 (=> (not res!92504) (not e!73507))))

(assert (=> b!112020 e!73507))

(declare-fun lt!170296 () Unit!6849)

(assert (=> b!112020 (= lt!170296 lt!170285)))

(declare-fun lt!170309 () tuple2!9260)

(assert (=> b!112020 (= lt!170309 (reader!0 (_2!4892 lt!169880) (_2!4892 lt!170298)))))

(declare-fun lt!170322 () tuple2!9260)

(assert (=> b!112020 (= lt!170322 (reader!0 (_2!4892 lt!170290) (_2!4892 lt!170298)))))

(declare-fun lt!170323 () tuple2!9266)

(assert (=> b!112020 (= lt!170323 (readBitPure!0 (_1!4890 lt!170309)))))

(assert (=> b!112020 (= (_2!4893 lt!170323) lt!170293)))

(declare-fun lt!170292 () Unit!6849)

(declare-fun Unit!6854 () Unit!6849)

(assert (=> b!112020 (= lt!170292 Unit!6854)))

(declare-fun lt!170302 () (_ BitVec 64))

(assert (=> b!112020 (= lt!170302 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!170288 () (_ BitVec 64))

(assert (=> b!112020 (= lt!170288 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!170310 () Unit!6849)

(assert (=> b!112020 (= lt!170310 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4892 lt!169880) (buf!2718 (_2!4892 lt!170298)) lt!170288))))

(assert (=> b!112020 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!170298)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880))) lt!170288)))

(declare-fun lt!170319 () Unit!6849)

(assert (=> b!112020 (= lt!170319 lt!170310)))

(declare-fun lt!170325 () tuple2!9262)

(assert (=> b!112020 (= lt!170325 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!170309) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170302))))

(declare-fun lt!170315 () (_ BitVec 64))

(assert (=> b!112020 (= lt!170315 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!170326 () Unit!6849)

(assert (=> b!112020 (= lt!170326 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4892 lt!170290) (buf!2718 (_2!4892 lt!170298)) lt!170315))))

(assert (=> b!112020 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!170298)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!170290))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!170290))) lt!170315)))

(declare-fun lt!170301 () Unit!6849)

(assert (=> b!112020 (= lt!170301 lt!170326)))

(declare-fun lt!170287 () tuple2!9262)

(assert (=> b!112020 (= lt!170287 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!170322) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170302 (ite (_2!4893 lt!170323) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!170314 () tuple2!9262)

(assert (=> b!112020 (= lt!170314 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!170309) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170302))))

(declare-fun c!6812 () Bool)

(assert (=> b!112020 (= c!6812 (_2!4893 (readBitPure!0 (_1!4890 lt!170309))))))

(declare-fun lt!170284 () tuple2!9262)

(declare-fun e!73511 () (_ BitVec 64))

(assert (=> b!112020 (= lt!170284 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4890 lt!170309) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!170302 e!73511)))))

(declare-fun lt!170291 () Unit!6849)

(assert (=> b!112020 (= lt!170291 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4890 lt!170309) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170302))))

(assert (=> b!112020 (and (= (_2!4891 lt!170314) (_2!4891 lt!170284)) (= (_1!4891 lt!170314) (_1!4891 lt!170284)))))

(declare-fun lt!170304 () Unit!6849)

(assert (=> b!112020 (= lt!170304 lt!170291)))

(assert (=> b!112020 (= (_1!4890 lt!170309) (withMovedBitIndex!0 (_2!4890 lt!170309) (bvsub (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))) (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170298))) (currentByte!5284 (_2!4892 lt!170298)) (currentBit!5279 (_2!4892 lt!170298))))))))

(declare-fun lt!170317 () Unit!6849)

(declare-fun Unit!6855 () Unit!6849)

(assert (=> b!112020 (= lt!170317 Unit!6855)))

(assert (=> b!112020 (= (_1!4890 lt!170322) (withMovedBitIndex!0 (_2!4890 lt!170322) (bvsub (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170290))) (currentByte!5284 (_2!4892 lt!170290)) (currentBit!5279 (_2!4892 lt!170290))) (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170298))) (currentByte!5284 (_2!4892 lt!170298)) (currentBit!5279 (_2!4892 lt!170298))))))))

(declare-fun lt!170318 () Unit!6849)

(declare-fun Unit!6856 () Unit!6849)

(assert (=> b!112020 (= lt!170318 Unit!6856)))

(assert (=> b!112020 (= (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))) (bvsub (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170290))) (currentByte!5284 (_2!4892 lt!170290)) (currentBit!5279 (_2!4892 lt!170290))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!170297 () Unit!6849)

(declare-fun Unit!6857 () Unit!6849)

(assert (=> b!112020 (= lt!170297 Unit!6857)))

(assert (=> b!112020 (= (_2!4891 lt!170325) (_2!4891 lt!170287))))

(declare-fun lt!170308 () Unit!6849)

(declare-fun Unit!6858 () Unit!6849)

(assert (=> b!112020 (= lt!170308 Unit!6858)))

(assert (=> b!112020 (= (_1!4891 lt!170325) (_2!4890 lt!170309))))

(declare-fun b!112021 () Bool)

(declare-fun res!92503 () Bool)

(assert (=> b!112021 (= res!92503 (= (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170295))) (currentByte!5284 (_2!4892 lt!170295)) (currentBit!5279 (_2!4892 lt!170295))) (bvadd (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!112021 (=> (not res!92503) (not e!73508))))

(declare-fun b!112022 () Bool)

(declare-fun lt!170289 () Unit!6849)

(assert (=> b!112022 (= e!73510 (tuple2!9265 lt!170289 (_2!4892 lt!169880)))))

(assert (=> b!112022 (= lt!170306 (_2!4892 lt!169880))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4104) Unit!6849)

(assert (=> b!112022 (= lt!170289 (lemmaIsPrefixRefl!0 lt!170306))))

(assert (=> b!112022 call!1419))

(declare-fun b!112023 () Bool)

(assert (=> b!112023 (= e!73511 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!112024 () Bool)

(declare-fun res!92506 () Bool)

(assert (=> b!112024 (= res!92506 (isPrefixOf!0 (_2!4892 lt!169880) (_2!4892 lt!170295)))))

(assert (=> b!112024 (=> (not res!92506) (not e!73508))))

(declare-fun b!112025 () Bool)

(assert (=> b!112025 (= e!73511 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!112026 () Bool)

(assert (=> b!112026 (= lt!170307 (readBitPure!0 (readerFrom!0 (_2!4892 lt!170295) (currentBit!5279 (_2!4892 lt!169880)) (currentByte!5284 (_2!4892 lt!169880)))))))

(declare-fun res!92505 () Bool)

(assert (=> b!112026 (= res!92505 (and (= (_2!4893 lt!170307) lt!170293) (= (_1!4893 lt!170307) (_2!4892 lt!170295))))))

(assert (=> b!112026 (=> (not res!92505) (not e!73506))))

(assert (=> b!112026 (= e!73508 e!73506)))

(declare-fun b!112027 () Bool)

(declare-fun res!92509 () Bool)

(assert (=> b!112027 (=> (not res!92509) (not e!73509))))

(assert (=> b!112027 (= res!92509 (isPrefixOf!0 (_2!4892 lt!169880) (_2!4892 lt!170300)))))

(declare-fun b!112028 () Bool)

(declare-fun lt!170303 () tuple2!9260)

(declare-fun lt!170286 () tuple2!9262)

(assert (=> b!112028 (= e!73509 (and (= (_2!4891 lt!170286) v!199) (= (_1!4891 lt!170286) (_2!4890 lt!170303))))))

(declare-fun lt!170316 () (_ BitVec 64))

(assert (=> b!112028 (= lt!170286 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!170303) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!170316))))

(declare-fun lt!170282 () Unit!6849)

(declare-fun lt!170313 () Unit!6849)

(assert (=> b!112028 (= lt!170282 lt!170313)))

(assert (=> b!112028 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!170300)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880))) lt!170312)))

(assert (=> b!112028 (= lt!170313 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4892 lt!169880) (buf!2718 (_2!4892 lt!170300)) lt!170312))))

(assert (=> b!112028 e!73505))

(declare-fun res!92508 () Bool)

(assert (=> b!112028 (=> (not res!92508) (not e!73505))))

(assert (=> b!112028 (= res!92508 (and (= (size!2315 (buf!2718 (_2!4892 lt!169880))) (size!2315 (buf!2718 (_2!4892 lt!170300)))) (bvsge lt!170312 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112028 (= lt!170312 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!112028 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112028 (= lt!170316 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!112028 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!112028 (= lt!170303 (reader!0 (_2!4892 lt!169880) (_2!4892 lt!170300)))))

(assert (= (and d!35674 c!6811) b!112020))

(assert (= (and d!35674 (not c!6811)) b!112022))

(assert (= (and b!112020 res!92502) b!112021))

(assert (= (and b!112021 res!92503) b!112024))

(assert (= (and b!112024 res!92506) b!112026))

(assert (= (and b!112026 res!92505) b!112018))

(assert (= (and b!112020 res!92504) b!112017))

(assert (= (and b!112020 c!6812) b!112023))

(assert (= (and b!112020 (not c!6812)) b!112025))

(assert (= (or b!112020 b!112022) bm!1416))

(assert (= (and d!35674 res!92501) b!112016))

(assert (= (and b!112016 res!92507) b!112027))

(assert (= (and b!112027 res!92509) b!112028))

(assert (= (and b!112028 res!92508) b!112019))

(declare-fun m!167141 () Bool)

(assert (=> b!112020 m!167141))

(declare-fun m!167143 () Bool)

(assert (=> b!112020 m!167143))

(declare-fun m!167145 () Bool)

(assert (=> b!112020 m!167145))

(declare-fun m!167147 () Bool)

(assert (=> b!112020 m!167147))

(declare-fun m!167149 () Bool)

(assert (=> b!112020 m!167149))

(declare-fun m!167151 () Bool)

(assert (=> b!112020 m!167151))

(declare-fun m!167153 () Bool)

(assert (=> b!112020 m!167153))

(declare-fun m!167155 () Bool)

(assert (=> b!112020 m!167155))

(declare-fun m!167157 () Bool)

(assert (=> b!112020 m!167157))

(declare-fun m!167159 () Bool)

(assert (=> b!112020 m!167159))

(declare-fun m!167161 () Bool)

(assert (=> b!112020 m!167161))

(declare-fun m!167163 () Bool)

(assert (=> b!112020 m!167163))

(declare-fun m!167165 () Bool)

(assert (=> b!112020 m!167165))

(declare-fun m!167167 () Bool)

(assert (=> b!112020 m!167167))

(declare-fun m!167169 () Bool)

(assert (=> b!112020 m!167169))

(assert (=> b!112020 m!167151))

(declare-fun m!167171 () Bool)

(assert (=> b!112020 m!167171))

(declare-fun m!167173 () Bool)

(assert (=> b!112020 m!167173))

(declare-fun m!167175 () Bool)

(assert (=> b!112020 m!167175))

(declare-fun m!167177 () Bool)

(assert (=> b!112020 m!167177))

(declare-fun m!167179 () Bool)

(assert (=> b!112020 m!167179))

(declare-fun m!167181 () Bool)

(assert (=> b!112020 m!167181))

(assert (=> b!112020 m!166861))

(declare-fun m!167183 () Bool)

(assert (=> b!112020 m!167183))

(declare-fun m!167185 () Bool)

(assert (=> b!112020 m!167185))

(declare-fun m!167187 () Bool)

(assert (=> b!112020 m!167187))

(declare-fun m!167189 () Bool)

(assert (=> b!112020 m!167189))

(declare-fun m!167191 () Bool)

(assert (=> b!112020 m!167191))

(declare-fun m!167193 () Bool)

(assert (=> b!112020 m!167193))

(declare-fun m!167195 () Bool)

(assert (=> b!112028 m!167195))

(declare-fun m!167197 () Bool)

(assert (=> b!112028 m!167197))

(assert (=> b!112028 m!167189))

(declare-fun m!167199 () Bool)

(assert (=> b!112028 m!167199))

(declare-fun m!167201 () Bool)

(assert (=> b!112028 m!167201))

(declare-fun m!167203 () Bool)

(assert (=> b!112022 m!167203))

(declare-fun m!167205 () Bool)

(assert (=> bm!1416 m!167205))

(declare-fun m!167207 () Bool)

(assert (=> b!112027 m!167207))

(declare-fun m!167209 () Bool)

(assert (=> b!112021 m!167209))

(assert (=> b!112021 m!166861))

(declare-fun m!167211 () Bool)

(assert (=> b!112019 m!167211))

(declare-fun m!167213 () Bool)

(assert (=> b!112018 m!167213))

(assert (=> b!112018 m!167209))

(declare-fun m!167215 () Bool)

(assert (=> b!112026 m!167215))

(assert (=> b!112026 m!167215))

(declare-fun m!167219 () Bool)

(assert (=> b!112026 m!167219))

(declare-fun m!167221 () Bool)

(assert (=> b!112024 m!167221))

(declare-fun m!167225 () Bool)

(assert (=> b!112016 m!167225))

(assert (=> b!112016 m!166861))

(assert (=> b!111871 d!35674))

(declare-fun b!112052 () Bool)

(declare-fun res!92528 () Bool)

(declare-fun e!73522 () Bool)

(assert (=> b!112052 (=> (not res!92528) (not e!73522))))

(declare-fun lt!170392 () tuple2!9260)

(assert (=> b!112052 (= res!92528 (isPrefixOf!0 (_2!4890 lt!170392) (_2!4892 lt!169891)))))

(declare-fun b!112053 () Bool)

(declare-fun e!73523 () Unit!6849)

(declare-fun lt!170393 () Unit!6849)

(assert (=> b!112053 (= e!73523 lt!170393)))

(declare-fun lt!170386 () (_ BitVec 64))

(assert (=> b!112053 (= lt!170386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!170382 () (_ BitVec 64))

(assert (=> b!112053 (= lt!170382 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5092 array!5092 (_ BitVec 64) (_ BitVec 64)) Unit!6849)

(assert (=> b!112053 (= lt!170393 (arrayBitRangesEqSymmetric!0 (buf!2718 thiss!1305) (buf!2718 (_2!4892 lt!169891)) lt!170386 lt!170382))))

(declare-fun arrayBitRangesEq!0 (array!5092 array!5092 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112053 (arrayBitRangesEq!0 (buf!2718 (_2!4892 lt!169891)) (buf!2718 thiss!1305) lt!170386 lt!170382)))

(declare-fun d!35740 () Bool)

(assert (=> d!35740 e!73522))

(declare-fun res!92529 () Bool)

(assert (=> d!35740 (=> (not res!92529) (not e!73522))))

(assert (=> d!35740 (= res!92529 (isPrefixOf!0 (_1!4890 lt!170392) (_2!4890 lt!170392)))))

(declare-fun lt!170391 () BitStream!4104)

(assert (=> d!35740 (= lt!170392 (tuple2!9261 lt!170391 (_2!4892 lt!169891)))))

(declare-fun lt!170384 () Unit!6849)

(declare-fun lt!170389 () Unit!6849)

(assert (=> d!35740 (= lt!170384 lt!170389)))

(assert (=> d!35740 (isPrefixOf!0 lt!170391 (_2!4892 lt!169891))))

(assert (=> d!35740 (= lt!170389 (lemmaIsPrefixTransitive!0 lt!170391 (_2!4892 lt!169891) (_2!4892 lt!169891)))))

(declare-fun lt!170387 () Unit!6849)

(declare-fun lt!170379 () Unit!6849)

(assert (=> d!35740 (= lt!170387 lt!170379)))

(assert (=> d!35740 (isPrefixOf!0 lt!170391 (_2!4892 lt!169891))))

(assert (=> d!35740 (= lt!170379 (lemmaIsPrefixTransitive!0 lt!170391 thiss!1305 (_2!4892 lt!169891)))))

(declare-fun lt!170395 () Unit!6849)

(assert (=> d!35740 (= lt!170395 e!73523)))

(declare-fun c!6815 () Bool)

(assert (=> d!35740 (= c!6815 (not (= (size!2315 (buf!2718 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!170383 () Unit!6849)

(declare-fun lt!170380 () Unit!6849)

(assert (=> d!35740 (= lt!170383 lt!170380)))

(assert (=> d!35740 (isPrefixOf!0 (_2!4892 lt!169891) (_2!4892 lt!169891))))

(assert (=> d!35740 (= lt!170380 (lemmaIsPrefixRefl!0 (_2!4892 lt!169891)))))

(declare-fun lt!170388 () Unit!6849)

(declare-fun lt!170398 () Unit!6849)

(assert (=> d!35740 (= lt!170388 lt!170398)))

(assert (=> d!35740 (= lt!170398 (lemmaIsPrefixRefl!0 (_2!4892 lt!169891)))))

(declare-fun lt!170396 () Unit!6849)

(declare-fun lt!170381 () Unit!6849)

(assert (=> d!35740 (= lt!170396 lt!170381)))

(assert (=> d!35740 (isPrefixOf!0 lt!170391 lt!170391)))

(assert (=> d!35740 (= lt!170381 (lemmaIsPrefixRefl!0 lt!170391))))

(declare-fun lt!170397 () Unit!6849)

(declare-fun lt!170385 () Unit!6849)

(assert (=> d!35740 (= lt!170397 lt!170385)))

(assert (=> d!35740 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!35740 (= lt!170385 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!35740 (= lt!170391 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(assert (=> d!35740 (isPrefixOf!0 thiss!1305 (_2!4892 lt!169891))))

(assert (=> d!35740 (= (reader!0 thiss!1305 (_2!4892 lt!169891)) lt!170392)))

(declare-fun b!112054 () Bool)

(declare-fun lt!170394 () (_ BitVec 64))

(declare-fun lt!170390 () (_ BitVec 64))

(assert (=> b!112054 (= e!73522 (= (_1!4890 lt!170392) (withMovedBitIndex!0 (_2!4890 lt!170392) (bvsub lt!170394 lt!170390))))))

(assert (=> b!112054 (or (= (bvand lt!170394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170390 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170394 lt!170390) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112054 (= lt!170390 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169891))) (currentByte!5284 (_2!4892 lt!169891)) (currentBit!5279 (_2!4892 lt!169891))))))

(assert (=> b!112054 (= lt!170394 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun b!112055 () Bool)

(declare-fun Unit!6859 () Unit!6849)

(assert (=> b!112055 (= e!73523 Unit!6859)))

(declare-fun b!112056 () Bool)

(declare-fun res!92530 () Bool)

(assert (=> b!112056 (=> (not res!92530) (not e!73522))))

(assert (=> b!112056 (= res!92530 (isPrefixOf!0 (_1!4890 lt!170392) thiss!1305))))

(assert (= (and d!35740 c!6815) b!112053))

(assert (= (and d!35740 (not c!6815)) b!112055))

(assert (= (and d!35740 res!92529) b!112056))

(assert (= (and b!112056 res!92530) b!112052))

(assert (= (and b!112052 res!92528) b!112054))

(declare-fun m!167237 () Bool)

(assert (=> b!112052 m!167237))

(declare-fun m!167239 () Bool)

(assert (=> b!112056 m!167239))

(declare-fun m!167241 () Bool)

(assert (=> b!112054 m!167241))

(assert (=> b!112054 m!166921))

(assert (=> b!112054 m!166863))

(assert (=> b!112053 m!166863))

(declare-fun m!167243 () Bool)

(assert (=> b!112053 m!167243))

(declare-fun m!167245 () Bool)

(assert (=> b!112053 m!167245))

(declare-fun m!167247 () Bool)

(assert (=> d!35740 m!167247))

(declare-fun m!167249 () Bool)

(assert (=> d!35740 m!167249))

(declare-fun m!167251 () Bool)

(assert (=> d!35740 m!167251))

(declare-fun m!167253 () Bool)

(assert (=> d!35740 m!167253))

(declare-fun m!167255 () Bool)

(assert (=> d!35740 m!167255))

(declare-fun m!167257 () Bool)

(assert (=> d!35740 m!167257))

(declare-fun m!167259 () Bool)

(assert (=> d!35740 m!167259))

(declare-fun m!167261 () Bool)

(assert (=> d!35740 m!167261))

(assert (=> d!35740 m!166893))

(declare-fun m!167263 () Bool)

(assert (=> d!35740 m!167263))

(declare-fun m!167265 () Bool)

(assert (=> d!35740 m!167265))

(assert (=> b!111871 d!35740))

(declare-fun d!35744 () Bool)

(declare-fun e!73526 () Bool)

(assert (=> d!35744 e!73526))

(declare-fun res!92533 () Bool)

(assert (=> d!35744 (=> (not res!92533) (not e!73526))))

(declare-fun lt!170408 () tuple2!9266)

(declare-fun lt!170410 () tuple2!9266)

(assert (=> d!35744 (= res!92533 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!170408))) (currentByte!5284 (_1!4893 lt!170408)) (currentBit!5279 (_1!4893 lt!170408))) (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!170410))) (currentByte!5284 (_1!4893 lt!170410)) (currentBit!5279 (_1!4893 lt!170410)))))))

(declare-fun lt!170409 () Unit!6849)

(declare-fun lt!170407 () BitStream!4104)

(declare-fun choose!50 (BitStream!4104 BitStream!4104 BitStream!4104 tuple2!9266 tuple2!9266 BitStream!4104 Bool tuple2!9266 tuple2!9266 BitStream!4104 Bool) Unit!6849)

(assert (=> d!35744 (= lt!170409 (choose!50 lt!169878 (_2!4892 lt!169891) lt!170407 lt!170408 (tuple2!9267 (_1!4893 lt!170408) (_2!4893 lt!170408)) (_1!4893 lt!170408) (_2!4893 lt!170408) lt!170410 (tuple2!9267 (_1!4893 lt!170410) (_2!4893 lt!170410)) (_1!4893 lt!170410) (_2!4893 lt!170410)))))

(assert (=> d!35744 (= lt!170410 (readBitPure!0 lt!170407))))

(assert (=> d!35744 (= lt!170408 (readBitPure!0 lt!169878))))

(assert (=> d!35744 (= lt!170407 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 lt!169878) (currentBit!5279 lt!169878)))))

(assert (=> d!35744 (invariant!0 (currentBit!5279 lt!169878) (currentByte!5284 lt!169878) (size!2315 (buf!2718 (_2!4892 lt!169891))))))

(assert (=> d!35744 (= (readBitPrefixLemma!0 lt!169878 (_2!4892 lt!169891)) lt!170409)))

(declare-fun b!112059 () Bool)

(assert (=> b!112059 (= e!73526 (= (_2!4893 lt!170408) (_2!4893 lt!170410)))))

(assert (= (and d!35744 res!92533) b!112059))

(declare-fun m!167267 () Bool)

(assert (=> d!35744 m!167267))

(assert (=> d!35744 m!166885))

(declare-fun m!167269 () Bool)

(assert (=> d!35744 m!167269))

(declare-fun m!167271 () Bool)

(assert (=> d!35744 m!167271))

(declare-fun m!167273 () Bool)

(assert (=> d!35744 m!167273))

(declare-fun m!167275 () Bool)

(assert (=> d!35744 m!167275))

(assert (=> b!111871 d!35744))

(declare-fun d!35746 () Bool)

(declare-fun e!73527 () Bool)

(assert (=> d!35746 e!73527))

(declare-fun res!92535 () Bool)

(assert (=> d!35746 (=> (not res!92535) (not e!73527))))

(declare-fun lt!170416 () (_ BitVec 64))

(declare-fun lt!170412 () (_ BitVec 64))

(declare-fun lt!170415 () (_ BitVec 64))

(assert (=> d!35746 (= res!92535 (= lt!170415 (bvsub lt!170412 lt!170416)))))

(assert (=> d!35746 (or (= (bvand lt!170412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170416 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170412 lt!170416) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35746 (= lt!170416 (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169894)))) ((_ sign_extend 32) (currentByte!5284 (_1!4893 lt!169894))) ((_ sign_extend 32) (currentBit!5279 (_1!4893 lt!169894)))))))

(declare-fun lt!170411 () (_ BitVec 64))

(declare-fun lt!170413 () (_ BitVec 64))

(assert (=> d!35746 (= lt!170412 (bvmul lt!170411 lt!170413))))

(assert (=> d!35746 (or (= lt!170411 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170413 (bvsdiv (bvmul lt!170411 lt!170413) lt!170411)))))

(assert (=> d!35746 (= lt!170413 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35746 (= lt!170411 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169894)))))))

(assert (=> d!35746 (= lt!170415 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5284 (_1!4893 lt!169894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5279 (_1!4893 lt!169894)))))))

(assert (=> d!35746 (invariant!0 (currentBit!5279 (_1!4893 lt!169894)) (currentByte!5284 (_1!4893 lt!169894)) (size!2315 (buf!2718 (_1!4893 lt!169894))))))

(assert (=> d!35746 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!169894))) (currentByte!5284 (_1!4893 lt!169894)) (currentBit!5279 (_1!4893 lt!169894))) lt!170415)))

(declare-fun b!112060 () Bool)

(declare-fun res!92534 () Bool)

(assert (=> b!112060 (=> (not res!92534) (not e!73527))))

(assert (=> b!112060 (= res!92534 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170415))))

(declare-fun b!112061 () Bool)

(declare-fun lt!170414 () (_ BitVec 64))

(assert (=> b!112061 (= e!73527 (bvsle lt!170415 (bvmul lt!170414 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112061 (or (= lt!170414 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170414 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170414)))))

(assert (=> b!112061 (= lt!170414 ((_ sign_extend 32) (size!2315 (buf!2718 (_1!4893 lt!169894)))))))

(assert (= (and d!35746 res!92535) b!112060))

(assert (= (and b!112060 res!92534) b!112061))

(declare-fun m!167277 () Bool)

(assert (=> d!35746 m!167277))

(declare-fun m!167279 () Bool)

(assert (=> d!35746 m!167279))

(assert (=> b!111871 d!35746))

(declare-fun d!35748 () Bool)

(declare-fun e!73533 () Bool)

(assert (=> d!35748 e!73533))

(declare-fun res!92547 () Bool)

(assert (=> d!35748 (=> (not res!92547) (not e!73533))))

(declare-fun lt!170427 () tuple2!9264)

(assert (=> d!35748 (= res!92547 (= (size!2315 (buf!2718 thiss!1305)) (size!2315 (buf!2718 (_2!4892 lt!170427)))))))

(declare-fun choose!16 (BitStream!4104 Bool) tuple2!9264)

(assert (=> d!35748 (= lt!170427 (choose!16 thiss!1305 lt!169896))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!35748 (validate_offset_bit!0 ((_ sign_extend 32) (size!2315 (buf!2718 thiss!1305))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305)))))

(assert (=> d!35748 (= (appendBit!0 thiss!1305 lt!169896) lt!170427)))

(declare-fun b!112074 () Bool)

(declare-fun e!73532 () Bool)

(declare-fun lt!170426 () tuple2!9266)

(assert (=> b!112074 (= e!73532 (= (bitIndex!0 (size!2315 (buf!2718 (_1!4893 lt!170426))) (currentByte!5284 (_1!4893 lt!170426)) (currentBit!5279 (_1!4893 lt!170426))) (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170427))) (currentByte!5284 (_2!4892 lt!170427)) (currentBit!5279 (_2!4892 lt!170427)))))))

(declare-fun b!112071 () Bool)

(declare-fun res!92545 () Bool)

(assert (=> b!112071 (=> (not res!92545) (not e!73533))))

(declare-fun lt!170428 () (_ BitVec 64))

(declare-fun lt!170425 () (_ BitVec 64))

(assert (=> b!112071 (= res!92545 (= (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!170427))) (currentByte!5284 (_2!4892 lt!170427)) (currentBit!5279 (_2!4892 lt!170427))) (bvadd lt!170428 lt!170425)))))

(assert (=> b!112071 (or (not (= (bvand lt!170428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170425 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170428 lt!170425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112071 (= lt!170425 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!112071 (= lt!170428 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)))))

(declare-fun b!112073 () Bool)

(assert (=> b!112073 (= e!73533 e!73532)))

(declare-fun res!92544 () Bool)

(assert (=> b!112073 (=> (not res!92544) (not e!73532))))

(assert (=> b!112073 (= res!92544 (and (= (_2!4893 lt!170426) lt!169896) (= (_1!4893 lt!170426) (_2!4892 lt!170427))))))

(assert (=> b!112073 (= lt!170426 (readBitPure!0 (readerFrom!0 (_2!4892 lt!170427) (currentBit!5279 thiss!1305) (currentByte!5284 thiss!1305))))))

(declare-fun b!112072 () Bool)

(declare-fun res!92546 () Bool)

(assert (=> b!112072 (=> (not res!92546) (not e!73533))))

(assert (=> b!112072 (= res!92546 (isPrefixOf!0 thiss!1305 (_2!4892 lt!170427)))))

(assert (= (and d!35748 res!92547) b!112071))

(assert (= (and b!112071 res!92545) b!112072))

(assert (= (and b!112072 res!92546) b!112073))

(assert (= (and b!112073 res!92544) b!112074))

(declare-fun m!167281 () Bool)

(assert (=> d!35748 m!167281))

(declare-fun m!167283 () Bool)

(assert (=> d!35748 m!167283))

(declare-fun m!167285 () Bool)

(assert (=> b!112074 m!167285))

(declare-fun m!167287 () Bool)

(assert (=> b!112074 m!167287))

(assert (=> b!112071 m!167287))

(assert (=> b!112071 m!166863))

(declare-fun m!167289 () Bool)

(assert (=> b!112073 m!167289))

(assert (=> b!112073 m!167289))

(declare-fun m!167291 () Bool)

(assert (=> b!112073 m!167291))

(declare-fun m!167293 () Bool)

(assert (=> b!112072 m!167293))

(assert (=> b!111871 d!35748))

(declare-fun d!35750 () Bool)

(assert (=> d!35750 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!111871 d!35750))

(declare-fun d!35752 () Bool)

(assert (=> d!35752 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305)) lt!169873) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 thiss!1305)) ((_ sign_extend 32) (currentBit!5279 thiss!1305))) lt!169873))))

(declare-fun bs!8715 () Bool)

(assert (= bs!8715 d!35752))

(declare-fun m!167295 () Bool)

(assert (=> bs!8715 m!167295))

(assert (=> b!111871 d!35752))

(declare-fun d!35754 () Bool)

(assert (=> d!35754 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880))) lt!169876) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880)))) lt!169876))))

(declare-fun bs!8716 () Bool)

(assert (= bs!8716 d!35754))

(declare-fun m!167297 () Bool)

(assert (=> bs!8716 m!167297))

(assert (=> b!111871 d!35754))

(declare-fun d!35756 () Bool)

(declare-fun res!92555 () Bool)

(declare-fun e!73539 () Bool)

(assert (=> d!35756 (=> (not res!92555) (not e!73539))))

(assert (=> d!35756 (= res!92555 (= (size!2315 (buf!2718 thiss!1305)) (size!2315 (buf!2718 (_2!4892 lt!169891)))))))

(assert (=> d!35756 (= (isPrefixOf!0 thiss!1305 (_2!4892 lt!169891)) e!73539)))

(declare-fun b!112081 () Bool)

(declare-fun res!92556 () Bool)

(assert (=> b!112081 (=> (not res!92556) (not e!73539))))

(assert (=> b!112081 (= res!92556 (bvsle (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)) (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169891))) (currentByte!5284 (_2!4892 lt!169891)) (currentBit!5279 (_2!4892 lt!169891)))))))

(declare-fun b!112082 () Bool)

(declare-fun e!73538 () Bool)

(assert (=> b!112082 (= e!73539 e!73538)))

(declare-fun res!92554 () Bool)

(assert (=> b!112082 (=> res!92554 e!73538)))

(assert (=> b!112082 (= res!92554 (= (size!2315 (buf!2718 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112083 () Bool)

(assert (=> b!112083 (= e!73538 (arrayBitRangesEq!0 (buf!2718 thiss!1305) (buf!2718 (_2!4892 lt!169891)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305))))))

(assert (= (and d!35756 res!92555) b!112081))

(assert (= (and b!112081 res!92556) b!112082))

(assert (= (and b!112082 (not res!92554)) b!112083))

(assert (=> b!112081 m!166863))

(assert (=> b!112081 m!166921))

(assert (=> b!112083 m!166863))

(assert (=> b!112083 m!166863))

(declare-fun m!167299 () Bool)

(assert (=> b!112083 m!167299))

(assert (=> b!111871 d!35756))

(declare-fun lt!170429 () tuple2!9278)

(declare-fun d!35758 () Bool)

(assert (=> d!35758 (= lt!170429 (readNLeastSignificantBitsLoop!0 (_1!4890 lt!169874) nBits!396 i!615 lt!169875))))

(assert (=> d!35758 (= (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!169874) nBits!396 i!615 lt!169875) (tuple2!9263 (_2!4899 lt!170429) (_1!4899 lt!170429)))))

(declare-fun bs!8717 () Bool)

(assert (= bs!8717 d!35758))

(declare-fun m!167301 () Bool)

(assert (=> bs!8717 m!167301))

(assert (=> b!111871 d!35758))

(declare-fun d!35760 () Bool)

(declare-fun lt!170430 () tuple2!9276)

(assert (=> d!35760 (= lt!170430 (readBit!0 lt!169878))))

(assert (=> d!35760 (= (readBitPure!0 lt!169878) (tuple2!9267 (_2!4898 lt!170430) (_1!4898 lt!170430)))))

(declare-fun bs!8718 () Bool)

(assert (= bs!8718 d!35760))

(declare-fun m!167303 () Bool)

(assert (=> bs!8718 m!167303))

(assert (=> b!111871 d!35760))

(declare-fun d!35762 () Bool)

(assert (=> d!35762 (validate_offset_bits!1 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169880))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169880))) lt!169876)))

(declare-fun lt!170431 () Unit!6849)

(assert (=> d!35762 (= lt!170431 (choose!9 (_2!4892 lt!169880) (buf!2718 (_2!4892 lt!169891)) lt!169876 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880)))))))

(assert (=> d!35762 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4892 lt!169880) (buf!2718 (_2!4892 lt!169891)) lt!169876) lt!170431)))

(declare-fun bs!8719 () Bool)

(assert (= bs!8719 d!35762))

(assert (=> bs!8719 m!166881))

(declare-fun m!167305 () Bool)

(assert (=> bs!8719 m!167305))

(assert (=> b!111871 d!35762))

(declare-fun b!112084 () Bool)

(declare-fun res!92557 () Bool)

(declare-fun e!73540 () Bool)

(assert (=> b!112084 (=> (not res!92557) (not e!73540))))

(declare-fun lt!170445 () tuple2!9260)

(assert (=> b!112084 (= res!92557 (isPrefixOf!0 (_2!4890 lt!170445) (_2!4892 lt!169891)))))

(declare-fun b!112085 () Bool)

(declare-fun e!73541 () Unit!6849)

(declare-fun lt!170446 () Unit!6849)

(assert (=> b!112085 (= e!73541 lt!170446)))

(declare-fun lt!170439 () (_ BitVec 64))

(assert (=> b!112085 (= lt!170439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!170435 () (_ BitVec 64))

(assert (=> b!112085 (= lt!170435 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(assert (=> b!112085 (= lt!170446 (arrayBitRangesEqSymmetric!0 (buf!2718 (_2!4892 lt!169880)) (buf!2718 (_2!4892 lt!169891)) lt!170439 lt!170435))))

(assert (=> b!112085 (arrayBitRangesEq!0 (buf!2718 (_2!4892 lt!169891)) (buf!2718 (_2!4892 lt!169880)) lt!170439 lt!170435)))

(declare-fun d!35764 () Bool)

(assert (=> d!35764 e!73540))

(declare-fun res!92558 () Bool)

(assert (=> d!35764 (=> (not res!92558) (not e!73540))))

(assert (=> d!35764 (= res!92558 (isPrefixOf!0 (_1!4890 lt!170445) (_2!4890 lt!170445)))))

(declare-fun lt!170444 () BitStream!4104)

(assert (=> d!35764 (= lt!170445 (tuple2!9261 lt!170444 (_2!4892 lt!169891)))))

(declare-fun lt!170437 () Unit!6849)

(declare-fun lt!170442 () Unit!6849)

(assert (=> d!35764 (= lt!170437 lt!170442)))

(assert (=> d!35764 (isPrefixOf!0 lt!170444 (_2!4892 lt!169891))))

(assert (=> d!35764 (= lt!170442 (lemmaIsPrefixTransitive!0 lt!170444 (_2!4892 lt!169891) (_2!4892 lt!169891)))))

(declare-fun lt!170440 () Unit!6849)

(declare-fun lt!170432 () Unit!6849)

(assert (=> d!35764 (= lt!170440 lt!170432)))

(assert (=> d!35764 (isPrefixOf!0 lt!170444 (_2!4892 lt!169891))))

(assert (=> d!35764 (= lt!170432 (lemmaIsPrefixTransitive!0 lt!170444 (_2!4892 lt!169880) (_2!4892 lt!169891)))))

(declare-fun lt!170448 () Unit!6849)

(assert (=> d!35764 (= lt!170448 e!73541)))

(declare-fun c!6816 () Bool)

(assert (=> d!35764 (= c!6816 (not (= (size!2315 (buf!2718 (_2!4892 lt!169880))) #b00000000000000000000000000000000)))))

(declare-fun lt!170436 () Unit!6849)

(declare-fun lt!170433 () Unit!6849)

(assert (=> d!35764 (= lt!170436 lt!170433)))

(assert (=> d!35764 (isPrefixOf!0 (_2!4892 lt!169891) (_2!4892 lt!169891))))

(assert (=> d!35764 (= lt!170433 (lemmaIsPrefixRefl!0 (_2!4892 lt!169891)))))

(declare-fun lt!170441 () Unit!6849)

(declare-fun lt!170451 () Unit!6849)

(assert (=> d!35764 (= lt!170441 lt!170451)))

(assert (=> d!35764 (= lt!170451 (lemmaIsPrefixRefl!0 (_2!4892 lt!169891)))))

(declare-fun lt!170449 () Unit!6849)

(declare-fun lt!170434 () Unit!6849)

(assert (=> d!35764 (= lt!170449 lt!170434)))

(assert (=> d!35764 (isPrefixOf!0 lt!170444 lt!170444)))

(assert (=> d!35764 (= lt!170434 (lemmaIsPrefixRefl!0 lt!170444))))

(declare-fun lt!170450 () Unit!6849)

(declare-fun lt!170438 () Unit!6849)

(assert (=> d!35764 (= lt!170450 lt!170438)))

(assert (=> d!35764 (isPrefixOf!0 (_2!4892 lt!169880) (_2!4892 lt!169880))))

(assert (=> d!35764 (= lt!170438 (lemmaIsPrefixRefl!0 (_2!4892 lt!169880)))))

(assert (=> d!35764 (= lt!170444 (BitStream!4105 (buf!2718 (_2!4892 lt!169891)) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(assert (=> d!35764 (isPrefixOf!0 (_2!4892 lt!169880) (_2!4892 lt!169891))))

(assert (=> d!35764 (= (reader!0 (_2!4892 lt!169880) (_2!4892 lt!169891)) lt!170445)))

(declare-fun lt!170447 () (_ BitVec 64))

(declare-fun b!112086 () Bool)

(declare-fun lt!170443 () (_ BitVec 64))

(assert (=> b!112086 (= e!73540 (= (_1!4890 lt!170445) (withMovedBitIndex!0 (_2!4890 lt!170445) (bvsub lt!170447 lt!170443))))))

(assert (=> b!112086 (or (= (bvand lt!170447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170447 lt!170443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!112086 (= lt!170443 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169891))) (currentByte!5284 (_2!4892 lt!169891)) (currentBit!5279 (_2!4892 lt!169891))))))

(assert (=> b!112086 (= lt!170447 (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880))))))

(declare-fun b!112087 () Bool)

(declare-fun Unit!6860 () Unit!6849)

(assert (=> b!112087 (= e!73541 Unit!6860)))

(declare-fun b!112088 () Bool)

(declare-fun res!92559 () Bool)

(assert (=> b!112088 (=> (not res!92559) (not e!73540))))

(assert (=> b!112088 (= res!92559 (isPrefixOf!0 (_1!4890 lt!170445) (_2!4892 lt!169880)))))

(assert (= (and d!35764 c!6816) b!112085))

(assert (= (and d!35764 (not c!6816)) b!112087))

(assert (= (and d!35764 res!92558) b!112088))

(assert (= (and b!112088 res!92559) b!112084))

(assert (= (and b!112084 res!92557) b!112086))

(declare-fun m!167307 () Bool)

(assert (=> b!112084 m!167307))

(declare-fun m!167309 () Bool)

(assert (=> b!112088 m!167309))

(declare-fun m!167311 () Bool)

(assert (=> b!112086 m!167311))

(assert (=> b!112086 m!166921))

(assert (=> b!112086 m!166861))

(assert (=> b!112085 m!166861))

(declare-fun m!167313 () Bool)

(assert (=> b!112085 m!167313))

(declare-fun m!167315 () Bool)

(assert (=> b!112085 m!167315))

(declare-fun m!167317 () Bool)

(assert (=> d!35764 m!167317))

(assert (=> d!35764 m!167249))

(declare-fun m!167319 () Bool)

(assert (=> d!35764 m!167319))

(declare-fun m!167321 () Bool)

(assert (=> d!35764 m!167321))

(declare-fun m!167323 () Bool)

(assert (=> d!35764 m!167323))

(declare-fun m!167325 () Bool)

(assert (=> d!35764 m!167325))

(declare-fun m!167327 () Bool)

(assert (=> d!35764 m!167327))

(assert (=> d!35764 m!167261))

(declare-fun m!167329 () Bool)

(assert (=> d!35764 m!167329))

(declare-fun m!167331 () Bool)

(assert (=> d!35764 m!167331))

(declare-fun m!167333 () Bool)

(assert (=> d!35764 m!167333))

(assert (=> b!111871 d!35764))

(declare-fun d!35766 () Bool)

(declare-fun res!92561 () Bool)

(declare-fun e!73543 () Bool)

(assert (=> d!35766 (=> (not res!92561) (not e!73543))))

(assert (=> d!35766 (= res!92561 (= (size!2315 (buf!2718 thiss!1305)) (size!2315 (buf!2718 (_2!4892 lt!169880)))))))

(assert (=> d!35766 (= (isPrefixOf!0 thiss!1305 (_2!4892 lt!169880)) e!73543)))

(declare-fun b!112089 () Bool)

(declare-fun res!92562 () Bool)

(assert (=> b!112089 (=> (not res!92562) (not e!73543))))

(assert (=> b!112089 (= res!92562 (bvsle (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305)) (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169880))) (currentByte!5284 (_2!4892 lt!169880)) (currentBit!5279 (_2!4892 lt!169880)))))))

(declare-fun b!112090 () Bool)

(declare-fun e!73542 () Bool)

(assert (=> b!112090 (= e!73543 e!73542)))

(declare-fun res!92560 () Bool)

(assert (=> b!112090 (=> res!92560 e!73542)))

(assert (=> b!112090 (= res!92560 (= (size!2315 (buf!2718 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!112091 () Bool)

(assert (=> b!112091 (= e!73542 (arrayBitRangesEq!0 (buf!2718 thiss!1305) (buf!2718 (_2!4892 lt!169880)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2315 (buf!2718 thiss!1305)) (currentByte!5284 thiss!1305) (currentBit!5279 thiss!1305))))))

(assert (= (and d!35766 res!92561) b!112089))

(assert (= (and b!112089 res!92562) b!112090))

(assert (= (and b!112090 (not res!92560)) b!112091))

(assert (=> b!112089 m!166863))

(assert (=> b!112089 m!166861))

(assert (=> b!112091 m!166863))

(assert (=> b!112091 m!166863))

(declare-fun m!167335 () Bool)

(assert (=> b!112091 m!167335))

(assert (=> b!111882 d!35766))

(assert (=> b!111883 d!35646))

(declare-fun d!35768 () Bool)

(declare-fun lt!170467 () tuple2!9262)

(declare-fun lt!170464 () tuple2!9262)

(assert (=> d!35768 (and (= (_2!4891 lt!170467) (_2!4891 lt!170464)) (= (_1!4891 lt!170467) (_1!4891 lt!170464)))))

(declare-fun lt!170465 () (_ BitVec 64))

(declare-fun lt!170468 () Bool)

(declare-fun lt!170466 () BitStream!4104)

(declare-fun lt!170469 () Unit!6849)

(declare-fun choose!45 (BitStream!4104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!9262 tuple2!9262 BitStream!4104 (_ BitVec 64) Bool BitStream!4104 (_ BitVec 64) tuple2!9262 tuple2!9262 BitStream!4104 (_ BitVec 64)) Unit!6849)

(assert (=> d!35768 (= lt!170469 (choose!45 (_1!4890 lt!169874) nBits!396 i!615 lt!169875 lt!170467 (tuple2!9263 (_1!4891 lt!170467) (_2!4891 lt!170467)) (_1!4891 lt!170467) (_2!4891 lt!170467) lt!170468 lt!170466 lt!170465 lt!170464 (tuple2!9263 (_1!4891 lt!170464) (_2!4891 lt!170464)) (_1!4891 lt!170464) (_2!4891 lt!170464)))))

(assert (=> d!35768 (= lt!170464 (readNLeastSignificantBitsLoopPure!0 lt!170466 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!170465))))

(assert (=> d!35768 (= lt!170465 (bvor lt!169875 (ite lt!170468 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35768 (= lt!170466 (withMovedBitIndex!0 (_1!4890 lt!169874) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!35768 (= lt!170468 (_2!4893 (readBitPure!0 (_1!4890 lt!169874))))))

(assert (=> d!35768 (= lt!170467 (readNLeastSignificantBitsLoopPure!0 (_1!4890 lt!169874) nBits!396 i!615 lt!169875))))

(assert (=> d!35768 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4890 lt!169874) nBits!396 i!615 lt!169875) lt!170469)))

(declare-fun bs!8721 () Bool)

(assert (= bs!8721 d!35768))

(assert (=> bs!8721 m!166917))

(assert (=> bs!8721 m!166891))

(assert (=> bs!8721 m!166895))

(declare-fun m!167337 () Bool)

(assert (=> bs!8721 m!167337))

(declare-fun m!167339 () Bool)

(assert (=> bs!8721 m!167339))

(assert (=> b!111883 d!35768))

(declare-fun lt!170470 () tuple2!9278)

(declare-fun d!35770 () Bool)

(assert (=> d!35770 (= lt!170470 (readNLeastSignificantBitsLoop!0 lt!169895 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169879))))

(assert (=> d!35770 (= (readNLeastSignificantBitsLoopPure!0 lt!169895 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!169879) (tuple2!9263 (_2!4899 lt!170470) (_1!4899 lt!170470)))))

(declare-fun bs!8722 () Bool)

(assert (= bs!8722 d!35770))

(declare-fun m!167341 () Bool)

(assert (=> bs!8722 m!167341))

(assert (=> b!111883 d!35770))

(declare-fun d!35772 () Bool)

(declare-fun e!73546 () Bool)

(assert (=> d!35772 e!73546))

(declare-fun res!92565 () Bool)

(assert (=> d!35772 (=> (not res!92565) (not e!73546))))

(declare-fun lt!170476 () (_ BitVec 64))

(declare-fun lt!170475 () BitStream!4104)

(assert (=> d!35772 (= res!92565 (= (bvadd lt!170476 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2315 (buf!2718 lt!170475)) (currentByte!5284 lt!170475) (currentBit!5279 lt!170475))))))

(assert (=> d!35772 (or (not (= (bvand lt!170476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170476 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170476 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35772 (= lt!170476 (bitIndex!0 (size!2315 (buf!2718 (_1!4890 lt!169874))) (currentByte!5284 (_1!4890 lt!169874)) (currentBit!5279 (_1!4890 lt!169874))))))

(declare-fun moveBitIndex!0 (BitStream!4104 (_ BitVec 64)) tuple2!9264)

(assert (=> d!35772 (= lt!170475 (_2!4892 (moveBitIndex!0 (_1!4890 lt!169874) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4104 (_ BitVec 64)) Bool)

(assert (=> d!35772 (moveBitIndexPrecond!0 (_1!4890 lt!169874) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!35772 (= (withMovedBitIndex!0 (_1!4890 lt!169874) #b0000000000000000000000000000000000000000000000000000000000000001) lt!170475)))

(declare-fun b!112094 () Bool)

(assert (=> b!112094 (= e!73546 (= (size!2315 (buf!2718 (_1!4890 lt!169874))) (size!2315 (buf!2718 lt!170475))))))

(assert (= (and d!35772 res!92565) b!112094))

(declare-fun m!167343 () Bool)

(assert (=> d!35772 m!167343))

(declare-fun m!167345 () Bool)

(assert (=> d!35772 m!167345))

(declare-fun m!167347 () Bool)

(assert (=> d!35772 m!167347))

(declare-fun m!167349 () Bool)

(assert (=> d!35772 m!167349))

(assert (=> b!111883 d!35772))

(declare-fun d!35774 () Bool)

(declare-fun e!73547 () Bool)

(assert (=> d!35774 e!73547))

(declare-fun res!92566 () Bool)

(assert (=> d!35774 (=> (not res!92566) (not e!73547))))

(declare-fun lt!170477 () BitStream!4104)

(declare-fun lt!170478 () (_ BitVec 64))

(assert (=> d!35774 (= res!92566 (= (bvadd lt!170478 (bvsub lt!169892 lt!169897)) (bitIndex!0 (size!2315 (buf!2718 lt!170477)) (currentByte!5284 lt!170477) (currentBit!5279 lt!170477))))))

(assert (=> d!35774 (or (not (= (bvand lt!170478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169892 lt!169897) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170478 (bvsub lt!169892 lt!169897)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35774 (= lt!170478 (bitIndex!0 (size!2315 (buf!2718 (_2!4890 lt!169889))) (currentByte!5284 (_2!4890 lt!169889)) (currentBit!5279 (_2!4890 lt!169889))))))

(assert (=> d!35774 (= lt!170477 (_2!4892 (moveBitIndex!0 (_2!4890 lt!169889) (bvsub lt!169892 lt!169897))))))

(assert (=> d!35774 (moveBitIndexPrecond!0 (_2!4890 lt!169889) (bvsub lt!169892 lt!169897))))

(assert (=> d!35774 (= (withMovedBitIndex!0 (_2!4890 lt!169889) (bvsub lt!169892 lt!169897)) lt!170477)))

(declare-fun b!112095 () Bool)

(assert (=> b!112095 (= e!73547 (= (size!2315 (buf!2718 (_2!4890 lt!169889))) (size!2315 (buf!2718 lt!170477))))))

(assert (= (and d!35774 res!92566) b!112095))

(declare-fun m!167351 () Bool)

(assert (=> d!35774 m!167351))

(declare-fun m!167353 () Bool)

(assert (=> d!35774 m!167353))

(declare-fun m!167355 () Bool)

(assert (=> d!35774 m!167355))

(declare-fun m!167357 () Bool)

(assert (=> d!35774 m!167357))

(assert (=> b!111883 d!35774))

(declare-fun d!35776 () Bool)

(declare-fun e!73548 () Bool)

(assert (=> d!35776 e!73548))

(declare-fun res!92568 () Bool)

(assert (=> d!35776 (=> (not res!92568) (not e!73548))))

(declare-fun lt!170484 () (_ BitVec 64))

(declare-fun lt!170480 () (_ BitVec 64))

(declare-fun lt!170483 () (_ BitVec 64))

(assert (=> d!35776 (= res!92568 (= lt!170483 (bvsub lt!170480 lt!170484)))))

(assert (=> d!35776 (or (= (bvand lt!170480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!170484 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!170480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!170480 lt!170484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35776 (= lt!170484 (remainingBits!0 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))) ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169891))) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169891)))))))

(declare-fun lt!170479 () (_ BitVec 64))

(declare-fun lt!170481 () (_ BitVec 64))

(assert (=> d!35776 (= lt!170480 (bvmul lt!170479 lt!170481))))

(assert (=> d!35776 (or (= lt!170479 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!170481 (bvsdiv (bvmul lt!170479 lt!170481) lt!170479)))))

(assert (=> d!35776 (= lt!170481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!35776 (= lt!170479 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))))))

(assert (=> d!35776 (= lt!170483 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5284 (_2!4892 lt!169891))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5279 (_2!4892 lt!169891)))))))

(assert (=> d!35776 (invariant!0 (currentBit!5279 (_2!4892 lt!169891)) (currentByte!5284 (_2!4892 lt!169891)) (size!2315 (buf!2718 (_2!4892 lt!169891))))))

(assert (=> d!35776 (= (bitIndex!0 (size!2315 (buf!2718 (_2!4892 lt!169891))) (currentByte!5284 (_2!4892 lt!169891)) (currentBit!5279 (_2!4892 lt!169891))) lt!170483)))

(declare-fun b!112096 () Bool)

(declare-fun res!92567 () Bool)

(assert (=> b!112096 (=> (not res!92567) (not e!73548))))

(assert (=> b!112096 (= res!92567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!170483))))

(declare-fun b!112097 () Bool)

(declare-fun lt!170482 () (_ BitVec 64))

(assert (=> b!112097 (= e!73548 (bvsle lt!170483 (bvmul lt!170482 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!112097 (or (= lt!170482 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!170482 #b0000000000000000000000000000000000000000000000000000000000001000) lt!170482)))))

(assert (=> b!112097 (= lt!170482 ((_ sign_extend 32) (size!2315 (buf!2718 (_2!4892 lt!169891)))))))

(assert (= (and d!35776 res!92568) b!112096))

(assert (= (and b!112096 res!92567) b!112097))

(declare-fun m!167359 () Bool)

(assert (=> d!35776 m!167359))

(declare-fun m!167361 () Bool)

(assert (=> d!35776 m!167361))

(assert (=> b!111883 d!35776))

(declare-fun d!35778 () Bool)

(declare-fun e!73549 () Bool)

(assert (=> d!35778 e!73549))

(declare-fun res!92569 () Bool)

(assert (=> d!35778 (=> (not res!92569) (not e!73549))))

(declare-fun lt!170485 () BitStream!4104)

(declare-fun lt!170486 () (_ BitVec 64))

(assert (=> d!35778 (= res!92569 (= (bvadd lt!170486 (bvsub lt!169898 lt!169897)) (bitIndex!0 (size!2315 (buf!2718 lt!170485)) (currentByte!5284 lt!170485) (currentBit!5279 lt!170485))))))

(assert (=> d!35778 (or (not (= (bvand lt!170486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!169898 lt!169897) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!170486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!170486 (bvsub lt!169898 lt!169897)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!35778 (= lt!170486 (bitIndex!0 (size!2315 (buf!2718 (_2!4890 lt!169874))) (currentByte!5284 (_2!4890 lt!169874)) (currentBit!5279 (_2!4890 lt!169874))))))

(assert (=> d!35778 (= lt!170485 (_2!4892 (moveBitIndex!0 (_2!4890 lt!169874) (bvsub lt!169898 lt!169897))))))

(assert (=> d!35778 (moveBitIndexPrecond!0 (_2!4890 lt!169874) (bvsub lt!169898 lt!169897))))

(assert (=> d!35778 (= (withMovedBitIndex!0 (_2!4890 lt!169874) (bvsub lt!169898 lt!169897)) lt!170485)))

(declare-fun b!112098 () Bool)

(assert (=> b!112098 (= e!73549 (= (size!2315 (buf!2718 (_2!4890 lt!169874))) (size!2315 (buf!2718 lt!170485))))))

(assert (= (and d!35778 res!92569) b!112098))

(declare-fun m!167363 () Bool)

(assert (=> d!35778 m!167363))

(declare-fun m!167365 () Bool)

(assert (=> d!35778 m!167365))

(declare-fun m!167367 () Bool)

(assert (=> d!35778 m!167367))

(declare-fun m!167369 () Bool)

(assert (=> d!35778 m!167369))

(assert (=> b!111883 d!35778))

(assert (=> b!111883 d!35648))

(check-sat (not b!112083) (not b!112028) (not b!112074) (not d!35658) (not b!112018) (not d!35744) (not d!35662) (not d!35748) (not b!112016) (not d!35660) (not bm!1416) (not d!35754) (not d!35668) (not b!112086) (not d!35666) (not b!111938) (not d!35640) (not d!35760) (not d!35672) (not d!35664) (not b!112024) (not b!112052) (not b!112084) (not d!35650) (not b!112072) (not d!35774) (not b!112073) (not d!35670) (not b!112091) (not b!112026) (not b!112081) (not b!112056) (not d!35762) (not b!112021) (not d!35764) (not d!35746) (not b!112019) (not d!35752) (not b!112089) (not b!112088) (not d!35768) (not b!112054) (not b!112071) (not b!112053) (not d!35772) (not d!35776) (not d!35656) (not d!35770) (not d!35740) (not b!112022) (not b!112027) (not d!35648) (not b!112020) (not b!112085) (not d!35778) (not d!35758) (not d!35646))
(check-sat)
