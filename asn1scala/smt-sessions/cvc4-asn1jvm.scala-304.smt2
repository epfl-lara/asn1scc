; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6000 () Bool)

(assert start!6000)

(declare-fun b!27888 () Bool)

(declare-fun res!24165 () Bool)

(declare-fun e!18819 () Bool)

(assert (=> b!27888 (=> res!24165 e!18819)))

(declare-datatypes ((array!1737 0))(
  ( (array!1738 (arr!1213 (Array (_ BitVec 32) (_ BitVec 8))) (size!751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1334 0))(
  ( (BitStream!1335 (buf!1078 array!1737) (currentByte!2403 (_ BitVec 32)) (currentBit!2398 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3034 0))(
  ( (tuple2!3035 (_1!1604 BitStream!1334) (_2!1604 BitStream!1334)) )
))
(declare-fun lt!39393 () tuple2!3034)

(declare-fun lt!39401 () tuple2!3034)

(declare-fun isPrefixOf!0 (BitStream!1334 BitStream!1334) Bool)

(assert (=> b!27888 (= res!24165 (not (isPrefixOf!0 (_1!1604 lt!39393) (_1!1604 lt!39401))))))

(declare-fun b!27890 () Bool)

(declare-fun e!18810 () Bool)

(declare-fun e!18815 () Bool)

(assert (=> b!27890 (= e!18810 e!18815)))

(declare-fun res!24166 () Bool)

(assert (=> b!27890 (=> res!24166 e!18815)))

(declare-fun thiss!1379 () BitStream!1334)

(declare-datatypes ((Unit!2205 0))(
  ( (Unit!2206) )
))
(declare-datatypes ((tuple2!3036 0))(
  ( (tuple2!3037 (_1!1605 Unit!2205) (_2!1605 BitStream!1334)) )
))
(declare-fun lt!39403 () tuple2!3036)

(assert (=> b!27890 (= res!24166 (not (isPrefixOf!0 thiss!1379 (_2!1605 lt!39403))))))

(declare-fun lt!39400 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27890 (validate_offset_bits!1 ((_ sign_extend 32) (size!751 (buf!1078 (_2!1605 lt!39403)))) ((_ sign_extend 32) (currentByte!2403 (_2!1605 lt!39403))) ((_ sign_extend 32) (currentBit!2398 (_2!1605 lt!39403))) lt!39400)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!27890 (= lt!39400 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39389 () Unit!2205)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1334 BitStream!1334 (_ BitVec 64) (_ BitVec 64)) Unit!2205)

(assert (=> b!27890 (= lt!39389 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1605 lt!39403) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1737)

(declare-fun appendBitFromByte!0 (BitStream!1334 (_ BitVec 8) (_ BitVec 32)) tuple2!3036)

(assert (=> b!27890 (= lt!39403 (appendBitFromByte!0 thiss!1379 (select (arr!1213 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27891 () Bool)

(declare-fun res!24163 () Bool)

(assert (=> b!27891 (=> res!24163 e!18819)))

(declare-fun lt!39402 () tuple2!3036)

(assert (=> b!27891 (= res!24163 (not (isPrefixOf!0 (_1!1604 lt!39401) (_2!1605 lt!39402))))))

(declare-fun b!27892 () Bool)

(declare-fun res!24178 () Bool)

(declare-fun e!18817 () Bool)

(assert (=> b!27892 (=> (not res!24178) (not e!18817))))

(assert (=> b!27892 (= res!24178 (validate_offset_bits!1 ((_ sign_extend 32) (size!751 (buf!1078 thiss!1379))) ((_ sign_extend 32) (currentByte!2403 thiss!1379)) ((_ sign_extend 32) (currentBit!2398 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27893 () Bool)

(declare-fun e!18820 () Bool)

(declare-fun e!18813 () Bool)

(assert (=> b!27893 (= e!18820 e!18813)))

(declare-fun res!24177 () Bool)

(assert (=> b!27893 (=> res!24177 e!18813)))

(assert (=> b!27893 (= res!24177 (not (= (size!751 (buf!1078 (_2!1605 lt!39403))) (size!751 (buf!1078 (_2!1605 lt!39402))))))))

(declare-fun e!18811 () Bool)

(assert (=> b!27893 e!18811))

(declare-fun res!24174 () Bool)

(assert (=> b!27893 (=> (not res!24174) (not e!18811))))

(assert (=> b!27893 (= res!24174 (= (size!751 (buf!1078 (_2!1605 lt!39402))) (size!751 (buf!1078 thiss!1379))))))

(declare-fun b!27894 () Bool)

(assert (=> b!27894 (= e!18817 (not e!18810))))

(declare-fun res!24173 () Bool)

(assert (=> b!27894 (=> res!24173 e!18810)))

(assert (=> b!27894 (= res!24173 (bvsge i!635 to!314))))

(assert (=> b!27894 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39390 () Unit!2205)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1334) Unit!2205)

(assert (=> b!27894 (= lt!39390 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39399 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27894 (= lt!39399 (bitIndex!0 (size!751 (buf!1078 thiss!1379)) (currentByte!2403 thiss!1379) (currentBit!2398 thiss!1379)))))

(declare-fun e!18818 () Bool)

(declare-fun lt!39397 () tuple2!3034)

(declare-fun b!27895 () Bool)

(declare-datatypes ((List!368 0))(
  ( (Nil!365) (Cons!364 (h!483 Bool) (t!1118 List!368)) )
))
(declare-fun head!205 (List!368) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1334 array!1737 (_ BitVec 64) (_ BitVec 64)) List!368)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1334 BitStream!1334 (_ BitVec 64)) List!368)

(assert (=> b!27895 (= e!18818 (= (head!205 (byteArrayBitContentToList!0 (_2!1605 lt!39403) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!205 (bitStreamReadBitsIntoList!0 (_2!1605 lt!39403) (_1!1604 lt!39397) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27896 () Bool)

(declare-fun e!18812 () Bool)

(assert (=> b!27896 (= e!18812 e!18820)))

(declare-fun res!24171 () Bool)

(assert (=> b!27896 (=> res!24171 e!18820)))

(declare-fun lt!39395 () (_ BitVec 64))

(assert (=> b!27896 (= res!24171 (not (= lt!39395 (bvsub (bvadd lt!39399 to!314) i!635))))))

(assert (=> b!27896 (= lt!39395 (bitIndex!0 (size!751 (buf!1078 (_2!1605 lt!39402))) (currentByte!2403 (_2!1605 lt!39402)) (currentBit!2398 (_2!1605 lt!39402))))))

(declare-fun b!27897 () Bool)

(declare-fun res!24162 () Bool)

(assert (=> b!27897 (=> res!24162 e!18820)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27897 (= res!24162 (not (invariant!0 (currentBit!2398 (_2!1605 lt!39402)) (currentByte!2403 (_2!1605 lt!39402)) (size!751 (buf!1078 (_2!1605 lt!39402))))))))

(declare-fun b!27898 () Bool)

(assert (=> b!27898 (= e!18813 e!18819)))

(declare-fun res!24167 () Bool)

(assert (=> b!27898 (=> res!24167 e!18819)))

(assert (=> b!27898 (= res!24167 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39396 () List!368)

(assert (=> b!27898 (= lt!39396 (bitStreamReadBitsIntoList!0 (_2!1605 lt!39402) (_1!1604 lt!39401) lt!39400))))

(declare-fun lt!39398 () List!368)

(assert (=> b!27898 (= lt!39398 (bitStreamReadBitsIntoList!0 (_2!1605 lt!39402) (_1!1604 lt!39393) (bvsub to!314 i!635)))))

(assert (=> b!27898 (validate_offset_bits!1 ((_ sign_extend 32) (size!751 (buf!1078 (_2!1605 lt!39402)))) ((_ sign_extend 32) (currentByte!2403 (_2!1605 lt!39403))) ((_ sign_extend 32) (currentBit!2398 (_2!1605 lt!39403))) lt!39400)))

(declare-fun lt!39405 () Unit!2205)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1334 array!1737 (_ BitVec 64)) Unit!2205)

(assert (=> b!27898 (= lt!39405 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1605 lt!39403) (buf!1078 (_2!1605 lt!39402)) lt!39400))))

(declare-fun reader!0 (BitStream!1334 BitStream!1334) tuple2!3034)

(assert (=> b!27898 (= lt!39401 (reader!0 (_2!1605 lt!39403) (_2!1605 lt!39402)))))

(assert (=> b!27898 (validate_offset_bits!1 ((_ sign_extend 32) (size!751 (buf!1078 (_2!1605 lt!39402)))) ((_ sign_extend 32) (currentByte!2403 thiss!1379)) ((_ sign_extend 32) (currentBit!2398 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39406 () Unit!2205)

(assert (=> b!27898 (= lt!39406 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1078 (_2!1605 lt!39402)) (bvsub to!314 i!635)))))

(assert (=> b!27898 (= lt!39393 (reader!0 thiss!1379 (_2!1605 lt!39402)))))

(declare-fun b!27899 () Bool)

(declare-fun res!24172 () Bool)

(assert (=> b!27899 (=> res!24172 e!18813)))

(assert (=> b!27899 (= res!24172 (not (invariant!0 (currentBit!2398 (_2!1605 lt!39403)) (currentByte!2403 (_2!1605 lt!39403)) (size!751 (buf!1078 (_2!1605 lt!39403))))))))

(declare-fun b!27900 () Bool)

(declare-fun res!24170 () Bool)

(assert (=> b!27900 (=> res!24170 e!18819)))

(assert (=> b!27900 (= res!24170 (not (isPrefixOf!0 (_1!1604 lt!39393) (_2!1605 lt!39402))))))

(declare-fun b!27901 () Bool)

(declare-fun e!18816 () Bool)

(declare-fun array_inv!720 (array!1737) Bool)

(assert (=> b!27901 (= e!18816 (array_inv!720 (buf!1078 thiss!1379)))))

(declare-fun b!27889 () Bool)

(declare-fun res!24175 () Bool)

(assert (=> b!27889 (=> res!24175 e!18820)))

(assert (=> b!27889 (= res!24175 (not (= (size!751 (buf!1078 thiss!1379)) (size!751 (buf!1078 (_2!1605 lt!39402))))))))

(declare-fun res!24168 () Bool)

(assert (=> start!6000 (=> (not res!24168) (not e!18817))))

(assert (=> start!6000 (= res!24168 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!751 srcBuffer!2))))))))

(assert (=> start!6000 e!18817))

(assert (=> start!6000 true))

(assert (=> start!6000 (array_inv!720 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1334) Bool)

(assert (=> start!6000 (and (inv!12 thiss!1379) e!18816)))

(declare-fun b!27902 () Bool)

(declare-fun res!24169 () Bool)

(assert (=> b!27902 (=> res!24169 e!18813)))

(assert (=> b!27902 (= res!24169 (not (invariant!0 (currentBit!2398 (_2!1605 lt!39403)) (currentByte!2403 (_2!1605 lt!39403)) (size!751 (buf!1078 (_2!1605 lt!39402))))))))

(declare-fun b!27903 () Bool)

(assert (=> b!27903 (= e!18815 e!18812)))

(declare-fun res!24179 () Bool)

(assert (=> b!27903 (=> res!24179 e!18812)))

(assert (=> b!27903 (= res!24179 (not (isPrefixOf!0 (_2!1605 lt!39403) (_2!1605 lt!39402))))))

(assert (=> b!27903 (isPrefixOf!0 thiss!1379 (_2!1605 lt!39402))))

(declare-fun lt!39404 () Unit!2205)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1334 BitStream!1334 BitStream!1334) Unit!2205)

(assert (=> b!27903 (= lt!39404 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1605 lt!39403) (_2!1605 lt!39402)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1334 array!1737 (_ BitVec 64) (_ BitVec 64)) tuple2!3036)

(assert (=> b!27903 (= lt!39402 (appendBitsMSBFirstLoop!0 (_2!1605 lt!39403) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27903 e!18818))

(declare-fun res!24164 () Bool)

(assert (=> b!27903 (=> (not res!24164) (not e!18818))))

(assert (=> b!27903 (= res!24164 (validate_offset_bits!1 ((_ sign_extend 32) (size!751 (buf!1078 (_2!1605 lt!39403)))) ((_ sign_extend 32) (currentByte!2403 thiss!1379)) ((_ sign_extend 32) (currentBit!2398 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39391 () Unit!2205)

(assert (=> b!27903 (= lt!39391 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1078 (_2!1605 lt!39403)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27903 (= lt!39397 (reader!0 thiss!1379 (_2!1605 lt!39403)))))

(declare-fun b!27904 () Bool)

(assert (=> b!27904 (= e!18819 true)))

(declare-fun lt!39392 () (_ BitVec 64))

(assert (=> b!27904 (= lt!39392 (bitIndex!0 (size!751 (buf!1078 (_1!1604 lt!39401))) (currentByte!2403 (_1!1604 lt!39401)) (currentBit!2398 (_1!1604 lt!39401))))))

(declare-fun lt!39394 () (_ BitVec 64))

(assert (=> b!27904 (= lt!39394 (bitIndex!0 (size!751 (buf!1078 (_1!1604 lt!39393))) (currentByte!2403 (_1!1604 lt!39393)) (currentBit!2398 (_1!1604 lt!39393))))))

(declare-fun b!27905 () Bool)

(assert (=> b!27905 (= e!18811 (= lt!39395 (bvsub (bvsub (bvadd (bitIndex!0 (size!751 (buf!1078 (_2!1605 lt!39403))) (currentByte!2403 (_2!1605 lt!39403)) (currentBit!2398 (_2!1605 lt!39403))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27906 () Bool)

(declare-fun res!24180 () Bool)

(assert (=> b!27906 (=> res!24180 e!18819)))

(declare-fun length!94 (List!368) Int)

(assert (=> b!27906 (= res!24180 (<= (length!94 lt!39398) 0))))

(declare-fun b!27907 () Bool)

(declare-fun res!24176 () Bool)

(assert (=> b!27907 (=> res!24176 e!18819)))

(assert (=> b!27907 (= res!24176 (or (not (= (buf!1078 (_1!1604 lt!39393)) (buf!1078 (_1!1604 lt!39401)))) (not (= (buf!1078 (_1!1604 lt!39393)) (buf!1078 (_2!1605 lt!39402)))) (bvsge lt!39395 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(assert (= (and start!6000 res!24168) b!27892))

(assert (= (and b!27892 res!24178) b!27894))

(assert (= (and b!27894 (not res!24173)) b!27890))

(assert (= (and b!27890 (not res!24166)) b!27903))

(assert (= (and b!27903 res!24164) b!27895))

(assert (= (and b!27903 (not res!24179)) b!27896))

(assert (= (and b!27896 (not res!24171)) b!27897))

(assert (= (and b!27897 (not res!24162)) b!27889))

(assert (= (and b!27889 (not res!24175)) b!27893))

(assert (= (and b!27893 res!24174) b!27905))

(assert (= (and b!27893 (not res!24177)) b!27899))

(assert (= (and b!27899 (not res!24172)) b!27902))

(assert (= (and b!27902 (not res!24169)) b!27898))

(assert (= (and b!27898 (not res!24167)) b!27906))

(assert (= (and b!27906 (not res!24180)) b!27900))

(assert (= (and b!27900 (not res!24170)) b!27891))

(assert (= (and b!27891 (not res!24163)) b!27888))

(assert (= (and b!27888 (not res!24165)) b!27907))

(assert (= (and b!27907 (not res!24176)) b!27904))

(assert (= start!6000 b!27901))

(declare-fun m!39945 () Bool)

(assert (=> b!27888 m!39945))

(declare-fun m!39947 () Bool)

(assert (=> b!27898 m!39947))

(declare-fun m!39949 () Bool)

(assert (=> b!27898 m!39949))

(declare-fun m!39951 () Bool)

(assert (=> b!27898 m!39951))

(declare-fun m!39953 () Bool)

(assert (=> b!27898 m!39953))

(declare-fun m!39955 () Bool)

(assert (=> b!27898 m!39955))

(declare-fun m!39957 () Bool)

(assert (=> b!27898 m!39957))

(declare-fun m!39959 () Bool)

(assert (=> b!27898 m!39959))

(declare-fun m!39961 () Bool)

(assert (=> b!27898 m!39961))

(declare-fun m!39963 () Bool)

(assert (=> b!27896 m!39963))

(declare-fun m!39965 () Bool)

(assert (=> start!6000 m!39965))

(declare-fun m!39967 () Bool)

(assert (=> start!6000 m!39967))

(declare-fun m!39969 () Bool)

(assert (=> b!27904 m!39969))

(declare-fun m!39971 () Bool)

(assert (=> b!27904 m!39971))

(declare-fun m!39973 () Bool)

(assert (=> b!27890 m!39973))

(assert (=> b!27890 m!39973))

(declare-fun m!39975 () Bool)

(assert (=> b!27890 m!39975))

(declare-fun m!39977 () Bool)

(assert (=> b!27890 m!39977))

(declare-fun m!39979 () Bool)

(assert (=> b!27890 m!39979))

(declare-fun m!39981 () Bool)

(assert (=> b!27890 m!39981))

(declare-fun m!39983 () Bool)

(assert (=> b!27906 m!39983))

(declare-fun m!39985 () Bool)

(assert (=> b!27900 m!39985))

(declare-fun m!39987 () Bool)

(assert (=> b!27892 m!39987))

(declare-fun m!39989 () Bool)

(assert (=> b!27901 m!39989))

(declare-fun m!39991 () Bool)

(assert (=> b!27902 m!39991))

(declare-fun m!39993 () Bool)

(assert (=> b!27897 m!39993))

(declare-fun m!39995 () Bool)

(assert (=> b!27895 m!39995))

(assert (=> b!27895 m!39995))

(declare-fun m!39997 () Bool)

(assert (=> b!27895 m!39997))

(declare-fun m!39999 () Bool)

(assert (=> b!27895 m!39999))

(assert (=> b!27895 m!39999))

(declare-fun m!40001 () Bool)

(assert (=> b!27895 m!40001))

(declare-fun m!40003 () Bool)

(assert (=> b!27899 m!40003))

(declare-fun m!40005 () Bool)

(assert (=> b!27891 m!40005))

(declare-fun m!40007 () Bool)

(assert (=> b!27905 m!40007))

(declare-fun m!40009 () Bool)

(assert (=> b!27903 m!40009))

(declare-fun m!40011 () Bool)

(assert (=> b!27903 m!40011))

(declare-fun m!40013 () Bool)

(assert (=> b!27903 m!40013))

(declare-fun m!40015 () Bool)

(assert (=> b!27903 m!40015))

(declare-fun m!40017 () Bool)

(assert (=> b!27903 m!40017))

(declare-fun m!40019 () Bool)

(assert (=> b!27903 m!40019))

(declare-fun m!40021 () Bool)

(assert (=> b!27903 m!40021))

(declare-fun m!40023 () Bool)

(assert (=> b!27894 m!40023))

(declare-fun m!40025 () Bool)

(assert (=> b!27894 m!40025))

(declare-fun m!40027 () Bool)

(assert (=> b!27894 m!40027))

(push 1)

