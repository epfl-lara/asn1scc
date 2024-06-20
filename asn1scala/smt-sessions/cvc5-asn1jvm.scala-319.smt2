; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6908 () Bool)

(assert start!6908)

(declare-fun b!33034 () Bool)

(declare-fun res!28265 () Bool)

(declare-fun e!21879 () Bool)

(assert (=> b!33034 (=> res!28265 e!21879)))

(declare-datatypes ((array!1844 0))(
  ( (array!1845 (arr!1289 (Array (_ BitVec 32) (_ BitVec 8))) (size!814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1420 0))(
  ( (BitStream!1421 (buf!1142 array!1844) (currentByte!2509 (_ BitVec 32)) (currentBit!2504 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2483 0))(
  ( (Unit!2484) )
))
(declare-datatypes ((tuple2!3370 0))(
  ( (tuple2!3371 (_1!1772 Unit!2483) (_2!1772 BitStream!1420)) )
))
(declare-fun lt!48727 () tuple2!3370)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33034 (= res!28265 (not (invariant!0 (currentBit!2504 (_2!1772 lt!48727)) (currentByte!2509 (_2!1772 lt!48727)) (size!814 (buf!1142 (_2!1772 lt!48727))))))))

(declare-fun e!21884 () Bool)

(declare-fun lt!48723 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!33035 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!48721 () tuple2!3370)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33035 (= e!21884 (= lt!48723 (bvsub (bvsub (bvadd (bitIndex!0 (size!814 (buf!1142 (_2!1772 lt!48721))) (currentByte!2509 (_2!1772 lt!48721)) (currentBit!2504 (_2!1772 lt!48721))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!33036 () Bool)

(declare-fun res!28276 () Bool)

(assert (=> b!33036 (=> res!28276 e!21879)))

(declare-fun thiss!1379 () BitStream!1420)

(assert (=> b!33036 (= res!28276 (not (= (size!814 (buf!1142 thiss!1379)) (size!814 (buf!1142 (_2!1772 lt!48727))))))))

(declare-fun res!28271 () Bool)

(declare-fun e!21881 () Bool)

(assert (=> start!6908 (=> (not res!28271) (not e!21881))))

(declare-fun srcBuffer!2 () array!1844)

(assert (=> start!6908 (= res!28271 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!814 srcBuffer!2))))))))

(assert (=> start!6908 e!21881))

(assert (=> start!6908 true))

(declare-fun array_inv!763 (array!1844) Bool)

(assert (=> start!6908 (array_inv!763 srcBuffer!2)))

(declare-fun e!21887 () Bool)

(declare-fun inv!12 (BitStream!1420) Bool)

(assert (=> start!6908 (and (inv!12 thiss!1379) e!21887)))

(declare-fun b!33037 () Bool)

(declare-fun e!21889 () Bool)

(assert (=> b!33037 (= e!21889 e!21879)))

(declare-fun res!28274 () Bool)

(assert (=> b!33037 (=> res!28274 e!21879)))

(declare-fun lt!48725 () (_ BitVec 64))

(assert (=> b!33037 (= res!28274 (not (= lt!48723 (bvsub (bvadd lt!48725 to!314) i!635))))))

(assert (=> b!33037 (= lt!48723 (bitIndex!0 (size!814 (buf!1142 (_2!1772 lt!48727))) (currentByte!2509 (_2!1772 lt!48727)) (currentBit!2504 (_2!1772 lt!48727))))))

(declare-fun b!33038 () Bool)

(declare-fun res!28266 () Bool)

(declare-fun e!21886 () Bool)

(assert (=> b!33038 (=> res!28266 e!21886)))

(assert (=> b!33038 (= res!28266 (not (invariant!0 (currentBit!2504 (_2!1772 lt!48721)) (currentByte!2509 (_2!1772 lt!48721)) (size!814 (buf!1142 (_2!1772 lt!48727))))))))

(declare-fun b!33039 () Bool)

(declare-fun res!28267 () Bool)

(assert (=> b!33039 (=> (not res!28267) (not e!21881))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33039 (= res!28267 (validate_offset_bits!1 ((_ sign_extend 32) (size!814 (buf!1142 thiss!1379))) ((_ sign_extend 32) (currentByte!2509 thiss!1379)) ((_ sign_extend 32) (currentBit!2504 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33040 () Bool)

(declare-fun e!21878 () Bool)

(assert (=> b!33040 (= e!21878 e!21889)))

(declare-fun res!28268 () Bool)

(assert (=> b!33040 (=> res!28268 e!21889)))

(declare-fun isPrefixOf!0 (BitStream!1420 BitStream!1420) Bool)

(assert (=> b!33040 (= res!28268 (not (isPrefixOf!0 (_2!1772 lt!48721) (_2!1772 lt!48727))))))

(assert (=> b!33040 (isPrefixOf!0 thiss!1379 (_2!1772 lt!48727))))

(declare-fun lt!48731 () Unit!2483)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1420 BitStream!1420 BitStream!1420) Unit!2483)

(assert (=> b!33040 (= lt!48731 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1772 lt!48721) (_2!1772 lt!48727)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1420 array!1844 (_ BitVec 64) (_ BitVec 64)) tuple2!3370)

(assert (=> b!33040 (= lt!48727 (appendBitsMSBFirstLoop!0 (_2!1772 lt!48721) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21880 () Bool)

(assert (=> b!33040 e!21880))

(declare-fun res!28278 () Bool)

(assert (=> b!33040 (=> (not res!28278) (not e!21880))))

(assert (=> b!33040 (= res!28278 (validate_offset_bits!1 ((_ sign_extend 32) (size!814 (buf!1142 (_2!1772 lt!48721)))) ((_ sign_extend 32) (currentByte!2509 thiss!1379)) ((_ sign_extend 32) (currentBit!2504 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48726 () Unit!2483)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1420 array!1844 (_ BitVec 64)) Unit!2483)

(assert (=> b!33040 (= lt!48726 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1142 (_2!1772 lt!48721)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3372 0))(
  ( (tuple2!3373 (_1!1773 BitStream!1420) (_2!1773 BitStream!1420)) )
))
(declare-fun lt!48733 () tuple2!3372)

(declare-fun reader!0 (BitStream!1420 BitStream!1420) tuple2!3372)

(assert (=> b!33040 (= lt!48733 (reader!0 thiss!1379 (_2!1772 lt!48721)))))

(declare-fun b!33041 () Bool)

(declare-fun res!28269 () Bool)

(declare-fun e!21885 () Bool)

(assert (=> b!33041 (=> res!28269 e!21885)))

(declare-datatypes ((List!411 0))(
  ( (Nil!408) (Cons!407 (h!526 Bool) (t!1161 List!411)) )
))
(declare-fun lt!48732 () List!411)

(declare-fun length!137 (List!411) Int)

(assert (=> b!33041 (= res!28269 (<= (length!137 lt!48732) 0))))

(declare-fun b!33042 () Bool)

(assert (=> b!33042 (= e!21886 e!21885)))

(declare-fun res!28270 () Bool)

(assert (=> b!33042 (=> res!28270 e!21885)))

(assert (=> b!33042 (= res!28270 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!48728 () (_ BitVec 64))

(declare-fun lt!48735 () tuple2!3372)

(declare-fun lt!48720 () List!411)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1420 BitStream!1420 (_ BitVec 64)) List!411)

(assert (=> b!33042 (= lt!48720 (bitStreamReadBitsIntoList!0 (_2!1772 lt!48727) (_1!1773 lt!48735) lt!48728))))

(declare-fun lt!48734 () tuple2!3372)

(assert (=> b!33042 (= lt!48732 (bitStreamReadBitsIntoList!0 (_2!1772 lt!48727) (_1!1773 lt!48734) (bvsub to!314 i!635)))))

(assert (=> b!33042 (validate_offset_bits!1 ((_ sign_extend 32) (size!814 (buf!1142 (_2!1772 lt!48727)))) ((_ sign_extend 32) (currentByte!2509 (_2!1772 lt!48721))) ((_ sign_extend 32) (currentBit!2504 (_2!1772 lt!48721))) lt!48728)))

(declare-fun lt!48736 () Unit!2483)

(assert (=> b!33042 (= lt!48736 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1772 lt!48721) (buf!1142 (_2!1772 lt!48727)) lt!48728))))

(assert (=> b!33042 (= lt!48735 (reader!0 (_2!1772 lt!48721) (_2!1772 lt!48727)))))

(assert (=> b!33042 (validate_offset_bits!1 ((_ sign_extend 32) (size!814 (buf!1142 (_2!1772 lt!48727)))) ((_ sign_extend 32) (currentByte!2509 thiss!1379)) ((_ sign_extend 32) (currentBit!2504 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48730 () Unit!2483)

(assert (=> b!33042 (= lt!48730 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1142 (_2!1772 lt!48727)) (bvsub to!314 i!635)))))

(assert (=> b!33042 (= lt!48734 (reader!0 thiss!1379 (_2!1772 lt!48727)))))

(declare-fun b!33043 () Bool)

(assert (=> b!33043 (= e!21887 (array_inv!763 (buf!1142 thiss!1379)))))

(declare-fun b!33044 () Bool)

(declare-fun res!28277 () Bool)

(assert (=> b!33044 (=> res!28277 e!21886)))

(assert (=> b!33044 (= res!28277 (not (invariant!0 (currentBit!2504 (_2!1772 lt!48721)) (currentByte!2509 (_2!1772 lt!48721)) (size!814 (buf!1142 (_2!1772 lt!48721))))))))

(declare-fun b!33045 () Bool)

(declare-fun e!21882 () Bool)

(assert (=> b!33045 (= e!21882 e!21878)))

(declare-fun res!28275 () Bool)

(assert (=> b!33045 (=> res!28275 e!21878)))

(assert (=> b!33045 (= res!28275 (not (isPrefixOf!0 thiss!1379 (_2!1772 lt!48721))))))

(assert (=> b!33045 (validate_offset_bits!1 ((_ sign_extend 32) (size!814 (buf!1142 (_2!1772 lt!48721)))) ((_ sign_extend 32) (currentByte!2509 (_2!1772 lt!48721))) ((_ sign_extend 32) (currentBit!2504 (_2!1772 lt!48721))) lt!48728)))

(assert (=> b!33045 (= lt!48728 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48722 () Unit!2483)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1420 BitStream!1420 (_ BitVec 64) (_ BitVec 64)) Unit!2483)

(assert (=> b!33045 (= lt!48722 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1772 lt!48721) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1420 (_ BitVec 8) (_ BitVec 32)) tuple2!3370)

(assert (=> b!33045 (= lt!48721 (appendBitFromByte!0 thiss!1379 (select (arr!1289 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33046 () Bool)

(assert (=> b!33046 (= e!21885 true)))

(declare-fun tail!128 (List!411) List!411)

(assert (=> b!33046 (= lt!48720 (tail!128 lt!48732))))

(declare-fun lt!48724 () Unit!2483)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1420 BitStream!1420 BitStream!1420 BitStream!1420 (_ BitVec 64) List!411) Unit!2483)

(assert (=> b!33046 (= lt!48724 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1772 lt!48727) (_2!1772 lt!48727) (_1!1773 lt!48734) (_1!1773 lt!48735) (bvsub to!314 i!635) lt!48732))))

(declare-fun b!33047 () Bool)

(declare-fun head!248 (List!411) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1420 array!1844 (_ BitVec 64) (_ BitVec 64)) List!411)

(assert (=> b!33047 (= e!21880 (= (head!248 (byteArrayBitContentToList!0 (_2!1772 lt!48721) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!248 (bitStreamReadBitsIntoList!0 (_2!1772 lt!48721) (_1!1773 lt!48733) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33048 () Bool)

(assert (=> b!33048 (= e!21879 e!21886)))

(declare-fun res!28273 () Bool)

(assert (=> b!33048 (=> res!28273 e!21886)))

(assert (=> b!33048 (= res!28273 (not (= (size!814 (buf!1142 (_2!1772 lt!48721))) (size!814 (buf!1142 (_2!1772 lt!48727))))))))

(assert (=> b!33048 e!21884))

(declare-fun res!28264 () Bool)

(assert (=> b!33048 (=> (not res!28264) (not e!21884))))

(assert (=> b!33048 (= res!28264 (= (size!814 (buf!1142 (_2!1772 lt!48727))) (size!814 (buf!1142 thiss!1379))))))

(declare-fun b!33049 () Bool)

(assert (=> b!33049 (= e!21881 (not e!21882))))

(declare-fun res!28272 () Bool)

(assert (=> b!33049 (=> res!28272 e!21882)))

(assert (=> b!33049 (= res!28272 (bvsge i!635 to!314))))

(assert (=> b!33049 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48729 () Unit!2483)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1420) Unit!2483)

(assert (=> b!33049 (= lt!48729 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33049 (= lt!48725 (bitIndex!0 (size!814 (buf!1142 thiss!1379)) (currentByte!2509 thiss!1379) (currentBit!2504 thiss!1379)))))

(assert (= (and start!6908 res!28271) b!33039))

(assert (= (and b!33039 res!28267) b!33049))

(assert (= (and b!33049 (not res!28272)) b!33045))

(assert (= (and b!33045 (not res!28275)) b!33040))

(assert (= (and b!33040 res!28278) b!33047))

(assert (= (and b!33040 (not res!28268)) b!33037))

(assert (= (and b!33037 (not res!28274)) b!33034))

(assert (= (and b!33034 (not res!28265)) b!33036))

(assert (= (and b!33036 (not res!28276)) b!33048))

(assert (= (and b!33048 res!28264) b!33035))

(assert (= (and b!33048 (not res!28273)) b!33044))

(assert (= (and b!33044 (not res!28277)) b!33038))

(assert (= (and b!33038 (not res!28266)) b!33042))

(assert (= (and b!33042 (not res!28270)) b!33041))

(assert (= (and b!33041 (not res!28269)) b!33046))

(assert (= start!6908 b!33043))

(declare-fun m!48939 () Bool)

(assert (=> b!33046 m!48939))

(declare-fun m!48941 () Bool)

(assert (=> b!33046 m!48941))

(declare-fun m!48943 () Bool)

(assert (=> b!33038 m!48943))

(declare-fun m!48945 () Bool)

(assert (=> b!33049 m!48945))

(declare-fun m!48947 () Bool)

(assert (=> b!33049 m!48947))

(declare-fun m!48949 () Bool)

(assert (=> b!33049 m!48949))

(declare-fun m!48951 () Bool)

(assert (=> b!33039 m!48951))

(declare-fun m!48953 () Bool)

(assert (=> b!33042 m!48953))

(declare-fun m!48955 () Bool)

(assert (=> b!33042 m!48955))

(declare-fun m!48957 () Bool)

(assert (=> b!33042 m!48957))

(declare-fun m!48959 () Bool)

(assert (=> b!33042 m!48959))

(declare-fun m!48961 () Bool)

(assert (=> b!33042 m!48961))

(declare-fun m!48963 () Bool)

(assert (=> b!33042 m!48963))

(declare-fun m!48965 () Bool)

(assert (=> b!33042 m!48965))

(declare-fun m!48967 () Bool)

(assert (=> b!33042 m!48967))

(declare-fun m!48969 () Bool)

(assert (=> b!33044 m!48969))

(declare-fun m!48971 () Bool)

(assert (=> b!33041 m!48971))

(declare-fun m!48973 () Bool)

(assert (=> b!33034 m!48973))

(declare-fun m!48975 () Bool)

(assert (=> b!33043 m!48975))

(declare-fun m!48977 () Bool)

(assert (=> b!33047 m!48977))

(assert (=> b!33047 m!48977))

(declare-fun m!48979 () Bool)

(assert (=> b!33047 m!48979))

(declare-fun m!48981 () Bool)

(assert (=> b!33047 m!48981))

(assert (=> b!33047 m!48981))

(declare-fun m!48983 () Bool)

(assert (=> b!33047 m!48983))

(declare-fun m!48985 () Bool)

(assert (=> start!6908 m!48985))

(declare-fun m!48987 () Bool)

(assert (=> start!6908 m!48987))

(declare-fun m!48989 () Bool)

(assert (=> b!33040 m!48989))

(declare-fun m!48991 () Bool)

(assert (=> b!33040 m!48991))

(declare-fun m!48993 () Bool)

(assert (=> b!33040 m!48993))

(declare-fun m!48995 () Bool)

(assert (=> b!33040 m!48995))

(declare-fun m!48997 () Bool)

(assert (=> b!33040 m!48997))

(declare-fun m!48999 () Bool)

(assert (=> b!33040 m!48999))

(declare-fun m!49001 () Bool)

(assert (=> b!33040 m!49001))

(declare-fun m!49003 () Bool)

(assert (=> b!33035 m!49003))

(declare-fun m!49005 () Bool)

(assert (=> b!33037 m!49005))

(declare-fun m!49007 () Bool)

(assert (=> b!33045 m!49007))

(declare-fun m!49009 () Bool)

(assert (=> b!33045 m!49009))

(assert (=> b!33045 m!49009))

(declare-fun m!49011 () Bool)

(assert (=> b!33045 m!49011))

(declare-fun m!49013 () Bool)

(assert (=> b!33045 m!49013))

(declare-fun m!49015 () Bool)

(assert (=> b!33045 m!49015))

(push 1)

(assert (not b!33049))

(assert (not b!33041))

(assert (not b!33040))

(assert (not b!33045))

(assert (not start!6908))

(assert (not b!33044))

(assert (not b!33046))

(assert (not b!33042))

(assert (not b!33043))

(assert (not b!33047))

(assert (not b!33038))

(assert (not b!33035))

(assert (not b!33034))

(assert (not b!33039))

(assert (not b!33037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

