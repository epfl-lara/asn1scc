; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10680 () Bool)

(assert start!10680)

(declare-fun b!53382 () Bool)

(declare-fun e!35568 () Bool)

(declare-fun e!35570 () Bool)

(assert (=> b!53382 (= e!35568 (not e!35570))))

(declare-fun res!44601 () Bool)

(assert (=> b!53382 (=> res!44601 e!35570)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!53382 (= res!44601 (bvsge i!635 to!314))))

(declare-datatypes ((array!2521 0))(
  ( (array!2522 (arr!1685 (Array (_ BitVec 32) (_ BitVec 8))) (size!1149 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1990 0))(
  ( (BitStream!1991 (buf!1499 array!2521) (currentByte!3066 (_ BitVec 32)) (currentBit!3061 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1990)

(declare-fun isPrefixOf!0 (BitStream!1990 BitStream!1990) Bool)

(assert (=> b!53382 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3708 0))(
  ( (Unit!3709) )
))
(declare-fun lt!82776 () Unit!3708)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1990) Unit!3708)

(assert (=> b!53382 (= lt!82776 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!82774 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!53382 (= lt!82774 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(declare-fun b!53383 () Bool)

(declare-fun res!44604 () Bool)

(assert (=> b!53383 (=> (not res!44604) (not e!35568))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53383 (= res!44604 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!44602 () Bool)

(assert (=> start!10680 (=> (not res!44602) (not e!35568))))

(declare-fun srcBuffer!2 () array!2521)

(assert (=> start!10680 (= res!44602 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1149 srcBuffer!2))))))))

(assert (=> start!10680 e!35568))

(assert (=> start!10680 true))

(declare-fun array_inv!1054 (array!2521) Bool)

(assert (=> start!10680 (array_inv!1054 srcBuffer!2)))

(declare-fun e!35573 () Bool)

(declare-fun inv!12 (BitStream!1990) Bool)

(assert (=> start!10680 (and (inv!12 thiss!1379) e!35573)))

(declare-fun b!53384 () Bool)

(declare-fun e!35569 () Bool)

(assert (=> b!53384 (= e!35570 e!35569)))

(declare-fun res!44603 () Bool)

(assert (=> b!53384 (=> res!44603 e!35569)))

(declare-datatypes ((tuple2!4866 0))(
  ( (tuple2!4867 (_1!2538 Unit!3708) (_2!2538 BitStream!1990)) )
))
(declare-fun lt!82772 () tuple2!4866)

(assert (=> b!53384 (= res!44603 (not (isPrefixOf!0 thiss!1379 (_2!2538 lt!82772))))))

(assert (=> b!53384 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!82777 () Unit!3708)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1990 BitStream!1990 (_ BitVec 64) (_ BitVec 64)) Unit!3708)

(assert (=> b!53384 (= lt!82777 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2538 lt!82772) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1990 (_ BitVec 8) (_ BitVec 32)) tuple2!4866)

(assert (=> b!53384 (= lt!82772 (appendBitFromByte!0 thiss!1379 (select (arr!1685 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!53385 () Bool)

(assert (=> b!53385 (= e!35573 (array_inv!1054 (buf!1499 thiss!1379)))))

(declare-fun b!53386 () Bool)

(declare-datatypes ((tuple2!4868 0))(
  ( (tuple2!4869 (_1!2539 BitStream!1990) (_2!2539 BitStream!1990)) )
))
(declare-fun lt!82773 () tuple2!4868)

(declare-datatypes ((List!570 0))(
  ( (Nil!567) (Cons!566 (h!685 Bool) (t!1320 List!570)) )
))
(declare-fun head!389 (List!570) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1990 array!2521 (_ BitVec 64) (_ BitVec 64)) List!570)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1990 BitStream!1990 (_ BitVec 64)) List!570)

(assert (=> b!53386 (= e!35569 (= (head!389 (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!389 (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_1!2539 lt!82773) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!53386 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!82775 () Unit!3708)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1990 array!2521 (_ BitVec 64)) Unit!3708)

(assert (=> b!53386 (= lt!82775 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1990 BitStream!1990) tuple2!4868)

(assert (=> b!53386 (= lt!82773 (reader!0 thiss!1379 (_2!2538 lt!82772)))))

(assert (= (and start!10680 res!44602) b!53383))

(assert (= (and b!53383 res!44604) b!53382))

(assert (= (and b!53382 (not res!44601)) b!53384))

(assert (= (and b!53384 (not res!44603)) b!53386))

(assert (= start!10680 b!53385))

(declare-fun m!83941 () Bool)

(assert (=> b!53382 m!83941))

(declare-fun m!83943 () Bool)

(assert (=> b!53382 m!83943))

(declare-fun m!83945 () Bool)

(assert (=> b!53382 m!83945))

(declare-fun m!83947 () Bool)

(assert (=> start!10680 m!83947))

(declare-fun m!83949 () Bool)

(assert (=> start!10680 m!83949))

(declare-fun m!83951 () Bool)

(assert (=> b!53383 m!83951))

(declare-fun m!83953 () Bool)

(assert (=> b!53385 m!83953))

(declare-fun m!83955 () Bool)

(assert (=> b!53386 m!83955))

(declare-fun m!83957 () Bool)

(assert (=> b!53386 m!83957))

(declare-fun m!83959 () Bool)

(assert (=> b!53386 m!83959))

(declare-fun m!83961 () Bool)

(assert (=> b!53386 m!83961))

(declare-fun m!83963 () Bool)

(assert (=> b!53386 m!83963))

(assert (=> b!53386 m!83955))

(declare-fun m!83965 () Bool)

(assert (=> b!53386 m!83965))

(assert (=> b!53386 m!83957))

(declare-fun m!83967 () Bool)

(assert (=> b!53386 m!83967))

(declare-fun m!83969 () Bool)

(assert (=> b!53384 m!83969))

(declare-fun m!83971 () Bool)

(assert (=> b!53384 m!83971))

(declare-fun m!83973 () Bool)

(assert (=> b!53384 m!83973))

(assert (=> b!53384 m!83969))

(declare-fun m!83975 () Bool)

(assert (=> b!53384 m!83975))

(declare-fun m!83977 () Bool)

(assert (=> b!53384 m!83977))

(push 1)

(assert (not b!53385))

(assert (not b!53386))

(assert (not b!53384))

(assert (not b!53383))

(assert (not b!53382))

(assert (not start!10680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16910 () Bool)

(assert (=> d!16910 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!82819 () Unit!3708)

(declare-fun choose!9 (BitStream!1990 array!2521 (_ BitVec 64) BitStream!1990) Unit!3708)

(assert (=> d!16910 (= lt!82819 (choose!9 thiss!1379 (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1991 (buf!1499 (_2!2538 lt!82772)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (=> d!16910 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82819)))

(declare-fun bs!4293 () Bool)

(assert (= bs!4293 d!16910))

(assert (=> bs!4293 m!83959))

(declare-fun m!84061 () Bool)

(assert (=> bs!4293 m!84061))

(assert (=> b!53386 d!16910))

(declare-fun d!16914 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16914 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4294 () Bool)

(assert (= bs!4294 d!16914))

(declare-fun m!84063 () Bool)

(assert (=> bs!4294 m!84063))

(assert (=> b!53386 d!16914))

(declare-fun b!53443 () Bool)

(declare-datatypes ((tuple2!4878 0))(
  ( (tuple2!4879 (_1!2544 List!570) (_2!2544 BitStream!1990)) )
))
(declare-fun e!35625 () tuple2!4878)

(assert (=> b!53443 (= e!35625 (tuple2!4879 Nil!567 (_1!2539 lt!82773)))))

(declare-fun b!53445 () Bool)

(declare-fun e!35626 () Bool)

(declare-fun lt!82844 () List!570)

(declare-fun isEmpty!151 (List!570) Bool)

(assert (=> b!53445 (= e!35626 (isEmpty!151 lt!82844))))

(declare-datatypes ((tuple2!4880 0))(
  ( (tuple2!4881 (_1!2545 Bool) (_2!2545 BitStream!1990)) )
))
(declare-fun lt!82845 () tuple2!4880)

(declare-fun lt!82846 () (_ BitVec 64))

(declare-fun b!53444 () Bool)

(assert (=> b!53444 (= e!35625 (tuple2!4879 (Cons!566 (_1!2545 lt!82845) (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_2!2545 lt!82845) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!82846))) (_2!2545 lt!82845)))))

(declare-fun readBit!0 (BitStream!1990) tuple2!4880)

(assert (=> b!53444 (= lt!82845 (readBit!0 (_1!2539 lt!82773)))))

(assert (=> b!53444 (= lt!82846 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!53446 () Bool)

(declare-fun length!265 (List!570) Int)

(assert (=> b!53446 (= e!35626 (> (length!265 lt!82844) 0))))

(declare-fun d!16916 () Bool)

(assert (=> d!16916 e!35626))

(declare-fun c!3768 () Bool)

(assert (=> d!16916 (= c!3768 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16916 (= lt!82844 (_1!2544 e!35625))))

(declare-fun c!3767 () Bool)

(assert (=> d!16916 (= c!3767 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16916 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16916 (= (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_1!2539 lt!82773) #b0000000000000000000000000000000000000000000000000000000000000001) lt!82844)))

(assert (= (and d!16916 c!3767) b!53443))

(assert (= (and d!16916 (not c!3767)) b!53444))

(assert (= (and d!16916 c!3768) b!53445))

(assert (= (and d!16916 (not c!3768)) b!53446))

(declare-fun m!84073 () Bool)

(assert (=> b!53445 m!84073))

(declare-fun m!84075 () Bool)

(assert (=> b!53444 m!84075))

(declare-fun m!84077 () Bool)

(assert (=> b!53444 m!84077))

(declare-fun m!84079 () Bool)

(assert (=> b!53446 m!84079))

(assert (=> b!53386 d!16916))

(declare-fun d!16924 () Bool)

(assert (=> d!16924 (= (head!389 (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!685 (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!53386 d!16924))

(declare-fun lt!82926 () (_ BitVec 64))

(declare-fun lt!82925 () tuple2!4868)

(declare-fun b!53475 () Bool)

(declare-fun lt!82924 () (_ BitVec 64))

(declare-fun e!35644 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1990 (_ BitVec 64)) BitStream!1990)

(assert (=> b!53475 (= e!35644 (= (_1!2539 lt!82925) (withMovedBitIndex!0 (_2!2539 lt!82925) (bvsub lt!82924 lt!82926))))))

(assert (=> b!53475 (or (= (bvand lt!82924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82926 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82924 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82924 lt!82926) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53475 (= lt!82926 (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772))))))

(assert (=> b!53475 (= lt!82924 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(declare-fun b!53476 () Bool)

(declare-fun res!44672 () Bool)

(assert (=> b!53476 (=> (not res!44672) (not e!35644))))

(assert (=> b!53476 (= res!44672 (isPrefixOf!0 (_1!2539 lt!82925) thiss!1379))))

(declare-fun b!53477 () Bool)

(declare-fun e!35643 () Unit!3708)

(declare-fun lt!82923 () Unit!3708)

(assert (=> b!53477 (= e!35643 lt!82923)))

(declare-fun lt!82922 () (_ BitVec 64))

(assert (=> b!53477 (= lt!82922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82928 () (_ BitVec 64))

(assert (=> b!53477 (= lt!82928 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2521 array!2521 (_ BitVec 64) (_ BitVec 64)) Unit!3708)

(assert (=> b!53477 (= lt!82923 (arrayBitRangesEqSymmetric!0 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!82772)) lt!82922 lt!82928))))

(declare-fun arrayBitRangesEq!0 (array!2521 array!2521 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!53477 (arrayBitRangesEq!0 (buf!1499 (_2!2538 lt!82772)) (buf!1499 thiss!1379) lt!82922 lt!82928)))

(declare-fun d!16926 () Bool)

(assert (=> d!16926 e!35644))

(declare-fun res!44673 () Bool)

(assert (=> d!16926 (=> (not res!44673) (not e!35644))))

(assert (=> d!16926 (= res!44673 (isPrefixOf!0 (_1!2539 lt!82925) (_2!2539 lt!82925)))))

(declare-fun lt!82927 () BitStream!1990)

(assert (=> d!16926 (= lt!82925 (tuple2!4869 lt!82927 (_2!2538 lt!82772)))))

(declare-fun lt!82932 () Unit!3708)

(declare-fun lt!82920 () Unit!3708)

(assert (=> d!16926 (= lt!82932 lt!82920)))

(assert (=> d!16926 (isPrefixOf!0 lt!82927 (_2!2538 lt!82772))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1990 BitStream!1990 BitStream!1990) Unit!3708)

(assert (=> d!16926 (= lt!82920 (lemmaIsPrefixTransitive!0 lt!82927 (_2!2538 lt!82772) (_2!2538 lt!82772)))))

(declare-fun lt!82931 () Unit!3708)

(declare-fun lt!82930 () Unit!3708)

(assert (=> d!16926 (= lt!82931 lt!82930)))

(assert (=> d!16926 (isPrefixOf!0 lt!82927 (_2!2538 lt!82772))))

(assert (=> d!16926 (= lt!82930 (lemmaIsPrefixTransitive!0 lt!82927 thiss!1379 (_2!2538 lt!82772)))))

(declare-fun lt!82919 () Unit!3708)

(assert (=> d!16926 (= lt!82919 e!35643)))

(declare-fun c!3771 () Bool)

(assert (=> d!16926 (= c!3771 (not (= (size!1149 (buf!1499 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82917 () Unit!3708)

(declare-fun lt!82929 () Unit!3708)

(assert (=> d!16926 (= lt!82917 lt!82929)))

(assert (=> d!16926 (isPrefixOf!0 (_2!2538 lt!82772) (_2!2538 lt!82772))))

(assert (=> d!16926 (= lt!82929 (lemmaIsPrefixRefl!0 (_2!2538 lt!82772)))))

(declare-fun lt!82933 () Unit!3708)

(declare-fun lt!82915 () Unit!3708)

(assert (=> d!16926 (= lt!82933 lt!82915)))

(assert (=> d!16926 (= lt!82915 (lemmaIsPrefixRefl!0 (_2!2538 lt!82772)))))

(declare-fun lt!82916 () Unit!3708)

(declare-fun lt!82921 () Unit!3708)

(assert (=> d!16926 (= lt!82916 lt!82921)))

(assert (=> d!16926 (isPrefixOf!0 lt!82927 lt!82927)))

(assert (=> d!16926 (= lt!82921 (lemmaIsPrefixRefl!0 lt!82927))))

(declare-fun lt!82918 () Unit!3708)

(declare-fun lt!82914 () Unit!3708)

(assert (=> d!16926 (= lt!82918 lt!82914)))

(assert (=> d!16926 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16926 (= lt!82914 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16926 (= lt!82927 (BitStream!1991 (buf!1499 (_2!2538 lt!82772)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(assert (=> d!16926 (isPrefixOf!0 thiss!1379 (_2!2538 lt!82772))))

(assert (=> d!16926 (= (reader!0 thiss!1379 (_2!2538 lt!82772)) lt!82925)))

(declare-fun b!53478 () Bool)

(declare-fun Unit!3714 () Unit!3708)

(assert (=> b!53478 (= e!35643 Unit!3714)))

(declare-fun b!53479 () Bool)

(declare-fun res!44671 () Bool)

(assert (=> b!53479 (=> (not res!44671) (not e!35644))))

(assert (=> b!53479 (= res!44671 (isPrefixOf!0 (_2!2539 lt!82925) (_2!2538 lt!82772)))))

(assert (= (and d!16926 c!3771) b!53477))

(assert (= (and d!16926 (not c!3771)) b!53478))

(assert (= (and d!16926 res!44673) b!53476))

(assert (= (and b!53476 res!44672) b!53479))

(assert (= (and b!53479 res!44671) b!53475))

(assert (=> b!53477 m!83945))

(declare-fun m!84095 () Bool)

(assert (=> b!53477 m!84095))

(declare-fun m!84097 () Bool)

(assert (=> b!53477 m!84097))

(declare-fun m!84099 () Bool)

(assert (=> b!53475 m!84099))

(declare-fun m!84101 () Bool)

(assert (=> b!53475 m!84101))

(assert (=> b!53475 m!83945))

(declare-fun m!84103 () Bool)

(assert (=> b!53479 m!84103))

(declare-fun m!84105 () Bool)

(assert (=> d!16926 m!84105))

(declare-fun m!84107 () Bool)

(assert (=> d!16926 m!84107))

(declare-fun m!84109 () Bool)

(assert (=> d!16926 m!84109))

(assert (=> d!16926 m!83941))

(declare-fun m!84111 () Bool)

(assert (=> d!16926 m!84111))

(declare-fun m!84113 () Bool)

(assert (=> d!16926 m!84113))

(declare-fun m!84115 () Bool)

(assert (=> d!16926 m!84115))

(declare-fun m!84117 () Bool)

(assert (=> d!16926 m!84117))

(declare-fun m!84119 () Bool)

(assert (=> d!16926 m!84119))

(assert (=> d!16926 m!83977))

(assert (=> d!16926 m!83943))

(declare-fun m!84121 () Bool)

(assert (=> b!53476 m!84121))

(assert (=> b!53386 d!16926))

(declare-fun d!16946 () Bool)

(assert (=> d!16946 (= (head!389 (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_1!2539 lt!82773) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!685 (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_1!2539 lt!82773) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!53386 d!16946))

(declare-fun d!16948 () Bool)

(declare-fun c!3774 () Bool)

(assert (=> d!16948 (= c!3774 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!35647 () List!570)

(assert (=> d!16948 (= (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!35647)))

(declare-fun b!53484 () Bool)

(assert (=> b!53484 (= e!35647 Nil!567)))

(declare-fun b!53485 () Bool)

(assert (=> b!53485 (= e!35647 (Cons!566 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16948 c!3774) b!53484))

(assert (= (and d!16948 (not c!3774)) b!53485))

(assert (=> b!53485 m!83969))

(declare-fun m!84123 () Bool)

(assert (=> b!53485 m!84123))

(declare-fun m!84125 () Bool)

(assert (=> b!53485 m!84125))

(assert (=> b!53386 d!16948))

(declare-fun d!16950 () Bool)

(assert (=> d!16950 (= (array_inv!1054 (buf!1499 thiss!1379)) (bvsge (size!1149 (buf!1499 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!53385 d!16950))

(declare-fun d!16952 () Bool)

(declare-fun res!44681 () Bool)

(declare-fun e!35652 () Bool)

(assert (=> d!16952 (=> (not res!44681) (not e!35652))))

(assert (=> d!16952 (= res!44681 (= (size!1149 (buf!1499 thiss!1379)) (size!1149 (buf!1499 thiss!1379))))))

(assert (=> d!16952 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35652)))

(declare-fun b!53492 () Bool)

(declare-fun res!44682 () Bool)

(assert (=> b!53492 (=> (not res!44682) (not e!35652))))

(assert (=> b!53492 (= res!44682 (bvsle (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(declare-fun b!53493 () Bool)

(declare-fun e!35653 () Bool)

(assert (=> b!53493 (= e!35652 e!35653)))

(declare-fun res!44680 () Bool)

(assert (=> b!53493 (=> res!44680 e!35653)))

(assert (=> b!53493 (= res!44680 (= (size!1149 (buf!1499 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53494 () Bool)

(assert (=> b!53494 (= e!35653 (arrayBitRangesEq!0 (buf!1499 thiss!1379) (buf!1499 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (= (and d!16952 res!44681) b!53492))

(assert (= (and b!53492 res!44682) b!53493))

(assert (= (and b!53493 (not res!44680)) b!53494))

(assert (=> b!53492 m!83945))

(assert (=> b!53492 m!83945))

(assert (=> b!53494 m!83945))

(assert (=> b!53494 m!83945))

(declare-fun m!84127 () Bool)

(assert (=> b!53494 m!84127))

(assert (=> b!53382 d!16952))

(declare-fun d!16954 () Bool)

(assert (=> d!16954 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!82936 () Unit!3708)

(declare-fun choose!11 (BitStream!1990) Unit!3708)

(assert (=> d!16954 (= lt!82936 (choose!11 thiss!1379))))

(assert (=> d!16954 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!82936)))

(declare-fun bs!4302 () Bool)

(assert (= bs!4302 d!16954))

(assert (=> bs!4302 m!83941))

(declare-fun m!84129 () Bool)

(assert (=> bs!4302 m!84129))

(assert (=> b!53382 d!16954))

(declare-fun d!16956 () Bool)

(declare-fun e!35662 () Bool)

(assert (=> d!16956 e!35662))

(declare-fun res!44697 () Bool)

(assert (=> d!16956 (=> (not res!44697) (not e!35662))))

(declare-fun lt!83012 () (_ BitVec 64))

(declare-fun lt!83009 () (_ BitVec 64))

(declare-fun lt!83013 () (_ BitVec 64))

(assert (=> d!16956 (= res!44697 (= lt!83009 (bvsub lt!83012 lt!83013)))))

(assert (=> d!16956 (or (= (bvand lt!83012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83013 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83012 lt!83013) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16956 (= lt!83013 (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379))))))

(declare-fun lt!83011 () (_ BitVec 64))

(declare-fun lt!83010 () (_ BitVec 64))

(assert (=> d!16956 (= lt!83012 (bvmul lt!83011 lt!83010))))

(assert (=> d!16956 (or (= lt!83011 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83010 (bvsdiv (bvmul lt!83011 lt!83010) lt!83011)))))

(assert (=> d!16956 (= lt!83010 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16956 (= lt!83011 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))))))

(assert (=> d!16956 (= lt!83009 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 thiss!1379))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!16956 (invariant!0 (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379) (size!1149 (buf!1499 thiss!1379)))))

(assert (=> d!16956 (= (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) lt!83009)))

(declare-fun b!53514 () Bool)

(declare-fun res!44696 () Bool)

(assert (=> b!53514 (=> (not res!44696) (not e!35662))))

(assert (=> b!53514 (= res!44696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83009))))

(declare-fun b!53515 () Bool)

(declare-fun lt!83014 () (_ BitVec 64))

(assert (=> b!53515 (= e!35662 (bvsle lt!83009 (bvmul lt!83014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53515 (or (= lt!83014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83014)))))

(assert (=> b!53515 (= lt!83014 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))))))

(assert (= (and d!16956 res!44697) b!53514))

(assert (= (and b!53514 res!44696) b!53515))

(declare-fun m!84159 () Bool)

(assert (=> d!16956 m!84159))

(declare-fun m!84161 () Bool)

(assert (=> d!16956 m!84161))

(assert (=> b!53382 d!16956))

(declare-fun d!16960 () Bool)

(assert (=> d!16960 (= (array_inv!1054 srcBuffer!2) (bvsge (size!1149 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10680 d!16960))

(declare-fun d!16962 () Bool)

(assert (=> d!16962 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379) (size!1149 (buf!1499 thiss!1379))))))

(declare-fun bs!4303 () Bool)

(assert (= bs!4303 d!16962))

(assert (=> bs!4303 m!84161))

(assert (=> start!10680 d!16962))

(declare-fun d!16964 () Bool)

(assert (=> d!16964 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4304 () Bool)

(assert (= bs!4304 d!16964))

(assert (=> bs!4304 m!84159))

(assert (=> b!53383 d!16964))

(declare-fun d!16966 () Bool)

(declare-fun res!44699 () Bool)

(declare-fun e!35663 () Bool)

(assert (=> d!16966 (=> (not res!44699) (not e!35663))))

(assert (=> d!16966 (= res!44699 (= (size!1149 (buf!1499 thiss!1379)) (size!1149 (buf!1499 (_2!2538 lt!82772)))))))

(assert (=> d!16966 (= (isPrefixOf!0 thiss!1379 (_2!2538 lt!82772)) e!35663)))

(declare-fun b!53516 () Bool)

(declare-fun res!44700 () Bool)

(assert (=> b!53516 (=> (not res!44700) (not e!35663))))

(assert (=> b!53516 (= res!44700 (bvsle (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772)))))))

(declare-fun b!53517 () Bool)

(declare-fun e!35664 () Bool)

(assert (=> b!53517 (= e!35663 e!35664)))

(declare-fun res!44698 () Bool)

(assert (=> b!53517 (=> res!44698 e!35664)))

(assert (=> b!53517 (= res!44698 (= (size!1149 (buf!1499 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53518 () Bool)

(assert (=> b!53518 (= e!35664 (arrayBitRangesEq!0 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (= (and d!16966 res!44699) b!53516))

(assert (= (and b!53516 res!44700) b!53517))

(assert (= (and b!53517 (not res!44698)) b!53518))

(assert (=> b!53516 m!83945))

(assert (=> b!53516 m!84101))

(assert (=> b!53518 m!83945))

(assert (=> b!53518 m!83945))

(declare-fun m!84163 () Bool)

(assert (=> b!53518 m!84163))

(assert (=> b!53384 d!16966))

(declare-fun d!16968 () Bool)

(assert (=> d!16968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4305 () Bool)

(assert (= bs!4305 d!16968))

(declare-fun m!84165 () Bool)

(assert (=> bs!4305 m!84165))

(assert (=> b!53384 d!16968))

(declare-fun d!16970 () Bool)

(declare-fun e!35670 () Bool)

(assert (=> d!16970 e!35670))

(declare-fun res!44703 () Bool)

(assert (=> d!16970 (=> (not res!44703) (not e!35670))))

(assert (=> d!16970 (= res!44703 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!83017 () Unit!3708)

(declare-fun choose!27 (BitStream!1990 BitStream!1990 (_ BitVec 64) (_ BitVec 64)) Unit!3708)

(assert (=> d!16970 (= lt!83017 (choose!27 thiss!1379 (_2!2538 lt!82772) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16970 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16970 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2538 lt!82772) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!83017)))

(declare-fun b!53527 () Bool)

(assert (=> b!53527 (= e!35670 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16970 res!44703) b!53527))

(declare-fun m!84171 () Bool)

(assert (=> d!16970 m!84171))

(assert (=> b!53527 m!83971))

(assert (=> b!53384 d!16970))

(declare-fun b!53632 () Bool)

(declare-fun res!44778 () Bool)

(declare-fun e!35723 () Bool)

(assert (=> b!53632 (=> (not res!44778) (not e!35723))))

(declare-fun lt!83187 () tuple2!4866)

(assert (=> b!53632 (= res!44778 (isPrefixOf!0 thiss!1379 (_2!2538 lt!83187)))))

(declare-fun b!53633 () Bool)

(declare-fun e!35726 () Bool)

(declare-datatypes ((tuple2!4890 0))(
  ( (tuple2!4891 (_1!2550 BitStream!1990) (_2!2550 Bool)) )
))
(declare-fun lt!83183 () tuple2!4890)

(declare-fun lt!83179 () tuple2!4866)

(assert (=> b!53633 (= e!35726 (= (bitIndex!0 (size!1149 (buf!1499 (_1!2550 lt!83183))) (currentByte!3066 (_1!2550 lt!83183)) (currentBit!3061 (_1!2550 lt!83183))) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83179))) (currentByte!3066 (_2!2538 lt!83179)) (currentBit!3061 (_2!2538 lt!83179)))))))

(declare-fun b!53634 () Bool)

(declare-fun e!35724 () Bool)

(declare-fun lt!83180 () tuple2!4890)

(assert (=> b!53634 (= e!35724 (= (bitIndex!0 (size!1149 (buf!1499 (_1!2550 lt!83180))) (currentByte!3066 (_1!2550 lt!83180)) (currentBit!3061 (_1!2550 lt!83180))) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83187))) (currentByte!3066 (_2!2538 lt!83187)) (currentBit!3061 (_2!2538 lt!83187)))))))

(declare-fun d!16976 () Bool)

(assert (=> d!16976 e!35723))

(declare-fun res!44777 () Bool)

(assert (=> d!16976 (=> (not res!44777) (not e!35723))))

(assert (=> d!16976 (= res!44777 (= (size!1149 (buf!1499 (_2!2538 lt!83187))) (size!1149 (buf!1499 thiss!1379))))))

(declare-fun lt!83178 () (_ BitVec 8))

(declare-fun lt!83184 () array!2521)

(assert (=> d!16976 (= lt!83178 (select (arr!1685 lt!83184) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16976 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1149 lt!83184)))))

(assert (=> d!16976 (= lt!83184 (array!2522 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!83181 () tuple2!4866)

(assert (=> d!16976 (= lt!83187 (tuple2!4867 (_1!2538 lt!83181) (_2!2538 lt!83181)))))

(assert (=> d!16976 (= lt!83181 lt!83179)))

(declare-fun e!35725 () Bool)

(assert (=> d!16976 e!35725))

(declare-fun res!44775 () Bool)

(assert (=> d!16976 (=> (not res!44775) (not e!35725))))

(assert (=> d!16976 (= res!44775 (= (size!1149 (buf!1499 thiss!1379)) (size!1149 (buf!1499 (_2!2538 lt!83179)))))))

(declare-fun lt!83189 () Bool)

(declare-fun appendBit!0 (BitStream!1990 Bool) tuple2!4866)

(assert (=> d!16976 (= lt!83179 (appendBit!0 thiss!1379 lt!83189))))

(assert (=> d!16976 (= lt!83189 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1685 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16976 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16976 (= (appendBitFromByte!0 thiss!1379 (select (arr!1685 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!83187)))

(declare-fun b!53635 () Bool)

(assert (=> b!53635 (= e!35723 e!35724)))

(declare-fun res!44771 () Bool)

(assert (=> b!53635 (=> (not res!44771) (not e!35724))))

(assert (=> b!53635 (= res!44771 (and (= (_2!2550 lt!83180) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1685 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!83178)) #b00000000000000000000000000000000))) (= (_1!2550 lt!83180) (_2!2538 lt!83187))))))

(declare-datatypes ((tuple2!4896 0))(
  ( (tuple2!4897 (_1!2553 array!2521) (_2!2553 BitStream!1990)) )
))
(declare-fun lt!83182 () tuple2!4896)

(declare-fun lt!83185 () BitStream!1990)

(declare-fun readBits!0 (BitStream!1990 (_ BitVec 64)) tuple2!4896)

(assert (=> b!53635 (= lt!83182 (readBits!0 lt!83185 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1990) tuple2!4890)

(assert (=> b!53635 (= lt!83180 (readBitPure!0 lt!83185))))

(declare-fun readerFrom!0 (BitStream!1990 (_ BitVec 32) (_ BitVec 32)) BitStream!1990)

(assert (=> b!53635 (= lt!83185 (readerFrom!0 (_2!2538 lt!83187) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379)))))

(declare-fun b!53636 () Bool)

(assert (=> b!53636 (= e!35725 e!35726)))

(declare-fun res!44773 () Bool)

(assert (=> b!53636 (=> (not res!44773) (not e!35726))))

(assert (=> b!53636 (= res!44773 (and (= (_2!2550 lt!83183) lt!83189) (= (_1!2550 lt!83183) (_2!2538 lt!83179))))))

(assert (=> b!53636 (= lt!83183 (readBitPure!0 (readerFrom!0 (_2!2538 lt!83179) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379))))))

(declare-fun b!53637 () Bool)

(declare-fun res!44776 () Bool)

(assert (=> b!53637 (=> (not res!44776) (not e!35725))))

(assert (=> b!53637 (= res!44776 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83179))) (currentByte!3066 (_2!2538 lt!83179)) (currentBit!3061 (_2!2538 lt!83179))) (bvadd (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53638 () Bool)

(declare-fun res!44774 () Bool)

(assert (=> b!53638 (=> (not res!44774) (not e!35723))))

(declare-fun lt!83186 () (_ BitVec 64))

(declare-fun lt!83188 () (_ BitVec 64))

(assert (=> b!53638 (= res!44774 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83187))) (currentByte!3066 (_2!2538 lt!83187)) (currentBit!3061 (_2!2538 lt!83187))) (bvadd lt!83186 lt!83188)))))

(assert (=> b!53638 (or (not (= (bvand lt!83186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83188 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83186 lt!83188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53638 (= lt!83188 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53638 (= lt!83186 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(declare-fun b!53639 () Bool)

(declare-fun res!44772 () Bool)

(assert (=> b!53639 (=> (not res!44772) (not e!35725))))

(assert (=> b!53639 (= res!44772 (isPrefixOf!0 thiss!1379 (_2!2538 lt!83179)))))

(assert (= (and d!16976 res!44775) b!53637))

(assert (= (and b!53637 res!44776) b!53639))

(assert (= (and b!53639 res!44772) b!53636))

(assert (= (and b!53636 res!44773) b!53633))

(assert (= (and d!16976 res!44777) b!53638))

(assert (= (and b!53638 res!44774) b!53632))

(assert (= (and b!53632 res!44778) b!53635))

(assert (= (and b!53635 res!44771) b!53634))

(declare-fun m!84255 () Bool)

(assert (=> b!53632 m!84255))

(declare-fun m!84257 () Bool)

(assert (=> d!16976 m!84257))

(declare-fun m!84259 () Bool)

(assert (=> d!16976 m!84259))

(assert (=> d!16976 m!84123))

(declare-fun m!84261 () Bool)

(assert (=> b!53639 m!84261))

(declare-fun m!84263 () Bool)

(assert (=> b!53636 m!84263))

(assert (=> b!53636 m!84263))

(declare-fun m!84265 () Bool)

(assert (=> b!53636 m!84265))

(declare-fun m!84267 () Bool)

(assert (=> b!53635 m!84267))

(declare-fun m!84269 () Bool)

(assert (=> b!53635 m!84269))

(declare-fun m!84271 () Bool)

(assert (=> b!53635 m!84271))

(declare-fun m!84273 () Bool)

(assert (=> b!53638 m!84273))

(assert (=> b!53638 m!83945))

(declare-fun m!84275 () Bool)

(assert (=> b!53633 m!84275))

(declare-fun m!84277 () Bool)

(assert (=> b!53633 m!84277))

(assert (=> b!53637 m!84277))

(assert (=> b!53637 m!83945))

(declare-fun m!84279 () Bool)

(assert (=> b!53634 m!84279))

(assert (=> b!53634 m!84273))

(assert (=> b!53384 d!16976))

(push 1)

(assert (not d!16956))

(assert (not b!53638))

(assert (not b!53477))

(assert (not d!16970))

(assert (not b!53492))

(assert (not d!16926))

(assert (not b!53444))

(assert (not b!53634))

(assert (not b!53446))

(assert (not b!53485))

(assert (not d!16976))

(assert (not b!53475))

(assert (not b!53494))

(assert (not b!53445))

(assert (not b!53637))

(assert (not b!53633))

(assert (not b!53636))

(assert (not d!16910))

(assert (not b!53639))

(assert (not d!16914))

(assert (not d!16964))

(assert (not d!16954))

(assert (not b!53476))

(assert (not d!16968))

(assert (not b!53518))

(assert (not b!53479))

(assert (not b!53635))

(assert (not b!53632))

(assert (not b!53527))

(assert (not d!16962))

(assert (not b!53516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!17090 () Bool)

(declare-fun e!35810 () Bool)

(assert (=> d!17090 e!35810))

(declare-fun res!44889 () Bool)

(assert (=> d!17090 (=> (not res!44889) (not e!35810))))

(declare-fun lt!83340 () (_ BitVec 64))

(declare-fun lt!83341 () (_ BitVec 64))

(declare-fun lt!83337 () (_ BitVec 64))

(assert (=> d!17090 (= res!44889 (= lt!83337 (bvsub lt!83340 lt!83341)))))

(assert (=> d!17090 (or (= (bvand lt!83340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83341 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83340 lt!83341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17090 (= lt!83341 (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2550 lt!83180)))) ((_ sign_extend 32) (currentByte!3066 (_1!2550 lt!83180))) ((_ sign_extend 32) (currentBit!3061 (_1!2550 lt!83180)))))))

(declare-fun lt!83339 () (_ BitVec 64))

(declare-fun lt!83338 () (_ BitVec 64))

(assert (=> d!17090 (= lt!83340 (bvmul lt!83339 lt!83338))))

(assert (=> d!17090 (or (= lt!83339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83338 (bvsdiv (bvmul lt!83339 lt!83338) lt!83339)))))

(assert (=> d!17090 (= lt!83338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17090 (= lt!83339 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2550 lt!83180)))))))

(assert (=> d!17090 (= lt!83337 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 (_1!2550 lt!83180))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 (_1!2550 lt!83180)))))))

(assert (=> d!17090 (invariant!0 (currentBit!3061 (_1!2550 lt!83180)) (currentByte!3066 (_1!2550 lt!83180)) (size!1149 (buf!1499 (_1!2550 lt!83180))))))

(assert (=> d!17090 (= (bitIndex!0 (size!1149 (buf!1499 (_1!2550 lt!83180))) (currentByte!3066 (_1!2550 lt!83180)) (currentBit!3061 (_1!2550 lt!83180))) lt!83337)))

(declare-fun b!53767 () Bool)

(declare-fun res!44888 () Bool)

(assert (=> b!53767 (=> (not res!44888) (not e!35810))))

(assert (=> b!53767 (= res!44888 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83337))))

(declare-fun b!53768 () Bool)

(declare-fun lt!83342 () (_ BitVec 64))

(assert (=> b!53768 (= e!35810 (bvsle lt!83337 (bvmul lt!83342 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53768 (or (= lt!83342 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83342 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83342)))))

(assert (=> b!53768 (= lt!83342 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2550 lt!83180)))))))

(assert (= (and d!17090 res!44889) b!53767))

(assert (= (and b!53767 res!44888) b!53768))

(declare-fun m!84469 () Bool)

(assert (=> d!17090 m!84469))

(declare-fun m!84471 () Bool)

(assert (=> d!17090 m!84471))

(assert (=> b!53634 d!17090))

(declare-fun d!17092 () Bool)

(declare-fun e!35811 () Bool)

(assert (=> d!17092 e!35811))

(declare-fun res!44891 () Bool)

(assert (=> d!17092 (=> (not res!44891) (not e!35811))))

(declare-fun lt!83346 () (_ BitVec 64))

(declare-fun lt!83347 () (_ BitVec 64))

(declare-fun lt!83343 () (_ BitVec 64))

(assert (=> d!17092 (= res!44891 (= lt!83343 (bvsub lt!83346 lt!83347)))))

(assert (=> d!17092 (or (= (bvand lt!83346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83347 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83346 lt!83347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17092 (= lt!83347 (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!83187)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!83187))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!83187)))))))

(declare-fun lt!83345 () (_ BitVec 64))

(declare-fun lt!83344 () (_ BitVec 64))

(assert (=> d!17092 (= lt!83346 (bvmul lt!83345 lt!83344))))

(assert (=> d!17092 (or (= lt!83345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83344 (bvsdiv (bvmul lt!83345 lt!83344) lt!83345)))))

(assert (=> d!17092 (= lt!83344 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17092 (= lt!83345 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!83187)))))))

(assert (=> d!17092 (= lt!83343 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!83187))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!83187)))))))

(assert (=> d!17092 (invariant!0 (currentBit!3061 (_2!2538 lt!83187)) (currentByte!3066 (_2!2538 lt!83187)) (size!1149 (buf!1499 (_2!2538 lt!83187))))))

(assert (=> d!17092 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83187))) (currentByte!3066 (_2!2538 lt!83187)) (currentBit!3061 (_2!2538 lt!83187))) lt!83343)))

(declare-fun b!53769 () Bool)

(declare-fun res!44890 () Bool)

(assert (=> b!53769 (=> (not res!44890) (not e!35811))))

(assert (=> b!53769 (= res!44890 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83343))))

(declare-fun b!53770 () Bool)

(declare-fun lt!83348 () (_ BitVec 64))

(assert (=> b!53770 (= e!35811 (bvsle lt!83343 (bvmul lt!83348 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53770 (or (= lt!83348 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83348 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83348)))))

(assert (=> b!53770 (= lt!83348 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!83187)))))))

(assert (= (and d!17092 res!44891) b!53769))

(assert (= (and b!53769 res!44890) b!53770))

(declare-fun m!84473 () Bool)

(assert (=> d!17092 m!84473))

(declare-fun m!84475 () Bool)

(assert (=> d!17092 m!84475))

(assert (=> b!53634 d!17092))

(assert (=> b!53516 d!16956))

(declare-fun d!17094 () Bool)

(declare-fun e!35812 () Bool)

(assert (=> d!17094 e!35812))

(declare-fun res!44893 () Bool)

(assert (=> d!17094 (=> (not res!44893) (not e!35812))))

(declare-fun lt!83349 () (_ BitVec 64))

(declare-fun lt!83353 () (_ BitVec 64))

(declare-fun lt!83352 () (_ BitVec 64))

(assert (=> d!17094 (= res!44893 (= lt!83349 (bvsub lt!83352 lt!83353)))))

(assert (=> d!17094 (or (= (bvand lt!83352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83352 lt!83353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17094 (= lt!83353 (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772)))))))

(declare-fun lt!83351 () (_ BitVec 64))

(declare-fun lt!83350 () (_ BitVec 64))

(assert (=> d!17094 (= lt!83352 (bvmul lt!83351 lt!83350))))

(assert (=> d!17094 (or (= lt!83351 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83350 (bvsdiv (bvmul lt!83351 lt!83350) lt!83351)))))

(assert (=> d!17094 (= lt!83350 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17094 (= lt!83351 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))))))

(assert (=> d!17094 (= lt!83349 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772)))))))

(assert (=> d!17094 (invariant!0 (currentBit!3061 (_2!2538 lt!82772)) (currentByte!3066 (_2!2538 lt!82772)) (size!1149 (buf!1499 (_2!2538 lt!82772))))))

(assert (=> d!17094 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772))) lt!83349)))

(declare-fun b!53771 () Bool)

(declare-fun res!44892 () Bool)

(assert (=> b!53771 (=> (not res!44892) (not e!35812))))

(assert (=> b!53771 (= res!44892 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83349))))

(declare-fun b!53772 () Bool)

(declare-fun lt!83354 () (_ BitVec 64))

(assert (=> b!53772 (= e!35812 (bvsle lt!83349 (bvmul lt!83354 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53772 (or (= lt!83354 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83354 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83354)))))

(assert (=> b!53772 (= lt!83354 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))))))

(assert (= (and d!17094 res!44893) b!53771))

(assert (= (and b!53771 res!44892) b!53772))

(assert (=> d!17094 m!84165))

(declare-fun m!84477 () Bool)

(assert (=> d!17094 m!84477))

(assert (=> b!53516 d!17094))

(declare-fun b!53784 () Bool)

(declare-fun e!35818 () Bool)

(declare-fun e!35817 () Bool)

(assert (=> b!53784 (= e!35818 e!35817)))

(declare-fun res!44905 () Bool)

(assert (=> b!53784 (=> (not res!44905) (not e!35817))))

(declare-fun lt!83363 () tuple2!4866)

(declare-fun lt!83366 () tuple2!4890)

(assert (=> b!53784 (= res!44905 (and (= (_2!2550 lt!83366) lt!83189) (= (_1!2550 lt!83366) (_2!2538 lt!83363))))))

(assert (=> b!53784 (= lt!83366 (readBitPure!0 (readerFrom!0 (_2!2538 lt!83363) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379))))))

(declare-fun b!53783 () Bool)

(declare-fun res!44904 () Bool)

(assert (=> b!53783 (=> (not res!44904) (not e!35818))))

(assert (=> b!53783 (= res!44904 (isPrefixOf!0 thiss!1379 (_2!2538 lt!83363)))))

(declare-fun d!17096 () Bool)

(assert (=> d!17096 e!35818))

(declare-fun res!44902 () Bool)

(assert (=> d!17096 (=> (not res!44902) (not e!35818))))

(assert (=> d!17096 (= res!44902 (= (size!1149 (buf!1499 thiss!1379)) (size!1149 (buf!1499 (_2!2538 lt!83363)))))))

(declare-fun choose!16 (BitStream!1990 Bool) tuple2!4866)

(assert (=> d!17096 (= lt!83363 (choose!16 thiss!1379 lt!83189))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!17096 (validate_offset_bit!0 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)))))

(assert (=> d!17096 (= (appendBit!0 thiss!1379 lt!83189) lt!83363)))

(declare-fun b!53785 () Bool)

(assert (=> b!53785 (= e!35817 (= (bitIndex!0 (size!1149 (buf!1499 (_1!2550 lt!83366))) (currentByte!3066 (_1!2550 lt!83366)) (currentBit!3061 (_1!2550 lt!83366))) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83363))) (currentByte!3066 (_2!2538 lt!83363)) (currentBit!3061 (_2!2538 lt!83363)))))))

(declare-fun b!53782 () Bool)

(declare-fun res!44903 () Bool)

(assert (=> b!53782 (=> (not res!44903) (not e!35818))))

(declare-fun lt!83364 () (_ BitVec 64))

(declare-fun lt!83365 () (_ BitVec 64))

(assert (=> b!53782 (= res!44903 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83363))) (currentByte!3066 (_2!2538 lt!83363)) (currentBit!3061 (_2!2538 lt!83363))) (bvadd lt!83364 lt!83365)))))

(assert (=> b!53782 (or (not (= (bvand lt!83364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83365 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83364 lt!83365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53782 (= lt!83365 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53782 (= lt!83364 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(assert (= (and d!17096 res!44902) b!53782))

(assert (= (and b!53782 res!44903) b!53783))

(assert (= (and b!53783 res!44904) b!53784))

(assert (= (and b!53784 res!44905) b!53785))

(declare-fun m!84479 () Bool)

(assert (=> b!53785 m!84479))

(declare-fun m!84481 () Bool)

(assert (=> b!53785 m!84481))

(declare-fun m!84483 () Bool)

(assert (=> d!17096 m!84483))

(declare-fun m!84485 () Bool)

(assert (=> d!17096 m!84485))

(assert (=> b!53782 m!84481))

(assert (=> b!53782 m!83945))

(declare-fun m!84487 () Bool)

(assert (=> b!53783 m!84487))

(declare-fun m!84489 () Bool)

(assert (=> b!53784 m!84489))

(assert (=> b!53784 m!84489))

(declare-fun m!84491 () Bool)

(assert (=> b!53784 m!84491))

(assert (=> d!16976 d!17096))

(declare-fun b!53796 () Bool)

(declare-fun e!35821 () Bool)

(declare-fun lt!83386 () tuple2!4896)

(assert (=> b!53796 (= e!35821 (= (byteArrayBitContentToList!0 (_2!2553 lt!83386) (_1!2553 lt!83386) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2553 lt!83386) lt!83185 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!53797 () Bool)

(declare-fun res!44919 () Bool)

(assert (=> b!53797 (=> (not res!44919) (not e!35821))))

(assert (=> b!53797 (= res!44919 (invariant!0 (currentBit!3061 (_2!2553 lt!83386)) (currentByte!3066 (_2!2553 lt!83386)) (size!1149 (buf!1499 (_2!2553 lt!83386)))))))

(declare-fun d!17098 () Bool)

(assert (=> d!17098 e!35821))

(declare-fun res!44916 () Bool)

(assert (=> d!17098 (=> (not res!44916) (not e!35821))))

(assert (=> d!17098 (= res!44916 (= (buf!1499 (_2!2553 lt!83386)) (buf!1499 lt!83185)))))

(declare-datatypes ((tuple3!186 0))(
  ( (tuple3!187 (_1!2558 Unit!3708) (_2!2558 BitStream!1990) (_3!107 array!2521)) )
))
(declare-fun lt!83388 () tuple3!186)

(assert (=> d!17098 (= lt!83386 (tuple2!4897 (_3!107 lt!83388) (_2!2558 lt!83388)))))

(declare-fun readBitsLoop!0 (BitStream!1990 (_ BitVec 64) array!2521 (_ BitVec 64) (_ BitVec 64)) tuple3!186)

(assert (=> d!17098 (= lt!83388 (readBitsLoop!0 lt!83185 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2522 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17098 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!17098 (= (readBits!0 lt!83185 #b0000000000000000000000000000000000000000000000000000000000000001) lt!83386)))

(declare-fun b!53798 () Bool)

(declare-fun res!44920 () Bool)

(assert (=> b!53798 (=> (not res!44920) (not e!35821))))

(assert (=> b!53798 (= res!44920 (bvsle (currentByte!3066 lt!83185) (currentByte!3066 (_2!2553 lt!83386))))))

(declare-fun b!53799 () Bool)

(declare-fun res!44918 () Bool)

(assert (=> b!53799 (=> (not res!44918) (not e!35821))))

(declare-fun lt!83385 () (_ BitVec 64))

(assert (=> b!53799 (= res!44918 (= (bvadd lt!83385 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1149 (buf!1499 (_2!2553 lt!83386))) (currentByte!3066 (_2!2553 lt!83386)) (currentBit!3061 (_2!2553 lt!83386)))))))

(assert (=> b!53799 (or (not (= (bvand lt!83385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83385 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53799 (= lt!83385 (bitIndex!0 (size!1149 (buf!1499 lt!83185)) (currentByte!3066 lt!83185) (currentBit!3061 lt!83185)))))

(declare-fun b!53800 () Bool)

(declare-fun res!44917 () Bool)

(assert (=> b!53800 (=> (not res!44917) (not e!35821))))

(declare-fun lt!83390 () (_ BitVec 64))

(assert (=> b!53800 (= res!44917 (= (size!1149 (_1!2553 lt!83386)) ((_ extract 31 0) lt!83390)))))

(assert (=> b!53800 (and (bvslt lt!83390 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!83390 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!83389 () (_ BitVec 64))

(declare-fun lt!83392 () (_ BitVec 64))

(assert (=> b!53800 (= lt!83390 (bvsdiv lt!83389 lt!83392))))

(assert (=> b!53800 (and (not (= lt!83392 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!83389 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!83392 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!53800 (= lt!83392 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!83387 () (_ BitVec 64))

(declare-fun lt!83391 () (_ BitVec 64))

(assert (=> b!53800 (= lt!83389 (bvsub lt!83387 lt!83391))))

(assert (=> b!53800 (or (= (bvand lt!83387 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83391 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83387 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83387 lt!83391) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53800 (= lt!83391 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!83393 () (_ BitVec 64))

(assert (=> b!53800 (= lt!83387 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!83393))))

(assert (=> b!53800 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83393 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!83393) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53800 (= lt!83393 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!17098 res!44916) b!53799))

(assert (= (and b!53799 res!44918) b!53797))

(assert (= (and b!53797 res!44919) b!53800))

(assert (= (and b!53800 res!44917) b!53798))

(assert (= (and b!53798 res!44920) b!53796))

(declare-fun m!84493 () Bool)

(assert (=> b!53796 m!84493))

(declare-fun m!84495 () Bool)

(assert (=> b!53796 m!84495))

(declare-fun m!84497 () Bool)

(assert (=> b!53797 m!84497))

(declare-fun m!84499 () Bool)

(assert (=> d!17098 m!84499))

(declare-fun m!84501 () Bool)

(assert (=> b!53799 m!84501))

(declare-fun m!84503 () Bool)

(assert (=> b!53799 m!84503))

(assert (=> b!53635 d!17098))

(declare-fun d!17100 () Bool)

(declare-fun lt!83396 () tuple2!4880)

(assert (=> d!17100 (= lt!83396 (readBit!0 lt!83185))))

(assert (=> d!17100 (= (readBitPure!0 lt!83185) (tuple2!4891 (_2!2545 lt!83396) (_1!2545 lt!83396)))))

(declare-fun bs!4323 () Bool)

(assert (= bs!4323 d!17100))

(declare-fun m!84505 () Bool)

(assert (=> bs!4323 m!84505))

(assert (=> b!53635 d!17100))

(declare-fun d!17102 () Bool)

(declare-fun e!35824 () Bool)

(assert (=> d!17102 e!35824))

(declare-fun res!44924 () Bool)

(assert (=> d!17102 (=> (not res!44924) (not e!35824))))

(assert (=> d!17102 (= res!44924 (invariant!0 (currentBit!3061 (_2!2538 lt!83187)) (currentByte!3066 (_2!2538 lt!83187)) (size!1149 (buf!1499 (_2!2538 lt!83187)))))))

(assert (=> d!17102 (= (readerFrom!0 (_2!2538 lt!83187) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379)) (BitStream!1991 (buf!1499 (_2!2538 lt!83187)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(declare-fun b!53803 () Bool)

(assert (=> b!53803 (= e!35824 (invariant!0 (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379) (size!1149 (buf!1499 (_2!2538 lt!83187)))))))

(assert (= (and d!17102 res!44924) b!53803))

(assert (=> d!17102 m!84475))

(declare-fun m!84507 () Bool)

(assert (=> b!53803 m!84507))

(assert (=> b!53635 d!17102))

(assert (=> d!16910 d!16914))

(declare-fun d!17104 () Bool)

(assert (=> d!17104 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!17104 true))

(declare-fun _$6!213 () Unit!3708)

(assert (=> d!17104 (= (choose!9 thiss!1379 (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1991 (buf!1499 (_2!2538 lt!82772)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))) _$6!213)))

(declare-fun bs!4324 () Bool)

(assert (= bs!4324 d!17104))

(assert (=> bs!4324 m!83959))

(assert (=> d!16910 d!17104))

(declare-fun d!17106 () Bool)

(declare-fun e!35825 () Bool)

(assert (=> d!17106 e!35825))

(declare-fun res!44926 () Bool)

(assert (=> d!17106 (=> (not res!44926) (not e!35825))))

(declare-fun lt!83401 () (_ BitVec 64))

(declare-fun lt!83397 () (_ BitVec 64))

(declare-fun lt!83400 () (_ BitVec 64))

(assert (=> d!17106 (= res!44926 (= lt!83397 (bvsub lt!83400 lt!83401)))))

(assert (=> d!17106 (or (= (bvand lt!83400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83400 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83400 lt!83401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17106 (= lt!83401 (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2550 lt!83183)))) ((_ sign_extend 32) (currentByte!3066 (_1!2550 lt!83183))) ((_ sign_extend 32) (currentBit!3061 (_1!2550 lt!83183)))))))

(declare-fun lt!83399 () (_ BitVec 64))

(declare-fun lt!83398 () (_ BitVec 64))

(assert (=> d!17106 (= lt!83400 (bvmul lt!83399 lt!83398))))

(assert (=> d!17106 (or (= lt!83399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83398 (bvsdiv (bvmul lt!83399 lt!83398) lt!83399)))))

(assert (=> d!17106 (= lt!83398 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17106 (= lt!83399 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2550 lt!83183)))))))

(assert (=> d!17106 (= lt!83397 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 (_1!2550 lt!83183))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 (_1!2550 lt!83183)))))))

(assert (=> d!17106 (invariant!0 (currentBit!3061 (_1!2550 lt!83183)) (currentByte!3066 (_1!2550 lt!83183)) (size!1149 (buf!1499 (_1!2550 lt!83183))))))

(assert (=> d!17106 (= (bitIndex!0 (size!1149 (buf!1499 (_1!2550 lt!83183))) (currentByte!3066 (_1!2550 lt!83183)) (currentBit!3061 (_1!2550 lt!83183))) lt!83397)))

(declare-fun b!53804 () Bool)

(declare-fun res!44925 () Bool)

(assert (=> b!53804 (=> (not res!44925) (not e!35825))))

(assert (=> b!53804 (= res!44925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83397))))

(declare-fun b!53805 () Bool)

(declare-fun lt!83402 () (_ BitVec 64))

(assert (=> b!53805 (= e!35825 (bvsle lt!83397 (bvmul lt!83402 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53805 (or (= lt!83402 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83402 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83402)))))

(assert (=> b!53805 (= lt!83402 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2550 lt!83183)))))))

(assert (= (and d!17106 res!44926) b!53804))

(assert (= (and b!53804 res!44925) b!53805))

(declare-fun m!84509 () Bool)

(assert (=> d!17106 m!84509))

(declare-fun m!84511 () Bool)

(assert (=> d!17106 m!84511))

(assert (=> b!53633 d!17106))

(declare-fun d!17108 () Bool)

(declare-fun e!35826 () Bool)

(assert (=> d!17108 e!35826))

(declare-fun res!44928 () Bool)

(assert (=> d!17108 (=> (not res!44928) (not e!35826))))

(declare-fun lt!83406 () (_ BitVec 64))

(declare-fun lt!83407 () (_ BitVec 64))

(declare-fun lt!83403 () (_ BitVec 64))

(assert (=> d!17108 (= res!44928 (= lt!83403 (bvsub lt!83406 lt!83407)))))

(assert (=> d!17108 (or (= (bvand lt!83406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!83406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!83406 lt!83407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17108 (= lt!83407 (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!83179)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!83179))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!83179)))))))

(declare-fun lt!83405 () (_ BitVec 64))

(declare-fun lt!83404 () (_ BitVec 64))

(assert (=> d!17108 (= lt!83406 (bvmul lt!83405 lt!83404))))

(assert (=> d!17108 (or (= lt!83405 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!83404 (bvsdiv (bvmul lt!83405 lt!83404) lt!83405)))))

(assert (=> d!17108 (= lt!83404 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!17108 (= lt!83405 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!83179)))))))

(assert (=> d!17108 (= lt!83403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!83179))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!83179)))))))

(assert (=> d!17108 (invariant!0 (currentBit!3061 (_2!2538 lt!83179)) (currentByte!3066 (_2!2538 lt!83179)) (size!1149 (buf!1499 (_2!2538 lt!83179))))))

(assert (=> d!17108 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83179))) (currentByte!3066 (_2!2538 lt!83179)) (currentBit!3061 (_2!2538 lt!83179))) lt!83403)))

(declare-fun b!53806 () Bool)

(declare-fun res!44927 () Bool)

(assert (=> b!53806 (=> (not res!44927) (not e!35826))))

(assert (=> b!53806 (= res!44927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!83403))))

(declare-fun b!53807 () Bool)

(declare-fun lt!83408 () (_ BitVec 64))

(assert (=> b!53807 (= e!35826 (bvsle lt!83403 (bvmul lt!83408 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53807 (or (= lt!83408 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!83408 #b0000000000000000000000000000000000000000000000000000000000001000) lt!83408)))))

(assert (=> b!53807 (= lt!83408 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!83179)))))))

(assert (= (and d!17108 res!44928) b!53806))

(assert (= (and b!53806 res!44927) b!53807))

(declare-fun m!84513 () Bool)

(assert (=> d!17108 m!84513))

(declare-fun m!84515 () Bool)

(assert (=> d!17108 m!84515))

(assert (=> b!53633 d!17108))

(declare-fun d!17110 () Bool)

(declare-fun res!44930 () Bool)

(declare-fun e!35827 () Bool)

(assert (=> d!17110 (=> (not res!44930) (not e!35827))))

(assert (=> d!17110 (= res!44930 (= (size!1149 (buf!1499 thiss!1379)) (size!1149 (buf!1499 (_2!2538 lt!83187)))))))

(assert (=> d!17110 (= (isPrefixOf!0 thiss!1379 (_2!2538 lt!83187)) e!35827)))

(declare-fun b!53808 () Bool)

(declare-fun res!44931 () Bool)

(assert (=> b!53808 (=> (not res!44931) (not e!35827))))

(assert (=> b!53808 (= res!44931 (bvsle (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83187))) (currentByte!3066 (_2!2538 lt!83187)) (currentBit!3061 (_2!2538 lt!83187)))))))

(declare-fun b!53809 () Bool)

(declare-fun e!35828 () Bool)

(assert (=> b!53809 (= e!35827 e!35828)))

(declare-fun res!44929 () Bool)

(assert (=> b!53809 (=> res!44929 e!35828)))

(assert (=> b!53809 (= res!44929 (= (size!1149 (buf!1499 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53810 () Bool)

(assert (=> b!53810 (= e!35828 (arrayBitRangesEq!0 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!83187)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (= (and d!17110 res!44930) b!53808))

(assert (= (and b!53808 res!44931) b!53809))

(assert (= (and b!53809 (not res!44929)) b!53810))

(assert (=> b!53808 m!83945))

(assert (=> b!53808 m!84273))

(assert (=> b!53810 m!83945))

(assert (=> b!53810 m!83945))

(declare-fun m!84517 () Bool)

(assert (=> b!53810 m!84517))

(assert (=> b!53632 d!17110))

(declare-fun d!17112 () Bool)

(declare-fun res!44933 () Bool)

(declare-fun e!35829 () Bool)

(assert (=> d!17112 (=> (not res!44933) (not e!35829))))

(assert (=> d!17112 (= res!44933 (= (size!1149 (buf!1499 thiss!1379)) (size!1149 (buf!1499 (_2!2538 lt!83179)))))))

(assert (=> d!17112 (= (isPrefixOf!0 thiss!1379 (_2!2538 lt!83179)) e!35829)))

(declare-fun b!53811 () Bool)

(declare-fun res!44934 () Bool)

(assert (=> b!53811 (=> (not res!44934) (not e!35829))))

(assert (=> b!53811 (= res!44934 (bvsle (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!83179))) (currentByte!3066 (_2!2538 lt!83179)) (currentBit!3061 (_2!2538 lt!83179)))))))

(declare-fun b!53812 () Bool)

(declare-fun e!35830 () Bool)

(assert (=> b!53812 (= e!35829 e!35830)))

(declare-fun res!44932 () Bool)

(assert (=> b!53812 (=> res!44932 e!35830)))

(assert (=> b!53812 (= res!44932 (= (size!1149 (buf!1499 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!53813 () Bool)

(assert (=> b!53813 (= e!35830 (arrayBitRangesEq!0 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!83179)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (= (and d!17112 res!44933) b!53811))

(assert (= (and b!53811 res!44934) b!53812))

(assert (= (and b!53812 (not res!44932)) b!53813))

(assert (=> b!53811 m!83945))

(assert (=> b!53811 m!84277))

(assert (=> b!53813 m!83945))

(assert (=> b!53813 m!83945))

(declare-fun m!84519 () Bool)

(assert (=> b!53813 m!84519))

(assert (=> b!53639 d!17112))

(declare-fun b!53814 () Bool)

(declare-fun e!35831 () tuple2!4878)

(assert (=> b!53814 (= e!35831 (tuple2!4879 Nil!567 (_2!2545 lt!82845)))))

(declare-fun b!53816 () Bool)

(declare-fun e!35832 () Bool)

(declare-fun lt!83409 () List!570)

(assert (=> b!53816 (= e!35832 (isEmpty!151 lt!83409))))

(declare-fun lt!83411 () (_ BitVec 64))

(declare-fun lt!83410 () tuple2!4880)

(declare-fun b!53815 () Bool)

(assert (=> b!53815 (= e!35831 (tuple2!4879 (Cons!566 (_1!2545 lt!83410) (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_2!2545 lt!83410) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!82846) lt!83411))) (_2!2545 lt!83410)))))

(assert (=> b!53815 (= lt!83410 (readBit!0 (_2!2545 lt!82845)))))

(assert (=> b!53815 (= lt!83411 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!53817 () Bool)

(assert (=> b!53817 (= e!35832 (> (length!265 lt!83409) 0))))

(declare-fun d!17114 () Bool)

(assert (=> d!17114 e!35832))

(declare-fun c!3808 () Bool)

(assert (=> d!17114 (= c!3808 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!82846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17114 (= lt!83409 (_1!2544 e!35831))))

(declare-fun c!3807 () Bool)

(assert (=> d!17114 (= c!3807 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!82846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!17114 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!82846) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!17114 (= (bitStreamReadBitsIntoList!0 (_2!2538 lt!82772) (_2!2545 lt!82845) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!82846)) lt!83409)))

(assert (= (and d!17114 c!3807) b!53814))

(assert (= (and d!17114 (not c!3807)) b!53815))

(assert (= (and d!17114 c!3808) b!53816))

(assert (= (and d!17114 (not c!3808)) b!53817))

(declare-fun m!84521 () Bool)

(assert (=> b!53816 m!84521))

(declare-fun m!84523 () Bool)

(assert (=> b!53815 m!84523))

(declare-fun m!84525 () Bool)

(assert (=> b!53815 m!84525))

(declare-fun m!84527 () Bool)

(assert (=> b!53817 m!84527))

(assert (=> b!53444 d!17114))

(declare-fun d!17116 () Bool)

(declare-fun e!35839 () Bool)

(assert (=> d!17116 e!35839))

(declare-fun res!44937 () Bool)

(assert (=> d!17116 (=> (not res!44937) (not e!35839))))

(declare-fun increaseBitIndex!0 (BitStream!1990) tuple2!4866)

(assert (=> d!17116 (= res!44937 (= (buf!1499 (_2!2538 (increaseBitIndex!0 (_1!2539 lt!82773)))) (buf!1499 (_1!2539 lt!82773))))))

(declare-fun lt!83430 () Bool)

(assert (=> d!17116 (= lt!83430 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 (buf!1499 (_1!2539 lt!82773))) (currentByte!3066 (_1!2539 lt!82773)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3061 (_1!2539 lt!82773))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83427 () tuple2!4880)

(assert (=> d!17116 (= lt!83427 (tuple2!4881 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 (buf!1499 (_1!2539 lt!82773))) (currentByte!3066 (_1!2539 lt!82773)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3061 (_1!2539 lt!82773))))) #b00000000000000000000000000000000)) (_2!2538 (increaseBitIndex!0 (_1!2539 lt!82773)))))))

(assert (=> d!17116 (validate_offset_bit!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_1!2539 lt!82773)))) ((_ sign_extend 32) (currentByte!3066 (_1!2539 lt!82773))) ((_ sign_extend 32) (currentBit!3061 (_1!2539 lt!82773))))))

(assert (=> d!17116 (= (readBit!0 (_1!2539 lt!82773)) lt!83427)))

(declare-fun lt!83429 () (_ BitVec 64))

(declare-fun lt!83426 () (_ BitVec 64))

(declare-fun b!53820 () Bool)

(assert (=> b!53820 (= e!35839 (= (bitIndex!0 (size!1149 (buf!1499 (_2!2538 (increaseBitIndex!0 (_1!2539 lt!82773))))) (currentByte!3066 (_2!2538 (increaseBitIndex!0 (_1!2539 lt!82773)))) (currentBit!3061 (_2!2538 (increaseBitIndex!0 (_1!2539 lt!82773))))) (bvadd lt!83426 lt!83429)))))

(assert (=> b!53820 (or (not (= (bvand lt!83426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!83429 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83426 lt!83429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!53820 (= lt!83429 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!53820 (= lt!83426 (bitIndex!0 (size!1149 (buf!1499 (_1!2539 lt!82773))) (currentByte!3066 (_1!2539 lt!82773)) (currentBit!3061 (_1!2539 lt!82773))))))

(declare-fun lt!83432 () Bool)

(assert (=> b!53820 (= lt!83432 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 (buf!1499 (_1!2539 lt!82773))) (currentByte!3066 (_1!2539 lt!82773)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3061 (_1!2539 lt!82773))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83428 () Bool)

(assert (=> b!53820 (= lt!83428 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 (buf!1499 (_1!2539 lt!82773))) (currentByte!3066 (_1!2539 lt!82773)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3061 (_1!2539 lt!82773))))) #b00000000000000000000000000000000)))))

(declare-fun lt!83431 () Bool)

(assert (=> b!53820 (= lt!83431 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 (buf!1499 (_1!2539 lt!82773))) (currentByte!3066 (_1!2539 lt!82773)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!3061 (_1!2539 lt!82773))))) #b00000000000000000000000000000000)))))

(assert (= (and d!17116 res!44937) b!53820))

(declare-fun m!84529 () Bool)

(assert (=> d!17116 m!84529))

(declare-fun m!84531 () Bool)

(assert (=> d!17116 m!84531))

(declare-fun m!84533 () Bool)

(assert (=> d!17116 m!84533))

(declare-fun m!84535 () Bool)

(assert (=> d!17116 m!84535))

(declare-fun m!84537 () Bool)

(assert (=> b!53820 m!84537))

(assert (=> b!53820 m!84529))

(declare-fun m!84539 () Bool)

(assert (=> b!53820 m!84539))

(assert (=> b!53820 m!84533))

(assert (=> b!53820 m!84531))

(assert (=> b!53444 d!17116))

(declare-fun d!17118 () Bool)

(declare-fun size!1153 (List!570) Int)

(assert (=> d!17118 (= (length!265 lt!82844) (size!1153 lt!82844))))

(declare-fun bs!4325 () Bool)

(assert (= bs!4325 d!17118))

(declare-fun m!84541 () Bool)

(assert (=> bs!4325 m!84541))

(assert (=> b!53446 d!17118))

(declare-fun d!17120 () Bool)

(assert (=> d!17120 (= (invariant!0 (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379) (size!1149 (buf!1499 thiss!1379))) (and (bvsge (currentBit!3061 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3061 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3066 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3066 thiss!1379) (size!1149 (buf!1499 thiss!1379))) (and (= (currentBit!3061 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3066 thiss!1379) (size!1149 (buf!1499 thiss!1379)))))))))

(assert (=> d!16962 d!17120))

(declare-fun d!17122 () Bool)

(declare-fun res!44939 () Bool)

(declare-fun e!35840 () Bool)

(assert (=> d!17122 (=> (not res!44939) (not e!35840))))

(assert (=> d!17122 (= res!44939 (= (size!1149 (buf!1499 (_2!2539 lt!82925))) (size!1149 (buf!1499 (_2!2538 lt!82772)))))))

(assert (=> d!17122 (= (isPrefixOf!0 (_2!2539 lt!82925) (_2!2538 lt!82772)) e!35840)))

(declare-fun b!53821 () Bool)

(declare-fun res!44940 () Bool)

(assert (=> b!53821 (=> (not res!44940) (not e!35840))))

(assert (=> b!53821 (= res!44940 (bvsle (bitIndex!0 (size!1149 (buf!1499 (_2!2539 lt!82925))) (currentByte!3066 (_2!2539 lt!82925)) (currentBit!3061 (_2!2539 lt!82925))) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772)))))))

(declare-fun b!53822 () Bool)

(declare-fun e!35841 () Bool)

(assert (=> b!53822 (= e!35840 e!35841)))

(declare-fun res!44938 () Bool)

(assert (=> b!53822 (=> res!44938 e!35841)))

(assert (=> b!53822 (= res!44938 (= (size!1149 (buf!1499 (_2!2539 lt!82925))) #b00000000000000000000000000000000))))

(declare-fun b!53823 () Bool)

(assert (=> b!53823 (= e!35841 (arrayBitRangesEq!0 (buf!1499 (_2!2539 lt!82925)) (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 (_2!2539 lt!82925))) (currentByte!3066 (_2!2539 lt!82925)) (currentBit!3061 (_2!2539 lt!82925)))))))

(assert (= (and d!17122 res!44939) b!53821))

(assert (= (and b!53821 res!44940) b!53822))

(assert (= (and b!53822 (not res!44938)) b!53823))

(declare-fun m!84543 () Bool)

(assert (=> b!53821 m!84543))

(assert (=> b!53821 m!84101))

(assert (=> b!53823 m!84543))

(assert (=> b!53823 m!84543))

(declare-fun m!84545 () Bool)

(assert (=> b!53823 m!84545))

(assert (=> b!53479 d!17122))

(declare-fun d!17124 () Bool)

(assert (=> d!17124 (= (isEmpty!151 lt!82844) (is-Nil!567 lt!82844))))

(assert (=> b!53445 d!17124))

(declare-fun d!17126 () Bool)

(assert (=> d!17126 (= (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772)))) (bvsub (bvmul ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772))))))))

(assert (=> d!16968 d!17126))

(declare-fun d!17128 () Bool)

(declare-fun res!44942 () Bool)

(declare-fun e!35842 () Bool)

(assert (=> d!17128 (=> (not res!44942) (not e!35842))))

(assert (=> d!17128 (= res!44942 (= (size!1149 (buf!1499 (_1!2539 lt!82925))) (size!1149 (buf!1499 thiss!1379))))))

(assert (=> d!17128 (= (isPrefixOf!0 (_1!2539 lt!82925) thiss!1379) e!35842)))

(declare-fun b!53824 () Bool)

(declare-fun res!44943 () Bool)

(assert (=> b!53824 (=> (not res!44943) (not e!35842))))

(assert (=> b!53824 (= res!44943 (bvsle (bitIndex!0 (size!1149 (buf!1499 (_1!2539 lt!82925))) (currentByte!3066 (_1!2539 lt!82925)) (currentBit!3061 (_1!2539 lt!82925))) (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(declare-fun b!53825 () Bool)

(declare-fun e!35843 () Bool)

(assert (=> b!53825 (= e!35842 e!35843)))

(declare-fun res!44941 () Bool)

(assert (=> b!53825 (=> res!44941 e!35843)))

(assert (=> b!53825 (= res!44941 (= (size!1149 (buf!1499 (_1!2539 lt!82925))) #b00000000000000000000000000000000))))

(declare-fun b!53826 () Bool)

(assert (=> b!53826 (= e!35843 (arrayBitRangesEq!0 (buf!1499 (_1!2539 lt!82925)) (buf!1499 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 (_1!2539 lt!82925))) (currentByte!3066 (_1!2539 lt!82925)) (currentBit!3061 (_1!2539 lt!82925)))))))

(assert (= (and d!17128 res!44942) b!53824))

(assert (= (and b!53824 res!44943) b!53825))

(assert (= (and b!53825 (not res!44941)) b!53826))

(declare-fun m!84547 () Bool)

(assert (=> b!53824 m!84547))

(assert (=> b!53824 m!83945))

(assert (=> b!53826 m!84547))

(assert (=> b!53826 m!84547))

(declare-fun m!84549 () Bool)

(assert (=> b!53826 m!84549))

(assert (=> b!53476 d!17128))

(declare-fun d!17130 () Bool)

(declare-fun lt!83433 () tuple2!4880)

(assert (=> d!17130 (= lt!83433 (readBit!0 (readerFrom!0 (_2!2538 lt!83179) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379))))))

(assert (=> d!17130 (= (readBitPure!0 (readerFrom!0 (_2!2538 lt!83179) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379))) (tuple2!4891 (_2!2545 lt!83433) (_1!2545 lt!83433)))))

(declare-fun bs!4326 () Bool)

(assert (= bs!4326 d!17130))

(assert (=> bs!4326 m!84263))

(declare-fun m!84551 () Bool)

(assert (=> bs!4326 m!84551))

(assert (=> b!53636 d!17130))

(declare-fun d!17132 () Bool)

(declare-fun e!35844 () Bool)

(assert (=> d!17132 e!35844))

(declare-fun res!44944 () Bool)

(assert (=> d!17132 (=> (not res!44944) (not e!35844))))

(assert (=> d!17132 (= res!44944 (invariant!0 (currentBit!3061 (_2!2538 lt!83179)) (currentByte!3066 (_2!2538 lt!83179)) (size!1149 (buf!1499 (_2!2538 lt!83179)))))))

(assert (=> d!17132 (= (readerFrom!0 (_2!2538 lt!83179) (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379)) (BitStream!1991 (buf!1499 (_2!2538 lt!83179)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)))))

(declare-fun b!53827 () Bool)

(assert (=> b!53827 (= e!35844 (invariant!0 (currentBit!3061 thiss!1379) (currentByte!3066 thiss!1379) (size!1149 (buf!1499 (_2!2538 lt!83179)))))))

(assert (= (and d!17132 res!44944) b!53827))

(assert (=> d!17132 m!84515))

(declare-fun m!84553 () Bool)

(assert (=> b!53827 m!84553))

(assert (=> b!53636 d!17132))

(declare-fun d!17134 () Bool)

(declare-fun e!35847 () Bool)

(assert (=> d!17134 e!35847))

(declare-fun res!44947 () Bool)

(assert (=> d!17134 (=> (not res!44947) (not e!35847))))

(declare-fun lt!83438 () BitStream!1990)

(declare-fun lt!83439 () (_ BitVec 64))

(assert (=> d!17134 (= res!44947 (= (bvadd lt!83439 (bvsub lt!82924 lt!82926)) (bitIndex!0 (size!1149 (buf!1499 lt!83438)) (currentByte!3066 lt!83438) (currentBit!3061 lt!83438))))))

(assert (=> d!17134 (or (not (= (bvand lt!83439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82924 lt!82926) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!83439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!83439 (bvsub lt!82924 lt!82926)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!17134 (= lt!83439 (bitIndex!0 (size!1149 (buf!1499 (_2!2539 lt!82925))) (currentByte!3066 (_2!2539 lt!82925)) (currentBit!3061 (_2!2539 lt!82925))))))

(declare-fun moveBitIndex!0 (BitStream!1990 (_ BitVec 64)) tuple2!4866)

(assert (=> d!17134 (= lt!83438 (_2!2538 (moveBitIndex!0 (_2!2539 lt!82925) (bvsub lt!82924 lt!82926))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1990 (_ BitVec 64)) Bool)

(assert (=> d!17134 (moveBitIndexPrecond!0 (_2!2539 lt!82925) (bvsub lt!82924 lt!82926))))

(assert (=> d!17134 (= (withMovedBitIndex!0 (_2!2539 lt!82925) (bvsub lt!82924 lt!82926)) lt!83438)))

(declare-fun b!53830 () Bool)

(assert (=> b!53830 (= e!35847 (= (size!1149 (buf!1499 (_2!2539 lt!82925))) (size!1149 (buf!1499 lt!83438))))))

(assert (= (and d!17134 res!44947) b!53830))

(declare-fun m!84555 () Bool)

(assert (=> d!17134 m!84555))

(assert (=> d!17134 m!84543))

(declare-fun m!84557 () Bool)

(assert (=> d!17134 m!84557))

(declare-fun m!84559 () Bool)

(assert (=> d!17134 m!84559))

(assert (=> b!53475 d!17134))

(assert (=> b!53475 d!17094))

(assert (=> b!53475 d!16956))

(assert (=> b!53637 d!17108))

(assert (=> b!53637 d!16956))

(declare-fun b!53845 () Bool)

(declare-fun res!44958 () Bool)

(declare-fun lt!83446 () (_ BitVec 32))

(assert (=> b!53845 (= res!44958 (= lt!83446 #b00000000000000000000000000000000))))

(declare-fun e!35860 () Bool)

(assert (=> b!53845 (=> res!44958 e!35860)))

(declare-fun e!35861 () Bool)

(assert (=> b!53845 (= e!35861 e!35860)))

(declare-fun b!53846 () Bool)

(declare-fun e!35865 () Bool)

(declare-fun e!35863 () Bool)

(assert (=> b!53846 (= e!35865 e!35863)))

(declare-fun res!44960 () Bool)

(assert (=> b!53846 (=> (not res!44960) (not e!35863))))

(declare-fun e!35862 () Bool)

(assert (=> b!53846 (= res!44960 e!35862)))

(declare-fun res!44961 () Bool)

(assert (=> b!53846 (=> res!44961 e!35862)))

(declare-datatypes ((tuple4!28 0))(
  ( (tuple4!29 (_1!2559 (_ BitVec 32)) (_2!2559 (_ BitVec 32)) (_3!108 (_ BitVec 32)) (_4!14 (_ BitVec 32))) )
))
(declare-fun lt!83448 () tuple4!28)

(assert (=> b!53846 (= res!44961 (bvsge (_1!2559 lt!83448) (_2!2559 lt!83448)))))

(assert (=> b!53846 (= lt!83446 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!83447 () (_ BitVec 32))

(assert (=> b!53846 (= lt!83447 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!28)

(assert (=> b!53846 (= lt!83448 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(declare-fun bm!672 () Bool)

(declare-fun call!675 () Bool)

(declare-fun c!3811 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!672 (= call!675 (byteRangesEq!0 (ite c!3811 (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83448)) (select (arr!1685 (buf!1499 thiss!1379)) (_4!14 lt!83448))) (ite c!3811 (select (arr!1685 (buf!1499 (_2!2538 lt!82772))) (_3!108 lt!83448)) (select (arr!1685 (buf!1499 (_2!2538 lt!82772))) (_4!14 lt!83448))) (ite c!3811 lt!83447 #b00000000000000000000000000000000) lt!83446))))

(declare-fun b!53847 () Bool)

(declare-fun e!35864 () Bool)

(assert (=> b!53847 (= e!35864 e!35861)))

(declare-fun res!44962 () Bool)

(assert (=> b!53847 (= res!44962 (byteRangesEq!0 (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83448)) (select (arr!1685 (buf!1499 (_2!2538 lt!82772))) (_3!108 lt!83448)) lt!83447 #b00000000000000000000000000001000))))

(assert (=> b!53847 (=> (not res!44962) (not e!35861))))

(declare-fun b!53848 () Bool)

(assert (=> b!53848 (= e!35860 call!675)))

(declare-fun b!53849 () Bool)

(assert (=> b!53849 (= e!35864 call!675)))

(declare-fun d!17136 () Bool)

(declare-fun res!44959 () Bool)

(assert (=> d!17136 (=> res!44959 e!35865)))

(assert (=> d!17136 (= res!44959 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (=> d!17136 (= (arrayBitRangesEq!0 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))) e!35865)))

(declare-fun b!53850 () Bool)

(assert (=> b!53850 (= e!35863 e!35864)))

(assert (=> b!53850 (= c!3811 (= (_3!108 lt!83448) (_4!14 lt!83448)))))

(declare-fun b!53851 () Bool)

(declare-fun arrayRangesEq!15 (array!2521 array!2521 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!53851 (= e!35862 (arrayRangesEq!15 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!82772)) (_1!2559 lt!83448) (_2!2559 lt!83448)))))

(assert (= (and d!17136 (not res!44959)) b!53846))

(assert (= (and b!53846 (not res!44961)) b!53851))

(assert (= (and b!53846 res!44960) b!53850))

(assert (= (and b!53850 c!3811) b!53849))

(assert (= (and b!53850 (not c!3811)) b!53847))

(assert (= (and b!53847 res!44962) b!53845))

(assert (= (and b!53845 (not res!44958)) b!53848))

(assert (= (or b!53849 b!53848) bm!672))

(assert (=> b!53846 m!83945))

(declare-fun m!84561 () Bool)

(assert (=> b!53846 m!84561))

(declare-fun m!84563 () Bool)

(assert (=> bm!672 m!84563))

(declare-fun m!84565 () Bool)

(assert (=> bm!672 m!84565))

(declare-fun m!84567 () Bool)

(assert (=> bm!672 m!84567))

(declare-fun m!84569 () Bool)

(assert (=> bm!672 m!84569))

(declare-fun m!84571 () Bool)

(assert (=> bm!672 m!84571))

(assert (=> b!53847 m!84571))

(assert (=> b!53847 m!84565))

(assert (=> b!53847 m!84571))

(assert (=> b!53847 m!84565))

(declare-fun m!84573 () Bool)

(assert (=> b!53847 m!84573))

(declare-fun m!84575 () Bool)

(assert (=> b!53851 m!84575))

(assert (=> b!53518 d!17136))

(assert (=> b!53518 d!16956))

(assert (=> b!53477 d!16956))

(declare-fun d!17138 () Bool)

(assert (=> d!17138 (arrayBitRangesEq!0 (buf!1499 (_2!2538 lt!82772)) (buf!1499 thiss!1379) lt!82922 lt!82928)))

(declare-fun lt!83451 () Unit!3708)

(declare-fun choose!8 (array!2521 array!2521 (_ BitVec 64) (_ BitVec 64)) Unit!3708)

(assert (=> d!17138 (= lt!83451 (choose!8 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!82772)) lt!82922 lt!82928))))

(assert (=> d!17138 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!82922) (bvsle lt!82922 lt!82928))))

(assert (=> d!17138 (= (arrayBitRangesEqSymmetric!0 (buf!1499 thiss!1379) (buf!1499 (_2!2538 lt!82772)) lt!82922 lt!82928) lt!83451)))

(declare-fun bs!4327 () Bool)

(assert (= bs!4327 d!17138))

(assert (=> bs!4327 m!84097))

(declare-fun m!84577 () Bool)

(assert (=> bs!4327 m!84577))

(assert (=> b!53477 d!17138))

(declare-fun b!53852 () Bool)

(declare-fun res!44963 () Bool)

(declare-fun lt!83452 () (_ BitVec 32))

(assert (=> b!53852 (= res!44963 (= lt!83452 #b00000000000000000000000000000000))))

(declare-fun e!35866 () Bool)

(assert (=> b!53852 (=> res!44963 e!35866)))

(declare-fun e!35867 () Bool)

(assert (=> b!53852 (= e!35867 e!35866)))

(declare-fun b!53853 () Bool)

(declare-fun e!35871 () Bool)

(declare-fun e!35869 () Bool)

(assert (=> b!53853 (= e!35871 e!35869)))

(declare-fun res!44965 () Bool)

(assert (=> b!53853 (=> (not res!44965) (not e!35869))))

(declare-fun e!35868 () Bool)

(assert (=> b!53853 (= res!44965 e!35868)))

(declare-fun res!44966 () Bool)

(assert (=> b!53853 (=> res!44966 e!35868)))

(declare-fun lt!83454 () tuple4!28)

(assert (=> b!53853 (= res!44966 (bvsge (_1!2559 lt!83454) (_2!2559 lt!83454)))))

(assert (=> b!53853 (= lt!83452 ((_ extract 31 0) (bvsrem lt!82928 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!83453 () (_ BitVec 32))

(assert (=> b!53853 (= lt!83453 ((_ extract 31 0) (bvsrem lt!82922 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53853 (= lt!83454 (arrayBitIndices!0 lt!82922 lt!82928))))

(declare-fun call!676 () Bool)

(declare-fun c!3812 () Bool)

(declare-fun bm!673 () Bool)

(assert (=> bm!673 (= call!676 (byteRangesEq!0 (ite c!3812 (select (arr!1685 (buf!1499 (_2!2538 lt!82772))) (_3!108 lt!83454)) (select (arr!1685 (buf!1499 (_2!2538 lt!82772))) (_4!14 lt!83454))) (ite c!3812 (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83454)) (select (arr!1685 (buf!1499 thiss!1379)) (_4!14 lt!83454))) (ite c!3812 lt!83453 #b00000000000000000000000000000000) lt!83452))))

(declare-fun b!53854 () Bool)

(declare-fun e!35870 () Bool)

(assert (=> b!53854 (= e!35870 e!35867)))

(declare-fun res!44967 () Bool)

(assert (=> b!53854 (= res!44967 (byteRangesEq!0 (select (arr!1685 (buf!1499 (_2!2538 lt!82772))) (_3!108 lt!83454)) (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83454)) lt!83453 #b00000000000000000000000000001000))))

(assert (=> b!53854 (=> (not res!44967) (not e!35867))))

(declare-fun b!53855 () Bool)

(assert (=> b!53855 (= e!35866 call!676)))

(declare-fun b!53856 () Bool)

(assert (=> b!53856 (= e!35870 call!676)))

(declare-fun d!17140 () Bool)

(declare-fun res!44964 () Bool)

(assert (=> d!17140 (=> res!44964 e!35871)))

(assert (=> d!17140 (= res!44964 (bvsge lt!82922 lt!82928))))

(assert (=> d!17140 (= (arrayBitRangesEq!0 (buf!1499 (_2!2538 lt!82772)) (buf!1499 thiss!1379) lt!82922 lt!82928) e!35871)))

(declare-fun b!53857 () Bool)

(assert (=> b!53857 (= e!35869 e!35870)))

(assert (=> b!53857 (= c!3812 (= (_3!108 lt!83454) (_4!14 lt!83454)))))

(declare-fun b!53858 () Bool)

(assert (=> b!53858 (= e!35868 (arrayRangesEq!15 (buf!1499 (_2!2538 lt!82772)) (buf!1499 thiss!1379) (_1!2559 lt!83454) (_2!2559 lt!83454)))))

(assert (= (and d!17140 (not res!44964)) b!53853))

(assert (= (and b!53853 (not res!44966)) b!53858))

(assert (= (and b!53853 res!44965) b!53857))

(assert (= (and b!53857 c!3812) b!53856))

(assert (= (and b!53857 (not c!3812)) b!53854))

(assert (= (and b!53854 res!44967) b!53852))

(assert (= (and b!53852 (not res!44963)) b!53855))

(assert (= (or b!53856 b!53855) bm!673))

(declare-fun m!84579 () Bool)

(assert (=> b!53853 m!84579))

(declare-fun m!84581 () Bool)

(assert (=> bm!673 m!84581))

(declare-fun m!84583 () Bool)

(assert (=> bm!673 m!84583))

(declare-fun m!84585 () Bool)

(assert (=> bm!673 m!84585))

(declare-fun m!84587 () Bool)

(assert (=> bm!673 m!84587))

(declare-fun m!84589 () Bool)

(assert (=> bm!673 m!84589))

(assert (=> b!53854 m!84589))

(assert (=> b!53854 m!84583))

(assert (=> b!53854 m!84589))

(assert (=> b!53854 m!84583))

(declare-fun m!84591 () Bool)

(assert (=> b!53854 m!84591))

(declare-fun m!84593 () Bool)

(assert (=> b!53858 m!84593))

(assert (=> b!53477 d!17140))

(declare-fun d!17142 () Bool)

(assert (=> d!17142 (= (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1149 (buf!1499 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 thiss!1379)))))))

(assert (=> d!16956 d!17142))

(assert (=> d!16956 d!17120))

(declare-fun d!17144 () Bool)

(assert (=> d!17144 (= (remainingBits!0 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 thiss!1379)) ((_ sign_extend 32) (currentBit!3061 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!3066 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3061 thiss!1379)))))))

(assert (=> d!16914 d!17144))

(assert (=> b!53638 d!17092))

(assert (=> b!53638 d!16956))

(declare-fun b!53859 () Bool)

(declare-fun res!44968 () Bool)

(declare-fun lt!83455 () (_ BitVec 32))

(assert (=> b!53859 (= res!44968 (= lt!83455 #b00000000000000000000000000000000))))

(declare-fun e!35872 () Bool)

(assert (=> b!53859 (=> res!44968 e!35872)))

(declare-fun e!35873 () Bool)

(assert (=> b!53859 (= e!35873 e!35872)))

(declare-fun b!53860 () Bool)

(declare-fun e!35877 () Bool)

(declare-fun e!35875 () Bool)

(assert (=> b!53860 (= e!35877 e!35875)))

(declare-fun res!44970 () Bool)

(assert (=> b!53860 (=> (not res!44970) (not e!35875))))

(declare-fun e!35874 () Bool)

(assert (=> b!53860 (= res!44970 e!35874)))

(declare-fun res!44971 () Bool)

(assert (=> b!53860 (=> res!44971 e!35874)))

(declare-fun lt!83457 () tuple4!28)

(assert (=> b!53860 (= res!44971 (bvsge (_1!2559 lt!83457) (_2!2559 lt!83457)))))

(assert (=> b!53860 (= lt!83455 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!83456 () (_ BitVec 32))

(assert (=> b!53860 (= lt!83456 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!53860 (= lt!83457 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(declare-fun call!677 () Bool)

(declare-fun c!3813 () Bool)

(declare-fun bm!674 () Bool)

(assert (=> bm!674 (= call!677 (byteRangesEq!0 (ite c!3813 (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83457)) (select (arr!1685 (buf!1499 thiss!1379)) (_4!14 lt!83457))) (ite c!3813 (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83457)) (select (arr!1685 (buf!1499 thiss!1379)) (_4!14 lt!83457))) (ite c!3813 lt!83456 #b00000000000000000000000000000000) lt!83455))))

(declare-fun b!53861 () Bool)

(declare-fun e!35876 () Bool)

(assert (=> b!53861 (= e!35876 e!35873)))

(declare-fun res!44972 () Bool)

(assert (=> b!53861 (= res!44972 (byteRangesEq!0 (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83457)) (select (arr!1685 (buf!1499 thiss!1379)) (_3!108 lt!83457)) lt!83456 #b00000000000000000000000000001000))))

(assert (=> b!53861 (=> (not res!44972) (not e!35873))))

(declare-fun b!53862 () Bool)

(assert (=> b!53862 (= e!35872 call!677)))

(declare-fun b!53863 () Bool)

(assert (=> b!53863 (= e!35876 call!677)))

(declare-fun d!17146 () Bool)

(declare-fun res!44969 () Bool)

(assert (=> d!17146 (=> res!44969 e!35877)))

(assert (=> d!17146 (= res!44969 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))))))

(assert (=> d!17146 (= (arrayBitRangesEq!0 (buf!1499 thiss!1379) (buf!1499 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 thiss!1379)) (currentByte!3066 thiss!1379) (currentBit!3061 thiss!1379))) e!35877)))

(declare-fun b!53864 () Bool)

(assert (=> b!53864 (= e!35875 e!35876)))

(assert (=> b!53864 (= c!3813 (= (_3!108 lt!83457) (_4!14 lt!83457)))))

(declare-fun b!53865 () Bool)

(assert (=> b!53865 (= e!35874 (arrayRangesEq!15 (buf!1499 thiss!1379) (buf!1499 thiss!1379) (_1!2559 lt!83457) (_2!2559 lt!83457)))))

(assert (= (and d!17146 (not res!44969)) b!53860))

(assert (= (and b!53860 (not res!44971)) b!53865))

(assert (= (and b!53860 res!44970) b!53864))

(assert (= (and b!53864 c!3813) b!53863))

(assert (= (and b!53864 (not c!3813)) b!53861))

(assert (= (and b!53861 res!44972) b!53859))

(assert (= (and b!53859 (not res!44968)) b!53862))

(assert (= (or b!53863 b!53862) bm!674))

(assert (=> b!53860 m!83945))

(assert (=> b!53860 m!84561))

(declare-fun m!84595 () Bool)

(assert (=> bm!674 m!84595))

(declare-fun m!84597 () Bool)

(assert (=> bm!674 m!84597))

(assert (=> bm!674 m!84595))

(declare-fun m!84599 () Bool)

(assert (=> bm!674 m!84599))

(assert (=> bm!674 m!84597))

(assert (=> b!53861 m!84597))

(assert (=> b!53861 m!84597))

(assert (=> b!53861 m!84597))

(assert (=> b!53861 m!84597))

(declare-fun m!84601 () Bool)

(assert (=> b!53861 m!84601))

(declare-fun m!84603 () Bool)

(assert (=> b!53865 m!84603))

(assert (=> b!53494 d!17146))

(assert (=> b!53494 d!16956))

(declare-fun d!17148 () Bool)

(assert (=> d!17148 (validate_offset_bits!1 ((_ sign_extend 32) (size!1149 (buf!1499 (_2!2538 lt!82772)))) ((_ sign_extend 32) (currentByte!3066 (_2!2538 lt!82772))) ((_ sign_extend 32) (currentBit!3061 (_2!2538 lt!82772))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!17148 true))

(declare-fun _$1!312 () Unit!3708)

(assert (=> d!17148 (= (choose!27 thiss!1379 (_2!2538 lt!82772) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!312)))

(declare-fun bs!4328 () Bool)

(assert (= bs!4328 d!17148))

(assert (=> bs!4328 m!83971))

(assert (=> d!16970 d!17148))

(assert (=> b!53492 d!16956))

(assert (=> b!53527 d!16968))

(assert (=> d!16964 d!17142))

(assert (=> d!16954 d!16952))

(declare-fun d!17150 () Bool)

(assert (=> d!17150 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!17150 true))

(declare-fun _$14!250 () Unit!3708)

(assert (=> d!17150 (= (choose!11 thiss!1379) _$14!250)))

(declare-fun bs!4330 () Bool)

(assert (= bs!4330 d!17150))

(assert (=> bs!4330 m!83941))

(assert (=> d!16954 d!17150))

(declare-fun d!17154 () Bool)

(declare-fun res!44974 () Bool)

(declare-fun e!35878 () Bool)

(assert (=> d!17154 (=> (not res!44974) (not e!35878))))

(assert (=> d!17154 (= res!44974 (= (size!1149 (buf!1499 (_1!2539 lt!82925))) (size!1149 (buf!1499 (_2!2539 lt!82925)))))))

(assert (=> d!17154 (= (isPrefixOf!0 (_1!2539 lt!82925) (_2!2539 lt!82925)) e!35878)))

(declare-fun b!53866 () Bool)

(declare-fun res!44975 () Bool)

(assert (=> b!53866 (=> (not res!44975) (not e!35878))))

(assert (=> b!53866 (= res!44975 (bvsle (bitIndex!0 (size!1149 (buf!1499 (_1!2539 lt!82925))) (currentByte!3066 (_1!2539 lt!82925)) (currentBit!3061 (_1!2539 lt!82925))) (bitIndex!0 (size!1149 (buf!1499 (_2!2539 lt!82925))) (currentByte!3066 (_2!2539 lt!82925)) (currentBit!3061 (_2!2539 lt!82925)))))))

(declare-fun b!53867 () Bool)

(declare-fun e!35879 () Bool)

(assert (=> b!53867 (= e!35878 e!35879)))

(declare-fun res!44973 () Bool)

(assert (=> b!53867 (=> res!44973 e!35879)))

(assert (=> b!53867 (= res!44973 (= (size!1149 (buf!1499 (_1!2539 lt!82925))) #b00000000000000000000000000000000))))

(declare-fun b!53868 () Bool)

(assert (=> b!53868 (= e!35879 (arrayBitRangesEq!0 (buf!1499 (_1!2539 lt!82925)) (buf!1499 (_2!2539 lt!82925)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 (_1!2539 lt!82925))) (currentByte!3066 (_1!2539 lt!82925)) (currentBit!3061 (_1!2539 lt!82925)))))))

(assert (= (and d!17154 res!44974) b!53866))

(assert (= (and b!53866 res!44975) b!53867))

(assert (= (and b!53867 (not res!44973)) b!53868))

(assert (=> b!53866 m!84547))

(assert (=> b!53866 m!84543))

(assert (=> b!53868 m!84547))

(assert (=> b!53868 m!84547))

(declare-fun m!84605 () Bool)

(assert (=> b!53868 m!84605))

(assert (=> d!16926 d!17154))

(declare-fun d!17156 () Bool)

(assert (=> d!17156 (isPrefixOf!0 (_2!2538 lt!82772) (_2!2538 lt!82772))))

(declare-fun lt!83458 () Unit!3708)

(assert (=> d!17156 (= lt!83458 (choose!11 (_2!2538 lt!82772)))))

(assert (=> d!17156 (= (lemmaIsPrefixRefl!0 (_2!2538 lt!82772)) lt!83458)))

(declare-fun bs!4331 () Bool)

(assert (= bs!4331 d!17156))

(assert (=> bs!4331 m!84115))

(declare-fun m!84607 () Bool)

(assert (=> bs!4331 m!84607))

(assert (=> d!16926 d!17156))

(declare-fun d!17158 () Bool)

(declare-fun res!44977 () Bool)

(declare-fun e!35880 () Bool)

(assert (=> d!17158 (=> (not res!44977) (not e!35880))))

(assert (=> d!17158 (= res!44977 (= (size!1149 (buf!1499 lt!82927)) (size!1149 (buf!1499 lt!82927))))))

(assert (=> d!17158 (= (isPrefixOf!0 lt!82927 lt!82927) e!35880)))

(declare-fun b!53869 () Bool)

(declare-fun res!44978 () Bool)

(assert (=> b!53869 (=> (not res!44978) (not e!35880))))

(assert (=> b!53869 (= res!44978 (bvsle (bitIndex!0 (size!1149 (buf!1499 lt!82927)) (currentByte!3066 lt!82927) (currentBit!3061 lt!82927)) (bitIndex!0 (size!1149 (buf!1499 lt!82927)) (currentByte!3066 lt!82927) (currentBit!3061 lt!82927))))))

(declare-fun b!53870 () Bool)

(declare-fun e!35881 () Bool)

(assert (=> b!53870 (= e!35880 e!35881)))

(declare-fun res!44976 () Bool)

(assert (=> b!53870 (=> res!44976 e!35881)))

(assert (=> b!53870 (= res!44976 (= (size!1149 (buf!1499 lt!82927)) #b00000000000000000000000000000000))))

(declare-fun b!53871 () Bool)

(assert (=> b!53871 (= e!35881 (arrayBitRangesEq!0 (buf!1499 lt!82927) (buf!1499 lt!82927) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 lt!82927)) (currentByte!3066 lt!82927) (currentBit!3061 lt!82927))))))

(assert (= (and d!17158 res!44977) b!53869))

(assert (= (and b!53869 res!44978) b!53870))

(assert (= (and b!53870 (not res!44976)) b!53871))

(declare-fun m!84609 () Bool)

(assert (=> b!53869 m!84609))

(assert (=> b!53869 m!84609))

(assert (=> b!53871 m!84609))

(assert (=> b!53871 m!84609))

(declare-fun m!84611 () Bool)

(assert (=> b!53871 m!84611))

(assert (=> d!16926 d!17158))

(declare-fun d!17160 () Bool)

(declare-fun res!44980 () Bool)

(declare-fun e!35882 () Bool)

(assert (=> d!17160 (=> (not res!44980) (not e!35882))))

(assert (=> d!17160 (= res!44980 (= (size!1149 (buf!1499 lt!82927)) (size!1149 (buf!1499 (_2!2538 lt!82772)))))))

(assert (=> d!17160 (= (isPrefixOf!0 lt!82927 (_2!2538 lt!82772)) e!35882)))

(declare-fun b!53872 () Bool)

(declare-fun res!44981 () Bool)

(assert (=> b!53872 (=> (not res!44981) (not e!35882))))

(assert (=> b!53872 (= res!44981 (bvsle (bitIndex!0 (size!1149 (buf!1499 lt!82927)) (currentByte!3066 lt!82927) (currentBit!3061 lt!82927)) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772)))))))

(declare-fun b!53873 () Bool)

(declare-fun e!35883 () Bool)

(assert (=> b!53873 (= e!35882 e!35883)))

(declare-fun res!44979 () Bool)

(assert (=> b!53873 (=> res!44979 e!35883)))

(assert (=> b!53873 (= res!44979 (= (size!1149 (buf!1499 lt!82927)) #b00000000000000000000000000000000))))

(declare-fun b!53874 () Bool)

(assert (=> b!53874 (= e!35883 (arrayBitRangesEq!0 (buf!1499 lt!82927) (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 lt!82927)) (currentByte!3066 lt!82927) (currentBit!3061 lt!82927))))))

(assert (= (and d!17160 res!44980) b!53872))

(assert (= (and b!53872 res!44981) b!53873))

(assert (= (and b!53873 (not res!44979)) b!53874))

(assert (=> b!53872 m!84609))

(assert (=> b!53872 m!84101))

(assert (=> b!53874 m!84609))

(assert (=> b!53874 m!84609))

(declare-fun m!84613 () Bool)

(assert (=> b!53874 m!84613))

(assert (=> d!16926 d!17160))

(assert (=> d!16926 d!16954))

(declare-fun d!17162 () Bool)

(assert (=> d!17162 (isPrefixOf!0 lt!82927 (_2!2538 lt!82772))))

(declare-fun lt!83461 () Unit!3708)

(declare-fun choose!30 (BitStream!1990 BitStream!1990 BitStream!1990) Unit!3708)

(assert (=> d!17162 (= lt!83461 (choose!30 lt!82927 (_2!2538 lt!82772) (_2!2538 lt!82772)))))

(assert (=> d!17162 (isPrefixOf!0 lt!82927 (_2!2538 lt!82772))))

(assert (=> d!17162 (= (lemmaIsPrefixTransitive!0 lt!82927 (_2!2538 lt!82772) (_2!2538 lt!82772)) lt!83461)))

(declare-fun bs!4332 () Bool)

(assert (= bs!4332 d!17162))

(assert (=> bs!4332 m!84109))

(declare-fun m!84615 () Bool)

(assert (=> bs!4332 m!84615))

(assert (=> bs!4332 m!84109))

(assert (=> d!16926 d!17162))

(declare-fun d!17166 () Bool)

(assert (=> d!17166 (isPrefixOf!0 lt!82927 lt!82927)))

(declare-fun lt!83462 () Unit!3708)

(assert (=> d!17166 (= lt!83462 (choose!11 lt!82927))))

(assert (=> d!17166 (= (lemmaIsPrefixRefl!0 lt!82927) lt!83462)))

(declare-fun bs!4333 () Bool)

(assert (= bs!4333 d!17166))

(assert (=> bs!4333 m!84117))

(declare-fun m!84617 () Bool)

(assert (=> bs!4333 m!84617))

(assert (=> d!16926 d!17166))

(declare-fun d!17168 () Bool)

(assert (=> d!17168 (isPrefixOf!0 lt!82927 (_2!2538 lt!82772))))

(declare-fun lt!83463 () Unit!3708)

(assert (=> d!17168 (= lt!83463 (choose!30 lt!82927 thiss!1379 (_2!2538 lt!82772)))))

(assert (=> d!17168 (isPrefixOf!0 lt!82927 thiss!1379)))

(assert (=> d!17168 (= (lemmaIsPrefixTransitive!0 lt!82927 thiss!1379 (_2!2538 lt!82772)) lt!83463)))

(declare-fun bs!4334 () Bool)

(assert (= bs!4334 d!17168))

(assert (=> bs!4334 m!84109))

(declare-fun m!84619 () Bool)

(assert (=> bs!4334 m!84619))

(declare-fun m!84621 () Bool)

(assert (=> bs!4334 m!84621))

(assert (=> d!16926 d!17168))

(assert (=> d!16926 d!16952))

(declare-fun d!17170 () Bool)

(declare-fun res!44983 () Bool)

(declare-fun e!35884 () Bool)

(assert (=> d!17170 (=> (not res!44983) (not e!35884))))

(assert (=> d!17170 (= res!44983 (= (size!1149 (buf!1499 (_2!2538 lt!82772))) (size!1149 (buf!1499 (_2!2538 lt!82772)))))))

(assert (=> d!17170 (= (isPrefixOf!0 (_2!2538 lt!82772) (_2!2538 lt!82772)) e!35884)))

(declare-fun b!53875 () Bool)

(declare-fun res!44984 () Bool)

(assert (=> b!53875 (=> (not res!44984) (not e!35884))))

(assert (=> b!53875 (= res!44984 (bvsle (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772))) (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772)))))))

(declare-fun b!53876 () Bool)

(declare-fun e!35885 () Bool)

(assert (=> b!53876 (= e!35884 e!35885)))

(declare-fun res!44982 () Bool)

(assert (=> b!53876 (=> res!44982 e!35885)))

(assert (=> b!53876 (= res!44982 (= (size!1149 (buf!1499 (_2!2538 lt!82772))) #b00000000000000000000000000000000))))

(declare-fun b!53877 () Bool)

(assert (=> b!53877 (= e!35885 (arrayBitRangesEq!0 (buf!1499 (_2!2538 lt!82772)) (buf!1499 (_2!2538 lt!82772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1149 (buf!1499 (_2!2538 lt!82772))) (currentByte!3066 (_2!2538 lt!82772)) (currentBit!3061 (_2!2538 lt!82772)))))))

(assert (= (and d!17170 res!44983) b!53875))

(assert (= (and b!53875 res!44984) b!53876))

(assert (= (and b!53876 (not res!44982)) b!53877))

(assert (=> b!53875 m!84101))

(assert (=> b!53875 m!84101))

(assert (=> b!53877 m!84101))

(assert (=> b!53877 m!84101))

(declare-fun m!84623 () Bool)

(assert (=> b!53877 m!84623))

(assert (=> d!16926 d!17170))

(assert (=> d!16926 d!16966))

(declare-fun d!17172 () Bool)

(declare-fun c!3814 () Bool)

(assert (=> d!17172 (= c!3814 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!35886 () List!570)

(assert (=> d!17172 (= (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!35886)))

(declare-fun b!53878 () Bool)

(assert (=> b!53878 (= e!35886 Nil!567)))

(declare-fun b!53879 () Bool)

(assert (=> b!53879 (= e!35886 (Cons!566 (not (= (bvand ((_ sign_extend 24) (select (arr!1685 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2538 lt!82772) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!17172 c!3814) b!53878))

(assert (= (and d!17172 (not c!3814)) b!53879))

(declare-fun m!84625 () Bool)

(assert (=> b!53879 m!84625))

(declare-fun m!84627 () Bool)

(assert (=> b!53879 m!84627))

(declare-fun m!84629 () Bool)

(assert (=> b!53879 m!84629))

(assert (=> b!53485 d!17172))

(push 1)

(assert (not d!17106))

(assert (not b!53847))

(assert (not d!17092))

(assert (not b!53813))

(assert (not b!53861))

(assert (not bm!674))

(assert (not b!53823))

(assert (not d!17138))

(assert (not b!53824))

(assert (not d!17130))

(assert (not b!53783))

(assert (not d!17156))

(assert (not b!53846))

(assert (not b!53821))

(assert (not b!53820))

(assert (not b!53817))

(assert (not b!53811))

(assert (not b!53815))

(assert (not d!17150))

(assert (not d!17090))

(assert (not d!17162))

(assert (not b!53808))

(assert (not b!53868))

(assert (not d!17168))

(assert (not b!53853))

(assert (not b!53865))

(assert (not d!17116))

(assert (not b!53875))

(assert (not b!53869))

(assert (not b!53871))

(assert (not b!53860))

(assert (not b!53803))

(assert (not d!17134))

(assert (not b!53785))

(assert (not d!17148))

(assert (not b!53797))

(assert (not b!53826))

(assert (not d!17118))

(assert (not d!17094))

(assert (not d!17132))

(assert (not b!53827))

(assert (not b!53858))

(assert (not b!53784))

(assert (not bm!672))

(assert (not b!53866))

(assert (not d!17108))

(assert (not d!17100))

(assert (not d!17104))

(assert (not b!53796))

(assert (not d!17166))

(assert (not d!17096))

(assert (not b!53874))

(assert (not b!53879))

(assert (not b!53872))

(assert (not b!53816))

(assert (not b!53810))

(assert (not d!17102))

(assert (not b!53799))

(assert (not b!53851))

(assert (not b!53877))

(assert (not d!17098))

(assert (not bm!673))

(assert (not b!53782))

(assert (not b!53854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

