; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6760 () Bool)

(assert start!6760)

(declare-fun b!31893 () Bool)

(declare-fun e!21138 () Bool)

(declare-datatypes ((array!1813 0))(
  ( (array!1814 (arr!1269 (Array (_ BitVec 32) (_ BitVec 8))) (size!797 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1392 0))(
  ( (BitStream!1393 (buf!1125 array!1813) (currentByte!2486 (_ BitVec 32)) (currentBit!2481 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1392)

(declare-fun array_inv!749 (array!1813) Bool)

(assert (=> b!31893 (= e!21138 (array_inv!749 (buf!1125 thiss!1379)))))

(declare-fun b!31894 () Bool)

(declare-fun e!21135 () Bool)

(declare-fun e!21145 () Bool)

(assert (=> b!31894 (= e!21135 e!21145)))

(declare-fun res!27309 () Bool)

(assert (=> b!31894 (=> res!27309 e!21145)))

(declare-datatypes ((Unit!2425 0))(
  ( (Unit!2426) )
))
(declare-datatypes ((tuple2!3290 0))(
  ( (tuple2!3291 (_1!1732 Unit!2425) (_2!1732 BitStream!1392)) )
))
(declare-fun lt!46975 () tuple2!3290)

(declare-fun lt!46982 () tuple2!3290)

(assert (=> b!31894 (= res!27309 (not (= (size!797 (buf!1125 (_2!1732 lt!46975))) (size!797 (buf!1125 (_2!1732 lt!46982))))))))

(declare-fun e!21148 () Bool)

(assert (=> b!31894 e!21148))

(declare-fun res!27311 () Bool)

(assert (=> b!31894 (=> (not res!27311) (not e!21148))))

(assert (=> b!31894 (= res!27311 (= (size!797 (buf!1125 (_2!1732 lt!46982))) (size!797 (buf!1125 thiss!1379))))))

(declare-fun b!31895 () Bool)

(declare-fun res!27312 () Bool)

(assert (=> b!31895 (=> res!27312 e!21145)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31895 (= res!27312 (not (invariant!0 (currentBit!2481 (_2!1732 lt!46975)) (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46982))))))))

(declare-fun b!31896 () Bool)

(declare-fun e!21142 () Bool)

(declare-fun e!21144 () Bool)

(assert (=> b!31896 (= e!21142 e!21144)))

(declare-fun res!27318 () Bool)

(assert (=> b!31896 (=> res!27318 e!21144)))

(declare-datatypes ((tuple2!3292 0))(
  ( (tuple2!3293 (_1!1733 BitStream!1392) (_2!1733 BitStream!1392)) )
))
(declare-fun lt!46978 () tuple2!3292)

(declare-fun lt!46974 () Bool)

(declare-fun lt!46981 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1813 (_ BitVec 64)) Bool)

(assert (=> b!31896 (= res!27318 (not (= lt!46974 (bitAt!0 (buf!1125 (_1!1733 lt!46978)) lt!46981))))))

(declare-fun lt!46989 () tuple2!3292)

(assert (=> b!31896 (= lt!46974 (bitAt!0 (buf!1125 (_1!1733 lt!46989)) lt!46981))))

(declare-fun b!31897 () Bool)

(declare-fun res!27300 () Bool)

(declare-fun e!21137 () Bool)

(assert (=> b!31897 (=> (not res!27300) (not e!21137))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31897 (= res!27300 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 thiss!1379))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31898 () Bool)

(declare-fun res!27314 () Bool)

(declare-fun e!21147 () Bool)

(assert (=> b!31898 (=> res!27314 e!21147)))

(declare-datatypes ((List!397 0))(
  ( (Nil!394) (Cons!393 (h!512 Bool) (t!1147 List!397)) )
))
(declare-fun lt!46986 () List!397)

(declare-fun length!123 (List!397) Int)

(assert (=> b!31898 (= res!27314 (<= (length!123 lt!46986) 0))))

(declare-fun b!31899 () Bool)

(declare-fun e!21141 () Bool)

(declare-fun e!21146 () Bool)

(assert (=> b!31899 (= e!21141 e!21146)))

(declare-fun res!27301 () Bool)

(assert (=> b!31899 (=> res!27301 e!21146)))

(declare-fun isPrefixOf!0 (BitStream!1392 BitStream!1392) Bool)

(assert (=> b!31899 (= res!27301 (not (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!46982))))))

(assert (=> b!31899 (isPrefixOf!0 thiss!1379 (_2!1732 lt!46982))))

(declare-fun lt!46987 () Unit!2425)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1392 BitStream!1392 BitStream!1392) Unit!2425)

(assert (=> b!31899 (= lt!46987 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1732 lt!46975) (_2!1732 lt!46982)))))

(declare-fun srcBuffer!2 () array!1813)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1392 array!1813 (_ BitVec 64) (_ BitVec 64)) tuple2!3290)

(assert (=> b!31899 (= lt!46982 (appendBitsMSBFirstLoop!0 (_2!1732 lt!46975) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21143 () Bool)

(assert (=> b!31899 e!21143))

(declare-fun res!27303 () Bool)

(assert (=> b!31899 (=> (not res!27303) (not e!21143))))

(assert (=> b!31899 (= res!27303 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46972 () Unit!2425)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1392 array!1813 (_ BitVec 64)) Unit!2425)

(assert (=> b!31899 (= lt!46972 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1125 (_2!1732 lt!46975)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46979 () tuple2!3292)

(declare-fun reader!0 (BitStream!1392 BitStream!1392) tuple2!3292)

(assert (=> b!31899 (= lt!46979 (reader!0 thiss!1379 (_2!1732 lt!46975)))))

(declare-fun b!31900 () Bool)

(declare-fun res!27302 () Bool)

(assert (=> b!31900 (=> res!27302 e!21135)))

(assert (=> b!31900 (= res!27302 (not (invariant!0 (currentBit!2481 (_2!1732 lt!46982)) (currentByte!2486 (_2!1732 lt!46982)) (size!797 (buf!1125 (_2!1732 lt!46982))))))))

(declare-fun b!31901 () Bool)

(declare-fun head!234 (List!397) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1392 array!1813 (_ BitVec 64) (_ BitVec 64)) List!397)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1392 BitStream!1392 (_ BitVec 64)) List!397)

(assert (=> b!31901 (= e!21143 (= (head!234 (byteArrayBitContentToList!0 (_2!1732 lt!46975) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!234 (bitStreamReadBitsIntoList!0 (_2!1732 lt!46975) (_1!1733 lt!46979) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31902 () Bool)

(assert (=> b!31902 (= e!21147 e!21142)))

(declare-fun res!27313 () Bool)

(assert (=> b!31902 (=> res!27313 e!21142)))

(declare-fun lt!46988 () List!397)

(declare-fun lt!46976 () List!397)

(assert (=> b!31902 (= res!27313 (not (= lt!46988 lt!46976)))))

(assert (=> b!31902 (= lt!46976 lt!46988)))

(declare-fun tail!114 (List!397) List!397)

(assert (=> b!31902 (= lt!46988 (tail!114 lt!46986))))

(declare-fun lt!46985 () Unit!2425)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1392 BitStream!1392 BitStream!1392 BitStream!1392 (_ BitVec 64) List!397) Unit!2425)

(assert (=> b!31902 (= lt!46985 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1732 lt!46982) (_2!1732 lt!46982) (_1!1733 lt!46989) (_1!1733 lt!46978) (bvsub to!314 i!635) lt!46986))))

(declare-fun b!31903 () Bool)

(declare-fun res!27310 () Bool)

(assert (=> b!31903 (=> res!27310 e!21144)))

(assert (=> b!31903 (= res!27310 (not (= (head!234 (byteArrayBitContentToList!0 (_2!1732 lt!46982) srcBuffer!2 i!635 (bvsub to!314 i!635))) (bitAt!0 srcBuffer!2 i!635))))))

(declare-fun b!31904 () Bool)

(declare-fun e!21140 () Bool)

(assert (=> b!31904 (= e!21137 (not e!21140))))

(declare-fun res!27307 () Bool)

(assert (=> b!31904 (=> res!27307 e!21140)))

(assert (=> b!31904 (= res!27307 (bvsge i!635 to!314))))

(assert (=> b!31904 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!46983 () Unit!2425)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1392) Unit!2425)

(assert (=> b!31904 (= lt!46983 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31904 (= lt!46981 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(declare-fun b!31905 () Bool)

(assert (=> b!31905 (= e!21145 e!21147)))

(declare-fun res!27316 () Bool)

(assert (=> b!31905 (=> res!27316 e!21147)))

(assert (=> b!31905 (= res!27316 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!46980 () (_ BitVec 64))

(assert (=> b!31905 (= lt!46976 (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_1!1733 lt!46978) lt!46980))))

(assert (=> b!31905 (= lt!46986 (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_1!1733 lt!46989) (bvsub to!314 i!635)))))

(assert (=> b!31905 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!46980)))

(declare-fun lt!46990 () Unit!2425)

(assert (=> b!31905 (= lt!46990 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1732 lt!46975) (buf!1125 (_2!1732 lt!46982)) lt!46980))))

(assert (=> b!31905 (= lt!46978 (reader!0 (_2!1732 lt!46975) (_2!1732 lt!46982)))))

(assert (=> b!31905 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46973 () Unit!2425)

(assert (=> b!31905 (= lt!46973 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1125 (_2!1732 lt!46982)) (bvsub to!314 i!635)))))

(assert (=> b!31905 (= lt!46989 (reader!0 thiss!1379 (_2!1732 lt!46982)))))

(declare-fun b!31906 () Bool)

(assert (=> b!31906 (= e!21140 e!21141)))

(declare-fun res!27315 () Bool)

(assert (=> b!31906 (=> res!27315 e!21141)))

(assert (=> b!31906 (= res!27315 (not (isPrefixOf!0 thiss!1379 (_2!1732 lt!46975))))))

(assert (=> b!31906 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!46980)))

(assert (=> b!31906 (= lt!46980 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46977 () Unit!2425)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1392 BitStream!1392 (_ BitVec 64) (_ BitVec 64)) Unit!2425)

(assert (=> b!31906 (= lt!46977 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1732 lt!46975) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1392 (_ BitVec 8) (_ BitVec 32)) tuple2!3290)

(assert (=> b!31906 (= lt!46975 (appendBitFromByte!0 thiss!1379 (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!46984 () (_ BitVec 64))

(declare-fun b!31907 () Bool)

(assert (=> b!31907 (= e!21148 (= lt!46984 (bvsub (bvsub (bvadd (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31908 () Bool)

(assert (=> b!31908 (= e!21144 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!46981) (bvslt lt!46981 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975))))))))))

(declare-fun res!27317 () Bool)

(assert (=> start!6760 (=> (not res!27317) (not e!21137))))

(assert (=> start!6760 (= res!27317 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!797 srcBuffer!2))))))))

(assert (=> start!6760 e!21137))

(assert (=> start!6760 true))

(assert (=> start!6760 (array_inv!749 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1392) Bool)

(assert (=> start!6760 (and (inv!12 thiss!1379) e!21138)))

(declare-fun b!31909 () Bool)

(declare-fun res!27305 () Bool)

(assert (=> b!31909 (=> res!27305 e!21145)))

(assert (=> b!31909 (= res!27305 (not (invariant!0 (currentBit!2481 (_2!1732 lt!46975)) (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46975))))))))

(declare-fun b!31910 () Bool)

(declare-fun res!27308 () Bool)

(assert (=> b!31910 (=> res!27308 e!21135)))

(assert (=> b!31910 (= res!27308 (not (= (size!797 (buf!1125 thiss!1379)) (size!797 (buf!1125 (_2!1732 lt!46982))))))))

(declare-fun b!31911 () Bool)

(declare-fun res!27304 () Bool)

(assert (=> b!31911 (=> res!27304 e!21144)))

(assert (=> b!31911 (= res!27304 (not (= (head!234 lt!46986) lt!46974)))))

(declare-fun b!31912 () Bool)

(assert (=> b!31912 (= e!21146 e!21135)))

(declare-fun res!27306 () Bool)

(assert (=> b!31912 (=> res!27306 e!21135)))

(assert (=> b!31912 (= res!27306 (not (= lt!46984 (bvsub (bvadd lt!46981 to!314) i!635))))))

(assert (=> b!31912 (= lt!46984 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46982))) (currentByte!2486 (_2!1732 lt!46982)) (currentBit!2481 (_2!1732 lt!46982))))))

(assert (= (and start!6760 res!27317) b!31897))

(assert (= (and b!31897 res!27300) b!31904))

(assert (= (and b!31904 (not res!27307)) b!31906))

(assert (= (and b!31906 (not res!27315)) b!31899))

(assert (= (and b!31899 res!27303) b!31901))

(assert (= (and b!31899 (not res!27301)) b!31912))

(assert (= (and b!31912 (not res!27306)) b!31900))

(assert (= (and b!31900 (not res!27302)) b!31910))

(assert (= (and b!31910 (not res!27308)) b!31894))

(assert (= (and b!31894 res!27311) b!31907))

(assert (= (and b!31894 (not res!27309)) b!31909))

(assert (= (and b!31909 (not res!27305)) b!31895))

(assert (= (and b!31895 (not res!27312)) b!31905))

(assert (= (and b!31905 (not res!27316)) b!31898))

(assert (= (and b!31898 (not res!27314)) b!31902))

(assert (= (and b!31902 (not res!27313)) b!31896))

(assert (= (and b!31896 (not res!27318)) b!31911))

(assert (= (and b!31911 (not res!27304)) b!31903))

(assert (= (and b!31903 (not res!27310)) b!31908))

(assert (= start!6760 b!31893))

(declare-fun m!46995 () Bool)

(assert (=> b!31905 m!46995))

(declare-fun m!46997 () Bool)

(assert (=> b!31905 m!46997))

(declare-fun m!46999 () Bool)

(assert (=> b!31905 m!46999))

(declare-fun m!47001 () Bool)

(assert (=> b!31905 m!47001))

(declare-fun m!47003 () Bool)

(assert (=> b!31905 m!47003))

(declare-fun m!47005 () Bool)

(assert (=> b!31905 m!47005))

(declare-fun m!47007 () Bool)

(assert (=> b!31905 m!47007))

(declare-fun m!47009 () Bool)

(assert (=> b!31905 m!47009))

(declare-fun m!47011 () Bool)

(assert (=> b!31896 m!47011))

(declare-fun m!47013 () Bool)

(assert (=> b!31896 m!47013))

(declare-fun m!47015 () Bool)

(assert (=> b!31897 m!47015))

(declare-fun m!47017 () Bool)

(assert (=> b!31902 m!47017))

(declare-fun m!47019 () Bool)

(assert (=> b!31902 m!47019))

(declare-fun m!47021 () Bool)

(assert (=> b!31898 m!47021))

(declare-fun m!47023 () Bool)

(assert (=> b!31912 m!47023))

(declare-fun m!47025 () Bool)

(assert (=> b!31907 m!47025))

(declare-fun m!47027 () Bool)

(assert (=> b!31906 m!47027))

(declare-fun m!47029 () Bool)

(assert (=> b!31906 m!47029))

(declare-fun m!47031 () Bool)

(assert (=> b!31906 m!47031))

(declare-fun m!47033 () Bool)

(assert (=> b!31906 m!47033))

(assert (=> b!31906 m!47029))

(declare-fun m!47035 () Bool)

(assert (=> b!31906 m!47035))

(declare-fun m!47037 () Bool)

(assert (=> b!31895 m!47037))

(declare-fun m!47039 () Bool)

(assert (=> b!31909 m!47039))

(declare-fun m!47041 () Bool)

(assert (=> start!6760 m!47041))

(declare-fun m!47043 () Bool)

(assert (=> start!6760 m!47043))

(declare-fun m!47045 () Bool)

(assert (=> b!31904 m!47045))

(declare-fun m!47047 () Bool)

(assert (=> b!31904 m!47047))

(declare-fun m!47049 () Bool)

(assert (=> b!31904 m!47049))

(declare-fun m!47051 () Bool)

(assert (=> b!31899 m!47051))

(declare-fun m!47053 () Bool)

(assert (=> b!31899 m!47053))

(declare-fun m!47055 () Bool)

(assert (=> b!31899 m!47055))

(declare-fun m!47057 () Bool)

(assert (=> b!31899 m!47057))

(declare-fun m!47059 () Bool)

(assert (=> b!31899 m!47059))

(declare-fun m!47061 () Bool)

(assert (=> b!31899 m!47061))

(declare-fun m!47063 () Bool)

(assert (=> b!31899 m!47063))

(declare-fun m!47065 () Bool)

(assert (=> b!31893 m!47065))

(declare-fun m!47067 () Bool)

(assert (=> b!31901 m!47067))

(assert (=> b!31901 m!47067))

(declare-fun m!47069 () Bool)

(assert (=> b!31901 m!47069))

(declare-fun m!47071 () Bool)

(assert (=> b!31901 m!47071))

(assert (=> b!31901 m!47071))

(declare-fun m!47073 () Bool)

(assert (=> b!31901 m!47073))

(declare-fun m!47075 () Bool)

(assert (=> b!31903 m!47075))

(assert (=> b!31903 m!47075))

(declare-fun m!47077 () Bool)

(assert (=> b!31903 m!47077))

(declare-fun m!47079 () Bool)

(assert (=> b!31903 m!47079))

(declare-fun m!47081 () Bool)

(assert (=> b!31900 m!47081))

(declare-fun m!47083 () Bool)

(assert (=> b!31911 m!47083))

(check-sat (not b!31896) (not b!31893) (not b!31906) (not b!31904) (not b!31911) (not b!31899) (not b!31901) (not b!31902) (not b!31907) (not b!31912) (not b!31900) (not b!31909) (not b!31898) (not b!31905) (not start!6760) (not b!31895) (not b!31897) (not b!31903))
(check-sat)
(get-model)

(declare-fun d!9310 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!46980) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975)))) lt!46980))))

(declare-fun bs!2561 () Bool)

(assert (= bs!2561 d!9310))

(declare-fun m!47175 () Bool)

(assert (=> bs!2561 m!47175))

(assert (=> b!31905 d!9310))

(declare-fun d!9312 () Bool)

(assert (=> d!9312 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!46980)))

(declare-fun lt!47050 () Unit!2425)

(declare-fun choose!9 (BitStream!1392 array!1813 (_ BitVec 64) BitStream!1392) Unit!2425)

(assert (=> d!9312 (= lt!47050 (choose!9 (_2!1732 lt!46975) (buf!1125 (_2!1732 lt!46982)) lt!46980 (BitStream!1393 (buf!1125 (_2!1732 lt!46982)) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975)))))))

(assert (=> d!9312 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1732 lt!46975) (buf!1125 (_2!1732 lt!46982)) lt!46980) lt!47050)))

(declare-fun bs!2562 () Bool)

(assert (= bs!2562 d!9312))

(assert (=> bs!2562 m!46997))

(declare-fun m!47177 () Bool)

(assert (=> bs!2562 m!47177))

(assert (=> b!31905 d!9312))

(declare-fun d!9314 () Bool)

(declare-fun e!21196 () Bool)

(assert (=> d!9314 e!21196))

(declare-fun res!27382 () Bool)

(assert (=> d!9314 (=> (not res!27382) (not e!21196))))

(declare-fun lt!47093 () tuple2!3292)

(assert (=> d!9314 (= res!27382 (isPrefixOf!0 (_1!1733 lt!47093) (_2!1733 lt!47093)))))

(declare-fun lt!47105 () BitStream!1392)

(assert (=> d!9314 (= lt!47093 (tuple2!3293 lt!47105 (_2!1732 lt!46982)))))

(declare-fun lt!47100 () Unit!2425)

(declare-fun lt!47106 () Unit!2425)

(assert (=> d!9314 (= lt!47100 lt!47106)))

(assert (=> d!9314 (isPrefixOf!0 lt!47105 (_2!1732 lt!46982))))

(assert (=> d!9314 (= lt!47106 (lemmaIsPrefixTransitive!0 lt!47105 (_2!1732 lt!46982) (_2!1732 lt!46982)))))

(declare-fun lt!47104 () Unit!2425)

(declare-fun lt!47099 () Unit!2425)

(assert (=> d!9314 (= lt!47104 lt!47099)))

(assert (=> d!9314 (isPrefixOf!0 lt!47105 (_2!1732 lt!46982))))

(assert (=> d!9314 (= lt!47099 (lemmaIsPrefixTransitive!0 lt!47105 (_2!1732 lt!46975) (_2!1732 lt!46982)))))

(declare-fun lt!47109 () Unit!2425)

(declare-fun e!21195 () Unit!2425)

(assert (=> d!9314 (= lt!47109 e!21195)))

(declare-fun c!2160 () Bool)

(assert (=> d!9314 (= c!2160 (not (= (size!797 (buf!1125 (_2!1732 lt!46975))) #b00000000000000000000000000000000)))))

(declare-fun lt!47095 () Unit!2425)

(declare-fun lt!47094 () Unit!2425)

(assert (=> d!9314 (= lt!47095 lt!47094)))

(assert (=> d!9314 (isPrefixOf!0 (_2!1732 lt!46982) (_2!1732 lt!46982))))

(assert (=> d!9314 (= lt!47094 (lemmaIsPrefixRefl!0 (_2!1732 lt!46982)))))

(declare-fun lt!47091 () Unit!2425)

(declare-fun lt!47098 () Unit!2425)

(assert (=> d!9314 (= lt!47091 lt!47098)))

(assert (=> d!9314 (= lt!47098 (lemmaIsPrefixRefl!0 (_2!1732 lt!46982)))))

(declare-fun lt!47101 () Unit!2425)

(declare-fun lt!47110 () Unit!2425)

(assert (=> d!9314 (= lt!47101 lt!47110)))

(assert (=> d!9314 (isPrefixOf!0 lt!47105 lt!47105)))

(assert (=> d!9314 (= lt!47110 (lemmaIsPrefixRefl!0 lt!47105))))

(declare-fun lt!47103 () Unit!2425)

(declare-fun lt!47092 () Unit!2425)

(assert (=> d!9314 (= lt!47103 lt!47092)))

(assert (=> d!9314 (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!46975))))

(assert (=> d!9314 (= lt!47092 (lemmaIsPrefixRefl!0 (_2!1732 lt!46975)))))

(assert (=> d!9314 (= lt!47105 (BitStream!1393 (buf!1125 (_2!1732 lt!46982)) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))))))

(assert (=> d!9314 (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!46982))))

(assert (=> d!9314 (= (reader!0 (_2!1732 lt!46975) (_2!1732 lt!46982)) lt!47093)))

(declare-fun b!31983 () Bool)

(declare-fun res!27383 () Bool)

(assert (=> b!31983 (=> (not res!27383) (not e!21196))))

(assert (=> b!31983 (= res!27383 (isPrefixOf!0 (_1!1733 lt!47093) (_2!1732 lt!46975)))))

(declare-fun b!31984 () Bool)

(declare-fun lt!47097 () Unit!2425)

(assert (=> b!31984 (= e!21195 lt!47097)))

(declare-fun lt!47108 () (_ BitVec 64))

(assert (=> b!31984 (= lt!47108 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47102 () (_ BitVec 64))

(assert (=> b!31984 (= lt!47102 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1813 array!1813 (_ BitVec 64) (_ BitVec 64)) Unit!2425)

(assert (=> b!31984 (= lt!47097 (arrayBitRangesEqSymmetric!0 (buf!1125 (_2!1732 lt!46975)) (buf!1125 (_2!1732 lt!46982)) lt!47108 lt!47102))))

(declare-fun arrayBitRangesEq!0 (array!1813 array!1813 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31984 (arrayBitRangesEq!0 (buf!1125 (_2!1732 lt!46982)) (buf!1125 (_2!1732 lt!46975)) lt!47108 lt!47102)))

(declare-fun lt!47107 () (_ BitVec 64))

(declare-fun lt!47096 () (_ BitVec 64))

(declare-fun b!31985 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1392 (_ BitVec 64)) BitStream!1392)

(assert (=> b!31985 (= e!21196 (= (_1!1733 lt!47093) (withMovedBitIndex!0 (_2!1733 lt!47093) (bvsub lt!47096 lt!47107))))))

(assert (=> b!31985 (or (= (bvand lt!47096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47107 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47096 lt!47107) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31985 (= lt!47107 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46982))) (currentByte!2486 (_2!1732 lt!46982)) (currentBit!2481 (_2!1732 lt!46982))))))

(assert (=> b!31985 (= lt!47096 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))))))

(declare-fun b!31986 () Bool)

(declare-fun Unit!2429 () Unit!2425)

(assert (=> b!31986 (= e!21195 Unit!2429)))

(declare-fun b!31987 () Bool)

(declare-fun res!27384 () Bool)

(assert (=> b!31987 (=> (not res!27384) (not e!21196))))

(assert (=> b!31987 (= res!27384 (isPrefixOf!0 (_2!1733 lt!47093) (_2!1732 lt!46982)))))

(assert (= (and d!9314 c!2160) b!31984))

(assert (= (and d!9314 (not c!2160)) b!31986))

(assert (= (and d!9314 res!27382) b!31983))

(assert (= (and b!31983 res!27383) b!31987))

(assert (= (and b!31987 res!27384) b!31985))

(declare-fun m!47179 () Bool)

(assert (=> d!9314 m!47179))

(declare-fun m!47181 () Bool)

(assert (=> d!9314 m!47181))

(declare-fun m!47183 () Bool)

(assert (=> d!9314 m!47183))

(declare-fun m!47185 () Bool)

(assert (=> d!9314 m!47185))

(declare-fun m!47187 () Bool)

(assert (=> d!9314 m!47187))

(assert (=> d!9314 m!47063))

(declare-fun m!47189 () Bool)

(assert (=> d!9314 m!47189))

(declare-fun m!47191 () Bool)

(assert (=> d!9314 m!47191))

(declare-fun m!47193 () Bool)

(assert (=> d!9314 m!47193))

(declare-fun m!47195 () Bool)

(assert (=> d!9314 m!47195))

(declare-fun m!47197 () Bool)

(assert (=> d!9314 m!47197))

(assert (=> b!31984 m!47025))

(declare-fun m!47199 () Bool)

(assert (=> b!31984 m!47199))

(declare-fun m!47201 () Bool)

(assert (=> b!31984 m!47201))

(declare-fun m!47203 () Bool)

(assert (=> b!31987 m!47203))

(declare-fun m!47205 () Bool)

(assert (=> b!31985 m!47205))

(assert (=> b!31985 m!47023))

(assert (=> b!31985 m!47025))

(declare-fun m!47207 () Bool)

(assert (=> b!31983 m!47207))

(assert (=> b!31905 d!9314))

(declare-fun b!31999 () Bool)

(declare-fun e!21201 () Bool)

(declare-fun lt!47119 () List!397)

(assert (=> b!31999 (= e!21201 (> (length!123 lt!47119) 0))))

(declare-fun b!31998 () Bool)

(declare-fun isEmpty!87 (List!397) Bool)

(assert (=> b!31998 (= e!21201 (isEmpty!87 lt!47119))))

(declare-fun d!9316 () Bool)

(assert (=> d!9316 e!21201))

(declare-fun c!2166 () Bool)

(assert (=> d!9316 (= c!2166 (= lt!46980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3298 0))(
  ( (tuple2!3299 (_1!1736 List!397) (_2!1736 BitStream!1392)) )
))
(declare-fun e!21202 () tuple2!3298)

(assert (=> d!9316 (= lt!47119 (_1!1736 e!21202))))

(declare-fun c!2165 () Bool)

(assert (=> d!9316 (= c!2165 (= lt!46980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9316 (bvsge lt!46980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9316 (= (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_1!1733 lt!46978) lt!46980) lt!47119)))

(declare-datatypes ((tuple2!3300 0))(
  ( (tuple2!3301 (_1!1737 Bool) (_2!1737 BitStream!1392)) )
))
(declare-fun lt!47117 () tuple2!3300)

(declare-fun lt!47118 () (_ BitVec 64))

(declare-fun b!31997 () Bool)

(assert (=> b!31997 (= e!21202 (tuple2!3299 (Cons!393 (_1!1737 lt!47117) (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_2!1737 lt!47117) (bvsub lt!46980 lt!47118))) (_2!1737 lt!47117)))))

(declare-fun readBit!0 (BitStream!1392) tuple2!3300)

(assert (=> b!31997 (= lt!47117 (readBit!0 (_1!1733 lt!46978)))))

(assert (=> b!31997 (= lt!47118 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31996 () Bool)

(assert (=> b!31996 (= e!21202 (tuple2!3299 Nil!394 (_1!1733 lt!46978)))))

(assert (= (and d!9316 c!2165) b!31996))

(assert (= (and d!9316 (not c!2165)) b!31997))

(assert (= (and d!9316 c!2166) b!31998))

(assert (= (and d!9316 (not c!2166)) b!31999))

(declare-fun m!47209 () Bool)

(assert (=> b!31999 m!47209))

(declare-fun m!47211 () Bool)

(assert (=> b!31998 m!47211))

(declare-fun m!47213 () Bool)

(assert (=> b!31997 m!47213))

(declare-fun m!47215 () Bool)

(assert (=> b!31997 m!47215))

(assert (=> b!31905 d!9316))

(declare-fun d!9318 () Bool)

(assert (=> d!9318 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!47120 () Unit!2425)

(assert (=> d!9318 (= lt!47120 (choose!9 thiss!1379 (buf!1125 (_2!1732 lt!46982)) (bvsub to!314 i!635) (BitStream!1393 (buf!1125 (_2!1732 lt!46982)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379))))))

(assert (=> d!9318 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1125 (_2!1732 lt!46982)) (bvsub to!314 i!635)) lt!47120)))

(declare-fun bs!2563 () Bool)

(assert (= bs!2563 d!9318))

(assert (=> bs!2563 m!47005))

(declare-fun m!47217 () Bool)

(assert (=> bs!2563 m!47217))

(assert (=> b!31905 d!9318))

(declare-fun d!9320 () Bool)

(declare-fun e!21204 () Bool)

(assert (=> d!9320 e!21204))

(declare-fun res!27385 () Bool)

(assert (=> d!9320 (=> (not res!27385) (not e!21204))))

(declare-fun lt!47123 () tuple2!3292)

(assert (=> d!9320 (= res!27385 (isPrefixOf!0 (_1!1733 lt!47123) (_2!1733 lt!47123)))))

(declare-fun lt!47135 () BitStream!1392)

(assert (=> d!9320 (= lt!47123 (tuple2!3293 lt!47135 (_2!1732 lt!46982)))))

(declare-fun lt!47130 () Unit!2425)

(declare-fun lt!47136 () Unit!2425)

(assert (=> d!9320 (= lt!47130 lt!47136)))

(assert (=> d!9320 (isPrefixOf!0 lt!47135 (_2!1732 lt!46982))))

(assert (=> d!9320 (= lt!47136 (lemmaIsPrefixTransitive!0 lt!47135 (_2!1732 lt!46982) (_2!1732 lt!46982)))))

(declare-fun lt!47134 () Unit!2425)

(declare-fun lt!47129 () Unit!2425)

(assert (=> d!9320 (= lt!47134 lt!47129)))

(assert (=> d!9320 (isPrefixOf!0 lt!47135 (_2!1732 lt!46982))))

(assert (=> d!9320 (= lt!47129 (lemmaIsPrefixTransitive!0 lt!47135 thiss!1379 (_2!1732 lt!46982)))))

(declare-fun lt!47139 () Unit!2425)

(declare-fun e!21203 () Unit!2425)

(assert (=> d!9320 (= lt!47139 e!21203)))

(declare-fun c!2167 () Bool)

(assert (=> d!9320 (= c!2167 (not (= (size!797 (buf!1125 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!47125 () Unit!2425)

(declare-fun lt!47124 () Unit!2425)

(assert (=> d!9320 (= lt!47125 lt!47124)))

(assert (=> d!9320 (isPrefixOf!0 (_2!1732 lt!46982) (_2!1732 lt!46982))))

(assert (=> d!9320 (= lt!47124 (lemmaIsPrefixRefl!0 (_2!1732 lt!46982)))))

(declare-fun lt!47121 () Unit!2425)

(declare-fun lt!47128 () Unit!2425)

(assert (=> d!9320 (= lt!47121 lt!47128)))

(assert (=> d!9320 (= lt!47128 (lemmaIsPrefixRefl!0 (_2!1732 lt!46982)))))

(declare-fun lt!47131 () Unit!2425)

(declare-fun lt!47140 () Unit!2425)

(assert (=> d!9320 (= lt!47131 lt!47140)))

(assert (=> d!9320 (isPrefixOf!0 lt!47135 lt!47135)))

(assert (=> d!9320 (= lt!47140 (lemmaIsPrefixRefl!0 lt!47135))))

(declare-fun lt!47133 () Unit!2425)

(declare-fun lt!47122 () Unit!2425)

(assert (=> d!9320 (= lt!47133 lt!47122)))

(assert (=> d!9320 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9320 (= lt!47122 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9320 (= lt!47135 (BitStream!1393 (buf!1125 (_2!1732 lt!46982)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(assert (=> d!9320 (isPrefixOf!0 thiss!1379 (_2!1732 lt!46982))))

(assert (=> d!9320 (= (reader!0 thiss!1379 (_2!1732 lt!46982)) lt!47123)))

(declare-fun b!32000 () Bool)

(declare-fun res!27386 () Bool)

(assert (=> b!32000 (=> (not res!27386) (not e!21204))))

(assert (=> b!32000 (= res!27386 (isPrefixOf!0 (_1!1733 lt!47123) thiss!1379))))

(declare-fun b!32001 () Bool)

(declare-fun lt!47127 () Unit!2425)

(assert (=> b!32001 (= e!21203 lt!47127)))

(declare-fun lt!47138 () (_ BitVec 64))

(assert (=> b!32001 (= lt!47138 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47132 () (_ BitVec 64))

(assert (=> b!32001 (= lt!47132 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(assert (=> b!32001 (= lt!47127 (arrayBitRangesEqSymmetric!0 (buf!1125 thiss!1379) (buf!1125 (_2!1732 lt!46982)) lt!47138 lt!47132))))

(assert (=> b!32001 (arrayBitRangesEq!0 (buf!1125 (_2!1732 lt!46982)) (buf!1125 thiss!1379) lt!47138 lt!47132)))

(declare-fun b!32002 () Bool)

(declare-fun lt!47137 () (_ BitVec 64))

(declare-fun lt!47126 () (_ BitVec 64))

(assert (=> b!32002 (= e!21204 (= (_1!1733 lt!47123) (withMovedBitIndex!0 (_2!1733 lt!47123) (bvsub lt!47126 lt!47137))))))

(assert (=> b!32002 (or (= (bvand lt!47126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47126 lt!47137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32002 (= lt!47137 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46982))) (currentByte!2486 (_2!1732 lt!46982)) (currentBit!2481 (_2!1732 lt!46982))))))

(assert (=> b!32002 (= lt!47126 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(declare-fun b!32003 () Bool)

(declare-fun Unit!2430 () Unit!2425)

(assert (=> b!32003 (= e!21203 Unit!2430)))

(declare-fun b!32004 () Bool)

(declare-fun res!27387 () Bool)

(assert (=> b!32004 (=> (not res!27387) (not e!21204))))

(assert (=> b!32004 (= res!27387 (isPrefixOf!0 (_2!1733 lt!47123) (_2!1732 lt!46982)))))

(assert (= (and d!9320 c!2167) b!32001))

(assert (= (and d!9320 (not c!2167)) b!32003))

(assert (= (and d!9320 res!27385) b!32000))

(assert (= (and b!32000 res!27386) b!32004))

(assert (= (and b!32004 res!27387) b!32002))

(assert (=> d!9320 m!47179))

(declare-fun m!47219 () Bool)

(assert (=> d!9320 m!47219))

(assert (=> d!9320 m!47047))

(declare-fun m!47221 () Bool)

(assert (=> d!9320 m!47221))

(declare-fun m!47223 () Bool)

(assert (=> d!9320 m!47223))

(assert (=> d!9320 m!47061))

(declare-fun m!47225 () Bool)

(assert (=> d!9320 m!47225))

(assert (=> d!9320 m!47045))

(assert (=> d!9320 m!47193))

(declare-fun m!47227 () Bool)

(assert (=> d!9320 m!47227))

(declare-fun m!47229 () Bool)

(assert (=> d!9320 m!47229))

(assert (=> b!32001 m!47049))

(declare-fun m!47231 () Bool)

(assert (=> b!32001 m!47231))

(declare-fun m!47233 () Bool)

(assert (=> b!32001 m!47233))

(declare-fun m!47235 () Bool)

(assert (=> b!32004 m!47235))

(declare-fun m!47237 () Bool)

(assert (=> b!32002 m!47237))

(assert (=> b!32002 m!47023))

(assert (=> b!32002 m!47049))

(declare-fun m!47239 () Bool)

(assert (=> b!32000 m!47239))

(assert (=> b!31905 d!9320))

(declare-fun b!32008 () Bool)

(declare-fun e!21205 () Bool)

(declare-fun lt!47143 () List!397)

(assert (=> b!32008 (= e!21205 (> (length!123 lt!47143) 0))))

(declare-fun b!32007 () Bool)

(assert (=> b!32007 (= e!21205 (isEmpty!87 lt!47143))))

(declare-fun d!9322 () Bool)

(assert (=> d!9322 e!21205))

(declare-fun c!2169 () Bool)

(assert (=> d!9322 (= c!2169 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21206 () tuple2!3298)

(assert (=> d!9322 (= lt!47143 (_1!1736 e!21206))))

(declare-fun c!2168 () Bool)

(assert (=> d!9322 (= c!2168 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9322 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9322 (= (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_1!1733 lt!46989) (bvsub to!314 i!635)) lt!47143)))

(declare-fun b!32006 () Bool)

(declare-fun lt!47142 () (_ BitVec 64))

(declare-fun lt!47141 () tuple2!3300)

(assert (=> b!32006 (= e!21206 (tuple2!3299 (Cons!393 (_1!1737 lt!47141) (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_2!1737 lt!47141) (bvsub (bvsub to!314 i!635) lt!47142))) (_2!1737 lt!47141)))))

(assert (=> b!32006 (= lt!47141 (readBit!0 (_1!1733 lt!46989)))))

(assert (=> b!32006 (= lt!47142 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32005 () Bool)

(assert (=> b!32005 (= e!21206 (tuple2!3299 Nil!394 (_1!1733 lt!46989)))))

(assert (= (and d!9322 c!2168) b!32005))

(assert (= (and d!9322 (not c!2168)) b!32006))

(assert (= (and d!9322 c!2169) b!32007))

(assert (= (and d!9322 (not c!2169)) b!32008))

(declare-fun m!47241 () Bool)

(assert (=> b!32008 m!47241))

(declare-fun m!47243 () Bool)

(assert (=> b!32007 m!47243))

(declare-fun m!47245 () Bool)

(assert (=> b!32006 m!47245))

(declare-fun m!47247 () Bool)

(assert (=> b!32006 m!47247))

(assert (=> b!31905 d!9322))

(declare-fun d!9324 () Bool)

(assert (=> d!9324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2564 () Bool)

(assert (= bs!2564 d!9324))

(declare-fun m!47249 () Bool)

(assert (=> bs!2564 m!47249))

(assert (=> b!31905 d!9324))

(declare-fun d!9326 () Bool)

(declare-fun res!27394 () Bool)

(declare-fun e!21211 () Bool)

(assert (=> d!9326 (=> (not res!27394) (not e!21211))))

(assert (=> d!9326 (= res!27394 (= (size!797 (buf!1125 thiss!1379)) (size!797 (buf!1125 (_2!1732 lt!46975)))))))

(assert (=> d!9326 (= (isPrefixOf!0 thiss!1379 (_2!1732 lt!46975)) e!21211)))

(declare-fun b!32015 () Bool)

(declare-fun res!27395 () Bool)

(assert (=> b!32015 (=> (not res!27395) (not e!21211))))

(assert (=> b!32015 (= res!27395 (bvsle (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)) (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975)))))))

(declare-fun b!32016 () Bool)

(declare-fun e!21212 () Bool)

(assert (=> b!32016 (= e!21211 e!21212)))

(declare-fun res!27396 () Bool)

(assert (=> b!32016 (=> res!27396 e!21212)))

(assert (=> b!32016 (= res!27396 (= (size!797 (buf!1125 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32017 () Bool)

(assert (=> b!32017 (= e!21212 (arrayBitRangesEq!0 (buf!1125 thiss!1379) (buf!1125 (_2!1732 lt!46975)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379))))))

(assert (= (and d!9326 res!27394) b!32015))

(assert (= (and b!32015 res!27395) b!32016))

(assert (= (and b!32016 (not res!27396)) b!32017))

(assert (=> b!32015 m!47049))

(assert (=> b!32015 m!47025))

(assert (=> b!32017 m!47049))

(assert (=> b!32017 m!47049))

(declare-fun m!47251 () Bool)

(assert (=> b!32017 m!47251))

(assert (=> b!31906 d!9326))

(declare-fun d!9328 () Bool)

(assert (=> d!9328 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!46980) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975)))) lt!46980))))

(declare-fun bs!2565 () Bool)

(assert (= bs!2565 d!9328))

(declare-fun m!47253 () Bool)

(assert (=> bs!2565 m!47253))

(assert (=> b!31906 d!9328))

(declare-fun d!9330 () Bool)

(declare-fun e!21215 () Bool)

(assert (=> d!9330 e!21215))

(declare-fun res!27399 () Bool)

(assert (=> d!9330 (=> (not res!27399) (not e!21215))))

(assert (=> d!9330 (= res!27399 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!47146 () Unit!2425)

(declare-fun choose!27 (BitStream!1392 BitStream!1392 (_ BitVec 64) (_ BitVec 64)) Unit!2425)

(assert (=> d!9330 (= lt!47146 (choose!27 thiss!1379 (_2!1732 lt!46975) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9330 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9330 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1732 lt!46975) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47146)))

(declare-fun b!32020 () Bool)

(assert (=> b!32020 (= e!21215 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9330 res!27399) b!32020))

(declare-fun m!47255 () Bool)

(assert (=> d!9330 m!47255))

(declare-fun m!47257 () Bool)

(assert (=> b!32020 m!47257))

(assert (=> b!31906 d!9330))

(declare-fun b!32038 () Bool)

(declare-fun res!27420 () Bool)

(declare-fun e!21225 () Bool)

(assert (=> b!32038 (=> (not res!27420) (not e!21225))))

(declare-fun lt!47177 () tuple2!3290)

(assert (=> b!32038 (= res!27420 (isPrefixOf!0 thiss!1379 (_2!1732 lt!47177)))))

(declare-fun b!32039 () Bool)

(declare-fun e!21224 () Bool)

(declare-datatypes ((tuple2!3302 0))(
  ( (tuple2!3303 (_1!1738 BitStream!1392) (_2!1738 Bool)) )
))
(declare-fun lt!47171 () tuple2!3302)

(declare-fun lt!47180 () tuple2!3290)

(assert (=> b!32039 (= e!21224 (= (bitIndex!0 (size!797 (buf!1125 (_1!1738 lt!47171))) (currentByte!2486 (_1!1738 lt!47171)) (currentBit!2481 (_1!1738 lt!47171))) (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47180))) (currentByte!2486 (_2!1732 lt!47180)) (currentBit!2481 (_2!1732 lt!47180)))))))

(declare-fun d!9332 () Bool)

(declare-fun e!21227 () Bool)

(assert (=> d!9332 e!21227))

(declare-fun res!27423 () Bool)

(assert (=> d!9332 (=> (not res!27423) (not e!21227))))

(assert (=> d!9332 (= res!27423 (= (size!797 (buf!1125 (_2!1732 lt!47180))) (size!797 (buf!1125 thiss!1379))))))

(declare-fun lt!47181 () (_ BitVec 8))

(declare-fun lt!47172 () array!1813)

(assert (=> d!9332 (= lt!47181 (select (arr!1269 lt!47172) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9332 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!797 lt!47172)))))

(assert (=> d!9332 (= lt!47172 (array!1814 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!47179 () tuple2!3290)

(assert (=> d!9332 (= lt!47180 (tuple2!3291 (_1!1732 lt!47179) (_2!1732 lt!47179)))))

(assert (=> d!9332 (= lt!47179 lt!47177)))

(assert (=> d!9332 e!21225))

(declare-fun res!27417 () Bool)

(assert (=> d!9332 (=> (not res!27417) (not e!21225))))

(assert (=> d!9332 (= res!27417 (= (size!797 (buf!1125 thiss!1379)) (size!797 (buf!1125 (_2!1732 lt!47177)))))))

(declare-fun lt!47173 () Bool)

(declare-fun appendBit!0 (BitStream!1392 Bool) tuple2!3290)

(assert (=> d!9332 (= lt!47177 (appendBit!0 thiss!1379 lt!47173))))

(assert (=> d!9332 (= lt!47173 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9332 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9332 (= (appendBitFromByte!0 thiss!1379 (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!47180)))

(declare-fun b!32040 () Bool)

(declare-fun e!21226 () Bool)

(declare-fun lt!47174 () tuple2!3302)

(assert (=> b!32040 (= e!21226 (= (bitIndex!0 (size!797 (buf!1125 (_1!1738 lt!47174))) (currentByte!2486 (_1!1738 lt!47174)) (currentBit!2481 (_1!1738 lt!47174))) (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47177))) (currentByte!2486 (_2!1732 lt!47177)) (currentBit!2481 (_2!1732 lt!47177)))))))

(declare-fun b!32041 () Bool)

(assert (=> b!32041 (= e!21225 e!21226)))

(declare-fun res!27416 () Bool)

(assert (=> b!32041 (=> (not res!27416) (not e!21226))))

(assert (=> b!32041 (= res!27416 (and (= (_2!1738 lt!47174) lt!47173) (= (_1!1738 lt!47174) (_2!1732 lt!47177))))))

(declare-fun readBitPure!0 (BitStream!1392) tuple2!3302)

(declare-fun readerFrom!0 (BitStream!1392 (_ BitVec 32) (_ BitVec 32)) BitStream!1392)

(assert (=> b!32041 (= lt!47174 (readBitPure!0 (readerFrom!0 (_2!1732 lt!47177) (currentBit!2481 thiss!1379) (currentByte!2486 thiss!1379))))))

(declare-fun b!32042 () Bool)

(declare-fun res!27422 () Bool)

(assert (=> b!32042 (=> (not res!27422) (not e!21225))))

(assert (=> b!32042 (= res!27422 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47177))) (currentByte!2486 (_2!1732 lt!47177)) (currentBit!2481 (_2!1732 lt!47177))) (bvadd (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32043 () Bool)

(assert (=> b!32043 (= e!21227 e!21224)))

(declare-fun res!27419 () Bool)

(assert (=> b!32043 (=> (not res!27419) (not e!21224))))

(assert (=> b!32043 (= res!27419 (and (= (_2!1738 lt!47171) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!47181)) #b00000000000000000000000000000000))) (= (_1!1738 lt!47171) (_2!1732 lt!47180))))))

(declare-datatypes ((tuple2!3304 0))(
  ( (tuple2!3305 (_1!1739 array!1813) (_2!1739 BitStream!1392)) )
))
(declare-fun lt!47176 () tuple2!3304)

(declare-fun lt!47182 () BitStream!1392)

(declare-fun readBits!0 (BitStream!1392 (_ BitVec 64)) tuple2!3304)

(assert (=> b!32043 (= lt!47176 (readBits!0 lt!47182 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!32043 (= lt!47171 (readBitPure!0 lt!47182))))

(assert (=> b!32043 (= lt!47182 (readerFrom!0 (_2!1732 lt!47180) (currentBit!2481 thiss!1379) (currentByte!2486 thiss!1379)))))

(declare-fun b!32044 () Bool)

(declare-fun res!27418 () Bool)

(assert (=> b!32044 (=> (not res!27418) (not e!21227))))

(declare-fun lt!47178 () (_ BitVec 64))

(declare-fun lt!47175 () (_ BitVec 64))

(assert (=> b!32044 (= res!27418 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47180))) (currentByte!2486 (_2!1732 lt!47180)) (currentBit!2481 (_2!1732 lt!47180))) (bvadd lt!47178 lt!47175)))))

(assert (=> b!32044 (or (not (= (bvand lt!47178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47175 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!47178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!47178 lt!47175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32044 (= lt!47175 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!32044 (= lt!47178 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(declare-fun b!32045 () Bool)

(declare-fun res!27421 () Bool)

(assert (=> b!32045 (=> (not res!27421) (not e!21227))))

(assert (=> b!32045 (= res!27421 (isPrefixOf!0 thiss!1379 (_2!1732 lt!47180)))))

(assert (= (and d!9332 res!27417) b!32042))

(assert (= (and b!32042 res!27422) b!32038))

(assert (= (and b!32038 res!27420) b!32041))

(assert (= (and b!32041 res!27416) b!32040))

(assert (= (and d!9332 res!27423) b!32044))

(assert (= (and b!32044 res!27418) b!32045))

(assert (= (and b!32045 res!27421) b!32043))

(assert (= (and b!32043 res!27419) b!32039))

(declare-fun m!47259 () Bool)

(assert (=> b!32045 m!47259))

(declare-fun m!47261 () Bool)

(assert (=> b!32039 m!47261))

(declare-fun m!47263 () Bool)

(assert (=> b!32039 m!47263))

(declare-fun m!47265 () Bool)

(assert (=> b!32038 m!47265))

(declare-fun m!47267 () Bool)

(assert (=> b!32043 m!47267))

(declare-fun m!47269 () Bool)

(assert (=> b!32043 m!47269))

(declare-fun m!47271 () Bool)

(assert (=> b!32043 m!47271))

(declare-fun m!47273 () Bool)

(assert (=> b!32040 m!47273))

(declare-fun m!47275 () Bool)

(assert (=> b!32040 m!47275))

(assert (=> b!32044 m!47263))

(assert (=> b!32044 m!47049))

(declare-fun m!47277 () Bool)

(assert (=> b!32041 m!47277))

(assert (=> b!32041 m!47277))

(declare-fun m!47279 () Bool)

(assert (=> b!32041 m!47279))

(assert (=> b!32042 m!47275))

(assert (=> b!32042 m!47049))

(declare-fun m!47281 () Bool)

(assert (=> d!9332 m!47281))

(declare-fun m!47283 () Bool)

(assert (=> d!9332 m!47283))

(declare-fun m!47285 () Bool)

(assert (=> d!9332 m!47285))

(assert (=> b!31906 d!9332))

(declare-fun d!9338 () Bool)

(assert (=> d!9338 (= (invariant!0 (currentBit!2481 (_2!1732 lt!46975)) (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46982)))) (and (bvsge (currentBit!2481 (_2!1732 lt!46975)) #b00000000000000000000000000000000) (bvslt (currentBit!2481 (_2!1732 lt!46975)) #b00000000000000000000000000001000) (bvsge (currentByte!2486 (_2!1732 lt!46975)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46982)))) (and (= (currentBit!2481 (_2!1732 lt!46975)) #b00000000000000000000000000000000) (= (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46982))))))))))

(assert (=> b!31895 d!9338))

(declare-fun d!9340 () Bool)

(assert (=> d!9340 (= (bitAt!0 (buf!1125 (_1!1733 lt!46978)) lt!46981) (not (= (bvand ((_ sign_extend 24) (select (arr!1269 (buf!1125 (_1!1733 lt!46978))) ((_ extract 31 0) (bvsdiv lt!46981 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!46981 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2566 () Bool)

(assert (= bs!2566 d!9340))

(declare-fun m!47287 () Bool)

(assert (=> bs!2566 m!47287))

(declare-fun m!47289 () Bool)

(assert (=> bs!2566 m!47289))

(assert (=> b!31896 d!9340))

(declare-fun d!9342 () Bool)

(assert (=> d!9342 (= (bitAt!0 (buf!1125 (_1!1733 lt!46989)) lt!46981) (not (= (bvand ((_ sign_extend 24) (select (arr!1269 (buf!1125 (_1!1733 lt!46989))) ((_ extract 31 0) (bvsdiv lt!46981 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!46981 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2567 () Bool)

(assert (= bs!2567 d!9342))

(declare-fun m!47291 () Bool)

(assert (=> bs!2567 m!47291))

(assert (=> bs!2567 m!47289))

(assert (=> b!31896 d!9342))

(declare-fun d!9344 () Bool)

(assert (=> d!9344 (= (tail!114 lt!46986) (t!1147 lt!46986))))

(assert (=> b!31902 d!9344))

(declare-fun d!9346 () Bool)

(declare-fun e!21233 () Bool)

(assert (=> d!9346 e!21233))

(declare-fun res!27432 () Bool)

(assert (=> d!9346 (=> (not res!27432) (not e!21233))))

(declare-fun lt!47206 () (_ BitVec 64))

(assert (=> d!9346 (= res!27432 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!47206) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9346 (= lt!47206 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47205 () Unit!2425)

(declare-fun choose!42 (BitStream!1392 BitStream!1392 BitStream!1392 BitStream!1392 (_ BitVec 64) List!397) Unit!2425)

(assert (=> d!9346 (= lt!47205 (choose!42 (_2!1732 lt!46982) (_2!1732 lt!46982) (_1!1733 lt!46989) (_1!1733 lt!46978) (bvsub to!314 i!635) lt!46986))))

(assert (=> d!9346 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9346 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1732 lt!46982) (_2!1732 lt!46982) (_1!1733 lt!46989) (_1!1733 lt!46978) (bvsub to!314 i!635) lt!46986) lt!47205)))

(declare-fun b!32054 () Bool)

(assert (=> b!32054 (= e!21233 (= (bitStreamReadBitsIntoList!0 (_2!1732 lt!46982) (_1!1733 lt!46978) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!114 lt!46986)))))

(assert (= (and d!9346 res!27432) b!32054))

(declare-fun m!47297 () Bool)

(assert (=> d!9346 m!47297))

(declare-fun m!47299 () Bool)

(assert (=> b!32054 m!47299))

(assert (=> b!32054 m!47017))

(assert (=> b!31902 d!9346))

(declare-fun d!9352 () Bool)

(assert (=> d!9352 (= (head!234 (byteArrayBitContentToList!0 (_2!1732 lt!46982) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!512 (byteArrayBitContentToList!0 (_2!1732 lt!46982) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!31903 d!9352))

(declare-fun d!9354 () Bool)

(declare-fun c!2172 () Bool)

(assert (=> d!9354 (= c!2172 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21236 () List!397)

(assert (=> d!9354 (= (byteArrayBitContentToList!0 (_2!1732 lt!46982) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!21236)))

(declare-fun b!32059 () Bool)

(assert (=> b!32059 (= e!21236 Nil!394)))

(declare-fun b!32060 () Bool)

(assert (=> b!32060 (= e!21236 (Cons!393 (not (= (bvand ((_ sign_extend 24) (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1732 lt!46982) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9354 c!2172) b!32059))

(assert (= (and d!9354 (not c!2172)) b!32060))

(assert (=> b!32060 m!47029))

(assert (=> b!32060 m!47285))

(declare-fun m!47301 () Bool)

(assert (=> b!32060 m!47301))

(assert (=> b!31903 d!9354))

(declare-fun d!9356 () Bool)

(assert (=> d!9356 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2569 () Bool)

(assert (= bs!2569 d!9356))

(assert (=> bs!2569 m!47029))

(assert (=> bs!2569 m!47285))

(assert (=> b!31903 d!9356))

(declare-fun d!9358 () Bool)

(declare-fun res!27433 () Bool)

(declare-fun e!21237 () Bool)

(assert (=> d!9358 (=> (not res!27433) (not e!21237))))

(assert (=> d!9358 (= res!27433 (= (size!797 (buf!1125 thiss!1379)) (size!797 (buf!1125 thiss!1379))))))

(assert (=> d!9358 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!21237)))

(declare-fun b!32061 () Bool)

(declare-fun res!27434 () Bool)

(assert (=> b!32061 (=> (not res!27434) (not e!21237))))

(assert (=> b!32061 (= res!27434 (bvsle (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)) (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379))))))

(declare-fun b!32062 () Bool)

(declare-fun e!21238 () Bool)

(assert (=> b!32062 (= e!21237 e!21238)))

(declare-fun res!27435 () Bool)

(assert (=> b!32062 (=> res!27435 e!21238)))

(assert (=> b!32062 (= res!27435 (= (size!797 (buf!1125 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32063 () Bool)

(assert (=> b!32063 (= e!21238 (arrayBitRangesEq!0 (buf!1125 thiss!1379) (buf!1125 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379))))))

(assert (= (and d!9358 res!27433) b!32061))

(assert (= (and b!32061 res!27434) b!32062))

(assert (= (and b!32062 (not res!27435)) b!32063))

(assert (=> b!32061 m!47049))

(assert (=> b!32061 m!47049))

(assert (=> b!32063 m!47049))

(assert (=> b!32063 m!47049))

(declare-fun m!47303 () Bool)

(assert (=> b!32063 m!47303))

(assert (=> b!31904 d!9358))

(declare-fun d!9360 () Bool)

(assert (=> d!9360 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!47209 () Unit!2425)

(declare-fun choose!11 (BitStream!1392) Unit!2425)

(assert (=> d!9360 (= lt!47209 (choose!11 thiss!1379))))

(assert (=> d!9360 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!47209)))

(declare-fun bs!2571 () Bool)

(assert (= bs!2571 d!9360))

(assert (=> bs!2571 m!47045))

(declare-fun m!47305 () Bool)

(assert (=> bs!2571 m!47305))

(assert (=> b!31904 d!9360))

(declare-fun d!9362 () Bool)

(declare-fun e!21241 () Bool)

(assert (=> d!9362 e!21241))

(declare-fun res!27440 () Bool)

(assert (=> d!9362 (=> (not res!27440) (not e!21241))))

(declare-fun lt!47224 () (_ BitVec 64))

(declare-fun lt!47223 () (_ BitVec 64))

(declare-fun lt!47226 () (_ BitVec 64))

(assert (=> d!9362 (= res!27440 (= lt!47223 (bvsub lt!47224 lt!47226)))))

(assert (=> d!9362 (or (= (bvand lt!47224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47224 lt!47226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9362 (= lt!47226 (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 thiss!1379))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379))))))

(declare-fun lt!47225 () (_ BitVec 64))

(declare-fun lt!47222 () (_ BitVec 64))

(assert (=> d!9362 (= lt!47224 (bvmul lt!47225 lt!47222))))

(assert (=> d!9362 (or (= lt!47225 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47222 (bvsdiv (bvmul lt!47225 lt!47222) lt!47225)))))

(assert (=> d!9362 (= lt!47222 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9362 (= lt!47225 ((_ sign_extend 32) (size!797 (buf!1125 thiss!1379))))))

(assert (=> d!9362 (= lt!47223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2486 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2481 thiss!1379))))))

(assert (=> d!9362 (invariant!0 (currentBit!2481 thiss!1379) (currentByte!2486 thiss!1379) (size!797 (buf!1125 thiss!1379)))))

(assert (=> d!9362 (= (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)) lt!47223)))

(declare-fun b!32068 () Bool)

(declare-fun res!27441 () Bool)

(assert (=> b!32068 (=> (not res!27441) (not e!21241))))

(assert (=> b!32068 (= res!27441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47223))))

(declare-fun b!32069 () Bool)

(declare-fun lt!47227 () (_ BitVec 64))

(assert (=> b!32069 (= e!21241 (bvsle lt!47223 (bvmul lt!47227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32069 (or (= lt!47227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47227)))))

(assert (=> b!32069 (= lt!47227 ((_ sign_extend 32) (size!797 (buf!1125 thiss!1379))))))

(assert (= (and d!9362 res!27440) b!32068))

(assert (= (and b!32068 res!27441) b!32069))

(declare-fun m!47307 () Bool)

(assert (=> d!9362 m!47307))

(declare-fun m!47309 () Bool)

(assert (=> d!9362 m!47309))

(assert (=> b!31904 d!9362))

(declare-fun d!9364 () Bool)

(assert (=> d!9364 (= (array_inv!749 (buf!1125 thiss!1379)) (bvsge (size!797 (buf!1125 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!31893 d!9364))

(declare-fun d!9366 () Bool)

(declare-fun res!27442 () Bool)

(declare-fun e!21242 () Bool)

(assert (=> d!9366 (=> (not res!27442) (not e!21242))))

(assert (=> d!9366 (= res!27442 (= (size!797 (buf!1125 (_2!1732 lt!46975))) (size!797 (buf!1125 (_2!1732 lt!46982)))))))

(assert (=> d!9366 (= (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!46982)) e!21242)))

(declare-fun b!32070 () Bool)

(declare-fun res!27443 () Bool)

(assert (=> b!32070 (=> (not res!27443) (not e!21242))))

(assert (=> b!32070 (= res!27443 (bvsle (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))) (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46982))) (currentByte!2486 (_2!1732 lt!46982)) (currentBit!2481 (_2!1732 lt!46982)))))))

(declare-fun b!32071 () Bool)

(declare-fun e!21243 () Bool)

(assert (=> b!32071 (= e!21242 e!21243)))

(declare-fun res!27444 () Bool)

(assert (=> b!32071 (=> res!27444 e!21243)))

(assert (=> b!32071 (= res!27444 (= (size!797 (buf!1125 (_2!1732 lt!46975))) #b00000000000000000000000000000000))))

(declare-fun b!32072 () Bool)

(assert (=> b!32072 (= e!21243 (arrayBitRangesEq!0 (buf!1125 (_2!1732 lt!46975)) (buf!1125 (_2!1732 lt!46982)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975)))))))

(assert (= (and d!9366 res!27442) b!32070))

(assert (= (and b!32070 res!27443) b!32071))

(assert (= (and b!32071 (not res!27444)) b!32072))

(assert (=> b!32070 m!47025))

(assert (=> b!32070 m!47023))

(assert (=> b!32072 m!47025))

(assert (=> b!32072 m!47025))

(declare-fun m!47311 () Bool)

(assert (=> b!32072 m!47311))

(assert (=> b!31899 d!9366))

(declare-fun d!9368 () Bool)

(assert (=> d!9368 (isPrefixOf!0 thiss!1379 (_2!1732 lt!46982))))

(declare-fun lt!47270 () Unit!2425)

(declare-fun choose!30 (BitStream!1392 BitStream!1392 BitStream!1392) Unit!2425)

(assert (=> d!9368 (= lt!47270 (choose!30 thiss!1379 (_2!1732 lt!46975) (_2!1732 lt!46982)))))

(assert (=> d!9368 (isPrefixOf!0 thiss!1379 (_2!1732 lt!46975))))

(assert (=> d!9368 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1732 lt!46975) (_2!1732 lt!46982)) lt!47270)))

(declare-fun bs!2572 () Bool)

(assert (= bs!2572 d!9368))

(assert (=> bs!2572 m!47061))

(declare-fun m!47313 () Bool)

(assert (=> bs!2572 m!47313))

(assert (=> bs!2572 m!47027))

(assert (=> b!31899 d!9368))

(declare-fun d!9370 () Bool)

(assert (=> d!9370 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2573 () Bool)

(assert (= bs!2573 d!9370))

(declare-fun m!47315 () Bool)

(assert (=> bs!2573 m!47315))

(assert (=> b!31899 d!9370))

(declare-fun d!9372 () Bool)

(declare-fun e!21249 () Bool)

(assert (=> d!9372 e!21249))

(declare-fun res!27451 () Bool)

(assert (=> d!9372 (=> (not res!27451) (not e!21249))))

(declare-fun lt!47273 () tuple2!3292)

(assert (=> d!9372 (= res!27451 (isPrefixOf!0 (_1!1733 lt!47273) (_2!1733 lt!47273)))))

(declare-fun lt!47285 () BitStream!1392)

(assert (=> d!9372 (= lt!47273 (tuple2!3293 lt!47285 (_2!1732 lt!46975)))))

(declare-fun lt!47280 () Unit!2425)

(declare-fun lt!47286 () Unit!2425)

(assert (=> d!9372 (= lt!47280 lt!47286)))

(assert (=> d!9372 (isPrefixOf!0 lt!47285 (_2!1732 lt!46975))))

(assert (=> d!9372 (= lt!47286 (lemmaIsPrefixTransitive!0 lt!47285 (_2!1732 lt!46975) (_2!1732 lt!46975)))))

(declare-fun lt!47284 () Unit!2425)

(declare-fun lt!47279 () Unit!2425)

(assert (=> d!9372 (= lt!47284 lt!47279)))

(assert (=> d!9372 (isPrefixOf!0 lt!47285 (_2!1732 lt!46975))))

(assert (=> d!9372 (= lt!47279 (lemmaIsPrefixTransitive!0 lt!47285 thiss!1379 (_2!1732 lt!46975)))))

(declare-fun lt!47289 () Unit!2425)

(declare-fun e!21248 () Unit!2425)

(assert (=> d!9372 (= lt!47289 e!21248)))

(declare-fun c!2175 () Bool)

(assert (=> d!9372 (= c!2175 (not (= (size!797 (buf!1125 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!47275 () Unit!2425)

(declare-fun lt!47274 () Unit!2425)

(assert (=> d!9372 (= lt!47275 lt!47274)))

(assert (=> d!9372 (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!46975))))

(assert (=> d!9372 (= lt!47274 (lemmaIsPrefixRefl!0 (_2!1732 lt!46975)))))

(declare-fun lt!47271 () Unit!2425)

(declare-fun lt!47278 () Unit!2425)

(assert (=> d!9372 (= lt!47271 lt!47278)))

(assert (=> d!9372 (= lt!47278 (lemmaIsPrefixRefl!0 (_2!1732 lt!46975)))))

(declare-fun lt!47281 () Unit!2425)

(declare-fun lt!47290 () Unit!2425)

(assert (=> d!9372 (= lt!47281 lt!47290)))

(assert (=> d!9372 (isPrefixOf!0 lt!47285 lt!47285)))

(assert (=> d!9372 (= lt!47290 (lemmaIsPrefixRefl!0 lt!47285))))

(declare-fun lt!47283 () Unit!2425)

(declare-fun lt!47272 () Unit!2425)

(assert (=> d!9372 (= lt!47283 lt!47272)))

(assert (=> d!9372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9372 (= lt!47272 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9372 (= lt!47285 (BitStream!1393 (buf!1125 (_2!1732 lt!46975)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(assert (=> d!9372 (isPrefixOf!0 thiss!1379 (_2!1732 lt!46975))))

(assert (=> d!9372 (= (reader!0 thiss!1379 (_2!1732 lt!46975)) lt!47273)))

(declare-fun b!32083 () Bool)

(declare-fun res!27452 () Bool)

(assert (=> b!32083 (=> (not res!27452) (not e!21249))))

(assert (=> b!32083 (= res!27452 (isPrefixOf!0 (_1!1733 lt!47273) thiss!1379))))

(declare-fun b!32084 () Bool)

(declare-fun lt!47277 () Unit!2425)

(assert (=> b!32084 (= e!21248 lt!47277)))

(declare-fun lt!47288 () (_ BitVec 64))

(assert (=> b!32084 (= lt!47288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!47282 () (_ BitVec 64))

(assert (=> b!32084 (= lt!47282 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(assert (=> b!32084 (= lt!47277 (arrayBitRangesEqSymmetric!0 (buf!1125 thiss!1379) (buf!1125 (_2!1732 lt!46975)) lt!47288 lt!47282))))

(assert (=> b!32084 (arrayBitRangesEq!0 (buf!1125 (_2!1732 lt!46975)) (buf!1125 thiss!1379) lt!47288 lt!47282)))

(declare-fun lt!47287 () (_ BitVec 64))

(declare-fun b!32085 () Bool)

(declare-fun lt!47276 () (_ BitVec 64))

(assert (=> b!32085 (= e!21249 (= (_1!1733 lt!47273) (withMovedBitIndex!0 (_2!1733 lt!47273) (bvsub lt!47276 lt!47287))))))

(assert (=> b!32085 (or (= (bvand lt!47276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47276 lt!47287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32085 (= lt!47287 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))))))

(assert (=> b!32085 (= lt!47276 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)))))

(declare-fun b!32086 () Bool)

(declare-fun Unit!2431 () Unit!2425)

(assert (=> b!32086 (= e!21248 Unit!2431)))

(declare-fun b!32087 () Bool)

(declare-fun res!27453 () Bool)

(assert (=> b!32087 (=> (not res!27453) (not e!21249))))

(assert (=> b!32087 (= res!27453 (isPrefixOf!0 (_2!1733 lt!47273) (_2!1732 lt!46975)))))

(assert (= (and d!9372 c!2175) b!32084))

(assert (= (and d!9372 (not c!2175)) b!32086))

(assert (= (and d!9372 res!27451) b!32083))

(assert (= (and b!32083 res!27452) b!32087))

(assert (= (and b!32087 res!27453) b!32085))

(assert (=> d!9372 m!47191))

(declare-fun m!47317 () Bool)

(assert (=> d!9372 m!47317))

(assert (=> d!9372 m!47047))

(declare-fun m!47319 () Bool)

(assert (=> d!9372 m!47319))

(declare-fun m!47321 () Bool)

(assert (=> d!9372 m!47321))

(assert (=> d!9372 m!47027))

(declare-fun m!47323 () Bool)

(assert (=> d!9372 m!47323))

(assert (=> d!9372 m!47045))

(assert (=> d!9372 m!47183))

(declare-fun m!47325 () Bool)

(assert (=> d!9372 m!47325))

(declare-fun m!47327 () Bool)

(assert (=> d!9372 m!47327))

(assert (=> b!32084 m!47049))

(declare-fun m!47329 () Bool)

(assert (=> b!32084 m!47329))

(declare-fun m!47331 () Bool)

(assert (=> b!32084 m!47331))

(declare-fun m!47333 () Bool)

(assert (=> b!32087 m!47333))

(declare-fun m!47335 () Bool)

(assert (=> b!32085 m!47335))

(assert (=> b!32085 m!47025))

(assert (=> b!32085 m!47049))

(declare-fun m!47337 () Bool)

(assert (=> b!32083 m!47337))

(assert (=> b!31899 d!9372))

(declare-fun d!9374 () Bool)

(declare-fun res!27454 () Bool)

(declare-fun e!21250 () Bool)

(assert (=> d!9374 (=> (not res!27454) (not e!21250))))

(assert (=> d!9374 (= res!27454 (= (size!797 (buf!1125 thiss!1379)) (size!797 (buf!1125 (_2!1732 lt!46982)))))))

(assert (=> d!9374 (= (isPrefixOf!0 thiss!1379 (_2!1732 lt!46982)) e!21250)))

(declare-fun b!32088 () Bool)

(declare-fun res!27455 () Bool)

(assert (=> b!32088 (=> (not res!27455) (not e!21250))))

(assert (=> b!32088 (= res!27455 (bvsle (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379)) (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46982))) (currentByte!2486 (_2!1732 lt!46982)) (currentBit!2481 (_2!1732 lt!46982)))))))

(declare-fun b!32089 () Bool)

(declare-fun e!21251 () Bool)

(assert (=> b!32089 (= e!21250 e!21251)))

(declare-fun res!27456 () Bool)

(assert (=> b!32089 (=> res!27456 e!21251)))

(assert (=> b!32089 (= res!27456 (= (size!797 (buf!1125 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!32090 () Bool)

(assert (=> b!32090 (= e!21251 (arrayBitRangesEq!0 (buf!1125 thiss!1379) (buf!1125 (_2!1732 lt!46982)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!797 (buf!1125 thiss!1379)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379))))))

(assert (= (and d!9374 res!27454) b!32088))

(assert (= (and b!32088 res!27455) b!32089))

(assert (= (and b!32089 (not res!27456)) b!32090))

(assert (=> b!32088 m!47049))

(assert (=> b!32088 m!47023))

(assert (=> b!32090 m!47049))

(assert (=> b!32090 m!47049))

(declare-fun m!47339 () Bool)

(assert (=> b!32090 m!47339))

(assert (=> b!31899 d!9374))

(declare-fun call!412 () tuple2!3292)

(declare-fun lt!47669 () tuple2!3290)

(declare-fun c!2209 () Bool)

(declare-fun bm!409 () Bool)

(assert (=> bm!409 (= call!412 (reader!0 (_2!1732 lt!46975) (ite c!2209 (_2!1732 lt!47669) (_2!1732 lt!46975))))))

(declare-fun b!32249 () Bool)

(declare-fun e!21332 () Bool)

(declare-fun lt!47684 () tuple2!3290)

(declare-fun lt!47676 () tuple2!3292)

(assert (=> b!32249 (= e!21332 (= (bitStreamReadBitsIntoList!0 (_2!1732 lt!47684) (_1!1733 lt!47676) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1732 lt!47684) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!32249 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32249 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!47709 () Unit!2425)

(declare-fun lt!47686 () Unit!2425)

(assert (=> b!32249 (= lt!47709 lt!47686)))

(declare-fun lt!47695 () (_ BitVec 64))

(assert (=> b!32249 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!47684)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!47695)))

(assert (=> b!32249 (= lt!47686 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1732 lt!46975) (buf!1125 (_2!1732 lt!47684)) lt!47695))))

(declare-fun e!21331 () Bool)

(assert (=> b!32249 e!21331))

(declare-fun res!27550 () Bool)

(assert (=> b!32249 (=> (not res!27550) (not e!21331))))

(assert (=> b!32249 (= res!27550 (and (= (size!797 (buf!1125 (_2!1732 lt!46975))) (size!797 (buf!1125 (_2!1732 lt!47684)))) (bvsge lt!47695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32249 (= lt!47695 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!32249 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!32249 (= lt!47676 (reader!0 (_2!1732 lt!46975) (_2!1732 lt!47684)))))

(declare-fun b!32250 () Bool)

(declare-fun res!27548 () Bool)

(assert (=> b!32250 (=> (not res!27548) (not e!21332))))

(assert (=> b!32250 (= res!27548 (= (size!797 (buf!1125 (_2!1732 lt!46975))) (size!797 (buf!1125 (_2!1732 lt!47684)))))))

(declare-fun b!32251 () Bool)

(declare-fun e!21333 () tuple2!3290)

(declare-fun Unit!2432 () Unit!2425)

(assert (=> b!32251 (= e!21333 (tuple2!3291 Unit!2432 (_2!1732 lt!46975)))))

(assert (=> b!32251 (= (size!797 (buf!1125 (_2!1732 lt!46975))) (size!797 (buf!1125 (_2!1732 lt!46975))))))

(declare-fun lt!47694 () Unit!2425)

(declare-fun Unit!2433 () Unit!2425)

(assert (=> b!32251 (= lt!47694 Unit!2433)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1392 array!1813 array!1813 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32251 (checkByteArrayBitContent!0 (_2!1732 lt!46975) srcBuffer!2 (_1!1739 (readBits!0 (_1!1733 call!412) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!9376 () Bool)

(assert (=> d!9376 e!21332))

(declare-fun res!27551 () Bool)

(assert (=> d!9376 (=> (not res!27551) (not e!21332))))

(declare-fun lt!47707 () (_ BitVec 64))

(assert (=> d!9376 (= res!27551 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47684))) (currentByte!2486 (_2!1732 lt!47684)) (currentBit!2481 (_2!1732 lt!47684))) (bvsub lt!47707 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9376 (or (= (bvand lt!47707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47707 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!47688 () (_ BitVec 64))

(assert (=> d!9376 (= lt!47707 (bvadd lt!47688 to!314))))

(assert (=> d!9376 (or (not (= (bvand lt!47688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!47688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!47688 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9376 (= lt!47688 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))))))

(assert (=> d!9376 (= lt!47684 e!21333)))

(assert (=> d!9376 (= c!2209 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!47672 () Unit!2425)

(declare-fun lt!47674 () Unit!2425)

(assert (=> d!9376 (= lt!47672 lt!47674)))

(assert (=> d!9376 (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!46975))))

(assert (=> d!9376 (= lt!47674 (lemmaIsPrefixRefl!0 (_2!1732 lt!46975)))))

(declare-fun lt!47668 () (_ BitVec 64))

(assert (=> d!9376 (= lt!47668 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))))))

(assert (=> d!9376 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9376 (= (appendBitsMSBFirstLoop!0 (_2!1732 lt!46975) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!47684)))

(declare-fun b!32252 () Bool)

(assert (=> b!32252 (= e!21331 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!47695))))

(declare-fun b!32253 () Bool)

(declare-fun res!27549 () Bool)

(assert (=> b!32253 (=> (not res!27549) (not e!21332))))

(assert (=> b!32253 (= res!27549 (invariant!0 (currentBit!2481 (_2!1732 lt!47684)) (currentByte!2486 (_2!1732 lt!47684)) (size!797 (buf!1125 (_2!1732 lt!47684)))))))

(declare-fun b!32254 () Bool)

(declare-fun lt!47706 () tuple2!3290)

(declare-fun Unit!2434 () Unit!2425)

(assert (=> b!32254 (= e!21333 (tuple2!3291 Unit!2434 (_2!1732 lt!47706)))))

(assert (=> b!32254 (= lt!47669 (appendBitFromByte!0 (_2!1732 lt!46975) (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!47682 () (_ BitVec 64))

(assert (=> b!32254 (= lt!47682 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47671 () (_ BitVec 64))

(assert (=> b!32254 (= lt!47671 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47699 () Unit!2425)

(assert (=> b!32254 (= lt!47699 (validateOffsetBitsIneqLemma!0 (_2!1732 lt!46975) (_2!1732 lt!47669) lt!47682 lt!47671))))

(assert (=> b!32254 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!47669)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!47669))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!47669))) (bvsub lt!47682 lt!47671))))

(declare-fun lt!47675 () Unit!2425)

(assert (=> b!32254 (= lt!47675 lt!47699)))

(declare-fun lt!47703 () tuple2!3292)

(assert (=> b!32254 (= lt!47703 call!412)))

(declare-fun lt!47685 () (_ BitVec 64))

(assert (=> b!32254 (= lt!47685 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47679 () Unit!2425)

(assert (=> b!32254 (= lt!47679 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1732 lt!46975) (buf!1125 (_2!1732 lt!47669)) lt!47685))))

(assert (=> b!32254 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!47669)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!47685)))

(declare-fun lt!47692 () Unit!2425)

(assert (=> b!32254 (= lt!47692 lt!47679)))

(assert (=> b!32254 (= (head!234 (byteArrayBitContentToList!0 (_2!1732 lt!47669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!234 (bitStreamReadBitsIntoList!0 (_2!1732 lt!47669) (_1!1733 lt!47703) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!47700 () Unit!2425)

(declare-fun Unit!2435 () Unit!2425)

(assert (=> b!32254 (= lt!47700 Unit!2435)))

(assert (=> b!32254 (= lt!47706 (appendBitsMSBFirstLoop!0 (_2!1732 lt!47669) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!47701 () Unit!2425)

(assert (=> b!32254 (= lt!47701 (lemmaIsPrefixTransitive!0 (_2!1732 lt!46975) (_2!1732 lt!47669) (_2!1732 lt!47706)))))

(assert (=> b!32254 (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!47706))))

(declare-fun lt!47673 () Unit!2425)

(assert (=> b!32254 (= lt!47673 lt!47701)))

(assert (=> b!32254 (= (size!797 (buf!1125 (_2!1732 lt!47706))) (size!797 (buf!1125 (_2!1732 lt!46975))))))

(declare-fun lt!47710 () Unit!2425)

(declare-fun Unit!2436 () Unit!2425)

(assert (=> b!32254 (= lt!47710 Unit!2436)))

(assert (=> b!32254 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47706))) (currentByte!2486 (_2!1732 lt!47706)) (currentBit!2481 (_2!1732 lt!47706))) (bvsub (bvadd (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47678 () Unit!2425)

(declare-fun Unit!2437 () Unit!2425)

(assert (=> b!32254 (= lt!47678 Unit!2437)))

(assert (=> b!32254 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47706))) (currentByte!2486 (_2!1732 lt!47706)) (currentBit!2481 (_2!1732 lt!47706))) (bvsub (bvsub (bvadd (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47669))) (currentByte!2486 (_2!1732 lt!47669)) (currentBit!2481 (_2!1732 lt!47669))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!47667 () Unit!2425)

(declare-fun Unit!2438 () Unit!2425)

(assert (=> b!32254 (= lt!47667 Unit!2438)))

(declare-fun lt!47698 () tuple2!3292)

(assert (=> b!32254 (= lt!47698 (reader!0 (_2!1732 lt!46975) (_2!1732 lt!47706)))))

(declare-fun lt!47687 () (_ BitVec 64))

(assert (=> b!32254 (= lt!47687 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47683 () Unit!2425)

(assert (=> b!32254 (= lt!47683 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1732 lt!46975) (buf!1125 (_2!1732 lt!47706)) lt!47687))))

(assert (=> b!32254 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!47706)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975))) lt!47687)))

(declare-fun lt!47702 () Unit!2425)

(assert (=> b!32254 (= lt!47702 lt!47683)))

(declare-fun lt!47690 () tuple2!3292)

(assert (=> b!32254 (= lt!47690 (reader!0 (_2!1732 lt!47669) (_2!1732 lt!47706)))))

(declare-fun lt!47696 () (_ BitVec 64))

(assert (=> b!32254 (= lt!47696 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!47681 () Unit!2425)

(assert (=> b!32254 (= lt!47681 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1732 lt!47669) (buf!1125 (_2!1732 lt!47706)) lt!47696))))

(assert (=> b!32254 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!47706)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!47669))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!47669))) lt!47696)))

(declare-fun lt!47670 () Unit!2425)

(assert (=> b!32254 (= lt!47670 lt!47681)))

(declare-fun lt!47704 () List!397)

(assert (=> b!32254 (= lt!47704 (byteArrayBitContentToList!0 (_2!1732 lt!47706) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!47689 () List!397)

(assert (=> b!32254 (= lt!47689 (byteArrayBitContentToList!0 (_2!1732 lt!47706) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!47691 () List!397)

(assert (=> b!32254 (= lt!47691 (bitStreamReadBitsIntoList!0 (_2!1732 lt!47706) (_1!1733 lt!47698) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!47677 () List!397)

(assert (=> b!32254 (= lt!47677 (bitStreamReadBitsIntoList!0 (_2!1732 lt!47706) (_1!1733 lt!47690) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!47705 () (_ BitVec 64))

(assert (=> b!32254 (= lt!47705 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!47693 () Unit!2425)

(assert (=> b!32254 (= lt!47693 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1732 lt!47706) (_2!1732 lt!47706) (_1!1733 lt!47698) (_1!1733 lt!47690) lt!47705 lt!47691))))

(assert (=> b!32254 (= (bitStreamReadBitsIntoList!0 (_2!1732 lt!47706) (_1!1733 lt!47690) (bvsub lt!47705 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!114 lt!47691))))

(declare-fun lt!47708 () Unit!2425)

(assert (=> b!32254 (= lt!47708 lt!47693)))

(declare-fun lt!47697 () Unit!2425)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1813 array!1813 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2425)

(assert (=> b!32254 (= lt!47697 (arrayBitRangesEqImpliesEq!0 (buf!1125 (_2!1732 lt!47669)) (buf!1125 (_2!1732 lt!47706)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!47668 (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!47669))) (currentByte!2486 (_2!1732 lt!47669)) (currentBit!2481 (_2!1732 lt!47669)))))))

(assert (=> b!32254 (= (bitAt!0 (buf!1125 (_2!1732 lt!47669)) lt!47668) (bitAt!0 (buf!1125 (_2!1732 lt!47706)) lt!47668))))

(declare-fun lt!47680 () Unit!2425)

(assert (=> b!32254 (= lt!47680 lt!47697)))

(declare-fun b!32255 () Bool)

(declare-fun res!27553 () Bool)

(assert (=> b!32255 (=> (not res!27553) (not e!21332))))

(assert (=> b!32255 (= res!27553 (= (size!797 (buf!1125 (_2!1732 lt!47684))) (size!797 (buf!1125 (_2!1732 lt!46975)))))))

(declare-fun b!32256 () Bool)

(declare-fun res!27552 () Bool)

(assert (=> b!32256 (=> (not res!27552) (not e!21332))))

(assert (=> b!32256 (= res!27552 (isPrefixOf!0 (_2!1732 lt!46975) (_2!1732 lt!47684)))))

(assert (= (and d!9376 c!2209) b!32254))

(assert (= (and d!9376 (not c!2209)) b!32251))

(assert (= (or b!32254 b!32251) bm!409))

(assert (= (and d!9376 res!27551) b!32253))

(assert (= (and b!32253 res!27549) b!32250))

(assert (= (and b!32250 res!27548) b!32256))

(assert (= (and b!32256 res!27552) b!32255))

(assert (= (and b!32255 res!27553) b!32249))

(assert (= (and b!32249 res!27550) b!32252))

(declare-fun m!47591 () Bool)

(assert (=> b!32256 m!47591))

(declare-fun m!47593 () Bool)

(assert (=> b!32254 m!47593))

(assert (=> b!32254 m!47025))

(declare-fun m!47595 () Bool)

(assert (=> b!32254 m!47595))

(declare-fun m!47597 () Bool)

(assert (=> b!32254 m!47597))

(assert (=> b!32254 m!47595))

(declare-fun m!47599 () Bool)

(assert (=> b!32254 m!47599))

(declare-fun m!47601 () Bool)

(assert (=> b!32254 m!47601))

(declare-fun m!47603 () Bool)

(assert (=> b!32254 m!47603))

(declare-fun m!47605 () Bool)

(assert (=> b!32254 m!47605))

(declare-fun m!47607 () Bool)

(assert (=> b!32254 m!47607))

(declare-fun m!47609 () Bool)

(assert (=> b!32254 m!47609))

(declare-fun m!47611 () Bool)

(assert (=> b!32254 m!47611))

(declare-fun m!47613 () Bool)

(assert (=> b!32254 m!47613))

(declare-fun m!47615 () Bool)

(assert (=> b!32254 m!47615))

(declare-fun m!47617 () Bool)

(assert (=> b!32254 m!47617))

(assert (=> b!32254 m!47607))

(declare-fun m!47619 () Bool)

(assert (=> b!32254 m!47619))

(declare-fun m!47621 () Bool)

(assert (=> b!32254 m!47621))

(declare-fun m!47623 () Bool)

(assert (=> b!32254 m!47623))

(declare-fun m!47625 () Bool)

(assert (=> b!32254 m!47625))

(declare-fun m!47627 () Bool)

(assert (=> b!32254 m!47627))

(declare-fun m!47629 () Bool)

(assert (=> b!32254 m!47629))

(declare-fun m!47631 () Bool)

(assert (=> b!32254 m!47631))

(declare-fun m!47633 () Bool)

(assert (=> b!32254 m!47633))

(declare-fun m!47635 () Bool)

(assert (=> b!32254 m!47635))

(declare-fun m!47637 () Bool)

(assert (=> b!32254 m!47637))

(declare-fun m!47639 () Bool)

(assert (=> b!32254 m!47639))

(assert (=> b!32254 m!47603))

(declare-fun m!47641 () Bool)

(assert (=> b!32254 m!47641))

(assert (=> b!32254 m!47613))

(declare-fun m!47643 () Bool)

(assert (=> b!32254 m!47643))

(declare-fun m!47645 () Bool)

(assert (=> b!32254 m!47645))

(declare-fun m!47647 () Bool)

(assert (=> b!32254 m!47647))

(declare-fun m!47649 () Bool)

(assert (=> b!32254 m!47649))

(declare-fun m!47651 () Bool)

(assert (=> b!32254 m!47651))

(declare-fun m!47653 () Bool)

(assert (=> b!32254 m!47653))

(declare-fun m!47655 () Bool)

(assert (=> b!32253 m!47655))

(declare-fun m!47657 () Bool)

(assert (=> b!32252 m!47657))

(declare-fun m!47659 () Bool)

(assert (=> b!32249 m!47659))

(declare-fun m!47661 () Bool)

(assert (=> b!32249 m!47661))

(declare-fun m!47663 () Bool)

(assert (=> b!32249 m!47663))

(declare-fun m!47665 () Bool)

(assert (=> b!32249 m!47665))

(declare-fun m!47667 () Bool)

(assert (=> b!32249 m!47667))

(declare-fun m!47669 () Bool)

(assert (=> b!32251 m!47669))

(declare-fun m!47671 () Bool)

(assert (=> b!32251 m!47671))

(declare-fun m!47673 () Bool)

(assert (=> d!9376 m!47673))

(assert (=> d!9376 m!47025))

(assert (=> d!9376 m!47191))

(assert (=> d!9376 m!47183))

(declare-fun m!47675 () Bool)

(assert (=> bm!409 m!47675))

(assert (=> b!31899 d!9376))

(declare-fun d!9476 () Bool)

(assert (=> d!9476 (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!47753 () Unit!2425)

(assert (=> d!9476 (= lt!47753 (choose!9 thiss!1379 (buf!1125 (_2!1732 lt!46975)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1393 (buf!1125 (_2!1732 lt!46975)) (currentByte!2486 thiss!1379) (currentBit!2481 thiss!1379))))))

(assert (=> d!9476 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1125 (_2!1732 lt!46975)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47753)))

(declare-fun bs!2592 () Bool)

(assert (= bs!2592 d!9476))

(assert (=> bs!2592 m!47053))

(declare-fun m!47677 () Bool)

(assert (=> bs!2592 m!47677))

(assert (=> b!31899 d!9476))

(declare-fun d!9478 () Bool)

(assert (=> d!9478 (= (invariant!0 (currentBit!2481 (_2!1732 lt!46982)) (currentByte!2486 (_2!1732 lt!46982)) (size!797 (buf!1125 (_2!1732 lt!46982)))) (and (bvsge (currentBit!2481 (_2!1732 lt!46982)) #b00000000000000000000000000000000) (bvslt (currentBit!2481 (_2!1732 lt!46982)) #b00000000000000000000000000001000) (bvsge (currentByte!2486 (_2!1732 lt!46982)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2486 (_2!1732 lt!46982)) (size!797 (buf!1125 (_2!1732 lt!46982)))) (and (= (currentBit!2481 (_2!1732 lt!46982)) #b00000000000000000000000000000000) (= (currentByte!2486 (_2!1732 lt!46982)) (size!797 (buf!1125 (_2!1732 lt!46982))))))))))

(assert (=> b!31900 d!9478))

(declare-fun d!9480 () Bool)

(assert (=> d!9480 (= (head!234 lt!46986) (h!512 lt!46986))))

(assert (=> b!31911 d!9480))

(declare-fun d!9482 () Bool)

(declare-fun e!21336 () Bool)

(assert (=> d!9482 e!21336))

(declare-fun res!27564 () Bool)

(assert (=> d!9482 (=> (not res!27564) (not e!21336))))

(declare-fun lt!47761 () (_ BitVec 64))

(declare-fun lt!47764 () (_ BitVec 64))

(declare-fun lt!47762 () (_ BitVec 64))

(assert (=> d!9482 (= res!27564 (= lt!47761 (bvsub lt!47762 lt!47764)))))

(assert (=> d!9482 (or (= (bvand lt!47762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47764 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47762 lt!47764) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9482 (= lt!47764 (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46982))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46982)))))))

(declare-fun lt!47763 () (_ BitVec 64))

(declare-fun lt!47760 () (_ BitVec 64))

(assert (=> d!9482 (= lt!47762 (bvmul lt!47763 lt!47760))))

(assert (=> d!9482 (or (= lt!47763 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47760 (bvsdiv (bvmul lt!47763 lt!47760) lt!47763)))))

(assert (=> d!9482 (= lt!47760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9482 (= lt!47763 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))))))

(assert (=> d!9482 (= lt!47761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46982))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46982)))))))

(assert (=> d!9482 (invariant!0 (currentBit!2481 (_2!1732 lt!46982)) (currentByte!2486 (_2!1732 lt!46982)) (size!797 (buf!1125 (_2!1732 lt!46982))))))

(assert (=> d!9482 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46982))) (currentByte!2486 (_2!1732 lt!46982)) (currentBit!2481 (_2!1732 lt!46982))) lt!47761)))

(declare-fun b!32267 () Bool)

(declare-fun res!27565 () Bool)

(assert (=> b!32267 (=> (not res!27565) (not e!21336))))

(assert (=> b!32267 (= res!27565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47761))))

(declare-fun b!32268 () Bool)

(declare-fun lt!47765 () (_ BitVec 64))

(assert (=> b!32268 (= e!21336 (bvsle lt!47761 (bvmul lt!47765 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32268 (or (= lt!47765 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47765 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47765)))))

(assert (=> b!32268 (= lt!47765 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46982)))))))

(assert (= (and d!9482 res!27564) b!32267))

(assert (= (and b!32267 res!27565) b!32268))

(declare-fun m!47679 () Bool)

(assert (=> d!9482 m!47679))

(assert (=> d!9482 m!47081))

(assert (=> b!31912 d!9482))

(declare-fun d!9484 () Bool)

(assert (=> d!9484 (= (head!234 (byteArrayBitContentToList!0 (_2!1732 lt!46975) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!512 (byteArrayBitContentToList!0 (_2!1732 lt!46975) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31901 d!9484))

(declare-fun d!9486 () Bool)

(declare-fun c!2210 () Bool)

(assert (=> d!9486 (= c!2210 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21339 () List!397)

(assert (=> d!9486 (= (byteArrayBitContentToList!0 (_2!1732 lt!46975) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!21339)))

(declare-fun b!32271 () Bool)

(assert (=> b!32271 (= e!21339 Nil!394)))

(declare-fun b!32272 () Bool)

(assert (=> b!32272 (= e!21339 (Cons!393 (not (= (bvand ((_ sign_extend 24) (select (arr!1269 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1732 lt!46975) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9486 c!2210) b!32271))

(assert (= (and d!9486 (not c!2210)) b!32272))

(assert (=> b!32272 m!47029))

(assert (=> b!32272 m!47285))

(declare-fun m!47681 () Bool)

(assert (=> b!32272 m!47681))

(assert (=> b!31901 d!9486))

(declare-fun d!9488 () Bool)

(assert (=> d!9488 (= (head!234 (bitStreamReadBitsIntoList!0 (_2!1732 lt!46975) (_1!1733 lt!46979) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!512 (bitStreamReadBitsIntoList!0 (_2!1732 lt!46975) (_1!1733 lt!46979) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31901 d!9488))

(declare-fun b!32276 () Bool)

(declare-fun e!21340 () Bool)

(declare-fun lt!47774 () List!397)

(assert (=> b!32276 (= e!21340 (> (length!123 lt!47774) 0))))

(declare-fun b!32275 () Bool)

(assert (=> b!32275 (= e!21340 (isEmpty!87 lt!47774))))

(declare-fun d!9490 () Bool)

(assert (=> d!9490 e!21340))

(declare-fun c!2212 () Bool)

(assert (=> d!9490 (= c!2212 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!21341 () tuple2!3298)

(assert (=> d!9490 (= lt!47774 (_1!1736 e!21341))))

(declare-fun c!2211 () Bool)

(assert (=> d!9490 (= c!2211 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9490 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9490 (= (bitStreamReadBitsIntoList!0 (_2!1732 lt!46975) (_1!1733 lt!46979) #b0000000000000000000000000000000000000000000000000000000000000001) lt!47774)))

(declare-fun lt!47772 () tuple2!3300)

(declare-fun lt!47773 () (_ BitVec 64))

(declare-fun b!32274 () Bool)

(assert (=> b!32274 (= e!21341 (tuple2!3299 (Cons!393 (_1!1737 lt!47772) (bitStreamReadBitsIntoList!0 (_2!1732 lt!46975) (_2!1737 lt!47772) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!47773))) (_2!1737 lt!47772)))))

(assert (=> b!32274 (= lt!47772 (readBit!0 (_1!1733 lt!46979)))))

(assert (=> b!32274 (= lt!47773 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!32273 () Bool)

(assert (=> b!32273 (= e!21341 (tuple2!3299 Nil!394 (_1!1733 lt!46979)))))

(assert (= (and d!9490 c!2211) b!32273))

(assert (= (and d!9490 (not c!2211)) b!32274))

(assert (= (and d!9490 c!2212) b!32275))

(assert (= (and d!9490 (not c!2212)) b!32276))

(declare-fun m!47683 () Bool)

(assert (=> b!32276 m!47683))

(declare-fun m!47685 () Bool)

(assert (=> b!32275 m!47685))

(declare-fun m!47687 () Bool)

(assert (=> b!32274 m!47687))

(declare-fun m!47689 () Bool)

(assert (=> b!32274 m!47689))

(assert (=> b!31901 d!9490))

(declare-fun d!9492 () Bool)

(declare-fun e!21342 () Bool)

(assert (=> d!9492 e!21342))

(declare-fun res!27568 () Bool)

(assert (=> d!9492 (=> (not res!27568) (not e!21342))))

(declare-fun lt!47777 () (_ BitVec 64))

(declare-fun lt!47776 () (_ BitVec 64))

(declare-fun lt!47779 () (_ BitVec 64))

(assert (=> d!9492 (= res!27568 (= lt!47776 (bvsub lt!47777 lt!47779)))))

(assert (=> d!9492 (or (= (bvand lt!47777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!47779 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!47777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!47777 lt!47779) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9492 (= lt!47779 (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))) ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975)))))))

(declare-fun lt!47778 () (_ BitVec 64))

(declare-fun lt!47775 () (_ BitVec 64))

(assert (=> d!9492 (= lt!47777 (bvmul lt!47778 lt!47775))))

(assert (=> d!9492 (or (= lt!47778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!47775 (bvsdiv (bvmul lt!47778 lt!47775) lt!47778)))))

(assert (=> d!9492 (= lt!47775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9492 (= lt!47778 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))))))

(assert (=> d!9492 (= lt!47776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2486 (_2!1732 lt!46975))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2481 (_2!1732 lt!46975)))))))

(assert (=> d!9492 (invariant!0 (currentBit!2481 (_2!1732 lt!46975)) (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46975))))))

(assert (=> d!9492 (= (bitIndex!0 (size!797 (buf!1125 (_2!1732 lt!46975))) (currentByte!2486 (_2!1732 lt!46975)) (currentBit!2481 (_2!1732 lt!46975))) lt!47776)))

(declare-fun b!32277 () Bool)

(declare-fun res!27569 () Bool)

(assert (=> b!32277 (=> (not res!27569) (not e!21342))))

(assert (=> b!32277 (= res!27569 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!47776))))

(declare-fun b!32278 () Bool)

(declare-fun lt!47780 () (_ BitVec 64))

(assert (=> b!32278 (= e!21342 (bvsle lt!47776 (bvmul lt!47780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!32278 (or (= lt!47780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!47780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!47780)))))

(assert (=> b!32278 (= lt!47780 ((_ sign_extend 32) (size!797 (buf!1125 (_2!1732 lt!46975)))))))

(assert (= (and d!9492 res!27568) b!32277))

(assert (= (and b!32277 res!27569) b!32278))

(assert (=> d!9492 m!47253))

(assert (=> d!9492 m!47039))

(assert (=> b!31907 d!9492))

(declare-fun d!9494 () Bool)

(assert (=> d!9494 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!797 (buf!1125 thiss!1379))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!797 (buf!1125 thiss!1379))) ((_ sign_extend 32) (currentByte!2486 thiss!1379)) ((_ sign_extend 32) (currentBit!2481 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2593 () Bool)

(assert (= bs!2593 d!9494))

(assert (=> bs!2593 m!47307))

(assert (=> b!31897 d!9494))

(declare-fun d!9496 () Bool)

(declare-fun size!799 (List!397) Int)

(assert (=> d!9496 (= (length!123 lt!46986) (size!799 lt!46986))))

(declare-fun bs!2594 () Bool)

(assert (= bs!2594 d!9496))

(declare-fun m!47691 () Bool)

(assert (=> bs!2594 m!47691))

(assert (=> b!31898 d!9496))

(declare-fun d!9498 () Bool)

(assert (=> d!9498 (= (array_inv!749 srcBuffer!2) (bvsge (size!797 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6760 d!9498))

(declare-fun d!9500 () Bool)

(assert (=> d!9500 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2481 thiss!1379) (currentByte!2486 thiss!1379) (size!797 (buf!1125 thiss!1379))))))

(declare-fun bs!2595 () Bool)

(assert (= bs!2595 d!9500))

(assert (=> bs!2595 m!47309))

(assert (=> start!6760 d!9500))

(declare-fun d!9502 () Bool)

(assert (=> d!9502 (= (invariant!0 (currentBit!2481 (_2!1732 lt!46975)) (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46975)))) (and (bvsge (currentBit!2481 (_2!1732 lt!46975)) #b00000000000000000000000000000000) (bvslt (currentBit!2481 (_2!1732 lt!46975)) #b00000000000000000000000000001000) (bvsge (currentByte!2486 (_2!1732 lt!46975)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46975)))) (and (= (currentBit!2481 (_2!1732 lt!46975)) #b00000000000000000000000000000000) (= (currentByte!2486 (_2!1732 lt!46975)) (size!797 (buf!1125 (_2!1732 lt!46975))))))))))

(assert (=> b!31909 d!9502))

(check-sat (not b!32060) (not b!32020) (not d!9362) (not b!32042) (not d!9318) (not b!32045) (not d!9328) (not b!32254) (not b!31984) (not b!32008) (not b!32007) (not b!32256) (not b!32039) (not b!32054) (not b!32043) (not d!9330) (not d!9494) (not d!9370) (not b!32000) (not b!32251) (not d!9376) (not b!32002) (not b!32088) (not b!32090) (not bm!409) (not d!9372) (not b!32072) (not b!31987) (not d!9492) (not b!32006) (not b!32040) (not b!32038) (not b!32253) (not d!9368) (not d!9360) (not d!9320) (not b!32041) (not b!32015) (not b!32070) (not b!32249) (not b!32083) (not b!32252) (not b!31998) (not b!32001) (not d!9500) (not b!32061) (not b!32063) (not b!32274) (not b!32276) (not b!31997) (not b!32275) (not d!9324) (not b!32272) (not b!32085) (not d!9346) (not b!32017) (not d!9310) (not d!9496) (not d!9476) (not b!32084) (not d!9482) (not d!9312) (not d!9332) (not b!32004) (not d!9314) (not b!31983) (not b!31985) (not b!32044) (not b!31999) (not b!32087))
(check-sat)
