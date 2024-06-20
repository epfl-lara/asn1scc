; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8844 () Bool)

(assert start!8844)

(declare-fun b!43931 () Bool)

(declare-fun res!37247 () Bool)

(declare-fun e!29303 () Bool)

(assert (=> b!43931 (=> res!37247 e!29303)))

(declare-datatypes ((array!2228 0))(
  ( (array!2229 (arr!1513 (Array (_ BitVec 32) (_ BitVec 8))) (size!1005 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1754 0))(
  ( (BitStream!1755 (buf!1345 array!2228) (currentByte!2820 (_ BitVec 32)) (currentBit!2815 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3128 0))(
  ( (Unit!3129) )
))
(declare-datatypes ((tuple2!4306 0))(
  ( (tuple2!4307 (_1!2246 Unit!3128) (_2!2246 BitStream!1754)) )
))
(declare-fun lt!66815 () tuple2!4306)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43931 (= res!37247 (not (invariant!0 (currentBit!2815 (_2!2246 lt!66815)) (currentByte!2820 (_2!2246 lt!66815)) (size!1005 (buf!1345 (_2!2246 lt!66815))))))))

(declare-fun b!43932 () Bool)

(declare-fun e!29306 () Bool)

(assert (=> b!43932 (= e!29306 e!29303)))

(declare-fun res!37248 () Bool)

(assert (=> b!43932 (=> res!37248 e!29303)))

(declare-fun lt!66816 () tuple2!4306)

(declare-fun isPrefixOf!0 (BitStream!1754 BitStream!1754) Bool)

(assert (=> b!43932 (= res!37248 (not (isPrefixOf!0 (_2!2246 lt!66816) (_2!2246 lt!66815))))))

(declare-fun thiss!1379 () BitStream!1754)

(assert (=> b!43932 (isPrefixOf!0 thiss!1379 (_2!2246 lt!66815))))

(declare-fun lt!66810 () Unit!3128)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1754 BitStream!1754 BitStream!1754) Unit!3128)

(assert (=> b!43932 (= lt!66810 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2246 lt!66816) (_2!2246 lt!66815)))))

(declare-fun srcBuffer!2 () array!2228)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1754 array!2228 (_ BitVec 64) (_ BitVec 64)) tuple2!4306)

(assert (=> b!43932 (= lt!66815 (appendBitsMSBFirstLoop!0 (_2!2246 lt!66816) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!29305 () Bool)

(assert (=> b!43932 e!29305))

(declare-fun res!37251 () Bool)

(assert (=> b!43932 (=> (not res!37251) (not e!29305))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43932 (= res!37251 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66811 () Unit!3128)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1754 array!2228 (_ BitVec 64)) Unit!3128)

(assert (=> b!43932 (= lt!66811 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1345 (_2!2246 lt!66816)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4308 0))(
  ( (tuple2!4309 (_1!2247 BitStream!1754) (_2!2247 BitStream!1754)) )
))
(declare-fun lt!66814 () tuple2!4308)

(declare-fun reader!0 (BitStream!1754 BitStream!1754) tuple2!4308)

(assert (=> b!43932 (= lt!66814 (reader!0 thiss!1379 (_2!2246 lt!66816)))))

(declare-fun b!43933 () Bool)

(declare-fun e!29299 () Bool)

(assert (=> b!43933 (= e!29299 e!29306)))

(declare-fun res!37250 () Bool)

(assert (=> b!43933 (=> res!37250 e!29306)))

(assert (=> b!43933 (= res!37250 (not (isPrefixOf!0 thiss!1379 (_2!2246 lt!66816))))))

(assert (=> b!43933 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66813 () Unit!3128)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1754 BitStream!1754 (_ BitVec 64) (_ BitVec 64)) Unit!3128)

(assert (=> b!43933 (= lt!66813 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2246 lt!66816) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1754 (_ BitVec 8) (_ BitVec 32)) tuple2!4306)

(assert (=> b!43933 (= lt!66816 (appendBitFromByte!0 thiss!1379 (select (arr!1513 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43934 () Bool)

(declare-fun e!29304 () Bool)

(declare-fun array_inv!930 (array!2228) Bool)

(assert (=> b!43934 (= e!29304 (array_inv!930 (buf!1345 thiss!1379)))))

(declare-fun b!43935 () Bool)

(declare-fun res!37246 () Bool)

(declare-fun e!29301 () Bool)

(assert (=> b!43935 (=> (not res!37246) (not e!29301))))

(assert (=> b!43935 (= res!37246 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 thiss!1379))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43936 () Bool)

(assert (=> b!43936 (= e!29301 (not e!29299))))

(declare-fun res!37244 () Bool)

(assert (=> b!43936 (=> res!37244 e!29299)))

(assert (=> b!43936 (= res!37244 (bvsge i!635 to!314))))

(assert (=> b!43936 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66817 () Unit!3128)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1754) Unit!3128)

(assert (=> b!43936 (= lt!66817 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!66812 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43936 (= lt!66812 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)))))

(declare-fun b!43937 () Bool)

(declare-datatypes ((List!518 0))(
  ( (Nil!515) (Cons!514 (h!633 Bool) (t!1268 List!518)) )
))
(declare-fun head!337 (List!518) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1754 array!2228 (_ BitVec 64) (_ BitVec 64)) List!518)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1754 BitStream!1754 (_ BitVec 64)) List!518)

(assert (=> b!43937 (= e!29305 (= (head!337 (byteArrayBitContentToList!0 (_2!2246 lt!66816) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!337 (bitStreamReadBitsIntoList!0 (_2!2246 lt!66816) (_1!2247 lt!66814) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!37245 () Bool)

(assert (=> start!8844 (=> (not res!37245) (not e!29301))))

(assert (=> start!8844 (= res!37245 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1005 srcBuffer!2))))))))

(assert (=> start!8844 e!29301))

(assert (=> start!8844 true))

(assert (=> start!8844 (array_inv!930 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1754) Bool)

(assert (=> start!8844 (and (inv!12 thiss!1379) e!29304)))

(declare-fun b!43938 () Bool)

(assert (=> b!43938 (= e!29303 (= (size!1005 (buf!1345 thiss!1379)) (size!1005 (buf!1345 (_2!2246 lt!66815)))))))

(declare-fun b!43939 () Bool)

(declare-fun res!37249 () Bool)

(assert (=> b!43939 (=> res!37249 e!29303)))

(assert (=> b!43939 (= res!37249 (not (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66815))) (currentByte!2820 (_2!2246 lt!66815)) (currentBit!2815 (_2!2246 lt!66815))) (bvsub (bvadd lt!66812 to!314) i!635))))))

(assert (= (and start!8844 res!37245) b!43935))

(assert (= (and b!43935 res!37246) b!43936))

(assert (= (and b!43936 (not res!37244)) b!43933))

(assert (= (and b!43933 (not res!37250)) b!43932))

(assert (= (and b!43932 res!37251) b!43937))

(assert (= (and b!43932 (not res!37248)) b!43939))

(assert (= (and b!43939 (not res!37249)) b!43931))

(assert (= (and b!43931 (not res!37247)) b!43938))

(assert (= start!8844 b!43934))

(declare-fun m!66923 () Bool)

(assert (=> b!43933 m!66923))

(declare-fun m!66925 () Bool)

(assert (=> b!43933 m!66925))

(declare-fun m!66927 () Bool)

(assert (=> b!43933 m!66927))

(assert (=> b!43933 m!66923))

(declare-fun m!66929 () Bool)

(assert (=> b!43933 m!66929))

(declare-fun m!66931 () Bool)

(assert (=> b!43933 m!66931))

(declare-fun m!66933 () Bool)

(assert (=> start!8844 m!66933))

(declare-fun m!66935 () Bool)

(assert (=> start!8844 m!66935))

(declare-fun m!66937 () Bool)

(assert (=> b!43931 m!66937))

(declare-fun m!66939 () Bool)

(assert (=> b!43934 m!66939))

(declare-fun m!66941 () Bool)

(assert (=> b!43935 m!66941))

(declare-fun m!66943 () Bool)

(assert (=> b!43939 m!66943))

(declare-fun m!66945 () Bool)

(assert (=> b!43937 m!66945))

(assert (=> b!43937 m!66945))

(declare-fun m!66947 () Bool)

(assert (=> b!43937 m!66947))

(declare-fun m!66949 () Bool)

(assert (=> b!43937 m!66949))

(assert (=> b!43937 m!66949))

(declare-fun m!66951 () Bool)

(assert (=> b!43937 m!66951))

(declare-fun m!66953 () Bool)

(assert (=> b!43932 m!66953))

(declare-fun m!66955 () Bool)

(assert (=> b!43932 m!66955))

(declare-fun m!66957 () Bool)

(assert (=> b!43932 m!66957))

(declare-fun m!66959 () Bool)

(assert (=> b!43932 m!66959))

(declare-fun m!66961 () Bool)

(assert (=> b!43932 m!66961))

(declare-fun m!66963 () Bool)

(assert (=> b!43932 m!66963))

(declare-fun m!66965 () Bool)

(assert (=> b!43932 m!66965))

(declare-fun m!66967 () Bool)

(assert (=> b!43936 m!66967))

(declare-fun m!66969 () Bool)

(assert (=> b!43936 m!66969))

(declare-fun m!66971 () Bool)

(assert (=> b!43936 m!66971))

(push 1)

(assert (not b!43936))

(assert (not b!43935))

(assert (not b!43933))

(assert (not b!43939))

(assert (not b!43934))

(assert (not start!8844))

(assert (not b!43931))

(assert (not b!43937))

(assert (not b!43932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12776 () Bool)

(declare-fun e!29335 () Bool)

(assert (=> d!12776 e!29335))

(declare-fun res!37283 () Bool)

(assert (=> d!12776 (=> (not res!37283) (not e!29335))))

(declare-fun lt!66866 () (_ BitVec 64))

(declare-fun lt!66865 () (_ BitVec 64))

(declare-fun lt!66868 () (_ BitVec 64))

(assert (=> d!12776 (= res!37283 (= lt!66865 (bvsub lt!66868 lt!66866)))))

(assert (=> d!12776 (or (= (bvand lt!66868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66866 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66868 lt!66866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12776 (= lt!66866 (remainingBits!0 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66815)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66815))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66815)))))))

(declare-fun lt!66864 () (_ BitVec 64))

(declare-fun lt!66863 () (_ BitVec 64))

(assert (=> d!12776 (= lt!66868 (bvmul lt!66864 lt!66863))))

(assert (=> d!12776 (or (= lt!66864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66863 (bvsdiv (bvmul lt!66864 lt!66863) lt!66864)))))

(assert (=> d!12776 (= lt!66863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12776 (= lt!66864 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66815)))))))

(assert (=> d!12776 (= lt!66865 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66815)))))))

(assert (=> d!12776 (invariant!0 (currentBit!2815 (_2!2246 lt!66815)) (currentByte!2820 (_2!2246 lt!66815)) (size!1005 (buf!1345 (_2!2246 lt!66815))))))

(assert (=> d!12776 (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66815))) (currentByte!2820 (_2!2246 lt!66815)) (currentBit!2815 (_2!2246 lt!66815))) lt!66865)))

(declare-fun b!43989 () Bool)

(declare-fun res!37284 () Bool)

(assert (=> b!43989 (=> (not res!37284) (not e!29335))))

(assert (=> b!43989 (= res!37284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66865))))

(declare-fun b!43990 () Bool)

(declare-fun lt!66867 () (_ BitVec 64))

(assert (=> b!43990 (= e!29335 (bvsle lt!66865 (bvmul lt!66867 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43990 (or (= lt!66867 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66867 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66867)))))

(assert (=> b!43990 (= lt!66867 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66815)))))))

(assert (= (and d!12776 res!37283) b!43989))

(assert (= (and b!43989 res!37284) b!43990))

(declare-fun m!67009 () Bool)

(assert (=> d!12776 m!67009))

(assert (=> d!12776 m!66937))

(assert (=> b!43939 d!12776))

(declare-fun d!12790 () Bool)

(assert (=> d!12790 (= (array_inv!930 (buf!1345 thiss!1379)) (bvsge (size!1005 (buf!1345 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43934 d!12790))

(declare-fun d!12792 () Bool)

(declare-fun res!37291 () Bool)

(declare-fun e!29341 () Bool)

(assert (=> d!12792 (=> (not res!37291) (not e!29341))))

(assert (=> d!12792 (= res!37291 (= (size!1005 (buf!1345 thiss!1379)) (size!1005 (buf!1345 thiss!1379))))))

(assert (=> d!12792 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29341)))

(declare-fun b!43997 () Bool)

(declare-fun res!37292 () Bool)

(assert (=> b!43997 (=> (not res!37292) (not e!29341))))

(assert (=> b!43997 (= res!37292 (bvsle (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)) (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379))))))

(declare-fun b!43998 () Bool)

(declare-fun e!29340 () Bool)

(assert (=> b!43998 (= e!29341 e!29340)))

(declare-fun res!37293 () Bool)

(assert (=> b!43998 (=> res!37293 e!29340)))

(assert (=> b!43998 (= res!37293 (= (size!1005 (buf!1345 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43999 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2228 array!2228 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43999 (= e!29340 (arrayBitRangesEq!0 (buf!1345 thiss!1379) (buf!1345 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379))))))

(assert (= (and d!12792 res!37291) b!43997))

(assert (= (and b!43997 res!37292) b!43998))

(assert (= (and b!43998 (not res!37293)) b!43999))

(assert (=> b!43997 m!66971))

(assert (=> b!43997 m!66971))

(assert (=> b!43999 m!66971))

(assert (=> b!43999 m!66971))

(declare-fun m!67011 () Bool)

(assert (=> b!43999 m!67011))

(assert (=> b!43936 d!12792))

(declare-fun d!12794 () Bool)

(assert (=> d!12794 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66871 () Unit!3128)

(declare-fun choose!11 (BitStream!1754) Unit!3128)

(assert (=> d!12794 (= lt!66871 (choose!11 thiss!1379))))

(assert (=> d!12794 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!66871)))

(declare-fun bs!3422 () Bool)

(assert (= bs!3422 d!12794))

(assert (=> bs!3422 m!66967))

(declare-fun m!67013 () Bool)

(assert (=> bs!3422 m!67013))

(assert (=> b!43936 d!12794))

(declare-fun d!12796 () Bool)

(declare-fun e!29342 () Bool)

(assert (=> d!12796 e!29342))

(declare-fun res!37294 () Bool)

(assert (=> d!12796 (=> (not res!37294) (not e!29342))))

(declare-fun lt!66877 () (_ BitVec 64))

(declare-fun lt!66874 () (_ BitVec 64))

(declare-fun lt!66875 () (_ BitVec 64))

(assert (=> d!12796 (= res!37294 (= lt!66874 (bvsub lt!66877 lt!66875)))))

(assert (=> d!12796 (or (= (bvand lt!66877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66875 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66877 lt!66875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12796 (= lt!66875 (remainingBits!0 ((_ sign_extend 32) (size!1005 (buf!1345 thiss!1379))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379))))))

(declare-fun lt!66873 () (_ BitVec 64))

(declare-fun lt!66872 () (_ BitVec 64))

(assert (=> d!12796 (= lt!66877 (bvmul lt!66873 lt!66872))))

(assert (=> d!12796 (or (= lt!66873 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66872 (bvsdiv (bvmul lt!66873 lt!66872) lt!66873)))))

(assert (=> d!12796 (= lt!66872 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12796 (= lt!66873 ((_ sign_extend 32) (size!1005 (buf!1345 thiss!1379))))))

(assert (=> d!12796 (= lt!66874 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2820 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2815 thiss!1379))))))

(assert (=> d!12796 (invariant!0 (currentBit!2815 thiss!1379) (currentByte!2820 thiss!1379) (size!1005 (buf!1345 thiss!1379)))))

(assert (=> d!12796 (= (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)) lt!66874)))

(declare-fun b!44000 () Bool)

(declare-fun res!37295 () Bool)

(assert (=> b!44000 (=> (not res!37295) (not e!29342))))

(assert (=> b!44000 (= res!37295 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66874))))

(declare-fun b!44001 () Bool)

(declare-fun lt!66876 () (_ BitVec 64))

(assert (=> b!44001 (= e!29342 (bvsle lt!66874 (bvmul lt!66876 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!44001 (or (= lt!66876 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66876 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66876)))))

(assert (=> b!44001 (= lt!66876 ((_ sign_extend 32) (size!1005 (buf!1345 thiss!1379))))))

(assert (= (and d!12796 res!37294) b!44000))

(assert (= (and b!44000 res!37295) b!44001))

(declare-fun m!67015 () Bool)

(assert (=> d!12796 m!67015))

(declare-fun m!67017 () Bool)

(assert (=> d!12796 m!67017))

(assert (=> b!43936 d!12796))

(declare-fun d!12798 () Bool)

(assert (=> d!12798 (= (array_inv!930 srcBuffer!2) (bvsge (size!1005 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8844 d!12798))

(declare-fun d!12800 () Bool)

(assert (=> d!12800 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2815 thiss!1379) (currentByte!2820 thiss!1379) (size!1005 (buf!1345 thiss!1379))))))

(declare-fun bs!3423 () Bool)

(assert (= bs!3423 d!12800))

(assert (=> bs!3423 m!67017))

(assert (=> start!8844 d!12800))

(declare-fun d!12802 () Bool)

(assert (=> d!12802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 thiss!1379))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1005 (buf!1345 thiss!1379))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3424 () Bool)

(assert (= bs!3424 d!12802))

(assert (=> bs!3424 m!67015))

(assert (=> b!43935 d!12802))

(declare-fun d!12804 () Bool)

(assert (=> d!12804 (= (head!337 (byteArrayBitContentToList!0 (_2!2246 lt!66816) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!633 (byteArrayBitContentToList!0 (_2!2246 lt!66816) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43937 d!12804))

(declare-fun d!12806 () Bool)

(declare-fun c!2925 () Bool)

(assert (=> d!12806 (= c!2925 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29345 () List!518)

(assert (=> d!12806 (= (byteArrayBitContentToList!0 (_2!2246 lt!66816) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29345)))

(declare-fun b!44006 () Bool)

(assert (=> b!44006 (= e!29345 Nil!515)))

(declare-fun b!44007 () Bool)

(assert (=> b!44007 (= e!29345 (Cons!514 (not (= (bvand ((_ sign_extend 24) (select (arr!1513 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2246 lt!66816) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12806 c!2925) b!44006))

(assert (= (and d!12806 (not c!2925)) b!44007))

(assert (=> b!44007 m!66923))

(declare-fun m!67019 () Bool)

(assert (=> b!44007 m!67019))

(declare-fun m!67021 () Bool)

(assert (=> b!44007 m!67021))

(assert (=> b!43937 d!12806))

(declare-fun d!12808 () Bool)

(assert (=> d!12808 (= (head!337 (bitStreamReadBitsIntoList!0 (_2!2246 lt!66816) (_1!2247 lt!66814) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!633 (bitStreamReadBitsIntoList!0 (_2!2246 lt!66816) (_1!2247 lt!66814) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43937 d!12808))

(declare-fun b!44016 () Bool)

(declare-datatypes ((tuple2!4318 0))(
  ( (tuple2!4319 (_1!2252 List!518) (_2!2252 BitStream!1754)) )
))
(declare-fun e!29351 () tuple2!4318)

(assert (=> b!44016 (= e!29351 (tuple2!4319 Nil!515 (_1!2247 lt!66814)))))

(declare-fun b!44018 () Bool)

(declare-fun e!29350 () Bool)

(declare-fun lt!66886 () List!518)

(declare-fun isEmpty!123 (List!518) Bool)

(assert (=> b!44018 (= e!29350 (isEmpty!123 lt!66886))))

(declare-fun b!44019 () Bool)

(declare-fun length!221 (List!518) Int)

(assert (=> b!44019 (= e!29350 (> (length!221 lt!66886) 0))))

(declare-fun b!44017 () Bool)

(declare-datatypes ((tuple2!4320 0))(
  ( (tuple2!4321 (_1!2253 Bool) (_2!2253 BitStream!1754)) )
))
(declare-fun lt!66884 () tuple2!4320)

(declare-fun lt!66885 () (_ BitVec 64))

(assert (=> b!44017 (= e!29351 (tuple2!4319 (Cons!514 (_1!2253 lt!66884) (bitStreamReadBitsIntoList!0 (_2!2246 lt!66816) (_2!2253 lt!66884) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!66885))) (_2!2253 lt!66884)))))

(declare-fun readBit!0 (BitStream!1754) tuple2!4320)

(assert (=> b!44017 (= lt!66884 (readBit!0 (_1!2247 lt!66814)))))

(assert (=> b!44017 (= lt!66885 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!12810 () Bool)

(assert (=> d!12810 e!29350))

(declare-fun c!2931 () Bool)

(assert (=> d!12810 (= c!2931 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12810 (= lt!66886 (_1!2252 e!29351))))

(declare-fun c!2930 () Bool)

(assert (=> d!12810 (= c!2930 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12810 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12810 (= (bitStreamReadBitsIntoList!0 (_2!2246 lt!66816) (_1!2247 lt!66814) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66886)))

(assert (= (and d!12810 c!2930) b!44016))

(assert (= (and d!12810 (not c!2930)) b!44017))

(assert (= (and d!12810 c!2931) b!44018))

(assert (= (and d!12810 (not c!2931)) b!44019))

(declare-fun m!67023 () Bool)

(assert (=> b!44018 m!67023))

(declare-fun m!67025 () Bool)

(assert (=> b!44019 m!67025))

(declare-fun m!67027 () Bool)

(assert (=> b!44017 m!67027))

(declare-fun m!67029 () Bool)

(assert (=> b!44017 m!67029))

(assert (=> b!43937 d!12810))

(declare-fun d!12812 () Bool)

(declare-fun res!37296 () Bool)

(declare-fun e!29353 () Bool)

(assert (=> d!12812 (=> (not res!37296) (not e!29353))))

(assert (=> d!12812 (= res!37296 (= (size!1005 (buf!1345 (_2!2246 lt!66816))) (size!1005 (buf!1345 (_2!2246 lt!66815)))))))

(assert (=> d!12812 (= (isPrefixOf!0 (_2!2246 lt!66816) (_2!2246 lt!66815)) e!29353)))

(declare-fun b!44020 () Bool)

(declare-fun res!37297 () Bool)

(assert (=> b!44020 (=> (not res!37297) (not e!29353))))

(assert (=> b!44020 (= res!37297 (bvsle (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816))) (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66815))) (currentByte!2820 (_2!2246 lt!66815)) (currentBit!2815 (_2!2246 lt!66815)))))))

(declare-fun b!44021 () Bool)

(declare-fun e!29352 () Bool)

(assert (=> b!44021 (= e!29353 e!29352)))

(declare-fun res!37298 () Bool)

(assert (=> b!44021 (=> res!37298 e!29352)))

(assert (=> b!44021 (= res!37298 (= (size!1005 (buf!1345 (_2!2246 lt!66816))) #b00000000000000000000000000000000))))

(declare-fun b!44022 () Bool)

(assert (=> b!44022 (= e!29352 (arrayBitRangesEq!0 (buf!1345 (_2!2246 lt!66816)) (buf!1345 (_2!2246 lt!66815)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816)))))))

(assert (= (and d!12812 res!37296) b!44020))

(assert (= (and b!44020 res!37297) b!44021))

(assert (= (and b!44021 (not res!37298)) b!44022))

(declare-fun m!67031 () Bool)

(assert (=> b!44020 m!67031))

(assert (=> b!44020 m!66943))

(assert (=> b!44022 m!67031))

(assert (=> b!44022 m!67031))

(declare-fun m!67033 () Bool)

(assert (=> b!44022 m!67033))

(assert (=> b!43932 d!12812))

(declare-fun d!12814 () Bool)

(assert (=> d!12814 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66889 () Unit!3128)

(declare-fun choose!9 (BitStream!1754 array!2228 (_ BitVec 64) BitStream!1754) Unit!3128)

(assert (=> d!12814 (= lt!66889 (choose!9 thiss!1379 (buf!1345 (_2!2246 lt!66816)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1755 (buf!1345 (_2!2246 lt!66816)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379))))))

(assert (=> d!12814 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1345 (_2!2246 lt!66816)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66889)))

(declare-fun bs!3425 () Bool)

(assert (= bs!3425 d!12814))

(assert (=> bs!3425 m!66959))

(declare-fun m!67035 () Bool)

(assert (=> bs!3425 m!67035))

(assert (=> b!43932 d!12814))

(declare-fun d!12816 () Bool)

(assert (=> d!12816 (isPrefixOf!0 thiss!1379 (_2!2246 lt!66815))))

(declare-fun lt!66892 () Unit!3128)

(declare-fun choose!30 (BitStream!1754 BitStream!1754 BitStream!1754) Unit!3128)

(assert (=> d!12816 (= lt!66892 (choose!30 thiss!1379 (_2!2246 lt!66816) (_2!2246 lt!66815)))))

(assert (=> d!12816 (isPrefixOf!0 thiss!1379 (_2!2246 lt!66816))))

(assert (=> d!12816 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2246 lt!66816) (_2!2246 lt!66815)) lt!66892)))

(declare-fun bs!3426 () Bool)

(assert (= bs!3426 d!12816))

(assert (=> bs!3426 m!66955))

(declare-fun m!67037 () Bool)

(assert (=> bs!3426 m!67037))

(assert (=> bs!3426 m!66931))

(assert (=> b!43932 d!12816))

(declare-fun d!12818 () Bool)

(declare-fun res!37299 () Bool)

(declare-fun e!29355 () Bool)

(assert (=> d!12818 (=> (not res!37299) (not e!29355))))

(assert (=> d!12818 (= res!37299 (= (size!1005 (buf!1345 thiss!1379)) (size!1005 (buf!1345 (_2!2246 lt!66815)))))))

(assert (=> d!12818 (= (isPrefixOf!0 thiss!1379 (_2!2246 lt!66815)) e!29355)))

(declare-fun b!44023 () Bool)

(declare-fun res!37300 () Bool)

(assert (=> b!44023 (=> (not res!37300) (not e!29355))))

(assert (=> b!44023 (= res!37300 (bvsle (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)) (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66815))) (currentByte!2820 (_2!2246 lt!66815)) (currentBit!2815 (_2!2246 lt!66815)))))))

(declare-fun b!44024 () Bool)

(declare-fun e!29354 () Bool)

(assert (=> b!44024 (= e!29355 e!29354)))

(declare-fun res!37301 () Bool)

(assert (=> b!44024 (=> res!37301 e!29354)))

(assert (=> b!44024 (= res!37301 (= (size!1005 (buf!1345 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44025 () Bool)

(assert (=> b!44025 (= e!29354 (arrayBitRangesEq!0 (buf!1345 thiss!1379) (buf!1345 (_2!2246 lt!66815)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379))))))

(assert (= (and d!12818 res!37299) b!44023))

(assert (= (and b!44023 res!37300) b!44024))

(assert (= (and b!44024 (not res!37301)) b!44025))

(assert (=> b!44023 m!66971))

(assert (=> b!44023 m!66943))

(assert (=> b!44025 m!66971))

(assert (=> b!44025 m!66971))

(declare-fun m!67039 () Bool)

(assert (=> b!44025 m!67039))

(assert (=> b!43932 d!12818))

(declare-fun b!44036 () Bool)

(declare-fun e!29361 () Unit!3128)

(declare-fun lt!66944 () Unit!3128)

(assert (=> b!44036 (= e!29361 lt!66944)))

(declare-fun lt!66943 () (_ BitVec 64))

(assert (=> b!44036 (= lt!66943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66951 () (_ BitVec 64))

(assert (=> b!44036 (= lt!66951 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2228 array!2228 (_ BitVec 64) (_ BitVec 64)) Unit!3128)

(assert (=> b!44036 (= lt!66944 (arrayBitRangesEqSymmetric!0 (buf!1345 thiss!1379) (buf!1345 (_2!2246 lt!66816)) lt!66943 lt!66951))))

(assert (=> b!44036 (arrayBitRangesEq!0 (buf!1345 (_2!2246 lt!66816)) (buf!1345 thiss!1379) lt!66943 lt!66951)))

(declare-fun b!44037 () Bool)

(declare-fun Unit!3145 () Unit!3128)

(assert (=> b!44037 (= e!29361 Unit!3145)))

(declare-fun b!44038 () Bool)

(declare-fun res!37309 () Bool)

(declare-fun e!29360 () Bool)

(assert (=> b!44038 (=> (not res!37309) (not e!29360))))

(declare-fun lt!66946 () tuple2!4308)

(assert (=> b!44038 (= res!37309 (isPrefixOf!0 (_1!2247 lt!66946) thiss!1379))))

(declare-fun d!12820 () Bool)

(assert (=> d!12820 e!29360))

(declare-fun res!37310 () Bool)

(assert (=> d!12820 (=> (not res!37310) (not e!29360))))

(assert (=> d!12820 (= res!37310 (isPrefixOf!0 (_1!2247 lt!66946) (_2!2247 lt!66946)))))

(declare-fun lt!66937 () BitStream!1754)

(assert (=> d!12820 (= lt!66946 (tuple2!4309 lt!66937 (_2!2246 lt!66816)))))

(declare-fun lt!66950 () Unit!3128)

(declare-fun lt!66948 () Unit!3128)

(assert (=> d!12820 (= lt!66950 lt!66948)))

(assert (=> d!12820 (isPrefixOf!0 lt!66937 (_2!2246 lt!66816))))

(assert (=> d!12820 (= lt!66948 (lemmaIsPrefixTransitive!0 lt!66937 (_2!2246 lt!66816) (_2!2246 lt!66816)))))

(declare-fun lt!66945 () Unit!3128)

(declare-fun lt!66941 () Unit!3128)

(assert (=> d!12820 (= lt!66945 lt!66941)))

(assert (=> d!12820 (isPrefixOf!0 lt!66937 (_2!2246 lt!66816))))

(assert (=> d!12820 (= lt!66941 (lemmaIsPrefixTransitive!0 lt!66937 thiss!1379 (_2!2246 lt!66816)))))

(declare-fun lt!66939 () Unit!3128)

(assert (=> d!12820 (= lt!66939 e!29361)))

(declare-fun c!2934 () Bool)

(assert (=> d!12820 (= c!2934 (not (= (size!1005 (buf!1345 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!66934 () Unit!3128)

(declare-fun lt!66952 () Unit!3128)

(assert (=> d!12820 (= lt!66934 lt!66952)))

(assert (=> d!12820 (isPrefixOf!0 (_2!2246 lt!66816) (_2!2246 lt!66816))))

(assert (=> d!12820 (= lt!66952 (lemmaIsPrefixRefl!0 (_2!2246 lt!66816)))))

(declare-fun lt!66936 () Unit!3128)

(declare-fun lt!66940 () Unit!3128)

(assert (=> d!12820 (= lt!66936 lt!66940)))

(assert (=> d!12820 (= lt!66940 (lemmaIsPrefixRefl!0 (_2!2246 lt!66816)))))

(declare-fun lt!66938 () Unit!3128)

(declare-fun lt!66947 () Unit!3128)

(assert (=> d!12820 (= lt!66938 lt!66947)))

(assert (=> d!12820 (isPrefixOf!0 lt!66937 lt!66937)))

(assert (=> d!12820 (= lt!66947 (lemmaIsPrefixRefl!0 lt!66937))))

(declare-fun lt!66949 () Unit!3128)

(declare-fun lt!66933 () Unit!3128)

(assert (=> d!12820 (= lt!66949 lt!66933)))

(assert (=> d!12820 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12820 (= lt!66933 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12820 (= lt!66937 (BitStream!1755 (buf!1345 (_2!2246 lt!66816)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)))))

(assert (=> d!12820 (isPrefixOf!0 thiss!1379 (_2!2246 lt!66816))))

(assert (=> d!12820 (= (reader!0 thiss!1379 (_2!2246 lt!66816)) lt!66946)))

(declare-fun lt!66935 () (_ BitVec 64))

(declare-fun lt!66942 () (_ BitVec 64))

(declare-fun b!44039 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1754 (_ BitVec 64)) BitStream!1754)

(assert (=> b!44039 (= e!29360 (= (_1!2247 lt!66946) (withMovedBitIndex!0 (_2!2247 lt!66946) (bvsub lt!66935 lt!66942))))))

(assert (=> b!44039 (or (= (bvand lt!66935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66942 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66935 lt!66942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44039 (= lt!66942 (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816))))))

(assert (=> b!44039 (= lt!66935 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)))))

(declare-fun b!44040 () Bool)

(declare-fun res!37308 () Bool)

(assert (=> b!44040 (=> (not res!37308) (not e!29360))))

(assert (=> b!44040 (= res!37308 (isPrefixOf!0 (_2!2247 lt!66946) (_2!2246 lt!66816)))))

(assert (= (and d!12820 c!2934) b!44036))

(assert (= (and d!12820 (not c!2934)) b!44037))

(assert (= (and d!12820 res!37310) b!44038))

(assert (= (and b!44038 res!37309) b!44040))

(assert (= (and b!44040 res!37308) b!44039))

(declare-fun m!67041 () Bool)

(assert (=> b!44039 m!67041))

(assert (=> b!44039 m!67031))

(assert (=> b!44039 m!66971))

(assert (=> b!44036 m!66971))

(declare-fun m!67043 () Bool)

(assert (=> b!44036 m!67043))

(declare-fun m!67045 () Bool)

(assert (=> b!44036 m!67045))

(declare-fun m!67047 () Bool)

(assert (=> b!44040 m!67047))

(assert (=> d!12820 m!66967))

(declare-fun m!67049 () Bool)

(assert (=> d!12820 m!67049))

(assert (=> d!12820 m!66931))

(declare-fun m!67051 () Bool)

(assert (=> d!12820 m!67051))

(assert (=> d!12820 m!66969))

(declare-fun m!67053 () Bool)

(assert (=> d!12820 m!67053))

(declare-fun m!67055 () Bool)

(assert (=> d!12820 m!67055))

(declare-fun m!67057 () Bool)

(assert (=> d!12820 m!67057))

(declare-fun m!67059 () Bool)

(assert (=> d!12820 m!67059))

(declare-fun m!67061 () Bool)

(assert (=> d!12820 m!67061))

(declare-fun m!67063 () Bool)

(assert (=> d!12820 m!67063))

(declare-fun m!67065 () Bool)

(assert (=> b!44038 m!67065))

(assert (=> b!43932 d!12820))

(declare-fun b!44158 () Bool)

(declare-fun res!37403 () Bool)

(declare-fun e!29414 () Bool)

(assert (=> b!44158 (=> (not res!37403) (not e!29414))))

(declare-fun lt!67492 () tuple2!4306)

(assert (=> b!44158 (= res!37403 (isPrefixOf!0 (_2!2246 lt!66816) (_2!2246 lt!67492)))))

(declare-fun lt!67489 () tuple2!4306)

(declare-fun bm!523 () Bool)

(declare-fun lt!67498 () tuple2!4306)

(declare-fun c!2949 () Bool)

(declare-fun call!526 () tuple2!4308)

(assert (=> bm!523 (= call!526 (reader!0 (ite c!2949 (_2!2246 lt!67498) (_2!2246 lt!66816)) (ite c!2949 (_2!2246 lt!67489) (_2!2246 lt!66816))))))

(declare-fun b!44159 () Bool)

(declare-fun e!29413 () tuple2!4306)

(declare-fun Unit!3147 () Unit!3128)

(assert (=> b!44159 (= e!29413 (tuple2!4307 Unit!3147 (_2!2246 lt!66816)))))

(assert (=> b!44159 (= (size!1005 (buf!1345 (_2!2246 lt!66816))) (size!1005 (buf!1345 (_2!2246 lt!66816))))))

(declare-fun lt!67471 () Unit!3128)

(declare-fun Unit!3148 () Unit!3128)

(assert (=> b!44159 (= lt!67471 Unit!3148)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1754 array!2228 array!2228 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4324 0))(
  ( (tuple2!4325 (_1!2255 array!2228) (_2!2255 BitStream!1754)) )
))
(declare-fun readBits!0 (BitStream!1754 (_ BitVec 64)) tuple2!4324)

(assert (=> b!44159 (checkByteArrayBitContent!0 (_2!2246 lt!66816) srcBuffer!2 (_1!2255 (readBits!0 (_1!2247 call!526) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!44160 () Bool)

(declare-fun e!29415 () Bool)

(declare-fun lt!67486 () (_ BitVec 64))

(assert (=> b!44160 (= e!29415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) lt!67486))))

(declare-fun d!12822 () Bool)

(assert (=> d!12822 e!29414))

(declare-fun res!37404 () Bool)

(assert (=> d!12822 (=> (not res!37404) (not e!29414))))

(declare-fun lt!67481 () (_ BitVec 64))

(assert (=> d!12822 (= res!37404 (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67492))) (currentByte!2820 (_2!2246 lt!67492)) (currentBit!2815 (_2!2246 lt!67492))) (bvsub lt!67481 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12822 (or (= (bvand lt!67481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!67481 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!67481 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!67488 () (_ BitVec 64))

(assert (=> d!12822 (= lt!67481 (bvadd lt!67488 to!314))))

(assert (=> d!12822 (or (not (= (bvand lt!67488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67488 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12822 (= lt!67488 (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816))))))

(assert (=> d!12822 (= lt!67492 e!29413)))

(assert (=> d!12822 (= c!2949 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!67504 () Unit!3128)

(declare-fun lt!67487 () Unit!3128)

(assert (=> d!12822 (= lt!67504 lt!67487)))

(assert (=> d!12822 (isPrefixOf!0 (_2!2246 lt!66816) (_2!2246 lt!66816))))

(assert (=> d!12822 (= lt!67487 (lemmaIsPrefixRefl!0 (_2!2246 lt!66816)))))

(declare-fun lt!67491 () (_ BitVec 64))

(assert (=> d!12822 (= lt!67491 (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816))))))

(assert (=> d!12822 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12822 (= (appendBitsMSBFirstLoop!0 (_2!2246 lt!66816) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!67492)))

(declare-fun b!44161 () Bool)

(declare-fun lt!67462 () tuple2!4308)

(assert (=> b!44161 (= e!29414 (= (bitStreamReadBitsIntoList!0 (_2!2246 lt!67492) (_1!2247 lt!67462) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2246 lt!67492) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!44161 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44161 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!67490 () Unit!3128)

(declare-fun lt!67467 () Unit!3128)

(assert (=> b!44161 (= lt!67490 lt!67467)))

(assert (=> b!44161 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!67492)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) lt!67486)))

(assert (=> b!44161 (= lt!67467 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2246 lt!66816) (buf!1345 (_2!2246 lt!67492)) lt!67486))))

(assert (=> b!44161 e!29415))

(declare-fun res!37400 () Bool)

(assert (=> b!44161 (=> (not res!37400) (not e!29415))))

(assert (=> b!44161 (= res!37400 (and (= (size!1005 (buf!1345 (_2!2246 lt!66816))) (size!1005 (buf!1345 (_2!2246 lt!67492)))) (bvsge lt!67486 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44161 (= lt!67486 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!44161 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44161 (= lt!67462 (reader!0 (_2!2246 lt!66816) (_2!2246 lt!67492)))))

(declare-fun b!44162 () Bool)

(declare-fun Unit!3149 () Unit!3128)

(assert (=> b!44162 (= e!29413 (tuple2!4307 Unit!3149 (_2!2246 lt!67489)))))

(assert (=> b!44162 (= lt!67498 (appendBitFromByte!0 (_2!2246 lt!66816) (select (arr!1513 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!67480 () (_ BitVec 64))

(assert (=> b!44162 (= lt!67480 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67470 () (_ BitVec 64))

(assert (=> b!44162 (= lt!67470 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67466 () Unit!3128)

(assert (=> b!44162 (= lt!67466 (validateOffsetBitsIneqLemma!0 (_2!2246 lt!66816) (_2!2246 lt!67498) lt!67480 lt!67470))))

(assert (=> b!44162 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!67498)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!67498))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!67498))) (bvsub lt!67480 lt!67470))))

(declare-fun lt!67474 () Unit!3128)

(assert (=> b!44162 (= lt!67474 lt!67466)))

(declare-fun lt!67502 () tuple2!4308)

(assert (=> b!44162 (= lt!67502 (reader!0 (_2!2246 lt!66816) (_2!2246 lt!67498)))))

(declare-fun lt!67494 () (_ BitVec 64))

(assert (=> b!44162 (= lt!67494 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!67472 () Unit!3128)

(assert (=> b!44162 (= lt!67472 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2246 lt!66816) (buf!1345 (_2!2246 lt!67498)) lt!67494))))

(assert (=> b!44162 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!67498)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) lt!67494)))

(declare-fun lt!67475 () Unit!3128)

(assert (=> b!44162 (= lt!67475 lt!67472)))

(assert (=> b!44162 (= (head!337 (byteArrayBitContentToList!0 (_2!2246 lt!67498) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!337 (bitStreamReadBitsIntoList!0 (_2!2246 lt!67498) (_1!2247 lt!67502) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67493 () Unit!3128)

(declare-fun Unit!3150 () Unit!3128)

(assert (=> b!44162 (= lt!67493 Unit!3150)))

(assert (=> b!44162 (= lt!67489 (appendBitsMSBFirstLoop!0 (_2!2246 lt!67498) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!67463 () Unit!3128)

(assert (=> b!44162 (= lt!67463 (lemmaIsPrefixTransitive!0 (_2!2246 lt!66816) (_2!2246 lt!67498) (_2!2246 lt!67489)))))

(assert (=> b!44162 (isPrefixOf!0 (_2!2246 lt!66816) (_2!2246 lt!67489))))

(declare-fun lt!67464 () Unit!3128)

(assert (=> b!44162 (= lt!67464 lt!67463)))

(assert (=> b!44162 (= (size!1005 (buf!1345 (_2!2246 lt!67489))) (size!1005 (buf!1345 (_2!2246 lt!66816))))))

(declare-fun lt!67496 () Unit!3128)

(declare-fun Unit!3151 () Unit!3128)

(assert (=> b!44162 (= lt!67496 Unit!3151)))

(assert (=> b!44162 (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67489))) (currentByte!2820 (_2!2246 lt!67489)) (currentBit!2815 (_2!2246 lt!67489))) (bvsub (bvadd (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67478 () Unit!3128)

(declare-fun Unit!3152 () Unit!3128)

(assert (=> b!44162 (= lt!67478 Unit!3152)))

(assert (=> b!44162 (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67489))) (currentByte!2820 (_2!2246 lt!67489)) (currentBit!2815 (_2!2246 lt!67489))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67498))) (currentByte!2820 (_2!2246 lt!67498)) (currentBit!2815 (_2!2246 lt!67498))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67476 () Unit!3128)

(declare-fun Unit!3153 () Unit!3128)

(assert (=> b!44162 (= lt!67476 Unit!3153)))

(declare-fun lt!67468 () tuple2!4308)

(assert (=> b!44162 (= lt!67468 (reader!0 (_2!2246 lt!66816) (_2!2246 lt!67489)))))

(declare-fun lt!67495 () (_ BitVec 64))

(assert (=> b!44162 (= lt!67495 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67482 () Unit!3128)

(assert (=> b!44162 (= lt!67482 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2246 lt!66816) (buf!1345 (_2!2246 lt!67489)) lt!67495))))

(assert (=> b!44162 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!67489)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) lt!67495)))

(declare-fun lt!67461 () Unit!3128)

(assert (=> b!44162 (= lt!67461 lt!67482)))

(declare-fun lt!67477 () tuple2!4308)

(assert (=> b!44162 (= lt!67477 call!526)))

(declare-fun lt!67473 () (_ BitVec 64))

(assert (=> b!44162 (= lt!67473 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!67501 () Unit!3128)

(assert (=> b!44162 (= lt!67501 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2246 lt!67498) (buf!1345 (_2!2246 lt!67489)) lt!67473))))

(assert (=> b!44162 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!67489)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!67498))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!67498))) lt!67473)))

(declare-fun lt!67485 () Unit!3128)

(assert (=> b!44162 (= lt!67485 lt!67501)))

(declare-fun lt!67469 () List!518)

(assert (=> b!44162 (= lt!67469 (byteArrayBitContentToList!0 (_2!2246 lt!67489) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!67483 () List!518)

(assert (=> b!44162 (= lt!67483 (byteArrayBitContentToList!0 (_2!2246 lt!67489) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67500 () List!518)

(assert (=> b!44162 (= lt!67500 (bitStreamReadBitsIntoList!0 (_2!2246 lt!67489) (_1!2247 lt!67468) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!67479 () List!518)

(assert (=> b!44162 (= lt!67479 (bitStreamReadBitsIntoList!0 (_2!2246 lt!67489) (_1!2247 lt!67477) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!67503 () (_ BitVec 64))

(assert (=> b!44162 (= lt!67503 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!67465 () Unit!3128)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1754 BitStream!1754 BitStream!1754 BitStream!1754 (_ BitVec 64) List!518) Unit!3128)

(assert (=> b!44162 (= lt!67465 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2246 lt!67489) (_2!2246 lt!67489) (_1!2247 lt!67468) (_1!2247 lt!67477) lt!67503 lt!67500))))

(declare-fun tail!213 (List!518) List!518)

(assert (=> b!44162 (= (bitStreamReadBitsIntoList!0 (_2!2246 lt!67489) (_1!2247 lt!67477) (bvsub lt!67503 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!213 lt!67500))))

(declare-fun lt!67484 () Unit!3128)

(assert (=> b!44162 (= lt!67484 lt!67465)))

(declare-fun lt!67497 () Unit!3128)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2228 array!2228 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3128)

(assert (=> b!44162 (= lt!67497 (arrayBitRangesEqImpliesEq!0 (buf!1345 (_2!2246 lt!67498)) (buf!1345 (_2!2246 lt!67489)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!67491 (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67498))) (currentByte!2820 (_2!2246 lt!67498)) (currentBit!2815 (_2!2246 lt!67498)))))))

(declare-fun bitAt!0 (array!2228 (_ BitVec 64)) Bool)

(assert (=> b!44162 (= (bitAt!0 (buf!1345 (_2!2246 lt!67498)) lt!67491) (bitAt!0 (buf!1345 (_2!2246 lt!67489)) lt!67491))))

(declare-fun lt!67499 () Unit!3128)

(assert (=> b!44162 (= lt!67499 lt!67497)))

(declare-fun b!44163 () Bool)

(declare-fun res!37405 () Bool)

(assert (=> b!44163 (=> (not res!37405) (not e!29414))))

(assert (=> b!44163 (= res!37405 (= (size!1005 (buf!1345 (_2!2246 lt!66816))) (size!1005 (buf!1345 (_2!2246 lt!67492)))))))

(declare-fun b!44164 () Bool)

(declare-fun res!37401 () Bool)

(assert (=> b!44164 (=> (not res!37401) (not e!29414))))

(assert (=> b!44164 (= res!37401 (invariant!0 (currentBit!2815 (_2!2246 lt!67492)) (currentByte!2820 (_2!2246 lt!67492)) (size!1005 (buf!1345 (_2!2246 lt!67492)))))))

(declare-fun b!44165 () Bool)

(declare-fun res!37402 () Bool)

(assert (=> b!44165 (=> (not res!37402) (not e!29414))))

(assert (=> b!44165 (= res!37402 (= (size!1005 (buf!1345 (_2!2246 lt!67492))) (size!1005 (buf!1345 (_2!2246 lt!66816)))))))

(assert (= (and d!12822 c!2949) b!44162))

(assert (= (and d!12822 (not c!2949)) b!44159))

(assert (= (or b!44162 b!44159) bm!523))

(assert (= (and d!12822 res!37404) b!44164))

(assert (= (and b!44164 res!37401) b!44163))

(assert (= (and b!44163 res!37405) b!44158))

(assert (= (and b!44158 res!37403) b!44165))

(assert (= (and b!44165 res!37402) b!44161))

(assert (= (and b!44161 res!37400) b!44160))

(declare-fun m!67319 () Bool)

(assert (=> b!44164 m!67319))

(declare-fun m!67321 () Bool)

(assert (=> bm!523 m!67321))

(declare-fun m!67323 () Bool)

(assert (=> d!12822 m!67323))

(assert (=> d!12822 m!67031))

(assert (=> d!12822 m!67051))

(assert (=> d!12822 m!67057))

(declare-fun m!67325 () Bool)

(assert (=> b!44159 m!67325))

(declare-fun m!67327 () Bool)

(assert (=> b!44159 m!67327))

(declare-fun m!67329 () Bool)

(assert (=> b!44158 m!67329))

(declare-fun m!67331 () Bool)

(assert (=> b!44162 m!67331))

(declare-fun m!67333 () Bool)

(assert (=> b!44162 m!67333))

(declare-fun m!67335 () Bool)

(assert (=> b!44162 m!67335))

(declare-fun m!67337 () Bool)

(assert (=> b!44162 m!67337))

(declare-fun m!67339 () Bool)

(assert (=> b!44162 m!67339))

(declare-fun m!67341 () Bool)

(assert (=> b!44162 m!67341))

(declare-fun m!67343 () Bool)

(assert (=> b!44162 m!67343))

(declare-fun m!67345 () Bool)

(assert (=> b!44162 m!67345))

(declare-fun m!67347 () Bool)

(assert (=> b!44162 m!67347))

(declare-fun m!67349 () Bool)

(assert (=> b!44162 m!67349))

(declare-fun m!67351 () Bool)

(assert (=> b!44162 m!67351))

(declare-fun m!67353 () Bool)

(assert (=> b!44162 m!67353))

(assert (=> b!44162 m!67345))

(declare-fun m!67355 () Bool)

(assert (=> b!44162 m!67355))

(assert (=> b!44162 m!67337))

(declare-fun m!67357 () Bool)

(assert (=> b!44162 m!67357))

(declare-fun m!67359 () Bool)

(assert (=> b!44162 m!67359))

(assert (=> b!44162 m!67349))

(declare-fun m!67361 () Bool)

(assert (=> b!44162 m!67361))

(declare-fun m!67363 () Bool)

(assert (=> b!44162 m!67363))

(declare-fun m!67365 () Bool)

(assert (=> b!44162 m!67365))

(declare-fun m!67367 () Bool)

(assert (=> b!44162 m!67367))

(declare-fun m!67369 () Bool)

(assert (=> b!44162 m!67369))

(declare-fun m!67371 () Bool)

(assert (=> b!44162 m!67371))

(declare-fun m!67373 () Bool)

(assert (=> b!44162 m!67373))

(declare-fun m!67375 () Bool)

(assert (=> b!44162 m!67375))

(declare-fun m!67377 () Bool)

(assert (=> b!44162 m!67377))

(assert (=> b!44162 m!67031))

(assert (=> b!44162 m!67357))

(declare-fun m!67379 () Bool)

(assert (=> b!44162 m!67379))

(declare-fun m!67381 () Bool)

(assert (=> b!44162 m!67381))

(declare-fun m!67383 () Bool)

(assert (=> b!44162 m!67383))

(declare-fun m!67385 () Bool)

(assert (=> b!44162 m!67385))

(declare-fun m!67387 () Bool)

(assert (=> b!44162 m!67387))

(declare-fun m!67389 () Bool)

(assert (=> b!44162 m!67389))

(declare-fun m!67391 () Bool)

(assert (=> b!44162 m!67391))

(declare-fun m!67393 () Bool)

(assert (=> b!44161 m!67393))

(declare-fun m!67395 () Bool)

(assert (=> b!44161 m!67395))

(declare-fun m!67397 () Bool)

(assert (=> b!44161 m!67397))

(declare-fun m!67399 () Bool)

(assert (=> b!44161 m!67399))

(declare-fun m!67401 () Bool)

(assert (=> b!44161 m!67401))

(declare-fun m!67403 () Bool)

(assert (=> b!44160 m!67403))

(assert (=> b!43932 d!12822))

(declare-fun d!12868 () Bool)

(assert (=> d!12868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 thiss!1379)) ((_ sign_extend 32) (currentBit!2815 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3435 () Bool)

(assert (= bs!3435 d!12868))

(declare-fun m!67405 () Bool)

(assert (=> bs!3435 m!67405))

(assert (=> b!43932 d!12868))

(declare-fun d!12870 () Bool)

(assert (=> d!12870 (= (invariant!0 (currentBit!2815 (_2!2246 lt!66815)) (currentByte!2820 (_2!2246 lt!66815)) (size!1005 (buf!1345 (_2!2246 lt!66815)))) (and (bvsge (currentBit!2815 (_2!2246 lt!66815)) #b00000000000000000000000000000000) (bvslt (currentBit!2815 (_2!2246 lt!66815)) #b00000000000000000000000000001000) (bvsge (currentByte!2820 (_2!2246 lt!66815)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2820 (_2!2246 lt!66815)) (size!1005 (buf!1345 (_2!2246 lt!66815)))) (and (= (currentBit!2815 (_2!2246 lt!66815)) #b00000000000000000000000000000000) (= (currentByte!2820 (_2!2246 lt!66815)) (size!1005 (buf!1345 (_2!2246 lt!66815))))))))))

(assert (=> b!43931 d!12870))

(declare-fun d!12872 () Bool)

(declare-fun res!37409 () Bool)

(declare-fun e!29420 () Bool)

(assert (=> d!12872 (=> (not res!37409) (not e!29420))))

(assert (=> d!12872 (= res!37409 (= (size!1005 (buf!1345 thiss!1379)) (size!1005 (buf!1345 (_2!2246 lt!66816)))))))

(assert (=> d!12872 (= (isPrefixOf!0 thiss!1379 (_2!2246 lt!66816)) e!29420)))

(declare-fun b!44169 () Bool)

(declare-fun res!37410 () Bool)

(assert (=> b!44169 (=> (not res!37410) (not e!29420))))

(assert (=> b!44169 (= res!37410 (bvsle (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)) (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!66816))) (currentByte!2820 (_2!2246 lt!66816)) (currentBit!2815 (_2!2246 lt!66816)))))))

(declare-fun b!44170 () Bool)

(declare-fun e!29419 () Bool)

(assert (=> b!44170 (= e!29420 e!29419)))

(declare-fun res!37411 () Bool)

(assert (=> b!44170 (=> res!37411 e!29419)))

(assert (=> b!44170 (= res!37411 (= (size!1005 (buf!1345 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!44171 () Bool)

(assert (=> b!44171 (= e!29419 (arrayBitRangesEq!0 (buf!1345 thiss!1379) (buf!1345 (_2!2246 lt!66816)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379))))))

(assert (= (and d!12872 res!37409) b!44169))

(assert (= (and b!44169 res!37410) b!44170))

(assert (= (and b!44170 (not res!37411)) b!44171))

(assert (=> b!44169 m!66971))

(assert (=> b!44169 m!67031))

(assert (=> b!44171 m!66971))

(assert (=> b!44171 m!66971))

(declare-fun m!67407 () Bool)

(assert (=> b!44171 m!67407))

(assert (=> b!43933 d!12872))

(declare-fun d!12874 () Bool)

(assert (=> d!12874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3436 () Bool)

(assert (= bs!3436 d!12874))

(declare-fun m!67409 () Bool)

(assert (=> bs!3436 m!67409))

(assert (=> b!43933 d!12874))

(declare-fun d!12876 () Bool)

(declare-fun e!29423 () Bool)

(assert (=> d!12876 e!29423))

(declare-fun res!37414 () Bool)

(assert (=> d!12876 (=> (not res!37414) (not e!29423))))

(assert (=> d!12876 (= res!37414 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!67510 () Unit!3128)

(declare-fun choose!27 (BitStream!1754 BitStream!1754 (_ BitVec 64) (_ BitVec 64)) Unit!3128)

(assert (=> d!12876 (= lt!67510 (choose!27 thiss!1379 (_2!2246 lt!66816) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12876 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12876 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2246 lt!66816) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!67510)))

(declare-fun b!44174 () Bool)

(assert (=> b!44174 (= e!29423 (validate_offset_bits!1 ((_ sign_extend 32) (size!1005 (buf!1345 (_2!2246 lt!66816)))) ((_ sign_extend 32) (currentByte!2820 (_2!2246 lt!66816))) ((_ sign_extend 32) (currentBit!2815 (_2!2246 lt!66816))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12876 res!37414) b!44174))

(declare-fun m!67411 () Bool)

(assert (=> d!12876 m!67411))

(assert (=> b!44174 m!66927))

(assert (=> b!43933 d!12876))

(declare-fun b!44265 () Bool)

(declare-fun e!29468 () Bool)

(declare-fun e!29469 () Bool)

(assert (=> b!44265 (= e!29468 e!29469)))

(declare-fun res!37490 () Bool)

(assert (=> b!44265 (=> (not res!37490) (not e!29469))))

(declare-fun lt!67633 () tuple2!4306)

(declare-datatypes ((tuple2!4332 0))(
  ( (tuple2!4333 (_1!2259 BitStream!1754) (_2!2259 Bool)) )
))
(declare-fun lt!67636 () tuple2!4332)

(declare-fun lt!67626 () Bool)

(assert (=> b!44265 (= res!37490 (and (= (_2!2259 lt!67636) lt!67626) (= (_1!2259 lt!67636) (_2!2246 lt!67633))))))

(declare-fun readBitPure!0 (BitStream!1754) tuple2!4332)

(declare-fun readerFrom!0 (BitStream!1754 (_ BitVec 32) (_ BitVec 32)) BitStream!1754)

(assert (=> b!44265 (= lt!67636 (readBitPure!0 (readerFrom!0 (_2!2246 lt!67633) (currentBit!2815 thiss!1379) (currentByte!2820 thiss!1379))))))

(declare-fun b!44266 () Bool)

(declare-fun res!37484 () Bool)

(assert (=> b!44266 (=> (not res!37484) (not e!29468))))

(assert (=> b!44266 (= res!37484 (isPrefixOf!0 thiss!1379 (_2!2246 lt!67633)))))

(declare-fun b!44267 () Bool)

(declare-fun res!37489 () Bool)

(assert (=> b!44267 (=> (not res!37489) (not e!29468))))

(assert (=> b!44267 (= res!37489 (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67633))) (currentByte!2820 (_2!2246 lt!67633)) (currentBit!2815 (_2!2246 lt!67633))) (bvadd (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!44268 () Bool)

(declare-fun res!37485 () Bool)

(declare-fun e!29471 () Bool)

(assert (=> b!44268 (=> (not res!37485) (not e!29471))))

(declare-fun lt!67625 () (_ BitVec 64))

(declare-fun lt!67632 () tuple2!4306)

(declare-fun lt!67628 () (_ BitVec 64))

(assert (=> b!44268 (= res!37485 (= (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67632))) (currentByte!2820 (_2!2246 lt!67632)) (currentBit!2815 (_2!2246 lt!67632))) (bvadd lt!67625 lt!67628)))))

(assert (=> b!44268 (or (not (= (bvand lt!67625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!67628 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!67625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!67625 lt!67628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44268 (= lt!67628 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!44268 (= lt!67625 (bitIndex!0 (size!1005 (buf!1345 thiss!1379)) (currentByte!2820 thiss!1379) (currentBit!2815 thiss!1379)))))

(declare-fun b!44269 () Bool)

(assert (=> b!44269 (= e!29469 (= (bitIndex!0 (size!1005 (buf!1345 (_1!2259 lt!67636))) (currentByte!2820 (_1!2259 lt!67636)) (currentBit!2815 (_1!2259 lt!67636))) (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67633))) (currentByte!2820 (_2!2246 lt!67633)) (currentBit!2815 (_2!2246 lt!67633)))))))

(declare-fun b!44270 () Bool)

(declare-fun res!37486 () Bool)

(assert (=> b!44270 (=> (not res!37486) (not e!29471))))

(assert (=> b!44270 (= res!37486 (isPrefixOf!0 thiss!1379 (_2!2246 lt!67632)))))

(declare-fun d!12878 () Bool)

(assert (=> d!12878 e!29471))

(declare-fun res!37487 () Bool)

(assert (=> d!12878 (=> (not res!37487) (not e!29471))))

(assert (=> d!12878 (= res!37487 (= (size!1005 (buf!1345 (_2!2246 lt!67632))) (size!1005 (buf!1345 thiss!1379))))))

(declare-fun lt!67631 () (_ BitVec 8))

(declare-fun lt!67635 () array!2228)

(assert (=> d!12878 (= lt!67631 (select (arr!1513 lt!67635) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12878 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1005 lt!67635)))))

(assert (=> d!12878 (= lt!67635 (array!2229 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!67634 () tuple2!4306)

(assert (=> d!12878 (= lt!67632 (tuple2!4307 (_1!2246 lt!67634) (_2!2246 lt!67634)))))

(assert (=> d!12878 (= lt!67634 lt!67633)))

(assert (=> d!12878 e!29468))

(declare-fun res!37491 () Bool)

(assert (=> d!12878 (=> (not res!37491) (not e!29468))))

(assert (=> d!12878 (= res!37491 (= (size!1005 (buf!1345 thiss!1379)) (size!1005 (buf!1345 (_2!2246 lt!67633)))))))

(declare-fun appendBit!0 (BitStream!1754 Bool) tuple2!4306)

(assert (=> d!12878 (= lt!67633 (appendBit!0 thiss!1379 lt!67626))))

(assert (=> d!12878 (= lt!67626 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1513 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12878 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12878 (= (appendBitFromByte!0 thiss!1379 (select (arr!1513 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!67632)))

(declare-fun b!44271 () Bool)

(declare-fun e!29470 () Bool)

(declare-fun lt!67630 () tuple2!4332)

(assert (=> b!44271 (= e!29470 (= (bitIndex!0 (size!1005 (buf!1345 (_1!2259 lt!67630))) (currentByte!2820 (_1!2259 lt!67630)) (currentBit!2815 (_1!2259 lt!67630))) (bitIndex!0 (size!1005 (buf!1345 (_2!2246 lt!67632))) (currentByte!2820 (_2!2246 lt!67632)) (currentBit!2815 (_2!2246 lt!67632)))))))

(declare-fun b!44272 () Bool)

(assert (=> b!44272 (= e!29471 e!29470)))

(declare-fun res!37488 () Bool)

(assert (=> b!44272 (=> (not res!37488) (not e!29470))))

(assert (=> b!44272 (= res!37488 (and (= (_2!2259 lt!67630) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1513 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!67631)) #b00000000000000000000000000000000))) (= (_1!2259 lt!67630) (_2!2246 lt!67632))))))

(declare-fun lt!67627 () tuple2!4324)

(declare-fun lt!67629 () BitStream!1754)

(assert (=> b!44272 (= lt!67627 (readBits!0 lt!67629 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!44272 (= lt!67630 (readBitPure!0 lt!67629))))

(assert (=> b!44272 (= lt!67629 (readerFrom!0 (_2!2246 lt!67632) (currentBit!2815 thiss!1379) (currentByte!2820 thiss!1379)))))

(assert (= (and d!12878 res!37491) b!44267))

(assert (= (and b!44267 res!37489) b!44266))

(assert (= (and b!44266 res!37484) b!44265))

(assert (= (and b!44265 res!37490) b!44269))

(assert (= (and d!12878 res!37487) b!44268))

(assert (= (and b!44268 res!37485) b!44270))

(assert (= (and b!44270 res!37486) b!44272))

(assert (= (and b!44272 res!37488) b!44271))

(declare-fun m!67481 () Bool)

(assert (=> b!44265 m!67481))

(assert (=> b!44265 m!67481))

(declare-fun m!67483 () Bool)

(assert (=> b!44265 m!67483))

(declare-fun m!67485 () Bool)

(assert (=> b!44268 m!67485))

(assert (=> b!44268 m!66971))

(declare-fun m!67487 () Bool)

(assert (=> b!44270 m!67487))

(declare-fun m!67489 () Bool)

(assert (=> d!12878 m!67489))

(declare-fun m!67491 () Bool)

(assert (=> d!12878 m!67491))

(assert (=> d!12878 m!67019))

(declare-fun m!67493 () Bool)

(assert (=> b!44271 m!67493))

(assert (=> b!44271 m!67485))

(declare-fun m!67495 () Bool)

(assert (=> b!44272 m!67495))

(declare-fun m!67497 () Bool)

(assert (=> b!44272 m!67497))

(declare-fun m!67499 () Bool)

(assert (=> b!44272 m!67499))

(declare-fun m!67501 () Bool)

(assert (=> b!44266 m!67501))

(declare-fun m!67503 () Bool)

(assert (=> b!44267 m!67503))

(assert (=> b!44267 m!66971))

(declare-fun m!67505 () Bool)

(assert (=> b!44269 m!67505))

(assert (=> b!44269 m!67503))

(assert (=> b!43933 d!12878))

(push 1)

