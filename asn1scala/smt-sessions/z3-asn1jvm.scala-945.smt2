; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26742 () Bool)

(assert start!26742)

(declare-fun b!137930 () Bool)

(declare-fun res!114918 () Bool)

(declare-fun e!91709 () Bool)

(assert (=> b!137930 (=> (not res!114918) (not e!91709))))

(declare-datatypes ((array!6251 0))(
  ( (array!6252 (arr!3517 (Array (_ BitVec 32) (_ BitVec 8))) (size!2831 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4926 0))(
  ( (BitStream!4927 (buf!3238 array!6251) (currentByte!6045 (_ BitVec 32)) (currentBit!6040 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8609 0))(
  ( (Unit!8610) )
))
(declare-datatypes ((tuple2!12058 0))(
  ( (tuple2!12059 (_1!6352 Unit!8609) (_2!6352 BitStream!4926)) )
))
(declare-fun lt!215018 () tuple2!12058)

(declare-fun lt!215012 () tuple2!12058)

(declare-fun isPrefixOf!0 (BitStream!4926 BitStream!4926) Bool)

(assert (=> b!137930 (= res!114918 (isPrefixOf!0 (_2!6352 lt!215018) (_2!6352 lt!215012)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!91711 () Bool)

(declare-fun arr!237 () array!6251)

(declare-datatypes ((tuple2!12060 0))(
  ( (tuple2!12061 (_1!6353 BitStream!4926) (_2!6353 array!6251)) )
))
(declare-fun lt!215023 () tuple2!12060)

(declare-fun b!137931 () Bool)

(declare-fun arrayRangesEq!234 (array!6251 array!6251 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137931 (= e!91711 (not (arrayRangesEq!234 arr!237 (_2!6353 lt!215023) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137932 () Bool)

(declare-fun e!91713 () Bool)

(declare-fun thiss!1634 () BitStream!4926)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137932 (= e!91713 (invariant!0 (currentBit!6040 thiss!1634) (currentByte!6045 thiss!1634) (size!2831 (buf!3238 (_2!6352 lt!215018)))))))

(declare-fun b!137933 () Bool)

(declare-fun e!91704 () Bool)

(declare-fun e!91706 () Bool)

(assert (=> b!137933 (= e!91704 e!91706)))

(declare-fun res!114917 () Bool)

(assert (=> b!137933 (=> res!114917 e!91706)))

(declare-fun lt!215019 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137933 (= res!114917 (not (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012))) (bvadd (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!215019)))))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!137933 (= lt!215019 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!137934 () Bool)

(declare-fun res!114925 () Bool)

(declare-fun e!91716 () Bool)

(assert (=> b!137934 (=> (not res!114925) (not e!91716))))

(assert (=> b!137934 (= res!114925 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215018)))))

(declare-datatypes ((tuple2!12062 0))(
  ( (tuple2!12063 (_1!6354 BitStream!4926) (_2!6354 BitStream!4926)) )
))
(declare-fun lt!215021 () tuple2!12062)

(declare-fun b!137935 () Bool)

(declare-datatypes ((tuple2!12064 0))(
  ( (tuple2!12065 (_1!6355 BitStream!4926) (_2!6355 (_ BitVec 8))) )
))
(declare-fun lt!215034 () tuple2!12064)

(assert (=> b!137935 (= e!91716 (and (= (_2!6355 lt!215034) (select (arr!3517 arr!237) from!447)) (= (_1!6355 lt!215034) (_2!6354 lt!215021))))))

(declare-fun readBytePure!0 (BitStream!4926) tuple2!12064)

(assert (=> b!137935 (= lt!215034 (readBytePure!0 (_1!6354 lt!215021)))))

(declare-fun reader!0 (BitStream!4926 BitStream!4926) tuple2!12062)

(assert (=> b!137935 (= lt!215021 (reader!0 thiss!1634 (_2!6352 lt!215018)))))

(declare-fun b!137936 () Bool)

(declare-fun res!114921 () Bool)

(declare-fun e!91707 () Bool)

(assert (=> b!137936 (=> (not res!114921) (not e!91707))))

(assert (=> b!137936 (= res!114921 (bvslt from!447 to!404))))

(declare-fun res!114915 () Bool)

(assert (=> start!26742 (=> (not res!114915) (not e!91707))))

(assert (=> start!26742 (= res!114915 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2831 arr!237))))))

(assert (=> start!26742 e!91707))

(assert (=> start!26742 true))

(declare-fun array_inv!2620 (array!6251) Bool)

(assert (=> start!26742 (array_inv!2620 arr!237)))

(declare-fun e!91705 () Bool)

(declare-fun inv!12 (BitStream!4926) Bool)

(assert (=> start!26742 (and (inv!12 thiss!1634) e!91705)))

(declare-fun b!137937 () Bool)

(declare-fun e!91715 () Bool)

(assert (=> b!137937 (= e!91715 e!91704)))

(declare-fun res!114916 () Bool)

(assert (=> b!137937 (=> res!114916 e!91704)))

(assert (=> b!137937 (= res!114916 (not (= (size!2831 (buf!3238 thiss!1634)) (size!2831 (buf!3238 (_2!6352 lt!215012))))))))

(declare-fun lt!215024 () tuple2!12060)

(assert (=> b!137937 (arrayRangesEq!234 arr!237 (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215035 () tuple2!12060)

(declare-fun lt!215032 () Unit!8609)

(declare-fun arrayRangesEqTransitive!36 (array!6251 array!6251 array!6251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!137937 (= lt!215032 (arrayRangesEqTransitive!36 arr!237 (_2!6353 lt!215035) (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137937 (arrayRangesEq!234 (_2!6353 lt!215035) (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215030 () Unit!8609)

(declare-fun arrayRangesEqSymmetricLemma!47 (array!6251 array!6251 (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!137937 (= lt!215030 (arrayRangesEqSymmetricLemma!47 (_2!6353 lt!215024) (_2!6353 lt!215035) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137938 () Bool)

(assert (=> b!137938 (= e!91705 (array_inv!2620 (buf!3238 thiss!1634)))))

(declare-fun b!137939 () Bool)

(assert (=> b!137939 (= e!91707 (not e!91715))))

(declare-fun res!114919 () Bool)

(assert (=> b!137939 (=> res!114919 e!91715)))

(assert (=> b!137939 (= res!114919 (not (arrayRangesEq!234 (_2!6353 lt!215024) (_2!6353 lt!215035) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!215040 () tuple2!12060)

(assert (=> b!137939 (arrayRangesEq!234 (_2!6353 lt!215024) (_2!6353 lt!215040) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215017 () tuple2!12062)

(declare-fun lt!215020 () Unit!8609)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4926 array!6251 (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!137939 (= lt!215020 (readByteArrayLoopArrayPrefixLemma!0 (_1!6354 lt!215017) arr!237 from!447 to!404))))

(declare-fun lt!215038 () array!6251)

(declare-fun readByteArrayLoopPure!0 (BitStream!4926 array!6251 (_ BitVec 32) (_ BitVec 32)) tuple2!12060)

(declare-fun withMovedByteIndex!0 (BitStream!4926 (_ BitVec 32)) BitStream!4926)

(assert (=> b!137939 (= lt!215040 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6354 lt!215017) #b00000000000000000000000000000001) lt!215038 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215037 () tuple2!12062)

(assert (=> b!137939 (= lt!215035 (readByteArrayLoopPure!0 (_1!6354 lt!215037) lt!215038 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215013 () tuple2!12064)

(assert (=> b!137939 (= lt!215038 (array!6252 (store (arr!3517 arr!237) from!447 (_2!6355 lt!215013)) (size!2831 arr!237)))))

(declare-fun lt!215033 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137939 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215033)))

(declare-fun lt!215026 () Unit!8609)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4926 array!6251 (_ BitVec 32)) Unit!8609)

(assert (=> b!137939 (= lt!215026 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215012)) lt!215033))))

(assert (=> b!137939 (= (_1!6353 lt!215024) (_2!6354 lt!215017))))

(assert (=> b!137939 (= lt!215024 (readByteArrayLoopPure!0 (_1!6354 lt!215017) arr!237 from!447 to!404))))

(assert (=> b!137939 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!215031 () Unit!8609)

(assert (=> b!137939 (= lt!215031 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3238 (_2!6352 lt!215012)) (bvsub to!404 from!447)))))

(assert (=> b!137939 (= (_2!6355 lt!215013) (select (arr!3517 arr!237) from!447))))

(assert (=> b!137939 (= lt!215013 (readBytePure!0 (_1!6354 lt!215017)))))

(assert (=> b!137939 (= lt!215037 (reader!0 (_2!6352 lt!215018) (_2!6352 lt!215012)))))

(assert (=> b!137939 (= lt!215017 (reader!0 thiss!1634 (_2!6352 lt!215012)))))

(declare-fun e!91712 () Bool)

(assert (=> b!137939 e!91712))

(declare-fun res!114927 () Bool)

(assert (=> b!137939 (=> (not res!114927) (not e!91712))))

(declare-fun lt!215014 () tuple2!12064)

(declare-fun lt!215029 () tuple2!12064)

(assert (=> b!137939 (= res!114927 (= (bitIndex!0 (size!2831 (buf!3238 (_1!6355 lt!215014))) (currentByte!6045 (_1!6355 lt!215014)) (currentBit!6040 (_1!6355 lt!215014))) (bitIndex!0 (size!2831 (buf!3238 (_1!6355 lt!215029))) (currentByte!6045 (_1!6355 lt!215029)) (currentBit!6040 (_1!6355 lt!215029)))))))

(declare-fun lt!215016 () Unit!8609)

(declare-fun lt!215028 () BitStream!4926)

(declare-fun readBytePrefixLemma!0 (BitStream!4926 BitStream!4926) Unit!8609)

(assert (=> b!137939 (= lt!215016 (readBytePrefixLemma!0 lt!215028 (_2!6352 lt!215012)))))

(assert (=> b!137939 (= lt!215029 (readBytePure!0 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))))))

(assert (=> b!137939 (= lt!215014 (readBytePure!0 lt!215028))))

(assert (=> b!137939 (= lt!215028 (BitStream!4927 (buf!3238 (_2!6352 lt!215018)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(assert (=> b!137939 e!91713))

(declare-fun res!114912 () Bool)

(assert (=> b!137939 (=> (not res!114912) (not e!91713))))

(assert (=> b!137939 (= res!114912 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215012)))))

(declare-fun lt!215039 () Unit!8609)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4926 BitStream!4926 BitStream!4926) Unit!8609)

(assert (=> b!137939 (= lt!215039 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6352 lt!215018) (_2!6352 lt!215012)))))

(declare-fun e!91710 () Bool)

(assert (=> b!137939 e!91710))

(declare-fun res!114914 () Bool)

(assert (=> b!137939 (=> (not res!114914) (not e!91710))))

(assert (=> b!137939 (= res!114914 (= (size!2831 (buf!3238 (_2!6352 lt!215018))) (size!2831 (buf!3238 (_2!6352 lt!215012)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4926 array!6251 (_ BitVec 32) (_ BitVec 32)) tuple2!12058)

(assert (=> b!137939 (= lt!215012 (appendByteArrayLoop!0 (_2!6352 lt!215018) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137939 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215033)))

(assert (=> b!137939 (= lt!215033 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!215036 () Unit!8609)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4926 BitStream!4926 (_ BitVec 64) (_ BitVec 32)) Unit!8609)

(assert (=> b!137939 (= lt!215036 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6352 lt!215018) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!137939 e!91716))

(declare-fun res!114923 () Bool)

(assert (=> b!137939 (=> (not res!114923) (not e!91716))))

(assert (=> b!137939 (= res!114923 (= (size!2831 (buf!3238 thiss!1634)) (size!2831 (buf!3238 (_2!6352 lt!215018)))))))

(declare-fun appendByte!0 (BitStream!4926 (_ BitVec 8)) tuple2!12058)

(assert (=> b!137939 (= lt!215018 (appendByte!0 thiss!1634 (select (arr!3517 arr!237) from!447)))))

(declare-fun b!137940 () Bool)

(declare-fun res!114926 () Bool)

(assert (=> b!137940 (=> (not res!114926) (not e!91707))))

(assert (=> b!137940 (= res!114926 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137941 () Bool)

(assert (=> b!137941 (= e!91709 (not e!91711))))

(declare-fun res!114913 () Bool)

(assert (=> b!137941 (=> res!114913 e!91711)))

(declare-fun lt!215015 () tuple2!12062)

(assert (=> b!137941 (= res!114913 (or (not (= (size!2831 (_2!6353 lt!215023)) (size!2831 arr!237))) (not (= (_1!6353 lt!215023) (_2!6354 lt!215015)))))))

(assert (=> b!137941 (= lt!215023 (readByteArrayLoopPure!0 (_1!6354 lt!215015) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215025 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137941 (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215025)))

(declare-fun lt!215022 () Unit!8609)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4926 array!6251 (_ BitVec 64)) Unit!8609)

(assert (=> b!137941 (= lt!215022 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215012)) lt!215025))))

(assert (=> b!137941 (= lt!215015 (reader!0 (_2!6352 lt!215018) (_2!6352 lt!215012)))))

(declare-fun b!137942 () Bool)

(assert (=> b!137942 (= e!91706 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6354 lt!215017)))) ((_ sign_extend 32) (currentByte!6045 (_1!6354 lt!215017))) ((_ sign_extend 32) (currentBit!6040 (_1!6354 lt!215017))) (bvsub to!404 from!447)))))

(assert (=> b!137942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) lt!215019)))

(declare-fun lt!215027 () Unit!8609)

(assert (=> b!137942 (= lt!215027 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3238 (_2!6352 lt!215012)) lt!215019))))

(declare-fun b!137943 () Bool)

(declare-fun res!114920 () Bool)

(assert (=> b!137943 (=> (not res!114920) (not e!91716))))

(assert (=> b!137943 (= res!114920 (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))))

(declare-fun b!137944 () Bool)

(assert (=> b!137944 (= e!91710 e!91709)))

(declare-fun res!114922 () Bool)

(assert (=> b!137944 (=> (not res!114922) (not e!91709))))

(assert (=> b!137944 (= res!114922 (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012))) (bvadd (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!215025))))))

(assert (=> b!137944 (= lt!215025 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137945 () Bool)

(declare-fun res!114924 () Bool)

(assert (=> b!137945 (=> (not res!114924) (not e!91707))))

(assert (=> b!137945 (= res!114924 (invariant!0 (currentBit!6040 thiss!1634) (currentByte!6045 thiss!1634) (size!2831 (buf!3238 thiss!1634))))))

(declare-fun b!137946 () Bool)

(assert (=> b!137946 (= e!91712 (= (_2!6355 lt!215014) (_2!6355 lt!215029)))))

(assert (= (and start!26742 res!114915) b!137940))

(assert (= (and b!137940 res!114926) b!137936))

(assert (= (and b!137936 res!114921) b!137945))

(assert (= (and b!137945 res!114924) b!137939))

(assert (= (and b!137939 res!114923) b!137943))

(assert (= (and b!137943 res!114920) b!137934))

(assert (= (and b!137934 res!114925) b!137935))

(assert (= (and b!137939 res!114914) b!137944))

(assert (= (and b!137944 res!114922) b!137930))

(assert (= (and b!137930 res!114918) b!137941))

(assert (= (and b!137941 (not res!114913)) b!137931))

(assert (= (and b!137939 res!114912) b!137932))

(assert (= (and b!137939 res!114927) b!137946))

(assert (= (and b!137939 (not res!114919)) b!137937))

(assert (= (and b!137937 (not res!114916)) b!137933))

(assert (= (and b!137933 (not res!114917)) b!137942))

(assert (= start!26742 b!137938))

(declare-fun m!211937 () Bool)

(assert (=> b!137934 m!211937))

(declare-fun m!211939 () Bool)

(assert (=> b!137930 m!211939))

(declare-fun m!211941 () Bool)

(assert (=> b!137935 m!211941))

(declare-fun m!211943 () Bool)

(assert (=> b!137935 m!211943))

(declare-fun m!211945 () Bool)

(assert (=> b!137935 m!211945))

(declare-fun m!211947 () Bool)

(assert (=> b!137941 m!211947))

(declare-fun m!211949 () Bool)

(assert (=> b!137941 m!211949))

(declare-fun m!211951 () Bool)

(assert (=> b!137941 m!211951))

(declare-fun m!211953 () Bool)

(assert (=> b!137941 m!211953))

(declare-fun m!211955 () Bool)

(assert (=> start!26742 m!211955))

(declare-fun m!211957 () Bool)

(assert (=> start!26742 m!211957))

(declare-fun m!211959 () Bool)

(assert (=> b!137933 m!211959))

(declare-fun m!211961 () Bool)

(assert (=> b!137933 m!211961))

(assert (=> b!137944 m!211959))

(declare-fun m!211963 () Bool)

(assert (=> b!137944 m!211963))

(assert (=> b!137943 m!211963))

(assert (=> b!137943 m!211961))

(declare-fun m!211965 () Bool)

(assert (=> b!137932 m!211965))

(declare-fun m!211967 () Bool)

(assert (=> b!137938 m!211967))

(declare-fun m!211969 () Bool)

(assert (=> b!137937 m!211969))

(declare-fun m!211971 () Bool)

(assert (=> b!137937 m!211971))

(declare-fun m!211973 () Bool)

(assert (=> b!137937 m!211973))

(declare-fun m!211975 () Bool)

(assert (=> b!137937 m!211975))

(declare-fun m!211977 () Bool)

(assert (=> b!137939 m!211977))

(declare-fun m!211979 () Bool)

(assert (=> b!137939 m!211979))

(declare-fun m!211981 () Bool)

(assert (=> b!137939 m!211981))

(declare-fun m!211983 () Bool)

(assert (=> b!137939 m!211983))

(declare-fun m!211985 () Bool)

(assert (=> b!137939 m!211985))

(declare-fun m!211987 () Bool)

(assert (=> b!137939 m!211987))

(declare-fun m!211989 () Bool)

(assert (=> b!137939 m!211989))

(declare-fun m!211991 () Bool)

(assert (=> b!137939 m!211991))

(declare-fun m!211993 () Bool)

(assert (=> b!137939 m!211993))

(assert (=> b!137939 m!211993))

(declare-fun m!211995 () Bool)

(assert (=> b!137939 m!211995))

(declare-fun m!211997 () Bool)

(assert (=> b!137939 m!211997))

(declare-fun m!211999 () Bool)

(assert (=> b!137939 m!211999))

(declare-fun m!212001 () Bool)

(assert (=> b!137939 m!212001))

(declare-fun m!212003 () Bool)

(assert (=> b!137939 m!212003))

(assert (=> b!137939 m!211953))

(declare-fun m!212005 () Bool)

(assert (=> b!137939 m!212005))

(declare-fun m!212007 () Bool)

(assert (=> b!137939 m!212007))

(declare-fun m!212009 () Bool)

(assert (=> b!137939 m!212009))

(declare-fun m!212011 () Bool)

(assert (=> b!137939 m!212011))

(declare-fun m!212013 () Bool)

(assert (=> b!137939 m!212013))

(declare-fun m!212015 () Bool)

(assert (=> b!137939 m!212015))

(declare-fun m!212017 () Bool)

(assert (=> b!137939 m!212017))

(declare-fun m!212019 () Bool)

(assert (=> b!137939 m!212019))

(assert (=> b!137939 m!211941))

(declare-fun m!212021 () Bool)

(assert (=> b!137939 m!212021))

(declare-fun m!212023 () Bool)

(assert (=> b!137939 m!212023))

(declare-fun m!212025 () Bool)

(assert (=> b!137939 m!212025))

(assert (=> b!137939 m!211941))

(declare-fun m!212027 () Bool)

(assert (=> b!137942 m!212027))

(declare-fun m!212029 () Bool)

(assert (=> b!137942 m!212029))

(declare-fun m!212031 () Bool)

(assert (=> b!137942 m!212031))

(declare-fun m!212033 () Bool)

(assert (=> b!137931 m!212033))

(declare-fun m!212035 () Bool)

(assert (=> b!137945 m!212035))

(declare-fun m!212037 () Bool)

(assert (=> b!137940 m!212037))

(check-sat (not b!137944) (not b!137930) (not b!137940) (not b!137943) (not b!137933) (not start!26742) (not b!137941) (not b!137932) (not b!137935) (not b!137934) (not b!137945) (not b!137939) (not b!137938) (not b!137937) (not b!137942) (not b!137931))
(check-sat)
(get-model)

(declare-fun d!44496 () Bool)

(declare-fun res!115158 () Bool)

(declare-fun e!91879 () Bool)

(assert (=> d!44496 (=> (not res!115158) (not e!91879))))

(assert (=> d!44496 (= res!115158 (= (size!2831 (buf!3238 (_2!6352 lt!215018))) (size!2831 (buf!3238 (_2!6352 lt!215012)))))))

(assert (=> d!44496 (= (isPrefixOf!0 (_2!6352 lt!215018) (_2!6352 lt!215012)) e!91879)))

(declare-fun b!138200 () Bool)

(declare-fun res!115160 () Bool)

(assert (=> b!138200 (=> (not res!115160) (not e!91879))))

(assert (=> b!138200 (= res!115160 (bvsle (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))) (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012)))))))

(declare-fun b!138201 () Bool)

(declare-fun e!91878 () Bool)

(assert (=> b!138201 (= e!91879 e!91878)))

(declare-fun res!115159 () Bool)

(assert (=> b!138201 (=> res!115159 e!91878)))

(assert (=> b!138201 (= res!115159 (= (size!2831 (buf!3238 (_2!6352 lt!215018))) #b00000000000000000000000000000000))))

(declare-fun b!138202 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6251 array!6251 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138202 (= e!91878 (arrayBitRangesEq!0 (buf!3238 (_2!6352 lt!215018)) (buf!3238 (_2!6352 lt!215012)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018)))))))

(assert (= (and d!44496 res!115158) b!138200))

(assert (= (and b!138200 res!115160) b!138201))

(assert (= (and b!138201 (not res!115159)) b!138202))

(assert (=> b!138200 m!211963))

(assert (=> b!138200 m!211959))

(assert (=> b!138202 m!211963))

(assert (=> b!138202 m!211963))

(declare-fun m!212561 () Bool)

(assert (=> b!138202 m!212561))

(assert (=> b!137930 d!44496))

(declare-datatypes ((tuple3!528 0))(
  ( (tuple3!529 (_1!6364 Unit!8609) (_2!6364 BitStream!4926) (_3!325 array!6251)) )
))
(declare-fun lt!215622 () tuple3!528)

(declare-fun d!44498 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4926 array!6251 (_ BitVec 32) (_ BitVec 32)) tuple3!528)

(assert (=> d!44498 (= lt!215622 (readByteArrayLoop!0 (_1!6354 lt!215015) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44498 (= (readByteArrayLoopPure!0 (_1!6354 lt!215015) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12061 (_2!6364 lt!215622) (_3!325 lt!215622)))))

(declare-fun bs!10857 () Bool)

(assert (= bs!10857 d!44498))

(declare-fun m!212563 () Bool)

(assert (=> bs!10857 m!212563))

(assert (=> b!137941 d!44498))

(declare-fun d!44500 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44500 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215025) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018)))) lt!215025))))

(declare-fun bs!10858 () Bool)

(assert (= bs!10858 d!44500))

(declare-fun m!212565 () Bool)

(assert (=> bs!10858 m!212565))

(assert (=> b!137941 d!44500))

(declare-fun d!44502 () Bool)

(assert (=> d!44502 (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215025)))

(declare-fun lt!215625 () Unit!8609)

(declare-fun choose!9 (BitStream!4926 array!6251 (_ BitVec 64) BitStream!4926) Unit!8609)

(assert (=> d!44502 (= lt!215625 (choose!9 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215012)) lt!215025 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018)))))))

(assert (=> d!44502 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215012)) lt!215025) lt!215625)))

(declare-fun bs!10859 () Bool)

(assert (= bs!10859 d!44502))

(assert (=> bs!10859 m!211949))

(declare-fun m!212567 () Bool)

(assert (=> bs!10859 m!212567))

(assert (=> b!137941 d!44502))

(declare-fun e!91885 () Bool)

(declare-fun lt!215666 () (_ BitVec 64))

(declare-fun lt!215674 () tuple2!12062)

(declare-fun lt!215667 () (_ BitVec 64))

(declare-fun b!138213 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4926 (_ BitVec 64)) BitStream!4926)

(assert (=> b!138213 (= e!91885 (= (_1!6354 lt!215674) (withMovedBitIndex!0 (_2!6354 lt!215674) (bvsub lt!215666 lt!215667))))))

(assert (=> b!138213 (or (= (bvand lt!215666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215666 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215666 lt!215667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138213 (= lt!215667 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012))))))

(assert (=> b!138213 (= lt!215666 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))))))

(declare-fun b!138214 () Bool)

(declare-fun e!91884 () Unit!8609)

(declare-fun Unit!8619 () Unit!8609)

(assert (=> b!138214 (= e!91884 Unit!8619)))

(declare-fun b!138215 () Bool)

(declare-fun res!115167 () Bool)

(assert (=> b!138215 (=> (not res!115167) (not e!91885))))

(assert (=> b!138215 (= res!115167 (isPrefixOf!0 (_2!6354 lt!215674) (_2!6352 lt!215012)))))

(declare-fun b!138216 () Bool)

(declare-fun lt!215676 () Unit!8609)

(assert (=> b!138216 (= e!91884 lt!215676)))

(declare-fun lt!215671 () (_ BitVec 64))

(assert (=> b!138216 (= lt!215671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215680 () (_ BitVec 64))

(assert (=> b!138216 (= lt!215680 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6251 array!6251 (_ BitVec 64) (_ BitVec 64)) Unit!8609)

(assert (=> b!138216 (= lt!215676 (arrayBitRangesEqSymmetric!0 (buf!3238 (_2!6352 lt!215018)) (buf!3238 (_2!6352 lt!215012)) lt!215671 lt!215680))))

(assert (=> b!138216 (arrayBitRangesEq!0 (buf!3238 (_2!6352 lt!215012)) (buf!3238 (_2!6352 lt!215018)) lt!215671 lt!215680)))

(declare-fun b!138217 () Bool)

(declare-fun res!115169 () Bool)

(assert (=> b!138217 (=> (not res!115169) (not e!91885))))

(assert (=> b!138217 (= res!115169 (isPrefixOf!0 (_1!6354 lt!215674) (_2!6352 lt!215018)))))

(declare-fun d!44504 () Bool)

(assert (=> d!44504 e!91885))

(declare-fun res!115168 () Bool)

(assert (=> d!44504 (=> (not res!115168) (not e!91885))))

(assert (=> d!44504 (= res!115168 (isPrefixOf!0 (_1!6354 lt!215674) (_2!6354 lt!215674)))))

(declare-fun lt!215673 () BitStream!4926)

(assert (=> d!44504 (= lt!215674 (tuple2!12063 lt!215673 (_2!6352 lt!215012)))))

(declare-fun lt!215677 () Unit!8609)

(declare-fun lt!215684 () Unit!8609)

(assert (=> d!44504 (= lt!215677 lt!215684)))

(assert (=> d!44504 (isPrefixOf!0 lt!215673 (_2!6352 lt!215012))))

(assert (=> d!44504 (= lt!215684 (lemmaIsPrefixTransitive!0 lt!215673 (_2!6352 lt!215012) (_2!6352 lt!215012)))))

(declare-fun lt!215675 () Unit!8609)

(declare-fun lt!215679 () Unit!8609)

(assert (=> d!44504 (= lt!215675 lt!215679)))

(assert (=> d!44504 (isPrefixOf!0 lt!215673 (_2!6352 lt!215012))))

(assert (=> d!44504 (= lt!215679 (lemmaIsPrefixTransitive!0 lt!215673 (_2!6352 lt!215018) (_2!6352 lt!215012)))))

(declare-fun lt!215681 () Unit!8609)

(assert (=> d!44504 (= lt!215681 e!91884)))

(declare-fun c!7748 () Bool)

(assert (=> d!44504 (= c!7748 (not (= (size!2831 (buf!3238 (_2!6352 lt!215018))) #b00000000000000000000000000000000)))))

(declare-fun lt!215678 () Unit!8609)

(declare-fun lt!215669 () Unit!8609)

(assert (=> d!44504 (= lt!215678 lt!215669)))

(assert (=> d!44504 (isPrefixOf!0 (_2!6352 lt!215012) (_2!6352 lt!215012))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4926) Unit!8609)

(assert (=> d!44504 (= lt!215669 (lemmaIsPrefixRefl!0 (_2!6352 lt!215012)))))

(declare-fun lt!215682 () Unit!8609)

(declare-fun lt!215668 () Unit!8609)

(assert (=> d!44504 (= lt!215682 lt!215668)))

(assert (=> d!44504 (= lt!215668 (lemmaIsPrefixRefl!0 (_2!6352 lt!215012)))))

(declare-fun lt!215672 () Unit!8609)

(declare-fun lt!215670 () Unit!8609)

(assert (=> d!44504 (= lt!215672 lt!215670)))

(assert (=> d!44504 (isPrefixOf!0 lt!215673 lt!215673)))

(assert (=> d!44504 (= lt!215670 (lemmaIsPrefixRefl!0 lt!215673))))

(declare-fun lt!215683 () Unit!8609)

(declare-fun lt!215685 () Unit!8609)

(assert (=> d!44504 (= lt!215683 lt!215685)))

(assert (=> d!44504 (isPrefixOf!0 (_2!6352 lt!215018) (_2!6352 lt!215018))))

(assert (=> d!44504 (= lt!215685 (lemmaIsPrefixRefl!0 (_2!6352 lt!215018)))))

(assert (=> d!44504 (= lt!215673 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))))))

(assert (=> d!44504 (isPrefixOf!0 (_2!6352 lt!215018) (_2!6352 lt!215012))))

(assert (=> d!44504 (= (reader!0 (_2!6352 lt!215018) (_2!6352 lt!215012)) lt!215674)))

(assert (= (and d!44504 c!7748) b!138216))

(assert (= (and d!44504 (not c!7748)) b!138214))

(assert (= (and d!44504 res!115168) b!138217))

(assert (= (and b!138217 res!115169) b!138215))

(assert (= (and b!138215 res!115167) b!138213))

(declare-fun m!212569 () Bool)

(assert (=> d!44504 m!212569))

(assert (=> d!44504 m!211939))

(declare-fun m!212571 () Bool)

(assert (=> d!44504 m!212571))

(declare-fun m!212573 () Bool)

(assert (=> d!44504 m!212573))

(declare-fun m!212575 () Bool)

(assert (=> d!44504 m!212575))

(declare-fun m!212577 () Bool)

(assert (=> d!44504 m!212577))

(declare-fun m!212579 () Bool)

(assert (=> d!44504 m!212579))

(declare-fun m!212581 () Bool)

(assert (=> d!44504 m!212581))

(declare-fun m!212583 () Bool)

(assert (=> d!44504 m!212583))

(declare-fun m!212585 () Bool)

(assert (=> d!44504 m!212585))

(declare-fun m!212587 () Bool)

(assert (=> d!44504 m!212587))

(assert (=> b!138216 m!211963))

(declare-fun m!212589 () Bool)

(assert (=> b!138216 m!212589))

(declare-fun m!212591 () Bool)

(assert (=> b!138216 m!212591))

(declare-fun m!212593 () Bool)

(assert (=> b!138215 m!212593))

(declare-fun m!212595 () Bool)

(assert (=> b!138217 m!212595))

(declare-fun m!212597 () Bool)

(assert (=> b!138213 m!212597))

(assert (=> b!138213 m!211959))

(assert (=> b!138213 m!211963))

(assert (=> b!137941 d!44504))

(declare-fun d!44506 () Bool)

(declare-fun lt!215694 () tuple2!12060)

(declare-fun lt!215696 () tuple2!12060)

(assert (=> d!44506 (arrayRangesEq!234 (_2!6353 lt!215694) (_2!6353 lt!215696) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215697 () Unit!8609)

(declare-fun lt!215695 () BitStream!4926)

(declare-fun choose!35 (BitStream!4926 array!6251 (_ BitVec 32) (_ BitVec 32) tuple2!12060 array!6251 BitStream!4926 tuple2!12060 array!6251) Unit!8609)

(assert (=> d!44506 (= lt!215697 (choose!35 (_1!6354 lt!215017) arr!237 from!447 to!404 lt!215694 (_2!6353 lt!215694) lt!215695 lt!215696 (_2!6353 lt!215696)))))

(assert (=> d!44506 (= lt!215696 (readByteArrayLoopPure!0 lt!215695 (array!6252 (store (arr!3517 arr!237) from!447 (_2!6355 (readBytePure!0 (_1!6354 lt!215017)))) (size!2831 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44506 (= lt!215695 (withMovedByteIndex!0 (_1!6354 lt!215017) #b00000000000000000000000000000001))))

(assert (=> d!44506 (= lt!215694 (readByteArrayLoopPure!0 (_1!6354 lt!215017) arr!237 from!447 to!404))))

(assert (=> d!44506 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6354 lt!215017) arr!237 from!447 to!404) lt!215697)))

(declare-fun bs!10861 () Bool)

(assert (= bs!10861 d!44506))

(assert (=> bs!10861 m!211993))

(declare-fun m!212599 () Bool)

(assert (=> bs!10861 m!212599))

(declare-fun m!212601 () Bool)

(assert (=> bs!10861 m!212601))

(declare-fun m!212603 () Bool)

(assert (=> bs!10861 m!212603))

(assert (=> bs!10861 m!212011))

(declare-fun m!212605 () Bool)

(assert (=> bs!10861 m!212605))

(assert (=> bs!10861 m!211991))

(assert (=> b!137939 d!44506))

(declare-fun d!44508 () Bool)

(declare-fun res!115174 () Bool)

(declare-fun e!91890 () Bool)

(assert (=> d!44508 (=> res!115174 e!91890)))

(assert (=> d!44508 (= res!115174 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44508 (= (arrayRangesEq!234 (_2!6353 lt!215024) (_2!6353 lt!215040) #b00000000000000000000000000000000 to!404) e!91890)))

(declare-fun b!138222 () Bool)

(declare-fun e!91891 () Bool)

(assert (=> b!138222 (= e!91890 e!91891)))

(declare-fun res!115175 () Bool)

(assert (=> b!138222 (=> (not res!115175) (not e!91891))))

(assert (=> b!138222 (= res!115175 (= (select (arr!3517 (_2!6353 lt!215024)) #b00000000000000000000000000000000) (select (arr!3517 (_2!6353 lt!215040)) #b00000000000000000000000000000000)))))

(declare-fun b!138223 () Bool)

(assert (=> b!138223 (= e!91891 (arrayRangesEq!234 (_2!6353 lt!215024) (_2!6353 lt!215040) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44508 (not res!115174)) b!138222))

(assert (= (and b!138222 res!115175) b!138223))

(declare-fun m!212607 () Bool)

(assert (=> b!138222 m!212607))

(declare-fun m!212609 () Bool)

(assert (=> b!138222 m!212609))

(declare-fun m!212611 () Bool)

(assert (=> b!138223 m!212611))

(assert (=> b!137939 d!44508))

(declare-fun d!44510 () Bool)

(assert (=> d!44510 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215033) (bvsle ((_ sign_extend 32) lt!215033) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10862 () Bool)

(assert (= bs!10862 d!44510))

(assert (=> bs!10862 m!212565))

(assert (=> b!137939 d!44510))

(declare-fun d!44512 () Bool)

(declare-fun lt!215698 () tuple3!528)

(assert (=> d!44512 (= lt!215698 (readByteArrayLoop!0 (_1!6354 lt!215037) lt!215038 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44512 (= (readByteArrayLoopPure!0 (_1!6354 lt!215037) lt!215038 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12061 (_2!6364 lt!215698) (_3!325 lt!215698)))))

(declare-fun bs!10863 () Bool)

(assert (= bs!10863 d!44512))

(declare-fun m!212613 () Bool)

(assert (=> bs!10863 m!212613))

(assert (=> b!137939 d!44512))

(declare-fun d!44514 () Bool)

(declare-fun lt!215699 () tuple3!528)

(assert (=> d!44514 (= lt!215699 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6354 lt!215017) #b00000000000000000000000000000001) lt!215038 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44514 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6354 lt!215017) #b00000000000000000000000000000001) lt!215038 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12061 (_2!6364 lt!215699) (_3!325 lt!215699)))))

(declare-fun bs!10864 () Bool)

(assert (= bs!10864 d!44514))

(assert (=> bs!10864 m!211993))

(declare-fun m!212615 () Bool)

(assert (=> bs!10864 m!212615))

(assert (=> b!137939 d!44514))

(declare-fun d!44516 () Bool)

(declare-fun lt!215700 () tuple3!528)

(assert (=> d!44516 (= lt!215700 (readByteArrayLoop!0 (_1!6354 lt!215017) arr!237 from!447 to!404))))

(assert (=> d!44516 (= (readByteArrayLoopPure!0 (_1!6354 lt!215017) arr!237 from!447 to!404) (tuple2!12061 (_2!6364 lt!215700) (_3!325 lt!215700)))))

(declare-fun bs!10865 () Bool)

(assert (= bs!10865 d!44516))

(declare-fun m!212617 () Bool)

(assert (=> bs!10865 m!212617))

(assert (=> b!137939 d!44516))

(declare-fun d!44518 () Bool)

(assert (=> d!44518 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215033) (bvsle ((_ sign_extend 32) lt!215033) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10866 () Bool)

(assert (= bs!10866 d!44518))

(declare-fun m!212619 () Bool)

(assert (=> bs!10866 m!212619))

(assert (=> b!137939 d!44518))

(assert (=> b!137939 d!44504))

(declare-fun d!44520 () Bool)

(declare-fun e!91894 () Bool)

(assert (=> d!44520 e!91894))

(declare-fun res!115182 () Bool)

(assert (=> d!44520 (=> (not res!115182) (not e!91894))))

(declare-fun lt!215713 () tuple2!12058)

(assert (=> d!44520 (= res!115182 (= (size!2831 (buf!3238 thiss!1634)) (size!2831 (buf!3238 (_2!6352 lt!215713)))))))

(declare-fun choose!6 (BitStream!4926 (_ BitVec 8)) tuple2!12058)

(assert (=> d!44520 (= lt!215713 (choose!6 thiss!1634 (select (arr!3517 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44520 (validate_offset_byte!0 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)))))

(assert (=> d!44520 (= (appendByte!0 thiss!1634 (select (arr!3517 arr!237) from!447)) lt!215713)))

(declare-fun b!138230 () Bool)

(declare-fun res!115184 () Bool)

(assert (=> b!138230 (=> (not res!115184) (not e!91894))))

(declare-fun lt!215714 () (_ BitVec 64))

(declare-fun lt!215712 () (_ BitVec 64))

(assert (=> b!138230 (= res!115184 (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215713))) (currentByte!6045 (_2!6352 lt!215713)) (currentBit!6040 (_2!6352 lt!215713))) (bvadd lt!215714 lt!215712)))))

(assert (=> b!138230 (or (not (= (bvand lt!215714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215712 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!215714 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!215714 lt!215712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138230 (= lt!215712 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!138230 (= lt!215714 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(declare-fun b!138231 () Bool)

(declare-fun res!115183 () Bool)

(assert (=> b!138231 (=> (not res!115183) (not e!91894))))

(assert (=> b!138231 (= res!115183 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215713)))))

(declare-fun lt!215715 () tuple2!12064)

(declare-fun lt!215711 () tuple2!12062)

(declare-fun b!138232 () Bool)

(assert (=> b!138232 (= e!91894 (and (= (_2!6355 lt!215715) (select (arr!3517 arr!237) from!447)) (= (_1!6355 lt!215715) (_2!6354 lt!215711))))))

(assert (=> b!138232 (= lt!215715 (readBytePure!0 (_1!6354 lt!215711)))))

(assert (=> b!138232 (= lt!215711 (reader!0 thiss!1634 (_2!6352 lt!215713)))))

(assert (= (and d!44520 res!115182) b!138230))

(assert (= (and b!138230 res!115184) b!138231))

(assert (= (and b!138231 res!115183) b!138232))

(assert (=> d!44520 m!211941))

(declare-fun m!212621 () Bool)

(assert (=> d!44520 m!212621))

(declare-fun m!212623 () Bool)

(assert (=> d!44520 m!212623))

(declare-fun m!212625 () Bool)

(assert (=> b!138230 m!212625))

(assert (=> b!138230 m!211961))

(declare-fun m!212627 () Bool)

(assert (=> b!138231 m!212627))

(declare-fun m!212629 () Bool)

(assert (=> b!138232 m!212629))

(declare-fun m!212631 () Bool)

(assert (=> b!138232 m!212631))

(assert (=> b!137939 d!44520))

(declare-fun d!44522 () Bool)

(declare-datatypes ((tuple2!12078 0))(
  ( (tuple2!12079 (_1!6365 (_ BitVec 8)) (_2!6365 BitStream!4926)) )
))
(declare-fun lt!215718 () tuple2!12078)

(declare-fun readByte!0 (BitStream!4926) tuple2!12078)

(assert (=> d!44522 (= lt!215718 (readByte!0 (_1!6354 lt!215017)))))

(assert (=> d!44522 (= (readBytePure!0 (_1!6354 lt!215017)) (tuple2!12065 (_2!6365 lt!215718) (_1!6365 lt!215718)))))

(declare-fun bs!10867 () Bool)

(assert (= bs!10867 d!44522))

(declare-fun m!212633 () Bool)

(assert (=> bs!10867 m!212633))

(assert (=> b!137939 d!44522))

(declare-fun d!44524 () Bool)

(declare-fun lt!215719 () tuple2!12078)

(assert (=> d!44524 (= lt!215719 (readByte!0 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))))))

(assert (=> d!44524 (= (readBytePure!0 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))) (tuple2!12065 (_2!6365 lt!215719) (_1!6365 lt!215719)))))

(declare-fun bs!10868 () Bool)

(assert (= bs!10868 d!44524))

(declare-fun m!212635 () Bool)

(assert (=> bs!10868 m!212635))

(assert (=> b!137939 d!44524))

(declare-fun d!44526 () Bool)

(assert (=> d!44526 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!215722 () Unit!8609)

(declare-fun choose!26 (BitStream!4926 array!6251 (_ BitVec 32) BitStream!4926) Unit!8609)

(assert (=> d!44526 (= lt!215722 (choose!26 thiss!1634 (buf!3238 (_2!6352 lt!215012)) (bvsub to!404 from!447) (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))))))

(assert (=> d!44526 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3238 (_2!6352 lt!215012)) (bvsub to!404 from!447)) lt!215722)))

(declare-fun bs!10869 () Bool)

(assert (= bs!10869 d!44526))

(assert (=> bs!10869 m!212003))

(declare-fun m!212637 () Bool)

(assert (=> bs!10869 m!212637))

(assert (=> b!137939 d!44526))

(declare-fun d!44528 () Bool)

(declare-fun res!115185 () Bool)

(declare-fun e!91895 () Bool)

(assert (=> d!44528 (=> res!115185 e!91895)))

(assert (=> d!44528 (= res!115185 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44528 (= (arrayRangesEq!234 (_2!6353 lt!215024) (_2!6353 lt!215035) #b00000000000000000000000000000000 to!404) e!91895)))

(declare-fun b!138233 () Bool)

(declare-fun e!91896 () Bool)

(assert (=> b!138233 (= e!91895 e!91896)))

(declare-fun res!115186 () Bool)

(assert (=> b!138233 (=> (not res!115186) (not e!91896))))

(assert (=> b!138233 (= res!115186 (= (select (arr!3517 (_2!6353 lt!215024)) #b00000000000000000000000000000000) (select (arr!3517 (_2!6353 lt!215035)) #b00000000000000000000000000000000)))))

(declare-fun b!138234 () Bool)

(assert (=> b!138234 (= e!91896 (arrayRangesEq!234 (_2!6353 lt!215024) (_2!6353 lt!215035) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44528 (not res!115185)) b!138233))

(assert (= (and b!138233 res!115186) b!138234))

(assert (=> b!138233 m!212607))

(declare-fun m!212639 () Bool)

(assert (=> b!138233 m!212639))

(declare-fun m!212641 () Bool)

(assert (=> b!138234 m!212641))

(assert (=> b!137939 d!44528))

(declare-fun d!44530 () Bool)

(declare-fun e!91899 () Bool)

(assert (=> d!44530 e!91899))

(declare-fun res!115192 () Bool)

(assert (=> d!44530 (=> (not res!115192) (not e!91899))))

(declare-fun lt!215738 () (_ BitVec 64))

(declare-fun lt!215737 () (_ BitVec 64))

(declare-fun lt!215740 () (_ BitVec 64))

(assert (=> d!44530 (= res!115192 (= lt!215738 (bvsub lt!215737 lt!215740)))))

(assert (=> d!44530 (or (= (bvand lt!215737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215740 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215737 lt!215740) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44530 (= lt!215740 (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6355 lt!215014)))) ((_ sign_extend 32) (currentByte!6045 (_1!6355 lt!215014))) ((_ sign_extend 32) (currentBit!6040 (_1!6355 lt!215014)))))))

(declare-fun lt!215736 () (_ BitVec 64))

(declare-fun lt!215735 () (_ BitVec 64))

(assert (=> d!44530 (= lt!215737 (bvmul lt!215736 lt!215735))))

(assert (=> d!44530 (or (= lt!215736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215735 (bvsdiv (bvmul lt!215736 lt!215735) lt!215736)))))

(assert (=> d!44530 (= lt!215735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44530 (= lt!215736 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6355 lt!215014)))))))

(assert (=> d!44530 (= lt!215738 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6045 (_1!6355 lt!215014))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6040 (_1!6355 lt!215014)))))))

(assert (=> d!44530 (invariant!0 (currentBit!6040 (_1!6355 lt!215014)) (currentByte!6045 (_1!6355 lt!215014)) (size!2831 (buf!3238 (_1!6355 lt!215014))))))

(assert (=> d!44530 (= (bitIndex!0 (size!2831 (buf!3238 (_1!6355 lt!215014))) (currentByte!6045 (_1!6355 lt!215014)) (currentBit!6040 (_1!6355 lt!215014))) lt!215738)))

(declare-fun b!138239 () Bool)

(declare-fun res!115191 () Bool)

(assert (=> b!138239 (=> (not res!115191) (not e!91899))))

(assert (=> b!138239 (= res!115191 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215738))))

(declare-fun b!138240 () Bool)

(declare-fun lt!215739 () (_ BitVec 64))

(assert (=> b!138240 (= e!91899 (bvsle lt!215738 (bvmul lt!215739 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138240 (or (= lt!215739 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215739 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215739)))))

(assert (=> b!138240 (= lt!215739 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6355 lt!215014)))))))

(assert (= (and d!44530 res!115192) b!138239))

(assert (= (and b!138239 res!115191) b!138240))

(declare-fun m!212643 () Bool)

(assert (=> d!44530 m!212643))

(declare-fun m!212645 () Bool)

(assert (=> d!44530 m!212645))

(assert (=> b!137939 d!44530))

(declare-fun d!44532 () Bool)

(declare-fun e!91902 () Bool)

(assert (=> d!44532 e!91902))

(declare-fun res!115195 () Bool)

(assert (=> d!44532 (=> (not res!115195) (not e!91902))))

(assert (=> d!44532 (= res!115195 (and (or (let ((rhs!3160 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3160 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3160) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44533 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44533 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44533 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3159 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3159 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3159) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!215748 () Unit!8609)

(declare-fun choose!57 (BitStream!4926 BitStream!4926 (_ BitVec 64) (_ BitVec 32)) Unit!8609)

(assert (=> d!44532 (= lt!215748 (choose!57 thiss!1634 (_2!6352 lt!215018) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44532 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6352 lt!215018) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!215748)))

(declare-fun lt!215747 () (_ BitVec 32))

(declare-fun b!138243 () Bool)

(assert (=> b!138243 (= e!91902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) (bvsub (bvsub to!404 from!447) lt!215747)))))

(assert (=> b!138243 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!215747 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!215747) #b10000000000000000000000000000000)))))

(declare-fun lt!215749 () (_ BitVec 64))

(assert (=> b!138243 (= lt!215747 ((_ extract 31 0) lt!215749))))

(assert (=> b!138243 (and (bvslt lt!215749 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!215749 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!138243 (= lt!215749 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44532 res!115195) b!138243))

(declare-fun m!212647 () Bool)

(assert (=> d!44532 m!212647))

(declare-fun m!212649 () Bool)

(assert (=> b!138243 m!212649))

(assert (=> b!137939 d!44532))

(declare-fun d!44535 () Bool)

(assert (=> d!44535 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215033)))

(declare-fun lt!215750 () Unit!8609)

(assert (=> d!44535 (= lt!215750 (choose!26 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215012)) lt!215033 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018)))))))

(assert (=> d!44535 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215012)) lt!215033) lt!215750)))

(declare-fun bs!10870 () Bool)

(assert (= bs!10870 d!44535))

(assert (=> bs!10870 m!212015))

(declare-fun m!212651 () Bool)

(assert (=> bs!10870 m!212651))

(assert (=> b!137939 d!44535))

(declare-fun b!138254 () Bool)

(declare-fun e!91911 () Bool)

(declare-fun lt!215777 () tuple2!12060)

(assert (=> b!138254 (= e!91911 (arrayRangesEq!234 arr!237 (_2!6353 lt!215777) #b00000000000000000000000000000000 to!404))))

(declare-fun d!44537 () Bool)

(declare-fun e!91909 () Bool)

(assert (=> d!44537 e!91909))

(declare-fun res!115210 () Bool)

(assert (=> d!44537 (=> (not res!115210) (not e!91909))))

(declare-fun lt!215775 () tuple2!12058)

(assert (=> d!44537 (= res!115210 (= (size!2831 (buf!3238 (_2!6352 lt!215018))) (size!2831 (buf!3238 (_2!6352 lt!215775)))))))

(declare-fun choose!64 (BitStream!4926 array!6251 (_ BitVec 32) (_ BitVec 32)) tuple2!12058)

(assert (=> d!44537 (= lt!215775 (choose!64 (_2!6352 lt!215018) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44537 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2831 arr!237)))))

(assert (=> d!44537 (= (appendByteArrayLoop!0 (_2!6352 lt!215018) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!215775)))

(declare-fun b!138255 () Bool)

(declare-fun e!91910 () Bool)

(declare-fun lt!215770 () (_ BitVec 64))

(assert (=> b!138255 (= e!91910 (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215770))))

(declare-fun b!138256 () Bool)

(declare-fun res!115209 () Bool)

(assert (=> b!138256 (=> (not res!115209) (not e!91909))))

(assert (=> b!138256 (= res!115209 (isPrefixOf!0 (_2!6352 lt!215018) (_2!6352 lt!215775)))))

(declare-fun b!138257 () Bool)

(assert (=> b!138257 (= e!91909 e!91911)))

(declare-fun res!115206 () Bool)

(assert (=> b!138257 (=> (not res!115206) (not e!91911))))

(declare-fun lt!215776 () tuple2!12062)

(assert (=> b!138257 (= res!115206 (and (= (size!2831 (_2!6353 lt!215777)) (size!2831 arr!237)) (= (_1!6353 lt!215777) (_2!6354 lt!215776))))))

(assert (=> b!138257 (= lt!215777 (readByteArrayLoopPure!0 (_1!6354 lt!215776) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!215773 () Unit!8609)

(declare-fun lt!215769 () Unit!8609)

(assert (=> b!138257 (= lt!215773 lt!215769)))

(assert (=> b!138257 (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215775)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018))) lt!215770)))

(assert (=> b!138257 (= lt!215769 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6352 lt!215018) (buf!3238 (_2!6352 lt!215775)) lt!215770))))

(assert (=> b!138257 e!91910))

(declare-fun res!115208 () Bool)

(assert (=> b!138257 (=> (not res!115208) (not e!91910))))

(assert (=> b!138257 (= res!115208 (and (= (size!2831 (buf!3238 (_2!6352 lt!215018))) (size!2831 (buf!3238 (_2!6352 lt!215775)))) (bvsge lt!215770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138257 (= lt!215770 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!138257 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!138257 (= lt!215776 (reader!0 (_2!6352 lt!215018) (_2!6352 lt!215775)))))

(declare-fun b!138258 () Bool)

(declare-fun res!115207 () Bool)

(assert (=> b!138258 (=> (not res!115207) (not e!91909))))

(declare-fun lt!215772 () (_ BitVec 64))

(declare-fun lt!215774 () (_ BitVec 64))

(assert (=> b!138258 (= res!115207 (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215775))) (currentByte!6045 (_2!6352 lt!215775)) (currentBit!6040 (_2!6352 lt!215775))) (bvadd lt!215772 lt!215774)))))

(assert (=> b!138258 (or (not (= (bvand lt!215772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215774 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!215772 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!215772 lt!215774) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!215771 () (_ BitVec 64))

(assert (=> b!138258 (= lt!215774 (bvmul lt!215771 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!138258 (or (= lt!215771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215771)))))

(assert (=> b!138258 (= lt!215771 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!138258 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!138258 (= lt!215772 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))))))

(assert (= (and d!44537 res!115210) b!138258))

(assert (= (and b!138258 res!115207) b!138256))

(assert (= (and b!138256 res!115209) b!138257))

(assert (= (and b!138257 res!115208) b!138255))

(assert (= (and b!138257 res!115206) b!138254))

(declare-fun m!212653 () Bool)

(assert (=> b!138255 m!212653))

(declare-fun m!212655 () Bool)

(assert (=> b!138257 m!212655))

(declare-fun m!212657 () Bool)

(assert (=> b!138257 m!212657))

(declare-fun m!212659 () Bool)

(assert (=> b!138257 m!212659))

(declare-fun m!212661 () Bool)

(assert (=> b!138257 m!212661))

(declare-fun m!212663 () Bool)

(assert (=> b!138258 m!212663))

(assert (=> b!138258 m!211963))

(declare-fun m!212665 () Bool)

(assert (=> b!138256 m!212665))

(declare-fun m!212667 () Bool)

(assert (=> b!138254 m!212667))

(declare-fun m!212669 () Bool)

(assert (=> d!44537 m!212669))

(assert (=> b!137939 d!44537))

(declare-fun d!44539 () Bool)

(declare-fun res!115211 () Bool)

(declare-fun e!91913 () Bool)

(assert (=> d!44539 (=> (not res!115211) (not e!91913))))

(assert (=> d!44539 (= res!115211 (= (size!2831 (buf!3238 thiss!1634)) (size!2831 (buf!3238 (_2!6352 lt!215012)))))))

(assert (=> d!44539 (= (isPrefixOf!0 thiss!1634 (_2!6352 lt!215012)) e!91913)))

(declare-fun b!138259 () Bool)

(declare-fun res!115213 () Bool)

(assert (=> b!138259 (=> (not res!115213) (not e!91913))))

(assert (=> b!138259 (= res!115213 (bvsle (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)) (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012)))))))

(declare-fun b!138260 () Bool)

(declare-fun e!91912 () Bool)

(assert (=> b!138260 (= e!91913 e!91912)))

(declare-fun res!115212 () Bool)

(assert (=> b!138260 (=> res!115212 e!91912)))

(assert (=> b!138260 (= res!115212 (= (size!2831 (buf!3238 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138261 () Bool)

(assert (=> b!138261 (= e!91912 (arrayBitRangesEq!0 (buf!3238 thiss!1634) (buf!3238 (_2!6352 lt!215012)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))))))

(assert (= (and d!44539 res!115211) b!138259))

(assert (= (and b!138259 res!115213) b!138260))

(assert (= (and b!138260 (not res!115212)) b!138261))

(assert (=> b!138259 m!211961))

(assert (=> b!138259 m!211959))

(assert (=> b!138261 m!211961))

(assert (=> b!138261 m!211961))

(declare-fun m!212671 () Bool)

(assert (=> b!138261 m!212671))

(assert (=> b!137939 d!44539))

(declare-fun d!44541 () Bool)

(declare-fun e!91916 () Bool)

(assert (=> d!44541 e!91916))

(declare-fun res!115216 () Bool)

(assert (=> d!44541 (=> (not res!115216) (not e!91916))))

(declare-fun lt!215787 () tuple2!12064)

(declare-fun lt!215786 () tuple2!12064)

(assert (=> d!44541 (= res!115216 (= (bitIndex!0 (size!2831 (buf!3238 (_1!6355 lt!215787))) (currentByte!6045 (_1!6355 lt!215787)) (currentBit!6040 (_1!6355 lt!215787))) (bitIndex!0 (size!2831 (buf!3238 (_1!6355 lt!215786))) (currentByte!6045 (_1!6355 lt!215786)) (currentBit!6040 (_1!6355 lt!215786)))))))

(declare-fun lt!215789 () Unit!8609)

(declare-fun lt!215788 () BitStream!4926)

(declare-fun choose!14 (BitStream!4926 BitStream!4926 BitStream!4926 tuple2!12064 tuple2!12064 BitStream!4926 (_ BitVec 8) tuple2!12064 tuple2!12064 BitStream!4926 (_ BitVec 8)) Unit!8609)

(assert (=> d!44541 (= lt!215789 (choose!14 lt!215028 (_2!6352 lt!215012) lt!215788 lt!215787 (tuple2!12065 (_1!6355 lt!215787) (_2!6355 lt!215787)) (_1!6355 lt!215787) (_2!6355 lt!215787) lt!215786 (tuple2!12065 (_1!6355 lt!215786) (_2!6355 lt!215786)) (_1!6355 lt!215786) (_2!6355 lt!215786)))))

(assert (=> d!44541 (= lt!215786 (readBytePure!0 lt!215788))))

(assert (=> d!44541 (= lt!215787 (readBytePure!0 lt!215028))))

(assert (=> d!44541 (= lt!215788 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 lt!215028) (currentBit!6040 lt!215028)))))

(assert (=> d!44541 (= (readBytePrefixLemma!0 lt!215028 (_2!6352 lt!215012)) lt!215789)))

(declare-fun b!138264 () Bool)

(assert (=> b!138264 (= e!91916 (= (_2!6355 lt!215787) (_2!6355 lt!215786)))))

(assert (= (and d!44541 res!115216) b!138264))

(declare-fun m!212673 () Bool)

(assert (=> d!44541 m!212673))

(assert (=> d!44541 m!211979))

(declare-fun m!212675 () Bool)

(assert (=> d!44541 m!212675))

(declare-fun m!212677 () Bool)

(assert (=> d!44541 m!212677))

(declare-fun m!212679 () Bool)

(assert (=> d!44541 m!212679))

(assert (=> b!137939 d!44541))

(declare-fun d!44543 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4926 (_ BitVec 32)) tuple2!12058)

(assert (=> d!44543 (= (withMovedByteIndex!0 (_1!6354 lt!215017) #b00000000000000000000000000000001) (_2!6352 (moveByteIndex!0 (_1!6354 lt!215017) #b00000000000000000000000000000001)))))

(declare-fun bs!10871 () Bool)

(assert (= bs!10871 d!44543))

(declare-fun m!212681 () Bool)

(assert (=> bs!10871 m!212681))

(assert (=> b!137939 d!44543))

(declare-fun d!44545 () Bool)

(assert (=> d!44545 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215012))))

(declare-fun lt!215792 () Unit!8609)

(declare-fun choose!30 (BitStream!4926 BitStream!4926 BitStream!4926) Unit!8609)

(assert (=> d!44545 (= lt!215792 (choose!30 thiss!1634 (_2!6352 lt!215018) (_2!6352 lt!215012)))))

(assert (=> d!44545 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215018))))

(assert (=> d!44545 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6352 lt!215018) (_2!6352 lt!215012)) lt!215792)))

(declare-fun bs!10872 () Bool)

(assert (= bs!10872 d!44545))

(assert (=> bs!10872 m!212007))

(declare-fun m!212683 () Bool)

(assert (=> bs!10872 m!212683))

(assert (=> bs!10872 m!211937))

(assert (=> b!137939 d!44545))

(declare-fun d!44547 () Bool)

(assert (=> d!44547 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10873 () Bool)

(assert (= bs!10873 d!44547))

(declare-fun m!212685 () Bool)

(assert (=> bs!10873 m!212685))

(assert (=> b!137939 d!44547))

(declare-fun d!44549 () Bool)

(declare-fun lt!215793 () tuple2!12078)

(assert (=> d!44549 (= lt!215793 (readByte!0 lt!215028))))

(assert (=> d!44549 (= (readBytePure!0 lt!215028) (tuple2!12065 (_2!6365 lt!215793) (_1!6365 lt!215793)))))

(declare-fun bs!10874 () Bool)

(assert (= bs!10874 d!44549))

(declare-fun m!212687 () Bool)

(assert (=> bs!10874 m!212687))

(assert (=> b!137939 d!44549))

(declare-fun d!44551 () Bool)

(declare-fun e!91917 () Bool)

(assert (=> d!44551 e!91917))

(declare-fun res!115218 () Bool)

(assert (=> d!44551 (=> (not res!115218) (not e!91917))))

(declare-fun lt!215796 () (_ BitVec 64))

(declare-fun lt!215799 () (_ BitVec 64))

(declare-fun lt!215797 () (_ BitVec 64))

(assert (=> d!44551 (= res!115218 (= lt!215797 (bvsub lt!215796 lt!215799)))))

(assert (=> d!44551 (or (= (bvand lt!215796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215796 lt!215799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44551 (= lt!215799 (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6355 lt!215029)))) ((_ sign_extend 32) (currentByte!6045 (_1!6355 lt!215029))) ((_ sign_extend 32) (currentBit!6040 (_1!6355 lt!215029)))))))

(declare-fun lt!215795 () (_ BitVec 64))

(declare-fun lt!215794 () (_ BitVec 64))

(assert (=> d!44551 (= lt!215796 (bvmul lt!215795 lt!215794))))

(assert (=> d!44551 (or (= lt!215795 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215794 (bvsdiv (bvmul lt!215795 lt!215794) lt!215795)))))

(assert (=> d!44551 (= lt!215794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44551 (= lt!215795 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6355 lt!215029)))))))

(assert (=> d!44551 (= lt!215797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6045 (_1!6355 lt!215029))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6040 (_1!6355 lt!215029)))))))

(assert (=> d!44551 (invariant!0 (currentBit!6040 (_1!6355 lt!215029)) (currentByte!6045 (_1!6355 lt!215029)) (size!2831 (buf!3238 (_1!6355 lt!215029))))))

(assert (=> d!44551 (= (bitIndex!0 (size!2831 (buf!3238 (_1!6355 lt!215029))) (currentByte!6045 (_1!6355 lt!215029)) (currentBit!6040 (_1!6355 lt!215029))) lt!215797)))

(declare-fun b!138265 () Bool)

(declare-fun res!115217 () Bool)

(assert (=> b!138265 (=> (not res!115217) (not e!91917))))

(assert (=> b!138265 (= res!115217 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215797))))

(declare-fun b!138266 () Bool)

(declare-fun lt!215798 () (_ BitVec 64))

(assert (=> b!138266 (= e!91917 (bvsle lt!215797 (bvmul lt!215798 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138266 (or (= lt!215798 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215798 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215798)))))

(assert (=> b!138266 (= lt!215798 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6355 lt!215029)))))))

(assert (= (and d!44551 res!115218) b!138265))

(assert (= (and b!138265 res!115217) b!138266))

(declare-fun m!212689 () Bool)

(assert (=> d!44551 m!212689))

(declare-fun m!212691 () Bool)

(assert (=> d!44551 m!212691))

(assert (=> b!137939 d!44551))

(declare-fun lt!215800 () (_ BitVec 64))

(declare-fun lt!215801 () (_ BitVec 64))

(declare-fun b!138267 () Bool)

(declare-fun lt!215808 () tuple2!12062)

(declare-fun e!91919 () Bool)

(assert (=> b!138267 (= e!91919 (= (_1!6354 lt!215808) (withMovedBitIndex!0 (_2!6354 lt!215808) (bvsub lt!215800 lt!215801))))))

(assert (=> b!138267 (or (= (bvand lt!215800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215801 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215800 lt!215801) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138267 (= lt!215801 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012))))))

(assert (=> b!138267 (= lt!215800 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(declare-fun b!138268 () Bool)

(declare-fun e!91918 () Unit!8609)

(declare-fun Unit!8620 () Unit!8609)

(assert (=> b!138268 (= e!91918 Unit!8620)))

(declare-fun b!138269 () Bool)

(declare-fun res!115219 () Bool)

(assert (=> b!138269 (=> (not res!115219) (not e!91919))))

(assert (=> b!138269 (= res!115219 (isPrefixOf!0 (_2!6354 lt!215808) (_2!6352 lt!215012)))))

(declare-fun b!138270 () Bool)

(declare-fun lt!215810 () Unit!8609)

(assert (=> b!138270 (= e!91918 lt!215810)))

(declare-fun lt!215805 () (_ BitVec 64))

(assert (=> b!138270 (= lt!215805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215814 () (_ BitVec 64))

(assert (=> b!138270 (= lt!215814 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(assert (=> b!138270 (= lt!215810 (arrayBitRangesEqSymmetric!0 (buf!3238 thiss!1634) (buf!3238 (_2!6352 lt!215012)) lt!215805 lt!215814))))

(assert (=> b!138270 (arrayBitRangesEq!0 (buf!3238 (_2!6352 lt!215012)) (buf!3238 thiss!1634) lt!215805 lt!215814)))

(declare-fun b!138271 () Bool)

(declare-fun res!115221 () Bool)

(assert (=> b!138271 (=> (not res!115221) (not e!91919))))

(assert (=> b!138271 (= res!115221 (isPrefixOf!0 (_1!6354 lt!215808) thiss!1634))))

(declare-fun d!44553 () Bool)

(assert (=> d!44553 e!91919))

(declare-fun res!115220 () Bool)

(assert (=> d!44553 (=> (not res!115220) (not e!91919))))

(assert (=> d!44553 (= res!115220 (isPrefixOf!0 (_1!6354 lt!215808) (_2!6354 lt!215808)))))

(declare-fun lt!215807 () BitStream!4926)

(assert (=> d!44553 (= lt!215808 (tuple2!12063 lt!215807 (_2!6352 lt!215012)))))

(declare-fun lt!215811 () Unit!8609)

(declare-fun lt!215818 () Unit!8609)

(assert (=> d!44553 (= lt!215811 lt!215818)))

(assert (=> d!44553 (isPrefixOf!0 lt!215807 (_2!6352 lt!215012))))

(assert (=> d!44553 (= lt!215818 (lemmaIsPrefixTransitive!0 lt!215807 (_2!6352 lt!215012) (_2!6352 lt!215012)))))

(declare-fun lt!215809 () Unit!8609)

(declare-fun lt!215813 () Unit!8609)

(assert (=> d!44553 (= lt!215809 lt!215813)))

(assert (=> d!44553 (isPrefixOf!0 lt!215807 (_2!6352 lt!215012))))

(assert (=> d!44553 (= lt!215813 (lemmaIsPrefixTransitive!0 lt!215807 thiss!1634 (_2!6352 lt!215012)))))

(declare-fun lt!215815 () Unit!8609)

(assert (=> d!44553 (= lt!215815 e!91918)))

(declare-fun c!7749 () Bool)

(assert (=> d!44553 (= c!7749 (not (= (size!2831 (buf!3238 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!215812 () Unit!8609)

(declare-fun lt!215803 () Unit!8609)

(assert (=> d!44553 (= lt!215812 lt!215803)))

(assert (=> d!44553 (isPrefixOf!0 (_2!6352 lt!215012) (_2!6352 lt!215012))))

(assert (=> d!44553 (= lt!215803 (lemmaIsPrefixRefl!0 (_2!6352 lt!215012)))))

(declare-fun lt!215816 () Unit!8609)

(declare-fun lt!215802 () Unit!8609)

(assert (=> d!44553 (= lt!215816 lt!215802)))

(assert (=> d!44553 (= lt!215802 (lemmaIsPrefixRefl!0 (_2!6352 lt!215012)))))

(declare-fun lt!215806 () Unit!8609)

(declare-fun lt!215804 () Unit!8609)

(assert (=> d!44553 (= lt!215806 lt!215804)))

(assert (=> d!44553 (isPrefixOf!0 lt!215807 lt!215807)))

(assert (=> d!44553 (= lt!215804 (lemmaIsPrefixRefl!0 lt!215807))))

(declare-fun lt!215817 () Unit!8609)

(declare-fun lt!215819 () Unit!8609)

(assert (=> d!44553 (= lt!215817 lt!215819)))

(assert (=> d!44553 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44553 (= lt!215819 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44553 (= lt!215807 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(assert (=> d!44553 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215012))))

(assert (=> d!44553 (= (reader!0 thiss!1634 (_2!6352 lt!215012)) lt!215808)))

(assert (= (and d!44553 c!7749) b!138270))

(assert (= (and d!44553 (not c!7749)) b!138268))

(assert (= (and d!44553 res!115220) b!138271))

(assert (= (and b!138271 res!115221) b!138269))

(assert (= (and b!138269 res!115219) b!138267))

(declare-fun m!212693 () Bool)

(assert (=> d!44553 m!212693))

(assert (=> d!44553 m!212007))

(declare-fun m!212695 () Bool)

(assert (=> d!44553 m!212695))

(assert (=> d!44553 m!212573))

(declare-fun m!212697 () Bool)

(assert (=> d!44553 m!212697))

(declare-fun m!212699 () Bool)

(assert (=> d!44553 m!212699))

(declare-fun m!212701 () Bool)

(assert (=> d!44553 m!212701))

(assert (=> d!44553 m!212581))

(declare-fun m!212703 () Bool)

(assert (=> d!44553 m!212703))

(declare-fun m!212705 () Bool)

(assert (=> d!44553 m!212705))

(declare-fun m!212707 () Bool)

(assert (=> d!44553 m!212707))

(assert (=> b!138270 m!211961))

(declare-fun m!212709 () Bool)

(assert (=> b!138270 m!212709))

(declare-fun m!212711 () Bool)

(assert (=> b!138270 m!212711))

(declare-fun m!212713 () Bool)

(assert (=> b!138269 m!212713))

(declare-fun m!212715 () Bool)

(assert (=> b!138271 m!212715))

(declare-fun m!212717 () Bool)

(assert (=> b!138267 m!212717))

(assert (=> b!138267 m!211959))

(assert (=> b!138267 m!211961))

(assert (=> b!137939 d!44553))

(declare-fun d!44555 () Bool)

(assert (=> d!44555 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10875 () Bool)

(assert (= bs!10875 d!44555))

(declare-fun m!212719 () Bool)

(assert (=> bs!10875 m!212719))

(assert (=> b!137940 d!44555))

(declare-fun d!44557 () Bool)

(declare-fun e!91920 () Bool)

(assert (=> d!44557 e!91920))

(declare-fun res!115223 () Bool)

(assert (=> d!44557 (=> (not res!115223) (not e!91920))))

(declare-fun lt!215822 () (_ BitVec 64))

(declare-fun lt!215823 () (_ BitVec 64))

(declare-fun lt!215825 () (_ BitVec 64))

(assert (=> d!44557 (= res!115223 (= lt!215823 (bvsub lt!215822 lt!215825)))))

(assert (=> d!44557 (or (= (bvand lt!215822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215825 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215822 lt!215825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44557 (= lt!215825 (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018)))))))

(declare-fun lt!215821 () (_ BitVec 64))

(declare-fun lt!215820 () (_ BitVec 64))

(assert (=> d!44557 (= lt!215822 (bvmul lt!215821 lt!215820))))

(assert (=> d!44557 (or (= lt!215821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215820 (bvsdiv (bvmul lt!215821 lt!215820) lt!215821)))))

(assert (=> d!44557 (= lt!215820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44557 (= lt!215821 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))))))

(assert (=> d!44557 (= lt!215823 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215018))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215018)))))))

(assert (=> d!44557 (invariant!0 (currentBit!6040 (_2!6352 lt!215018)) (currentByte!6045 (_2!6352 lt!215018)) (size!2831 (buf!3238 (_2!6352 lt!215018))))))

(assert (=> d!44557 (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))) lt!215823)))

(declare-fun b!138272 () Bool)

(declare-fun res!115222 () Bool)

(assert (=> b!138272 (=> (not res!115222) (not e!91920))))

(assert (=> b!138272 (= res!115222 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215823))))

(declare-fun b!138273 () Bool)

(declare-fun lt!215824 () (_ BitVec 64))

(assert (=> b!138273 (= e!91920 (bvsle lt!215823 (bvmul lt!215824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138273 (or (= lt!215824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215824)))))

(assert (=> b!138273 (= lt!215824 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215018)))))))

(assert (= (and d!44557 res!115223) b!138272))

(assert (= (and b!138272 res!115222) b!138273))

(assert (=> d!44557 m!212619))

(declare-fun m!212721 () Bool)

(assert (=> d!44557 m!212721))

(assert (=> b!137943 d!44557))

(declare-fun d!44559 () Bool)

(declare-fun e!91921 () Bool)

(assert (=> d!44559 e!91921))

(declare-fun res!115225 () Bool)

(assert (=> d!44559 (=> (not res!115225) (not e!91921))))

(declare-fun lt!215828 () (_ BitVec 64))

(declare-fun lt!215831 () (_ BitVec 64))

(declare-fun lt!215829 () (_ BitVec 64))

(assert (=> d!44559 (= res!115225 (= lt!215829 (bvsub lt!215828 lt!215831)))))

(assert (=> d!44559 (or (= (bvand lt!215828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215828 lt!215831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44559 (= lt!215831 (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634))))))

(declare-fun lt!215827 () (_ BitVec 64))

(declare-fun lt!215826 () (_ BitVec 64))

(assert (=> d!44559 (= lt!215828 (bvmul lt!215827 lt!215826))))

(assert (=> d!44559 (or (= lt!215827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215826 (bvsdiv (bvmul lt!215827 lt!215826) lt!215827)))))

(assert (=> d!44559 (= lt!215826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44559 (= lt!215827 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))))))

(assert (=> d!44559 (= lt!215829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6045 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6040 thiss!1634))))))

(assert (=> d!44559 (invariant!0 (currentBit!6040 thiss!1634) (currentByte!6045 thiss!1634) (size!2831 (buf!3238 thiss!1634)))))

(assert (=> d!44559 (= (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)) lt!215829)))

(declare-fun b!138274 () Bool)

(declare-fun res!115224 () Bool)

(assert (=> b!138274 (=> (not res!115224) (not e!91921))))

(assert (=> b!138274 (= res!115224 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215829))))

(declare-fun b!138275 () Bool)

(declare-fun lt!215830 () (_ BitVec 64))

(assert (=> b!138275 (= e!91921 (bvsle lt!215829 (bvmul lt!215830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138275 (or (= lt!215830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215830)))))

(assert (=> b!138275 (= lt!215830 ((_ sign_extend 32) (size!2831 (buf!3238 thiss!1634))))))

(assert (= (and d!44559 res!115225) b!138274))

(assert (= (and b!138274 res!115224) b!138275))

(assert (=> d!44559 m!212719))

(assert (=> d!44559 m!212035))

(assert (=> b!137943 d!44559))

(declare-fun d!44561 () Bool)

(declare-fun e!91922 () Bool)

(assert (=> d!44561 e!91922))

(declare-fun res!115227 () Bool)

(assert (=> d!44561 (=> (not res!115227) (not e!91922))))

(declare-fun lt!215835 () (_ BitVec 64))

(declare-fun lt!215837 () (_ BitVec 64))

(declare-fun lt!215834 () (_ BitVec 64))

(assert (=> d!44561 (= res!115227 (= lt!215835 (bvsub lt!215834 lt!215837)))))

(assert (=> d!44561 (or (= (bvand lt!215834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215834 lt!215837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44561 (= lt!215837 (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215012))) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215012)))))))

(declare-fun lt!215833 () (_ BitVec 64))

(declare-fun lt!215832 () (_ BitVec 64))

(assert (=> d!44561 (= lt!215834 (bvmul lt!215833 lt!215832))))

(assert (=> d!44561 (or (= lt!215833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!215832 (bvsdiv (bvmul lt!215833 lt!215832) lt!215833)))))

(assert (=> d!44561 (= lt!215832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44561 (= lt!215833 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))))))

(assert (=> d!44561 (= lt!215835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6045 (_2!6352 lt!215012))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6040 (_2!6352 lt!215012)))))))

(assert (=> d!44561 (invariant!0 (currentBit!6040 (_2!6352 lt!215012)) (currentByte!6045 (_2!6352 lt!215012)) (size!2831 (buf!3238 (_2!6352 lt!215012))))))

(assert (=> d!44561 (= (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215012))) (currentByte!6045 (_2!6352 lt!215012)) (currentBit!6040 (_2!6352 lt!215012))) lt!215835)))

(declare-fun b!138276 () Bool)

(declare-fun res!115226 () Bool)

(assert (=> b!138276 (=> (not res!115226) (not e!91922))))

(assert (=> b!138276 (= res!115226 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!215835))))

(declare-fun b!138277 () Bool)

(declare-fun lt!215836 () (_ BitVec 64))

(assert (=> b!138277 (= e!91922 (bvsle lt!215835 (bvmul lt!215836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!138277 (or (= lt!215836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!215836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!215836)))))

(assert (=> b!138277 (= lt!215836 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))))))

(assert (= (and d!44561 res!115227) b!138276))

(assert (= (and b!138276 res!115226) b!138277))

(declare-fun m!212723 () Bool)

(assert (=> d!44561 m!212723))

(declare-fun m!212725 () Bool)

(assert (=> d!44561 m!212725))

(assert (=> b!137933 d!44561))

(assert (=> b!137933 d!44559))

(assert (=> b!137944 d!44561))

(assert (=> b!137944 d!44557))

(declare-fun d!44563 () Bool)

(assert (=> d!44563 (= (array_inv!2620 arr!237) (bvsge (size!2831 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!26742 d!44563))

(declare-fun d!44565 () Bool)

(assert (=> d!44565 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6040 thiss!1634) (currentByte!6045 thiss!1634) (size!2831 (buf!3238 thiss!1634))))))

(declare-fun bs!10876 () Bool)

(assert (= bs!10876 d!44565))

(assert (=> bs!10876 m!212035))

(assert (=> start!26742 d!44565))

(declare-fun d!44567 () Bool)

(declare-fun res!115228 () Bool)

(declare-fun e!91923 () Bool)

(assert (=> d!44567 (=> res!115228 e!91923)))

(assert (=> d!44567 (= res!115228 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44567 (= (arrayRangesEq!234 arr!237 (_2!6353 lt!215023) #b00000000000000000000000000000000 to!404) e!91923)))

(declare-fun b!138278 () Bool)

(declare-fun e!91924 () Bool)

(assert (=> b!138278 (= e!91923 e!91924)))

(declare-fun res!115229 () Bool)

(assert (=> b!138278 (=> (not res!115229) (not e!91924))))

(assert (=> b!138278 (= res!115229 (= (select (arr!3517 arr!237) #b00000000000000000000000000000000) (select (arr!3517 (_2!6353 lt!215023)) #b00000000000000000000000000000000)))))

(declare-fun b!138279 () Bool)

(assert (=> b!138279 (= e!91924 (arrayRangesEq!234 arr!237 (_2!6353 lt!215023) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44567 (not res!115228)) b!138278))

(assert (= (and b!138278 res!115229) b!138279))

(declare-fun m!212727 () Bool)

(assert (=> b!138278 m!212727))

(declare-fun m!212729 () Bool)

(assert (=> b!138278 m!212729))

(declare-fun m!212731 () Bool)

(assert (=> b!138279 m!212731))

(assert (=> b!137931 d!44567))

(declare-fun d!44569 () Bool)

(assert (=> d!44569 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6354 lt!215017)))) ((_ sign_extend 32) (currentByte!6045 (_1!6354 lt!215017))) ((_ sign_extend 32) (currentBit!6040 (_1!6354 lt!215017))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_1!6354 lt!215017)))) ((_ sign_extend 32) (currentByte!6045 (_1!6354 lt!215017))) ((_ sign_extend 32) (currentBit!6040 (_1!6354 lt!215017)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10877 () Bool)

(assert (= bs!10877 d!44569))

(declare-fun m!212733 () Bool)

(assert (=> bs!10877 m!212733))

(assert (=> b!137942 d!44569))

(declare-fun d!44571 () Bool)

(assert (=> d!44571 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) lt!215019) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634))) lt!215019))))

(declare-fun bs!10878 () Bool)

(assert (= bs!10878 d!44571))

(assert (=> bs!10878 m!212685))

(assert (=> b!137942 d!44571))

(declare-fun d!44573 () Bool)

(assert (=> d!44573 (validate_offset_bits!1 ((_ sign_extend 32) (size!2831 (buf!3238 (_2!6352 lt!215012)))) ((_ sign_extend 32) (currentByte!6045 thiss!1634)) ((_ sign_extend 32) (currentBit!6040 thiss!1634)) lt!215019)))

(declare-fun lt!215838 () Unit!8609)

(assert (=> d!44573 (= lt!215838 (choose!9 thiss!1634 (buf!3238 (_2!6352 lt!215012)) lt!215019 (BitStream!4927 (buf!3238 (_2!6352 lt!215012)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))))))

(assert (=> d!44573 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3238 (_2!6352 lt!215012)) lt!215019) lt!215838)))

(declare-fun bs!10879 () Bool)

(assert (= bs!10879 d!44573))

(assert (=> bs!10879 m!212029))

(declare-fun m!212735 () Bool)

(assert (=> bs!10879 m!212735))

(assert (=> b!137942 d!44573))

(declare-fun d!44575 () Bool)

(assert (=> d!44575 (= (invariant!0 (currentBit!6040 thiss!1634) (currentByte!6045 thiss!1634) (size!2831 (buf!3238 (_2!6352 lt!215018)))) (and (bvsge (currentBit!6040 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6040 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6045 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6045 thiss!1634) (size!2831 (buf!3238 (_2!6352 lt!215018)))) (and (= (currentBit!6040 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6045 thiss!1634) (size!2831 (buf!3238 (_2!6352 lt!215018))))))))))

(assert (=> b!137932 d!44575))

(declare-fun d!44577 () Bool)

(declare-fun lt!215839 () tuple2!12078)

(assert (=> d!44577 (= lt!215839 (readByte!0 (_1!6354 lt!215021)))))

(assert (=> d!44577 (= (readBytePure!0 (_1!6354 lt!215021)) (tuple2!12065 (_2!6365 lt!215839) (_1!6365 lt!215839)))))

(declare-fun bs!10880 () Bool)

(assert (= bs!10880 d!44577))

(declare-fun m!212737 () Bool)

(assert (=> bs!10880 m!212737))

(assert (=> b!137935 d!44577))

(declare-fun lt!215848 () tuple2!12062)

(declare-fun lt!215840 () (_ BitVec 64))

(declare-fun lt!215841 () (_ BitVec 64))

(declare-fun e!91926 () Bool)

(declare-fun b!138280 () Bool)

(assert (=> b!138280 (= e!91926 (= (_1!6354 lt!215848) (withMovedBitIndex!0 (_2!6354 lt!215848) (bvsub lt!215840 lt!215841))))))

(assert (=> b!138280 (or (= (bvand lt!215840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!215841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!215840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!215840 lt!215841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!138280 (= lt!215841 (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018))))))

(assert (=> b!138280 (= lt!215840 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(declare-fun b!138281 () Bool)

(declare-fun e!91925 () Unit!8609)

(declare-fun Unit!8621 () Unit!8609)

(assert (=> b!138281 (= e!91925 Unit!8621)))

(declare-fun b!138282 () Bool)

(declare-fun res!115230 () Bool)

(assert (=> b!138282 (=> (not res!115230) (not e!91926))))

(assert (=> b!138282 (= res!115230 (isPrefixOf!0 (_2!6354 lt!215848) (_2!6352 lt!215018)))))

(declare-fun b!138283 () Bool)

(declare-fun lt!215850 () Unit!8609)

(assert (=> b!138283 (= e!91925 lt!215850)))

(declare-fun lt!215845 () (_ BitVec 64))

(assert (=> b!138283 (= lt!215845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!215854 () (_ BitVec 64))

(assert (=> b!138283 (= lt!215854 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(assert (=> b!138283 (= lt!215850 (arrayBitRangesEqSymmetric!0 (buf!3238 thiss!1634) (buf!3238 (_2!6352 lt!215018)) lt!215845 lt!215854))))

(assert (=> b!138283 (arrayBitRangesEq!0 (buf!3238 (_2!6352 lt!215018)) (buf!3238 thiss!1634) lt!215845 lt!215854)))

(declare-fun b!138284 () Bool)

(declare-fun res!115232 () Bool)

(assert (=> b!138284 (=> (not res!115232) (not e!91926))))

(assert (=> b!138284 (= res!115232 (isPrefixOf!0 (_1!6354 lt!215848) thiss!1634))))

(declare-fun d!44579 () Bool)

(assert (=> d!44579 e!91926))

(declare-fun res!115231 () Bool)

(assert (=> d!44579 (=> (not res!115231) (not e!91926))))

(assert (=> d!44579 (= res!115231 (isPrefixOf!0 (_1!6354 lt!215848) (_2!6354 lt!215848)))))

(declare-fun lt!215847 () BitStream!4926)

(assert (=> d!44579 (= lt!215848 (tuple2!12063 lt!215847 (_2!6352 lt!215018)))))

(declare-fun lt!215851 () Unit!8609)

(declare-fun lt!215858 () Unit!8609)

(assert (=> d!44579 (= lt!215851 lt!215858)))

(assert (=> d!44579 (isPrefixOf!0 lt!215847 (_2!6352 lt!215018))))

(assert (=> d!44579 (= lt!215858 (lemmaIsPrefixTransitive!0 lt!215847 (_2!6352 lt!215018) (_2!6352 lt!215018)))))

(declare-fun lt!215849 () Unit!8609)

(declare-fun lt!215853 () Unit!8609)

(assert (=> d!44579 (= lt!215849 lt!215853)))

(assert (=> d!44579 (isPrefixOf!0 lt!215847 (_2!6352 lt!215018))))

(assert (=> d!44579 (= lt!215853 (lemmaIsPrefixTransitive!0 lt!215847 thiss!1634 (_2!6352 lt!215018)))))

(declare-fun lt!215855 () Unit!8609)

(assert (=> d!44579 (= lt!215855 e!91925)))

(declare-fun c!7750 () Bool)

(assert (=> d!44579 (= c!7750 (not (= (size!2831 (buf!3238 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!215852 () Unit!8609)

(declare-fun lt!215843 () Unit!8609)

(assert (=> d!44579 (= lt!215852 lt!215843)))

(assert (=> d!44579 (isPrefixOf!0 (_2!6352 lt!215018) (_2!6352 lt!215018))))

(assert (=> d!44579 (= lt!215843 (lemmaIsPrefixRefl!0 (_2!6352 lt!215018)))))

(declare-fun lt!215856 () Unit!8609)

(declare-fun lt!215842 () Unit!8609)

(assert (=> d!44579 (= lt!215856 lt!215842)))

(assert (=> d!44579 (= lt!215842 (lemmaIsPrefixRefl!0 (_2!6352 lt!215018)))))

(declare-fun lt!215846 () Unit!8609)

(declare-fun lt!215844 () Unit!8609)

(assert (=> d!44579 (= lt!215846 lt!215844)))

(assert (=> d!44579 (isPrefixOf!0 lt!215847 lt!215847)))

(assert (=> d!44579 (= lt!215844 (lemmaIsPrefixRefl!0 lt!215847))))

(declare-fun lt!215857 () Unit!8609)

(declare-fun lt!215859 () Unit!8609)

(assert (=> d!44579 (= lt!215857 lt!215859)))

(assert (=> d!44579 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44579 (= lt!215859 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44579 (= lt!215847 (BitStream!4927 (buf!3238 (_2!6352 lt!215018)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)))))

(assert (=> d!44579 (isPrefixOf!0 thiss!1634 (_2!6352 lt!215018))))

(assert (=> d!44579 (= (reader!0 thiss!1634 (_2!6352 lt!215018)) lt!215848)))

(assert (= (and d!44579 c!7750) b!138283))

(assert (= (and d!44579 (not c!7750)) b!138281))

(assert (= (and d!44579 res!115231) b!138284))

(assert (= (and b!138284 res!115232) b!138282))

(assert (= (and b!138282 res!115230) b!138280))

(declare-fun m!212739 () Bool)

(assert (=> d!44579 m!212739))

(assert (=> d!44579 m!211937))

(declare-fun m!212741 () Bool)

(assert (=> d!44579 m!212741))

(assert (=> d!44579 m!212587))

(declare-fun m!212743 () Bool)

(assert (=> d!44579 m!212743))

(declare-fun m!212745 () Bool)

(assert (=> d!44579 m!212745))

(declare-fun m!212747 () Bool)

(assert (=> d!44579 m!212747))

(assert (=> d!44579 m!212585))

(declare-fun m!212749 () Bool)

(assert (=> d!44579 m!212749))

(assert (=> d!44579 m!212705))

(assert (=> d!44579 m!212707))

(assert (=> b!138283 m!211961))

(declare-fun m!212751 () Bool)

(assert (=> b!138283 m!212751))

(declare-fun m!212753 () Bool)

(assert (=> b!138283 m!212753))

(declare-fun m!212755 () Bool)

(assert (=> b!138282 m!212755))

(declare-fun m!212757 () Bool)

(assert (=> b!138284 m!212757))

(declare-fun m!212759 () Bool)

(assert (=> b!138280 m!212759))

(assert (=> b!138280 m!211963))

(assert (=> b!138280 m!211961))

(assert (=> b!137935 d!44579))

(declare-fun d!44581 () Bool)

(declare-fun res!115233 () Bool)

(declare-fun e!91928 () Bool)

(assert (=> d!44581 (=> (not res!115233) (not e!91928))))

(assert (=> d!44581 (= res!115233 (= (size!2831 (buf!3238 thiss!1634)) (size!2831 (buf!3238 (_2!6352 lt!215018)))))))

(assert (=> d!44581 (= (isPrefixOf!0 thiss!1634 (_2!6352 lt!215018)) e!91928)))

(declare-fun b!138285 () Bool)

(declare-fun res!115235 () Bool)

(assert (=> b!138285 (=> (not res!115235) (not e!91928))))

(assert (=> b!138285 (= res!115235 (bvsle (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634)) (bitIndex!0 (size!2831 (buf!3238 (_2!6352 lt!215018))) (currentByte!6045 (_2!6352 lt!215018)) (currentBit!6040 (_2!6352 lt!215018)))))))

(declare-fun b!138286 () Bool)

(declare-fun e!91927 () Bool)

(assert (=> b!138286 (= e!91928 e!91927)))

(declare-fun res!115234 () Bool)

(assert (=> b!138286 (=> res!115234 e!91927)))

(assert (=> b!138286 (= res!115234 (= (size!2831 (buf!3238 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!138287 () Bool)

(assert (=> b!138287 (= e!91927 (arrayBitRangesEq!0 (buf!3238 thiss!1634) (buf!3238 (_2!6352 lt!215018)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2831 (buf!3238 thiss!1634)) (currentByte!6045 thiss!1634) (currentBit!6040 thiss!1634))))))

(assert (= (and d!44581 res!115233) b!138285))

(assert (= (and b!138285 res!115235) b!138286))

(assert (= (and b!138286 (not res!115234)) b!138287))

(assert (=> b!138285 m!211961))

(assert (=> b!138285 m!211963))

(assert (=> b!138287 m!211961))

(assert (=> b!138287 m!211961))

(declare-fun m!212761 () Bool)

(assert (=> b!138287 m!212761))

(assert (=> b!137934 d!44581))

(declare-fun d!44583 () Bool)

(assert (=> d!44583 (= (invariant!0 (currentBit!6040 thiss!1634) (currentByte!6045 thiss!1634) (size!2831 (buf!3238 thiss!1634))) (and (bvsge (currentBit!6040 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6040 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6045 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6045 thiss!1634) (size!2831 (buf!3238 thiss!1634))) (and (= (currentBit!6040 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6045 thiss!1634) (size!2831 (buf!3238 thiss!1634)))))))))

(assert (=> b!137945 d!44583))

(declare-fun d!44585 () Bool)

(assert (=> d!44585 (= (array_inv!2620 (buf!3238 thiss!1634)) (bvsge (size!2831 (buf!3238 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!137938 d!44585))

(declare-fun d!44587 () Bool)

(declare-fun res!115236 () Bool)

(declare-fun e!91929 () Bool)

(assert (=> d!44587 (=> res!115236 e!91929)))

(assert (=> d!44587 (= res!115236 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44587 (= (arrayRangesEq!234 arr!237 (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404) e!91929)))

(declare-fun b!138288 () Bool)

(declare-fun e!91930 () Bool)

(assert (=> b!138288 (= e!91929 e!91930)))

(declare-fun res!115237 () Bool)

(assert (=> b!138288 (=> (not res!115237) (not e!91930))))

(assert (=> b!138288 (= res!115237 (= (select (arr!3517 arr!237) #b00000000000000000000000000000000) (select (arr!3517 (_2!6353 lt!215024)) #b00000000000000000000000000000000)))))

(declare-fun b!138289 () Bool)

(assert (=> b!138289 (= e!91930 (arrayRangesEq!234 arr!237 (_2!6353 lt!215024) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44587 (not res!115236)) b!138288))

(assert (= (and b!138288 res!115237) b!138289))

(assert (=> b!138288 m!212727))

(assert (=> b!138288 m!212607))

(declare-fun m!212763 () Bool)

(assert (=> b!138289 m!212763))

(assert (=> b!137937 d!44587))

(declare-fun d!44589 () Bool)

(assert (=> d!44589 (arrayRangesEq!234 arr!237 (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215862 () Unit!8609)

(declare-fun choose!81 (array!6251 array!6251 array!6251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> d!44589 (= lt!215862 (choose!81 arr!237 (_2!6353 lt!215035) (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!44589 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!44589 (= (arrayRangesEqTransitive!36 arr!237 (_2!6353 lt!215035) (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404 to!404) lt!215862)))

(declare-fun bs!10881 () Bool)

(assert (= bs!10881 d!44589))

(assert (=> bs!10881 m!211969))

(declare-fun m!212765 () Bool)

(assert (=> bs!10881 m!212765))

(assert (=> b!137937 d!44589))

(declare-fun d!44591 () Bool)

(declare-fun res!115238 () Bool)

(declare-fun e!91931 () Bool)

(assert (=> d!44591 (=> res!115238 e!91931)))

(assert (=> d!44591 (= res!115238 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44591 (= (arrayRangesEq!234 (_2!6353 lt!215035) (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404) e!91931)))

(declare-fun b!138290 () Bool)

(declare-fun e!91932 () Bool)

(assert (=> b!138290 (= e!91931 e!91932)))

(declare-fun res!115239 () Bool)

(assert (=> b!138290 (=> (not res!115239) (not e!91932))))

(assert (=> b!138290 (= res!115239 (= (select (arr!3517 (_2!6353 lt!215035)) #b00000000000000000000000000000000) (select (arr!3517 (_2!6353 lt!215024)) #b00000000000000000000000000000000)))))

(declare-fun b!138291 () Bool)

(assert (=> b!138291 (= e!91932 (arrayRangesEq!234 (_2!6353 lt!215035) (_2!6353 lt!215024) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44591 (not res!115238)) b!138290))

(assert (= (and b!138290 res!115239) b!138291))

(assert (=> b!138290 m!212639))

(assert (=> b!138290 m!212607))

(declare-fun m!212767 () Bool)

(assert (=> b!138291 m!212767))

(assert (=> b!137937 d!44591))

(declare-fun d!44593 () Bool)

(assert (=> d!44593 (arrayRangesEq!234 (_2!6353 lt!215035) (_2!6353 lt!215024) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!215865 () Unit!8609)

(declare-fun choose!82 (array!6251 array!6251 (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> d!44593 (= lt!215865 (choose!82 (_2!6353 lt!215024) (_2!6353 lt!215035) #b00000000000000000000000000000000 to!404))))

(assert (=> d!44593 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!2831 (_2!6353 lt!215024))))))

(assert (=> d!44593 (= (arrayRangesEqSymmetricLemma!47 (_2!6353 lt!215024) (_2!6353 lt!215035) #b00000000000000000000000000000000 to!404) lt!215865)))

(declare-fun bs!10882 () Bool)

(assert (= bs!10882 d!44593))

(assert (=> bs!10882 m!211973))

(declare-fun m!212769 () Bool)

(assert (=> bs!10882 m!212769))

(assert (=> b!137937 d!44593))

(check-sat (not d!44593) (not d!44537) (not d!44535) (not d!44573) (not b!138259) (not b!138215) (not b!138270) (not d!44498) (not b!138230) (not d!44514) (not b!138283) (not d!44547) (not d!44502) (not b!138291) (not d!44518) (not b!138243) (not d!44579) (not b!138216) (not d!44553) (not d!44512) (not b!138217) (not b!138289) (not b!138280) (not d!44520) (not d!44543) (not d!44545) (not d!44532) (not b!138213) (not d!44555) (not b!138287) (not d!44571) (not b!138261) (not b!138234) (not d!44551) (not d!44530) (not b!138271) (not d!44522) (not b!138202) (not b!138257) (not b!138256) (not d!44524) (not b!138232) (not d!44569) (not d!44549) (not d!44500) (not b!138200) (not d!44510) (not b!138279) (not b!138282) (not b!138285) (not d!44541) (not d!44557) (not b!138258) (not b!138223) (not d!44565) (not d!44504) (not b!138269) (not b!138255) (not b!138231) (not d!44526) (not b!138267) (not d!44577) (not d!44559) (not b!138284) (not d!44561) (not b!138254) (not d!44589) (not d!44506) (not d!44516))
(check-sat)
