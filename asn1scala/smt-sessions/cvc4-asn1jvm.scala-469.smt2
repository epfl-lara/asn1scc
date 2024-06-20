; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13648 () Bool)

(assert start!13648)

(declare-fun b!69945 () Bool)

(declare-fun res!57777 () Bool)

(declare-fun e!45630 () Bool)

(assert (=> b!69945 (=> res!57777 e!45630)))

(declare-datatypes ((array!2912 0))(
  ( (array!2913 (arr!1936 (Array (_ BitVec 32) (_ BitVec 8))) (size!1354 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2306 0))(
  ( (BitStream!2307 (buf!1735 array!2912) (currentByte!3443 (_ BitVec 32)) (currentBit!3438 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2306)

(declare-datatypes ((Unit!4689 0))(
  ( (Unit!4690) )
))
(declare-datatypes ((tuple2!6092 0))(
  ( (tuple2!6093 (_1!3157 Unit!4689) (_2!3157 BitStream!2306)) )
))
(declare-fun lt!112386 () tuple2!6092)

(assert (=> b!69945 (= res!57777 (not (= (size!1354 (buf!1735 thiss!1379)) (size!1354 (buf!1735 (_2!3157 lt!112386))))))))

(declare-fun b!69946 () Bool)

(declare-fun res!57775 () Bool)

(declare-fun e!45622 () Bool)

(assert (=> b!69946 (=> res!57775 e!45622)))

(declare-datatypes ((List!728 0))(
  ( (Nil!725) (Cons!724 (h!843 Bool) (t!1478 List!728)) )
))
(declare-fun lt!112384 () List!728)

(declare-fun length!356 (List!728) Int)

(assert (=> b!69946 (= res!57775 (<= (length!356 lt!112384) 0))))

(declare-fun b!69947 () Bool)

(declare-fun res!57768 () Bool)

(declare-fun e!45627 () Bool)

(assert (=> b!69947 (=> res!57768 e!45627)))

(declare-fun lt!112398 () tuple2!6092)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!69947 (= res!57768 (not (invariant!0 (currentBit!3438 (_2!3157 lt!112398)) (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112398))))))))

(declare-fun b!69948 () Bool)

(assert (=> b!69948 (= e!45630 e!45627)))

(declare-fun res!57776 () Bool)

(assert (=> b!69948 (=> res!57776 e!45627)))

(assert (=> b!69948 (= res!57776 (not (= (size!1354 (buf!1735 (_2!3157 lt!112398))) (size!1354 (buf!1735 (_2!3157 lt!112386))))))))

(declare-fun lt!112395 () (_ BitVec 64))

(declare-fun lt!112383 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!69948 (= lt!112395 (bvsub (bvsub (bvadd lt!112383 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!69948 (= lt!112383 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(assert (=> b!69948 (= (size!1354 (buf!1735 (_2!3157 lt!112386))) (size!1354 (buf!1735 thiss!1379)))))

(declare-fun e!45625 () Bool)

(declare-fun b!69949 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2912 array!2912 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69949 (= e!45625 (arrayBitRangesEq!0 (buf!1735 (_2!3157 lt!112398)) (buf!1735 (_2!3157 lt!112386)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112383))))

(declare-fun b!69950 () Bool)

(declare-fun e!45623 () Bool)

(assert (=> b!69950 (= e!45623 e!45630)))

(declare-fun res!57774 () Bool)

(assert (=> b!69950 (=> res!57774 e!45630)))

(declare-fun lt!112380 () (_ BitVec 64))

(assert (=> b!69950 (= res!57774 (not (= lt!112395 (bvsub (bvadd lt!112380 to!314) i!635))))))

(assert (=> b!69950 (= lt!112395 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112386))) (currentByte!3443 (_2!3157 lt!112386)) (currentBit!3438 (_2!3157 lt!112386))))))

(declare-fun srcBuffer!2 () array!2912)

(declare-datatypes ((tuple2!6094 0))(
  ( (tuple2!6095 (_1!3158 BitStream!2306) (_2!3158 BitStream!2306)) )
))
(declare-fun lt!112393 () tuple2!6094)

(declare-fun e!45635 () Bool)

(declare-fun b!69951 () Bool)

(declare-fun head!547 (List!728) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2306 array!2912 (_ BitVec 64) (_ BitVec 64)) List!728)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2306 BitStream!2306 (_ BitVec 64)) List!728)

(assert (=> b!69951 (= e!45635 (= (head!547 (byteArrayBitContentToList!0 (_2!3157 lt!112398) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!547 (bitStreamReadBitsIntoList!0 (_2!3157 lt!112398) (_1!3158 lt!112393) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!69952 () Bool)

(declare-fun e!45633 () Bool)

(assert (=> b!69952 (= e!45622 e!45633)))

(declare-fun res!57767 () Bool)

(assert (=> b!69952 (=> res!57767 e!45633)))

(declare-fun lt!112392 () List!728)

(declare-fun lt!112389 () List!728)

(assert (=> b!69952 (= res!57767 (not (= lt!112392 lt!112389)))))

(assert (=> b!69952 (= lt!112389 lt!112392)))

(declare-fun tail!332 (List!728) List!728)

(assert (=> b!69952 (= lt!112392 (tail!332 lt!112384))))

(declare-fun lt!112391 () tuple2!6094)

(declare-fun lt!112397 () Unit!4689)

(declare-fun lt!112381 () tuple2!6094)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2306 BitStream!2306 BitStream!2306 BitStream!2306 (_ BitVec 64) List!728) Unit!4689)

(assert (=> b!69952 (= lt!112397 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3157 lt!112386) (_2!3157 lt!112386) (_1!3158 lt!112391) (_1!3158 lt!112381) (bvsub to!314 i!635) lt!112384))))

(declare-fun b!69953 () Bool)

(declare-fun e!45631 () Bool)

(assert (=> b!69953 (= e!45631 e!45625)))

(declare-fun res!57771 () Bool)

(assert (=> b!69953 (=> res!57771 e!45625)))

(declare-fun lt!112394 () Bool)

(assert (=> b!69953 (= res!57771 (not (= (head!547 (byteArrayBitContentToList!0 (_2!3157 lt!112386) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!112394)))))

(declare-fun bitAt!0 (array!2912 (_ BitVec 64)) Bool)

(assert (=> b!69953 (= lt!112394 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!69954 () Bool)

(declare-fun e!45629 () Bool)

(assert (=> b!69954 (= e!45629 e!45623)))

(declare-fun res!57769 () Bool)

(assert (=> b!69954 (=> res!57769 e!45623)))

(declare-fun isPrefixOf!0 (BitStream!2306 BitStream!2306) Bool)

(assert (=> b!69954 (= res!57769 (not (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!112386))))))

(assert (=> b!69954 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112386))))

(declare-fun lt!112387 () Unit!4689)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2306 BitStream!2306 BitStream!2306) Unit!4689)

(assert (=> b!69954 (= lt!112387 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3157 lt!112398) (_2!3157 lt!112386)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2306 array!2912 (_ BitVec 64) (_ BitVec 64)) tuple2!6092)

(assert (=> b!69954 (= lt!112386 (appendBitsMSBFirstLoop!0 (_2!3157 lt!112398) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!69954 e!45635))

(declare-fun res!57760 () Bool)

(assert (=> b!69954 (=> (not res!57760) (not e!45635))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!69954 (= res!57760 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112390 () Unit!4689)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2306 array!2912 (_ BitVec 64)) Unit!4689)

(assert (=> b!69954 (= lt!112390 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1735 (_2!3157 lt!112398)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2306 BitStream!2306) tuple2!6094)

(assert (=> b!69954 (= lt!112393 (reader!0 thiss!1379 (_2!3157 lt!112398)))))

(declare-fun b!69955 () Bool)

(declare-fun e!45634 () Bool)

(declare-fun array_inv!1212 (array!2912) Bool)

(assert (=> b!69955 (= e!45634 (array_inv!1212 (buf!1735 thiss!1379)))))

(declare-fun b!69956 () Bool)

(declare-fun res!57759 () Bool)

(assert (=> b!69956 (=> res!57759 e!45625)))

(assert (=> b!69956 (= res!57759 (not (= (bitAt!0 (buf!1735 (_2!3157 lt!112398)) lt!112380) lt!112394)))))

(declare-fun b!69957 () Bool)

(declare-fun res!57761 () Bool)

(assert (=> b!69957 (=> res!57761 e!45625)))

(assert (=> b!69957 (= res!57761 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!112383) (bvsgt lt!112383 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!112380) (bvsge lt!112380 lt!112383)))))

(declare-fun b!69958 () Bool)

(declare-fun res!57770 () Bool)

(assert (=> b!69958 (=> res!57770 e!45627)))

(assert (=> b!69958 (= res!57770 (not (invariant!0 (currentBit!3438 (_2!3157 lt!112398)) (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112386))))))))

(declare-fun b!69959 () Bool)

(declare-fun e!45628 () Bool)

(declare-fun e!45624 () Bool)

(assert (=> b!69959 (= e!45628 (not e!45624))))

(declare-fun res!57773 () Bool)

(assert (=> b!69959 (=> res!57773 e!45624)))

(assert (=> b!69959 (= res!57773 (bvsge i!635 to!314))))

(assert (=> b!69959 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!112382 () Unit!4689)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2306) Unit!4689)

(assert (=> b!69959 (= lt!112382 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!69959 (= lt!112380 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(declare-fun b!69960 () Bool)

(declare-fun res!57762 () Bool)

(assert (=> b!69960 (=> (not res!57762) (not e!45628))))

(assert (=> b!69960 (= res!57762 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 thiss!1379))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!69944 () Bool)

(declare-fun res!57766 () Bool)

(assert (=> b!69944 (=> res!57766 e!45631)))

(declare-fun lt!112399 () Bool)

(assert (=> b!69944 (= res!57766 (not (= (head!547 lt!112384) lt!112399)))))

(declare-fun res!57758 () Bool)

(assert (=> start!13648 (=> (not res!57758) (not e!45628))))

(assert (=> start!13648 (= res!57758 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1354 srcBuffer!2))))))))

(assert (=> start!13648 e!45628))

(assert (=> start!13648 true))

(assert (=> start!13648 (array_inv!1212 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2306) Bool)

(assert (=> start!13648 (and (inv!12 thiss!1379) e!45634)))

(declare-fun b!69961 () Bool)

(declare-fun res!57772 () Bool)

(assert (=> b!69961 (=> res!57772 e!45630)))

(assert (=> b!69961 (= res!57772 (not (invariant!0 (currentBit!3438 (_2!3157 lt!112386)) (currentByte!3443 (_2!3157 lt!112386)) (size!1354 (buf!1735 (_2!3157 lt!112386))))))))

(declare-fun b!69962 () Bool)

(assert (=> b!69962 (= e!45633 e!45631)))

(declare-fun res!57764 () Bool)

(assert (=> b!69962 (=> res!57764 e!45631)))

(assert (=> b!69962 (= res!57764 (not (= lt!112399 (bitAt!0 (buf!1735 (_1!3158 lt!112381)) lt!112380))))))

(assert (=> b!69962 (= lt!112399 (bitAt!0 (buf!1735 (_1!3158 lt!112391)) lt!112380))))

(declare-fun b!69963 () Bool)

(assert (=> b!69963 (= e!45624 e!45629)))

(declare-fun res!57765 () Bool)

(assert (=> b!69963 (=> res!57765 e!45629)))

(assert (=> b!69963 (= res!57765 (not (isPrefixOf!0 thiss!1379 (_2!3157 lt!112398))))))

(declare-fun lt!112396 () (_ BitVec 64))

(assert (=> b!69963 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!112396)))

(assert (=> b!69963 (= lt!112396 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!112385 () Unit!4689)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2306 BitStream!2306 (_ BitVec 64) (_ BitVec 64)) Unit!4689)

(assert (=> b!69963 (= lt!112385 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3157 lt!112398) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2306 (_ BitVec 8) (_ BitVec 32)) tuple2!6092)

(assert (=> b!69963 (= lt!112398 (appendBitFromByte!0 thiss!1379 (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!69964 () Bool)

(assert (=> b!69964 (= e!45627 e!45622)))

(declare-fun res!57763 () Bool)

(assert (=> b!69964 (=> res!57763 e!45622)))

(assert (=> b!69964 (= res!57763 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!69964 (= lt!112389 (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_1!3158 lt!112381) lt!112396))))

(assert (=> b!69964 (= lt!112384 (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_1!3158 lt!112391) (bvsub to!314 i!635)))))

(assert (=> b!69964 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!112396)))

(declare-fun lt!112379 () Unit!4689)

(assert (=> b!69964 (= lt!112379 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3157 lt!112398) (buf!1735 (_2!3157 lt!112386)) lt!112396))))

(assert (=> b!69964 (= lt!112381 (reader!0 (_2!3157 lt!112398) (_2!3157 lt!112386)))))

(assert (=> b!69964 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!112388 () Unit!4689)

(assert (=> b!69964 (= lt!112388 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1735 (_2!3157 lt!112386)) (bvsub to!314 i!635)))))

(assert (=> b!69964 (= lt!112391 (reader!0 thiss!1379 (_2!3157 lt!112386)))))

(assert (= (and start!13648 res!57758) b!69960))

(assert (= (and b!69960 res!57762) b!69959))

(assert (= (and b!69959 (not res!57773)) b!69963))

(assert (= (and b!69963 (not res!57765)) b!69954))

(assert (= (and b!69954 res!57760) b!69951))

(assert (= (and b!69954 (not res!57769)) b!69950))

(assert (= (and b!69950 (not res!57774)) b!69961))

(assert (= (and b!69961 (not res!57772)) b!69945))

(assert (= (and b!69945 (not res!57777)) b!69948))

(assert (= (and b!69948 (not res!57776)) b!69947))

(assert (= (and b!69947 (not res!57768)) b!69958))

(assert (= (and b!69958 (not res!57770)) b!69964))

(assert (= (and b!69964 (not res!57763)) b!69946))

(assert (= (and b!69946 (not res!57775)) b!69952))

(assert (= (and b!69952 (not res!57767)) b!69962))

(assert (= (and b!69962 (not res!57764)) b!69944))

(assert (= (and b!69944 (not res!57766)) b!69953))

(assert (= (and b!69953 (not res!57771)) b!69956))

(assert (= (and b!69956 (not res!57759)) b!69957))

(assert (= (and b!69957 (not res!57761)) b!69949))

(assert (= start!13648 b!69955))

(declare-fun m!111939 () Bool)

(assert (=> b!69952 m!111939))

(declare-fun m!111941 () Bool)

(assert (=> b!69952 m!111941))

(declare-fun m!111943 () Bool)

(assert (=> b!69964 m!111943))

(declare-fun m!111945 () Bool)

(assert (=> b!69964 m!111945))

(declare-fun m!111947 () Bool)

(assert (=> b!69964 m!111947))

(declare-fun m!111949 () Bool)

(assert (=> b!69964 m!111949))

(declare-fun m!111951 () Bool)

(assert (=> b!69964 m!111951))

(declare-fun m!111953 () Bool)

(assert (=> b!69964 m!111953))

(declare-fun m!111955 () Bool)

(assert (=> b!69964 m!111955))

(declare-fun m!111957 () Bool)

(assert (=> b!69964 m!111957))

(declare-fun m!111959 () Bool)

(assert (=> b!69962 m!111959))

(declare-fun m!111961 () Bool)

(assert (=> b!69962 m!111961))

(declare-fun m!111963 () Bool)

(assert (=> b!69946 m!111963))

(declare-fun m!111965 () Bool)

(assert (=> b!69953 m!111965))

(assert (=> b!69953 m!111965))

(declare-fun m!111967 () Bool)

(assert (=> b!69953 m!111967))

(declare-fun m!111969 () Bool)

(assert (=> b!69953 m!111969))

(declare-fun m!111971 () Bool)

(assert (=> b!69944 m!111971))

(declare-fun m!111973 () Bool)

(assert (=> b!69951 m!111973))

(assert (=> b!69951 m!111973))

(declare-fun m!111975 () Bool)

(assert (=> b!69951 m!111975))

(declare-fun m!111977 () Bool)

(assert (=> b!69951 m!111977))

(assert (=> b!69951 m!111977))

(declare-fun m!111979 () Bool)

(assert (=> b!69951 m!111979))

(declare-fun m!111981 () Bool)

(assert (=> b!69950 m!111981))

(declare-fun m!111983 () Bool)

(assert (=> b!69956 m!111983))

(declare-fun m!111985 () Bool)

(assert (=> b!69963 m!111985))

(declare-fun m!111987 () Bool)

(assert (=> b!69963 m!111987))

(declare-fun m!111989 () Bool)

(assert (=> b!69963 m!111989))

(assert (=> b!69963 m!111987))

(declare-fun m!111991 () Bool)

(assert (=> b!69963 m!111991))

(declare-fun m!111993 () Bool)

(assert (=> b!69963 m!111993))

(declare-fun m!111995 () Bool)

(assert (=> b!69949 m!111995))

(declare-fun m!111997 () Bool)

(assert (=> b!69948 m!111997))

(declare-fun m!111999 () Bool)

(assert (=> b!69961 m!111999))

(declare-fun m!112001 () Bool)

(assert (=> start!13648 m!112001))

(declare-fun m!112003 () Bool)

(assert (=> start!13648 m!112003))

(declare-fun m!112005 () Bool)

(assert (=> b!69960 m!112005))

(declare-fun m!112007 () Bool)

(assert (=> b!69955 m!112007))

(declare-fun m!112009 () Bool)

(assert (=> b!69959 m!112009))

(declare-fun m!112011 () Bool)

(assert (=> b!69959 m!112011))

(declare-fun m!112013 () Bool)

(assert (=> b!69959 m!112013))

(declare-fun m!112015 () Bool)

(assert (=> b!69958 m!112015))

(declare-fun m!112017 () Bool)

(assert (=> b!69954 m!112017))

(declare-fun m!112019 () Bool)

(assert (=> b!69954 m!112019))

(declare-fun m!112021 () Bool)

(assert (=> b!69954 m!112021))

(declare-fun m!112023 () Bool)

(assert (=> b!69954 m!112023))

(declare-fun m!112025 () Bool)

(assert (=> b!69954 m!112025))

(declare-fun m!112027 () Bool)

(assert (=> b!69954 m!112027))

(declare-fun m!112029 () Bool)

(assert (=> b!69954 m!112029))

(declare-fun m!112031 () Bool)

(assert (=> b!69947 m!112031))

(push 1)

(assert (not b!69949))

(assert (not b!69956))

(assert (not b!69947))

(assert (not b!69958))

(assert (not b!69962))

(assert (not b!69953))

(assert (not b!69963))

(assert (not b!69961))

(assert (not b!69948))

(assert (not b!69951))

(assert (not b!69950))

(assert (not b!69944))

(assert (not b!69952))

(assert (not b!69954))

(assert (not start!13648))

(assert (not b!69960))

(assert (not b!69964))

(assert (not b!69959))

(assert (not b!69946))

(assert (not b!69955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!22424 () Bool)

(declare-fun res!57825 () Bool)

(declare-fun e!45673 () Bool)

(assert (=> d!22424 (=> (not res!57825) (not e!45673))))

(assert (=> d!22424 (= res!57825 (= (size!1354 (buf!1735 thiss!1379)) (size!1354 (buf!1735 (_2!3157 lt!112398)))))))

(assert (=> d!22424 (= (isPrefixOf!0 thiss!1379 (_2!3157 lt!112398)) e!45673)))

(declare-fun b!70022 () Bool)

(declare-fun res!57823 () Bool)

(assert (=> b!70022 (=> (not res!57823) (not e!45673))))

(assert (=> b!70022 (= res!57823 (bvsle (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)) (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398)))))))

(declare-fun b!70023 () Bool)

(declare-fun e!45674 () Bool)

(assert (=> b!70023 (= e!45673 e!45674)))

(declare-fun res!57824 () Bool)

(assert (=> b!70023 (=> res!57824 e!45674)))

(assert (=> b!70023 (= res!57824 (= (size!1354 (buf!1735 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70024 () Bool)

(assert (=> b!70024 (= e!45674 (arrayBitRangesEq!0 (buf!1735 thiss!1379) (buf!1735 (_2!3157 lt!112398)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379))))))

(assert (= (and d!22424 res!57825) b!70022))

(assert (= (and b!70022 res!57823) b!70023))

(assert (= (and b!70023 (not res!57824)) b!70024))

(assert (=> b!70022 m!112013))

(assert (=> b!70022 m!111997))

(assert (=> b!70024 m!112013))

(assert (=> b!70024 m!112013))

(declare-fun m!112101 () Bool)

(assert (=> b!70024 m!112101))

(assert (=> b!69963 d!22424))

(declare-fun d!22430 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!112396) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398)))) lt!112396))))

(declare-fun bs!5391 () Bool)

(assert (= bs!5391 d!22430))

(declare-fun m!112103 () Bool)

(assert (=> bs!5391 m!112103))

(assert (=> b!69963 d!22430))

(declare-fun d!22432 () Bool)

(declare-fun e!45677 () Bool)

(assert (=> d!22432 e!45677))

(declare-fun res!57828 () Bool)

(assert (=> d!22432 (=> (not res!57828) (not e!45677))))

(assert (=> d!22432 (= res!57828 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!112496 () Unit!4689)

(declare-fun choose!27 (BitStream!2306 BitStream!2306 (_ BitVec 64) (_ BitVec 64)) Unit!4689)

(assert (=> d!22432 (= lt!112496 (choose!27 thiss!1379 (_2!3157 lt!112398) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22432 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3157 lt!112398) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112496)))

(declare-fun b!70027 () Bool)

(assert (=> b!70027 (= e!45677 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22432 res!57828) b!70027))

(declare-fun m!112105 () Bool)

(assert (=> d!22432 m!112105))

(declare-fun m!112107 () Bool)

(assert (=> b!70027 m!112107))

(assert (=> b!69963 d!22432))

(declare-fun b!70103 () Bool)

(declare-fun res!57874 () Bool)

(declare-fun e!45716 () Bool)

(assert (=> b!70103 (=> (not res!57874) (not e!45716))))

(declare-fun lt!112621 () tuple2!6092)

(declare-fun lt!112630 () (_ BitVec 64))

(declare-fun lt!112624 () (_ BitVec 64))

(assert (=> b!70103 (= res!57874 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112621))) (currentByte!3443 (_2!3157 lt!112621)) (currentBit!3438 (_2!3157 lt!112621))) (bvadd lt!112624 lt!112630)))))

(assert (=> b!70103 (or (not (= (bvand lt!112624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112630 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!112624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!112624 lt!112630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70103 (= lt!112630 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!70103 (= lt!112624 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(declare-fun b!70105 () Bool)

(declare-fun res!57871 () Bool)

(assert (=> b!70105 (=> (not res!57871) (not e!45716))))

(assert (=> b!70105 (= res!57871 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112621)))))

(declare-fun b!70106 () Bool)

(declare-fun e!45719 () Bool)

(declare-datatypes ((tuple2!6102 0))(
  ( (tuple2!6103 (_1!3164 BitStream!2306) (_2!3164 Bool)) )
))
(declare-fun lt!112626 () tuple2!6102)

(declare-fun lt!112629 () tuple2!6092)

(assert (=> b!70106 (= e!45719 (= (bitIndex!0 (size!1354 (buf!1735 (_1!3164 lt!112626))) (currentByte!3443 (_1!3164 lt!112626)) (currentBit!3438 (_1!3164 lt!112626))) (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112629))) (currentByte!3443 (_2!3157 lt!112629)) (currentBit!3438 (_2!3157 lt!112629)))))))

(declare-fun b!70107 () Bool)

(declare-fun res!57870 () Bool)

(declare-fun e!45717 () Bool)

(assert (=> b!70107 (=> (not res!57870) (not e!45717))))

(assert (=> b!70107 (= res!57870 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112629))) (currentByte!3443 (_2!3157 lt!112629)) (currentBit!3438 (_2!3157 lt!112629))) (bvadd (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!70108 () Bool)

(declare-fun e!45718 () Bool)

(assert (=> b!70108 (= e!45716 e!45718)))

(declare-fun res!57873 () Bool)

(assert (=> b!70108 (=> (not res!57873) (not e!45718))))

(declare-fun lt!112619 () tuple2!6102)

(declare-fun lt!112620 () (_ BitVec 8))

(assert (=> b!70108 (= res!57873 (and (= (_2!3164 lt!112619) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!112620)) #b00000000000000000000000000000000))) (= (_1!3164 lt!112619) (_2!3157 lt!112621))))))

(declare-datatypes ((tuple2!6106 0))(
  ( (tuple2!6107 (_1!3166 array!2912) (_2!3166 BitStream!2306)) )
))
(declare-fun lt!112622 () tuple2!6106)

(declare-fun lt!112627 () BitStream!2306)

(declare-fun readBits!0 (BitStream!2306 (_ BitVec 64)) tuple2!6106)

(assert (=> b!70108 (= lt!112622 (readBits!0 lt!112627 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2306) tuple2!6102)

(assert (=> b!70108 (= lt!112619 (readBitPure!0 lt!112627))))

(declare-fun readerFrom!0 (BitStream!2306 (_ BitVec 32) (_ BitVec 32)) BitStream!2306)

(assert (=> b!70108 (= lt!112627 (readerFrom!0 (_2!3157 lt!112621) (currentBit!3438 thiss!1379) (currentByte!3443 thiss!1379)))))

(declare-fun d!22434 () Bool)

(assert (=> d!22434 e!45716))

(declare-fun res!57869 () Bool)

(assert (=> d!22434 (=> (not res!57869) (not e!45716))))

(assert (=> d!22434 (= res!57869 (= (size!1354 (buf!1735 (_2!3157 lt!112621))) (size!1354 (buf!1735 thiss!1379))))))

(declare-fun lt!112628 () array!2912)

(assert (=> d!22434 (= lt!112620 (select (arr!1936 lt!112628) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22434 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1354 lt!112628)))))

(assert (=> d!22434 (= lt!112628 (array!2913 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!112623 () tuple2!6092)

(assert (=> d!22434 (= lt!112621 (tuple2!6093 (_1!3157 lt!112623) (_2!3157 lt!112623)))))

(assert (=> d!22434 (= lt!112623 lt!112629)))

(assert (=> d!22434 e!45717))

(declare-fun res!57875 () Bool)

(assert (=> d!22434 (=> (not res!57875) (not e!45717))))

(assert (=> d!22434 (= res!57875 (= (size!1354 (buf!1735 thiss!1379)) (size!1354 (buf!1735 (_2!3157 lt!112629)))))))

(declare-fun lt!112625 () Bool)

(declare-fun appendBit!0 (BitStream!2306 Bool) tuple2!6092)

(assert (=> d!22434 (= lt!112629 (appendBit!0 thiss!1379 lt!112625))))

(assert (=> d!22434 (= lt!112625 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22434 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22434 (= (appendBitFromByte!0 thiss!1379 (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!112621)))

(declare-fun b!70104 () Bool)

(declare-fun res!57872 () Bool)

(assert (=> b!70104 (=> (not res!57872) (not e!45717))))

(assert (=> b!70104 (= res!57872 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112629)))))

(declare-fun b!70109 () Bool)

(assert (=> b!70109 (= e!45717 e!45719)))

(declare-fun res!57876 () Bool)

(assert (=> b!70109 (=> (not res!57876) (not e!45719))))

(assert (=> b!70109 (= res!57876 (and (= (_2!3164 lt!112626) lt!112625) (= (_1!3164 lt!112626) (_2!3157 lt!112629))))))

(assert (=> b!70109 (= lt!112626 (readBitPure!0 (readerFrom!0 (_2!3157 lt!112629) (currentBit!3438 thiss!1379) (currentByte!3443 thiss!1379))))))

(declare-fun b!70110 () Bool)

(assert (=> b!70110 (= e!45718 (= (bitIndex!0 (size!1354 (buf!1735 (_1!3164 lt!112619))) (currentByte!3443 (_1!3164 lt!112619)) (currentBit!3438 (_1!3164 lt!112619))) (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112621))) (currentByte!3443 (_2!3157 lt!112621)) (currentBit!3438 (_2!3157 lt!112621)))))))

(assert (= (and d!22434 res!57875) b!70107))

(assert (= (and b!70107 res!57870) b!70104))

(assert (= (and b!70104 res!57872) b!70109))

(assert (= (and b!70109 res!57876) b!70106))

(assert (= (and d!22434 res!57869) b!70103))

(assert (= (and b!70103 res!57874) b!70105))

(assert (= (and b!70105 res!57871) b!70108))

(assert (= (and b!70108 res!57873) b!70110))

(declare-fun m!112199 () Bool)

(assert (=> b!70104 m!112199))

(declare-fun m!112201 () Bool)

(assert (=> b!70108 m!112201))

(declare-fun m!112203 () Bool)

(assert (=> b!70108 m!112203))

(declare-fun m!112205 () Bool)

(assert (=> b!70108 m!112205))

(declare-fun m!112207 () Bool)

(assert (=> b!70109 m!112207))

(assert (=> b!70109 m!112207))

(declare-fun m!112209 () Bool)

(assert (=> b!70109 m!112209))

(declare-fun m!112211 () Bool)

(assert (=> b!70105 m!112211))

(declare-fun m!112213 () Bool)

(assert (=> b!70107 m!112213))

(assert (=> b!70107 m!112013))

(declare-fun m!112215 () Bool)

(assert (=> d!22434 m!112215))

(declare-fun m!112217 () Bool)

(assert (=> d!22434 m!112217))

(declare-fun m!112219 () Bool)

(assert (=> d!22434 m!112219))

(declare-fun m!112221 () Bool)

(assert (=> b!70106 m!112221))

(assert (=> b!70106 m!112213))

(declare-fun m!112223 () Bool)

(assert (=> b!70110 m!112223))

(declare-fun m!112225 () Bool)

(assert (=> b!70110 m!112225))

(assert (=> b!70103 m!112225))

(assert (=> b!70103 m!112013))

(assert (=> b!69963 d!22434))

(declare-fun d!22464 () Bool)

(assert (=> d!22464 (= (head!547 (byteArrayBitContentToList!0 (_2!3157 lt!112386) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!843 (byteArrayBitContentToList!0 (_2!3157 lt!112386) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!69953 d!22464))

(declare-fun d!22466 () Bool)

(declare-fun c!5216 () Bool)

(assert (=> d!22466 (= c!5216 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45722 () List!728)

(assert (=> d!22466 (= (byteArrayBitContentToList!0 (_2!3157 lt!112386) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!45722)))

(declare-fun b!70115 () Bool)

(assert (=> b!70115 (= e!45722 Nil!725)))

(declare-fun b!70116 () Bool)

(assert (=> b!70116 (= e!45722 (Cons!724 (not (= (bvand ((_ sign_extend 24) (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3157 lt!112386) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22466 c!5216) b!70115))

(assert (= (and d!22466 (not c!5216)) b!70116))

(assert (=> b!70116 m!111987))

(assert (=> b!70116 m!112219))

(declare-fun m!112227 () Bool)

(assert (=> b!70116 m!112227))

(assert (=> b!69953 d!22466))

(declare-fun d!22468 () Bool)

(assert (=> d!22468 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5395 () Bool)

(assert (= bs!5395 d!22468))

(assert (=> bs!5395 m!111987))

(assert (=> bs!5395 m!112219))

(assert (=> b!69953 d!22468))

(declare-fun d!22470 () Bool)

(assert (=> d!22470 (= (tail!332 lt!112384) (t!1478 lt!112384))))

(assert (=> b!69952 d!22470))

(declare-fun d!22472 () Bool)

(declare-fun e!45725 () Bool)

(assert (=> d!22472 e!45725))

(declare-fun res!57879 () Bool)

(assert (=> d!22472 (=> (not res!57879) (not e!45725))))

(declare-fun lt!112636 () (_ BitVec 64))

(assert (=> d!22472 (= res!57879 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!112636 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!112636) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22472 (= lt!112636 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!112635 () Unit!4689)

(declare-fun choose!42 (BitStream!2306 BitStream!2306 BitStream!2306 BitStream!2306 (_ BitVec 64) List!728) Unit!4689)

(assert (=> d!22472 (= lt!112635 (choose!42 (_2!3157 lt!112386) (_2!3157 lt!112386) (_1!3158 lt!112391) (_1!3158 lt!112381) (bvsub to!314 i!635) lt!112384))))

(assert (=> d!22472 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22472 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3157 lt!112386) (_2!3157 lt!112386) (_1!3158 lt!112391) (_1!3158 lt!112381) (bvsub to!314 i!635) lt!112384) lt!112635)))

(declare-fun b!70119 () Bool)

(assert (=> b!70119 (= e!45725 (= (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_1!3158 lt!112381) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!332 lt!112384)))))

(assert (= (and d!22472 res!57879) b!70119))

(declare-fun m!112229 () Bool)

(assert (=> d!22472 m!112229))

(declare-fun m!112231 () Bool)

(assert (=> b!70119 m!112231))

(assert (=> b!70119 m!111939))

(assert (=> b!69952 d!22472))

(declare-fun d!22474 () Bool)

(assert (=> d!22474 (= (head!547 (byteArrayBitContentToList!0 (_2!3157 lt!112398) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!843 (byteArrayBitContentToList!0 (_2!3157 lt!112398) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69951 d!22474))

(declare-fun d!22476 () Bool)

(declare-fun c!5217 () Bool)

(assert (=> d!22476 (= c!5217 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!45726 () List!728)

(assert (=> d!22476 (= (byteArrayBitContentToList!0 (_2!3157 lt!112398) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!45726)))

(declare-fun b!70120 () Bool)

(assert (=> b!70120 (= e!45726 Nil!725)))

(declare-fun b!70121 () Bool)

(assert (=> b!70121 (= e!45726 (Cons!724 (not (= (bvand ((_ sign_extend 24) (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3157 lt!112398) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22476 c!5217) b!70120))

(assert (= (and d!22476 (not c!5217)) b!70121))

(assert (=> b!70121 m!111987))

(assert (=> b!70121 m!112219))

(declare-fun m!112233 () Bool)

(assert (=> b!70121 m!112233))

(assert (=> b!69951 d!22476))

(declare-fun d!22478 () Bool)

(assert (=> d!22478 (= (head!547 (bitStreamReadBitsIntoList!0 (_2!3157 lt!112398) (_1!3158 lt!112393) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!843 (bitStreamReadBitsIntoList!0 (_2!3157 lt!112398) (_1!3158 lt!112393) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!69951 d!22478))

(declare-fun d!22480 () Bool)

(declare-fun e!45732 () Bool)

(assert (=> d!22480 e!45732))

(declare-fun c!5223 () Bool)

(assert (=> d!22480 (= c!5223 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!112644 () List!728)

(declare-datatypes ((tuple2!6112 0))(
  ( (tuple2!6113 (_1!3169 List!728) (_2!3169 BitStream!2306)) )
))
(declare-fun e!45731 () tuple2!6112)

(assert (=> d!22480 (= lt!112644 (_1!3169 e!45731))))

(declare-fun c!5222 () Bool)

(assert (=> d!22480 (= c!5222 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22480 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22480 (= (bitStreamReadBitsIntoList!0 (_2!3157 lt!112398) (_1!3158 lt!112393) #b0000000000000000000000000000000000000000000000000000000000000001) lt!112644)))

(declare-datatypes ((tuple2!6114 0))(
  ( (tuple2!6115 (_1!3170 Bool) (_2!3170 BitStream!2306)) )
))
(declare-fun lt!112643 () tuple2!6114)

(declare-fun lt!112645 () (_ BitVec 64))

(declare-fun b!70131 () Bool)

(assert (=> b!70131 (= e!45731 (tuple2!6113 (Cons!724 (_1!3170 lt!112643) (bitStreamReadBitsIntoList!0 (_2!3157 lt!112398) (_2!3170 lt!112643) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!112645))) (_2!3170 lt!112643)))))

(declare-fun readBit!0 (BitStream!2306) tuple2!6114)

(assert (=> b!70131 (= lt!112643 (readBit!0 (_1!3158 lt!112393)))))

(assert (=> b!70131 (= lt!112645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70132 () Bool)

(declare-fun isEmpty!227 (List!728) Bool)

(assert (=> b!70132 (= e!45732 (isEmpty!227 lt!112644))))

(declare-fun b!70133 () Bool)

(assert (=> b!70133 (= e!45732 (> (length!356 lt!112644) 0))))

(declare-fun b!70130 () Bool)

(assert (=> b!70130 (= e!45731 (tuple2!6113 Nil!725 (_1!3158 lt!112393)))))

(assert (= (and d!22480 c!5222) b!70130))

(assert (= (and d!22480 (not c!5222)) b!70131))

(assert (= (and d!22480 c!5223) b!70132))

(assert (= (and d!22480 (not c!5223)) b!70133))

(declare-fun m!112235 () Bool)

(assert (=> b!70131 m!112235))

(declare-fun m!112237 () Bool)

(assert (=> b!70131 m!112237))

(declare-fun m!112239 () Bool)

(assert (=> b!70132 m!112239))

(declare-fun m!112241 () Bool)

(assert (=> b!70133 m!112241))

(assert (=> b!69951 d!22480))

(declare-fun d!22482 () Bool)

(assert (=> d!22482 (= (bitAt!0 (buf!1735 (_1!3158 lt!112381)) lt!112380) (not (= (bvand ((_ sign_extend 24) (select (arr!1936 (buf!1735 (_1!3158 lt!112381))) ((_ extract 31 0) (bvsdiv lt!112380 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112380 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5396 () Bool)

(assert (= bs!5396 d!22482))

(declare-fun m!112243 () Bool)

(assert (=> bs!5396 m!112243))

(declare-fun m!112245 () Bool)

(assert (=> bs!5396 m!112245))

(assert (=> b!69962 d!22482))

(declare-fun d!22484 () Bool)

(assert (=> d!22484 (= (bitAt!0 (buf!1735 (_1!3158 lt!112391)) lt!112380) (not (= (bvand ((_ sign_extend 24) (select (arr!1936 (buf!1735 (_1!3158 lt!112391))) ((_ extract 31 0) (bvsdiv lt!112380 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112380 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5397 () Bool)

(assert (= bs!5397 d!22484))

(declare-fun m!112247 () Bool)

(assert (=> bs!5397 m!112247))

(assert (=> bs!5397 m!112245))

(assert (=> b!69962 d!22484))

(declare-fun d!22486 () Bool)

(assert (=> d!22486 (= (head!547 lt!112384) (h!843 lt!112384))))

(assert (=> b!69944 d!22486))

(declare-fun d!22488 () Bool)

(assert (=> d!22488 (= (array_inv!1212 (buf!1735 thiss!1379)) (bvsge (size!1354 (buf!1735 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!69955 d!22488))

(declare-fun d!22490 () Bool)

(assert (=> d!22490 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112386))))

(declare-fun lt!112648 () Unit!4689)

(declare-fun choose!30 (BitStream!2306 BitStream!2306 BitStream!2306) Unit!4689)

(assert (=> d!22490 (= lt!112648 (choose!30 thiss!1379 (_2!3157 lt!112398) (_2!3157 lt!112386)))))

(assert (=> d!22490 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112398))))

(assert (=> d!22490 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3157 lt!112398) (_2!3157 lt!112386)) lt!112648)))

(declare-fun bs!5398 () Bool)

(assert (= bs!5398 d!22490))

(assert (=> bs!5398 m!112017))

(declare-fun m!112249 () Bool)

(assert (=> bs!5398 m!112249))

(assert (=> bs!5398 m!111993))

(assert (=> b!69954 d!22490))

(declare-fun d!22492 () Bool)

(declare-fun res!57882 () Bool)

(declare-fun e!45733 () Bool)

(assert (=> d!22492 (=> (not res!57882) (not e!45733))))

(assert (=> d!22492 (= res!57882 (= (size!1354 (buf!1735 (_2!3157 lt!112398))) (size!1354 (buf!1735 (_2!3157 lt!112386)))))))

(assert (=> d!22492 (= (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!112386)) e!45733)))

(declare-fun b!70134 () Bool)

(declare-fun res!57880 () Bool)

(assert (=> b!70134 (=> (not res!57880) (not e!45733))))

(assert (=> b!70134 (= res!57880 (bvsle (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))) (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112386))) (currentByte!3443 (_2!3157 lt!112386)) (currentBit!3438 (_2!3157 lt!112386)))))))

(declare-fun b!70135 () Bool)

(declare-fun e!45734 () Bool)

(assert (=> b!70135 (= e!45733 e!45734)))

(declare-fun res!57881 () Bool)

(assert (=> b!70135 (=> res!57881 e!45734)))

(assert (=> b!70135 (= res!57881 (= (size!1354 (buf!1735 (_2!3157 lt!112398))) #b00000000000000000000000000000000))))

(declare-fun b!70136 () Bool)

(assert (=> b!70136 (= e!45734 (arrayBitRangesEq!0 (buf!1735 (_2!3157 lt!112398)) (buf!1735 (_2!3157 lt!112386)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398)))))))

(assert (= (and d!22492 res!57882) b!70134))

(assert (= (and b!70134 res!57880) b!70135))

(assert (= (and b!70135 (not res!57881)) b!70136))

(assert (=> b!70134 m!111997))

(assert (=> b!70134 m!111981))

(assert (=> b!70136 m!111997))

(assert (=> b!70136 m!111997))

(declare-fun m!112251 () Bool)

(assert (=> b!70136 m!112251))

(assert (=> b!69954 d!22492))

(declare-fun d!22494 () Bool)

(declare-fun res!57885 () Bool)

(declare-fun e!45735 () Bool)

(assert (=> d!22494 (=> (not res!57885) (not e!45735))))

(assert (=> d!22494 (= res!57885 (= (size!1354 (buf!1735 thiss!1379)) (size!1354 (buf!1735 (_2!3157 lt!112386)))))))

(assert (=> d!22494 (= (isPrefixOf!0 thiss!1379 (_2!3157 lt!112386)) e!45735)))

(declare-fun b!70137 () Bool)

(declare-fun res!57883 () Bool)

(assert (=> b!70137 (=> (not res!57883) (not e!45735))))

(assert (=> b!70137 (= res!57883 (bvsle (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)) (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112386))) (currentByte!3443 (_2!3157 lt!112386)) (currentBit!3438 (_2!3157 lt!112386)))))))

(declare-fun b!70138 () Bool)

(declare-fun e!45736 () Bool)

(assert (=> b!70138 (= e!45735 e!45736)))

(declare-fun res!57884 () Bool)

(assert (=> b!70138 (=> res!57884 e!45736)))

(assert (=> b!70138 (= res!57884 (= (size!1354 (buf!1735 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70139 () Bool)

(assert (=> b!70139 (= e!45736 (arrayBitRangesEq!0 (buf!1735 thiss!1379) (buf!1735 (_2!3157 lt!112386)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379))))))

(assert (= (and d!22494 res!57885) b!70137))

(assert (= (and b!70137 res!57883) b!70138))

(assert (= (and b!70138 (not res!57884)) b!70139))

(assert (=> b!70137 m!112013))

(assert (=> b!70137 m!111981))

(assert (=> b!70139 m!112013))

(assert (=> b!70139 m!112013))

(declare-fun m!112253 () Bool)

(assert (=> b!70139 m!112253))

(assert (=> b!69954 d!22494))

(declare-fun d!22496 () Bool)

(declare-fun e!45835 () Bool)

(assert (=> d!22496 e!45835))

(declare-fun res!58019 () Bool)

(assert (=> d!22496 (=> (not res!58019) (not e!45835))))

(declare-fun lt!113088 () tuple2!6092)

(declare-fun lt!113076 () (_ BitVec 64))

(assert (=> d!22496 (= res!58019 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!113088))) (currentByte!3443 (_2!3157 lt!113088)) (currentBit!3438 (_2!3157 lt!113088))) (bvsub lt!113076 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22496 (or (= (bvand lt!113076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113076 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!113060 () (_ BitVec 64))

(assert (=> d!22496 (= lt!113076 (bvadd lt!113060 to!314))))

(assert (=> d!22496 (or (not (= (bvand lt!113060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!113060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!113060 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22496 (= lt!113060 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(declare-fun e!45834 () tuple2!6092)

(assert (=> d!22496 (= lt!113088 e!45834)))

(declare-fun c!5248 () Bool)

(assert (=> d!22496 (= c!5248 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!113058 () Unit!4689)

(declare-fun lt!113091 () Unit!4689)

(assert (=> d!22496 (= lt!113058 lt!113091)))

(assert (=> d!22496 (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!112398))))

(assert (=> d!22496 (= lt!113091 (lemmaIsPrefixRefl!0 (_2!3157 lt!112398)))))

(declare-fun lt!113094 () (_ BitVec 64))

(assert (=> d!22496 (= lt!113094 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(assert (=> d!22496 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22496 (= (appendBitsMSBFirstLoop!0 (_2!3157 lt!112398) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!113088)))

(declare-fun b!70320 () Bool)

(declare-fun e!45836 () Bool)

(declare-fun lt!113068 () (_ BitVec 64))

(assert (=> b!70320 (= e!45836 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!113068))))

(declare-fun b!70321 () Bool)

(declare-fun Unit!4703 () Unit!4689)

(assert (=> b!70321 (= e!45834 (tuple2!6093 Unit!4703 (_2!3157 lt!112398)))))

(assert (=> b!70321 (= (size!1354 (buf!1735 (_2!3157 lt!112398))) (size!1354 (buf!1735 (_2!3157 lt!112398))))))

(declare-fun lt!113085 () Unit!4689)

(declare-fun Unit!4704 () Unit!4689)

(assert (=> b!70321 (= lt!113085 Unit!4704)))

(declare-fun call!910 () tuple2!6094)

(declare-fun checkByteArrayBitContent!0 (BitStream!2306 array!2912 array!2912 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70321 (checkByteArrayBitContent!0 (_2!3157 lt!112398) srcBuffer!2 (_1!3166 (readBits!0 (_1!3158 call!910) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!70322 () Bool)

(declare-fun res!58018 () Bool)

(assert (=> b!70322 (=> (not res!58018) (not e!45835))))

(assert (=> b!70322 (= res!58018 (= (size!1354 (buf!1735 (_2!3157 lt!112398))) (size!1354 (buf!1735 (_2!3157 lt!113088)))))))

(declare-fun b!70323 () Bool)

(declare-fun lt!113072 () tuple2!6092)

(declare-fun Unit!4705 () Unit!4689)

(assert (=> b!70323 (= e!45834 (tuple2!6093 Unit!4705 (_2!3157 lt!113072)))))

(declare-fun lt!113090 () tuple2!6092)

(assert (=> b!70323 (= lt!113090 (appendBitFromByte!0 (_2!3157 lt!112398) (select (arr!1936 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!113098 () (_ BitVec 64))

(assert (=> b!70323 (= lt!113098 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113069 () (_ BitVec 64))

(assert (=> b!70323 (= lt!113069 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113073 () Unit!4689)

(assert (=> b!70323 (= lt!113073 (validateOffsetBitsIneqLemma!0 (_2!3157 lt!112398) (_2!3157 lt!113090) lt!113098 lt!113069))))

(assert (=> b!70323 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!113090)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!113090))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!113090))) (bvsub lt!113098 lt!113069))))

(declare-fun lt!113092 () Unit!4689)

(assert (=> b!70323 (= lt!113092 lt!113073)))

(declare-fun lt!113084 () tuple2!6094)

(assert (=> b!70323 (= lt!113084 (reader!0 (_2!3157 lt!112398) (_2!3157 lt!113090)))))

(declare-fun lt!113059 () (_ BitVec 64))

(assert (=> b!70323 (= lt!113059 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113097 () Unit!4689)

(assert (=> b!70323 (= lt!113097 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3157 lt!112398) (buf!1735 (_2!3157 lt!113090)) lt!113059))))

(assert (=> b!70323 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!113090)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!113059)))

(declare-fun lt!113096 () Unit!4689)

(assert (=> b!70323 (= lt!113096 lt!113097)))

(assert (=> b!70323 (= (head!547 (byteArrayBitContentToList!0 (_2!3157 lt!113090) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!547 (bitStreamReadBitsIntoList!0 (_2!3157 lt!113090) (_1!3158 lt!113084) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!113066 () Unit!4689)

(declare-fun Unit!4706 () Unit!4689)

(assert (=> b!70323 (= lt!113066 Unit!4706)))

(assert (=> b!70323 (= lt!113072 (appendBitsMSBFirstLoop!0 (_2!3157 lt!113090) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!113062 () Unit!4689)

(assert (=> b!70323 (= lt!113062 (lemmaIsPrefixTransitive!0 (_2!3157 lt!112398) (_2!3157 lt!113090) (_2!3157 lt!113072)))))

(assert (=> b!70323 (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!113072))))

(declare-fun lt!113099 () Unit!4689)

(assert (=> b!70323 (= lt!113099 lt!113062)))

(assert (=> b!70323 (= (size!1354 (buf!1735 (_2!3157 lt!113072))) (size!1354 (buf!1735 (_2!3157 lt!112398))))))

(declare-fun lt!113083 () Unit!4689)

(declare-fun Unit!4707 () Unit!4689)

(assert (=> b!70323 (= lt!113083 Unit!4707)))

(assert (=> b!70323 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!113072))) (currentByte!3443 (_2!3157 lt!113072)) (currentBit!3438 (_2!3157 lt!113072))) (bvsub (bvadd (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113070 () Unit!4689)

(declare-fun Unit!4708 () Unit!4689)

(assert (=> b!70323 (= lt!113070 Unit!4708)))

(assert (=> b!70323 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!113072))) (currentByte!3443 (_2!3157 lt!113072)) (currentBit!3438 (_2!3157 lt!113072))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!113090))) (currentByte!3443 (_2!3157 lt!113090)) (currentBit!3438 (_2!3157 lt!113090))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113074 () Unit!4689)

(declare-fun Unit!4709 () Unit!4689)

(assert (=> b!70323 (= lt!113074 Unit!4709)))

(declare-fun lt!113086 () tuple2!6094)

(assert (=> b!70323 (= lt!113086 (reader!0 (_2!3157 lt!112398) (_2!3157 lt!113072)))))

(declare-fun lt!113081 () (_ BitVec 64))

(assert (=> b!70323 (= lt!113081 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113095 () Unit!4689)

(assert (=> b!70323 (= lt!113095 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3157 lt!112398) (buf!1735 (_2!3157 lt!113072)) lt!113081))))

(assert (=> b!70323 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!113072)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!113081)))

(declare-fun lt!113063 () Unit!4689)

(assert (=> b!70323 (= lt!113063 lt!113095)))

(declare-fun lt!113078 () tuple2!6094)

(assert (=> b!70323 (= lt!113078 call!910)))

(declare-fun lt!113089 () (_ BitVec 64))

(assert (=> b!70323 (= lt!113089 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113100 () Unit!4689)

(assert (=> b!70323 (= lt!113100 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3157 lt!113090) (buf!1735 (_2!3157 lt!113072)) lt!113089))))

(assert (=> b!70323 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!113072)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!113090))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!113090))) lt!113089)))

(declare-fun lt!113080 () Unit!4689)

(assert (=> b!70323 (= lt!113080 lt!113100)))

(declare-fun lt!113087 () List!728)

(assert (=> b!70323 (= lt!113087 (byteArrayBitContentToList!0 (_2!3157 lt!113072) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!113075 () List!728)

(assert (=> b!70323 (= lt!113075 (byteArrayBitContentToList!0 (_2!3157 lt!113072) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!113061 () List!728)

(assert (=> b!70323 (= lt!113061 (bitStreamReadBitsIntoList!0 (_2!3157 lt!113072) (_1!3158 lt!113086) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!113065 () List!728)

(assert (=> b!70323 (= lt!113065 (bitStreamReadBitsIntoList!0 (_2!3157 lt!113072) (_1!3158 lt!113078) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!113067 () (_ BitVec 64))

(assert (=> b!70323 (= lt!113067 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!113101 () Unit!4689)

(assert (=> b!70323 (= lt!113101 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3157 lt!113072) (_2!3157 lt!113072) (_1!3158 lt!113086) (_1!3158 lt!113078) lt!113067 lt!113061))))

(assert (=> b!70323 (= (bitStreamReadBitsIntoList!0 (_2!3157 lt!113072) (_1!3158 lt!113078) (bvsub lt!113067 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!332 lt!113061))))

(declare-fun lt!113079 () Unit!4689)

(assert (=> b!70323 (= lt!113079 lt!113101)))

(declare-fun lt!113093 () Unit!4689)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2912 array!2912 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4689)

(assert (=> b!70323 (= lt!113093 (arrayBitRangesEqImpliesEq!0 (buf!1735 (_2!3157 lt!113090)) (buf!1735 (_2!3157 lt!113072)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113094 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!113090))) (currentByte!3443 (_2!3157 lt!113090)) (currentBit!3438 (_2!3157 lt!113090)))))))

(assert (=> b!70323 (= (bitAt!0 (buf!1735 (_2!3157 lt!113090)) lt!113094) (bitAt!0 (buf!1735 (_2!3157 lt!113072)) lt!113094))))

(declare-fun lt!113071 () Unit!4689)

(assert (=> b!70323 (= lt!113071 lt!113093)))

(declare-fun lt!113064 () tuple2!6094)

(declare-fun b!70324 () Bool)

(assert (=> b!70324 (= e!45835 (= (bitStreamReadBitsIntoList!0 (_2!3157 lt!113088) (_1!3158 lt!113064) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3157 lt!113088) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!70324 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70324 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!113082 () Unit!4689)

(declare-fun lt!113077 () Unit!4689)

(assert (=> b!70324 (= lt!113082 lt!113077)))

(assert (=> b!70324 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!113088)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!113068)))

(assert (=> b!70324 (= lt!113077 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3157 lt!112398) (buf!1735 (_2!3157 lt!113088)) lt!113068))))

(assert (=> b!70324 e!45836))

(declare-fun res!58017 () Bool)

(assert (=> b!70324 (=> (not res!58017) (not e!45836))))

(assert (=> b!70324 (= res!58017 (and (= (size!1354 (buf!1735 (_2!3157 lt!112398))) (size!1354 (buf!1735 (_2!3157 lt!113088)))) (bvsge lt!113068 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70324 (= lt!113068 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!70324 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70324 (= lt!113064 (reader!0 (_2!3157 lt!112398) (_2!3157 lt!113088)))))

(declare-fun b!70325 () Bool)

(declare-fun res!58021 () Bool)

(assert (=> b!70325 (=> (not res!58021) (not e!45835))))

(assert (=> b!70325 (= res!58021 (= (size!1354 (buf!1735 (_2!3157 lt!113088))) (size!1354 (buf!1735 (_2!3157 lt!112398)))))))

(declare-fun b!70326 () Bool)

(declare-fun res!58020 () Bool)

(assert (=> b!70326 (=> (not res!58020) (not e!45835))))

(assert (=> b!70326 (= res!58020 (invariant!0 (currentBit!3438 (_2!3157 lt!113088)) (currentByte!3443 (_2!3157 lt!113088)) (size!1354 (buf!1735 (_2!3157 lt!113088)))))))

(declare-fun b!70327 () Bool)

(declare-fun res!58016 () Bool)

(assert (=> b!70327 (=> (not res!58016) (not e!45835))))

(assert (=> b!70327 (= res!58016 (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!113088)))))

(declare-fun bm!907 () Bool)

(assert (=> bm!907 (= call!910 (reader!0 (ite c!5248 (_2!3157 lt!113090) (_2!3157 lt!112398)) (ite c!5248 (_2!3157 lt!113072) (_2!3157 lt!112398))))))

(assert (= (and d!22496 c!5248) b!70323))

(assert (= (and d!22496 (not c!5248)) b!70321))

(assert (= (or b!70323 b!70321) bm!907))

(assert (= (and d!22496 res!58019) b!70326))

(assert (= (and b!70326 res!58020) b!70322))

(assert (= (and b!70322 res!58018) b!70327))

(assert (= (and b!70327 res!58016) b!70325))

(assert (= (and b!70325 res!58021) b!70324))

(assert (= (and b!70324 res!58017) b!70320))

(declare-fun m!112535 () Bool)

(assert (=> b!70327 m!112535))

(declare-fun m!112537 () Bool)

(assert (=> bm!907 m!112537))

(declare-fun m!112539 () Bool)

(assert (=> b!70323 m!112539))

(declare-fun m!112541 () Bool)

(assert (=> b!70323 m!112541))

(assert (=> b!70323 m!111997))

(declare-fun m!112543 () Bool)

(assert (=> b!70323 m!112543))

(declare-fun m!112545 () Bool)

(assert (=> b!70323 m!112545))

(declare-fun m!112547 () Bool)

(assert (=> b!70323 m!112547))

(declare-fun m!112549 () Bool)

(assert (=> b!70323 m!112549))

(declare-fun m!112551 () Bool)

(assert (=> b!70323 m!112551))

(declare-fun m!112553 () Bool)

(assert (=> b!70323 m!112553))

(declare-fun m!112555 () Bool)

(assert (=> b!70323 m!112555))

(declare-fun m!112557 () Bool)

(assert (=> b!70323 m!112557))

(declare-fun m!112559 () Bool)

(assert (=> b!70323 m!112559))

(declare-fun m!112561 () Bool)

(assert (=> b!70323 m!112561))

(declare-fun m!112563 () Bool)

(assert (=> b!70323 m!112563))

(declare-fun m!112565 () Bool)

(assert (=> b!70323 m!112565))

(declare-fun m!112567 () Bool)

(assert (=> b!70323 m!112567))

(declare-fun m!112569 () Bool)

(assert (=> b!70323 m!112569))

(declare-fun m!112571 () Bool)

(assert (=> b!70323 m!112571))

(declare-fun m!112573 () Bool)

(assert (=> b!70323 m!112573))

(declare-fun m!112575 () Bool)

(assert (=> b!70323 m!112575))

(declare-fun m!112577 () Bool)

(assert (=> b!70323 m!112577))

(declare-fun m!112579 () Bool)

(assert (=> b!70323 m!112579))

(declare-fun m!112581 () Bool)

(assert (=> b!70323 m!112581))

(declare-fun m!112583 () Bool)

(assert (=> b!70323 m!112583))

(declare-fun m!112585 () Bool)

(assert (=> b!70323 m!112585))

(declare-fun m!112587 () Bool)

(assert (=> b!70323 m!112587))

(declare-fun m!112589 () Bool)

(assert (=> b!70323 m!112589))

(declare-fun m!112591 () Bool)

(assert (=> b!70323 m!112591))

(assert (=> b!70323 m!112573))

(declare-fun m!112593 () Bool)

(assert (=> b!70323 m!112593))

(declare-fun m!112595 () Bool)

(assert (=> b!70323 m!112595))

(assert (=> b!70323 m!112583))

(assert (=> b!70323 m!112589))

(declare-fun m!112597 () Bool)

(assert (=> b!70323 m!112597))

(declare-fun m!112599 () Bool)

(assert (=> b!70323 m!112599))

(assert (=> b!70323 m!112545))

(declare-fun m!112601 () Bool)

(assert (=> b!70326 m!112601))

(declare-fun m!112603 () Bool)

(assert (=> b!70321 m!112603))

(declare-fun m!112605 () Bool)

(assert (=> b!70321 m!112605))

(declare-fun m!112607 () Bool)

(assert (=> b!70324 m!112607))

(declare-fun m!112609 () Bool)

(assert (=> b!70324 m!112609))

(declare-fun m!112611 () Bool)

(assert (=> b!70324 m!112611))

(declare-fun m!112613 () Bool)

(assert (=> b!70324 m!112613))

(declare-fun m!112615 () Bool)

(assert (=> b!70324 m!112615))

(declare-fun m!112617 () Bool)

(assert (=> b!70320 m!112617))

(declare-fun m!112619 () Bool)

(assert (=> d!22496 m!112619))

(assert (=> d!22496 m!111997))

(declare-fun m!112621 () Bool)

(assert (=> d!22496 m!112621))

(declare-fun m!112623 () Bool)

(assert (=> d!22496 m!112623))

(assert (=> b!69954 d!22496))

(declare-fun b!70338 () Bool)

(declare-fun res!58029 () Bool)

(declare-fun e!45842 () Bool)

(assert (=> b!70338 (=> (not res!58029) (not e!45842))))

(declare-fun lt!113158 () tuple2!6094)

(assert (=> b!70338 (= res!58029 (isPrefixOf!0 (_2!3158 lt!113158) (_2!3157 lt!112398)))))

(declare-fun b!70339 () Bool)

(declare-fun res!58030 () Bool)

(assert (=> b!70339 (=> (not res!58030) (not e!45842))))

(assert (=> b!70339 (= res!58030 (isPrefixOf!0 (_1!3158 lt!113158) thiss!1379))))

(declare-fun b!70340 () Bool)

(declare-fun e!45841 () Unit!4689)

(declare-fun lt!113157 () Unit!4689)

(assert (=> b!70340 (= e!45841 lt!113157)))

(declare-fun lt!113161 () (_ BitVec 64))

(assert (=> b!70340 (= lt!113161 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113151 () (_ BitVec 64))

(assert (=> b!70340 (= lt!113151 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2912 array!2912 (_ BitVec 64) (_ BitVec 64)) Unit!4689)

(assert (=> b!70340 (= lt!113157 (arrayBitRangesEqSymmetric!0 (buf!1735 thiss!1379) (buf!1735 (_2!3157 lt!112398)) lt!113161 lt!113151))))

(assert (=> b!70340 (arrayBitRangesEq!0 (buf!1735 (_2!3157 lt!112398)) (buf!1735 thiss!1379) lt!113161 lt!113151)))

(declare-fun d!22584 () Bool)

(assert (=> d!22584 e!45842))

(declare-fun res!58028 () Bool)

(assert (=> d!22584 (=> (not res!58028) (not e!45842))))

(assert (=> d!22584 (= res!58028 (isPrefixOf!0 (_1!3158 lt!113158) (_2!3158 lt!113158)))))

(declare-fun lt!113143 () BitStream!2306)

(assert (=> d!22584 (= lt!113158 (tuple2!6095 lt!113143 (_2!3157 lt!112398)))))

(declare-fun lt!113149 () Unit!4689)

(declare-fun lt!113152 () Unit!4689)

(assert (=> d!22584 (= lt!113149 lt!113152)))

(assert (=> d!22584 (isPrefixOf!0 lt!113143 (_2!3157 lt!112398))))

(assert (=> d!22584 (= lt!113152 (lemmaIsPrefixTransitive!0 lt!113143 (_2!3157 lt!112398) (_2!3157 lt!112398)))))

(declare-fun lt!113160 () Unit!4689)

(declare-fun lt!113147 () Unit!4689)

(assert (=> d!22584 (= lt!113160 lt!113147)))

(assert (=> d!22584 (isPrefixOf!0 lt!113143 (_2!3157 lt!112398))))

(assert (=> d!22584 (= lt!113147 (lemmaIsPrefixTransitive!0 lt!113143 thiss!1379 (_2!3157 lt!112398)))))

(declare-fun lt!113145 () Unit!4689)

(assert (=> d!22584 (= lt!113145 e!45841)))

(declare-fun c!5251 () Bool)

(assert (=> d!22584 (= c!5251 (not (= (size!1354 (buf!1735 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!113146 () Unit!4689)

(declare-fun lt!113150 () Unit!4689)

(assert (=> d!22584 (= lt!113146 lt!113150)))

(assert (=> d!22584 (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!112398))))

(assert (=> d!22584 (= lt!113150 (lemmaIsPrefixRefl!0 (_2!3157 lt!112398)))))

(declare-fun lt!113159 () Unit!4689)

(declare-fun lt!113156 () Unit!4689)

(assert (=> d!22584 (= lt!113159 lt!113156)))

(assert (=> d!22584 (= lt!113156 (lemmaIsPrefixRefl!0 (_2!3157 lt!112398)))))

(declare-fun lt!113155 () Unit!4689)

(declare-fun lt!113148 () Unit!4689)

(assert (=> d!22584 (= lt!113155 lt!113148)))

(assert (=> d!22584 (isPrefixOf!0 lt!113143 lt!113143)))

(assert (=> d!22584 (= lt!113148 (lemmaIsPrefixRefl!0 lt!113143))))

(declare-fun lt!113144 () Unit!4689)

(declare-fun lt!113142 () Unit!4689)

(assert (=> d!22584 (= lt!113144 lt!113142)))

(assert (=> d!22584 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22584 (= lt!113142 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22584 (= lt!113143 (BitStream!2307 (buf!1735 (_2!3157 lt!112398)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(assert (=> d!22584 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112398))))

(assert (=> d!22584 (= (reader!0 thiss!1379 (_2!3157 lt!112398)) lt!113158)))

(declare-fun b!70341 () Bool)

(declare-fun Unit!4717 () Unit!4689)

(assert (=> b!70341 (= e!45841 Unit!4717)))

(declare-fun lt!113154 () (_ BitVec 64))

(declare-fun b!70342 () Bool)

(declare-fun lt!113153 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2306 (_ BitVec 64)) BitStream!2306)

(assert (=> b!70342 (= e!45842 (= (_1!3158 lt!113158) (withMovedBitIndex!0 (_2!3158 lt!113158) (bvsub lt!113153 lt!113154))))))

(assert (=> b!70342 (or (= (bvand lt!113153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113153 lt!113154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70342 (= lt!113154 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(assert (=> b!70342 (= lt!113153 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(assert (= (and d!22584 c!5251) b!70340))

(assert (= (and d!22584 (not c!5251)) b!70341))

(assert (= (and d!22584 res!58028) b!70339))

(assert (= (and b!70339 res!58030) b!70338))

(assert (= (and b!70338 res!58029) b!70342))

(declare-fun m!112625 () Bool)

(assert (=> b!70339 m!112625))

(declare-fun m!112627 () Bool)

(assert (=> d!22584 m!112627))

(assert (=> d!22584 m!112621))

(declare-fun m!112629 () Bool)

(assert (=> d!22584 m!112629))

(declare-fun m!112631 () Bool)

(assert (=> d!22584 m!112631))

(declare-fun m!112633 () Bool)

(assert (=> d!22584 m!112633))

(assert (=> d!22584 m!112009))

(assert (=> d!22584 m!112623))

(assert (=> d!22584 m!112011))

(declare-fun m!112635 () Bool)

(assert (=> d!22584 m!112635))

(declare-fun m!112637 () Bool)

(assert (=> d!22584 m!112637))

(assert (=> d!22584 m!111993))

(declare-fun m!112639 () Bool)

(assert (=> b!70342 m!112639))

(assert (=> b!70342 m!111997))

(assert (=> b!70342 m!112013))

(assert (=> b!70340 m!112013))

(declare-fun m!112641 () Bool)

(assert (=> b!70340 m!112641))

(declare-fun m!112643 () Bool)

(assert (=> b!70340 m!112643))

(declare-fun m!112645 () Bool)

(assert (=> b!70338 m!112645))

(assert (=> b!69954 d!22584))

(declare-fun d!22586 () Bool)

(assert (=> d!22586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113184 () Unit!4689)

(declare-fun choose!9 (BitStream!2306 array!2912 (_ BitVec 64) BitStream!2306) Unit!4689)

(assert (=> d!22586 (= lt!113184 (choose!9 thiss!1379 (buf!1735 (_2!3157 lt!112398)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2307 (buf!1735 (_2!3157 lt!112398)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379))))))

(assert (=> d!22586 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1735 (_2!3157 lt!112398)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!113184)))

(declare-fun bs!5414 () Bool)

(assert (= bs!5414 d!22586))

(assert (=> bs!5414 m!112025))

(declare-fun m!112647 () Bool)

(assert (=> bs!5414 m!112647))

(assert (=> b!69954 d!22586))

(declare-fun d!22588 () Bool)

(assert (=> d!22588 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5415 () Bool)

(assert (= bs!5415 d!22588))

(declare-fun m!112649 () Bool)

(assert (=> bs!5415 m!112649))

(assert (=> b!69954 d!22588))

(declare-fun d!22590 () Bool)

(assert (=> d!22590 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!112396) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398)))) lt!112396))))

(declare-fun bs!5416 () Bool)

(assert (= bs!5416 d!22590))

(declare-fun m!112651 () Bool)

(assert (=> bs!5416 m!112651))

(assert (=> b!69964 d!22590))

(declare-fun d!22592 () Bool)

(assert (=> d!22592 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5417 () Bool)

(assert (= bs!5417 d!22592))

(declare-fun m!112653 () Bool)

(assert (=> bs!5417 m!112653))

(assert (=> b!69964 d!22592))

(declare-fun b!70347 () Bool)

(declare-fun res!58032 () Bool)

(declare-fun e!45846 () Bool)

(assert (=> b!70347 (=> (not res!58032) (not e!45846))))

(declare-fun lt!113211 () tuple2!6094)

(assert (=> b!70347 (= res!58032 (isPrefixOf!0 (_2!3158 lt!113211) (_2!3157 lt!112386)))))

(declare-fun b!70348 () Bool)

(declare-fun res!58033 () Bool)

(assert (=> b!70348 (=> (not res!58033) (not e!45846))))

(assert (=> b!70348 (= res!58033 (isPrefixOf!0 (_1!3158 lt!113211) thiss!1379))))

(declare-fun b!70349 () Bool)

(declare-fun e!45845 () Unit!4689)

(declare-fun lt!113210 () Unit!4689)

(assert (=> b!70349 (= e!45845 lt!113210)))

(declare-fun lt!113214 () (_ BitVec 64))

(assert (=> b!70349 (= lt!113214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113204 () (_ BitVec 64))

(assert (=> b!70349 (= lt!113204 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(assert (=> b!70349 (= lt!113210 (arrayBitRangesEqSymmetric!0 (buf!1735 thiss!1379) (buf!1735 (_2!3157 lt!112386)) lt!113214 lt!113204))))

(assert (=> b!70349 (arrayBitRangesEq!0 (buf!1735 (_2!3157 lt!112386)) (buf!1735 thiss!1379) lt!113214 lt!113204)))

(declare-fun d!22594 () Bool)

(assert (=> d!22594 e!45846))

(declare-fun res!58031 () Bool)

(assert (=> d!22594 (=> (not res!58031) (not e!45846))))

(assert (=> d!22594 (= res!58031 (isPrefixOf!0 (_1!3158 lt!113211) (_2!3158 lt!113211)))))

(declare-fun lt!113196 () BitStream!2306)

(assert (=> d!22594 (= lt!113211 (tuple2!6095 lt!113196 (_2!3157 lt!112386)))))

(declare-fun lt!113202 () Unit!4689)

(declare-fun lt!113205 () Unit!4689)

(assert (=> d!22594 (= lt!113202 lt!113205)))

(assert (=> d!22594 (isPrefixOf!0 lt!113196 (_2!3157 lt!112386))))

(assert (=> d!22594 (= lt!113205 (lemmaIsPrefixTransitive!0 lt!113196 (_2!3157 lt!112386) (_2!3157 lt!112386)))))

(declare-fun lt!113213 () Unit!4689)

(declare-fun lt!113200 () Unit!4689)

(assert (=> d!22594 (= lt!113213 lt!113200)))

(assert (=> d!22594 (isPrefixOf!0 lt!113196 (_2!3157 lt!112386))))

(assert (=> d!22594 (= lt!113200 (lemmaIsPrefixTransitive!0 lt!113196 thiss!1379 (_2!3157 lt!112386)))))

(declare-fun lt!113198 () Unit!4689)

(assert (=> d!22594 (= lt!113198 e!45845)))

(declare-fun c!5254 () Bool)

(assert (=> d!22594 (= c!5254 (not (= (size!1354 (buf!1735 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!113199 () Unit!4689)

(declare-fun lt!113203 () Unit!4689)

(assert (=> d!22594 (= lt!113199 lt!113203)))

(assert (=> d!22594 (isPrefixOf!0 (_2!3157 lt!112386) (_2!3157 lt!112386))))

(assert (=> d!22594 (= lt!113203 (lemmaIsPrefixRefl!0 (_2!3157 lt!112386)))))

(declare-fun lt!113212 () Unit!4689)

(declare-fun lt!113209 () Unit!4689)

(assert (=> d!22594 (= lt!113212 lt!113209)))

(assert (=> d!22594 (= lt!113209 (lemmaIsPrefixRefl!0 (_2!3157 lt!112386)))))

(declare-fun lt!113208 () Unit!4689)

(declare-fun lt!113201 () Unit!4689)

(assert (=> d!22594 (= lt!113208 lt!113201)))

(assert (=> d!22594 (isPrefixOf!0 lt!113196 lt!113196)))

(assert (=> d!22594 (= lt!113201 (lemmaIsPrefixRefl!0 lt!113196))))

(declare-fun lt!113197 () Unit!4689)

(declare-fun lt!113195 () Unit!4689)

(assert (=> d!22594 (= lt!113197 lt!113195)))

(assert (=> d!22594 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22594 (= lt!113195 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22594 (= lt!113196 (BitStream!2307 (buf!1735 (_2!3157 lt!112386)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(assert (=> d!22594 (isPrefixOf!0 thiss!1379 (_2!3157 lt!112386))))

(assert (=> d!22594 (= (reader!0 thiss!1379 (_2!3157 lt!112386)) lt!113211)))

(declare-fun b!70350 () Bool)

(declare-fun Unit!4719 () Unit!4689)

(assert (=> b!70350 (= e!45845 Unit!4719)))

(declare-fun lt!113207 () (_ BitVec 64))

(declare-fun lt!113206 () (_ BitVec 64))

(declare-fun b!70351 () Bool)

(assert (=> b!70351 (= e!45846 (= (_1!3158 lt!113211) (withMovedBitIndex!0 (_2!3158 lt!113211) (bvsub lt!113206 lt!113207))))))

(assert (=> b!70351 (or (= (bvand lt!113206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113206 lt!113207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70351 (= lt!113207 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112386))) (currentByte!3443 (_2!3157 lt!112386)) (currentBit!3438 (_2!3157 lt!112386))))))

(assert (=> b!70351 (= lt!113206 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)))))

(assert (= (and d!22594 c!5254) b!70349))

(assert (= (and d!22594 (not c!5254)) b!70350))

(assert (= (and d!22594 res!58031) b!70348))

(assert (= (and b!70348 res!58033) b!70347))

(assert (= (and b!70347 res!58032) b!70351))

(declare-fun m!112655 () Bool)

(assert (=> b!70348 m!112655))

(declare-fun m!112657 () Bool)

(assert (=> d!22594 m!112657))

(declare-fun m!112659 () Bool)

(assert (=> d!22594 m!112659))

(declare-fun m!112661 () Bool)

(assert (=> d!22594 m!112661))

(declare-fun m!112663 () Bool)

(assert (=> d!22594 m!112663))

(declare-fun m!112665 () Bool)

(assert (=> d!22594 m!112665))

(assert (=> d!22594 m!112009))

(declare-fun m!112667 () Bool)

(assert (=> d!22594 m!112667))

(assert (=> d!22594 m!112011))

(declare-fun m!112669 () Bool)

(assert (=> d!22594 m!112669))

(declare-fun m!112671 () Bool)

(assert (=> d!22594 m!112671))

(assert (=> d!22594 m!112017))

(declare-fun m!112673 () Bool)

(assert (=> b!70351 m!112673))

(assert (=> b!70351 m!111981))

(assert (=> b!70351 m!112013))

(assert (=> b!70349 m!112013))

(declare-fun m!112675 () Bool)

(assert (=> b!70349 m!112675))

(declare-fun m!112677 () Bool)

(assert (=> b!70349 m!112677))

(declare-fun m!112679 () Bool)

(assert (=> b!70347 m!112679))

(assert (=> b!69964 d!22594))

(declare-fun d!22596 () Bool)

(declare-fun e!45848 () Bool)

(assert (=> d!22596 e!45848))

(declare-fun c!5256 () Bool)

(assert (=> d!22596 (= c!5256 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!113228 () List!728)

(declare-fun e!45847 () tuple2!6112)

(assert (=> d!22596 (= lt!113228 (_1!3169 e!45847))))

(declare-fun c!5255 () Bool)

(assert (=> d!22596 (= c!5255 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22596 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22596 (= (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_1!3158 lt!112391) (bvsub to!314 i!635)) lt!113228)))

(declare-fun b!70353 () Bool)

(declare-fun lt!113227 () tuple2!6114)

(declare-fun lt!113229 () (_ BitVec 64))

(assert (=> b!70353 (= e!45847 (tuple2!6113 (Cons!724 (_1!3170 lt!113227) (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_2!3170 lt!113227) (bvsub (bvsub to!314 i!635) lt!113229))) (_2!3170 lt!113227)))))

(assert (=> b!70353 (= lt!113227 (readBit!0 (_1!3158 lt!112391)))))

(assert (=> b!70353 (= lt!113229 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70354 () Bool)

(assert (=> b!70354 (= e!45848 (isEmpty!227 lt!113228))))

(declare-fun b!70355 () Bool)

(assert (=> b!70355 (= e!45848 (> (length!356 lt!113228) 0))))

(declare-fun b!70352 () Bool)

(assert (=> b!70352 (= e!45847 (tuple2!6113 Nil!725 (_1!3158 lt!112391)))))

(assert (= (and d!22596 c!5255) b!70352))

(assert (= (and d!22596 (not c!5255)) b!70353))

(assert (= (and d!22596 c!5256) b!70354))

(assert (= (and d!22596 (not c!5256)) b!70355))

(declare-fun m!112681 () Bool)

(assert (=> b!70353 m!112681))

(declare-fun m!112683 () Bool)

(assert (=> b!70353 m!112683))

(declare-fun m!112685 () Bool)

(assert (=> b!70354 m!112685))

(declare-fun m!112687 () Bool)

(assert (=> b!70355 m!112687))

(assert (=> b!69964 d!22596))

(declare-fun b!70356 () Bool)

(declare-fun res!58035 () Bool)

(declare-fun e!45850 () Bool)

(assert (=> b!70356 (=> (not res!58035) (not e!45850))))

(declare-fun lt!113258 () tuple2!6094)

(assert (=> b!70356 (= res!58035 (isPrefixOf!0 (_2!3158 lt!113258) (_2!3157 lt!112386)))))

(declare-fun b!70357 () Bool)

(declare-fun res!58036 () Bool)

(assert (=> b!70357 (=> (not res!58036) (not e!45850))))

(assert (=> b!70357 (= res!58036 (isPrefixOf!0 (_1!3158 lt!113258) (_2!3157 lt!112398)))))

(declare-fun b!70358 () Bool)

(declare-fun e!45849 () Unit!4689)

(declare-fun lt!113257 () Unit!4689)

(assert (=> b!70358 (= e!45849 lt!113257)))

(declare-fun lt!113261 () (_ BitVec 64))

(assert (=> b!70358 (= lt!113261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113251 () (_ BitVec 64))

(assert (=> b!70358 (= lt!113251 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(assert (=> b!70358 (= lt!113257 (arrayBitRangesEqSymmetric!0 (buf!1735 (_2!3157 lt!112398)) (buf!1735 (_2!3157 lt!112386)) lt!113261 lt!113251))))

(assert (=> b!70358 (arrayBitRangesEq!0 (buf!1735 (_2!3157 lt!112386)) (buf!1735 (_2!3157 lt!112398)) lt!113261 lt!113251)))

(declare-fun d!22598 () Bool)

(assert (=> d!22598 e!45850))

(declare-fun res!58034 () Bool)

(assert (=> d!22598 (=> (not res!58034) (not e!45850))))

(assert (=> d!22598 (= res!58034 (isPrefixOf!0 (_1!3158 lt!113258) (_2!3158 lt!113258)))))

(declare-fun lt!113243 () BitStream!2306)

(assert (=> d!22598 (= lt!113258 (tuple2!6095 lt!113243 (_2!3157 lt!112386)))))

(declare-fun lt!113249 () Unit!4689)

(declare-fun lt!113252 () Unit!4689)

(assert (=> d!22598 (= lt!113249 lt!113252)))

(assert (=> d!22598 (isPrefixOf!0 lt!113243 (_2!3157 lt!112386))))

(assert (=> d!22598 (= lt!113252 (lemmaIsPrefixTransitive!0 lt!113243 (_2!3157 lt!112386) (_2!3157 lt!112386)))))

(declare-fun lt!113260 () Unit!4689)

(declare-fun lt!113247 () Unit!4689)

(assert (=> d!22598 (= lt!113260 lt!113247)))

(assert (=> d!22598 (isPrefixOf!0 lt!113243 (_2!3157 lt!112386))))

(assert (=> d!22598 (= lt!113247 (lemmaIsPrefixTransitive!0 lt!113243 (_2!3157 lt!112398) (_2!3157 lt!112386)))))

(declare-fun lt!113245 () Unit!4689)

(assert (=> d!22598 (= lt!113245 e!45849)))

(declare-fun c!5257 () Bool)

(assert (=> d!22598 (= c!5257 (not (= (size!1354 (buf!1735 (_2!3157 lt!112398))) #b00000000000000000000000000000000)))))

(declare-fun lt!113246 () Unit!4689)

(declare-fun lt!113250 () Unit!4689)

(assert (=> d!22598 (= lt!113246 lt!113250)))

(assert (=> d!22598 (isPrefixOf!0 (_2!3157 lt!112386) (_2!3157 lt!112386))))

(assert (=> d!22598 (= lt!113250 (lemmaIsPrefixRefl!0 (_2!3157 lt!112386)))))

(declare-fun lt!113259 () Unit!4689)

(declare-fun lt!113256 () Unit!4689)

(assert (=> d!22598 (= lt!113259 lt!113256)))

(assert (=> d!22598 (= lt!113256 (lemmaIsPrefixRefl!0 (_2!3157 lt!112386)))))

(declare-fun lt!113255 () Unit!4689)

(declare-fun lt!113248 () Unit!4689)

(assert (=> d!22598 (= lt!113255 lt!113248)))

(assert (=> d!22598 (isPrefixOf!0 lt!113243 lt!113243)))

(assert (=> d!22598 (= lt!113248 (lemmaIsPrefixRefl!0 lt!113243))))

(declare-fun lt!113244 () Unit!4689)

(declare-fun lt!113239 () Unit!4689)

(assert (=> d!22598 (= lt!113244 lt!113239)))

(assert (=> d!22598 (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!112398))))

(assert (=> d!22598 (= lt!113239 (lemmaIsPrefixRefl!0 (_2!3157 lt!112398)))))

(assert (=> d!22598 (= lt!113243 (BitStream!2307 (buf!1735 (_2!3157 lt!112386)) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(assert (=> d!22598 (isPrefixOf!0 (_2!3157 lt!112398) (_2!3157 lt!112386))))

(assert (=> d!22598 (= (reader!0 (_2!3157 lt!112398) (_2!3157 lt!112386)) lt!113258)))

(declare-fun b!70359 () Bool)

(declare-fun Unit!4720 () Unit!4689)

(assert (=> b!70359 (= e!45849 Unit!4720)))

(declare-fun b!70360 () Bool)

(declare-fun lt!113253 () (_ BitVec 64))

(declare-fun lt!113254 () (_ BitVec 64))

(assert (=> b!70360 (= e!45850 (= (_1!3158 lt!113258) (withMovedBitIndex!0 (_2!3158 lt!113258) (bvsub lt!113253 lt!113254))))))

(assert (=> b!70360 (or (= (bvand lt!113253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113253 lt!113254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70360 (= lt!113254 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112386))) (currentByte!3443 (_2!3157 lt!112386)) (currentBit!3438 (_2!3157 lt!112386))))))

(assert (=> b!70360 (= lt!113253 (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))))))

(assert (= (and d!22598 c!5257) b!70358))

(assert (= (and d!22598 (not c!5257)) b!70359))

(assert (= (and d!22598 res!58034) b!70357))

(assert (= (and b!70357 res!58036) b!70356))

(assert (= (and b!70356 res!58035) b!70360))

(declare-fun m!112689 () Bool)

(assert (=> b!70357 m!112689))

(declare-fun m!112691 () Bool)

(assert (=> d!22598 m!112691))

(assert (=> d!22598 m!112659))

(declare-fun m!112693 () Bool)

(assert (=> d!22598 m!112693))

(declare-fun m!112695 () Bool)

(assert (=> d!22598 m!112695))

(declare-fun m!112697 () Bool)

(assert (=> d!22598 m!112697))

(assert (=> d!22598 m!112621))

(assert (=> d!22598 m!112667))

(assert (=> d!22598 m!112623))

(declare-fun m!112699 () Bool)

(assert (=> d!22598 m!112699))

(declare-fun m!112701 () Bool)

(assert (=> d!22598 m!112701))

(assert (=> d!22598 m!112023))

(declare-fun m!112703 () Bool)

(assert (=> b!70360 m!112703))

(assert (=> b!70360 m!111981))

(assert (=> b!70360 m!111997))

(assert (=> b!70358 m!111997))

(declare-fun m!112705 () Bool)

(assert (=> b!70358 m!112705))

(declare-fun m!112707 () Bool)

(assert (=> b!70358 m!112707))

(declare-fun m!112709 () Bool)

(assert (=> b!70356 m!112709))

(assert (=> b!69964 d!22598))

(declare-fun d!22600 () Bool)

(assert (=> d!22600 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398))) lt!112396)))

(declare-fun lt!113284 () Unit!4689)

(assert (=> d!22600 (= lt!113284 (choose!9 (_2!3157 lt!112398) (buf!1735 (_2!3157 lt!112386)) lt!112396 (BitStream!2307 (buf!1735 (_2!3157 lt!112386)) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398)))))))

(assert (=> d!22600 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3157 lt!112398) (buf!1735 (_2!3157 lt!112386)) lt!112396) lt!113284)))

(declare-fun bs!5418 () Bool)

(assert (= bs!5418 d!22600))

(assert (=> bs!5418 m!111947))

(declare-fun m!112711 () Bool)

(assert (=> bs!5418 m!112711))

(assert (=> b!69964 d!22600))

(declare-fun d!22602 () Bool)

(declare-fun e!45852 () Bool)

(assert (=> d!22602 e!45852))

(declare-fun c!5259 () Bool)

(assert (=> d!22602 (= c!5259 (= lt!112396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!113286 () List!728)

(declare-fun e!45851 () tuple2!6112)

(assert (=> d!22602 (= lt!113286 (_1!3169 e!45851))))

(declare-fun c!5258 () Bool)

(assert (=> d!22602 (= c!5258 (= lt!112396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22602 (bvsge lt!112396 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22602 (= (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_1!3158 lt!112381) lt!112396) lt!113286)))

(declare-fun lt!113287 () (_ BitVec 64))

(declare-fun b!70362 () Bool)

(declare-fun lt!113285 () tuple2!6114)

(assert (=> b!70362 (= e!45851 (tuple2!6113 (Cons!724 (_1!3170 lt!113285) (bitStreamReadBitsIntoList!0 (_2!3157 lt!112386) (_2!3170 lt!113285) (bvsub lt!112396 lt!113287))) (_2!3170 lt!113285)))))

(assert (=> b!70362 (= lt!113285 (readBit!0 (_1!3158 lt!112381)))))

(assert (=> b!70362 (= lt!113287 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!70363 () Bool)

(assert (=> b!70363 (= e!45852 (isEmpty!227 lt!113286))))

(declare-fun b!70364 () Bool)

(assert (=> b!70364 (= e!45852 (> (length!356 lt!113286) 0))))

(declare-fun b!70361 () Bool)

(assert (=> b!70361 (= e!45851 (tuple2!6113 Nil!725 (_1!3158 lt!112381)))))

(assert (= (and d!22602 c!5258) b!70361))

(assert (= (and d!22602 (not c!5258)) b!70362))

(assert (= (and d!22602 c!5259) b!70363))

(assert (= (and d!22602 (not c!5259)) b!70364))

(declare-fun m!112713 () Bool)

(assert (=> b!70362 m!112713))

(declare-fun m!112715 () Bool)

(assert (=> b!70362 m!112715))

(declare-fun m!112717 () Bool)

(assert (=> b!70363 m!112717))

(declare-fun m!112719 () Bool)

(assert (=> b!70364 m!112719))

(assert (=> b!69964 d!22602))

(declare-fun d!22604 () Bool)

(assert (=> d!22604 (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!113288 () Unit!4689)

(assert (=> d!22604 (= lt!113288 (choose!9 thiss!1379 (buf!1735 (_2!3157 lt!112386)) (bvsub to!314 i!635) (BitStream!2307 (buf!1735 (_2!3157 lt!112386)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379))))))

(assert (=> d!22604 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1735 (_2!3157 lt!112386)) (bvsub to!314 i!635)) lt!113288)))

(declare-fun bs!5419 () Bool)

(assert (= bs!5419 d!22604))

(assert (=> bs!5419 m!111943))

(declare-fun m!112721 () Bool)

(assert (=> bs!5419 m!112721))

(assert (=> b!69964 d!22604))

(declare-fun d!22606 () Bool)

(assert (=> d!22606 (= (invariant!0 (currentBit!3438 (_2!3157 lt!112398)) (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112398)))) (and (bvsge (currentBit!3438 (_2!3157 lt!112398)) #b00000000000000000000000000000000) (bvslt (currentBit!3438 (_2!3157 lt!112398)) #b00000000000000000000000000001000) (bvsge (currentByte!3443 (_2!3157 lt!112398)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112398)))) (and (= (currentBit!3438 (_2!3157 lt!112398)) #b00000000000000000000000000000000) (= (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112398))))))))))

(assert (=> b!69947 d!22606))

(declare-fun d!22608 () Bool)

(assert (=> d!22608 (= (invariant!0 (currentBit!3438 (_2!3157 lt!112398)) (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112386)))) (and (bvsge (currentBit!3438 (_2!3157 lt!112398)) #b00000000000000000000000000000000) (bvslt (currentBit!3438 (_2!3157 lt!112398)) #b00000000000000000000000000001000) (bvsge (currentByte!3443 (_2!3157 lt!112398)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112386)))) (and (= (currentBit!3438 (_2!3157 lt!112398)) #b00000000000000000000000000000000) (= (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112386))))))))))

(assert (=> b!69958 d!22608))

(declare-fun d!22610 () Bool)

(declare-fun size!1357 (List!728) Int)

(assert (=> d!22610 (= (length!356 lt!112384) (size!1357 lt!112384))))

(declare-fun bs!5420 () Bool)

(assert (= bs!5420 d!22610))

(declare-fun m!112723 () Bool)

(assert (=> bs!5420 m!112723))

(assert (=> b!69946 d!22610))

(declare-fun d!22612 () Bool)

(assert (=> d!22612 (= (bitAt!0 (buf!1735 (_2!3157 lt!112398)) lt!112380) (not (= (bvand ((_ sign_extend 24) (select (arr!1936 (buf!1735 (_2!3157 lt!112398))) ((_ extract 31 0) (bvsdiv lt!112380 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!112380 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5421 () Bool)

(assert (= bs!5421 d!22612))

(declare-fun m!112725 () Bool)

(assert (=> bs!5421 m!112725))

(assert (=> bs!5421 m!112245))

(assert (=> b!69956 d!22612))

(declare-fun d!22614 () Bool)

(declare-fun e!45859 () Bool)

(assert (=> d!22614 e!45859))

(declare-fun res!58053 () Bool)

(assert (=> d!22614 (=> (not res!58053) (not e!45859))))

(declare-fun lt!113316 () (_ BitVec 64))

(declare-fun lt!113313 () (_ BitVec 64))

(declare-fun lt!113315 () (_ BitVec 64))

(assert (=> d!22614 (= res!58053 (= lt!113315 (bvsub lt!113316 lt!113313)))))

(assert (=> d!22614 (or (= (bvand lt!113316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113316 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113316 lt!113313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22614 (= lt!113313 (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112386))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112386)))))))

(declare-fun lt!113318 () (_ BitVec 64))

(declare-fun lt!113317 () (_ BitVec 64))

(assert (=> d!22614 (= lt!113316 (bvmul lt!113318 lt!113317))))

(assert (=> d!22614 (or (= lt!113318 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113317 (bvsdiv (bvmul lt!113318 lt!113317) lt!113318)))))

(assert (=> d!22614 (= lt!113317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22614 (= lt!113318 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))))))

(assert (=> d!22614 (= lt!113315 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112386))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112386)))))))

(assert (=> d!22614 (invariant!0 (currentBit!3438 (_2!3157 lt!112386)) (currentByte!3443 (_2!3157 lt!112386)) (size!1354 (buf!1735 (_2!3157 lt!112386))))))

(assert (=> d!22614 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112386))) (currentByte!3443 (_2!3157 lt!112386)) (currentBit!3438 (_2!3157 lt!112386))) lt!113315)))

(declare-fun b!70381 () Bool)

(declare-fun res!58054 () Bool)

(assert (=> b!70381 (=> (not res!58054) (not e!45859))))

(assert (=> b!70381 (= res!58054 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113315))))

(declare-fun b!70382 () Bool)

(declare-fun lt!113314 () (_ BitVec 64))

(assert (=> b!70382 (= e!45859 (bvsle lt!113315 (bvmul lt!113314 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70382 (or (= lt!113314 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113314 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113314)))))

(assert (=> b!70382 (= lt!113314 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112386)))))))

(assert (= (and d!22614 res!58053) b!70381))

(assert (= (and b!70381 res!58054) b!70382))

(declare-fun m!112727 () Bool)

(assert (=> d!22614 m!112727))

(assert (=> d!22614 m!111999))

(assert (=> b!69950 d!22614))

(declare-fun d!22616 () Bool)

(assert (=> d!22616 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1354 (buf!1735 thiss!1379))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 thiss!1379))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5422 () Bool)

(assert (= bs!5422 d!22616))

(declare-fun m!112729 () Bool)

(assert (=> bs!5422 m!112729))

(assert (=> b!69960 d!22616))

(declare-fun d!22618 () Bool)

(assert (=> d!22618 (= (array_inv!1212 srcBuffer!2) (bvsge (size!1354 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13648 d!22618))

(declare-fun d!22620 () Bool)

(assert (=> d!22620 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3438 thiss!1379) (currentByte!3443 thiss!1379) (size!1354 (buf!1735 thiss!1379))))))

(declare-fun bs!5423 () Bool)

(assert (= bs!5423 d!22620))

(declare-fun m!112731 () Bool)

(assert (=> bs!5423 m!112731))

(assert (=> start!13648 d!22620))

(declare-fun d!22622 () Bool)

(assert (=> d!22622 (= (invariant!0 (currentBit!3438 (_2!3157 lt!112386)) (currentByte!3443 (_2!3157 lt!112386)) (size!1354 (buf!1735 (_2!3157 lt!112386)))) (and (bvsge (currentBit!3438 (_2!3157 lt!112386)) #b00000000000000000000000000000000) (bvslt (currentBit!3438 (_2!3157 lt!112386)) #b00000000000000000000000000001000) (bvsge (currentByte!3443 (_2!3157 lt!112386)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3443 (_2!3157 lt!112386)) (size!1354 (buf!1735 (_2!3157 lt!112386)))) (and (= (currentBit!3438 (_2!3157 lt!112386)) #b00000000000000000000000000000000) (= (currentByte!3443 (_2!3157 lt!112386)) (size!1354 (buf!1735 (_2!3157 lt!112386))))))))))

(assert (=> b!69961 d!22622))

(declare-fun d!22624 () Bool)

(declare-fun res!58063 () Bool)

(declare-fun e!45863 () Bool)

(assert (=> d!22624 (=> (not res!58063) (not e!45863))))

(assert (=> d!22624 (= res!58063 (= (size!1354 (buf!1735 thiss!1379)) (size!1354 (buf!1735 thiss!1379))))))

(assert (=> d!22624 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!45863)))

(declare-fun b!70391 () Bool)

(declare-fun res!58061 () Bool)

(assert (=> b!70391 (=> (not res!58061) (not e!45863))))

(assert (=> b!70391 (= res!58061 (bvsle (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)) (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379))))))

(declare-fun b!70392 () Bool)

(declare-fun e!45864 () Bool)

(assert (=> b!70392 (= e!45863 e!45864)))

(declare-fun res!58062 () Bool)

(assert (=> b!70392 (=> res!58062 e!45864)))

(assert (=> b!70392 (= res!58062 (= (size!1354 (buf!1735 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70393 () Bool)

(assert (=> b!70393 (= e!45864 (arrayBitRangesEq!0 (buf!1735 thiss!1379) (buf!1735 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379))))))

(assert (= (and d!22624 res!58063) b!70391))

(assert (= (and b!70391 res!58061) b!70392))

(assert (= (and b!70392 (not res!58062)) b!70393))

(assert (=> b!70391 m!112013))

(assert (=> b!70391 m!112013))

(assert (=> b!70393 m!112013))

(assert (=> b!70393 m!112013))

(declare-fun m!112733 () Bool)

(assert (=> b!70393 m!112733))

(assert (=> b!69959 d!22624))

(declare-fun d!22626 () Bool)

(assert (=> d!22626 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113365 () Unit!4689)

(declare-fun choose!11 (BitStream!2306) Unit!4689)

(assert (=> d!22626 (= lt!113365 (choose!11 thiss!1379))))

(assert (=> d!22626 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!113365)))

(declare-fun bs!5425 () Bool)

(assert (= bs!5425 d!22626))

(assert (=> bs!5425 m!112009))

(declare-fun m!112769 () Bool)

(assert (=> bs!5425 m!112769))

(assert (=> b!69959 d!22626))

(declare-fun d!22628 () Bool)

(declare-fun e!45865 () Bool)

(assert (=> d!22628 e!45865))

(declare-fun res!58064 () Bool)

(assert (=> d!22628 (=> (not res!58064) (not e!45865))))

(declare-fun lt!113366 () (_ BitVec 64))

(declare-fun lt!113369 () (_ BitVec 64))

(declare-fun lt!113368 () (_ BitVec 64))

(assert (=> d!22628 (= res!58064 (= lt!113368 (bvsub lt!113369 lt!113366)))))

(assert (=> d!22628 (or (= (bvand lt!113369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113366 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113369 lt!113366) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22628 (= lt!113366 (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 thiss!1379))) ((_ sign_extend 32) (currentByte!3443 thiss!1379)) ((_ sign_extend 32) (currentBit!3438 thiss!1379))))))

(declare-fun lt!113371 () (_ BitVec 64))

(declare-fun lt!113370 () (_ BitVec 64))

(assert (=> d!22628 (= lt!113369 (bvmul lt!113371 lt!113370))))

(assert (=> d!22628 (or (= lt!113371 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113370 (bvsdiv (bvmul lt!113371 lt!113370) lt!113371)))))

(assert (=> d!22628 (= lt!113370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22628 (= lt!113371 ((_ sign_extend 32) (size!1354 (buf!1735 thiss!1379))))))

(assert (=> d!22628 (= lt!113368 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3443 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3438 thiss!1379))))))

(assert (=> d!22628 (invariant!0 (currentBit!3438 thiss!1379) (currentByte!3443 thiss!1379) (size!1354 (buf!1735 thiss!1379)))))

(assert (=> d!22628 (= (bitIndex!0 (size!1354 (buf!1735 thiss!1379)) (currentByte!3443 thiss!1379) (currentBit!3438 thiss!1379)) lt!113368)))

(declare-fun b!70394 () Bool)

(declare-fun res!58065 () Bool)

(assert (=> b!70394 (=> (not res!58065) (not e!45865))))

(assert (=> b!70394 (= res!58065 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113368))))

(declare-fun b!70395 () Bool)

(declare-fun lt!113367 () (_ BitVec 64))

(assert (=> b!70395 (= e!45865 (bvsle lt!113368 (bvmul lt!113367 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70395 (or (= lt!113367 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113367 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113367)))))

(assert (=> b!70395 (= lt!113367 ((_ sign_extend 32) (size!1354 (buf!1735 thiss!1379))))))

(assert (= (and d!22628 res!58064) b!70394))

(assert (= (and b!70394 res!58065) b!70395))

(assert (=> d!22628 m!112729))

(assert (=> d!22628 m!112731))

(assert (=> b!69959 d!22628))

(declare-fun b!70427 () Bool)

(declare-fun e!45887 () Bool)

(declare-fun call!916 () Bool)

(assert (=> b!70427 (= e!45887 call!916)))

(declare-fun b!70428 () Bool)

(declare-datatypes ((tuple4!36 0))(
  ( (tuple4!37 (_1!3173 (_ BitVec 32)) (_2!3173 (_ BitVec 32)) (_3!113 (_ BitVec 32)) (_4!18 (_ BitVec 32))) )
))
(declare-fun lt!113418 () tuple4!36)

(declare-fun e!45892 () Bool)

(declare-fun arrayRangesEq!19 (array!2912 array!2912 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70428 (= e!45892 (arrayRangesEq!19 (buf!1735 (_2!3157 lt!112398)) (buf!1735 (_2!3157 lt!112386)) (_1!3173 lt!113418) (_2!3173 lt!113418)))))

(declare-fun b!70429 () Bool)

(declare-fun e!45891 () Bool)

(assert (=> b!70429 (= e!45891 e!45887)))

(declare-fun c!5265 () Bool)

(assert (=> b!70429 (= c!5265 (= (_3!113 lt!113418) (_4!18 lt!113418)))))

(declare-fun b!70430 () Bool)

(declare-fun e!45890 () Bool)

(declare-fun lt!113419 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70430 (= e!45890 (byteRangesEq!0 (select (arr!1936 (buf!1735 (_2!3157 lt!112398))) (_4!18 lt!113418)) (select (arr!1936 (buf!1735 (_2!3157 lt!112386))) (_4!18 lt!113418)) #b00000000000000000000000000000000 lt!113419))))

(declare-fun b!70431 () Bool)

(declare-fun res!58093 () Bool)

(assert (=> b!70431 (= res!58093 (= lt!113419 #b00000000000000000000000000000000))))

(assert (=> b!70431 (=> res!58093 e!45890)))

(declare-fun e!45888 () Bool)

(assert (=> b!70431 (= e!45888 e!45890)))

(declare-fun d!22630 () Bool)

(declare-fun res!58091 () Bool)

(declare-fun e!45889 () Bool)

(assert (=> d!22630 (=> res!58091 e!45889)))

(assert (=> d!22630 (= res!58091 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!112383))))

(assert (=> d!22630 (= (arrayBitRangesEq!0 (buf!1735 (_2!3157 lt!112398)) (buf!1735 (_2!3157 lt!112386)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!112383) e!45889)))

(declare-fun bm!913 () Bool)

(declare-fun lt!113417 () (_ BitVec 32))

(assert (=> bm!913 (= call!916 (byteRangesEq!0 (select (arr!1936 (buf!1735 (_2!3157 lt!112398))) (_3!113 lt!113418)) (select (arr!1936 (buf!1735 (_2!3157 lt!112386))) (_3!113 lt!113418)) lt!113417 (ite c!5265 lt!113419 #b00000000000000000000000000001000)))))

(declare-fun b!70432 () Bool)

(assert (=> b!70432 (= e!45887 e!45888)))

(declare-fun res!58090 () Bool)

(assert (=> b!70432 (= res!58090 call!916)))

(assert (=> b!70432 (=> (not res!58090) (not e!45888))))

(declare-fun b!70433 () Bool)

(assert (=> b!70433 (= e!45889 e!45891)))

(declare-fun res!58089 () Bool)

(assert (=> b!70433 (=> (not res!58089) (not e!45891))))

(assert (=> b!70433 (= res!58089 e!45892)))

(declare-fun res!58092 () Bool)

(assert (=> b!70433 (=> res!58092 e!45892)))

(assert (=> b!70433 (= res!58092 (bvsge (_1!3173 lt!113418) (_2!3173 lt!113418)))))

(assert (=> b!70433 (= lt!113419 ((_ extract 31 0) (bvsrem lt!112383 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70433 (= lt!113417 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!36)

(assert (=> b!70433 (= lt!113418 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!112383))))

(assert (= (and d!22630 (not res!58091)) b!70433))

(assert (= (and b!70433 (not res!58092)) b!70428))

(assert (= (and b!70433 res!58089) b!70429))

(assert (= (and b!70429 c!5265) b!70427))

(assert (= (and b!70429 (not c!5265)) b!70432))

(assert (= (and b!70432 res!58090) b!70431))

(assert (= (and b!70431 (not res!58093)) b!70430))

(assert (= (or b!70427 b!70432) bm!913))

(declare-fun m!112863 () Bool)

(assert (=> b!70428 m!112863))

(declare-fun m!112865 () Bool)

(assert (=> b!70430 m!112865))

(declare-fun m!112867 () Bool)

(assert (=> b!70430 m!112867))

(assert (=> b!70430 m!112865))

(assert (=> b!70430 m!112867))

(declare-fun m!112869 () Bool)

(assert (=> b!70430 m!112869))

(declare-fun m!112871 () Bool)

(assert (=> bm!913 m!112871))

(declare-fun m!112873 () Bool)

(assert (=> bm!913 m!112873))

(assert (=> bm!913 m!112871))

(assert (=> bm!913 m!112873))

(declare-fun m!112875 () Bool)

(assert (=> bm!913 m!112875))

(declare-fun m!112877 () Bool)

(assert (=> b!70433 m!112877))

(assert (=> b!69949 d!22630))

(declare-fun d!22662 () Bool)

(declare-fun e!45893 () Bool)

(assert (=> d!22662 e!45893))

(declare-fun res!58094 () Bool)

(assert (=> d!22662 (=> (not res!58094) (not e!45893))))

(declare-fun lt!113422 () (_ BitVec 64))

(declare-fun lt!113420 () (_ BitVec 64))

(declare-fun lt!113423 () (_ BitVec 64))

(assert (=> d!22662 (= res!58094 (= lt!113422 (bvsub lt!113423 lt!113420)))))

(assert (=> d!22662 (or (= (bvand lt!113423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113420 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113423 lt!113420) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22662 (= lt!113420 (remainingBits!0 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))) ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398)))))))

(declare-fun lt!113425 () (_ BitVec 64))

(declare-fun lt!113424 () (_ BitVec 64))

(assert (=> d!22662 (= lt!113423 (bvmul lt!113425 lt!113424))))

(assert (=> d!22662 (or (= lt!113425 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113424 (bvsdiv (bvmul lt!113425 lt!113424) lt!113425)))))

(assert (=> d!22662 (= lt!113424 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22662 (= lt!113425 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))))))

(assert (=> d!22662 (= lt!113422 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3443 (_2!3157 lt!112398))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3438 (_2!3157 lt!112398)))))))

(assert (=> d!22662 (invariant!0 (currentBit!3438 (_2!3157 lt!112398)) (currentByte!3443 (_2!3157 lt!112398)) (size!1354 (buf!1735 (_2!3157 lt!112398))))))

(assert (=> d!22662 (= (bitIndex!0 (size!1354 (buf!1735 (_2!3157 lt!112398))) (currentByte!3443 (_2!3157 lt!112398)) (currentBit!3438 (_2!3157 lt!112398))) lt!113422)))

(declare-fun b!70434 () Bool)

(declare-fun res!58095 () Bool)

(assert (=> b!70434 (=> (not res!58095) (not e!45893))))

(assert (=> b!70434 (= res!58095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113422))))

(declare-fun b!70435 () Bool)

(declare-fun lt!113421 () (_ BitVec 64))

(assert (=> b!70435 (= e!45893 (bvsle lt!113422 (bvmul lt!113421 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70435 (or (= lt!113421 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113421 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113421)))))

(assert (=> b!70435 (= lt!113421 ((_ sign_extend 32) (size!1354 (buf!1735 (_2!3157 lt!112398)))))))

(assert (= (and d!22662 res!58094) b!70434))

(assert (= (and b!70434 res!58095) b!70435))

(assert (=> d!22662 m!112103))

(assert (=> d!22662 m!112031))

(assert (=> b!69948 d!22662))

(push 1)

(assert (not b!70022))

(assert (not b!70327))

(assert (not b!70357))

(assert (not d!22592))

(assert (not b!70104))

(assert (not d!22600))

(assert (not b!70027))

(assert (not b!70356))

(assert (not d!22490))

(assert (not b!70131))

(assert (not bm!913))

(assert (not b!70324))

(assert (not d!22432))

(assert (not d!22628))

(assert (not b!70433))

(assert (not b!70132))

(assert (not b!70105))

(assert (not b!70360))

(assert (not b!70340))

(assert (not d!22590))

(assert (not b!70320))

(assert (not b!70364))

(assert (not b!70134))

(assert (not b!70354))

(assert (not b!70393))

(assert (not b!70323))

(assert (not b!70133))

(assert (not d!22620))

(assert (not d!22598))

(assert (not b!70110))

(assert (not d!22610))

(assert (not b!70107))

(assert (not b!70139))

(assert (not d!22626))

(assert (not b!70430))

(assert (not d!22614))

(assert (not b!70362))

(assert (not b!70391))

(assert (not b!70136))

(assert (not b!70353))

(assert (not b!70137))

(assert (not b!70103))

(assert (not b!70349))

(assert (not b!70116))

(assert (not b!70121))

(assert (not b!70119))

(assert (not bm!907))

(assert (not b!70351))

(assert (not b!70358))

(assert (not d!22584))

(assert (not b!70428))

(assert (not d!22616))

(assert (not b!70355))

(assert (not d!22496))

(assert (not b!70338))

(assert (not b!70109))

(assert (not d!22586))

(assert (not b!70363))

(assert (not b!70347))

(assert (not d!22594))

(assert (not b!70326))

(assert (not b!70108))

(assert (not d!22604))

(assert (not b!70339))

(assert (not b!70106))

(assert (not d!22588))

(assert (not b!70024))

(assert (not b!70321))

(assert (not d!22434))

(assert (not d!22430))

(assert (not d!22662))

(assert (not d!22472))

(assert (not b!70342))

(assert (not b!70348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

