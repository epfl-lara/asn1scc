; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11684 () Bool)

(assert start!11684)

(declare-fun b!57661 () Bool)

(declare-fun e!38242 () Bool)

(declare-fun e!38243 () Bool)

(assert (=> b!57661 (= e!38242 e!38243)))

(declare-fun res!47884 () Bool)

(assert (=> b!57661 (=> res!47884 e!38243)))

(declare-datatypes ((array!2634 0))(
  ( (array!2635 (arr!1755 (Array (_ BitVec 32) (_ BitVec 8))) (size!1194 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2076 0))(
  ( (BitStream!2077 (buf!1572 array!2634) (currentByte!3184 (_ BitVec 32)) (currentBit!3179 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2076)

(declare-datatypes ((Unit!3987 0))(
  ( (Unit!3988) )
))
(declare-datatypes ((tuple2!5250 0))(
  ( (tuple2!5251 (_1!2736 Unit!3987) (_2!2736 BitStream!2076)) )
))
(declare-fun lt!91180 () tuple2!5250)

(declare-fun isPrefixOf!0 (BitStream!2076 BitStream!2076) Bool)

(assert (=> b!57661 (= res!47884 (not (isPrefixOf!0 thiss!1379 (_2!2736 lt!91180))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57661 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91179 () Unit!3987)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2076 BitStream!2076 (_ BitVec 64) (_ BitVec 64)) Unit!3987)

(assert (=> b!57661 (= lt!91179 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2736 lt!91180) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2634)

(declare-fun appendBitFromByte!0 (BitStream!2076 (_ BitVec 8) (_ BitVec 32)) tuple2!5250)

(assert (=> b!57661 (= lt!91180 (appendBitFromByte!0 thiss!1379 (select (arr!1755 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!57662 () Bool)

(declare-fun e!38249 () Bool)

(declare-fun array_inv!1097 (array!2634) Bool)

(assert (=> b!57662 (= e!38249 (array_inv!1097 (buf!1572 thiss!1379)))))

(declare-fun b!57663 () Bool)

(declare-fun e!38245 () Bool)

(assert (=> b!57663 (= e!38243 e!38245)))

(declare-fun res!47886 () Bool)

(assert (=> b!57663 (=> res!47886 e!38245)))

(declare-fun lt!91181 () tuple2!5250)

(assert (=> b!57663 (= res!47886 (not (isPrefixOf!0 (_2!2736 lt!91180) (_2!2736 lt!91181))))))

(assert (=> b!57663 (isPrefixOf!0 thiss!1379 (_2!2736 lt!91181))))

(declare-fun lt!91185 () Unit!3987)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2076 BitStream!2076 BitStream!2076) Unit!3987)

(assert (=> b!57663 (= lt!91185 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2736 lt!91180) (_2!2736 lt!91181)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2076 array!2634 (_ BitVec 64) (_ BitVec 64)) tuple2!5250)

(assert (=> b!57663 (= lt!91181 (appendBitsMSBFirstLoop!0 (_2!2736 lt!91180) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38246 () Bool)

(assert (=> b!57663 e!38246))

(declare-fun res!47891 () Bool)

(assert (=> b!57663 (=> (not res!47891) (not e!38246))))

(assert (=> b!57663 (= res!47891 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91182 () Unit!3987)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2076 array!2634 (_ BitVec 64)) Unit!3987)

(assert (=> b!57663 (= lt!91182 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1572 (_2!2736 lt!91180)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5252 0))(
  ( (tuple2!5253 (_1!2737 BitStream!2076) (_2!2737 BitStream!2076)) )
))
(declare-fun lt!91186 () tuple2!5252)

(declare-fun reader!0 (BitStream!2076 BitStream!2076) tuple2!5252)

(assert (=> b!57663 (= lt!91186 (reader!0 thiss!1379 (_2!2736 lt!91180)))))

(declare-fun b!57664 () Bool)

(declare-fun res!47887 () Bool)

(declare-fun e!38247 () Bool)

(assert (=> b!57664 (=> (not res!47887) (not e!38247))))

(assert (=> b!57664 (= res!47887 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 thiss!1379))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!47892 () Bool)

(assert (=> start!11684 (=> (not res!47892) (not e!38247))))

(assert (=> start!11684 (= res!47892 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1194 srcBuffer!2))))))))

(assert (=> start!11684 e!38247))

(assert (=> start!11684 true))

(assert (=> start!11684 (array_inv!1097 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2076) Bool)

(assert (=> start!11684 (and (inv!12 thiss!1379) e!38249)))

(declare-fun b!57665 () Bool)

(assert (=> b!57665 (= e!38247 (not e!38242))))

(declare-fun res!47885 () Bool)

(assert (=> b!57665 (=> res!47885 e!38242)))

(assert (=> b!57665 (= res!47885 (bvsge i!635 to!314))))

(assert (=> b!57665 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!91178 () Unit!3987)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2076) Unit!3987)

(assert (=> b!57665 (= lt!91178 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!91184 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!57665 (= lt!91184 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)))))

(declare-fun b!57666 () Bool)

(declare-fun e!38244 () Bool)

(assert (=> b!57666 (= e!38245 e!38244)))

(declare-fun res!47889 () Bool)

(assert (=> b!57666 (=> res!47889 e!38244)))

(declare-fun lt!91183 () (_ BitVec 64))

(assert (=> b!57666 (= res!47889 (not (= lt!91183 (bvsub (bvadd lt!91184 to!314) i!635))))))

(assert (=> b!57666 (= lt!91183 (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91181))) (currentByte!3184 (_2!2736 lt!91181)) (currentBit!3179 (_2!2736 lt!91181))))))

(declare-fun b!57667 () Bool)

(assert (=> b!57667 (= e!38244 (= lt!91183 (bvsub (bvsub (bvadd (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57667 (= (size!1194 (buf!1572 (_2!2736 lt!91181))) (size!1194 (buf!1572 thiss!1379)))))

(declare-fun b!57668 () Bool)

(declare-datatypes ((List!613 0))(
  ( (Nil!610) (Cons!609 (h!728 Bool) (t!1363 List!613)) )
))
(declare-fun head!432 (List!613) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2076 array!2634 (_ BitVec 64) (_ BitVec 64)) List!613)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2076 BitStream!2076 (_ BitVec 64)) List!613)

(assert (=> b!57668 (= e!38246 (= (head!432 (byteArrayBitContentToList!0 (_2!2736 lt!91180) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!432 (bitStreamReadBitsIntoList!0 (_2!2736 lt!91180) (_1!2737 lt!91186) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!57669 () Bool)

(declare-fun res!47888 () Bool)

(assert (=> b!57669 (=> res!47888 e!38244)))

(assert (=> b!57669 (= res!47888 (not (= (size!1194 (buf!1572 thiss!1379)) (size!1194 (buf!1572 (_2!2736 lt!91181))))))))

(declare-fun b!57670 () Bool)

(declare-fun res!47890 () Bool)

(assert (=> b!57670 (=> res!47890 e!38244)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!57670 (= res!47890 (not (invariant!0 (currentBit!3179 (_2!2736 lt!91181)) (currentByte!3184 (_2!2736 lt!91181)) (size!1194 (buf!1572 (_2!2736 lt!91181))))))))

(assert (= (and start!11684 res!47892) b!57664))

(assert (= (and b!57664 res!47887) b!57665))

(assert (= (and b!57665 (not res!47885)) b!57661))

(assert (= (and b!57661 (not res!47884)) b!57663))

(assert (= (and b!57663 res!47891) b!57668))

(assert (= (and b!57663 (not res!47886)) b!57666))

(assert (= (and b!57666 (not res!47889)) b!57670))

(assert (= (and b!57670 (not res!47890)) b!57669))

(assert (= (and b!57669 (not res!47888)) b!57667))

(assert (= start!11684 b!57662))

(declare-fun m!90923 () Bool)

(assert (=> b!57661 m!90923))

(declare-fun m!90925 () Bool)

(assert (=> b!57661 m!90925))

(declare-fun m!90927 () Bool)

(assert (=> b!57661 m!90927))

(declare-fun m!90929 () Bool)

(assert (=> b!57661 m!90929))

(assert (=> b!57661 m!90923))

(declare-fun m!90931 () Bool)

(assert (=> b!57661 m!90931))

(declare-fun m!90933 () Bool)

(assert (=> b!57662 m!90933))

(declare-fun m!90935 () Bool)

(assert (=> b!57664 m!90935))

(declare-fun m!90937 () Bool)

(assert (=> b!57670 m!90937))

(declare-fun m!90939 () Bool)

(assert (=> b!57665 m!90939))

(declare-fun m!90941 () Bool)

(assert (=> b!57665 m!90941))

(declare-fun m!90943 () Bool)

(assert (=> b!57665 m!90943))

(declare-fun m!90945 () Bool)

(assert (=> start!11684 m!90945))

(declare-fun m!90947 () Bool)

(assert (=> start!11684 m!90947))

(declare-fun m!90949 () Bool)

(assert (=> b!57663 m!90949))

(declare-fun m!90951 () Bool)

(assert (=> b!57663 m!90951))

(declare-fun m!90953 () Bool)

(assert (=> b!57663 m!90953))

(declare-fun m!90955 () Bool)

(assert (=> b!57663 m!90955))

(declare-fun m!90957 () Bool)

(assert (=> b!57663 m!90957))

(declare-fun m!90959 () Bool)

(assert (=> b!57663 m!90959))

(declare-fun m!90961 () Bool)

(assert (=> b!57663 m!90961))

(declare-fun m!90963 () Bool)

(assert (=> b!57668 m!90963))

(assert (=> b!57668 m!90963))

(declare-fun m!90965 () Bool)

(assert (=> b!57668 m!90965))

(declare-fun m!90967 () Bool)

(assert (=> b!57668 m!90967))

(assert (=> b!57668 m!90967))

(declare-fun m!90969 () Bool)

(assert (=> b!57668 m!90969))

(declare-fun m!90971 () Bool)

(assert (=> b!57666 m!90971))

(declare-fun m!90973 () Bool)

(assert (=> b!57667 m!90973))

(check-sat (not start!11684) (not b!57665) (not b!57661) (not b!57663) (not b!57670) (not b!57662) (not b!57664) (not b!57668) (not b!57666) (not b!57667))
(check-sat)
(get-model)

(declare-fun d!18400 () Bool)

(declare-fun res!47926 () Bool)

(declare-fun e!38282 () Bool)

(assert (=> d!18400 (=> (not res!47926) (not e!38282))))

(assert (=> d!18400 (= res!47926 (= (size!1194 (buf!1572 thiss!1379)) (size!1194 (buf!1572 thiss!1379))))))

(assert (=> d!18400 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!38282)))

(declare-fun b!57707 () Bool)

(declare-fun res!47927 () Bool)

(assert (=> b!57707 (=> (not res!47927) (not e!38282))))

(assert (=> b!57707 (= res!47927 (bvsle (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)) (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379))))))

(declare-fun b!57708 () Bool)

(declare-fun e!38281 () Bool)

(assert (=> b!57708 (= e!38282 e!38281)))

(declare-fun res!47928 () Bool)

(assert (=> b!57708 (=> res!47928 e!38281)))

(assert (=> b!57708 (= res!47928 (= (size!1194 (buf!1572 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57709 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2634 array!2634 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57709 (= e!38281 (arrayBitRangesEq!0 (buf!1572 thiss!1379) (buf!1572 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379))))))

(assert (= (and d!18400 res!47926) b!57707))

(assert (= (and b!57707 res!47927) b!57708))

(assert (= (and b!57708 (not res!47928)) b!57709))

(assert (=> b!57707 m!90943))

(assert (=> b!57707 m!90943))

(assert (=> b!57709 m!90943))

(assert (=> b!57709 m!90943))

(declare-fun m!91027 () Bool)

(assert (=> b!57709 m!91027))

(assert (=> b!57665 d!18400))

(declare-fun d!18402 () Bool)

(assert (=> d!18402 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!91216 () Unit!3987)

(declare-fun choose!11 (BitStream!2076) Unit!3987)

(assert (=> d!18402 (= lt!91216 (choose!11 thiss!1379))))

(assert (=> d!18402 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!91216)))

(declare-fun bs!4579 () Bool)

(assert (= bs!4579 d!18402))

(assert (=> bs!4579 m!90939))

(declare-fun m!91029 () Bool)

(assert (=> bs!4579 m!91029))

(assert (=> b!57665 d!18402))

(declare-fun d!18404 () Bool)

(declare-fun e!38285 () Bool)

(assert (=> d!18404 e!38285))

(declare-fun res!47934 () Bool)

(assert (=> d!18404 (=> (not res!47934) (not e!38285))))

(declare-fun lt!91232 () (_ BitVec 64))

(declare-fun lt!91230 () (_ BitVec 64))

(declare-fun lt!91229 () (_ BitVec 64))

(assert (=> d!18404 (= res!47934 (= lt!91229 (bvsub lt!91230 lt!91232)))))

(assert (=> d!18404 (or (= (bvand lt!91230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91230 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91230 lt!91232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18404 (= lt!91232 (remainingBits!0 ((_ sign_extend 32) (size!1194 (buf!1572 thiss!1379))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379))))))

(declare-fun lt!91233 () (_ BitVec 64))

(declare-fun lt!91234 () (_ BitVec 64))

(assert (=> d!18404 (= lt!91230 (bvmul lt!91233 lt!91234))))

(assert (=> d!18404 (or (= lt!91233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91234 (bvsdiv (bvmul lt!91233 lt!91234) lt!91233)))))

(assert (=> d!18404 (= lt!91234 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18404 (= lt!91233 ((_ sign_extend 32) (size!1194 (buf!1572 thiss!1379))))))

(assert (=> d!18404 (= lt!91229 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3184 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3179 thiss!1379))))))

(assert (=> d!18404 (invariant!0 (currentBit!3179 thiss!1379) (currentByte!3184 thiss!1379) (size!1194 (buf!1572 thiss!1379)))))

(assert (=> d!18404 (= (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)) lt!91229)))

(declare-fun b!57714 () Bool)

(declare-fun res!47933 () Bool)

(assert (=> b!57714 (=> (not res!47933) (not e!38285))))

(assert (=> b!57714 (= res!47933 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91229))))

(declare-fun b!57715 () Bool)

(declare-fun lt!91231 () (_ BitVec 64))

(assert (=> b!57715 (= e!38285 (bvsle lt!91229 (bvmul lt!91231 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57715 (or (= lt!91231 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91231 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91231)))))

(assert (=> b!57715 (= lt!91231 ((_ sign_extend 32) (size!1194 (buf!1572 thiss!1379))))))

(assert (= (and d!18404 res!47934) b!57714))

(assert (= (and b!57714 res!47933) b!57715))

(declare-fun m!91031 () Bool)

(assert (=> d!18404 m!91031))

(declare-fun m!91033 () Bool)

(assert (=> d!18404 m!91033))

(assert (=> b!57665 d!18404))

(declare-fun d!18406 () Bool)

(assert (=> d!18406 (= (invariant!0 (currentBit!3179 (_2!2736 lt!91181)) (currentByte!3184 (_2!2736 lt!91181)) (size!1194 (buf!1572 (_2!2736 lt!91181)))) (and (bvsge (currentBit!3179 (_2!2736 lt!91181)) #b00000000000000000000000000000000) (bvslt (currentBit!3179 (_2!2736 lt!91181)) #b00000000000000000000000000001000) (bvsge (currentByte!3184 (_2!2736 lt!91181)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3184 (_2!2736 lt!91181)) (size!1194 (buf!1572 (_2!2736 lt!91181)))) (and (= (currentBit!3179 (_2!2736 lt!91181)) #b00000000000000000000000000000000) (= (currentByte!3184 (_2!2736 lt!91181)) (size!1194 (buf!1572 (_2!2736 lt!91181))))))))))

(assert (=> b!57670 d!18406))

(declare-fun d!18408 () Bool)

(assert (=> d!18408 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 thiss!1379))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1194 (buf!1572 thiss!1379))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4580 () Bool)

(assert (= bs!4580 d!18408))

(assert (=> bs!4580 m!91031))

(assert (=> b!57664 d!18408))

(declare-fun d!18410 () Bool)

(declare-fun res!47935 () Bool)

(declare-fun e!38287 () Bool)

(assert (=> d!18410 (=> (not res!47935) (not e!38287))))

(assert (=> d!18410 (= res!47935 (= (size!1194 (buf!1572 thiss!1379)) (size!1194 (buf!1572 (_2!2736 lt!91180)))))))

(assert (=> d!18410 (= (isPrefixOf!0 thiss!1379 (_2!2736 lt!91180)) e!38287)))

(declare-fun b!57716 () Bool)

(declare-fun res!47936 () Bool)

(assert (=> b!57716 (=> (not res!47936) (not e!38287))))

(assert (=> b!57716 (= res!47936 (bvsle (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)) (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180)))))))

(declare-fun b!57717 () Bool)

(declare-fun e!38286 () Bool)

(assert (=> b!57717 (= e!38287 e!38286)))

(declare-fun res!47937 () Bool)

(assert (=> b!57717 (=> res!47937 e!38286)))

(assert (=> b!57717 (= res!47937 (= (size!1194 (buf!1572 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57718 () Bool)

(assert (=> b!57718 (= e!38286 (arrayBitRangesEq!0 (buf!1572 thiss!1379) (buf!1572 (_2!2736 lt!91180)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379))))))

(assert (= (and d!18410 res!47935) b!57716))

(assert (= (and b!57716 res!47936) b!57717))

(assert (= (and b!57717 (not res!47937)) b!57718))

(assert (=> b!57716 m!90943))

(assert (=> b!57716 m!90973))

(assert (=> b!57718 m!90943))

(assert (=> b!57718 m!90943))

(declare-fun m!91035 () Bool)

(assert (=> b!57718 m!91035))

(assert (=> b!57661 d!18410))

(declare-fun d!18412 () Bool)

(assert (=> d!18412 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4581 () Bool)

(assert (= bs!4581 d!18412))

(declare-fun m!91037 () Bool)

(assert (=> bs!4581 m!91037))

(assert (=> b!57661 d!18412))

(declare-fun d!18414 () Bool)

(declare-fun e!38290 () Bool)

(assert (=> d!18414 e!38290))

(declare-fun res!47940 () Bool)

(assert (=> d!18414 (=> (not res!47940) (not e!38290))))

(assert (=> d!18414 (= res!47940 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!91237 () Unit!3987)

(declare-fun choose!27 (BitStream!2076 BitStream!2076 (_ BitVec 64) (_ BitVec 64)) Unit!3987)

(assert (=> d!18414 (= lt!91237 (choose!27 thiss!1379 (_2!2736 lt!91180) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18414 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18414 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2736 lt!91180) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91237)))

(declare-fun b!57721 () Bool)

(assert (=> b!57721 (= e!38290 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18414 res!47940) b!57721))

(declare-fun m!91039 () Bool)

(assert (=> d!18414 m!91039))

(assert (=> b!57721 m!90929))

(assert (=> b!57661 d!18414))

(declare-fun d!18416 () Bool)

(declare-fun e!38317 () Bool)

(assert (=> d!18416 e!38317))

(declare-fun res!47973 () Bool)

(assert (=> d!18416 (=> (not res!47973) (not e!38317))))

(declare-fun lt!91286 () tuple2!5250)

(assert (=> d!18416 (= res!47973 (= (size!1194 (buf!1572 (_2!2736 lt!91286))) (size!1194 (buf!1572 thiss!1379))))))

(declare-fun lt!91285 () (_ BitVec 8))

(declare-fun lt!91280 () array!2634)

(assert (=> d!18416 (= lt!91285 (select (arr!1755 lt!91280) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18416 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1194 lt!91280)))))

(assert (=> d!18416 (= lt!91280 (array!2635 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!91287 () tuple2!5250)

(assert (=> d!18416 (= lt!91286 (tuple2!5251 (_1!2736 lt!91287) (_2!2736 lt!91287)))))

(declare-fun lt!91283 () tuple2!5250)

(assert (=> d!18416 (= lt!91287 lt!91283)))

(declare-fun e!38314 () Bool)

(assert (=> d!18416 e!38314))

(declare-fun res!47969 () Bool)

(assert (=> d!18416 (=> (not res!47969) (not e!38314))))

(assert (=> d!18416 (= res!47969 (= (size!1194 (buf!1572 thiss!1379)) (size!1194 (buf!1572 (_2!2736 lt!91283)))))))

(declare-fun lt!91288 () Bool)

(declare-fun appendBit!0 (BitStream!2076 Bool) tuple2!5250)

(assert (=> d!18416 (= lt!91283 (appendBit!0 thiss!1379 lt!91288))))

(assert (=> d!18416 (= lt!91288 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1755 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18416 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18416 (= (appendBitFromByte!0 thiss!1379 (select (arr!1755 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!91286)))

(declare-fun b!57766 () Bool)

(declare-fun res!47968 () Bool)

(assert (=> b!57766 (=> (not res!47968) (not e!38314))))

(assert (=> b!57766 (= res!47968 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91283))) (currentByte!3184 (_2!2736 lt!91283)) (currentBit!3179 (_2!2736 lt!91283))) (bvadd (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!57767 () Bool)

(declare-fun res!47967 () Bool)

(assert (=> b!57767 (=> (not res!47967) (not e!38317))))

(declare-fun lt!91284 () (_ BitVec 64))

(declare-fun lt!91279 () (_ BitVec 64))

(assert (=> b!57767 (= res!47967 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91286))) (currentByte!3184 (_2!2736 lt!91286)) (currentBit!3179 (_2!2736 lt!91286))) (bvadd lt!91279 lt!91284)))))

(assert (=> b!57767 (or (not (= (bvand lt!91279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91284 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!91279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!91279 lt!91284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57767 (= lt!91284 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!57767 (= lt!91279 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)))))

(declare-fun b!57768 () Bool)

(declare-fun res!47970 () Bool)

(assert (=> b!57768 (=> (not res!47970) (not e!38314))))

(assert (=> b!57768 (= res!47970 (isPrefixOf!0 thiss!1379 (_2!2736 lt!91283)))))

(declare-fun b!57769 () Bool)

(declare-fun e!38316 () Bool)

(assert (=> b!57769 (= e!38314 e!38316)))

(declare-fun res!47966 () Bool)

(assert (=> b!57769 (=> (not res!47966) (not e!38316))))

(declare-datatypes ((tuple2!5258 0))(
  ( (tuple2!5259 (_1!2740 BitStream!2076) (_2!2740 Bool)) )
))
(declare-fun lt!91282 () tuple2!5258)

(assert (=> b!57769 (= res!47966 (and (= (_2!2740 lt!91282) lt!91288) (= (_1!2740 lt!91282) (_2!2736 lt!91283))))))

(declare-fun readBitPure!0 (BitStream!2076) tuple2!5258)

(declare-fun readerFrom!0 (BitStream!2076 (_ BitVec 32) (_ BitVec 32)) BitStream!2076)

(assert (=> b!57769 (= lt!91282 (readBitPure!0 (readerFrom!0 (_2!2736 lt!91283) (currentBit!3179 thiss!1379) (currentByte!3184 thiss!1379))))))

(declare-fun b!57770 () Bool)

(declare-fun e!38315 () Bool)

(declare-fun lt!91281 () tuple2!5258)

(assert (=> b!57770 (= e!38315 (= (bitIndex!0 (size!1194 (buf!1572 (_1!2740 lt!91281))) (currentByte!3184 (_1!2740 lt!91281)) (currentBit!3179 (_1!2740 lt!91281))) (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91286))) (currentByte!3184 (_2!2736 lt!91286)) (currentBit!3179 (_2!2736 lt!91286)))))))

(declare-fun b!57771 () Bool)

(assert (=> b!57771 (= e!38316 (= (bitIndex!0 (size!1194 (buf!1572 (_1!2740 lt!91282))) (currentByte!3184 (_1!2740 lt!91282)) (currentBit!3179 (_1!2740 lt!91282))) (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91283))) (currentByte!3184 (_2!2736 lt!91283)) (currentBit!3179 (_2!2736 lt!91283)))))))

(declare-fun b!57772 () Bool)

(declare-fun res!47971 () Bool)

(assert (=> b!57772 (=> (not res!47971) (not e!38317))))

(assert (=> b!57772 (= res!47971 (isPrefixOf!0 thiss!1379 (_2!2736 lt!91286)))))

(declare-fun b!57773 () Bool)

(assert (=> b!57773 (= e!38317 e!38315)))

(declare-fun res!47972 () Bool)

(assert (=> b!57773 (=> (not res!47972) (not e!38315))))

(assert (=> b!57773 (= res!47972 (and (= (_2!2740 lt!91281) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1755 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!91285)) #b00000000000000000000000000000000))) (= (_1!2740 lt!91281) (_2!2736 lt!91286))))))

(declare-datatypes ((tuple2!5260 0))(
  ( (tuple2!5261 (_1!2741 array!2634) (_2!2741 BitStream!2076)) )
))
(declare-fun lt!91278 () tuple2!5260)

(declare-fun lt!91277 () BitStream!2076)

(declare-fun readBits!0 (BitStream!2076 (_ BitVec 64)) tuple2!5260)

(assert (=> b!57773 (= lt!91278 (readBits!0 lt!91277 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!57773 (= lt!91281 (readBitPure!0 lt!91277))))

(assert (=> b!57773 (= lt!91277 (readerFrom!0 (_2!2736 lt!91286) (currentBit!3179 thiss!1379) (currentByte!3184 thiss!1379)))))

(assert (= (and d!18416 res!47969) b!57766))

(assert (= (and b!57766 res!47968) b!57768))

(assert (= (and b!57768 res!47970) b!57769))

(assert (= (and b!57769 res!47966) b!57771))

(assert (= (and d!18416 res!47973) b!57767))

(assert (= (and b!57767 res!47967) b!57772))

(assert (= (and b!57772 res!47971) b!57773))

(assert (= (and b!57773 res!47972) b!57770))

(declare-fun m!91061 () Bool)

(assert (=> b!57770 m!91061))

(declare-fun m!91063 () Bool)

(assert (=> b!57770 m!91063))

(declare-fun m!91065 () Bool)

(assert (=> b!57772 m!91065))

(declare-fun m!91067 () Bool)

(assert (=> b!57773 m!91067))

(declare-fun m!91069 () Bool)

(assert (=> b!57773 m!91069))

(declare-fun m!91071 () Bool)

(assert (=> b!57773 m!91071))

(declare-fun m!91073 () Bool)

(assert (=> b!57768 m!91073))

(declare-fun m!91075 () Bool)

(assert (=> b!57769 m!91075))

(assert (=> b!57769 m!91075))

(declare-fun m!91077 () Bool)

(assert (=> b!57769 m!91077))

(declare-fun m!91079 () Bool)

(assert (=> b!57771 m!91079))

(declare-fun m!91081 () Bool)

(assert (=> b!57771 m!91081))

(declare-fun m!91083 () Bool)

(assert (=> d!18416 m!91083))

(declare-fun m!91085 () Bool)

(assert (=> d!18416 m!91085))

(declare-fun m!91087 () Bool)

(assert (=> d!18416 m!91087))

(assert (=> b!57767 m!91063))

(assert (=> b!57767 m!90943))

(assert (=> b!57766 m!91081))

(assert (=> b!57766 m!90943))

(assert (=> b!57661 d!18416))

(declare-fun d!18442 () Bool)

(declare-fun e!38318 () Bool)

(assert (=> d!18442 e!38318))

(declare-fun res!47975 () Bool)

(assert (=> d!18442 (=> (not res!47975) (not e!38318))))

(declare-fun lt!91292 () (_ BitVec 64))

(declare-fun lt!91289 () (_ BitVec 64))

(declare-fun lt!91290 () (_ BitVec 64))

(assert (=> d!18442 (= res!47975 (= lt!91289 (bvsub lt!91290 lt!91292)))))

(assert (=> d!18442 (or (= (bvand lt!91290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91292 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91290 lt!91292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18442 (= lt!91292 (remainingBits!0 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91181)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91181))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91181)))))))

(declare-fun lt!91293 () (_ BitVec 64))

(declare-fun lt!91294 () (_ BitVec 64))

(assert (=> d!18442 (= lt!91290 (bvmul lt!91293 lt!91294))))

(assert (=> d!18442 (or (= lt!91293 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91294 (bvsdiv (bvmul lt!91293 lt!91294) lt!91293)))))

(assert (=> d!18442 (= lt!91294 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18442 (= lt!91293 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91181)))))))

(assert (=> d!18442 (= lt!91289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91181))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91181)))))))

(assert (=> d!18442 (invariant!0 (currentBit!3179 (_2!2736 lt!91181)) (currentByte!3184 (_2!2736 lt!91181)) (size!1194 (buf!1572 (_2!2736 lt!91181))))))

(assert (=> d!18442 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91181))) (currentByte!3184 (_2!2736 lt!91181)) (currentBit!3179 (_2!2736 lt!91181))) lt!91289)))

(declare-fun b!57774 () Bool)

(declare-fun res!47974 () Bool)

(assert (=> b!57774 (=> (not res!47974) (not e!38318))))

(assert (=> b!57774 (= res!47974 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91289))))

(declare-fun b!57775 () Bool)

(declare-fun lt!91291 () (_ BitVec 64))

(assert (=> b!57775 (= e!38318 (bvsle lt!91289 (bvmul lt!91291 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57775 (or (= lt!91291 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91291 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91291)))))

(assert (=> b!57775 (= lt!91291 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91181)))))))

(assert (= (and d!18442 res!47975) b!57774))

(assert (= (and b!57774 res!47974) b!57775))

(declare-fun m!91089 () Bool)

(assert (=> d!18442 m!91089))

(assert (=> d!18442 m!90937))

(assert (=> b!57666 d!18442))

(declare-fun d!18444 () Bool)

(assert (=> d!18444 (= (array_inv!1097 srcBuffer!2) (bvsge (size!1194 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11684 d!18444))

(declare-fun d!18446 () Bool)

(assert (=> d!18446 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3179 thiss!1379) (currentByte!3184 thiss!1379) (size!1194 (buf!1572 thiss!1379))))))

(declare-fun bs!4585 () Bool)

(assert (= bs!4585 d!18446))

(assert (=> bs!4585 m!91033))

(assert (=> start!11684 d!18446))

(declare-fun d!18448 () Bool)

(assert (=> d!18448 (= (array_inv!1097 (buf!1572 thiss!1379)) (bvsge (size!1194 (buf!1572 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!57662 d!18448))

(declare-fun d!18450 () Bool)

(declare-fun e!38319 () Bool)

(assert (=> d!18450 e!38319))

(declare-fun res!47977 () Bool)

(assert (=> d!18450 (=> (not res!47977) (not e!38319))))

(declare-fun lt!91296 () (_ BitVec 64))

(declare-fun lt!91298 () (_ BitVec 64))

(declare-fun lt!91295 () (_ BitVec 64))

(assert (=> d!18450 (= res!47977 (= lt!91295 (bvsub lt!91296 lt!91298)))))

(assert (=> d!18450 (or (= (bvand lt!91296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91296 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91296 lt!91298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18450 (= lt!91298 (remainingBits!0 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180)))))))

(declare-fun lt!91299 () (_ BitVec 64))

(declare-fun lt!91300 () (_ BitVec 64))

(assert (=> d!18450 (= lt!91296 (bvmul lt!91299 lt!91300))))

(assert (=> d!18450 (or (= lt!91299 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91300 (bvsdiv (bvmul lt!91299 lt!91300) lt!91299)))))

(assert (=> d!18450 (= lt!91300 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18450 (= lt!91299 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))))))

(assert (=> d!18450 (= lt!91295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180)))))))

(assert (=> d!18450 (invariant!0 (currentBit!3179 (_2!2736 lt!91180)) (currentByte!3184 (_2!2736 lt!91180)) (size!1194 (buf!1572 (_2!2736 lt!91180))))))

(assert (=> d!18450 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))) lt!91295)))

(declare-fun b!57776 () Bool)

(declare-fun res!47976 () Bool)

(assert (=> b!57776 (=> (not res!47976) (not e!38319))))

(assert (=> b!57776 (= res!47976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91295))))

(declare-fun b!57777 () Bool)

(declare-fun lt!91297 () (_ BitVec 64))

(assert (=> b!57777 (= e!38319 (bvsle lt!91295 (bvmul lt!91297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57777 (or (= lt!91297 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91297 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91297)))))

(assert (=> b!57777 (= lt!91297 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))))))

(assert (= (and d!18450 res!47977) b!57776))

(assert (= (and b!57776 res!47976) b!57777))

(assert (=> d!18450 m!91037))

(declare-fun m!91091 () Bool)

(assert (=> d!18450 m!91091))

(assert (=> b!57667 d!18450))

(declare-fun b!57803 () Bool)

(declare-fun res!47993 () Bool)

(declare-fun e!38330 () Bool)

(assert (=> b!57803 (=> (not res!47993) (not e!38330))))

(declare-fun lt!91404 () tuple2!5252)

(assert (=> b!57803 (= res!47993 (isPrefixOf!0 (_1!2737 lt!91404) thiss!1379))))

(declare-fun d!18452 () Bool)

(assert (=> d!18452 e!38330))

(declare-fun res!47995 () Bool)

(assert (=> d!18452 (=> (not res!47995) (not e!38330))))

(assert (=> d!18452 (= res!47995 (isPrefixOf!0 (_1!2737 lt!91404) (_2!2737 lt!91404)))))

(declare-fun lt!91401 () BitStream!2076)

(assert (=> d!18452 (= lt!91404 (tuple2!5253 lt!91401 (_2!2736 lt!91180)))))

(declare-fun lt!91406 () Unit!3987)

(declare-fun lt!91420 () Unit!3987)

(assert (=> d!18452 (= lt!91406 lt!91420)))

(assert (=> d!18452 (isPrefixOf!0 lt!91401 (_2!2736 lt!91180))))

(assert (=> d!18452 (= lt!91420 (lemmaIsPrefixTransitive!0 lt!91401 (_2!2736 lt!91180) (_2!2736 lt!91180)))))

(declare-fun lt!91412 () Unit!3987)

(declare-fun lt!91408 () Unit!3987)

(assert (=> d!18452 (= lt!91412 lt!91408)))

(assert (=> d!18452 (isPrefixOf!0 lt!91401 (_2!2736 lt!91180))))

(assert (=> d!18452 (= lt!91408 (lemmaIsPrefixTransitive!0 lt!91401 thiss!1379 (_2!2736 lt!91180)))))

(declare-fun lt!91413 () Unit!3987)

(declare-fun e!38331 () Unit!3987)

(assert (=> d!18452 (= lt!91413 e!38331)))

(declare-fun c!4197 () Bool)

(assert (=> d!18452 (= c!4197 (not (= (size!1194 (buf!1572 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!91417 () Unit!3987)

(declare-fun lt!91416 () Unit!3987)

(assert (=> d!18452 (= lt!91417 lt!91416)))

(assert (=> d!18452 (isPrefixOf!0 (_2!2736 lt!91180) (_2!2736 lt!91180))))

(assert (=> d!18452 (= lt!91416 (lemmaIsPrefixRefl!0 (_2!2736 lt!91180)))))

(declare-fun lt!91402 () Unit!3987)

(declare-fun lt!91405 () Unit!3987)

(assert (=> d!18452 (= lt!91402 lt!91405)))

(assert (=> d!18452 (= lt!91405 (lemmaIsPrefixRefl!0 (_2!2736 lt!91180)))))

(declare-fun lt!91409 () Unit!3987)

(declare-fun lt!91419 () Unit!3987)

(assert (=> d!18452 (= lt!91409 lt!91419)))

(assert (=> d!18452 (isPrefixOf!0 lt!91401 lt!91401)))

(assert (=> d!18452 (= lt!91419 (lemmaIsPrefixRefl!0 lt!91401))))

(declare-fun lt!91414 () Unit!3987)

(declare-fun lt!91407 () Unit!3987)

(assert (=> d!18452 (= lt!91414 lt!91407)))

(assert (=> d!18452 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18452 (= lt!91407 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18452 (= lt!91401 (BitStream!2077 (buf!1572 (_2!2736 lt!91180)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)))))

(assert (=> d!18452 (isPrefixOf!0 thiss!1379 (_2!2736 lt!91180))))

(assert (=> d!18452 (= (reader!0 thiss!1379 (_2!2736 lt!91180)) lt!91404)))

(declare-fun b!57804 () Bool)

(declare-fun lt!91410 () Unit!3987)

(assert (=> b!57804 (= e!38331 lt!91410)))

(declare-fun lt!91418 () (_ BitVec 64))

(assert (=> b!57804 (= lt!91418 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91403 () (_ BitVec 64))

(assert (=> b!57804 (= lt!91403 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2634 array!2634 (_ BitVec 64) (_ BitVec 64)) Unit!3987)

(assert (=> b!57804 (= lt!91410 (arrayBitRangesEqSymmetric!0 (buf!1572 thiss!1379) (buf!1572 (_2!2736 lt!91180)) lt!91418 lt!91403))))

(assert (=> b!57804 (arrayBitRangesEq!0 (buf!1572 (_2!2736 lt!91180)) (buf!1572 thiss!1379) lt!91418 lt!91403)))

(declare-fun b!57805 () Bool)

(declare-fun Unit!3991 () Unit!3987)

(assert (=> b!57805 (= e!38331 Unit!3991)))

(declare-fun lt!91411 () (_ BitVec 64))

(declare-fun b!57806 () Bool)

(declare-fun lt!91415 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2076 (_ BitVec 64)) BitStream!2076)

(assert (=> b!57806 (= e!38330 (= (_1!2737 lt!91404) (withMovedBitIndex!0 (_2!2737 lt!91404) (bvsub lt!91415 lt!91411))))))

(assert (=> b!57806 (or (= (bvand lt!91415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91411 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91415 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91415 lt!91411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57806 (= lt!91411 (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))))))

(assert (=> b!57806 (= lt!91415 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)))))

(declare-fun b!57807 () Bool)

(declare-fun res!47994 () Bool)

(assert (=> b!57807 (=> (not res!47994) (not e!38330))))

(assert (=> b!57807 (= res!47994 (isPrefixOf!0 (_2!2737 lt!91404) (_2!2736 lt!91180)))))

(assert (= (and d!18452 c!4197) b!57804))

(assert (= (and d!18452 (not c!4197)) b!57805))

(assert (= (and d!18452 res!47995) b!57803))

(assert (= (and b!57803 res!47993) b!57807))

(assert (= (and b!57807 res!47994) b!57806))

(declare-fun m!91119 () Bool)

(assert (=> b!57803 m!91119))

(assert (=> b!57804 m!90943))

(declare-fun m!91121 () Bool)

(assert (=> b!57804 m!91121))

(declare-fun m!91123 () Bool)

(assert (=> b!57804 m!91123))

(declare-fun m!91125 () Bool)

(assert (=> b!57806 m!91125))

(assert (=> b!57806 m!90973))

(assert (=> b!57806 m!90943))

(assert (=> d!18452 m!90939))

(declare-fun m!91127 () Bool)

(assert (=> d!18452 m!91127))

(declare-fun m!91129 () Bool)

(assert (=> d!18452 m!91129))

(declare-fun m!91131 () Bool)

(assert (=> d!18452 m!91131))

(declare-fun m!91133 () Bool)

(assert (=> d!18452 m!91133))

(declare-fun m!91135 () Bool)

(assert (=> d!18452 m!91135))

(declare-fun m!91137 () Bool)

(assert (=> d!18452 m!91137))

(declare-fun m!91139 () Bool)

(assert (=> d!18452 m!91139))

(assert (=> d!18452 m!90941))

(assert (=> d!18452 m!90927))

(declare-fun m!91141 () Bool)

(assert (=> d!18452 m!91141))

(declare-fun m!91143 () Bool)

(assert (=> b!57807 m!91143))

(assert (=> b!57663 d!18452))

(declare-fun d!18456 () Bool)

(assert (=> d!18456 (isPrefixOf!0 thiss!1379 (_2!2736 lt!91181))))

(declare-fun lt!91423 () Unit!3987)

(declare-fun choose!30 (BitStream!2076 BitStream!2076 BitStream!2076) Unit!3987)

(assert (=> d!18456 (= lt!91423 (choose!30 thiss!1379 (_2!2736 lt!91180) (_2!2736 lt!91181)))))

(assert (=> d!18456 (isPrefixOf!0 thiss!1379 (_2!2736 lt!91180))))

(assert (=> d!18456 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2736 lt!91180) (_2!2736 lt!91181)) lt!91423)))

(declare-fun bs!4586 () Bool)

(assert (= bs!4586 d!18456))

(assert (=> bs!4586 m!90949))

(declare-fun m!91145 () Bool)

(assert (=> bs!4586 m!91145))

(assert (=> bs!4586 m!90927))

(assert (=> b!57663 d!18456))

(declare-fun b!57878 () Bool)

(declare-fun res!48053 () Bool)

(declare-fun e!38360 () Bool)

(assert (=> b!57878 (=> (not res!48053) (not e!38360))))

(declare-fun lt!91812 () tuple2!5250)

(assert (=> b!57878 (= res!48053 (= (size!1194 (buf!1572 (_2!2736 lt!91812))) (size!1194 (buf!1572 (_2!2736 lt!91180)))))))

(declare-fun b!57879 () Bool)

(declare-fun res!48052 () Bool)

(assert (=> b!57879 (=> (not res!48052) (not e!38360))))

(assert (=> b!57879 (= res!48052 (invariant!0 (currentBit!3179 (_2!2736 lt!91812)) (currentByte!3184 (_2!2736 lt!91812)) (size!1194 (buf!1572 (_2!2736 lt!91812)))))))

(declare-fun b!57880 () Bool)

(declare-fun res!48055 () Bool)

(assert (=> b!57880 (=> (not res!48055) (not e!38360))))

(assert (=> b!57880 (= res!48055 (isPrefixOf!0 (_2!2736 lt!91180) (_2!2736 lt!91812)))))

(declare-fun b!57881 () Bool)

(declare-fun e!38362 () tuple2!5250)

(declare-fun lt!91797 () tuple2!5250)

(declare-fun Unit!3992 () Unit!3987)

(assert (=> b!57881 (= e!38362 (tuple2!5251 Unit!3992 (_2!2736 lt!91797)))))

(declare-fun lt!91789 () tuple2!5250)

(assert (=> b!57881 (= lt!91789 (appendBitFromByte!0 (_2!2736 lt!91180) (select (arr!1755 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!91785 () (_ BitVec 64))

(assert (=> b!57881 (= lt!91785 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91793 () (_ BitVec 64))

(assert (=> b!57881 (= lt!91793 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91815 () Unit!3987)

(assert (=> b!57881 (= lt!91815 (validateOffsetBitsIneqLemma!0 (_2!2736 lt!91180) (_2!2736 lt!91789) lt!91785 lt!91793))))

(assert (=> b!57881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91789)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91789))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91789))) (bvsub lt!91785 lt!91793))))

(declare-fun lt!91810 () Unit!3987)

(assert (=> b!57881 (= lt!91810 lt!91815)))

(declare-fun lt!91801 () tuple2!5252)

(assert (=> b!57881 (= lt!91801 (reader!0 (_2!2736 lt!91180) (_2!2736 lt!91789)))))

(declare-fun lt!91783 () (_ BitVec 64))

(assert (=> b!57881 (= lt!91783 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91820 () Unit!3987)

(assert (=> b!57881 (= lt!91820 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2736 lt!91180) (buf!1572 (_2!2736 lt!91789)) lt!91783))))

(assert (=> b!57881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91789)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) lt!91783)))

(declare-fun lt!91814 () Unit!3987)

(assert (=> b!57881 (= lt!91814 lt!91820)))

(assert (=> b!57881 (= (head!432 (byteArrayBitContentToList!0 (_2!2736 lt!91789) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!432 (bitStreamReadBitsIntoList!0 (_2!2736 lt!91789) (_1!2737 lt!91801) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91786 () Unit!3987)

(declare-fun Unit!3993 () Unit!3987)

(assert (=> b!57881 (= lt!91786 Unit!3993)))

(assert (=> b!57881 (= lt!91797 (appendBitsMSBFirstLoop!0 (_2!2736 lt!91789) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!91788 () Unit!3987)

(assert (=> b!57881 (= lt!91788 (lemmaIsPrefixTransitive!0 (_2!2736 lt!91180) (_2!2736 lt!91789) (_2!2736 lt!91797)))))

(assert (=> b!57881 (isPrefixOf!0 (_2!2736 lt!91180) (_2!2736 lt!91797))))

(declare-fun lt!91813 () Unit!3987)

(assert (=> b!57881 (= lt!91813 lt!91788)))

(assert (=> b!57881 (= (size!1194 (buf!1572 (_2!2736 lt!91797))) (size!1194 (buf!1572 (_2!2736 lt!91180))))))

(declare-fun lt!91809 () Unit!3987)

(declare-fun Unit!3994 () Unit!3987)

(assert (=> b!57881 (= lt!91809 Unit!3994)))

(assert (=> b!57881 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91797))) (currentByte!3184 (_2!2736 lt!91797)) (currentBit!3179 (_2!2736 lt!91797))) (bvsub (bvadd (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91787 () Unit!3987)

(declare-fun Unit!3995 () Unit!3987)

(assert (=> b!57881 (= lt!91787 Unit!3995)))

(assert (=> b!57881 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91797))) (currentByte!3184 (_2!2736 lt!91797)) (currentBit!3179 (_2!2736 lt!91797))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91789))) (currentByte!3184 (_2!2736 lt!91789)) (currentBit!3179 (_2!2736 lt!91789))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91795 () Unit!3987)

(declare-fun Unit!3996 () Unit!3987)

(assert (=> b!57881 (= lt!91795 Unit!3996)))

(declare-fun lt!91817 () tuple2!5252)

(declare-fun call!763 () tuple2!5252)

(assert (=> b!57881 (= lt!91817 call!763)))

(declare-fun lt!91798 () (_ BitVec 64))

(assert (=> b!57881 (= lt!91798 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91790 () Unit!3987)

(assert (=> b!57881 (= lt!91790 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2736 lt!91180) (buf!1572 (_2!2736 lt!91797)) lt!91798))))

(assert (=> b!57881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91797)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) lt!91798)))

(declare-fun lt!91780 () Unit!3987)

(assert (=> b!57881 (= lt!91780 lt!91790)))

(declare-fun lt!91808 () tuple2!5252)

(assert (=> b!57881 (= lt!91808 (reader!0 (_2!2736 lt!91789) (_2!2736 lt!91797)))))

(declare-fun lt!91807 () (_ BitVec 64))

(assert (=> b!57881 (= lt!91807 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91803 () Unit!3987)

(assert (=> b!57881 (= lt!91803 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2736 lt!91789) (buf!1572 (_2!2736 lt!91797)) lt!91807))))

(assert (=> b!57881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91797)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91789))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91789))) lt!91807)))

(declare-fun lt!91781 () Unit!3987)

(assert (=> b!57881 (= lt!91781 lt!91803)))

(declare-fun lt!91802 () List!613)

(assert (=> b!57881 (= lt!91802 (byteArrayBitContentToList!0 (_2!2736 lt!91797) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!91794 () List!613)

(assert (=> b!57881 (= lt!91794 (byteArrayBitContentToList!0 (_2!2736 lt!91797) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91805 () List!613)

(assert (=> b!57881 (= lt!91805 (bitStreamReadBitsIntoList!0 (_2!2736 lt!91797) (_1!2737 lt!91817) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!91822 () List!613)

(assert (=> b!57881 (= lt!91822 (bitStreamReadBitsIntoList!0 (_2!2736 lt!91797) (_1!2737 lt!91808) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91816 () (_ BitVec 64))

(assert (=> b!57881 (= lt!91816 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91804 () Unit!3987)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2076 BitStream!2076 BitStream!2076 BitStream!2076 (_ BitVec 64) List!613) Unit!3987)

(assert (=> b!57881 (= lt!91804 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2736 lt!91797) (_2!2736 lt!91797) (_1!2737 lt!91817) (_1!2737 lt!91808) lt!91816 lt!91805))))

(declare-fun tail!279 (List!613) List!613)

(assert (=> b!57881 (= (bitStreamReadBitsIntoList!0 (_2!2736 lt!91797) (_1!2737 lt!91808) (bvsub lt!91816 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!279 lt!91805))))

(declare-fun lt!91779 () Unit!3987)

(assert (=> b!57881 (= lt!91779 lt!91804)))

(declare-fun lt!91782 () Unit!3987)

(declare-fun lt!91800 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2634 array!2634 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3987)

(assert (=> b!57881 (= lt!91782 (arrayBitRangesEqImpliesEq!0 (buf!1572 (_2!2736 lt!91789)) (buf!1572 (_2!2736 lt!91797)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!91800 (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91789))) (currentByte!3184 (_2!2736 lt!91789)) (currentBit!3179 (_2!2736 lt!91789)))))))

(declare-fun bitAt!0 (array!2634 (_ BitVec 64)) Bool)

(assert (=> b!57881 (= (bitAt!0 (buf!1572 (_2!2736 lt!91789)) lt!91800) (bitAt!0 (buf!1572 (_2!2736 lt!91797)) lt!91800))))

(declare-fun lt!91818 () Unit!3987)

(assert (=> b!57881 (= lt!91818 lt!91782)))

(declare-fun b!57882 () Bool)

(declare-fun lt!91791 () tuple2!5252)

(assert (=> b!57882 (= e!38360 (= (bitStreamReadBitsIntoList!0 (_2!2736 lt!91812) (_1!2737 lt!91791) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2736 lt!91812) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57882 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57882 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!91819 () Unit!3987)

(declare-fun lt!91811 () Unit!3987)

(assert (=> b!57882 (= lt!91819 lt!91811)))

(declare-fun lt!91821 () (_ BitVec 64))

(assert (=> b!57882 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91812)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) lt!91821)))

(assert (=> b!57882 (= lt!91811 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2736 lt!91180) (buf!1572 (_2!2736 lt!91812)) lt!91821))))

(declare-fun e!38361 () Bool)

(assert (=> b!57882 e!38361))

(declare-fun res!48054 () Bool)

(assert (=> b!57882 (=> (not res!48054) (not e!38361))))

(assert (=> b!57882 (= res!48054 (and (= (size!1194 (buf!1572 (_2!2736 lt!91180))) (size!1194 (buf!1572 (_2!2736 lt!91812)))) (bvsge lt!91821 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57882 (= lt!91821 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57882 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57882 (= lt!91791 (reader!0 (_2!2736 lt!91180) (_2!2736 lt!91812)))))

(declare-fun b!57883 () Bool)

(declare-fun res!48051 () Bool)

(assert (=> b!57883 (=> (not res!48051) (not e!38360))))

(assert (=> b!57883 (= res!48051 (= (size!1194 (buf!1572 (_2!2736 lt!91180))) (size!1194 (buf!1572 (_2!2736 lt!91812)))))))

(declare-fun c!4206 () Bool)

(declare-fun bm!760 () Bool)

(assert (=> bm!760 (= call!763 (reader!0 (_2!2736 lt!91180) (ite c!4206 (_2!2736 lt!91797) (_2!2736 lt!91180))))))

(declare-fun d!18458 () Bool)

(assert (=> d!18458 e!38360))

(declare-fun res!48050 () Bool)

(assert (=> d!18458 (=> (not res!48050) (not e!38360))))

(declare-fun lt!91806 () (_ BitVec 64))

(assert (=> d!18458 (= res!48050 (= (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91812))) (currentByte!3184 (_2!2736 lt!91812)) (currentBit!3179 (_2!2736 lt!91812))) (bvsub lt!91806 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18458 (or (= (bvand lt!91806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91806 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91806 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!91792 () (_ BitVec 64))

(assert (=> d!18458 (= lt!91806 (bvadd lt!91792 to!314))))

(assert (=> d!18458 (or (not (= (bvand lt!91792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!91792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!91792 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18458 (= lt!91792 (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))))))

(assert (=> d!18458 (= lt!91812 e!38362)))

(assert (=> d!18458 (= c!4206 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!91799 () Unit!3987)

(declare-fun lt!91784 () Unit!3987)

(assert (=> d!18458 (= lt!91799 lt!91784)))

(assert (=> d!18458 (isPrefixOf!0 (_2!2736 lt!91180) (_2!2736 lt!91180))))

(assert (=> d!18458 (= lt!91784 (lemmaIsPrefixRefl!0 (_2!2736 lt!91180)))))

(assert (=> d!18458 (= lt!91800 (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))))))

(assert (=> d!18458 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18458 (= (appendBitsMSBFirstLoop!0 (_2!2736 lt!91180) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!91812)))

(declare-fun b!57884 () Bool)

(declare-fun Unit!3997 () Unit!3987)

(assert (=> b!57884 (= e!38362 (tuple2!5251 Unit!3997 (_2!2736 lt!91180)))))

(assert (=> b!57884 (= (size!1194 (buf!1572 (_2!2736 lt!91180))) (size!1194 (buf!1572 (_2!2736 lt!91180))))))

(declare-fun lt!91796 () Unit!3987)

(declare-fun Unit!3998 () Unit!3987)

(assert (=> b!57884 (= lt!91796 Unit!3998)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2076 array!2634 array!2634 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57884 (checkByteArrayBitContent!0 (_2!2736 lt!91180) srcBuffer!2 (_1!2741 (readBits!0 (_1!2737 call!763) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!57885 () Bool)

(assert (=> b!57885 (= e!38361 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 (_2!2736 lt!91180))) ((_ sign_extend 32) (currentBit!3179 (_2!2736 lt!91180))) lt!91821))))

(assert (= (and d!18458 c!4206) b!57881))

(assert (= (and d!18458 (not c!4206)) b!57884))

(assert (= (or b!57881 b!57884) bm!760))

(assert (= (and d!18458 res!48050) b!57879))

(assert (= (and b!57879 res!48052) b!57883))

(assert (= (and b!57883 res!48051) b!57880))

(assert (= (and b!57880 res!48055) b!57878))

(assert (= (and b!57878 res!48053) b!57882))

(assert (= (and b!57882 res!48054) b!57885))

(declare-fun m!91339 () Bool)

(assert (=> b!57881 m!91339))

(declare-fun m!91341 () Bool)

(assert (=> b!57881 m!91341))

(declare-fun m!91343 () Bool)

(assert (=> b!57881 m!91343))

(declare-fun m!91345 () Bool)

(assert (=> b!57881 m!91345))

(declare-fun m!91347 () Bool)

(assert (=> b!57881 m!91347))

(declare-fun m!91349 () Bool)

(assert (=> b!57881 m!91349))

(declare-fun m!91351 () Bool)

(assert (=> b!57881 m!91351))

(declare-fun m!91353 () Bool)

(assert (=> b!57881 m!91353))

(declare-fun m!91355 () Bool)

(assert (=> b!57881 m!91355))

(assert (=> b!57881 m!90973))

(declare-fun m!91357 () Bool)

(assert (=> b!57881 m!91357))

(declare-fun m!91359 () Bool)

(assert (=> b!57881 m!91359))

(declare-fun m!91361 () Bool)

(assert (=> b!57881 m!91361))

(declare-fun m!91363 () Bool)

(assert (=> b!57881 m!91363))

(declare-fun m!91365 () Bool)

(assert (=> b!57881 m!91365))

(declare-fun m!91367 () Bool)

(assert (=> b!57881 m!91367))

(declare-fun m!91369 () Bool)

(assert (=> b!57881 m!91369))

(declare-fun m!91371 () Bool)

(assert (=> b!57881 m!91371))

(declare-fun m!91373 () Bool)

(assert (=> b!57881 m!91373))

(declare-fun m!91375 () Bool)

(assert (=> b!57881 m!91375))

(declare-fun m!91377 () Bool)

(assert (=> b!57881 m!91377))

(declare-fun m!91379 () Bool)

(assert (=> b!57881 m!91379))

(declare-fun m!91381 () Bool)

(assert (=> b!57881 m!91381))

(assert (=> b!57881 m!91379))

(declare-fun m!91383 () Bool)

(assert (=> b!57881 m!91383))

(declare-fun m!91385 () Bool)

(assert (=> b!57881 m!91385))

(assert (=> b!57881 m!91349))

(declare-fun m!91387 () Bool)

(assert (=> b!57881 m!91387))

(declare-fun m!91389 () Bool)

(assert (=> b!57881 m!91389))

(assert (=> b!57881 m!91359))

(declare-fun m!91391 () Bool)

(assert (=> b!57881 m!91391))

(declare-fun m!91393 () Bool)

(assert (=> b!57881 m!91393))

(declare-fun m!91395 () Bool)

(assert (=> b!57881 m!91395))

(declare-fun m!91397 () Bool)

(assert (=> b!57881 m!91397))

(assert (=> b!57881 m!91339))

(declare-fun m!91399 () Bool)

(assert (=> b!57881 m!91399))

(declare-fun m!91401 () Bool)

(assert (=> b!57880 m!91401))

(declare-fun m!91403 () Bool)

(assert (=> bm!760 m!91403))

(declare-fun m!91405 () Bool)

(assert (=> d!18458 m!91405))

(assert (=> d!18458 m!90973))

(assert (=> d!18458 m!91129))

(assert (=> d!18458 m!91131))

(declare-fun m!91407 () Bool)

(assert (=> b!57879 m!91407))

(declare-fun m!91409 () Bool)

(assert (=> b!57885 m!91409))

(declare-fun m!91411 () Bool)

(assert (=> b!57882 m!91411))

(declare-fun m!91413 () Bool)

(assert (=> b!57882 m!91413))

(declare-fun m!91415 () Bool)

(assert (=> b!57882 m!91415))

(declare-fun m!91417 () Bool)

(assert (=> b!57882 m!91417))

(declare-fun m!91419 () Bool)

(assert (=> b!57882 m!91419))

(declare-fun m!91421 () Bool)

(assert (=> b!57884 m!91421))

(declare-fun m!91423 () Bool)

(assert (=> b!57884 m!91423))

(assert (=> b!57663 d!18458))

(declare-fun d!18480 () Bool)

(assert (=> d!18480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4592 () Bool)

(assert (= bs!4592 d!18480))

(declare-fun m!91425 () Bool)

(assert (=> bs!4592 m!91425))

(assert (=> b!57663 d!18480))

(declare-fun d!18482 () Bool)

(assert (=> d!18482 (validate_offset_bits!1 ((_ sign_extend 32) (size!1194 (buf!1572 (_2!2736 lt!91180)))) ((_ sign_extend 32) (currentByte!3184 thiss!1379)) ((_ sign_extend 32) (currentBit!3179 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91831 () Unit!3987)

(declare-fun choose!9 (BitStream!2076 array!2634 (_ BitVec 64) BitStream!2076) Unit!3987)

(assert (=> d!18482 (= lt!91831 (choose!9 thiss!1379 (buf!1572 (_2!2736 lt!91180)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2077 (buf!1572 (_2!2736 lt!91180)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379))))))

(assert (=> d!18482 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1572 (_2!2736 lt!91180)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91831)))

(declare-fun bs!4593 () Bool)

(assert (= bs!4593 d!18482))

(assert (=> bs!4593 m!90957))

(declare-fun m!91431 () Bool)

(assert (=> bs!4593 m!91431))

(assert (=> b!57663 d!18482))

(declare-fun d!18488 () Bool)

(declare-fun res!48071 () Bool)

(declare-fun e!38375 () Bool)

(assert (=> d!18488 (=> (not res!48071) (not e!38375))))

(assert (=> d!18488 (= res!48071 (= (size!1194 (buf!1572 thiss!1379)) (size!1194 (buf!1572 (_2!2736 lt!91181)))))))

(assert (=> d!18488 (= (isPrefixOf!0 thiss!1379 (_2!2736 lt!91181)) e!38375)))

(declare-fun b!57901 () Bool)

(declare-fun res!48072 () Bool)

(assert (=> b!57901 (=> (not res!48072) (not e!38375))))

(assert (=> b!57901 (= res!48072 (bvsle (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379)) (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91181))) (currentByte!3184 (_2!2736 lt!91181)) (currentBit!3179 (_2!2736 lt!91181)))))))

(declare-fun b!57902 () Bool)

(declare-fun e!38374 () Bool)

(assert (=> b!57902 (= e!38375 e!38374)))

(declare-fun res!48073 () Bool)

(assert (=> b!57902 (=> res!48073 e!38374)))

(assert (=> b!57902 (= res!48073 (= (size!1194 (buf!1572 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57903 () Bool)

(assert (=> b!57903 (= e!38374 (arrayBitRangesEq!0 (buf!1572 thiss!1379) (buf!1572 (_2!2736 lt!91181)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1194 (buf!1572 thiss!1379)) (currentByte!3184 thiss!1379) (currentBit!3179 thiss!1379))))))

(assert (= (and d!18488 res!48071) b!57901))

(assert (= (and b!57901 res!48072) b!57902))

(assert (= (and b!57902 (not res!48073)) b!57903))

(assert (=> b!57901 m!90943))

(assert (=> b!57901 m!90971))

(assert (=> b!57903 m!90943))

(assert (=> b!57903 m!90943))

(declare-fun m!91433 () Bool)

(assert (=> b!57903 m!91433))

(assert (=> b!57663 d!18488))

(declare-fun d!18490 () Bool)

(declare-fun res!48074 () Bool)

(declare-fun e!38377 () Bool)

(assert (=> d!18490 (=> (not res!48074) (not e!38377))))

(assert (=> d!18490 (= res!48074 (= (size!1194 (buf!1572 (_2!2736 lt!91180))) (size!1194 (buf!1572 (_2!2736 lt!91181)))))))

(assert (=> d!18490 (= (isPrefixOf!0 (_2!2736 lt!91180) (_2!2736 lt!91181)) e!38377)))

(declare-fun b!57904 () Bool)

(declare-fun res!48075 () Bool)

(assert (=> b!57904 (=> (not res!48075) (not e!38377))))

(assert (=> b!57904 (= res!48075 (bvsle (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180))) (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91181))) (currentByte!3184 (_2!2736 lt!91181)) (currentBit!3179 (_2!2736 lt!91181)))))))

(declare-fun b!57905 () Bool)

(declare-fun e!38376 () Bool)

(assert (=> b!57905 (= e!38377 e!38376)))

(declare-fun res!48076 () Bool)

(assert (=> b!57905 (=> res!48076 e!38376)))

(assert (=> b!57905 (= res!48076 (= (size!1194 (buf!1572 (_2!2736 lt!91180))) #b00000000000000000000000000000000))))

(declare-fun b!57906 () Bool)

(assert (=> b!57906 (= e!38376 (arrayBitRangesEq!0 (buf!1572 (_2!2736 lt!91180)) (buf!1572 (_2!2736 lt!91181)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1194 (buf!1572 (_2!2736 lt!91180))) (currentByte!3184 (_2!2736 lt!91180)) (currentBit!3179 (_2!2736 lt!91180)))))))

(assert (= (and d!18490 res!48074) b!57904))

(assert (= (and b!57904 res!48075) b!57905))

(assert (= (and b!57905 (not res!48076)) b!57906))

(assert (=> b!57904 m!90973))

(assert (=> b!57904 m!90971))

(assert (=> b!57906 m!90973))

(assert (=> b!57906 m!90973))

(declare-fun m!91435 () Bool)

(assert (=> b!57906 m!91435))

(assert (=> b!57663 d!18490))

(declare-fun d!18492 () Bool)

(assert (=> d!18492 (= (head!432 (byteArrayBitContentToList!0 (_2!2736 lt!91180) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!728 (byteArrayBitContentToList!0 (_2!2736 lt!91180) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57668 d!18492))

(declare-fun d!18494 () Bool)

(declare-fun c!4209 () Bool)

(assert (=> d!18494 (= c!4209 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38380 () List!613)

(assert (=> d!18494 (= (byteArrayBitContentToList!0 (_2!2736 lt!91180) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!38380)))

(declare-fun b!57911 () Bool)

(assert (=> b!57911 (= e!38380 Nil!610)))

(declare-fun b!57912 () Bool)

(assert (=> b!57912 (= e!38380 (Cons!609 (not (= (bvand ((_ sign_extend 24) (select (arr!1755 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2736 lt!91180) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18494 c!4209) b!57911))

(assert (= (and d!18494 (not c!4209)) b!57912))

(assert (=> b!57912 m!90923))

(assert (=> b!57912 m!91087))

(declare-fun m!91437 () Bool)

(assert (=> b!57912 m!91437))

(assert (=> b!57668 d!18494))

(declare-fun d!18496 () Bool)

(assert (=> d!18496 (= (head!432 (bitStreamReadBitsIntoList!0 (_2!2736 lt!91180) (_1!2737 lt!91186) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!728 (bitStreamReadBitsIntoList!0 (_2!2736 lt!91180) (_1!2737 lt!91186) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57668 d!18496))

(declare-fun d!18498 () Bool)

(declare-fun e!38385 () Bool)

(assert (=> d!18498 e!38385))

(declare-fun c!4214 () Bool)

(assert (=> d!18498 (= c!4214 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!91840 () List!613)

(declare-datatypes ((tuple2!5266 0))(
  ( (tuple2!5267 (_1!2744 List!613) (_2!2744 BitStream!2076)) )
))
(declare-fun e!38386 () tuple2!5266)

(assert (=> d!18498 (= lt!91840 (_1!2744 e!38386))))

(declare-fun c!4215 () Bool)

(assert (=> d!18498 (= c!4215 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18498 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18498 (= (bitStreamReadBitsIntoList!0 (_2!2736 lt!91180) (_1!2737 lt!91186) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91840)))

(declare-fun lt!91839 () (_ BitVec 64))

(declare-fun b!57922 () Bool)

(declare-datatypes ((tuple2!5268 0))(
  ( (tuple2!5269 (_1!2745 Bool) (_2!2745 BitStream!2076)) )
))
(declare-fun lt!91838 () tuple2!5268)

(assert (=> b!57922 (= e!38386 (tuple2!5267 (Cons!609 (_1!2745 lt!91838) (bitStreamReadBitsIntoList!0 (_2!2736 lt!91180) (_2!2745 lt!91838) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!91839))) (_2!2745 lt!91838)))))

(declare-fun readBit!0 (BitStream!2076) tuple2!5268)

(assert (=> b!57922 (= lt!91838 (readBit!0 (_1!2737 lt!91186)))))

(assert (=> b!57922 (= lt!91839 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57924 () Bool)

(declare-fun length!292 (List!613) Int)

(assert (=> b!57924 (= e!38385 (> (length!292 lt!91840) 0))))

(declare-fun b!57921 () Bool)

(assert (=> b!57921 (= e!38386 (tuple2!5267 Nil!610 (_1!2737 lt!91186)))))

(declare-fun b!57923 () Bool)

(declare-fun isEmpty!178 (List!613) Bool)

(assert (=> b!57923 (= e!38385 (isEmpty!178 lt!91840))))

(assert (= (and d!18498 c!4215) b!57921))

(assert (= (and d!18498 (not c!4215)) b!57922))

(assert (= (and d!18498 c!4214) b!57923))

(assert (= (and d!18498 (not c!4214)) b!57924))

(declare-fun m!91439 () Bool)

(assert (=> b!57922 m!91439))

(declare-fun m!91441 () Bool)

(assert (=> b!57922 m!91441))

(declare-fun m!91443 () Bool)

(assert (=> b!57924 m!91443))

(declare-fun m!91445 () Bool)

(assert (=> b!57923 m!91445))

(assert (=> b!57668 d!18498))

(check-sat (not b!57716) (not d!18442) (not d!18446) (not b!57806) (not b!57884) (not b!57803) (not b!57879) (not b!57904) (not b!57707) (not d!18452) (not b!57767) (not d!18482) (not b!57772) (not d!18456) (not b!57880) (not bm!760) (not b!57771) (not b!57773) (not b!57903) (not b!57882) (not b!57770) (not b!57718) (not b!57924) (not b!57885) (not b!57768) (not b!57709) (not d!18414) (not d!18412) (not b!57721) (not b!57804) (not d!18416) (not b!57901) (not d!18408) (not b!57807) (not d!18402) (not b!57923) (not b!57766) (not b!57906) (not d!18450) (not b!57912) (not b!57769) (not d!18404) (not d!18458) (not b!57881) (not d!18480) (not b!57922))
(check-sat)
