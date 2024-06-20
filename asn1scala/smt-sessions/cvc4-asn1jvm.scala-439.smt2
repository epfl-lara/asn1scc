; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11830 () Bool)

(assert start!11830)

(declare-fun b!59034 () Bool)

(declare-fun res!49089 () Bool)

(declare-fun e!39230 () Bool)

(assert (=> b!59034 (=> res!49089 e!39230)))

(declare-datatypes ((array!2687 0))(
  ( (array!2688 (arr!1783 (Array (_ BitVec 32) (_ BitVec 8))) (size!1219 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2126 0))(
  ( (BitStream!2127 (buf!1600 array!2687) (currentByte!3218 (_ BitVec 32)) (currentBit!3213 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4061 0))(
  ( (Unit!4062) )
))
(declare-datatypes ((tuple2!5374 0))(
  ( (tuple2!5375 (_1!2798 Unit!4061) (_2!2798 BitStream!2126)) )
))
(declare-fun lt!92860 () tuple2!5374)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59034 (= res!49089 (not (invariant!0 (currentBit!3213 (_2!2798 lt!92860)) (currentByte!3218 (_2!2798 lt!92860)) (size!1219 (buf!1600 (_2!2798 lt!92860))))))))

(declare-fun b!59035 () Bool)

(declare-fun res!49101 () Bool)

(declare-fun e!39235 () Bool)

(assert (=> b!59035 (=> res!49101 e!39235)))

(declare-fun lt!92850 () tuple2!5374)

(assert (=> b!59035 (= res!49101 (not (invariant!0 (currentBit!3213 (_2!2798 lt!92850)) (currentByte!3218 (_2!2798 lt!92850)) (size!1219 (buf!1600 (_2!2798 lt!92850))))))))

(declare-fun b!59036 () Bool)

(declare-fun e!39229 () Bool)

(declare-fun e!39228 () Bool)

(assert (=> b!59036 (= e!39229 e!39228)))

(declare-fun res!49091 () Bool)

(assert (=> b!59036 (=> res!49091 e!39228)))

(declare-fun isPrefixOf!0 (BitStream!2126 BitStream!2126) Bool)

(assert (=> b!59036 (= res!49091 (not (isPrefixOf!0 (_2!2798 lt!92860) (_2!2798 lt!92850))))))

(declare-fun thiss!1379 () BitStream!2126)

(assert (=> b!59036 (isPrefixOf!0 thiss!1379 (_2!2798 lt!92850))))

(declare-fun lt!92849 () Unit!4061)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2126 BitStream!2126 BitStream!2126) Unit!4061)

(assert (=> b!59036 (= lt!92849 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2798 lt!92860) (_2!2798 lt!92850)))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun srcBuffer!2 () array!2687)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2126 array!2687 (_ BitVec 64) (_ BitVec 64)) tuple2!5374)

(assert (=> b!59036 (= lt!92850 (appendBitsMSBFirstLoop!0 (_2!2798 lt!92860) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39226 () Bool)

(assert (=> b!59036 e!39226))

(declare-fun res!49094 () Bool)

(assert (=> b!59036 (=> (not res!49094) (not e!39226))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59036 (= res!49094 (validate_offset_bits!1 ((_ sign_extend 32) (size!1219 (buf!1600 (_2!2798 lt!92860)))) ((_ sign_extend 32) (currentByte!3218 thiss!1379)) ((_ sign_extend 32) (currentBit!3213 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92854 () Unit!4061)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2126 array!2687 (_ BitVec 64)) Unit!4061)

(assert (=> b!59036 (= lt!92854 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1600 (_2!2798 lt!92860)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5376 0))(
  ( (tuple2!5377 (_1!2799 BitStream!2126) (_2!2799 BitStream!2126)) )
))
(declare-fun lt!92851 () tuple2!5376)

(declare-fun reader!0 (BitStream!2126 BitStream!2126) tuple2!5376)

(assert (=> b!59036 (= lt!92851 (reader!0 thiss!1379 (_2!2798 lt!92860)))))

(declare-fun b!59037 () Bool)

(declare-fun e!39236 () Bool)

(assert (=> b!59037 (= e!39236 e!39229)))

(declare-fun res!49095 () Bool)

(assert (=> b!59037 (=> res!49095 e!39229)))

(assert (=> b!59037 (= res!49095 (not (isPrefixOf!0 thiss!1379 (_2!2798 lt!92860))))))

(assert (=> b!59037 (validate_offset_bits!1 ((_ sign_extend 32) (size!1219 (buf!1600 (_2!2798 lt!92860)))) ((_ sign_extend 32) (currentByte!3218 (_2!2798 lt!92860))) ((_ sign_extend 32) (currentBit!3213 (_2!2798 lt!92860))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92858 () Unit!4061)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2126 BitStream!2126 (_ BitVec 64) (_ BitVec 64)) Unit!4061)

(assert (=> b!59037 (= lt!92858 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2798 lt!92860) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2126 (_ BitVec 8) (_ BitVec 32)) tuple2!5374)

(assert (=> b!59037 (= lt!92860 (appendBitFromByte!0 thiss!1379 (select (arr!1783 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59038 () Bool)

(declare-datatypes ((List!638 0))(
  ( (Nil!635) (Cons!634 (h!753 Bool) (t!1388 List!638)) )
))
(declare-fun head!457 (List!638) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2126 array!2687 (_ BitVec 64) (_ BitVec 64)) List!638)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2126 BitStream!2126 (_ BitVec 64)) List!638)

(assert (=> b!59038 (= e!39226 (= (head!457 (byteArrayBitContentToList!0 (_2!2798 lt!92860) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!457 (bitStreamReadBitsIntoList!0 (_2!2798 lt!92860) (_1!2799 lt!92851) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun e!39231 () Bool)

(declare-fun b!59039 () Bool)

(declare-fun lt!92852 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59039 (= e!39231 (= lt!92852 (bvsub (bvsub (bvadd (bitIndex!0 (size!1219 (buf!1600 (_2!2798 lt!92860))) (currentByte!3218 (_2!2798 lt!92860)) (currentBit!3213 (_2!2798 lt!92860))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59040 () Bool)

(declare-fun res!49093 () Bool)

(declare-fun e!39234 () Bool)

(assert (=> b!59040 (=> (not res!49093) (not e!39234))))

(assert (=> b!59040 (= res!49093 (validate_offset_bits!1 ((_ sign_extend 32) (size!1219 (buf!1600 thiss!1379))) ((_ sign_extend 32) (currentByte!3218 thiss!1379)) ((_ sign_extend 32) (currentBit!3213 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59041 () Bool)

(assert (=> b!59041 (= e!39234 (not e!39236))))

(declare-fun res!49092 () Bool)

(assert (=> b!59041 (=> res!49092 e!39236)))

(assert (=> b!59041 (= res!49092 (bvsge i!635 to!314))))

(assert (=> b!59041 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92857 () Unit!4061)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2126) Unit!4061)

(assert (=> b!59041 (= lt!92857 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92855 () (_ BitVec 64))

(assert (=> b!59041 (= lt!92855 (bitIndex!0 (size!1219 (buf!1600 thiss!1379)) (currentByte!3218 thiss!1379) (currentBit!3213 thiss!1379)))))

(declare-fun b!59042 () Bool)

(declare-fun e!39227 () Bool)

(declare-fun array_inv!1122 (array!2687) Bool)

(assert (=> b!59042 (= e!39227 (array_inv!1122 (buf!1600 thiss!1379)))))

(declare-fun b!59043 () Bool)

(assert (=> b!59043 (= e!39235 e!39230)))

(declare-fun res!49090 () Bool)

(assert (=> b!59043 (=> res!49090 e!39230)))

(assert (=> b!59043 (= res!49090 (not (= (size!1219 (buf!1600 (_2!2798 lt!92860))) (size!1219 (buf!1600 (_2!2798 lt!92850))))))))

(assert (=> b!59043 e!39231))

(declare-fun res!49099 () Bool)

(assert (=> b!59043 (=> (not res!49099) (not e!39231))))

(assert (=> b!59043 (= res!49099 (= (size!1219 (buf!1600 (_2!2798 lt!92850))) (size!1219 (buf!1600 thiss!1379))))))

(declare-fun b!59045 () Bool)

(declare-fun res!49100 () Bool)

(assert (=> b!59045 (=> res!49100 e!39235)))

(assert (=> b!59045 (= res!49100 (not (= (size!1219 (buf!1600 thiss!1379)) (size!1219 (buf!1600 (_2!2798 lt!92850))))))))

(declare-fun b!59046 () Bool)

(assert (=> b!59046 (= e!39228 e!39235)))

(declare-fun res!49098 () Bool)

(assert (=> b!59046 (=> res!49098 e!39235)))

(assert (=> b!59046 (= res!49098 (not (= lt!92852 (bvsub (bvadd lt!92855 to!314) i!635))))))

(assert (=> b!59046 (= lt!92852 (bitIndex!0 (size!1219 (buf!1600 (_2!2798 lt!92850))) (currentByte!3218 (_2!2798 lt!92850)) (currentBit!3213 (_2!2798 lt!92850))))))

(declare-fun b!59047 () Bool)

(declare-fun res!49096 () Bool)

(assert (=> b!59047 (=> res!49096 e!39230)))

(assert (=> b!59047 (= res!49096 (not (invariant!0 (currentBit!3213 (_2!2798 lt!92860)) (currentByte!3218 (_2!2798 lt!92860)) (size!1219 (buf!1600 (_2!2798 lt!92850))))))))

(declare-fun b!59044 () Bool)

(assert (=> b!59044 (= e!39230 true)))

(declare-fun lt!92856 () tuple2!5376)

(assert (=> b!59044 (= lt!92856 (reader!0 (_2!2798 lt!92860) (_2!2798 lt!92850)))))

(assert (=> b!59044 (validate_offset_bits!1 ((_ sign_extend 32) (size!1219 (buf!1600 (_2!2798 lt!92850)))) ((_ sign_extend 32) (currentByte!3218 thiss!1379)) ((_ sign_extend 32) (currentBit!3213 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92853 () Unit!4061)

(assert (=> b!59044 (= lt!92853 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1600 (_2!2798 lt!92850)) (bvsub to!314 i!635)))))

(declare-fun lt!92859 () tuple2!5376)

(assert (=> b!59044 (= lt!92859 (reader!0 thiss!1379 (_2!2798 lt!92850)))))

(declare-fun res!49097 () Bool)

(assert (=> start!11830 (=> (not res!49097) (not e!39234))))

(assert (=> start!11830 (= res!49097 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1219 srcBuffer!2))))))))

(assert (=> start!11830 e!39234))

(assert (=> start!11830 true))

(assert (=> start!11830 (array_inv!1122 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2126) Bool)

(assert (=> start!11830 (and (inv!12 thiss!1379) e!39227)))

(assert (= (and start!11830 res!49097) b!59040))

(assert (= (and b!59040 res!49093) b!59041))

(assert (= (and b!59041 (not res!49092)) b!59037))

(assert (= (and b!59037 (not res!49095)) b!59036))

(assert (= (and b!59036 res!49094) b!59038))

(assert (= (and b!59036 (not res!49091)) b!59046))

(assert (= (and b!59046 (not res!49098)) b!59035))

(assert (= (and b!59035 (not res!49101)) b!59045))

(assert (= (and b!59045 (not res!49100)) b!59043))

(assert (= (and b!59043 res!49099) b!59039))

(assert (= (and b!59043 (not res!49090)) b!59034))

(assert (= (and b!59034 (not res!49089)) b!59047))

(assert (= (and b!59047 (not res!49096)) b!59044))

(assert (= start!11830 b!59042))

(declare-fun m!92961 () Bool)

(assert (=> b!59042 m!92961))

(declare-fun m!92963 () Bool)

(assert (=> b!59040 m!92963))

(declare-fun m!92965 () Bool)

(assert (=> b!59046 m!92965))

(declare-fun m!92967 () Bool)

(assert (=> b!59039 m!92967))

(declare-fun m!92969 () Bool)

(assert (=> b!59038 m!92969))

(assert (=> b!59038 m!92969))

(declare-fun m!92971 () Bool)

(assert (=> b!59038 m!92971))

(declare-fun m!92973 () Bool)

(assert (=> b!59038 m!92973))

(assert (=> b!59038 m!92973))

(declare-fun m!92975 () Bool)

(assert (=> b!59038 m!92975))

(declare-fun m!92977 () Bool)

(assert (=> b!59036 m!92977))

(declare-fun m!92979 () Bool)

(assert (=> b!59036 m!92979))

(declare-fun m!92981 () Bool)

(assert (=> b!59036 m!92981))

(declare-fun m!92983 () Bool)

(assert (=> b!59036 m!92983))

(declare-fun m!92985 () Bool)

(assert (=> b!59036 m!92985))

(declare-fun m!92987 () Bool)

(assert (=> b!59036 m!92987))

(declare-fun m!92989 () Bool)

(assert (=> b!59036 m!92989))

(declare-fun m!92991 () Bool)

(assert (=> b!59047 m!92991))

(declare-fun m!92993 () Bool)

(assert (=> b!59041 m!92993))

(declare-fun m!92995 () Bool)

(assert (=> b!59041 m!92995))

(declare-fun m!92997 () Bool)

(assert (=> b!59041 m!92997))

(declare-fun m!92999 () Bool)

(assert (=> start!11830 m!92999))

(declare-fun m!93001 () Bool)

(assert (=> start!11830 m!93001))

(declare-fun m!93003 () Bool)

(assert (=> b!59034 m!93003))

(declare-fun m!93005 () Bool)

(assert (=> b!59037 m!93005))

(declare-fun m!93007 () Bool)

(assert (=> b!59037 m!93007))

(declare-fun m!93009 () Bool)

(assert (=> b!59037 m!93009))

(declare-fun m!93011 () Bool)

(assert (=> b!59037 m!93011))

(assert (=> b!59037 m!93009))

(declare-fun m!93013 () Bool)

(assert (=> b!59037 m!93013))

(declare-fun m!93015 () Bool)

(assert (=> b!59044 m!93015))

(declare-fun m!93017 () Bool)

(assert (=> b!59044 m!93017))

(declare-fun m!93019 () Bool)

(assert (=> b!59044 m!93019))

(declare-fun m!93021 () Bool)

(assert (=> b!59044 m!93021))

(declare-fun m!93023 () Bool)

(assert (=> b!59035 m!93023))

(push 1)

(assert (not start!11830))

(assert (not b!59034))

(assert (not b!59037))

(assert (not b!59042))

(assert (not b!59047))

(assert (not b!59039))

(assert (not b!59041))

(assert (not b!59036))

(assert (not b!59046))

(assert (not b!59038))

(assert (not b!59044))

(assert (not b!59035))

(assert (not b!59040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

