; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11272 () Bool)

(assert start!11272)

(declare-fun e!37231 () Bool)

(declare-fun b!55891 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!87457 () (_ BitVec 64))

(declare-fun lt!87453 () (_ BitVec 64))

(assert (=> b!55891 (= e!37231 (or (= lt!87453 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!87453 (bvand lt!87457 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!87455 () (_ BitVec 64))

(assert (=> b!55891 (= lt!87453 (bvand lt!87455 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!2594 0))(
  ( (array!2595 (arr!1729 (Array (_ BitVec 32) (_ BitVec 8))) (size!1180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2048 0))(
  ( (BitStream!2049 (buf!1546 array!2594) (currentByte!3134 (_ BitVec 32)) (currentBit!3129 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3863 0))(
  ( (Unit!3864) )
))
(declare-datatypes ((tuple2!5098 0))(
  ( (tuple2!5099 (_1!2660 Unit!3863) (_2!2660 BitStream!2048)) )
))
(declare-fun lt!87458 () tuple2!5098)

(declare-fun thiss!1379 () BitStream!2048)

(assert (=> b!55891 (= (size!1180 (buf!1546 (_2!2660 lt!87458))) (size!1180 (buf!1546 thiss!1379)))))

(declare-fun b!55892 () Bool)

(declare-fun e!37234 () Bool)

(declare-fun e!37232 () Bool)

(assert (=> b!55892 (= e!37234 (not e!37232))))

(declare-fun res!46528 () Bool)

(assert (=> b!55892 (=> res!46528 e!37232)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!55892 (= res!46528 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2048 BitStream!2048) Bool)

(assert (=> b!55892 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!87454 () Unit!3863)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2048) Unit!3863)

(assert (=> b!55892 (= lt!87454 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!87451 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55892 (= lt!87451 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)))))

(declare-fun b!55893 () Bool)

(declare-fun res!46534 () Bool)

(assert (=> b!55893 (=> res!46534 e!37231)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55893 (= res!46534 (not (invariant!0 (currentBit!3129 (_2!2660 lt!87458)) (currentByte!3134 (_2!2660 lt!87458)) (size!1180 (buf!1546 (_2!2660 lt!87458))))))))

(declare-fun b!55895 () Bool)

(declare-fun e!37238 () Bool)

(declare-fun array_inv!1083 (array!2594) Bool)

(assert (=> b!55895 (= e!37238 (array_inv!1083 (buf!1546 thiss!1379)))))

(declare-fun b!55896 () Bool)

(declare-fun res!46529 () Bool)

(assert (=> b!55896 (=> res!46529 e!37231)))

(assert (=> b!55896 (= res!46529 (not (= (size!1180 (buf!1546 thiss!1379)) (size!1180 (buf!1546 (_2!2660 lt!87458))))))))

(declare-datatypes ((tuple2!5100 0))(
  ( (tuple2!5101 (_1!2661 BitStream!2048) (_2!2661 BitStream!2048)) )
))
(declare-fun lt!87459 () tuple2!5100)

(declare-fun srcBuffer!2 () array!2594)

(declare-fun e!37235 () Bool)

(declare-fun b!55897 () Bool)

(declare-fun lt!87460 () tuple2!5098)

(declare-datatypes ((List!599 0))(
  ( (Nil!596) (Cons!595 (h!714 Bool) (t!1349 List!599)) )
))
(declare-fun head!418 (List!599) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2048 array!2594 (_ BitVec 64) (_ BitVec 64)) List!599)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2048 BitStream!2048 (_ BitVec 64)) List!599)

(assert (=> b!55897 (= e!37235 (= (head!418 (byteArrayBitContentToList!0 (_2!2660 lt!87460) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!418 (bitStreamReadBitsIntoList!0 (_2!2660 lt!87460) (_1!2661 lt!87459) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55898 () Bool)

(declare-fun e!37230 () Bool)

(assert (=> b!55898 (= e!37232 e!37230)))

(declare-fun res!46531 () Bool)

(assert (=> b!55898 (=> res!46531 e!37230)))

(assert (=> b!55898 (= res!46531 (not (isPrefixOf!0 thiss!1379 (_2!2660 lt!87460))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55898 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87456 () Unit!3863)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2048 BitStream!2048 (_ BitVec 64) (_ BitVec 64)) Unit!3863)

(assert (=> b!55898 (= lt!87456 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2660 lt!87460) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2048 (_ BitVec 8) (_ BitVec 32)) tuple2!5098)

(assert (=> b!55898 (= lt!87460 (appendBitFromByte!0 thiss!1379 (select (arr!1729 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!55899 () Bool)

(declare-fun res!46535 () Bool)

(assert (=> b!55899 (=> (not res!46535) (not e!37234))))

(assert (=> b!55899 (= res!46535 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 thiss!1379))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!55900 () Bool)

(declare-fun e!37236 () Bool)

(assert (=> b!55900 (= e!37230 e!37236)))

(declare-fun res!46533 () Bool)

(assert (=> b!55900 (=> res!46533 e!37236)))

(assert (=> b!55900 (= res!46533 (not (isPrefixOf!0 (_2!2660 lt!87460) (_2!2660 lt!87458))))))

(assert (=> b!55900 (isPrefixOf!0 thiss!1379 (_2!2660 lt!87458))))

(declare-fun lt!87450 () Unit!3863)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2048 BitStream!2048 BitStream!2048) Unit!3863)

(assert (=> b!55900 (= lt!87450 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2660 lt!87460) (_2!2660 lt!87458)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2048 array!2594 (_ BitVec 64) (_ BitVec 64)) tuple2!5098)

(assert (=> b!55900 (= lt!87458 (appendBitsMSBFirstLoop!0 (_2!2660 lt!87460) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!55900 e!37235))

(declare-fun res!46530 () Bool)

(assert (=> b!55900 (=> (not res!46530) (not e!37235))))

(assert (=> b!55900 (= res!46530 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!87452 () Unit!3863)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2048 array!2594 (_ BitVec 64)) Unit!3863)

(assert (=> b!55900 (= lt!87452 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1546 (_2!2660 lt!87460)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2048 BitStream!2048) tuple2!5100)

(assert (=> b!55900 (= lt!87459 (reader!0 thiss!1379 (_2!2660 lt!87460)))))

(declare-fun res!46532 () Bool)

(assert (=> start!11272 (=> (not res!46532) (not e!37234))))

(assert (=> start!11272 (= res!46532 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1180 srcBuffer!2))))))))

(assert (=> start!11272 e!37234))

(assert (=> start!11272 true))

(assert (=> start!11272 (array_inv!1083 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2048) Bool)

(assert (=> start!11272 (and (inv!12 thiss!1379) e!37238)))

(declare-fun b!55894 () Bool)

(assert (=> b!55894 (= e!37236 e!37231)))

(declare-fun res!46536 () Bool)

(assert (=> b!55894 (=> res!46536 e!37231)))

(assert (=> b!55894 (= res!46536 (not (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87458))) (currentByte!3134 (_2!2660 lt!87458)) (currentBit!3129 (_2!2660 lt!87458))) lt!87457)))))

(assert (=> b!55894 (= lt!87457 (bvsub lt!87455 i!635))))

(assert (=> b!55894 (= lt!87455 (bvadd lt!87451 to!314))))

(assert (= (and start!11272 res!46532) b!55899))

(assert (= (and b!55899 res!46535) b!55892))

(assert (= (and b!55892 (not res!46528)) b!55898))

(assert (= (and b!55898 (not res!46531)) b!55900))

(assert (= (and b!55900 res!46530) b!55897))

(assert (= (and b!55900 (not res!46533)) b!55894))

(assert (= (and b!55894 (not res!46536)) b!55893))

(assert (= (and b!55893 (not res!46534)) b!55896))

(assert (= (and b!55896 (not res!46529)) b!55891))

(assert (= start!11272 b!55895))

(declare-fun m!88067 () Bool)

(assert (=> b!55895 m!88067))

(declare-fun m!88069 () Bool)

(assert (=> b!55897 m!88069))

(assert (=> b!55897 m!88069))

(declare-fun m!88071 () Bool)

(assert (=> b!55897 m!88071))

(declare-fun m!88073 () Bool)

(assert (=> b!55897 m!88073))

(assert (=> b!55897 m!88073))

(declare-fun m!88075 () Bool)

(assert (=> b!55897 m!88075))

(declare-fun m!88077 () Bool)

(assert (=> start!11272 m!88077))

(declare-fun m!88079 () Bool)

(assert (=> start!11272 m!88079))

(declare-fun m!88081 () Bool)

(assert (=> b!55899 m!88081))

(declare-fun m!88083 () Bool)

(assert (=> b!55894 m!88083))

(declare-fun m!88085 () Bool)

(assert (=> b!55898 m!88085))

(declare-fun m!88087 () Bool)

(assert (=> b!55898 m!88087))

(declare-fun m!88089 () Bool)

(assert (=> b!55898 m!88089))

(declare-fun m!88091 () Bool)

(assert (=> b!55898 m!88091))

(assert (=> b!55898 m!88085))

(declare-fun m!88093 () Bool)

(assert (=> b!55898 m!88093))

(declare-fun m!88095 () Bool)

(assert (=> b!55900 m!88095))

(declare-fun m!88097 () Bool)

(assert (=> b!55900 m!88097))

(declare-fun m!88099 () Bool)

(assert (=> b!55900 m!88099))

(declare-fun m!88101 () Bool)

(assert (=> b!55900 m!88101))

(declare-fun m!88103 () Bool)

(assert (=> b!55900 m!88103))

(declare-fun m!88105 () Bool)

(assert (=> b!55900 m!88105))

(declare-fun m!88107 () Bool)

(assert (=> b!55900 m!88107))

(declare-fun m!88109 () Bool)

(assert (=> b!55892 m!88109))

(declare-fun m!88111 () Bool)

(assert (=> b!55892 m!88111))

(declare-fun m!88113 () Bool)

(assert (=> b!55892 m!88113))

(declare-fun m!88115 () Bool)

(assert (=> b!55893 m!88115))

(push 1)

(assert (not start!11272))

(assert (not b!55894))

(assert (not b!55895))

(assert (not b!55897))

(assert (not b!55900))

(assert (not b!55892))

(assert (not b!55898))

(assert (not b!55899))

(assert (not b!55893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17804 () Bool)

(declare-fun res!46579 () Bool)

(declare-fun e!37265 () Bool)

(assert (=> d!17804 (=> (not res!46579) (not e!37265))))

(assert (=> d!17804 (= res!46579 (= (size!1180 (buf!1546 thiss!1379)) (size!1180 (buf!1546 thiss!1379))))))

(assert (=> d!17804 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!37265)))

(declare-fun b!55944 () Bool)

(declare-fun res!46580 () Bool)

(assert (=> b!55944 (=> (not res!46580) (not e!37265))))

(assert (=> b!55944 (= res!46580 (bvsle (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)) (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379))))))

(declare-fun b!55945 () Bool)

(declare-fun e!37264 () Bool)

(assert (=> b!55945 (= e!37265 e!37264)))

(declare-fun res!46581 () Bool)

(assert (=> b!55945 (=> res!46581 e!37264)))

(assert (=> b!55945 (= res!46581 (= (size!1180 (buf!1546 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55946 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2594 array!2594 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55946 (= e!37264 (arrayBitRangesEq!0 (buf!1546 thiss!1379) (buf!1546 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379))))))

(assert (= (and d!17804 res!46579) b!55944))

(assert (= (and b!55944 res!46580) b!55945))

(assert (= (and b!55945 (not res!46581)) b!55946))

(assert (=> b!55944 m!88113))

(assert (=> b!55944 m!88113))

(assert (=> b!55946 m!88113))

(assert (=> b!55946 m!88113))

(declare-fun m!88137 () Bool)

(assert (=> b!55946 m!88137))

(assert (=> b!55892 d!17804))

(declare-fun d!17806 () Bool)

(assert (=> d!17806 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!87502 () Unit!3863)

(declare-fun choose!11 (BitStream!2048) Unit!3863)

(assert (=> d!17806 (= lt!87502 (choose!11 thiss!1379))))

(assert (=> d!17806 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!87502)))

(declare-fun bs!4470 () Bool)

(assert (= bs!4470 d!17806))

(assert (=> bs!4470 m!88109))

(declare-fun m!88157 () Bool)

(assert (=> bs!4470 m!88157))

(assert (=> b!55892 d!17806))

(declare-fun d!17816 () Bool)

(declare-fun e!37271 () Bool)

(assert (=> d!17816 e!37271))

(declare-fun res!46592 () Bool)

(assert (=> d!17816 (=> (not res!46592) (not e!37271))))

(declare-fun lt!87535 () (_ BitVec 64))

(declare-fun lt!87536 () (_ BitVec 64))

(declare-fun lt!87538 () (_ BitVec 64))

(assert (=> d!17816 (= res!46592 (= lt!87538 (bvsub lt!87535 lt!87536)))))

(assert (=> d!17816 (or (= (bvand lt!87535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87535 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87535 lt!87536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!17816 (= lt!87536 (remainingBits!0 ((_ sign_extend 32) (size!1180 (buf!1546 thiss!1379))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379))))))

(declare-fun lt!87537 () (_ BitVec 64))

(declare-fun lt!87534 () (_ BitVec 64))

(assert (=> d!17816 (= lt!87535 (bvmul lt!87537 lt!87534))))

(assert (=> d!17816 (or (= lt!87537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!87534 (bvsdiv (bvmul lt!87537 lt!87534) lt!87537)))))

(assert (=> d!17816 (= lt!87534 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17816 (= lt!87537 ((_ sign_extend 32) (size!1180 (buf!1546 thiss!1379))))))

(assert (=> d!17816 (= lt!87538 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3134 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3129 thiss!1379))))))

(assert (=> d!17816 (invariant!0 (currentBit!3129 thiss!1379) (currentByte!3134 thiss!1379) (size!1180 (buf!1546 thiss!1379)))))

(assert (=> d!17816 (= (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)) lt!87538)))

(declare-fun b!55957 () Bool)

(declare-fun res!46593 () Bool)

(assert (=> b!55957 (=> (not res!46593) (not e!37271))))

(assert (=> b!55957 (= res!46593 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!87538))))

(declare-fun b!55958 () Bool)

(declare-fun lt!87533 () (_ BitVec 64))

(assert (=> b!55958 (= e!37271 (bvsle lt!87538 (bvmul lt!87533 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!55958 (or (= lt!87533 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!87533 #b0000000000000000000000000000000000000000000000000000000000001000) lt!87533)))))

(assert (=> b!55958 (= lt!87533 ((_ sign_extend 32) (size!1180 (buf!1546 thiss!1379))))))

(assert (= (and d!17816 res!46592) b!55957))

(assert (= (and b!55957 res!46593) b!55958))

(declare-fun m!88161 () Bool)

(assert (=> d!17816 m!88161))

(declare-fun m!88163 () Bool)

(assert (=> d!17816 m!88163))

(assert (=> b!55892 d!17816))

(declare-fun d!17820 () Bool)

(declare-fun res!46597 () Bool)

(declare-fun e!37275 () Bool)

(assert (=> d!17820 (=> (not res!46597) (not e!37275))))

(assert (=> d!17820 (= res!46597 (= (size!1180 (buf!1546 thiss!1379)) (size!1180 (buf!1546 (_2!2660 lt!87460)))))))

(assert (=> d!17820 (= (isPrefixOf!0 thiss!1379 (_2!2660 lt!87460)) e!37275)))

(declare-fun b!55962 () Bool)

(declare-fun res!46598 () Bool)

(assert (=> b!55962 (=> (not res!46598) (not e!37275))))

(assert (=> b!55962 (= res!46598 (bvsle (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)) (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460)))))))

(declare-fun b!55963 () Bool)

(declare-fun e!37274 () Bool)

(assert (=> b!55963 (= e!37275 e!37274)))

(declare-fun res!46599 () Bool)

(assert (=> b!55963 (=> res!46599 e!37274)))

(assert (=> b!55963 (= res!46599 (= (size!1180 (buf!1546 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!55964 () Bool)

(assert (=> b!55964 (= e!37274 (arrayBitRangesEq!0 (buf!1546 thiss!1379) (buf!1546 (_2!2660 lt!87460)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379))))))

(assert (= (and d!17820 res!46597) b!55962))

(assert (= (and b!55962 res!46598) b!55963))

(assert (= (and b!55963 (not res!46599)) b!55964))

(assert (=> b!55962 m!88113))

(declare-fun m!88167 () Bool)

(assert (=> b!55962 m!88167))

(assert (=> b!55964 m!88113))

(assert (=> b!55964 m!88113))

(declare-fun m!88169 () Bool)

(assert (=> b!55964 m!88169))

(assert (=> b!55898 d!17820))

(declare-fun d!17824 () Bool)

(assert (=> d!17824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4471 () Bool)

(assert (= bs!4471 d!17824))

(declare-fun m!88171 () Bool)

(assert (=> bs!4471 m!88171))

(assert (=> b!55898 d!17824))

(declare-fun d!17826 () Bool)

(declare-fun e!37279 () Bool)

(assert (=> d!17826 e!37279))

(declare-fun res!46604 () Bool)

(assert (=> d!17826 (=> (not res!46604) (not e!37279))))

(assert (=> d!17826 (= res!46604 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!87550 () Unit!3863)

(declare-fun choose!27 (BitStream!2048 BitStream!2048 (_ BitVec 64) (_ BitVec 64)) Unit!3863)

(assert (=> d!17826 (= lt!87550 (choose!27 thiss!1379 (_2!2660 lt!87460) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17826 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!17826 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2660 lt!87460) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87550)))

(declare-fun b!55969 () Bool)

(assert (=> b!55969 (= e!37279 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!17826 res!46604) b!55969))

(declare-fun m!88177 () Bool)

(assert (=> d!17826 m!88177))

(assert (=> b!55969 m!88089))

(assert (=> b!55898 d!17826))

(declare-fun b!56050 () Bool)

(declare-fun e!37320 () Bool)

(declare-fun e!37319 () Bool)

(assert (=> b!56050 (= e!37320 e!37319)))

(declare-fun res!46654 () Bool)

(assert (=> b!56050 (=> (not res!46654) (not e!37319))))

(declare-datatypes ((tuple2!5110 0))(
  ( (tuple2!5111 (_1!2666 BitStream!2048) (_2!2666 Bool)) )
))
(declare-fun lt!87719 () tuple2!5110)

(declare-fun lt!87712 () tuple2!5098)

(declare-fun lt!87721 () Bool)

(assert (=> b!56050 (= res!46654 (and (= (_2!2666 lt!87719) lt!87721) (= (_1!2666 lt!87719) (_2!2660 lt!87712))))))

(declare-fun readBitPure!0 (BitStream!2048) tuple2!5110)

(declare-fun readerFrom!0 (BitStream!2048 (_ BitVec 32) (_ BitVec 32)) BitStream!2048)

(assert (=> b!56050 (= lt!87719 (readBitPure!0 (readerFrom!0 (_2!2660 lt!87712) (currentBit!3129 thiss!1379) (currentByte!3134 thiss!1379))))))

(declare-fun b!56051 () Bool)

(declare-fun res!46657 () Bool)

(assert (=> b!56051 (=> (not res!46657) (not e!37320))))

(assert (=> b!56051 (= res!46657 (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87712))) (currentByte!3134 (_2!2660 lt!87712)) (currentBit!3129 (_2!2660 lt!87712))) (bvadd (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!56052 () Bool)

(declare-fun res!46660 () Bool)

(declare-fun e!37321 () Bool)

(assert (=> b!56052 (=> (not res!46660) (not e!37321))))

(declare-fun lt!87720 () tuple2!5098)

(assert (=> b!56052 (= res!46660 (isPrefixOf!0 thiss!1379 (_2!2660 lt!87720)))))

(declare-fun b!56053 () Bool)

(assert (=> b!56053 (= e!37319 (= (bitIndex!0 (size!1180 (buf!1546 (_1!2666 lt!87719))) (currentByte!3134 (_1!2666 lt!87719)) (currentBit!3129 (_1!2666 lt!87719))) (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87712))) (currentByte!3134 (_2!2660 lt!87712)) (currentBit!3129 (_2!2660 lt!87712)))))))

(declare-fun b!56054 () Bool)

(declare-fun e!37322 () Bool)

(declare-fun lt!87716 () tuple2!5110)

(assert (=> b!56054 (= e!37322 (= (bitIndex!0 (size!1180 (buf!1546 (_1!2666 lt!87716))) (currentByte!3134 (_1!2666 lt!87716)) (currentBit!3129 (_1!2666 lt!87716))) (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87720))) (currentByte!3134 (_2!2660 lt!87720)) (currentBit!3129 (_2!2660 lt!87720)))))))

(declare-fun d!17838 () Bool)

(assert (=> d!17838 e!37321))

(declare-fun res!46661 () Bool)

(assert (=> d!17838 (=> (not res!46661) (not e!37321))))

(assert (=> d!17838 (= res!46661 (= (size!1180 (buf!1546 (_2!2660 lt!87720))) (size!1180 (buf!1546 thiss!1379))))))

(declare-fun lt!87718 () (_ BitVec 8))

(declare-fun lt!87711 () array!2594)

(assert (=> d!17838 (= lt!87718 (select (arr!1729 lt!87711) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!17838 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1180 lt!87711)))))

(assert (=> d!17838 (= lt!87711 (array!2595 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!87713 () tuple2!5098)

(assert (=> d!17838 (= lt!87720 (tuple2!5099 (_1!2660 lt!87713) (_2!2660 lt!87713)))))

(assert (=> d!17838 (= lt!87713 lt!87712)))

(assert (=> d!17838 e!37320))

(declare-fun res!46658 () Bool)

(assert (=> d!17838 (=> (not res!46658) (not e!37320))))

(assert (=> d!17838 (= res!46658 (= (size!1180 (buf!1546 thiss!1379)) (size!1180 (buf!1546 (_2!2660 lt!87712)))))))

(declare-fun appendBit!0 (BitStream!2048 Bool) tuple2!5098)

(assert (=> d!17838 (= lt!87712 (appendBit!0 thiss!1379 lt!87721))))

(assert (=> d!17838 (= lt!87721 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1729 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!17838 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!17838 (= (appendBitFromByte!0 thiss!1379 (select (arr!1729 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!87720)))

(declare-fun b!56055 () Bool)

(declare-fun res!46655 () Bool)

(assert (=> b!56055 (=> (not res!46655) (not e!37321))))

(declare-fun lt!87715 () (_ BitVec 64))

(declare-fun lt!87714 () (_ BitVec 64))

(assert (=> b!56055 (= res!46655 (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87720))) (currentByte!3134 (_2!2660 lt!87720)) (currentBit!3129 (_2!2660 lt!87720))) (bvadd lt!87715 lt!87714)))))

(assert (=> b!56055 (or (not (= (bvand lt!87715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87714 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!87715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!87715 lt!87714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56055 (= lt!87714 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!56055 (= lt!87715 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)))))

(declare-fun b!56056 () Bool)

(declare-fun res!46659 () Bool)

(assert (=> b!56056 (=> (not res!46659) (not e!37320))))

(assert (=> b!56056 (= res!46659 (isPrefixOf!0 thiss!1379 (_2!2660 lt!87712)))))

(declare-fun b!56057 () Bool)

(assert (=> b!56057 (= e!37321 e!37322)))

(declare-fun res!46656 () Bool)

(assert (=> b!56057 (=> (not res!46656) (not e!37322))))

(assert (=> b!56057 (= res!46656 (and (= (_2!2666 lt!87716) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1729 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!87718)) #b00000000000000000000000000000000))) (= (_1!2666 lt!87716) (_2!2660 lt!87720))))))

(declare-datatypes ((tuple2!5112 0))(
  ( (tuple2!5113 (_1!2667 array!2594) (_2!2667 BitStream!2048)) )
))
(declare-fun lt!87710 () tuple2!5112)

(declare-fun lt!87717 () BitStream!2048)

(declare-fun readBits!0 (BitStream!2048 (_ BitVec 64)) tuple2!5112)

(assert (=> b!56057 (= lt!87710 (readBits!0 lt!87717 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!56057 (= lt!87716 (readBitPure!0 lt!87717))))

(assert (=> b!56057 (= lt!87717 (readerFrom!0 (_2!2660 lt!87720) (currentBit!3129 thiss!1379) (currentByte!3134 thiss!1379)))))

(assert (= (and d!17838 res!46658) b!56051))

(assert (= (and b!56051 res!46657) b!56056))

(assert (= (and b!56056 res!46659) b!56050))

(assert (= (and b!56050 res!46654) b!56053))

(assert (= (and d!17838 res!46661) b!56055))

(assert (= (and b!56055 res!46655) b!56052))

(assert (= (and b!56052 res!46660) b!56057))

(assert (= (and b!56057 res!46656) b!56054))

(declare-fun m!88255 () Bool)

(assert (=> b!56057 m!88255))

(declare-fun m!88257 () Bool)

(assert (=> b!56057 m!88257))

(declare-fun m!88259 () Bool)

(assert (=> b!56057 m!88259))

(declare-fun m!88261 () Bool)

(assert (=> b!56052 m!88261))

(declare-fun m!88263 () Bool)

(assert (=> b!56055 m!88263))

(assert (=> b!56055 m!88113))

(declare-fun m!88265 () Bool)

(assert (=> d!17838 m!88265))

(declare-fun m!88267 () Bool)

(assert (=> d!17838 m!88267))

(declare-fun m!88269 () Bool)

(assert (=> d!17838 m!88269))

(declare-fun m!88271 () Bool)

(assert (=> b!56051 m!88271))

(assert (=> b!56051 m!88113))

(declare-fun m!88273 () Bool)

(assert (=> b!56056 m!88273))

(declare-fun m!88275 () Bool)

(assert (=> b!56050 m!88275))

(assert (=> b!56050 m!88275))

(declare-fun m!88277 () Bool)

(assert (=> b!56050 m!88277))

(declare-fun m!88279 () Bool)

(assert (=> b!56053 m!88279))

(assert (=> b!56053 m!88271))

(declare-fun m!88281 () Bool)

(assert (=> b!56054 m!88281))

(assert (=> b!56054 m!88263))

(assert (=> b!55898 d!17838))

(declare-fun d!17864 () Bool)

(assert (=> d!17864 (= (invariant!0 (currentBit!3129 (_2!2660 lt!87458)) (currentByte!3134 (_2!2660 lt!87458)) (size!1180 (buf!1546 (_2!2660 lt!87458)))) (and (bvsge (currentBit!3129 (_2!2660 lt!87458)) #b00000000000000000000000000000000) (bvslt (currentBit!3129 (_2!2660 lt!87458)) #b00000000000000000000000000001000) (bvsge (currentByte!3134 (_2!2660 lt!87458)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3134 (_2!2660 lt!87458)) (size!1180 (buf!1546 (_2!2660 lt!87458)))) (and (= (currentBit!3129 (_2!2660 lt!87458)) #b00000000000000000000000000000000) (= (currentByte!3134 (_2!2660 lt!87458)) (size!1180 (buf!1546 (_2!2660 lt!87458))))))))))

(assert (=> b!55893 d!17864))

(declare-fun d!17868 () Bool)

(assert (=> d!17868 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 thiss!1379))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1180 (buf!1546 thiss!1379))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4479 () Bool)

(assert (= bs!4479 d!17868))

(assert (=> bs!4479 m!88161))

(assert (=> b!55899 d!17868))

(declare-fun d!17870 () Bool)

(declare-fun e!37323 () Bool)

(assert (=> d!17870 e!37323))

(declare-fun res!46662 () Bool)

(assert (=> d!17870 (=> (not res!46662) (not e!37323))))

(declare-fun lt!87730 () (_ BitVec 64))

(declare-fun lt!87728 () (_ BitVec 64))

(declare-fun lt!87727 () (_ BitVec 64))

(assert (=> d!17870 (= res!46662 (= lt!87730 (bvsub lt!87727 lt!87728)))))

(assert (=> d!17870 (or (= (bvand lt!87727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!87728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!87727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!87727 lt!87728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17870 (= lt!87728 (remainingBits!0 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87458)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87458))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87458)))))))

(declare-fun lt!87729 () (_ BitVec 64))

(declare-fun lt!87726 () (_ BitVec 64))

(assert (=> d!17870 (= lt!87727 (bvmul lt!87729 lt!87726))))

(assert (=> d!17870 (or (= lt!87729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!87726 (bvsdiv (bvmul lt!87729 lt!87726) lt!87729)))))

(assert (=> d!17870 (= lt!87726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17870 (= lt!87729 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87458)))))))

(assert (=> d!17870 (= lt!87730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87458))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87458)))))))

(assert (=> d!17870 (invariant!0 (currentBit!3129 (_2!2660 lt!87458)) (currentByte!3134 (_2!2660 lt!87458)) (size!1180 (buf!1546 (_2!2660 lt!87458))))))

(assert (=> d!17870 (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87458))) (currentByte!3134 (_2!2660 lt!87458)) (currentBit!3129 (_2!2660 lt!87458))) lt!87730)))

(declare-fun b!56058 () Bool)

(declare-fun res!46663 () Bool)

(assert (=> b!56058 (=> (not res!46663) (not e!37323))))

(assert (=> b!56058 (= res!46663 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!87730))))

(declare-fun b!56059 () Bool)

(declare-fun lt!87725 () (_ BitVec 64))

(assert (=> b!56059 (= e!37323 (bvsle lt!87730 (bvmul lt!87725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!56059 (or (= lt!87725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!87725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!87725)))))

(assert (=> b!56059 (= lt!87725 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87458)))))))

(assert (= (and d!17870 res!46662) b!56058))

(assert (= (and b!56058 res!46663) b!56059))

(declare-fun m!88285 () Bool)

(assert (=> d!17870 m!88285))

(assert (=> d!17870 m!88115))

(assert (=> b!55894 d!17870))

(declare-fun d!17872 () Bool)

(assert (=> d!17872 (= (array_inv!1083 srcBuffer!2) (bvsge (size!1180 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11272 d!17872))

(declare-fun d!17874 () Bool)

(assert (=> d!17874 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3129 thiss!1379) (currentByte!3134 thiss!1379) (size!1180 (buf!1546 thiss!1379))))))

(declare-fun bs!4480 () Bool)

(assert (= bs!4480 d!17874))

(assert (=> bs!4480 m!88163))

(assert (=> start!11272 d!17874))

(declare-fun d!17876 () Bool)

(assert (=> d!17876 (isPrefixOf!0 thiss!1379 (_2!2660 lt!87458))))

(declare-fun lt!87733 () Unit!3863)

(declare-fun choose!30 (BitStream!2048 BitStream!2048 BitStream!2048) Unit!3863)

(assert (=> d!17876 (= lt!87733 (choose!30 thiss!1379 (_2!2660 lt!87460) (_2!2660 lt!87458)))))

(assert (=> d!17876 (isPrefixOf!0 thiss!1379 (_2!2660 lt!87460))))

(assert (=> d!17876 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2660 lt!87460) (_2!2660 lt!87458)) lt!87733)))

(declare-fun bs!4481 () Bool)

(assert (= bs!4481 d!17876))

(assert (=> bs!4481 m!88107))

(declare-fun m!88287 () Bool)

(assert (=> bs!4481 m!88287))

(assert (=> bs!4481 m!88091))

(assert (=> b!55900 d!17876))

(declare-fun d!17878 () Bool)

(declare-fun res!46664 () Bool)

(declare-fun e!37325 () Bool)

(assert (=> d!17878 (=> (not res!46664) (not e!37325))))

(assert (=> d!17878 (= res!46664 (= (size!1180 (buf!1546 (_2!2660 lt!87460))) (size!1180 (buf!1546 (_2!2660 lt!87458)))))))

(assert (=> d!17878 (= (isPrefixOf!0 (_2!2660 lt!87460) (_2!2660 lt!87458)) e!37325)))

(declare-fun b!56060 () Bool)

(declare-fun res!46665 () Bool)

(assert (=> b!56060 (=> (not res!46665) (not e!37325))))

(assert (=> b!56060 (= res!46665 (bvsle (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460))) (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87458))) (currentByte!3134 (_2!2660 lt!87458)) (currentBit!3129 (_2!2660 lt!87458)))))))

(declare-fun b!56061 () Bool)

(declare-fun e!37324 () Bool)

(assert (=> b!56061 (= e!37325 e!37324)))

(declare-fun res!46666 () Bool)

(assert (=> b!56061 (=> res!46666 e!37324)))

(assert (=> b!56061 (= res!46666 (= (size!1180 (buf!1546 (_2!2660 lt!87460))) #b00000000000000000000000000000000))))

(declare-fun b!56062 () Bool)

(assert (=> b!56062 (= e!37324 (arrayBitRangesEq!0 (buf!1546 (_2!2660 lt!87460)) (buf!1546 (_2!2660 lt!87458)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460)))))))

(assert (= (and d!17878 res!46664) b!56060))

(assert (= (and b!56060 res!46665) b!56061))

(assert (= (and b!56061 (not res!46666)) b!56062))

(assert (=> b!56060 m!88167))

(assert (=> b!56060 m!88083))

(assert (=> b!56062 m!88167))

(assert (=> b!56062 m!88167))

(declare-fun m!88289 () Bool)

(assert (=> b!56062 m!88289))

(assert (=> b!55900 d!17878))

(declare-fun d!17880 () Bool)

(assert (=> d!17880 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!87736 () Unit!3863)

(declare-fun choose!9 (BitStream!2048 array!2594 (_ BitVec 64) BitStream!2048) Unit!3863)

(assert (=> d!17880 (= lt!87736 (choose!9 thiss!1379 (buf!1546 (_2!2660 lt!87460)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2049 (buf!1546 (_2!2660 lt!87460)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379))))))

(assert (=> d!17880 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1546 (_2!2660 lt!87460)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!87736)))

(declare-fun bs!4482 () Bool)

(assert (= bs!4482 d!17880))

(assert (=> bs!4482 m!88099))

(declare-fun m!88291 () Bool)

(assert (=> bs!4482 m!88291))

(assert (=> b!55900 d!17880))

(declare-fun b!56125 () Bool)

(declare-fun e!37353 () Bool)

(declare-fun lt!88055 () (_ BitVec 64))

(assert (=> b!56125 (= e!37353 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) lt!88055))))

(declare-fun b!56126 () Bool)

(declare-fun e!37352 () tuple2!5098)

(declare-fun Unit!3875 () Unit!3863)

(assert (=> b!56126 (= e!37352 (tuple2!5099 Unit!3875 (_2!2660 lt!87460)))))

(assert (=> b!56126 (= (size!1180 (buf!1546 (_2!2660 lt!87460))) (size!1180 (buf!1546 (_2!2660 lt!87460))))))

(declare-fun lt!88079 () Unit!3863)

(declare-fun Unit!3876 () Unit!3863)

(assert (=> b!56126 (= lt!88079 Unit!3876)))

(declare-fun call!726 () tuple2!5100)

(declare-fun checkByteArrayBitContent!0 (BitStream!2048 array!2594 array!2594 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56126 (checkByteArrayBitContent!0 (_2!2660 lt!87460) srcBuffer!2 (_1!2667 (readBits!0 (_1!2661 call!726) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!56127 () Bool)

(declare-fun res!46719 () Bool)

(declare-fun e!37351 () Bool)

(assert (=> b!56127 (=> (not res!46719) (not e!37351))))

(declare-fun lt!88089 () tuple2!5098)

(assert (=> b!56127 (= res!46719 (invariant!0 (currentBit!3129 (_2!2660 lt!88089)) (currentByte!3134 (_2!2660 lt!88089)) (size!1180 (buf!1546 (_2!2660 lt!88089)))))))

(declare-fun b!56128 () Bool)

(declare-fun res!46715 () Bool)

(assert (=> b!56128 (=> (not res!46715) (not e!37351))))

(assert (=> b!56128 (= res!46715 (= (size!1180 (buf!1546 (_2!2660 lt!88089))) (size!1180 (buf!1546 (_2!2660 lt!87460)))))))

(declare-fun d!17882 () Bool)

(assert (=> d!17882 e!37351))

(declare-fun res!46716 () Bool)

(assert (=> d!17882 (=> (not res!46716) (not e!37351))))

(declare-fun lt!88056 () (_ BitVec 64))

(assert (=> d!17882 (= res!46716 (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!88089))) (currentByte!3134 (_2!2660 lt!88089)) (currentBit!3129 (_2!2660 lt!88089))) (bvsub lt!88056 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!17882 (or (= (bvand lt!88056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88056 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88056 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!88063 () (_ BitVec 64))

(assert (=> d!17882 (= lt!88056 (bvadd lt!88063 to!314))))

(assert (=> d!17882 (or (not (= (bvand lt!88063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!88063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!88063 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17882 (= lt!88063 (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460))))))

(assert (=> d!17882 (= lt!88089 e!37352)))

(declare-fun c!4025 () Bool)

(assert (=> d!17882 (= c!4025 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!88074 () Unit!3863)

(declare-fun lt!88053 () Unit!3863)

(assert (=> d!17882 (= lt!88074 lt!88053)))

(assert (=> d!17882 (isPrefixOf!0 (_2!2660 lt!87460) (_2!2660 lt!87460))))

(assert (=> d!17882 (= lt!88053 (lemmaIsPrefixRefl!0 (_2!2660 lt!87460)))))

(declare-fun lt!88080 () (_ BitVec 64))

(assert (=> d!17882 (= lt!88080 (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460))))))

(assert (=> d!17882 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17882 (= (appendBitsMSBFirstLoop!0 (_2!2660 lt!87460) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!88089)))

(declare-fun lt!88076 () tuple2!5098)

(declare-fun lt!88069 () tuple2!5098)

(declare-fun bm!723 () Bool)

(assert (=> bm!723 (= call!726 (reader!0 (ite c!4025 (_2!2660 lt!88069) (_2!2660 lt!87460)) (ite c!4025 (_2!2660 lt!88076) (_2!2660 lt!87460))))))

(declare-fun b!56129 () Bool)

(declare-fun Unit!3881 () Unit!3863)

(assert (=> b!56129 (= e!37352 (tuple2!5099 Unit!3881 (_2!2660 lt!88076)))))

(assert (=> b!56129 (= lt!88069 (appendBitFromByte!0 (_2!2660 lt!87460) (select (arr!1729 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!88083 () (_ BitVec 64))

(assert (=> b!56129 (= lt!88083 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88078 () (_ BitVec 64))

(assert (=> b!56129 (= lt!88078 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88059 () Unit!3863)

(assert (=> b!56129 (= lt!88059 (validateOffsetBitsIneqLemma!0 (_2!2660 lt!87460) (_2!2660 lt!88069) lt!88083 lt!88078))))

(assert (=> b!56129 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!88069)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!88069))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!88069))) (bvsub lt!88083 lt!88078))))

(declare-fun lt!88049 () Unit!3863)

(assert (=> b!56129 (= lt!88049 lt!88059)))

(declare-fun lt!88054 () tuple2!5100)

(assert (=> b!56129 (= lt!88054 (reader!0 (_2!2660 lt!87460) (_2!2660 lt!88069)))))

(declare-fun lt!88088 () (_ BitVec 64))

(assert (=> b!56129 (= lt!88088 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!88067 () Unit!3863)

(assert (=> b!56129 (= lt!88067 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2660 lt!87460) (buf!1546 (_2!2660 lt!88069)) lt!88088))))

(assert (=> b!56129 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!88069)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) lt!88088)))

(declare-fun lt!88066 () Unit!3863)

(assert (=> b!56129 (= lt!88066 lt!88067)))

(assert (=> b!56129 (= (head!418 (byteArrayBitContentToList!0 (_2!2660 lt!88069) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!418 (bitStreamReadBitsIntoList!0 (_2!2660 lt!88069) (_1!2661 lt!88054) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88058 () Unit!3863)

(declare-fun Unit!3882 () Unit!3863)

(assert (=> b!56129 (= lt!88058 Unit!3882)))

(assert (=> b!56129 (= lt!88076 (appendBitsMSBFirstLoop!0 (_2!2660 lt!88069) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!88082 () Unit!3863)

(assert (=> b!56129 (= lt!88082 (lemmaIsPrefixTransitive!0 (_2!2660 lt!87460) (_2!2660 lt!88069) (_2!2660 lt!88076)))))

(assert (=> b!56129 (isPrefixOf!0 (_2!2660 lt!87460) (_2!2660 lt!88076))))

(declare-fun lt!88062 () Unit!3863)

(assert (=> b!56129 (= lt!88062 lt!88082)))

(assert (=> b!56129 (= (size!1180 (buf!1546 (_2!2660 lt!88076))) (size!1180 (buf!1546 (_2!2660 lt!87460))))))

(declare-fun lt!88073 () Unit!3863)

(declare-fun Unit!3883 () Unit!3863)

(assert (=> b!56129 (= lt!88073 Unit!3883)))

(assert (=> b!56129 (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!88076))) (currentByte!3134 (_2!2660 lt!88076)) (currentBit!3129 (_2!2660 lt!88076))) (bvsub (bvadd (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88072 () Unit!3863)

(declare-fun Unit!3884 () Unit!3863)

(assert (=> b!56129 (= lt!88072 Unit!3884)))

(assert (=> b!56129 (= (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!88076))) (currentByte!3134 (_2!2660 lt!88076)) (currentBit!3129 (_2!2660 lt!88076))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!88069))) (currentByte!3134 (_2!2660 lt!88069)) (currentBit!3129 (_2!2660 lt!88069))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88086 () Unit!3863)

(declare-fun Unit!3885 () Unit!3863)

(assert (=> b!56129 (= lt!88086 Unit!3885)))

(declare-fun lt!88057 () tuple2!5100)

(assert (=> b!56129 (= lt!88057 (reader!0 (_2!2660 lt!87460) (_2!2660 lt!88076)))))

(declare-fun lt!88077 () (_ BitVec 64))

(assert (=> b!56129 (= lt!88077 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88091 () Unit!3863)

(assert (=> b!56129 (= lt!88091 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2660 lt!87460) (buf!1546 (_2!2660 lt!88076)) lt!88077))))

(assert (=> b!56129 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!88076)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) lt!88077)))

(declare-fun lt!88050 () Unit!3863)

(assert (=> b!56129 (= lt!88050 lt!88091)))

(declare-fun lt!88052 () tuple2!5100)

(assert (=> b!56129 (= lt!88052 call!726)))

(declare-fun lt!88087 () (_ BitVec 64))

(assert (=> b!56129 (= lt!88087 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88081 () Unit!3863)

(assert (=> b!56129 (= lt!88081 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2660 lt!88069) (buf!1546 (_2!2660 lt!88076)) lt!88087))))

(assert (=> b!56129 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!88076)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!88069))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!88069))) lt!88087)))

(declare-fun lt!88085 () Unit!3863)

(assert (=> b!56129 (= lt!88085 lt!88081)))

(declare-fun lt!88064 () List!599)

(assert (=> b!56129 (= lt!88064 (byteArrayBitContentToList!0 (_2!2660 lt!88076) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!88048 () List!599)

(assert (=> b!56129 (= lt!88048 (byteArrayBitContentToList!0 (_2!2660 lt!88076) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88060 () List!599)

(assert (=> b!56129 (= lt!88060 (bitStreamReadBitsIntoList!0 (_2!2660 lt!88076) (_1!2661 lt!88057) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!88070 () List!599)

(assert (=> b!56129 (= lt!88070 (bitStreamReadBitsIntoList!0 (_2!2660 lt!88076) (_1!2661 lt!88052) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!88068 () (_ BitVec 64))

(assert (=> b!56129 (= lt!88068 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!88061 () Unit!3863)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2048 BitStream!2048 BitStream!2048 BitStream!2048 (_ BitVec 64) List!599) Unit!3863)

(assert (=> b!56129 (= lt!88061 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2660 lt!88076) (_2!2660 lt!88076) (_1!2661 lt!88057) (_1!2661 lt!88052) lt!88068 lt!88060))))

(declare-fun tail!269 (List!599) List!599)

(assert (=> b!56129 (= (bitStreamReadBitsIntoList!0 (_2!2660 lt!88076) (_1!2661 lt!88052) (bvsub lt!88068 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!269 lt!88060))))

(declare-fun lt!88071 () Unit!3863)

(assert (=> b!56129 (= lt!88071 lt!88061)))

(declare-fun lt!88084 () Unit!3863)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2594 array!2594 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3863)

(assert (=> b!56129 (= lt!88084 (arrayBitRangesEqImpliesEq!0 (buf!1546 (_2!2660 lt!88069)) (buf!1546 (_2!2660 lt!88076)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!88080 (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!88069))) (currentByte!3134 (_2!2660 lt!88069)) (currentBit!3129 (_2!2660 lt!88069)))))))

(declare-fun bitAt!0 (array!2594 (_ BitVec 64)) Bool)

(assert (=> b!56129 (= (bitAt!0 (buf!1546 (_2!2660 lt!88069)) lt!88080) (bitAt!0 (buf!1546 (_2!2660 lt!88076)) lt!88080))))

(declare-fun lt!88075 () Unit!3863)

(assert (=> b!56129 (= lt!88075 lt!88084)))

(declare-fun b!56130 () Bool)

(declare-fun lt!88090 () tuple2!5100)

(assert (=> b!56130 (= e!37351 (= (bitStreamReadBitsIntoList!0 (_2!2660 lt!88089) (_1!2661 lt!88090) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2660 lt!88089) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!56130 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56130 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!88065 () Unit!3863)

(declare-fun lt!88051 () Unit!3863)

(assert (=> b!56130 (= lt!88065 lt!88051)))

(assert (=> b!56130 (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!88089)))) ((_ sign_extend 32) (currentByte!3134 (_2!2660 lt!87460))) ((_ sign_extend 32) (currentBit!3129 (_2!2660 lt!87460))) lt!88055)))

(assert (=> b!56130 (= lt!88051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2660 lt!87460) (buf!1546 (_2!2660 lt!88089)) lt!88055))))

(assert (=> b!56130 e!37353))

(declare-fun res!46720 () Bool)

(assert (=> b!56130 (=> (not res!46720) (not e!37353))))

(assert (=> b!56130 (= res!46720 (and (= (size!1180 (buf!1546 (_2!2660 lt!87460))) (size!1180 (buf!1546 (_2!2660 lt!88089)))) (bvsge lt!88055 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56130 (= lt!88055 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!56130 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56130 (= lt!88090 (reader!0 (_2!2660 lt!87460) (_2!2660 lt!88089)))))

(declare-fun b!56131 () Bool)

(declare-fun res!46717 () Bool)

(assert (=> b!56131 (=> (not res!46717) (not e!37351))))

(assert (=> b!56131 (= res!46717 (isPrefixOf!0 (_2!2660 lt!87460) (_2!2660 lt!88089)))))

(declare-fun b!56132 () Bool)

(declare-fun res!46718 () Bool)

(assert (=> b!56132 (=> (not res!46718) (not e!37351))))

(assert (=> b!56132 (= res!46718 (= (size!1180 (buf!1546 (_2!2660 lt!87460))) (size!1180 (buf!1546 (_2!2660 lt!88089)))))))

(assert (= (and d!17882 c!4025) b!56129))

(assert (= (and d!17882 (not c!4025)) b!56126))

(assert (= (or b!56129 b!56126) bm!723))

(assert (= (and d!17882 res!46716) b!56127))

(assert (= (and b!56127 res!46719) b!56132))

(assert (= (and b!56132 res!46718) b!56131))

(assert (= (and b!56131 res!46717) b!56128))

(assert (= (and b!56128 res!46715) b!56130))

(assert (= (and b!56130 res!46720) b!56125))

(declare-fun m!88391 () Bool)

(assert (=> b!56129 m!88391))

(declare-fun m!88393 () Bool)

(assert (=> b!56129 m!88393))

(declare-fun m!88395 () Bool)

(assert (=> b!56129 m!88395))

(assert (=> b!56129 m!88167))

(declare-fun m!88397 () Bool)

(assert (=> b!56129 m!88397))

(declare-fun m!88399 () Bool)

(assert (=> b!56129 m!88399))

(declare-fun m!88401 () Bool)

(assert (=> b!56129 m!88401))

(declare-fun m!88403 () Bool)

(assert (=> b!56129 m!88403))

(declare-fun m!88405 () Bool)

(assert (=> b!56129 m!88405))

(declare-fun m!88407 () Bool)

(assert (=> b!56129 m!88407))

(declare-fun m!88409 () Bool)

(assert (=> b!56129 m!88409))

(declare-fun m!88411 () Bool)

(assert (=> b!56129 m!88411))

(declare-fun m!88413 () Bool)

(assert (=> b!56129 m!88413))

(assert (=> b!56129 m!88403))

(declare-fun m!88415 () Bool)

(assert (=> b!56129 m!88415))

(declare-fun m!88417 () Bool)

(assert (=> b!56129 m!88417))

(assert (=> b!56129 m!88397))

(declare-fun m!88419 () Bool)

(assert (=> b!56129 m!88419))

(declare-fun m!88421 () Bool)

(assert (=> b!56129 m!88421))

(declare-fun m!88423 () Bool)

(assert (=> b!56129 m!88423))

(declare-fun m!88425 () Bool)

(assert (=> b!56129 m!88425))

(declare-fun m!88427 () Bool)

(assert (=> b!56129 m!88427))

(declare-fun m!88429 () Bool)

(assert (=> b!56129 m!88429))

(declare-fun m!88431 () Bool)

(assert (=> b!56129 m!88431))

(declare-fun m!88433 () Bool)

(assert (=> b!56129 m!88433))

(assert (=> b!56129 m!88423))

(assert (=> b!56129 m!88413))

(declare-fun m!88435 () Bool)

(assert (=> b!56129 m!88435))

(declare-fun m!88437 () Bool)

(assert (=> b!56129 m!88437))

(declare-fun m!88439 () Bool)

(assert (=> b!56129 m!88439))

(declare-fun m!88441 () Bool)

(assert (=> b!56129 m!88441))

(declare-fun m!88443 () Bool)

(assert (=> b!56129 m!88443))

(declare-fun m!88445 () Bool)

(assert (=> b!56129 m!88445))

(declare-fun m!88447 () Bool)

(assert (=> b!56129 m!88447))

(declare-fun m!88449 () Bool)

(assert (=> b!56129 m!88449))

(declare-fun m!88451 () Bool)

(assert (=> b!56129 m!88451))

(declare-fun m!88453 () Bool)

(assert (=> b!56131 m!88453))

(declare-fun m!88455 () Bool)

(assert (=> b!56126 m!88455))

(declare-fun m!88457 () Bool)

(assert (=> b!56126 m!88457))

(declare-fun m!88459 () Bool)

(assert (=> bm!723 m!88459))

(declare-fun m!88461 () Bool)

(assert (=> b!56130 m!88461))

(declare-fun m!88463 () Bool)

(assert (=> b!56130 m!88463))

(declare-fun m!88465 () Bool)

(assert (=> b!56130 m!88465))

(declare-fun m!88467 () Bool)

(assert (=> b!56130 m!88467))

(declare-fun m!88469 () Bool)

(assert (=> b!56130 m!88469))

(declare-fun m!88471 () Bool)

(assert (=> b!56125 m!88471))

(declare-fun m!88473 () Bool)

(assert (=> b!56127 m!88473))

(declare-fun m!88475 () Bool)

(assert (=> d!17882 m!88475))

(assert (=> d!17882 m!88167))

(declare-fun m!88477 () Bool)

(assert (=> d!17882 m!88477))

(declare-fun m!88479 () Bool)

(assert (=> d!17882 m!88479))

(assert (=> b!55900 d!17882))

(declare-fun b!56154 () Bool)

(declare-fun e!37364 () Unit!3863)

(declare-fun lt!88191 () Unit!3863)

(assert (=> b!56154 (= e!37364 lt!88191)))

(declare-fun lt!88182 () (_ BitVec 64))

(assert (=> b!56154 (= lt!88182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88180 () (_ BitVec 64))

(assert (=> b!56154 (= lt!88180 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2594 array!2594 (_ BitVec 64) (_ BitVec 64)) Unit!3863)

(assert (=> b!56154 (= lt!88191 (arrayBitRangesEqSymmetric!0 (buf!1546 thiss!1379) (buf!1546 (_2!2660 lt!87460)) lt!88182 lt!88180))))

(assert (=> b!56154 (arrayBitRangesEq!0 (buf!1546 (_2!2660 lt!87460)) (buf!1546 thiss!1379) lt!88182 lt!88180)))

(declare-fun b!56155 () Bool)

(declare-fun res!46737 () Bool)

(declare-fun e!37365 () Bool)

(assert (=> b!56155 (=> (not res!46737) (not e!37365))))

(declare-fun lt!88194 () tuple2!5100)

(assert (=> b!56155 (= res!46737 (isPrefixOf!0 (_1!2661 lt!88194) thiss!1379))))

(declare-fun b!56156 () Bool)

(declare-fun lt!88184 () (_ BitVec 64))

(declare-fun lt!88196 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2048 (_ BitVec 64)) BitStream!2048)

(assert (=> b!56156 (= e!37365 (= (_1!2661 lt!88194) (withMovedBitIndex!0 (_2!2661 lt!88194) (bvsub lt!88184 lt!88196))))))

(assert (=> b!56156 (or (= (bvand lt!88184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!88196 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!88184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!88184 lt!88196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!56156 (= lt!88196 (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87460))) (currentByte!3134 (_2!2660 lt!87460)) (currentBit!3129 (_2!2660 lt!87460))))))

(assert (=> b!56156 (= lt!88184 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)))))

(declare-fun d!17900 () Bool)

(assert (=> d!17900 e!37365))

(declare-fun res!46738 () Bool)

(assert (=> d!17900 (=> (not res!46738) (not e!37365))))

(assert (=> d!17900 (= res!46738 (isPrefixOf!0 (_1!2661 lt!88194) (_2!2661 lt!88194)))))

(declare-fun lt!88189 () BitStream!2048)

(assert (=> d!17900 (= lt!88194 (tuple2!5101 lt!88189 (_2!2660 lt!87460)))))

(declare-fun lt!88181 () Unit!3863)

(declare-fun lt!88198 () Unit!3863)

(assert (=> d!17900 (= lt!88181 lt!88198)))

(assert (=> d!17900 (isPrefixOf!0 lt!88189 (_2!2660 lt!87460))))

(assert (=> d!17900 (= lt!88198 (lemmaIsPrefixTransitive!0 lt!88189 (_2!2660 lt!87460) (_2!2660 lt!87460)))))

(declare-fun lt!88195 () Unit!3863)

(declare-fun lt!88193 () Unit!3863)

(assert (=> d!17900 (= lt!88195 lt!88193)))

(assert (=> d!17900 (isPrefixOf!0 lt!88189 (_2!2660 lt!87460))))

(assert (=> d!17900 (= lt!88193 (lemmaIsPrefixTransitive!0 lt!88189 thiss!1379 (_2!2660 lt!87460)))))

(declare-fun lt!88188 () Unit!3863)

(assert (=> d!17900 (= lt!88188 e!37364)))

(declare-fun c!4029 () Bool)

(assert (=> d!17900 (= c!4029 (not (= (size!1180 (buf!1546 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!88197 () Unit!3863)

(declare-fun lt!88183 () Unit!3863)

(assert (=> d!17900 (= lt!88197 lt!88183)))

(assert (=> d!17900 (isPrefixOf!0 (_2!2660 lt!87460) (_2!2660 lt!87460))))

(assert (=> d!17900 (= lt!88183 (lemmaIsPrefixRefl!0 (_2!2660 lt!87460)))))

(declare-fun lt!88190 () Unit!3863)

(declare-fun lt!88186 () Unit!3863)

(assert (=> d!17900 (= lt!88190 lt!88186)))

(assert (=> d!17900 (= lt!88186 (lemmaIsPrefixRefl!0 (_2!2660 lt!87460)))))

(declare-fun lt!88187 () Unit!3863)

(declare-fun lt!88185 () Unit!3863)

(assert (=> d!17900 (= lt!88187 lt!88185)))

(assert (=> d!17900 (isPrefixOf!0 lt!88189 lt!88189)))

(assert (=> d!17900 (= lt!88185 (lemmaIsPrefixRefl!0 lt!88189))))

(declare-fun lt!88179 () Unit!3863)

(declare-fun lt!88192 () Unit!3863)

(assert (=> d!17900 (= lt!88179 lt!88192)))

(assert (=> d!17900 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17900 (= lt!88192 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!17900 (= lt!88189 (BitStream!2049 (buf!1546 (_2!2660 lt!87460)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)))))

(assert (=> d!17900 (isPrefixOf!0 thiss!1379 (_2!2660 lt!87460))))

(assert (=> d!17900 (= (reader!0 thiss!1379 (_2!2660 lt!87460)) lt!88194)))

(declare-fun b!56157 () Bool)

(declare-fun res!46736 () Bool)

(assert (=> b!56157 (=> (not res!46736) (not e!37365))))

(assert (=> b!56157 (= res!46736 (isPrefixOf!0 (_2!2661 lt!88194) (_2!2660 lt!87460)))))

(declare-fun b!56158 () Bool)

(declare-fun Unit!3888 () Unit!3863)

(assert (=> b!56158 (= e!37364 Unit!3888)))

(assert (= (and d!17900 c!4029) b!56154))

(assert (= (and d!17900 (not c!4029)) b!56158))

(assert (= (and d!17900 res!46738) b!56155))

(assert (= (and b!56155 res!46737) b!56157))

(assert (= (and b!56157 res!46736) b!56156))

(assert (=> d!17900 m!88477))

(declare-fun m!88567 () Bool)

(assert (=> d!17900 m!88567))

(assert (=> d!17900 m!88109))

(assert (=> d!17900 m!88091))

(declare-fun m!88569 () Bool)

(assert (=> d!17900 m!88569))

(declare-fun m!88571 () Bool)

(assert (=> d!17900 m!88571))

(assert (=> d!17900 m!88111))

(declare-fun m!88573 () Bool)

(assert (=> d!17900 m!88573))

(declare-fun m!88575 () Bool)

(assert (=> d!17900 m!88575))

(assert (=> d!17900 m!88479))

(declare-fun m!88577 () Bool)

(assert (=> d!17900 m!88577))

(declare-fun m!88579 () Bool)

(assert (=> b!56157 m!88579))

(declare-fun m!88581 () Bool)

(assert (=> b!56156 m!88581))

(assert (=> b!56156 m!88167))

(assert (=> b!56156 m!88113))

(assert (=> b!56154 m!88113))

(declare-fun m!88583 () Bool)

(assert (=> b!56154 m!88583))

(declare-fun m!88585 () Bool)

(assert (=> b!56154 m!88585))

(declare-fun m!88587 () Bool)

(assert (=> b!56155 m!88587))

(assert (=> b!55900 d!17900))

(declare-fun d!17902 () Bool)

(assert (=> d!17902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1180 (buf!1546 (_2!2660 lt!87460)))) ((_ sign_extend 32) (currentByte!3134 thiss!1379)) ((_ sign_extend 32) (currentBit!3129 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4486 () Bool)

(assert (= bs!4486 d!17902))

(declare-fun m!88589 () Bool)

(assert (=> bs!4486 m!88589))

(assert (=> b!55900 d!17902))

(declare-fun d!17904 () Bool)

(declare-fun res!46739 () Bool)

(declare-fun e!37367 () Bool)

(assert (=> d!17904 (=> (not res!46739) (not e!37367))))

(assert (=> d!17904 (= res!46739 (= (size!1180 (buf!1546 thiss!1379)) (size!1180 (buf!1546 (_2!2660 lt!87458)))))))

(assert (=> d!17904 (= (isPrefixOf!0 thiss!1379 (_2!2660 lt!87458)) e!37367)))

(declare-fun b!56159 () Bool)

(declare-fun res!46740 () Bool)

(assert (=> b!56159 (=> (not res!46740) (not e!37367))))

(assert (=> b!56159 (= res!46740 (bvsle (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379)) (bitIndex!0 (size!1180 (buf!1546 (_2!2660 lt!87458))) (currentByte!3134 (_2!2660 lt!87458)) (currentBit!3129 (_2!2660 lt!87458)))))))

(declare-fun b!56160 () Bool)

(declare-fun e!37366 () Bool)

(assert (=> b!56160 (= e!37367 e!37366)))

(declare-fun res!46741 () Bool)

(assert (=> b!56160 (=> res!46741 e!37366)))

(assert (=> b!56160 (= res!46741 (= (size!1180 (buf!1546 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!56161 () Bool)

(assert (=> b!56161 (= e!37366 (arrayBitRangesEq!0 (buf!1546 thiss!1379) (buf!1546 (_2!2660 lt!87458)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1180 (buf!1546 thiss!1379)) (currentByte!3134 thiss!1379) (currentBit!3129 thiss!1379))))))

(assert (= (and d!17904 res!46739) b!56159))

(assert (= (and b!56159 res!46740) b!56160))

(assert (= (and b!56160 (not res!46741)) b!56161))

(assert (=> b!56159 m!88113))

(assert (=> b!56159 m!88083))

(assert (=> b!56161 m!88113))

(assert (=> b!56161 m!88113))

(declare-fun m!88591 () Bool)

(assert (=> b!56161 m!88591))

(assert (=> b!55900 d!17904))

(declare-fun d!17906 () Bool)

(assert (=> d!17906 (= (array_inv!1083 (buf!1546 thiss!1379)) (bvsge (size!1180 (buf!1546 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!55895 d!17906))

(declare-fun d!17908 () Bool)

(assert (=> d!17908 (= (head!418 (byteArrayBitContentToList!0 (_2!2660 lt!87460) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!714 (byteArrayBitContentToList!0 (_2!2660 lt!87460) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55897 d!17908))

(declare-fun d!17910 () Bool)

(declare-fun c!4032 () Bool)

(assert (=> d!17910 (= c!4032 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!37370 () List!599)

(assert (=> d!17910 (= (byteArrayBitContentToList!0 (_2!2660 lt!87460) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!37370)))

(declare-fun b!56166 () Bool)

(assert (=> b!56166 (= e!37370 Nil!596)))

(declare-fun b!56167 () Bool)

(assert (=> b!56167 (= e!37370 (Cons!595 (not (= (bvand ((_ sign_extend 24) (select (arr!1729 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2660 lt!87460) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17910 c!4032) b!56166))

(assert (= (and d!17910 (not c!4032)) b!56167))

(assert (=> b!56167 m!88085))

(assert (=> b!56167 m!88269))

(declare-fun m!88593 () Bool)

(assert (=> b!56167 m!88593))

(assert (=> b!55897 d!17910))

(declare-fun d!17912 () Bool)

(assert (=> d!17912 (= (head!418 (bitStreamReadBitsIntoList!0 (_2!2660 lt!87460) (_1!2661 lt!87459) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!714 (bitStreamReadBitsIntoList!0 (_2!2660 lt!87460) (_1!2661 lt!87459) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!55897 d!17912))

(declare-fun lt!88206 () (_ BitVec 64))

(declare-datatypes ((tuple2!5122 0))(
  ( (tuple2!5123 (_1!2672 List!599) (_2!2672 BitStream!2048)) )
))
(declare-fun e!37376 () tuple2!5122)

(declare-fun b!56177 () Bool)

(declare-datatypes ((tuple2!5124 0))(
  ( (tuple2!5125 (_1!2673 Bool) (_2!2673 BitStream!2048)) )
))
(declare-fun lt!88207 () tuple2!5124)

(assert (=> b!56177 (= e!37376 (tuple2!5123 (Cons!595 (_1!2673 lt!88207) (bitStreamReadBitsIntoList!0 (_2!2660 lt!87460) (_2!2673 lt!88207) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!88206))) (_2!2673 lt!88207)))))

(declare-fun readBit!0 (BitStream!2048) tuple2!5124)

(assert (=> b!56177 (= lt!88207 (readBit!0 (_1!2661 lt!87459)))))

(assert (=> b!56177 (= lt!88206 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!56178 () Bool)

(declare-fun e!37375 () Bool)

(declare-fun lt!88205 () List!599)

(declare-fun isEmpty!167 (List!599) Bool)

(assert (=> b!56178 (= e!37375 (isEmpty!167 lt!88205))))

(declare-fun d!17914 () Bool)

(assert (=> d!17914 e!37375))

(declare-fun c!4037 () Bool)

(assert (=> d!17914 (= c!4037 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17914 (= lt!88205 (_1!2672 e!37376))))

(declare-fun c!4038 () Bool)

(assert (=> d!17914 (= c!4038 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17914 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17914 (= (bitStreamReadBitsIntoList!0 (_2!2660 lt!87460) (_1!2661 lt!87459) #b0000000000000000000000000000000000000000000000000000000000000001) lt!88205)))

(declare-fun b!56176 () Bool)

(assert (=> b!56176 (= e!37376 (tuple2!5123 Nil!596 (_1!2661 lt!87459)))))

(declare-fun b!56179 () Bool)

(declare-fun length!281 (List!599) Int)

(assert (=> b!56179 (= e!37375 (> (length!281 lt!88205) 0))))

(assert (= (and d!17914 c!4038) b!56176))

(assert (= (and d!17914 (not c!4038)) b!56177))

(assert (= (and d!17914 c!4037) b!56178))

(assert (= (and d!17914 (not c!4037)) b!56179))

(declare-fun m!88595 () Bool)

(assert (=> b!56177 m!88595))

(declare-fun m!88597 () Bool)

(assert (=> b!56177 m!88597))

(declare-fun m!88599 () Bool)

(assert (=> b!56178 m!88599))

(declare-fun m!88601 () Bool)

(assert (=> b!56179 m!88601))

(assert (=> b!55897 d!17914))

(push 1)

(assert (not b!56159))

(assert (not d!17882))

(assert (not b!56154))

(assert (not d!17824))

(assert (not d!17816))

(assert (not b!56157))

(assert (not b!56130))

(assert (not b!56050))

(assert (not b!56156))

(assert (not b!56057))

(assert (not d!17838))

(assert (not d!17902))

(assert (not d!17880))

(assert (not b!56062))

(assert (not b!56179))

(assert (not b!56053))

(assert (not d!17876))

(assert (not b!55944))

(assert (not b!56177))

(assert (not b!56055))

(assert (not b!56178))

(assert (not b!55962))

(assert (not b!56060))

(assert (not b!56129))

(assert (not b!56052))

(assert (not b!56125))

(assert (not b!56131))

(assert (not d!17868))

(assert (not b!56155))

(assert (not b!56056))

(assert (not d!17874))

(assert (not b!55969))

(assert (not b!56126))

(assert (not d!17826))

(assert (not b!56051))

(assert (not b!55964))

(assert (not b!56127))

(assert (not b!56161))

(assert (not d!17870))

(assert (not b!56054))

(assert (not bm!723))

(assert (not b!56167))

(assert (not b!55946))

(assert (not d!17806))

(assert (not d!17900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

