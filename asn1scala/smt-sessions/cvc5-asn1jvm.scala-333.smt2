; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7766 () Bool)

(assert start!7766)

(declare-fun b!37908 () Bool)

(declare-fun res!32214 () Bool)

(declare-fun e!24932 () Bool)

(assert (=> b!37908 (=> res!32214 e!24932)))

(declare-fun lt!57527 () Bool)

(declare-fun lt!57534 () Bool)

(assert (=> b!37908 (= res!32214 (not (= lt!57527 lt!57534)))))

(declare-fun b!37909 () Bool)

(declare-fun e!24937 () Bool)

(declare-fun e!24922 () Bool)

(assert (=> b!37909 (= e!24937 (not e!24922))))

(declare-fun res!32221 () Bool)

(assert (=> b!37909 (=> res!32221 e!24922)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!37909 (= res!32221 (bvsge i!635 to!314))))

(declare-datatypes ((array!1946 0))(
  ( (array!1947 (arr!1367 (Array (_ BitVec 32) (_ BitVec 8))) (size!874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1504 0))(
  ( (BitStream!1505 (buf!1202 array!1946) (currentByte!2608 (_ BitVec 32)) (currentBit!2603 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1504)

(declare-fun isPrefixOf!0 (BitStream!1504 BitStream!1504) Bool)

(assert (=> b!37909 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2745 0))(
  ( (Unit!2746) )
))
(declare-fun lt!57530 () Unit!2745)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1504) Unit!2745)

(assert (=> b!37909 (= lt!57530 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!57521 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!37909 (= lt!57521 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(declare-fun b!37910 () Bool)

(declare-fun e!24931 () Bool)

(declare-fun e!24929 () Bool)

(assert (=> b!37910 (= e!24931 e!24929)))

(declare-fun res!32207 () Bool)

(assert (=> b!37910 (=> res!32207 e!24929)))

(declare-fun lt!57518 () Bool)

(assert (=> b!37910 (= res!32207 (not (= lt!57527 lt!57518)))))

(declare-datatypes ((List!453 0))(
  ( (Nil!450) (Cons!449 (h!568 Bool) (t!1203 List!453)) )
))
(declare-fun lt!57532 () List!453)

(declare-fun head!290 (List!453) Bool)

(assert (=> b!37910 (= lt!57527 (head!290 lt!57532))))

(declare-fun b!37911 () Bool)

(declare-fun e!24935 () Bool)

(assert (=> b!37911 (= e!24922 e!24935)))

(declare-fun res!32206 () Bool)

(assert (=> b!37911 (=> res!32206 e!24935)))

(declare-datatypes ((tuple2!3688 0))(
  ( (tuple2!3689 (_1!1931 Unit!2745) (_2!1931 BitStream!1504)) )
))
(declare-fun lt!57528 () tuple2!3688)

(assert (=> b!37911 (= res!32206 (not (isPrefixOf!0 thiss!1379 (_2!1931 lt!57528))))))

(declare-fun lt!57517 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37911 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!57517)))

(assert (=> b!37911 (= lt!57517 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57524 () Unit!2745)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1504 BitStream!1504 (_ BitVec 64) (_ BitVec 64)) Unit!2745)

(assert (=> b!37911 (= lt!57524 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1931 lt!57528) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1946)

(declare-fun appendBitFromByte!0 (BitStream!1504 (_ BitVec 8) (_ BitVec 32)) tuple2!3688)

(assert (=> b!37911 (= lt!57528 (appendBitFromByte!0 thiss!1379 (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!37912 () Bool)

(declare-fun e!24936 () Bool)

(declare-fun e!24933 () Bool)

(assert (=> b!37912 (= e!24936 e!24933)))

(declare-fun res!32215 () Bool)

(assert (=> b!37912 (=> res!32215 e!24933)))

(declare-fun lt!57520 () (_ BitVec 64))

(assert (=> b!37912 (= res!32215 (not (= lt!57520 (bvsub (bvadd lt!57521 to!314) i!635))))))

(declare-fun lt!57529 () tuple2!3688)

(assert (=> b!37912 (= lt!57520 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57529))) (currentByte!2608 (_2!1931 lt!57529)) (currentBit!2603 (_2!1931 lt!57529))))))

(declare-fun b!37913 () Bool)

(declare-fun res!32204 () Bool)

(declare-fun e!24924 () Bool)

(assert (=> b!37913 (=> res!32204 e!24924)))

(declare-fun length!179 (List!453) Int)

(assert (=> b!37913 (= res!32204 (<= (length!179 lt!57532) 0))))

(declare-fun b!37914 () Bool)

(declare-fun e!24921 () Bool)

(assert (=> b!37914 (= e!24929 e!24921)))

(declare-fun res!32223 () Bool)

(assert (=> b!37914 (=> res!32223 e!24921)))

(declare-fun lt!57523 () Bool)

(assert (=> b!37914 (= res!32223 (not (= lt!57534 lt!57523)))))

(declare-fun bitAt!0 (array!1946 (_ BitVec 64)) Bool)

(assert (=> b!37914 (= lt!57523 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun byteArrayBitContentToList!0 (BitStream!1504 array!1946 (_ BitVec 64) (_ BitVec 64)) List!453)

(assert (=> b!37914 (= lt!57534 (head!290 (byteArrayBitContentToList!0 (_2!1931 lt!57529) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!37915 () Bool)

(declare-fun e!24927 () Bool)

(assert (=> b!37915 (= e!24924 e!24927)))

(declare-fun res!32222 () Bool)

(assert (=> b!37915 (=> res!32222 e!24927)))

(declare-fun lt!57519 () List!453)

(declare-fun lt!57535 () List!453)

(assert (=> b!37915 (= res!32222 (not (= lt!57519 lt!57535)))))

(assert (=> b!37915 (= lt!57535 lt!57519)))

(declare-fun tail!170 (List!453) List!453)

(assert (=> b!37915 (= lt!57519 (tail!170 lt!57532))))

(declare-datatypes ((tuple2!3690 0))(
  ( (tuple2!3691 (_1!1932 BitStream!1504) (_2!1932 BitStream!1504)) )
))
(declare-fun lt!57531 () tuple2!3690)

(declare-fun lt!57533 () tuple2!3690)

(declare-fun lt!57513 () Unit!2745)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1504 BitStream!1504 BitStream!1504 BitStream!1504 (_ BitVec 64) List!453) Unit!2745)

(assert (=> b!37915 (= lt!57513 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1931 lt!57529) (_2!1931 lt!57529) (_1!1932 lt!57533) (_1!1932 lt!57531) (bvsub to!314 i!635) lt!57532))))

(declare-fun b!37916 () Bool)

(assert (=> b!37916 (= e!24935 e!24936)))

(declare-fun res!32205 () Bool)

(assert (=> b!37916 (=> res!32205 e!24936)))

(assert (=> b!37916 (= res!32205 (not (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!57529))))))

(assert (=> b!37916 (isPrefixOf!0 thiss!1379 (_2!1931 lt!57529))))

(declare-fun lt!57526 () Unit!2745)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1504 BitStream!1504 BitStream!1504) Unit!2745)

(assert (=> b!37916 (= lt!57526 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1931 lt!57528) (_2!1931 lt!57529)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1504 array!1946 (_ BitVec 64) (_ BitVec 64)) tuple2!3688)

(assert (=> b!37916 (= lt!57529 (appendBitsMSBFirstLoop!0 (_2!1931 lt!57528) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24934 () Bool)

(assert (=> b!37916 e!24934))

(declare-fun res!32213 () Bool)

(assert (=> b!37916 (=> (not res!32213) (not e!24934))))

(assert (=> b!37916 (= res!32213 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57538 () Unit!2745)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1504 array!1946 (_ BitVec 64)) Unit!2745)

(assert (=> b!37916 (= lt!57538 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1202 (_2!1931 lt!57528)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57516 () tuple2!3690)

(declare-fun reader!0 (BitStream!1504 BitStream!1504) tuple2!3690)

(assert (=> b!37916 (= lt!57516 (reader!0 thiss!1379 (_2!1931 lt!57528)))))

(declare-fun b!37917 () Bool)

(assert (=> b!37917 (= e!24927 e!24931)))

(declare-fun res!32202 () Bool)

(assert (=> b!37917 (=> res!32202 e!24931)))

(assert (=> b!37917 (= res!32202 (not (= lt!57518 (bitAt!0 (buf!1202 (_1!1932 lt!57531)) lt!57521))))))

(assert (=> b!37917 (= lt!57518 (bitAt!0 (buf!1202 (_1!1932 lt!57533)) lt!57521))))

(declare-fun b!37919 () Bool)

(declare-fun res!32211 () Bool)

(assert (=> b!37919 (=> res!32211 e!24933)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!37919 (= res!32211 (not (invariant!0 (currentBit!2603 (_2!1931 lt!57529)) (currentByte!2608 (_2!1931 lt!57529)) (size!874 (buf!1202 (_2!1931 lt!57529))))))))

(declare-fun b!37920 () Bool)

(declare-fun res!32218 () Bool)

(declare-fun e!24928 () Bool)

(assert (=> b!37920 (=> res!32218 e!24928)))

(assert (=> b!37920 (= res!32218 (not (invariant!0 (currentBit!2603 (_2!1931 lt!57528)) (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57528))))))))

(declare-fun b!37921 () Bool)

(assert (=> b!37921 (= e!24933 e!24928)))

(declare-fun res!32210 () Bool)

(assert (=> b!37921 (=> res!32210 e!24928)))

(assert (=> b!37921 (= res!32210 (not (= (size!874 (buf!1202 (_2!1931 lt!57528))) (size!874 (buf!1202 (_2!1931 lt!57529))))))))

(declare-fun lt!57525 () (_ BitVec 64))

(assert (=> b!37921 (= lt!57520 (bvsub (bvsub (bvadd lt!57525 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37921 (= lt!57525 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(assert (=> b!37921 (= (size!874 (buf!1202 (_2!1931 lt!57529))) (size!874 (buf!1202 thiss!1379)))))

(declare-fun b!37922 () Bool)

(assert (=> b!37922 (= e!24928 e!24924)))

(declare-fun res!32209 () Bool)

(assert (=> b!37922 (=> res!32209 e!24924)))

(assert (=> b!37922 (= res!32209 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1504 BitStream!1504 (_ BitVec 64)) List!453)

(assert (=> b!37922 (= lt!57535 (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_1!1932 lt!57531) lt!57517))))

(assert (=> b!37922 (= lt!57532 (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_1!1932 lt!57533) (bvsub to!314 i!635)))))

(assert (=> b!37922 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!57517)))

(declare-fun lt!57536 () Unit!2745)

(assert (=> b!37922 (= lt!57536 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1931 lt!57528) (buf!1202 (_2!1931 lt!57529)) lt!57517))))

(assert (=> b!37922 (= lt!57531 (reader!0 (_2!1931 lt!57528) (_2!1931 lt!57529)))))

(assert (=> b!37922 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!57537 () Unit!2745)

(assert (=> b!37922 (= lt!57537 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1202 (_2!1931 lt!57529)) (bvsub to!314 i!635)))))

(assert (=> b!37922 (= lt!57533 (reader!0 thiss!1379 (_2!1931 lt!57529)))))

(declare-fun b!37923 () Bool)

(declare-fun res!32212 () Bool)

(assert (=> b!37923 (=> res!32212 e!24928)))

(assert (=> b!37923 (= res!32212 (not (invariant!0 (currentBit!2603 (_2!1931 lt!57528)) (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57529))))))))

(declare-fun b!37924 () Bool)

(assert (=> b!37924 (= e!24932 (invariant!0 (currentBit!2603 thiss!1379) (currentByte!2608 thiss!1379) (size!874 (buf!1202 thiss!1379))))))

(declare-fun b!37925 () Bool)

(declare-fun res!32220 () Bool)

(assert (=> b!37925 (=> res!32220 e!24932)))

(declare-datatypes ((tuple2!3692 0))(
  ( (tuple2!3693 (_1!1933 BitStream!1504) (_2!1933 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1504) tuple2!3692)

(assert (=> b!37925 (= res!32220 (not (= (_2!1933 (readBitPure!0 (_1!1932 lt!57533))) lt!57523)))))

(declare-fun res!32216 () Bool)

(assert (=> start!7766 (=> (not res!32216) (not e!24937))))

(assert (=> start!7766 (= res!32216 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!874 srcBuffer!2))))))))

(assert (=> start!7766 e!24937))

(assert (=> start!7766 true))

(declare-fun array_inv!805 (array!1946) Bool)

(assert (=> start!7766 (array_inv!805 srcBuffer!2)))

(declare-fun e!24925 () Bool)

(declare-fun inv!12 (BitStream!1504) Bool)

(assert (=> start!7766 (and (inv!12 thiss!1379) e!24925)))

(declare-fun b!37918 () Bool)

(declare-fun res!32203 () Bool)

(assert (=> b!37918 (=> res!32203 e!24933)))

(assert (=> b!37918 (= res!32203 (not (= (size!874 (buf!1202 thiss!1379)) (size!874 (buf!1202 (_2!1931 lt!57529))))))))

(declare-fun b!37926 () Bool)

(assert (=> b!37926 (= e!24934 (= (head!290 (byteArrayBitContentToList!0 (_2!1931 lt!57528) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!290 (bitStreamReadBitsIntoList!0 (_2!1931 lt!57528) (_1!1932 lt!57516) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!37927 () Bool)

(declare-fun e!24926 () Bool)

(assert (=> b!37927 (= e!24926 e!24932)))

(declare-fun res!32219 () Bool)

(assert (=> b!37927 (=> res!32219 e!24932)))

(declare-fun lt!57515 () Bool)

(assert (=> b!37927 (= res!32219 (not (= lt!57515 lt!57523)))))

(declare-fun lt!57514 () Bool)

(assert (=> b!37927 (= lt!57514 lt!57515)))

(assert (=> b!37927 (= lt!57515 (bitAt!0 (buf!1202 (_2!1931 lt!57529)) lt!57521))))

(declare-fun lt!57522 () Unit!2745)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1946 array!1946 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2745)

(assert (=> b!37927 (= lt!57522 (arrayBitRangesEqImpliesEq!0 (buf!1202 (_2!1931 lt!57528)) (buf!1202 (_2!1931 lt!57529)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57521 lt!57525))))

(declare-fun b!37928 () Bool)

(assert (=> b!37928 (= e!24925 (array_inv!805 (buf!1202 thiss!1379)))))

(declare-fun b!37929 () Bool)

(declare-fun res!32208 () Bool)

(assert (=> b!37929 (=> (not res!32208) (not e!24937))))

(assert (=> b!37929 (= res!32208 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 thiss!1379))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!37930 () Bool)

(assert (=> b!37930 (= e!24921 e!24926)))

(declare-fun res!32217 () Bool)

(assert (=> b!37930 (=> res!32217 e!24926)))

(assert (=> b!37930 (= res!32217 (not (= lt!57514 lt!57523)))))

(assert (=> b!37930 (= lt!57514 (bitAt!0 (buf!1202 (_2!1931 lt!57528)) lt!57521))))

(assert (= (and start!7766 res!32216) b!37929))

(assert (= (and b!37929 res!32208) b!37909))

(assert (= (and b!37909 (not res!32221)) b!37911))

(assert (= (and b!37911 (not res!32206)) b!37916))

(assert (= (and b!37916 res!32213) b!37926))

(assert (= (and b!37916 (not res!32205)) b!37912))

(assert (= (and b!37912 (not res!32215)) b!37919))

(assert (= (and b!37919 (not res!32211)) b!37918))

(assert (= (and b!37918 (not res!32203)) b!37921))

(assert (= (and b!37921 (not res!32210)) b!37920))

(assert (= (and b!37920 (not res!32218)) b!37923))

(assert (= (and b!37923 (not res!32212)) b!37922))

(assert (= (and b!37922 (not res!32209)) b!37913))

(assert (= (and b!37913 (not res!32204)) b!37915))

(assert (= (and b!37915 (not res!32222)) b!37917))

(assert (= (and b!37917 (not res!32202)) b!37910))

(assert (= (and b!37910 (not res!32207)) b!37914))

(assert (= (and b!37914 (not res!32223)) b!37930))

(assert (= (and b!37930 (not res!32217)) b!37927))

(assert (= (and b!37927 (not res!32219)) b!37925))

(assert (= (and b!37925 (not res!32220)) b!37908))

(assert (= (and b!37908 (not res!32214)) b!37924))

(assert (= start!7766 b!37928))

(declare-fun m!57591 () Bool)

(assert (=> b!37909 m!57591))

(declare-fun m!57593 () Bool)

(assert (=> b!37909 m!57593))

(declare-fun m!57595 () Bool)

(assert (=> b!37909 m!57595))

(declare-fun m!57597 () Bool)

(assert (=> b!37919 m!57597))

(declare-fun m!57599 () Bool)

(assert (=> b!37924 m!57599))

(declare-fun m!57601 () Bool)

(assert (=> b!37914 m!57601))

(declare-fun m!57603 () Bool)

(assert (=> b!37914 m!57603))

(assert (=> b!37914 m!57603))

(declare-fun m!57605 () Bool)

(assert (=> b!37914 m!57605))

(declare-fun m!57607 () Bool)

(assert (=> b!37921 m!57607))

(declare-fun m!57609 () Bool)

(assert (=> b!37913 m!57609))

(declare-fun m!57611 () Bool)

(assert (=> b!37927 m!57611))

(declare-fun m!57613 () Bool)

(assert (=> b!37927 m!57613))

(declare-fun m!57615 () Bool)

(assert (=> b!37926 m!57615))

(assert (=> b!37926 m!57615))

(declare-fun m!57617 () Bool)

(assert (=> b!37926 m!57617))

(declare-fun m!57619 () Bool)

(assert (=> b!37926 m!57619))

(assert (=> b!37926 m!57619))

(declare-fun m!57621 () Bool)

(assert (=> b!37926 m!57621))

(declare-fun m!57623 () Bool)

(assert (=> b!37915 m!57623))

(declare-fun m!57625 () Bool)

(assert (=> b!37915 m!57625))

(declare-fun m!57627 () Bool)

(assert (=> b!37910 m!57627))

(declare-fun m!57629 () Bool)

(assert (=> b!37922 m!57629))

(declare-fun m!57631 () Bool)

(assert (=> b!37922 m!57631))

(declare-fun m!57633 () Bool)

(assert (=> b!37922 m!57633))

(declare-fun m!57635 () Bool)

(assert (=> b!37922 m!57635))

(declare-fun m!57637 () Bool)

(assert (=> b!37922 m!57637))

(declare-fun m!57639 () Bool)

(assert (=> b!37922 m!57639))

(declare-fun m!57641 () Bool)

(assert (=> b!37922 m!57641))

(declare-fun m!57643 () Bool)

(assert (=> b!37922 m!57643))

(declare-fun m!57645 () Bool)

(assert (=> b!37930 m!57645))

(declare-fun m!57647 () Bool)

(assert (=> start!7766 m!57647))

(declare-fun m!57649 () Bool)

(assert (=> start!7766 m!57649))

(declare-fun m!57651 () Bool)

(assert (=> b!37929 m!57651))

(declare-fun m!57653 () Bool)

(assert (=> b!37912 m!57653))

(declare-fun m!57655 () Bool)

(assert (=> b!37916 m!57655))

(declare-fun m!57657 () Bool)

(assert (=> b!37916 m!57657))

(declare-fun m!57659 () Bool)

(assert (=> b!37916 m!57659))

(declare-fun m!57661 () Bool)

(assert (=> b!37916 m!57661))

(declare-fun m!57663 () Bool)

(assert (=> b!37916 m!57663))

(declare-fun m!57665 () Bool)

(assert (=> b!37916 m!57665))

(declare-fun m!57667 () Bool)

(assert (=> b!37916 m!57667))

(declare-fun m!57669 () Bool)

(assert (=> b!37925 m!57669))

(declare-fun m!57671 () Bool)

(assert (=> b!37917 m!57671))

(declare-fun m!57673 () Bool)

(assert (=> b!37917 m!57673))

(declare-fun m!57675 () Bool)

(assert (=> b!37920 m!57675))

(declare-fun m!57677 () Bool)

(assert (=> b!37928 m!57677))

(declare-fun m!57679 () Bool)

(assert (=> b!37911 m!57679))

(declare-fun m!57681 () Bool)

(assert (=> b!37911 m!57681))

(declare-fun m!57683 () Bool)

(assert (=> b!37911 m!57683))

(declare-fun m!57685 () Bool)

(assert (=> b!37911 m!57685))

(assert (=> b!37911 m!57681))

(declare-fun m!57687 () Bool)

(assert (=> b!37911 m!57687))

(declare-fun m!57689 () Bool)

(assert (=> b!37923 m!57689))

(push 1)

(assert (not b!37924))

(assert (not b!37911))

(assert (not b!37929))

(assert (not b!37916))

(assert (not b!37921))

(assert (not b!37927))

(assert (not b!37910))

(assert (not b!37909))

(assert (not b!37923))

(assert (not b!37920))

(assert (not b!37915))

(assert (not b!37925))

(assert (not b!37930))

(assert (not b!37917))

(assert (not b!37914))

(assert (not b!37913))

(assert (not b!37922))

(assert (not start!7766))

(assert (not b!37919))

(assert (not b!37912))

(assert (not b!37926))

(assert (not b!37928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11350 () Bool)

(assert (=> d!11350 (= (bitAt!0 (buf!1202 (_1!1932 lt!57531)) lt!57521) (not (= (bvand ((_ sign_extend 24) (select (arr!1367 (buf!1202 (_1!1932 lt!57531))) ((_ extract 31 0) (bvsdiv lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3022 () Bool)

(assert (= bs!3022 d!11350))

(declare-fun m!57965 () Bool)

(assert (=> bs!3022 m!57965))

(declare-fun m!57967 () Bool)

(assert (=> bs!3022 m!57967))

(assert (=> b!37917 d!11350))

(declare-fun d!11352 () Bool)

(assert (=> d!11352 (= (bitAt!0 (buf!1202 (_1!1932 lt!57533)) lt!57521) (not (= (bvand ((_ sign_extend 24) (select (arr!1367 (buf!1202 (_1!1932 lt!57533))) ((_ extract 31 0) (bvsdiv lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3023 () Bool)

(assert (= bs!3023 d!11352))

(declare-fun m!57969 () Bool)

(assert (=> bs!3023 m!57969))

(assert (=> bs!3023 m!57967))

(assert (=> b!37917 d!11352))

(declare-fun d!11354 () Bool)

(assert (=> d!11354 (= (array_inv!805 (buf!1202 thiss!1379)) (bvsge (size!874 (buf!1202 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!37928 d!11354))

(declare-fun d!11356 () Bool)

(assert (=> d!11356 (= (bitAt!0 (buf!1202 (_2!1931 lt!57529)) lt!57521) (not (= (bvand ((_ sign_extend 24) (select (arr!1367 (buf!1202 (_2!1931 lt!57529))) ((_ extract 31 0) (bvsdiv lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3024 () Bool)

(assert (= bs!3024 d!11356))

(declare-fun m!57971 () Bool)

(assert (=> bs!3024 m!57971))

(assert (=> bs!3024 m!57967))

(assert (=> b!37927 d!11356))

(declare-fun d!11358 () Bool)

(assert (=> d!11358 (= (bitAt!0 (buf!1202 (_2!1931 lt!57528)) lt!57521) (bitAt!0 (buf!1202 (_2!1931 lt!57529)) lt!57521))))

(declare-fun lt!57805 () Unit!2745)

(declare-fun choose!31 (array!1946 array!1946 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2745)

(assert (=> d!11358 (= lt!57805 (choose!31 (buf!1202 (_2!1931 lt!57528)) (buf!1202 (_2!1931 lt!57529)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57521 lt!57525))))

(assert (=> d!11358 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!57525))))

(assert (=> d!11358 (= (arrayBitRangesEqImpliesEq!0 (buf!1202 (_2!1931 lt!57528)) (buf!1202 (_2!1931 lt!57529)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57521 lt!57525) lt!57805)))

(declare-fun bs!3025 () Bool)

(assert (= bs!3025 d!11358))

(assert (=> bs!3025 m!57645))

(assert (=> bs!3025 m!57611))

(declare-fun m!57973 () Bool)

(assert (=> bs!3025 m!57973))

(assert (=> b!37927 d!11358))

(declare-fun d!11362 () Bool)

(declare-fun res!32413 () Bool)

(declare-fun e!25076 () Bool)

(assert (=> d!11362 (=> (not res!32413) (not e!25076))))

(assert (=> d!11362 (= res!32413 (= (size!874 (buf!1202 thiss!1379)) (size!874 (buf!1202 (_2!1931 lt!57529)))))))

(assert (=> d!11362 (= (isPrefixOf!0 thiss!1379 (_2!1931 lt!57529)) e!25076)))

(declare-fun b!38133 () Bool)

(declare-fun res!32414 () Bool)

(assert (=> b!38133 (=> (not res!32414) (not e!25076))))

(assert (=> b!38133 (= res!32414 (bvsle (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)) (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57529))) (currentByte!2608 (_2!1931 lt!57529)) (currentBit!2603 (_2!1931 lt!57529)))))))

(declare-fun b!38134 () Bool)

(declare-fun e!25075 () Bool)

(assert (=> b!38134 (= e!25076 e!25075)))

(declare-fun res!32415 () Bool)

(assert (=> b!38134 (=> res!32415 e!25075)))

(assert (=> b!38134 (= res!32415 (= (size!874 (buf!1202 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38135 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1946 array!1946 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38135 (= e!25075 (arrayBitRangesEq!0 (buf!1202 thiss!1379) (buf!1202 (_2!1931 lt!57529)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379))))))

(assert (= (and d!11362 res!32413) b!38133))

(assert (= (and b!38133 res!32414) b!38134))

(assert (= (and b!38134 (not res!32415)) b!38135))

(assert (=> b!38133 m!57595))

(assert (=> b!38133 m!57653))

(assert (=> b!38135 m!57595))

(assert (=> b!38135 m!57595))

(declare-fun m!57979 () Bool)

(assert (=> b!38135 m!57979))

(assert (=> b!37916 d!11362))

(declare-fun d!11370 () Bool)

(assert (=> d!11370 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!57808 () Unit!2745)

(declare-fun choose!9 (BitStream!1504 array!1946 (_ BitVec 64) BitStream!1504) Unit!2745)

(assert (=> d!11370 (= lt!57808 (choose!9 thiss!1379 (buf!1202 (_2!1931 lt!57528)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1505 (buf!1202 (_2!1931 lt!57528)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379))))))

(assert (=> d!11370 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1202 (_2!1931 lt!57528)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!57808)))

(declare-fun bs!3028 () Bool)

(assert (= bs!3028 d!11370))

(assert (=> bs!3028 m!57659))

(declare-fun m!57981 () Bool)

(assert (=> bs!3028 m!57981))

(assert (=> b!37916 d!11370))

(declare-fun b!38146 () Bool)

(declare-fun res!32423 () Bool)

(declare-fun e!25082 () Bool)

(assert (=> b!38146 (=> (not res!32423) (not e!25082))))

(declare-fun lt!57854 () tuple2!3690)

(assert (=> b!38146 (= res!32423 (isPrefixOf!0 (_1!1932 lt!57854) thiss!1379))))

(declare-fun b!38147 () Bool)

(declare-fun e!25081 () Unit!2745)

(declare-fun Unit!2769 () Unit!2745)

(assert (=> b!38147 (= e!25081 Unit!2769)))

(declare-fun b!38148 () Bool)

(declare-fun lt!57859 () (_ BitVec 64))

(declare-fun lt!57857 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1504 (_ BitVec 64)) BitStream!1504)

(assert (=> b!38148 (= e!25082 (= (_1!1932 lt!57854) (withMovedBitIndex!0 (_2!1932 lt!57854) (bvsub lt!57857 lt!57859))))))

(assert (=> b!38148 (or (= (bvand lt!57857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!57859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!57857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!57857 lt!57859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38148 (= lt!57859 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(assert (=> b!38148 (= lt!57857 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(declare-fun d!11372 () Bool)

(assert (=> d!11372 e!25082))

(declare-fun res!32422 () Bool)

(assert (=> d!11372 (=> (not res!32422) (not e!25082))))

(assert (=> d!11372 (= res!32422 (isPrefixOf!0 (_1!1932 lt!57854) (_2!1932 lt!57854)))))

(declare-fun lt!57850 () BitStream!1504)

(assert (=> d!11372 (= lt!57854 (tuple2!3691 lt!57850 (_2!1931 lt!57528)))))

(declare-fun lt!57864 () Unit!2745)

(declare-fun lt!57856 () Unit!2745)

(assert (=> d!11372 (= lt!57864 lt!57856)))

(assert (=> d!11372 (isPrefixOf!0 lt!57850 (_2!1931 lt!57528))))

(assert (=> d!11372 (= lt!57856 (lemmaIsPrefixTransitive!0 lt!57850 (_2!1931 lt!57528) (_2!1931 lt!57528)))))

(declare-fun lt!57865 () Unit!2745)

(declare-fun lt!57862 () Unit!2745)

(assert (=> d!11372 (= lt!57865 lt!57862)))

(assert (=> d!11372 (isPrefixOf!0 lt!57850 (_2!1931 lt!57528))))

(assert (=> d!11372 (= lt!57862 (lemmaIsPrefixTransitive!0 lt!57850 thiss!1379 (_2!1931 lt!57528)))))

(declare-fun lt!57852 () Unit!2745)

(assert (=> d!11372 (= lt!57852 e!25081)))

(declare-fun c!2625 () Bool)

(assert (=> d!11372 (= c!2625 (not (= (size!874 (buf!1202 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!57868 () Unit!2745)

(declare-fun lt!57851 () Unit!2745)

(assert (=> d!11372 (= lt!57868 lt!57851)))

(assert (=> d!11372 (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!57528))))

(assert (=> d!11372 (= lt!57851 (lemmaIsPrefixRefl!0 (_2!1931 lt!57528)))))

(declare-fun lt!57866 () Unit!2745)

(declare-fun lt!57861 () Unit!2745)

(assert (=> d!11372 (= lt!57866 lt!57861)))

(assert (=> d!11372 (= lt!57861 (lemmaIsPrefixRefl!0 (_2!1931 lt!57528)))))

(declare-fun lt!57860 () Unit!2745)

(declare-fun lt!57858 () Unit!2745)

(assert (=> d!11372 (= lt!57860 lt!57858)))

(assert (=> d!11372 (isPrefixOf!0 lt!57850 lt!57850)))

(assert (=> d!11372 (= lt!57858 (lemmaIsPrefixRefl!0 lt!57850))))

(declare-fun lt!57867 () Unit!2745)

(declare-fun lt!57855 () Unit!2745)

(assert (=> d!11372 (= lt!57867 lt!57855)))

(assert (=> d!11372 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11372 (= lt!57855 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11372 (= lt!57850 (BitStream!1505 (buf!1202 (_2!1931 lt!57528)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(assert (=> d!11372 (isPrefixOf!0 thiss!1379 (_2!1931 lt!57528))))

(assert (=> d!11372 (= (reader!0 thiss!1379 (_2!1931 lt!57528)) lt!57854)))

(declare-fun b!38149 () Bool)

(declare-fun lt!57863 () Unit!2745)

(assert (=> b!38149 (= e!25081 lt!57863)))

(declare-fun lt!57849 () (_ BitVec 64))

(assert (=> b!38149 (= lt!57849 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!57853 () (_ BitVec 64))

(assert (=> b!38149 (= lt!57853 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1946 array!1946 (_ BitVec 64) (_ BitVec 64)) Unit!2745)

(assert (=> b!38149 (= lt!57863 (arrayBitRangesEqSymmetric!0 (buf!1202 thiss!1379) (buf!1202 (_2!1931 lt!57528)) lt!57849 lt!57853))))

(assert (=> b!38149 (arrayBitRangesEq!0 (buf!1202 (_2!1931 lt!57528)) (buf!1202 thiss!1379) lt!57849 lt!57853)))

(declare-fun b!38150 () Bool)

(declare-fun res!32424 () Bool)

(assert (=> b!38150 (=> (not res!32424) (not e!25082))))

(assert (=> b!38150 (= res!32424 (isPrefixOf!0 (_2!1932 lt!57854) (_2!1931 lt!57528)))))

(assert (= (and d!11372 c!2625) b!38149))

(assert (= (and d!11372 (not c!2625)) b!38147))

(assert (= (and d!11372 res!32422) b!38146))

(assert (= (and b!38146 res!32423) b!38150))

(assert (= (and b!38150 res!32424) b!38148))

(declare-fun m!57983 () Bool)

(assert (=> d!11372 m!57983))

(declare-fun m!57985 () Bool)

(assert (=> d!11372 m!57985))

(declare-fun m!57987 () Bool)

(assert (=> d!11372 m!57987))

(declare-fun m!57989 () Bool)

(assert (=> d!11372 m!57989))

(assert (=> d!11372 m!57685))

(declare-fun m!57991 () Bool)

(assert (=> d!11372 m!57991))

(declare-fun m!57993 () Bool)

(assert (=> d!11372 m!57993))

(declare-fun m!57995 () Bool)

(assert (=> d!11372 m!57995))

(assert (=> d!11372 m!57591))

(assert (=> d!11372 m!57593))

(declare-fun m!57997 () Bool)

(assert (=> d!11372 m!57997))

(declare-fun m!57999 () Bool)

(assert (=> b!38148 m!57999))

(assert (=> b!38148 m!57607))

(assert (=> b!38148 m!57595))

(declare-fun m!58001 () Bool)

(assert (=> b!38150 m!58001))

(declare-fun m!58003 () Bool)

(assert (=> b!38146 m!58003))

(assert (=> b!38149 m!57595))

(declare-fun m!58005 () Bool)

(assert (=> b!38149 m!58005))

(declare-fun m!58007 () Bool)

(assert (=> b!38149 m!58007))

(assert (=> b!37916 d!11372))

(declare-fun d!11374 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11374 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3029 () Bool)

(assert (= bs!3029 d!11374))

(declare-fun m!58009 () Bool)

(assert (=> bs!3029 m!58009))

(assert (=> b!37916 d!11374))

(declare-fun b!38313 () Bool)

(declare-fun res!32537 () Bool)

(declare-fun e!25162 () Bool)

(assert (=> b!38313 (=> (not res!32537) (not e!25162))))

(declare-fun lt!58423 () tuple2!3688)

(assert (=> b!38313 (= res!32537 (= (size!874 (buf!1202 (_2!1931 lt!58423))) (size!874 (buf!1202 (_2!1931 lt!57528)))))))

(declare-fun lt!58442 () tuple2!3690)

(declare-fun b!38314 () Bool)

(assert (=> b!38314 (= e!25162 (= (bitStreamReadBitsIntoList!0 (_2!1931 lt!58423) (_1!1932 lt!58442) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1931 lt!58423) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!38314 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38314 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!58431 () Unit!2745)

(declare-fun lt!58430 () Unit!2745)

(assert (=> b!38314 (= lt!58431 lt!58430)))

(declare-fun lt!58433 () (_ BitVec 64))

(assert (=> b!38314 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!58423)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!58433)))

(assert (=> b!38314 (= lt!58430 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1931 lt!57528) (buf!1202 (_2!1931 lt!58423)) lt!58433))))

(declare-fun e!25160 () Bool)

(assert (=> b!38314 e!25160))

(declare-fun res!32536 () Bool)

(assert (=> b!38314 (=> (not res!32536) (not e!25160))))

(assert (=> b!38314 (= res!32536 (and (= (size!874 (buf!1202 (_2!1931 lt!57528))) (size!874 (buf!1202 (_2!1931 lt!58423)))) (bvsge lt!58433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38314 (= lt!58433 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!38314 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38314 (= lt!58442 (reader!0 (_2!1931 lt!57528) (_2!1931 lt!58423)))))

(declare-fun b!38315 () Bool)

(declare-fun e!25161 () tuple2!3688)

(declare-fun Unit!2770 () Unit!2745)

(assert (=> b!38315 (= e!25161 (tuple2!3689 Unit!2770 (_2!1931 lt!57528)))))

(assert (=> b!38315 (= (size!874 (buf!1202 (_2!1931 lt!57528))) (size!874 (buf!1202 (_2!1931 lt!57528))))))

(declare-fun lt!58453 () Unit!2745)

(declare-fun Unit!2771 () Unit!2745)

(assert (=> b!38315 (= lt!58453 Unit!2771)))

(declare-fun call!481 () tuple2!3690)

(declare-fun checkByteArrayBitContent!0 (BitStream!1504 array!1946 array!1946 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3714 0))(
  ( (tuple2!3715 (_1!1944 array!1946) (_2!1944 BitStream!1504)) )
))
(declare-fun readBits!0 (BitStream!1504 (_ BitVec 64)) tuple2!3714)

(assert (=> b!38315 (checkByteArrayBitContent!0 (_2!1931 lt!57528) srcBuffer!2 (_1!1944 (readBits!0 (_1!1932 call!481) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!11376 () Bool)

(assert (=> d!11376 e!25162))

(declare-fun res!32538 () Bool)

(assert (=> d!11376 (=> (not res!32538) (not e!25162))))

(declare-fun lt!58421 () (_ BitVec 64))

(assert (=> d!11376 (= res!32538 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58423))) (currentByte!2608 (_2!1931 lt!58423)) (currentBit!2603 (_2!1931 lt!58423))) (bvsub lt!58421 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11376 (or (= (bvand lt!58421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58421 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!58454 () (_ BitVec 64))

(assert (=> d!11376 (= lt!58421 (bvadd lt!58454 to!314))))

(assert (=> d!11376 (or (not (= (bvand lt!58454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!58454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!58454 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11376 (= lt!58454 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(assert (=> d!11376 (= lt!58423 e!25161)))

(declare-fun c!2653 () Bool)

(assert (=> d!11376 (= c!2653 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!58446 () Unit!2745)

(declare-fun lt!58460 () Unit!2745)

(assert (=> d!11376 (= lt!58446 lt!58460)))

(assert (=> d!11376 (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!57528))))

(assert (=> d!11376 (= lt!58460 (lemmaIsPrefixRefl!0 (_2!1931 lt!57528)))))

(declare-fun lt!58427 () (_ BitVec 64))

(assert (=> d!11376 (= lt!58427 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(assert (=> d!11376 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11376 (= (appendBitsMSBFirstLoop!0 (_2!1931 lt!57528) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!58423)))

(declare-fun b!38316 () Bool)

(assert (=> b!38316 (= e!25160 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!58433))))

(declare-fun b!38317 () Bool)

(declare-fun lt!58439 () tuple2!3688)

(declare-fun Unit!2772 () Unit!2745)

(assert (=> b!38317 (= e!25161 (tuple2!3689 Unit!2772 (_2!1931 lt!58439)))))

(declare-fun lt!58420 () tuple2!3688)

(assert (=> b!38317 (= lt!58420 (appendBitFromByte!0 (_2!1931 lt!57528) (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!58457 () (_ BitVec 64))

(assert (=> b!38317 (= lt!58457 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58444 () (_ BitVec 64))

(assert (=> b!38317 (= lt!58444 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58419 () Unit!2745)

(assert (=> b!38317 (= lt!58419 (validateOffsetBitsIneqLemma!0 (_2!1931 lt!57528) (_2!1931 lt!58420) lt!58457 lt!58444))))

(assert (=> b!38317 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!58420)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!58420))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!58420))) (bvsub lt!58457 lt!58444))))

(declare-fun lt!58459 () Unit!2745)

(assert (=> b!38317 (= lt!58459 lt!58419)))

(declare-fun lt!58447 () tuple2!3690)

(assert (=> b!38317 (= lt!58447 (reader!0 (_2!1931 lt!57528) (_2!1931 lt!58420)))))

(declare-fun lt!58445 () (_ BitVec 64))

(assert (=> b!38317 (= lt!58445 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58435 () Unit!2745)

(assert (=> b!38317 (= lt!58435 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1931 lt!57528) (buf!1202 (_2!1931 lt!58420)) lt!58445))))

(assert (=> b!38317 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!58420)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!58445)))

(declare-fun lt!58425 () Unit!2745)

(assert (=> b!38317 (= lt!58425 lt!58435)))

(assert (=> b!38317 (= (head!290 (byteArrayBitContentToList!0 (_2!1931 lt!58420) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!290 (bitStreamReadBitsIntoList!0 (_2!1931 lt!58420) (_1!1932 lt!58447) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!58461 () Unit!2745)

(declare-fun Unit!2773 () Unit!2745)

(assert (=> b!38317 (= lt!58461 Unit!2773)))

(assert (=> b!38317 (= lt!58439 (appendBitsMSBFirstLoop!0 (_2!1931 lt!58420) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!58452 () Unit!2745)

(assert (=> b!38317 (= lt!58452 (lemmaIsPrefixTransitive!0 (_2!1931 lt!57528) (_2!1931 lt!58420) (_2!1931 lt!58439)))))

(assert (=> b!38317 (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!58439))))

(declare-fun lt!58449 () Unit!2745)

(assert (=> b!38317 (= lt!58449 lt!58452)))

(assert (=> b!38317 (= (size!874 (buf!1202 (_2!1931 lt!58439))) (size!874 (buf!1202 (_2!1931 lt!57528))))))

(declare-fun lt!58443 () Unit!2745)

(declare-fun Unit!2774 () Unit!2745)

(assert (=> b!38317 (= lt!58443 Unit!2774)))

(assert (=> b!38317 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58439))) (currentByte!2608 (_2!1931 lt!58439)) (currentBit!2603 (_2!1931 lt!58439))) (bvsub (bvadd (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58456 () Unit!2745)

(declare-fun Unit!2775 () Unit!2745)

(assert (=> b!38317 (= lt!58456 Unit!2775)))

(assert (=> b!38317 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58439))) (currentByte!2608 (_2!1931 lt!58439)) (currentBit!2603 (_2!1931 lt!58439))) (bvsub (bvsub (bvadd (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58420))) (currentByte!2608 (_2!1931 lt!58420)) (currentBit!2603 (_2!1931 lt!58420))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58428 () Unit!2745)

(declare-fun Unit!2776 () Unit!2745)

(assert (=> b!38317 (= lt!58428 Unit!2776)))

(declare-fun lt!58429 () tuple2!3690)

(assert (=> b!38317 (= lt!58429 call!481)))

(declare-fun lt!58438 () (_ BitVec 64))

(assert (=> b!38317 (= lt!58438 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58437 () Unit!2745)

(assert (=> b!38317 (= lt!58437 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1931 lt!57528) (buf!1202 (_2!1931 lt!58439)) lt!58438))))

(assert (=> b!38317 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!58439)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!58438)))

(declare-fun lt!58436 () Unit!2745)

(assert (=> b!38317 (= lt!58436 lt!58437)))

(declare-fun lt!58450 () tuple2!3690)

(assert (=> b!38317 (= lt!58450 (reader!0 (_2!1931 lt!58420) (_2!1931 lt!58439)))))

(declare-fun lt!58434 () (_ BitVec 64))

(assert (=> b!38317 (= lt!58434 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58455 () Unit!2745)

(assert (=> b!38317 (= lt!58455 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1931 lt!58420) (buf!1202 (_2!1931 lt!58439)) lt!58434))))

(assert (=> b!38317 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!58439)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!58420))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!58420))) lt!58434)))

(declare-fun lt!58451 () Unit!2745)

(assert (=> b!38317 (= lt!58451 lt!58455)))

(declare-fun lt!58462 () List!453)

(assert (=> b!38317 (= lt!58462 (byteArrayBitContentToList!0 (_2!1931 lt!58439) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!58448 () List!453)

(assert (=> b!38317 (= lt!58448 (byteArrayBitContentToList!0 (_2!1931 lt!58439) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!58440 () List!453)

(assert (=> b!38317 (= lt!58440 (bitStreamReadBitsIntoList!0 (_2!1931 lt!58439) (_1!1932 lt!58429) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!58441 () List!453)

(assert (=> b!38317 (= lt!58441 (bitStreamReadBitsIntoList!0 (_2!1931 lt!58439) (_1!1932 lt!58450) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!58458 () (_ BitVec 64))

(assert (=> b!38317 (= lt!58458 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58422 () Unit!2745)

(assert (=> b!38317 (= lt!58422 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1931 lt!58439) (_2!1931 lt!58439) (_1!1932 lt!58429) (_1!1932 lt!58450) lt!58458 lt!58440))))

(assert (=> b!38317 (= (bitStreamReadBitsIntoList!0 (_2!1931 lt!58439) (_1!1932 lt!58450) (bvsub lt!58458 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!170 lt!58440))))

(declare-fun lt!58432 () Unit!2745)

(assert (=> b!38317 (= lt!58432 lt!58422)))

(declare-fun lt!58426 () Unit!2745)

(assert (=> b!38317 (= lt!58426 (arrayBitRangesEqImpliesEq!0 (buf!1202 (_2!1931 lt!58420)) (buf!1202 (_2!1931 lt!58439)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!58427 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58420))) (currentByte!2608 (_2!1931 lt!58420)) (currentBit!2603 (_2!1931 lt!58420)))))))

(assert (=> b!38317 (= (bitAt!0 (buf!1202 (_2!1931 lt!58420)) lt!58427) (bitAt!0 (buf!1202 (_2!1931 lt!58439)) lt!58427))))

(declare-fun lt!58424 () Unit!2745)

(assert (=> b!38317 (= lt!58424 lt!58426)))

(declare-fun bm!478 () Bool)

(assert (=> bm!478 (= call!481 (reader!0 (_2!1931 lt!57528) (ite c!2653 (_2!1931 lt!58439) (_2!1931 lt!57528))))))

(declare-fun b!38318 () Bool)

(declare-fun res!32534 () Bool)

(assert (=> b!38318 (=> (not res!32534) (not e!25162))))

(assert (=> b!38318 (= res!32534 (invariant!0 (currentBit!2603 (_2!1931 lt!58423)) (currentByte!2608 (_2!1931 lt!58423)) (size!874 (buf!1202 (_2!1931 lt!58423)))))))

(declare-fun b!38319 () Bool)

(declare-fun res!32533 () Bool)

(assert (=> b!38319 (=> (not res!32533) (not e!25162))))

(assert (=> b!38319 (= res!32533 (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!58423)))))

(declare-fun b!38320 () Bool)

(declare-fun res!32535 () Bool)

(assert (=> b!38320 (=> (not res!32535) (not e!25162))))

(assert (=> b!38320 (= res!32535 (= (size!874 (buf!1202 (_2!1931 lt!57528))) (size!874 (buf!1202 (_2!1931 lt!58423)))))))

(assert (= (and d!11376 c!2653) b!38317))

(assert (= (and d!11376 (not c!2653)) b!38315))

(assert (= (or b!38317 b!38315) bm!478))

(assert (= (and d!11376 res!32538) b!38318))

(assert (= (and b!38318 res!32534) b!38320))

(assert (= (and b!38320 res!32535) b!38319))

(assert (= (and b!38319 res!32533) b!38313))

(assert (= (and b!38313 res!32537) b!38314))

(assert (= (and b!38314 res!32536) b!38316))

(declare-fun m!58345 () Bool)

(assert (=> d!11376 m!58345))

(assert (=> d!11376 m!57607))

(assert (=> d!11376 m!57985))

(assert (=> d!11376 m!57987))

(declare-fun m!58347 () Bool)

(assert (=> bm!478 m!58347))

(declare-fun m!58349 () Bool)

(assert (=> b!38317 m!58349))

(declare-fun m!58351 () Bool)

(assert (=> b!38317 m!58351))

(declare-fun m!58353 () Bool)

(assert (=> b!38317 m!58353))

(declare-fun m!58355 () Bool)

(assert (=> b!38317 m!58355))

(declare-fun m!58357 () Bool)

(assert (=> b!38317 m!58357))

(declare-fun m!58359 () Bool)

(assert (=> b!38317 m!58359))

(declare-fun m!58361 () Bool)

(assert (=> b!38317 m!58361))

(declare-fun m!58363 () Bool)

(assert (=> b!38317 m!58363))

(declare-fun m!58365 () Bool)

(assert (=> b!38317 m!58365))

(declare-fun m!58367 () Bool)

(assert (=> b!38317 m!58367))

(declare-fun m!58369 () Bool)

(assert (=> b!38317 m!58369))

(declare-fun m!58371 () Bool)

(assert (=> b!38317 m!58371))

(declare-fun m!58373 () Bool)

(assert (=> b!38317 m!58373))

(declare-fun m!58375 () Bool)

(assert (=> b!38317 m!58375))

(declare-fun m!58377 () Bool)

(assert (=> b!38317 m!58377))

(declare-fun m!58379 () Bool)

(assert (=> b!38317 m!58379))

(declare-fun m!58381 () Bool)

(assert (=> b!38317 m!58381))

(assert (=> b!38317 m!58381))

(declare-fun m!58383 () Bool)

(assert (=> b!38317 m!58383))

(declare-fun m!58385 () Bool)

(assert (=> b!38317 m!58385))

(declare-fun m!58387 () Bool)

(assert (=> b!38317 m!58387))

(declare-fun m!58389 () Bool)

(assert (=> b!38317 m!58389))

(declare-fun m!58391 () Bool)

(assert (=> b!38317 m!58391))

(declare-fun m!58393 () Bool)

(assert (=> b!38317 m!58393))

(declare-fun m!58395 () Bool)

(assert (=> b!38317 m!58395))

(assert (=> b!38317 m!58387))

(declare-fun m!58397 () Bool)

(assert (=> b!38317 m!58397))

(declare-fun m!58399 () Bool)

(assert (=> b!38317 m!58399))

(assert (=> b!38317 m!58363))

(declare-fun m!58401 () Bool)

(assert (=> b!38317 m!58401))

(declare-fun m!58403 () Bool)

(assert (=> b!38317 m!58403))

(declare-fun m!58405 () Bool)

(assert (=> b!38317 m!58405))

(declare-fun m!58407 () Bool)

(assert (=> b!38317 m!58407))

(assert (=> b!38317 m!58359))

(assert (=> b!38317 m!57607))

(declare-fun m!58409 () Bool)

(assert (=> b!38317 m!58409))

(declare-fun m!58411 () Bool)

(assert (=> b!38319 m!58411))

(declare-fun m!58413 () Bool)

(assert (=> b!38315 m!58413))

(declare-fun m!58415 () Bool)

(assert (=> b!38315 m!58415))

(declare-fun m!58417 () Bool)

(assert (=> b!38318 m!58417))

(declare-fun m!58419 () Bool)

(assert (=> b!38314 m!58419))

(declare-fun m!58421 () Bool)

(assert (=> b!38314 m!58421))

(declare-fun m!58423 () Bool)

(assert (=> b!38314 m!58423))

(declare-fun m!58425 () Bool)

(assert (=> b!38314 m!58425))

(declare-fun m!58427 () Bool)

(assert (=> b!38314 m!58427))

(declare-fun m!58429 () Bool)

(assert (=> b!38316 m!58429))

(assert (=> b!37916 d!11376))

(declare-fun d!11486 () Bool)

(assert (=> d!11486 (isPrefixOf!0 thiss!1379 (_2!1931 lt!57529))))

(declare-fun lt!58465 () Unit!2745)

(declare-fun choose!30 (BitStream!1504 BitStream!1504 BitStream!1504) Unit!2745)

(assert (=> d!11486 (= lt!58465 (choose!30 thiss!1379 (_2!1931 lt!57528) (_2!1931 lt!57529)))))

(assert (=> d!11486 (isPrefixOf!0 thiss!1379 (_2!1931 lt!57528))))

(assert (=> d!11486 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1931 lt!57528) (_2!1931 lt!57529)) lt!58465)))

(declare-fun bs!3053 () Bool)

(assert (= bs!3053 d!11486))

(assert (=> bs!3053 m!57657))

(declare-fun m!58431 () Bool)

(assert (=> bs!3053 m!58431))

(assert (=> bs!3053 m!57685))

(assert (=> b!37916 d!11486))

(declare-fun d!11488 () Bool)

(declare-fun res!32539 () Bool)

(declare-fun e!25164 () Bool)

(assert (=> d!11488 (=> (not res!32539) (not e!25164))))

(assert (=> d!11488 (= res!32539 (= (size!874 (buf!1202 (_2!1931 lt!57528))) (size!874 (buf!1202 (_2!1931 lt!57529)))))))

(assert (=> d!11488 (= (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!57529)) e!25164)))

(declare-fun b!38321 () Bool)

(declare-fun res!32540 () Bool)

(assert (=> b!38321 (=> (not res!32540) (not e!25164))))

(assert (=> b!38321 (= res!32540 (bvsle (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))) (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57529))) (currentByte!2608 (_2!1931 lt!57529)) (currentBit!2603 (_2!1931 lt!57529)))))))

(declare-fun b!38322 () Bool)

(declare-fun e!25163 () Bool)

(assert (=> b!38322 (= e!25164 e!25163)))

(declare-fun res!32541 () Bool)

(assert (=> b!38322 (=> res!32541 e!25163)))

(assert (=> b!38322 (= res!32541 (= (size!874 (buf!1202 (_2!1931 lt!57528))) #b00000000000000000000000000000000))))

(declare-fun b!38323 () Bool)

(assert (=> b!38323 (= e!25163 (arrayBitRangesEq!0 (buf!1202 (_2!1931 lt!57528)) (buf!1202 (_2!1931 lt!57529)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528)))))))

(assert (= (and d!11488 res!32539) b!38321))

(assert (= (and b!38321 res!32540) b!38322))

(assert (= (and b!38322 (not res!32541)) b!38323))

(assert (=> b!38321 m!57607))

(assert (=> b!38321 m!57653))

(assert (=> b!38323 m!57607))

(assert (=> b!38323 m!57607))

(declare-fun m!58433 () Bool)

(assert (=> b!38323 m!58433))

(assert (=> b!37916 d!11488))

(declare-fun d!11490 () Bool)

(assert (=> d!11490 (= (tail!170 lt!57532) (t!1203 lt!57532))))

(assert (=> b!37915 d!11490))

(declare-fun d!11492 () Bool)

(declare-fun e!25167 () Bool)

(assert (=> d!11492 e!25167))

(declare-fun res!32544 () Bool)

(assert (=> d!11492 (=> (not res!32544) (not e!25167))))

(declare-fun lt!58471 () (_ BitVec 64))

(assert (=> d!11492 (= res!32544 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!58471) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11492 (= lt!58471 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58470 () Unit!2745)

(declare-fun choose!42 (BitStream!1504 BitStream!1504 BitStream!1504 BitStream!1504 (_ BitVec 64) List!453) Unit!2745)

(assert (=> d!11492 (= lt!58470 (choose!42 (_2!1931 lt!57529) (_2!1931 lt!57529) (_1!1932 lt!57533) (_1!1932 lt!57531) (bvsub to!314 i!635) lt!57532))))

(assert (=> d!11492 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11492 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1931 lt!57529) (_2!1931 lt!57529) (_1!1932 lt!57533) (_1!1932 lt!57531) (bvsub to!314 i!635) lt!57532) lt!58470)))

(declare-fun b!38326 () Bool)

(assert (=> b!38326 (= e!25167 (= (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_1!1932 lt!57531) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!170 lt!57532)))))

(assert (= (and d!11492 res!32544) b!38326))

(declare-fun m!58435 () Bool)

(assert (=> d!11492 m!58435))

(declare-fun m!58437 () Bool)

(assert (=> b!38326 m!58437))

(assert (=> b!38326 m!57623))

(assert (=> b!37915 d!11492))

(declare-fun d!11494 () Bool)

(assert (=> d!11494 (= (head!290 (byteArrayBitContentToList!0 (_2!1931 lt!57528) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!568 (byteArrayBitContentToList!0 (_2!1931 lt!57528) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37926 d!11494))

(declare-fun d!11496 () Bool)

(declare-fun c!2656 () Bool)

(assert (=> d!11496 (= c!2656 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25170 () List!453)

(assert (=> d!11496 (= (byteArrayBitContentToList!0 (_2!1931 lt!57528) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!25170)))

(declare-fun b!38331 () Bool)

(assert (=> b!38331 (= e!25170 Nil!450)))

(declare-fun b!38332 () Bool)

(assert (=> b!38332 (= e!25170 (Cons!449 (not (= (bvand ((_ sign_extend 24) (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1931 lt!57528) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11496 c!2656) b!38331))

(assert (= (and d!11496 (not c!2656)) b!38332))

(assert (=> b!38332 m!57681))

(declare-fun m!58439 () Bool)

(assert (=> b!38332 m!58439))

(declare-fun m!58441 () Bool)

(assert (=> b!38332 m!58441))

(assert (=> b!37926 d!11496))

(declare-fun d!11498 () Bool)

(assert (=> d!11498 (= (head!290 (bitStreamReadBitsIntoList!0 (_2!1931 lt!57528) (_1!1932 lt!57516) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!568 (bitStreamReadBitsIntoList!0 (_2!1931 lt!57528) (_1!1932 lt!57516) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37926 d!11498))

(declare-fun b!38341 () Bool)

(declare-datatypes ((tuple2!3718 0))(
  ( (tuple2!3719 (_1!1946 List!453) (_2!1946 BitStream!1504)) )
))
(declare-fun e!25175 () tuple2!3718)

(assert (=> b!38341 (= e!25175 (tuple2!3719 Nil!450 (_1!1932 lt!57516)))))

(declare-fun lt!58478 () (_ BitVec 64))

(declare-fun b!38342 () Bool)

(declare-datatypes ((tuple2!3720 0))(
  ( (tuple2!3721 (_1!1947 Bool) (_2!1947 BitStream!1504)) )
))
(declare-fun lt!58480 () tuple2!3720)

(assert (=> b!38342 (= e!25175 (tuple2!3719 (Cons!449 (_1!1947 lt!58480) (bitStreamReadBitsIntoList!0 (_2!1931 lt!57528) (_2!1947 lt!58480) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!58478))) (_2!1947 lt!58480)))))

(declare-fun readBit!0 (BitStream!1504) tuple2!3720)

(assert (=> b!38342 (= lt!58480 (readBit!0 (_1!1932 lt!57516)))))

(assert (=> b!38342 (= lt!58478 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!38344 () Bool)

(declare-fun e!25176 () Bool)

(declare-fun lt!58479 () List!453)

(assert (=> b!38344 (= e!25176 (> (length!179 lt!58479) 0))))

(declare-fun d!11500 () Bool)

(assert (=> d!11500 e!25176))

(declare-fun c!2661 () Bool)

(assert (=> d!11500 (= c!2661 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11500 (= lt!58479 (_1!1946 e!25175))))

(declare-fun c!2662 () Bool)

(assert (=> d!11500 (= c!2662 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11500 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11500 (= (bitStreamReadBitsIntoList!0 (_2!1931 lt!57528) (_1!1932 lt!57516) #b0000000000000000000000000000000000000000000000000000000000000001) lt!58479)))

(declare-fun b!38343 () Bool)

(declare-fun isEmpty!109 (List!453) Bool)

(assert (=> b!38343 (= e!25176 (isEmpty!109 lt!58479))))

(assert (= (and d!11500 c!2662) b!38341))

(assert (= (and d!11500 (not c!2662)) b!38342))

(assert (= (and d!11500 c!2661) b!38343))

(assert (= (and d!11500 (not c!2661)) b!38344))

(declare-fun m!58443 () Bool)

(assert (=> b!38342 m!58443))

(declare-fun m!58445 () Bool)

(assert (=> b!38342 m!58445))

(declare-fun m!58447 () Bool)

(assert (=> b!38344 m!58447))

(declare-fun m!58449 () Bool)

(assert (=> b!38343 m!58449))

(assert (=> b!37926 d!11500))

(declare-fun d!11502 () Bool)

(declare-fun lt!58483 () tuple2!3720)

(assert (=> d!11502 (= lt!58483 (readBit!0 (_1!1932 lt!57533)))))

(assert (=> d!11502 (= (readBitPure!0 (_1!1932 lt!57533)) (tuple2!3693 (_2!1947 lt!58483) (_1!1947 lt!58483)))))

(declare-fun bs!3054 () Bool)

(assert (= bs!3054 d!11502))

(declare-fun m!58451 () Bool)

(assert (=> bs!3054 m!58451))

(assert (=> b!37925 d!11502))

(declare-fun d!11504 () Bool)

(assert (=> d!11504 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3055 () Bool)

(assert (= bs!3055 d!11504))

(assert (=> bs!3055 m!57681))

(assert (=> bs!3055 m!58439))

(assert (=> b!37914 d!11504))

(declare-fun d!11506 () Bool)

(assert (=> d!11506 (= (head!290 (byteArrayBitContentToList!0 (_2!1931 lt!57529) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!568 (byteArrayBitContentToList!0 (_2!1931 lt!57529) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!37914 d!11506))

(declare-fun d!11508 () Bool)

(declare-fun c!2663 () Bool)

(assert (=> d!11508 (= c!2663 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25177 () List!453)

(assert (=> d!11508 (= (byteArrayBitContentToList!0 (_2!1931 lt!57529) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!25177)))

(declare-fun b!38345 () Bool)

(assert (=> b!38345 (= e!25177 Nil!450)))

(declare-fun b!38346 () Bool)

(assert (=> b!38346 (= e!25177 (Cons!449 (not (= (bvand ((_ sign_extend 24) (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1931 lt!57529) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11508 c!2663) b!38345))

(assert (= (and d!11508 (not c!2663)) b!38346))

(assert (=> b!38346 m!57681))

(assert (=> b!38346 m!58439))

(declare-fun m!58453 () Bool)

(assert (=> b!38346 m!58453))

(assert (=> b!37914 d!11508))

(declare-fun d!11510 () Bool)

(declare-fun size!878 (List!453) Int)

(assert (=> d!11510 (= (length!179 lt!57532) (size!878 lt!57532))))

(declare-fun bs!3056 () Bool)

(assert (= bs!3056 d!11510))

(declare-fun m!58455 () Bool)

(assert (=> bs!3056 m!58455))

(assert (=> b!37913 d!11510))

(declare-fun d!11512 () Bool)

(assert (=> d!11512 (= (invariant!0 (currentBit!2603 thiss!1379) (currentByte!2608 thiss!1379) (size!874 (buf!1202 thiss!1379))) (and (bvsge (currentBit!2603 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2603 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2608 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2608 thiss!1379) (size!874 (buf!1202 thiss!1379))) (and (= (currentBit!2603 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2608 thiss!1379) (size!874 (buf!1202 thiss!1379)))))))))

(assert (=> b!37924 d!11512))

(declare-fun d!11514 () Bool)

(assert (=> d!11514 (= (invariant!0 (currentBit!2603 (_2!1931 lt!57528)) (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57529)))) (and (bvsge (currentBit!2603 (_2!1931 lt!57528)) #b00000000000000000000000000000000) (bvslt (currentBit!2603 (_2!1931 lt!57528)) #b00000000000000000000000000001000) (bvsge (currentByte!2608 (_2!1931 lt!57528)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57529)))) (and (= (currentBit!2603 (_2!1931 lt!57528)) #b00000000000000000000000000000000) (= (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57529))))))))))

(assert (=> b!37923 d!11514))

(declare-fun d!11516 () Bool)

(declare-fun e!25192 () Bool)

(assert (=> d!11516 e!25192))

(declare-fun res!32574 () Bool)

(assert (=> d!11516 (=> (not res!32574) (not e!25192))))

(declare-fun lt!58535 () (_ BitVec 64))

(declare-fun lt!58534 () (_ BitVec 64))

(declare-fun lt!58536 () (_ BitVec 64))

(assert (=> d!11516 (= res!32574 (= lt!58536 (bvsub lt!58534 lt!58535)))))

(assert (=> d!11516 (or (= (bvand lt!58534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58535 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58534 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58534 lt!58535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11516 (= lt!58535 (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57529))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57529)))))))

(declare-fun lt!58537 () (_ BitVec 64))

(declare-fun lt!58532 () (_ BitVec 64))

(assert (=> d!11516 (= lt!58534 (bvmul lt!58537 lt!58532))))

(assert (=> d!11516 (or (= lt!58537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58532 (bvsdiv (bvmul lt!58537 lt!58532) lt!58537)))))

(assert (=> d!11516 (= lt!58532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11516 (= lt!58537 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))))))

(assert (=> d!11516 (= lt!58536 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57529)))))))

(assert (=> d!11516 (invariant!0 (currentBit!2603 (_2!1931 lt!57529)) (currentByte!2608 (_2!1931 lt!57529)) (size!874 (buf!1202 (_2!1931 lt!57529))))))

(assert (=> d!11516 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57529))) (currentByte!2608 (_2!1931 lt!57529)) (currentBit!2603 (_2!1931 lt!57529))) lt!58536)))

(declare-fun b!38376 () Bool)

(declare-fun res!32573 () Bool)

(assert (=> b!38376 (=> (not res!32573) (not e!25192))))

(assert (=> b!38376 (= res!32573 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58536))))

(declare-fun b!38377 () Bool)

(declare-fun lt!58533 () (_ BitVec 64))

(assert (=> b!38377 (= e!25192 (bvsle lt!58536 (bvmul lt!58533 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38377 (or (= lt!58533 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58533 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58533)))))

(assert (=> b!38377 (= lt!58533 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))))))

(assert (= (and d!11516 res!32574) b!38376))

(assert (= (and b!38376 res!32573) b!38377))

(declare-fun m!58485 () Bool)

(assert (=> d!11516 m!58485))

(assert (=> d!11516 m!57597))

(assert (=> b!37912 d!11516))

(declare-fun d!11522 () Bool)

(declare-fun res!32575 () Bool)

(declare-fun e!25194 () Bool)

(assert (=> d!11522 (=> (not res!32575) (not e!25194))))

(assert (=> d!11522 (= res!32575 (= (size!874 (buf!1202 thiss!1379)) (size!874 (buf!1202 (_2!1931 lt!57528)))))))

(assert (=> d!11522 (= (isPrefixOf!0 thiss!1379 (_2!1931 lt!57528)) e!25194)))

(declare-fun b!38378 () Bool)

(declare-fun res!32576 () Bool)

(assert (=> b!38378 (=> (not res!32576) (not e!25194))))

(assert (=> b!38378 (= res!32576 (bvsle (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)) (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528)))))))

(declare-fun b!38379 () Bool)

(declare-fun e!25193 () Bool)

(assert (=> b!38379 (= e!25194 e!25193)))

(declare-fun res!32577 () Bool)

(assert (=> b!38379 (=> res!32577 e!25193)))

(assert (=> b!38379 (= res!32577 (= (size!874 (buf!1202 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38380 () Bool)

(assert (=> b!38380 (= e!25193 (arrayBitRangesEq!0 (buf!1202 thiss!1379) (buf!1202 (_2!1931 lt!57528)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379))))))

(assert (= (and d!11522 res!32575) b!38378))

(assert (= (and b!38378 res!32576) b!38379))

(assert (= (and b!38379 (not res!32577)) b!38380))

(assert (=> b!38378 m!57595))

(assert (=> b!38378 m!57607))

(assert (=> b!38380 m!57595))

(assert (=> b!38380 m!57595))

(declare-fun m!58487 () Bool)

(assert (=> b!38380 m!58487))

(assert (=> b!37911 d!11522))

(declare-fun d!11524 () Bool)

(assert (=> d!11524 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!57517) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528)))) lt!57517))))

(declare-fun bs!3057 () Bool)

(assert (= bs!3057 d!11524))

(declare-fun m!58489 () Bool)

(assert (=> bs!3057 m!58489))

(assert (=> b!37911 d!11524))

(declare-fun d!11526 () Bool)

(declare-fun e!25202 () Bool)

(assert (=> d!11526 e!25202))

(declare-fun res!32586 () Bool)

(assert (=> d!11526 (=> (not res!32586) (not e!25202))))

(assert (=> d!11526 (= res!32586 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!58567 () Unit!2745)

(declare-fun choose!27 (BitStream!1504 BitStream!1504 (_ BitVec 64) (_ BitVec 64)) Unit!2745)

(assert (=> d!11526 (= lt!58567 (choose!27 thiss!1379 (_2!1931 lt!57528) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11526 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11526 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1931 lt!57528) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!58567)))

(declare-fun b!38391 () Bool)

(assert (=> b!38391 (= e!25202 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11526 res!32586) b!38391))

(declare-fun m!58525 () Bool)

(assert (=> d!11526 m!58525))

(declare-fun m!58527 () Bool)

(assert (=> b!38391 m!58527))

(assert (=> b!37911 d!11526))

(declare-fun b!38444 () Bool)

(declare-fun e!25229 () Bool)

(declare-fun lt!58648 () tuple2!3692)

(declare-fun lt!58642 () tuple2!3688)

(assert (=> b!38444 (= e!25229 (= (bitIndex!0 (size!874 (buf!1202 (_1!1933 lt!58648))) (currentByte!2608 (_1!1933 lt!58648)) (currentBit!2603 (_1!1933 lt!58648))) (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58642))) (currentByte!2608 (_2!1931 lt!58642)) (currentBit!2603 (_2!1931 lt!58642)))))))

(declare-fun b!38445 () Bool)

(declare-fun res!32612 () Bool)

(declare-fun e!25228 () Bool)

(assert (=> b!38445 (=> (not res!32612) (not e!25228))))

(declare-fun lt!58639 () tuple2!3688)

(assert (=> b!38445 (= res!32612 (isPrefixOf!0 thiss!1379 (_2!1931 lt!58639)))))

(declare-fun b!38446 () Bool)

(declare-fun e!25231 () Bool)

(assert (=> b!38446 (= e!25228 e!25231)))

(declare-fun res!32609 () Bool)

(assert (=> b!38446 (=> (not res!32609) (not e!25231))))

(declare-fun lt!58638 () Bool)

(declare-fun lt!58644 () tuple2!3692)

(assert (=> b!38446 (= res!32609 (and (= (_2!1933 lt!58644) lt!58638) (= (_1!1933 lt!58644) (_2!1931 lt!58639))))))

(declare-fun readerFrom!0 (BitStream!1504 (_ BitVec 32) (_ BitVec 32)) BitStream!1504)

(assert (=> b!38446 (= lt!58644 (readBitPure!0 (readerFrom!0 (_2!1931 lt!58639) (currentBit!2603 thiss!1379) (currentByte!2608 thiss!1379))))))

(declare-fun b!38447 () Bool)

(declare-fun res!32613 () Bool)

(assert (=> b!38447 (=> (not res!32613) (not e!25228))))

(assert (=> b!38447 (= res!32613 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58639))) (currentByte!2608 (_2!1931 lt!58639)) (currentBit!2603 (_2!1931 lt!58639))) (bvadd (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!38448 () Bool)

(declare-fun e!25230 () Bool)

(assert (=> b!38448 (= e!25230 e!25229)))

(declare-fun res!32611 () Bool)

(assert (=> b!38448 (=> (not res!32611) (not e!25229))))

(declare-fun lt!58640 () (_ BitVec 8))

(assert (=> b!38448 (= res!32611 (and (= (_2!1933 lt!58648) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!58640)) #b00000000000000000000000000000000))) (= (_1!1933 lt!58648) (_2!1931 lt!58642))))))

(declare-fun lt!58643 () tuple2!3714)

(declare-fun lt!58641 () BitStream!1504)

(assert (=> b!38448 (= lt!58643 (readBits!0 lt!58641 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38448 (= lt!58648 (readBitPure!0 lt!58641))))

(assert (=> b!38448 (= lt!58641 (readerFrom!0 (_2!1931 lt!58642) (currentBit!2603 thiss!1379) (currentByte!2608 thiss!1379)))))

(declare-fun d!11536 () Bool)

(assert (=> d!11536 e!25230))

(declare-fun res!32615 () Bool)

(assert (=> d!11536 (=> (not res!32615) (not e!25230))))

(assert (=> d!11536 (= res!32615 (= (size!874 (buf!1202 (_2!1931 lt!58642))) (size!874 (buf!1202 thiss!1379))))))

(declare-fun lt!58646 () array!1946)

(assert (=> d!11536 (= lt!58640 (select (arr!1367 lt!58646) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11536 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!874 lt!58646)))))

(assert (=> d!11536 (= lt!58646 (array!1947 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!58645 () tuple2!3688)

(assert (=> d!11536 (= lt!58642 (tuple2!3689 (_1!1931 lt!58645) (_2!1931 lt!58645)))))

(assert (=> d!11536 (= lt!58645 lt!58639)))

(assert (=> d!11536 e!25228))

(declare-fun res!32610 () Bool)

(assert (=> d!11536 (=> (not res!32610) (not e!25228))))

(assert (=> d!11536 (= res!32610 (= (size!874 (buf!1202 thiss!1379)) (size!874 (buf!1202 (_2!1931 lt!58639)))))))

(declare-fun appendBit!0 (BitStream!1504 Bool) tuple2!3688)

(assert (=> d!11536 (= lt!58639 (appendBit!0 thiss!1379 lt!58638))))

(assert (=> d!11536 (= lt!58638 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11536 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11536 (= (appendBitFromByte!0 thiss!1379 (select (arr!1367 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!58642)))

(declare-fun b!38449 () Bool)

(assert (=> b!38449 (= e!25231 (= (bitIndex!0 (size!874 (buf!1202 (_1!1933 lt!58644))) (currentByte!2608 (_1!1933 lt!58644)) (currentBit!2603 (_1!1933 lt!58644))) (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58639))) (currentByte!2608 (_2!1931 lt!58639)) (currentBit!2603 (_2!1931 lt!58639)))))))

(declare-fun b!38450 () Bool)

(declare-fun res!32608 () Bool)

(assert (=> b!38450 (=> (not res!32608) (not e!25230))))

(declare-fun lt!58637 () (_ BitVec 64))

(declare-fun lt!58647 () (_ BitVec 64))

(assert (=> b!38450 (= res!32608 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!58642))) (currentByte!2608 (_2!1931 lt!58642)) (currentBit!2603 (_2!1931 lt!58642))) (bvadd lt!58637 lt!58647)))))

(assert (=> b!38450 (or (not (= (bvand lt!58637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58647 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!58637 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!58637 lt!58647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38450 (= lt!58647 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!38450 (= lt!58637 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(declare-fun b!38451 () Bool)

(declare-fun res!32614 () Bool)

(assert (=> b!38451 (=> (not res!32614) (not e!25230))))

(assert (=> b!38451 (= res!32614 (isPrefixOf!0 thiss!1379 (_2!1931 lt!58642)))))

(assert (= (and d!11536 res!32610) b!38447))

(assert (= (and b!38447 res!32613) b!38445))

(assert (= (and b!38445 res!32612) b!38446))

(assert (= (and b!38446 res!32609) b!38449))

(assert (= (and d!11536 res!32615) b!38450))

(assert (= (and b!38450 res!32608) b!38451))

(assert (= (and b!38451 res!32614) b!38448))

(assert (= (and b!38448 res!32611) b!38444))

(declare-fun m!58591 () Bool)

(assert (=> b!38449 m!58591))

(declare-fun m!58593 () Bool)

(assert (=> b!38449 m!58593))

(declare-fun m!58595 () Bool)

(assert (=> b!38448 m!58595))

(declare-fun m!58597 () Bool)

(assert (=> b!38448 m!58597))

(declare-fun m!58599 () Bool)

(assert (=> b!38448 m!58599))

(declare-fun m!58601 () Bool)

(assert (=> b!38450 m!58601))

(assert (=> b!38450 m!57595))

(declare-fun m!58603 () Bool)

(assert (=> b!38451 m!58603))

(declare-fun m!58605 () Bool)

(assert (=> b!38444 m!58605))

(assert (=> b!38444 m!58601))

(declare-fun m!58607 () Bool)

(assert (=> b!38445 m!58607))

(declare-fun m!58609 () Bool)

(assert (=> d!11536 m!58609))

(declare-fun m!58611 () Bool)

(assert (=> d!11536 m!58611))

(assert (=> d!11536 m!58439))

(assert (=> b!38447 m!58593))

(assert (=> b!38447 m!57595))

(declare-fun m!58613 () Bool)

(assert (=> b!38446 m!58613))

(assert (=> b!38446 m!58613))

(declare-fun m!58615 () Bool)

(assert (=> b!38446 m!58615))

(assert (=> b!37911 d!11536))

(declare-fun b!38452 () Bool)

(declare-fun e!25232 () tuple2!3718)

(assert (=> b!38452 (= e!25232 (tuple2!3719 Nil!450 (_1!1932 lt!57533)))))

(declare-fun b!38453 () Bool)

(declare-fun lt!58649 () (_ BitVec 64))

(declare-fun lt!58651 () tuple2!3720)

(assert (=> b!38453 (= e!25232 (tuple2!3719 (Cons!449 (_1!1947 lt!58651) (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_2!1947 lt!58651) (bvsub (bvsub to!314 i!635) lt!58649))) (_2!1947 lt!58651)))))

(assert (=> b!38453 (= lt!58651 (readBit!0 (_1!1932 lt!57533)))))

(assert (=> b!38453 (= lt!58649 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!38455 () Bool)

(declare-fun e!25233 () Bool)

(declare-fun lt!58650 () List!453)

(assert (=> b!38455 (= e!25233 (> (length!179 lt!58650) 0))))

(declare-fun d!11578 () Bool)

(assert (=> d!11578 e!25233))

(declare-fun c!2680 () Bool)

(assert (=> d!11578 (= c!2680 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11578 (= lt!58650 (_1!1946 e!25232))))

(declare-fun c!2681 () Bool)

(assert (=> d!11578 (= c!2681 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11578 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11578 (= (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_1!1932 lt!57533) (bvsub to!314 i!635)) lt!58650)))

(declare-fun b!38454 () Bool)

(assert (=> b!38454 (= e!25233 (isEmpty!109 lt!58650))))

(assert (= (and d!11578 c!2681) b!38452))

(assert (= (and d!11578 (not c!2681)) b!38453))

(assert (= (and d!11578 c!2680) b!38454))

(assert (= (and d!11578 (not c!2680)) b!38455))

(declare-fun m!58617 () Bool)

(assert (=> b!38453 m!58617))

(assert (=> b!38453 m!58451))

(declare-fun m!58619 () Bool)

(assert (=> b!38455 m!58619))

(declare-fun m!58621 () Bool)

(assert (=> b!38454 m!58621))

(assert (=> b!37922 d!11578))

(declare-fun b!38456 () Bool)

(declare-fun res!32617 () Bool)

(declare-fun e!25235 () Bool)

(assert (=> b!38456 (=> (not res!32617) (not e!25235))))

(declare-fun lt!58657 () tuple2!3690)

(assert (=> b!38456 (= res!32617 (isPrefixOf!0 (_1!1932 lt!58657) thiss!1379))))

(declare-fun b!38457 () Bool)

(declare-fun e!25234 () Unit!2745)

(declare-fun Unit!2779 () Unit!2745)

(assert (=> b!38457 (= e!25234 Unit!2779)))

(declare-fun lt!58662 () (_ BitVec 64))

(declare-fun b!38458 () Bool)

(declare-fun lt!58660 () (_ BitVec 64))

(assert (=> b!38458 (= e!25235 (= (_1!1932 lt!58657) (withMovedBitIndex!0 (_2!1932 lt!58657) (bvsub lt!58660 lt!58662))))))

(assert (=> b!38458 (or (= (bvand lt!58660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58660 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58660 lt!58662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38458 (= lt!58662 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57529))) (currentByte!2608 (_2!1931 lt!57529)) (currentBit!2603 (_2!1931 lt!57529))))))

(assert (=> b!38458 (= lt!58660 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(declare-fun d!11580 () Bool)

(assert (=> d!11580 e!25235))

(declare-fun res!32616 () Bool)

(assert (=> d!11580 (=> (not res!32616) (not e!25235))))

(assert (=> d!11580 (= res!32616 (isPrefixOf!0 (_1!1932 lt!58657) (_2!1932 lt!58657)))))

(declare-fun lt!58653 () BitStream!1504)

(assert (=> d!11580 (= lt!58657 (tuple2!3691 lt!58653 (_2!1931 lt!57529)))))

(declare-fun lt!58667 () Unit!2745)

(declare-fun lt!58659 () Unit!2745)

(assert (=> d!11580 (= lt!58667 lt!58659)))

(assert (=> d!11580 (isPrefixOf!0 lt!58653 (_2!1931 lt!57529))))

(assert (=> d!11580 (= lt!58659 (lemmaIsPrefixTransitive!0 lt!58653 (_2!1931 lt!57529) (_2!1931 lt!57529)))))

(declare-fun lt!58668 () Unit!2745)

(declare-fun lt!58665 () Unit!2745)

(assert (=> d!11580 (= lt!58668 lt!58665)))

(assert (=> d!11580 (isPrefixOf!0 lt!58653 (_2!1931 lt!57529))))

(assert (=> d!11580 (= lt!58665 (lemmaIsPrefixTransitive!0 lt!58653 thiss!1379 (_2!1931 lt!57529)))))

(declare-fun lt!58655 () Unit!2745)

(assert (=> d!11580 (= lt!58655 e!25234)))

(declare-fun c!2682 () Bool)

(assert (=> d!11580 (= c!2682 (not (= (size!874 (buf!1202 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!58671 () Unit!2745)

(declare-fun lt!58654 () Unit!2745)

(assert (=> d!11580 (= lt!58671 lt!58654)))

(assert (=> d!11580 (isPrefixOf!0 (_2!1931 lt!57529) (_2!1931 lt!57529))))

(assert (=> d!11580 (= lt!58654 (lemmaIsPrefixRefl!0 (_2!1931 lt!57529)))))

(declare-fun lt!58669 () Unit!2745)

(declare-fun lt!58664 () Unit!2745)

(assert (=> d!11580 (= lt!58669 lt!58664)))

(assert (=> d!11580 (= lt!58664 (lemmaIsPrefixRefl!0 (_2!1931 lt!57529)))))

(declare-fun lt!58663 () Unit!2745)

(declare-fun lt!58661 () Unit!2745)

(assert (=> d!11580 (= lt!58663 lt!58661)))

(assert (=> d!11580 (isPrefixOf!0 lt!58653 lt!58653)))

(assert (=> d!11580 (= lt!58661 (lemmaIsPrefixRefl!0 lt!58653))))

(declare-fun lt!58670 () Unit!2745)

(declare-fun lt!58658 () Unit!2745)

(assert (=> d!11580 (= lt!58670 lt!58658)))

(assert (=> d!11580 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11580 (= lt!58658 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11580 (= lt!58653 (BitStream!1505 (buf!1202 (_2!1931 lt!57529)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(assert (=> d!11580 (isPrefixOf!0 thiss!1379 (_2!1931 lt!57529))))

(assert (=> d!11580 (= (reader!0 thiss!1379 (_2!1931 lt!57529)) lt!58657)))

(declare-fun b!38459 () Bool)

(declare-fun lt!58666 () Unit!2745)

(assert (=> b!38459 (= e!25234 lt!58666)))

(declare-fun lt!58652 () (_ BitVec 64))

(assert (=> b!38459 (= lt!58652 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58656 () (_ BitVec 64))

(assert (=> b!38459 (= lt!58656 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)))))

(assert (=> b!38459 (= lt!58666 (arrayBitRangesEqSymmetric!0 (buf!1202 thiss!1379) (buf!1202 (_2!1931 lt!57529)) lt!58652 lt!58656))))

(assert (=> b!38459 (arrayBitRangesEq!0 (buf!1202 (_2!1931 lt!57529)) (buf!1202 thiss!1379) lt!58652 lt!58656)))

(declare-fun b!38460 () Bool)

(declare-fun res!32618 () Bool)

(assert (=> b!38460 (=> (not res!32618) (not e!25235))))

(assert (=> b!38460 (= res!32618 (isPrefixOf!0 (_2!1932 lt!58657) (_2!1931 lt!57529)))))

(assert (= (and d!11580 c!2682) b!38459))

(assert (= (and d!11580 (not c!2682)) b!38457))

(assert (= (and d!11580 res!32616) b!38456))

(assert (= (and b!38456 res!32617) b!38460))

(assert (= (and b!38460 res!32618) b!38458))

(declare-fun m!58623 () Bool)

(assert (=> d!11580 m!58623))

(declare-fun m!58625 () Bool)

(assert (=> d!11580 m!58625))

(declare-fun m!58627 () Bool)

(assert (=> d!11580 m!58627))

(declare-fun m!58629 () Bool)

(assert (=> d!11580 m!58629))

(assert (=> d!11580 m!57657))

(declare-fun m!58631 () Bool)

(assert (=> d!11580 m!58631))

(declare-fun m!58633 () Bool)

(assert (=> d!11580 m!58633))

(declare-fun m!58635 () Bool)

(assert (=> d!11580 m!58635))

(assert (=> d!11580 m!57591))

(assert (=> d!11580 m!57593))

(declare-fun m!58637 () Bool)

(assert (=> d!11580 m!58637))

(declare-fun m!58639 () Bool)

(assert (=> b!38458 m!58639))

(assert (=> b!38458 m!57653))

(assert (=> b!38458 m!57595))

(declare-fun m!58641 () Bool)

(assert (=> b!38460 m!58641))

(declare-fun m!58643 () Bool)

(assert (=> b!38456 m!58643))

(assert (=> b!38459 m!57595))

(declare-fun m!58645 () Bool)

(assert (=> b!38459 m!58645))

(declare-fun m!58647 () Bool)

(assert (=> b!38459 m!58647))

(assert (=> b!37922 d!11580))

(declare-fun d!11582 () Bool)

(assert (=> d!11582 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!57517)))

(declare-fun lt!58672 () Unit!2745)

(assert (=> d!11582 (= lt!58672 (choose!9 (_2!1931 lt!57528) (buf!1202 (_2!1931 lt!57529)) lt!57517 (BitStream!1505 (buf!1202 (_2!1931 lt!57529)) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528)))))))

(assert (=> d!11582 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1931 lt!57528) (buf!1202 (_2!1931 lt!57529)) lt!57517) lt!58672)))

(declare-fun bs!3068 () Bool)

(assert (= bs!3068 d!11582))

(assert (=> bs!3068 m!57639))

(declare-fun m!58649 () Bool)

(assert (=> bs!3068 m!58649))

(assert (=> b!37922 d!11582))

(declare-fun d!11584 () Bool)

(assert (=> d!11584 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528))) lt!57517) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528)))) lt!57517))))

(declare-fun bs!3069 () Bool)

(assert (= bs!3069 d!11584))

(declare-fun m!58651 () Bool)

(assert (=> bs!3069 m!58651))

(assert (=> b!37922 d!11584))

(declare-fun d!11586 () Bool)

(assert (=> d!11586 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3070 () Bool)

(assert (= bs!3070 d!11586))

(declare-fun m!58653 () Bool)

(assert (=> bs!3070 m!58653))

(assert (=> b!37922 d!11586))

(declare-fun d!11588 () Bool)

(assert (=> d!11588 (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57529)))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!58673 () Unit!2745)

(assert (=> d!11588 (= lt!58673 (choose!9 thiss!1379 (buf!1202 (_2!1931 lt!57529)) (bvsub to!314 i!635) (BitStream!1505 (buf!1202 (_2!1931 lt!57529)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379))))))

(assert (=> d!11588 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1202 (_2!1931 lt!57529)) (bvsub to!314 i!635)) lt!58673)))

(declare-fun bs!3071 () Bool)

(assert (= bs!3071 d!11588))

(assert (=> bs!3071 m!57629))

(declare-fun m!58655 () Bool)

(assert (=> bs!3071 m!58655))

(assert (=> b!37922 d!11588))

(declare-fun b!38461 () Bool)

(declare-fun res!32620 () Bool)

(declare-fun e!25237 () Bool)

(assert (=> b!38461 (=> (not res!32620) (not e!25237))))

(declare-fun lt!58679 () tuple2!3690)

(assert (=> b!38461 (= res!32620 (isPrefixOf!0 (_1!1932 lt!58679) (_2!1931 lt!57528)))))

(declare-fun b!38462 () Bool)

(declare-fun e!25236 () Unit!2745)

(declare-fun Unit!2780 () Unit!2745)

(assert (=> b!38462 (= e!25236 Unit!2780)))

(declare-fun b!38463 () Bool)

(declare-fun lt!58682 () (_ BitVec 64))

(declare-fun lt!58684 () (_ BitVec 64))

(assert (=> b!38463 (= e!25237 (= (_1!1932 lt!58679) (withMovedBitIndex!0 (_2!1932 lt!58679) (bvsub lt!58682 lt!58684))))))

(assert (=> b!38463 (or (= (bvand lt!58682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58682 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58682 lt!58684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38463 (= lt!58684 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57529))) (currentByte!2608 (_2!1931 lt!57529)) (currentBit!2603 (_2!1931 lt!57529))))))

(assert (=> b!38463 (= lt!58682 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(declare-fun d!11590 () Bool)

(assert (=> d!11590 e!25237))

(declare-fun res!32619 () Bool)

(assert (=> d!11590 (=> (not res!32619) (not e!25237))))

(assert (=> d!11590 (= res!32619 (isPrefixOf!0 (_1!1932 lt!58679) (_2!1932 lt!58679)))))

(declare-fun lt!58675 () BitStream!1504)

(assert (=> d!11590 (= lt!58679 (tuple2!3691 lt!58675 (_2!1931 lt!57529)))))

(declare-fun lt!58689 () Unit!2745)

(declare-fun lt!58681 () Unit!2745)

(assert (=> d!11590 (= lt!58689 lt!58681)))

(assert (=> d!11590 (isPrefixOf!0 lt!58675 (_2!1931 lt!57529))))

(assert (=> d!11590 (= lt!58681 (lemmaIsPrefixTransitive!0 lt!58675 (_2!1931 lt!57529) (_2!1931 lt!57529)))))

(declare-fun lt!58690 () Unit!2745)

(declare-fun lt!58687 () Unit!2745)

(assert (=> d!11590 (= lt!58690 lt!58687)))

(assert (=> d!11590 (isPrefixOf!0 lt!58675 (_2!1931 lt!57529))))

(assert (=> d!11590 (= lt!58687 (lemmaIsPrefixTransitive!0 lt!58675 (_2!1931 lt!57528) (_2!1931 lt!57529)))))

(declare-fun lt!58677 () Unit!2745)

(assert (=> d!11590 (= lt!58677 e!25236)))

(declare-fun c!2683 () Bool)

(assert (=> d!11590 (= c!2683 (not (= (size!874 (buf!1202 (_2!1931 lt!57528))) #b00000000000000000000000000000000)))))

(declare-fun lt!58693 () Unit!2745)

(declare-fun lt!58676 () Unit!2745)

(assert (=> d!11590 (= lt!58693 lt!58676)))

(assert (=> d!11590 (isPrefixOf!0 (_2!1931 lt!57529) (_2!1931 lt!57529))))

(assert (=> d!11590 (= lt!58676 (lemmaIsPrefixRefl!0 (_2!1931 lt!57529)))))

(declare-fun lt!58691 () Unit!2745)

(declare-fun lt!58686 () Unit!2745)

(assert (=> d!11590 (= lt!58691 lt!58686)))

(assert (=> d!11590 (= lt!58686 (lemmaIsPrefixRefl!0 (_2!1931 lt!57529)))))

(declare-fun lt!58685 () Unit!2745)

(declare-fun lt!58683 () Unit!2745)

(assert (=> d!11590 (= lt!58685 lt!58683)))

(assert (=> d!11590 (isPrefixOf!0 lt!58675 lt!58675)))

(assert (=> d!11590 (= lt!58683 (lemmaIsPrefixRefl!0 lt!58675))))

(declare-fun lt!58692 () Unit!2745)

(declare-fun lt!58680 () Unit!2745)

(assert (=> d!11590 (= lt!58692 lt!58680)))

(assert (=> d!11590 (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!57528))))

(assert (=> d!11590 (= lt!58680 (lemmaIsPrefixRefl!0 (_2!1931 lt!57528)))))

(assert (=> d!11590 (= lt!58675 (BitStream!1505 (buf!1202 (_2!1931 lt!57529)) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(assert (=> d!11590 (isPrefixOf!0 (_2!1931 lt!57528) (_2!1931 lt!57529))))

(assert (=> d!11590 (= (reader!0 (_2!1931 lt!57528) (_2!1931 lt!57529)) lt!58679)))

(declare-fun b!38464 () Bool)

(declare-fun lt!58688 () Unit!2745)

(assert (=> b!38464 (= e!25236 lt!58688)))

(declare-fun lt!58674 () (_ BitVec 64))

(assert (=> b!38464 (= lt!58674 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58678 () (_ BitVec 64))

(assert (=> b!38464 (= lt!58678 (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))))))

(assert (=> b!38464 (= lt!58688 (arrayBitRangesEqSymmetric!0 (buf!1202 (_2!1931 lt!57528)) (buf!1202 (_2!1931 lt!57529)) lt!58674 lt!58678))))

(assert (=> b!38464 (arrayBitRangesEq!0 (buf!1202 (_2!1931 lt!57529)) (buf!1202 (_2!1931 lt!57528)) lt!58674 lt!58678)))

(declare-fun b!38465 () Bool)

(declare-fun res!32621 () Bool)

(assert (=> b!38465 (=> (not res!32621) (not e!25237))))

(assert (=> b!38465 (= res!32621 (isPrefixOf!0 (_2!1932 lt!58679) (_2!1931 lt!57529)))))

(assert (= (and d!11590 c!2683) b!38464))

(assert (= (and d!11590 (not c!2683)) b!38462))

(assert (= (and d!11590 res!32619) b!38461))

(assert (= (and b!38461 res!32620) b!38465))

(assert (= (and b!38465 res!32621) b!38463))

(declare-fun m!58657 () Bool)

(assert (=> d!11590 m!58657))

(assert (=> d!11590 m!58625))

(assert (=> d!11590 m!58627))

(declare-fun m!58659 () Bool)

(assert (=> d!11590 m!58659))

(assert (=> d!11590 m!57661))

(declare-fun m!58661 () Bool)

(assert (=> d!11590 m!58661))

(declare-fun m!58663 () Bool)

(assert (=> d!11590 m!58663))

(declare-fun m!58665 () Bool)

(assert (=> d!11590 m!58665))

(assert (=> d!11590 m!57985))

(assert (=> d!11590 m!57987))

(declare-fun m!58667 () Bool)

(assert (=> d!11590 m!58667))

(declare-fun m!58669 () Bool)

(assert (=> b!38463 m!58669))

(assert (=> b!38463 m!57653))

(assert (=> b!38463 m!57607))

(declare-fun m!58671 () Bool)

(assert (=> b!38465 m!58671))

(declare-fun m!58673 () Bool)

(assert (=> b!38461 m!58673))

(assert (=> b!38464 m!57607))

(declare-fun m!58675 () Bool)

(assert (=> b!38464 m!58675))

(declare-fun m!58677 () Bool)

(assert (=> b!38464 m!58677))

(assert (=> b!37922 d!11590))

(declare-fun b!38466 () Bool)

(declare-fun e!25238 () tuple2!3718)

(assert (=> b!38466 (= e!25238 (tuple2!3719 Nil!450 (_1!1932 lt!57531)))))

(declare-fun b!38467 () Bool)

(declare-fun lt!58696 () tuple2!3720)

(declare-fun lt!58694 () (_ BitVec 64))

(assert (=> b!38467 (= e!25238 (tuple2!3719 (Cons!449 (_1!1947 lt!58696) (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_2!1947 lt!58696) (bvsub lt!57517 lt!58694))) (_2!1947 lt!58696)))))

(assert (=> b!38467 (= lt!58696 (readBit!0 (_1!1932 lt!57531)))))

(assert (=> b!38467 (= lt!58694 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!38469 () Bool)

(declare-fun e!25239 () Bool)

(declare-fun lt!58695 () List!453)

(assert (=> b!38469 (= e!25239 (> (length!179 lt!58695) 0))))

(declare-fun d!11592 () Bool)

(assert (=> d!11592 e!25239))

(declare-fun c!2684 () Bool)

(assert (=> d!11592 (= c!2684 (= lt!57517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11592 (= lt!58695 (_1!1946 e!25238))))

(declare-fun c!2685 () Bool)

(assert (=> d!11592 (= c!2685 (= lt!57517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11592 (bvsge lt!57517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11592 (= (bitStreamReadBitsIntoList!0 (_2!1931 lt!57529) (_1!1932 lt!57531) lt!57517) lt!58695)))

(declare-fun b!38468 () Bool)

(assert (=> b!38468 (= e!25239 (isEmpty!109 lt!58695))))

(assert (= (and d!11592 c!2685) b!38466))

(assert (= (and d!11592 (not c!2685)) b!38467))

(assert (= (and d!11592 c!2684) b!38468))

(assert (= (and d!11592 (not c!2684)) b!38469))

(declare-fun m!58679 () Bool)

(assert (=> b!38467 m!58679))

(declare-fun m!58681 () Bool)

(assert (=> b!38467 m!58681))

(declare-fun m!58683 () Bool)

(assert (=> b!38469 m!58683))

(declare-fun m!58685 () Bool)

(assert (=> b!38468 m!58685))

(assert (=> b!37922 d!11592))

(declare-fun d!11594 () Bool)

(assert (=> d!11594 (= (array_inv!805 srcBuffer!2) (bvsge (size!874 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7766 d!11594))

(declare-fun d!11596 () Bool)

(assert (=> d!11596 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2603 thiss!1379) (currentByte!2608 thiss!1379) (size!874 (buf!1202 thiss!1379))))))

(declare-fun bs!3072 () Bool)

(assert (= bs!3072 d!11596))

(assert (=> bs!3072 m!57599))

(assert (=> start!7766 d!11596))

(declare-fun d!11598 () Bool)

(declare-fun e!25240 () Bool)

(assert (=> d!11598 e!25240))

(declare-fun res!32623 () Bool)

(assert (=> d!11598 (=> (not res!32623) (not e!25240))))

(declare-fun lt!58699 () (_ BitVec 64))

(declare-fun lt!58701 () (_ BitVec 64))

(declare-fun lt!58700 () (_ BitVec 64))

(assert (=> d!11598 (= res!32623 (= lt!58701 (bvsub lt!58699 lt!58700)))))

(assert (=> d!11598 (or (= (bvand lt!58699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58699 lt!58700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11598 (= lt!58700 (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))) ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528)))))))

(declare-fun lt!58702 () (_ BitVec 64))

(declare-fun lt!58697 () (_ BitVec 64))

(assert (=> d!11598 (= lt!58699 (bvmul lt!58702 lt!58697))))

(assert (=> d!11598 (or (= lt!58702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58697 (bvsdiv (bvmul lt!58702 lt!58697) lt!58702)))))

(assert (=> d!11598 (= lt!58697 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11598 (= lt!58702 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))))))

(assert (=> d!11598 (= lt!58701 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2608 (_2!1931 lt!57528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2603 (_2!1931 lt!57528)))))))

(assert (=> d!11598 (invariant!0 (currentBit!2603 (_2!1931 lt!57528)) (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57528))))))

(assert (=> d!11598 (= (bitIndex!0 (size!874 (buf!1202 (_2!1931 lt!57528))) (currentByte!2608 (_2!1931 lt!57528)) (currentBit!2603 (_2!1931 lt!57528))) lt!58701)))

(declare-fun b!38470 () Bool)

(declare-fun res!32622 () Bool)

(assert (=> b!38470 (=> (not res!32622) (not e!25240))))

(assert (=> b!38470 (= res!32622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58701))))

(declare-fun b!38471 () Bool)

(declare-fun lt!58698 () (_ BitVec 64))

(assert (=> b!38471 (= e!25240 (bvsle lt!58701 (bvmul lt!58698 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38471 (or (= lt!58698 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58698 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58698)))))

(assert (=> b!38471 (= lt!58698 ((_ sign_extend 32) (size!874 (buf!1202 (_2!1931 lt!57528)))))))

(assert (= (and d!11598 res!32623) b!38470))

(assert (= (and b!38470 res!32622) b!38471))

(assert (=> d!11598 m!58489))

(assert (=> d!11598 m!57675))

(assert (=> b!37921 d!11598))

(declare-fun d!11600 () Bool)

(assert (=> d!11600 (= (head!290 lt!57532) (h!568 lt!57532))))

(assert (=> b!37910 d!11600))

(declare-fun d!11602 () Bool)

(declare-fun res!32624 () Bool)

(declare-fun e!25242 () Bool)

(assert (=> d!11602 (=> (not res!32624) (not e!25242))))

(assert (=> d!11602 (= res!32624 (= (size!874 (buf!1202 thiss!1379)) (size!874 (buf!1202 thiss!1379))))))

(assert (=> d!11602 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!25242)))

(declare-fun b!38472 () Bool)

(declare-fun res!32625 () Bool)

(assert (=> b!38472 (=> (not res!32625) (not e!25242))))

(assert (=> b!38472 (= res!32625 (bvsle (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)) (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379))))))

(declare-fun b!38473 () Bool)

(declare-fun e!25241 () Bool)

(assert (=> b!38473 (= e!25242 e!25241)))

(declare-fun res!32626 () Bool)

(assert (=> b!38473 (=> res!32626 e!25241)))

(assert (=> b!38473 (= res!32626 (= (size!874 (buf!1202 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38474 () Bool)

(assert (=> b!38474 (= e!25241 (arrayBitRangesEq!0 (buf!1202 thiss!1379) (buf!1202 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379))))))

(assert (= (and d!11602 res!32624) b!38472))

(assert (= (and b!38472 res!32625) b!38473))

(assert (= (and b!38473 (not res!32626)) b!38474))

(assert (=> b!38472 m!57595))

(assert (=> b!38472 m!57595))

(assert (=> b!38474 m!57595))

(assert (=> b!38474 m!57595))

(declare-fun m!58687 () Bool)

(assert (=> b!38474 m!58687))

(assert (=> b!37909 d!11602))

(declare-fun d!11604 () Bool)

(assert (=> d!11604 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!58705 () Unit!2745)

(declare-fun choose!11 (BitStream!1504) Unit!2745)

(assert (=> d!11604 (= lt!58705 (choose!11 thiss!1379))))

(assert (=> d!11604 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!58705)))

(declare-fun bs!3074 () Bool)

(assert (= bs!3074 d!11604))

(assert (=> bs!3074 m!57591))

(declare-fun m!58689 () Bool)

(assert (=> bs!3074 m!58689))

(assert (=> b!37909 d!11604))

(declare-fun d!11606 () Bool)

(declare-fun e!25243 () Bool)

(assert (=> d!11606 e!25243))

(declare-fun res!32628 () Bool)

(assert (=> d!11606 (=> (not res!32628) (not e!25243))))

(declare-fun lt!58709 () (_ BitVec 64))

(declare-fun lt!58710 () (_ BitVec 64))

(declare-fun lt!58708 () (_ BitVec 64))

(assert (=> d!11606 (= res!32628 (= lt!58710 (bvsub lt!58708 lt!58709)))))

(assert (=> d!11606 (or (= (bvand lt!58708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58709 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58708 lt!58709) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11606 (= lt!58709 (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 thiss!1379))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379))))))

(declare-fun lt!58711 () (_ BitVec 64))

(declare-fun lt!58706 () (_ BitVec 64))

(assert (=> d!11606 (= lt!58708 (bvmul lt!58711 lt!58706))))

(assert (=> d!11606 (or (= lt!58711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58706 (bvsdiv (bvmul lt!58711 lt!58706) lt!58711)))))

(assert (=> d!11606 (= lt!58706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11606 (= lt!58711 ((_ sign_extend 32) (size!874 (buf!1202 thiss!1379))))))

(assert (=> d!11606 (= lt!58710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2608 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2603 thiss!1379))))))

(assert (=> d!11606 (invariant!0 (currentBit!2603 thiss!1379) (currentByte!2608 thiss!1379) (size!874 (buf!1202 thiss!1379)))))

(assert (=> d!11606 (= (bitIndex!0 (size!874 (buf!1202 thiss!1379)) (currentByte!2608 thiss!1379) (currentBit!2603 thiss!1379)) lt!58710)))

(declare-fun b!38475 () Bool)

(declare-fun res!32627 () Bool)

(assert (=> b!38475 (=> (not res!32627) (not e!25243))))

(assert (=> b!38475 (= res!32627 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58710))))

(declare-fun b!38476 () Bool)

(declare-fun lt!58707 () (_ BitVec 64))

(assert (=> b!38476 (= e!25243 (bvsle lt!58710 (bvmul lt!58707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38476 (or (= lt!58707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58707)))))

(assert (=> b!38476 (= lt!58707 ((_ sign_extend 32) (size!874 (buf!1202 thiss!1379))))))

(assert (= (and d!11606 res!32628) b!38475))

(assert (= (and b!38475 res!32627) b!38476))

(declare-fun m!58691 () Bool)

(assert (=> d!11606 m!58691))

(assert (=> d!11606 m!57599))

(assert (=> b!37909 d!11606))

(declare-fun d!11608 () Bool)

(assert (=> d!11608 (= (invariant!0 (currentBit!2603 (_2!1931 lt!57528)) (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57528)))) (and (bvsge (currentBit!2603 (_2!1931 lt!57528)) #b00000000000000000000000000000000) (bvslt (currentBit!2603 (_2!1931 lt!57528)) #b00000000000000000000000000001000) (bvsge (currentByte!2608 (_2!1931 lt!57528)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57528)))) (and (= (currentBit!2603 (_2!1931 lt!57528)) #b00000000000000000000000000000000) (= (currentByte!2608 (_2!1931 lt!57528)) (size!874 (buf!1202 (_2!1931 lt!57528))))))))))

(assert (=> b!37920 d!11608))

(declare-fun d!11610 () Bool)

(assert (=> d!11610 (= (invariant!0 (currentBit!2603 (_2!1931 lt!57529)) (currentByte!2608 (_2!1931 lt!57529)) (size!874 (buf!1202 (_2!1931 lt!57529)))) (and (bvsge (currentBit!2603 (_2!1931 lt!57529)) #b00000000000000000000000000000000) (bvslt (currentBit!2603 (_2!1931 lt!57529)) #b00000000000000000000000000001000) (bvsge (currentByte!2608 (_2!1931 lt!57529)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2608 (_2!1931 lt!57529)) (size!874 (buf!1202 (_2!1931 lt!57529)))) (and (= (currentBit!2603 (_2!1931 lt!57529)) #b00000000000000000000000000000000) (= (currentByte!2608 (_2!1931 lt!57529)) (size!874 (buf!1202 (_2!1931 lt!57529))))))))))

(assert (=> b!37919 d!11610))

(declare-fun d!11612 () Bool)

(assert (=> d!11612 (= (bitAt!0 (buf!1202 (_2!1931 lt!57528)) lt!57521) (not (= (bvand ((_ sign_extend 24) (select (arr!1367 (buf!1202 (_2!1931 lt!57528))) ((_ extract 31 0) (bvsdiv lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57521 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3075 () Bool)

(assert (= bs!3075 d!11612))

(declare-fun m!58693 () Bool)

(assert (=> bs!3075 m!58693))

(assert (=> bs!3075 m!57967))

(assert (=> b!37930 d!11612))

(declare-fun d!11614 () Bool)

(assert (=> d!11614 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!874 (buf!1202 thiss!1379))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!874 (buf!1202 thiss!1379))) ((_ sign_extend 32) (currentByte!2608 thiss!1379)) ((_ sign_extend 32) (currentBit!2603 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3076 () Bool)

(assert (= bs!3076 d!11614))

(assert (=> bs!3076 m!58691))

(assert (=> b!37929 d!11614))

(push 1)

