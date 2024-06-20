; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12880 () Bool)

(assert start!12880)

(declare-fun b!66084 () Bool)

(declare-fun e!43414 () Bool)

(assert (=> b!66084 (= e!43414 true)))

(declare-fun lt!104862 () (_ BitVec 64))

(declare-datatypes ((array!2846 0))(
  ( (array!2847 (arr!1876 (Array (_ BitVec 32) (_ BitVec 8))) (size!1312 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2258 0))(
  ( (BitStream!2259 (buf!1693 array!2846) (currentByte!3365 (_ BitVec 32)) (currentBit!3360 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5852 0))(
  ( (tuple2!5853 (_1!3037 BitStream!2258) (_2!3037 BitStream!2258)) )
))
(declare-fun lt!104875 () tuple2!5852)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66084 (= lt!104862 (bitIndex!0 (size!1312 (buf!1693 (_1!3037 lt!104875))) (currentByte!3365 (_1!3037 lt!104875)) (currentBit!3360 (_1!3037 lt!104875))))))

(declare-fun lt!104868 () (_ BitVec 64))

(declare-fun lt!104865 () tuple2!5852)

(assert (=> b!66084 (= lt!104868 (bitIndex!0 (size!1312 (buf!1693 (_1!3037 lt!104865))) (currentByte!3365 (_1!3037 lt!104865)) (currentBit!3360 (_1!3037 lt!104865))))))

(declare-fun b!66085 () Bool)

(declare-fun res!54795 () Bool)

(assert (=> b!66085 (=> res!54795 e!43414)))

(declare-datatypes ((Unit!4461 0))(
  ( (Unit!4462) )
))
(declare-datatypes ((tuple2!5854 0))(
  ( (tuple2!5855 (_1!3038 Unit!4461) (_2!3038 BitStream!2258)) )
))
(declare-fun lt!104872 () tuple2!5854)

(declare-fun lt!104864 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!66085 (= res!54795 (or (not (= (buf!1693 (_1!3037 lt!104865)) (buf!1693 (_1!3037 lt!104875)))) (not (= (buf!1693 (_1!3037 lt!104865)) (buf!1693 (_2!3038 lt!104872)))) (bvsge lt!104864 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!66086 () Bool)

(declare-fun res!54791 () Bool)

(declare-fun e!43413 () Bool)

(assert (=> b!66086 (=> res!54791 e!43413)))

(declare-fun thiss!1379 () BitStream!2258)

(assert (=> b!66086 (= res!54791 (not (= (size!1312 (buf!1693 thiss!1379)) (size!1312 (buf!1693 (_2!3038 lt!104872))))))))

(declare-fun b!66087 () Bool)

(declare-fun e!43418 () Bool)

(assert (=> b!66087 (= e!43413 e!43418)))

(declare-fun res!54780 () Bool)

(assert (=> b!66087 (=> res!54780 e!43418)))

(declare-fun lt!104860 () tuple2!5854)

(assert (=> b!66087 (= res!54780 (not (= (size!1312 (buf!1693 (_2!3038 lt!104860))) (size!1312 (buf!1693 (_2!3038 lt!104872))))))))

(declare-fun e!43415 () Bool)

(assert (=> b!66087 e!43415))

(declare-fun res!54786 () Bool)

(assert (=> b!66087 (=> (not res!54786) (not e!43415))))

(assert (=> b!66087 (= res!54786 (= (size!1312 (buf!1693 (_2!3038 lt!104872))) (size!1312 (buf!1693 thiss!1379))))))

(declare-fun b!66088 () Bool)

(declare-fun res!54792 () Bool)

(assert (=> b!66088 (=> res!54792 e!43418)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66088 (= res!54792 (not (invariant!0 (currentBit!3360 (_2!3038 lt!104860)) (currentByte!3365 (_2!3038 lt!104860)) (size!1312 (buf!1693 (_2!3038 lt!104872))))))))

(declare-fun b!66089 () Bool)

(declare-fun e!43417 () Bool)

(declare-fun e!43421 () Bool)

(assert (=> b!66089 (= e!43417 (not e!43421))))

(declare-fun res!54798 () Bool)

(assert (=> b!66089 (=> res!54798 e!43421)))

(assert (=> b!66089 (= res!54798 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2258 BitStream!2258) Bool)

(assert (=> b!66089 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!104871 () Unit!4461)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2258) Unit!4461)

(assert (=> b!66089 (= lt!104871 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!104859 () (_ BitVec 64))

(assert (=> b!66089 (= lt!104859 (bitIndex!0 (size!1312 (buf!1693 thiss!1379)) (currentByte!3365 thiss!1379) (currentBit!3360 thiss!1379)))))

(declare-fun b!66090 () Bool)

(declare-fun res!54784 () Bool)

(assert (=> b!66090 (=> res!54784 e!43414)))

(assert (=> b!66090 (= res!54784 (not (isPrefixOf!0 (_1!3037 lt!104865) (_1!3037 lt!104875))))))

(declare-fun b!66091 () Bool)

(declare-fun res!54794 () Bool)

(assert (=> b!66091 (=> res!54794 e!43414)))

(declare-datatypes ((List!704 0))(
  ( (Nil!701) (Cons!700 (h!819 Bool) (t!1454 List!704)) )
))
(declare-fun lt!104870 () List!704)

(declare-fun length!332 (List!704) Int)

(assert (=> b!66091 (= res!54794 (<= (length!332 lt!104870) 0))))

(declare-fun b!66092 () Bool)

(declare-fun res!54785 () Bool)

(assert (=> b!66092 (=> res!54785 e!43413)))

(assert (=> b!66092 (= res!54785 (not (invariant!0 (currentBit!3360 (_2!3038 lt!104872)) (currentByte!3365 (_2!3038 lt!104872)) (size!1312 (buf!1693 (_2!3038 lt!104872))))))))

(declare-fun res!54788 () Bool)

(assert (=> start!12880 (=> (not res!54788) (not e!43417))))

(declare-fun srcBuffer!2 () array!2846)

(assert (=> start!12880 (= res!54788 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1312 srcBuffer!2))))))))

(assert (=> start!12880 e!43417))

(assert (=> start!12880 true))

(declare-fun array_inv!1188 (array!2846) Bool)

(assert (=> start!12880 (array_inv!1188 srcBuffer!2)))

(declare-fun e!43410 () Bool)

(declare-fun inv!12 (BitStream!2258) Bool)

(assert (=> start!12880 (and (inv!12 thiss!1379) e!43410)))

(declare-fun b!66093 () Bool)

(declare-fun e!43416 () Bool)

(assert (=> b!66093 (= e!43421 e!43416)))

(declare-fun res!54782 () Bool)

(assert (=> b!66093 (=> res!54782 e!43416)))

(assert (=> b!66093 (= res!54782 (not (isPrefixOf!0 thiss!1379 (_2!3038 lt!104860))))))

(declare-fun lt!104867 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66093 (validate_offset_bits!1 ((_ sign_extend 32) (size!1312 (buf!1693 (_2!3038 lt!104860)))) ((_ sign_extend 32) (currentByte!3365 (_2!3038 lt!104860))) ((_ sign_extend 32) (currentBit!3360 (_2!3038 lt!104860))) lt!104867)))

(assert (=> b!66093 (= lt!104867 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104863 () Unit!4461)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2258 BitStream!2258 (_ BitVec 64) (_ BitVec 64)) Unit!4461)

(assert (=> b!66093 (= lt!104863 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3038 lt!104860) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2258 (_ BitVec 8) (_ BitVec 32)) tuple2!5854)

(assert (=> b!66093 (= lt!104860 (appendBitFromByte!0 thiss!1379 (select (arr!1876 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!66094 () Bool)

(declare-fun e!43420 () Bool)

(assert (=> b!66094 (= e!43416 e!43420)))

(declare-fun res!54783 () Bool)

(assert (=> b!66094 (=> res!54783 e!43420)))

(assert (=> b!66094 (= res!54783 (not (isPrefixOf!0 (_2!3038 lt!104860) (_2!3038 lt!104872))))))

(assert (=> b!66094 (isPrefixOf!0 thiss!1379 (_2!3038 lt!104872))))

(declare-fun lt!104873 () Unit!4461)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2258 BitStream!2258 BitStream!2258) Unit!4461)

(assert (=> b!66094 (= lt!104873 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3038 lt!104860) (_2!3038 lt!104872)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2258 array!2846 (_ BitVec 64) (_ BitVec 64)) tuple2!5854)

(assert (=> b!66094 (= lt!104872 (appendBitsMSBFirstLoop!0 (_2!3038 lt!104860) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43411 () Bool)

(assert (=> b!66094 e!43411))

(declare-fun res!54793 () Bool)

(assert (=> b!66094 (=> (not res!54793) (not e!43411))))

(assert (=> b!66094 (= res!54793 (validate_offset_bits!1 ((_ sign_extend 32) (size!1312 (buf!1693 (_2!3038 lt!104860)))) ((_ sign_extend 32) (currentByte!3365 thiss!1379)) ((_ sign_extend 32) (currentBit!3360 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104866 () Unit!4461)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2258 array!2846 (_ BitVec 64)) Unit!4461)

(assert (=> b!66094 (= lt!104866 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1693 (_2!3038 lt!104860)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104869 () tuple2!5852)

(declare-fun reader!0 (BitStream!2258 BitStream!2258) tuple2!5852)

(assert (=> b!66094 (= lt!104869 (reader!0 thiss!1379 (_2!3038 lt!104860)))))

(declare-fun b!66095 () Bool)

(declare-fun res!54790 () Bool)

(assert (=> b!66095 (=> res!54790 e!43414)))

(assert (=> b!66095 (= res!54790 (not (isPrefixOf!0 (_1!3037 lt!104865) (_2!3038 lt!104872))))))

(declare-fun b!66096 () Bool)

(declare-fun res!54781 () Bool)

(assert (=> b!66096 (=> (not res!54781) (not e!43417))))

(assert (=> b!66096 (= res!54781 (validate_offset_bits!1 ((_ sign_extend 32) (size!1312 (buf!1693 thiss!1379))) ((_ sign_extend 32) (currentByte!3365 thiss!1379)) ((_ sign_extend 32) (currentBit!3360 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!66097 () Bool)

(assert (=> b!66097 (= e!43420 e!43413)))

(declare-fun res!54796 () Bool)

(assert (=> b!66097 (=> res!54796 e!43413)))

(assert (=> b!66097 (= res!54796 (not (= lt!104864 (bvsub (bvadd lt!104859 to!314) i!635))))))

(assert (=> b!66097 (= lt!104864 (bitIndex!0 (size!1312 (buf!1693 (_2!3038 lt!104872))) (currentByte!3365 (_2!3038 lt!104872)) (currentBit!3360 (_2!3038 lt!104872))))))

(declare-fun b!66098 () Bool)

(declare-fun head!523 (List!704) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2258 array!2846 (_ BitVec 64) (_ BitVec 64)) List!704)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2258 BitStream!2258 (_ BitVec 64)) List!704)

(assert (=> b!66098 (= e!43411 (= (head!523 (byteArrayBitContentToList!0 (_2!3038 lt!104860) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!523 (bitStreamReadBitsIntoList!0 (_2!3038 lt!104860) (_1!3037 lt!104869) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!66099 () Bool)

(assert (=> b!66099 (= e!43415 (= lt!104864 (bvsub (bvsub (bvadd (bitIndex!0 (size!1312 (buf!1693 (_2!3038 lt!104860))) (currentByte!3365 (_2!3038 lt!104860)) (currentBit!3360 (_2!3038 lt!104860))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!66100 () Bool)

(declare-fun res!54789 () Bool)

(assert (=> b!66100 (=> res!54789 e!43414)))

(assert (=> b!66100 (= res!54789 (not (isPrefixOf!0 (_1!3037 lt!104875) (_2!3038 lt!104872))))))

(declare-fun b!66101 () Bool)

(declare-fun res!54787 () Bool)

(assert (=> b!66101 (=> res!54787 e!43418)))

(assert (=> b!66101 (= res!54787 (not (invariant!0 (currentBit!3360 (_2!3038 lt!104860)) (currentByte!3365 (_2!3038 lt!104860)) (size!1312 (buf!1693 (_2!3038 lt!104860))))))))

(declare-fun b!66102 () Bool)

(assert (=> b!66102 (= e!43410 (array_inv!1188 (buf!1693 thiss!1379)))))

(declare-fun b!66103 () Bool)

(assert (=> b!66103 (= e!43418 e!43414)))

(declare-fun res!54797 () Bool)

(assert (=> b!66103 (=> res!54797 e!43414)))

(assert (=> b!66103 (= res!54797 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104874 () List!704)

(assert (=> b!66103 (= lt!104874 (bitStreamReadBitsIntoList!0 (_2!3038 lt!104872) (_1!3037 lt!104875) lt!104867))))

(assert (=> b!66103 (= lt!104870 (bitStreamReadBitsIntoList!0 (_2!3038 lt!104872) (_1!3037 lt!104865) (bvsub to!314 i!635)))))

(assert (=> b!66103 (validate_offset_bits!1 ((_ sign_extend 32) (size!1312 (buf!1693 (_2!3038 lt!104872)))) ((_ sign_extend 32) (currentByte!3365 (_2!3038 lt!104860))) ((_ sign_extend 32) (currentBit!3360 (_2!3038 lt!104860))) lt!104867)))

(declare-fun lt!104861 () Unit!4461)

(assert (=> b!66103 (= lt!104861 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3038 lt!104860) (buf!1693 (_2!3038 lt!104872)) lt!104867))))

(assert (=> b!66103 (= lt!104875 (reader!0 (_2!3038 lt!104860) (_2!3038 lt!104872)))))

(assert (=> b!66103 (validate_offset_bits!1 ((_ sign_extend 32) (size!1312 (buf!1693 (_2!3038 lt!104872)))) ((_ sign_extend 32) (currentByte!3365 thiss!1379)) ((_ sign_extend 32) (currentBit!3360 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!104858 () Unit!4461)

(assert (=> b!66103 (= lt!104858 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1693 (_2!3038 lt!104872)) (bvsub to!314 i!635)))))

(assert (=> b!66103 (= lt!104865 (reader!0 thiss!1379 (_2!3038 lt!104872)))))

(assert (= (and start!12880 res!54788) b!66096))

(assert (= (and b!66096 res!54781) b!66089))

(assert (= (and b!66089 (not res!54798)) b!66093))

(assert (= (and b!66093 (not res!54782)) b!66094))

(assert (= (and b!66094 res!54793) b!66098))

(assert (= (and b!66094 (not res!54783)) b!66097))

(assert (= (and b!66097 (not res!54796)) b!66092))

(assert (= (and b!66092 (not res!54785)) b!66086))

(assert (= (and b!66086 (not res!54791)) b!66087))

(assert (= (and b!66087 res!54786) b!66099))

(assert (= (and b!66087 (not res!54780)) b!66101))

(assert (= (and b!66101 (not res!54787)) b!66088))

(assert (= (and b!66088 (not res!54792)) b!66103))

(assert (= (and b!66103 (not res!54797)) b!66091))

(assert (= (and b!66091 (not res!54794)) b!66095))

(assert (= (and b!66095 (not res!54790)) b!66100))

(assert (= (and b!66100 (not res!54789)) b!66090))

(assert (= (and b!66090 (not res!54784)) b!66085))

(assert (= (and b!66085 (not res!54795)) b!66084))

(assert (= start!12880 b!66102))

(declare-fun m!104989 () Bool)

(assert (=> b!66093 m!104989))

(declare-fun m!104991 () Bool)

(assert (=> b!66093 m!104991))

(declare-fun m!104993 () Bool)

(assert (=> b!66093 m!104993))

(assert (=> b!66093 m!104989))

(declare-fun m!104995 () Bool)

(assert (=> b!66093 m!104995))

(declare-fun m!104997 () Bool)

(assert (=> b!66093 m!104997))

(declare-fun m!104999 () Bool)

(assert (=> b!66089 m!104999))

(declare-fun m!105001 () Bool)

(assert (=> b!66089 m!105001))

(declare-fun m!105003 () Bool)

(assert (=> b!66089 m!105003))

(declare-fun m!105005 () Bool)

(assert (=> b!66092 m!105005))

(declare-fun m!105007 () Bool)

(assert (=> b!66096 m!105007))

(declare-fun m!105009 () Bool)

(assert (=> b!66100 m!105009))

(declare-fun m!105011 () Bool)

(assert (=> b!66102 m!105011))

(declare-fun m!105013 () Bool)

(assert (=> b!66088 m!105013))

(declare-fun m!105015 () Bool)

(assert (=> b!66099 m!105015))

(declare-fun m!105017 () Bool)

(assert (=> b!66103 m!105017))

(declare-fun m!105019 () Bool)

(assert (=> b!66103 m!105019))

(declare-fun m!105021 () Bool)

(assert (=> b!66103 m!105021))

(declare-fun m!105023 () Bool)

(assert (=> b!66103 m!105023))

(declare-fun m!105025 () Bool)

(assert (=> b!66103 m!105025))

(declare-fun m!105027 () Bool)

(assert (=> b!66103 m!105027))

(declare-fun m!105029 () Bool)

(assert (=> b!66103 m!105029))

(declare-fun m!105031 () Bool)

(assert (=> b!66103 m!105031))

(declare-fun m!105033 () Bool)

(assert (=> b!66095 m!105033))

(declare-fun m!105035 () Bool)

(assert (=> b!66097 m!105035))

(declare-fun m!105037 () Bool)

(assert (=> b!66094 m!105037))

(declare-fun m!105039 () Bool)

(assert (=> b!66094 m!105039))

(declare-fun m!105041 () Bool)

(assert (=> b!66094 m!105041))

(declare-fun m!105043 () Bool)

(assert (=> b!66094 m!105043))

(declare-fun m!105045 () Bool)

(assert (=> b!66094 m!105045))

(declare-fun m!105047 () Bool)

(assert (=> b!66094 m!105047))

(declare-fun m!105049 () Bool)

(assert (=> b!66094 m!105049))

(declare-fun m!105051 () Bool)

(assert (=> b!66090 m!105051))

(declare-fun m!105053 () Bool)

(assert (=> b!66098 m!105053))

(assert (=> b!66098 m!105053))

(declare-fun m!105055 () Bool)

(assert (=> b!66098 m!105055))

(declare-fun m!105057 () Bool)

(assert (=> b!66098 m!105057))

(assert (=> b!66098 m!105057))

(declare-fun m!105059 () Bool)

(assert (=> b!66098 m!105059))

(declare-fun m!105061 () Bool)

(assert (=> b!66084 m!105061))

(declare-fun m!105063 () Bool)

(assert (=> b!66084 m!105063))

(declare-fun m!105065 () Bool)

(assert (=> start!12880 m!105065))

(declare-fun m!105067 () Bool)

(assert (=> start!12880 m!105067))

(declare-fun m!105069 () Bool)

(assert (=> b!66101 m!105069))

(declare-fun m!105071 () Bool)

(assert (=> b!66091 m!105071))

(push 1)

(assert (not b!66093))

(assert (not b!66102))

(assert (not b!66103))

(assert (not b!66094))

(assert (not start!12880))

(assert (not b!66098))

(assert (not b!66097))

(assert (not b!66088))

(assert (not b!66091))

(assert (not b!66095))

(assert (not b!66092))

(assert (not b!66100))

(assert (not b!66090))

(assert (not b!66089))

(assert (not b!66084))

(assert (not b!66101))

(assert (not b!66099))

(assert (not b!66096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

