; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6136 () Bool)

(assert start!6136)

(declare-fun b!28894 () Bool)

(declare-fun res!25014 () Bool)

(declare-fun e!19407 () Bool)

(assert (=> b!28894 (=> (not res!25014) (not e!19407))))

(declare-datatypes ((array!1762 0))(
  ( (array!1763 (arr!1227 (Array (_ BitVec 32) (_ BitVec 8))) (size!764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1356 0))(
  ( (BitStream!1357 (buf!1092 array!1762) (currentByte!2423 (_ BitVec 32)) (currentBit!2418 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1356)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28894 (= res!25014 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 thiss!1379))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!28895 () Bool)

(declare-fun res!25018 () Bool)

(declare-fun e!19412 () Bool)

(assert (=> b!28895 (=> res!25018 e!19412)))

(declare-datatypes ((List!379 0))(
  ( (Nil!376) (Cons!375 (h!494 Bool) (t!1129 List!379)) )
))
(declare-fun lt!40989 () List!379)

(declare-fun length!105 (List!379) Int)

(assert (=> b!28895 (= res!25018 (<= (length!105 lt!40989) 0))))

(declare-fun b!28896 () Bool)

(declare-fun lt!40981 () List!379)

(declare-fun lt!40982 () (_ BitVec 64))

(declare-fun lt!40986 () List!379)

(declare-datatypes ((tuple2!3102 0))(
  ( (tuple2!3103 (_1!1638 BitStream!1356) (_2!1638 BitStream!1356)) )
))
(declare-fun lt!40990 () tuple2!3102)

(assert (=> b!28896 (= e!19412 (or (not (= lt!40986 lt!40981)) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!40982) (bvslt lt!40982 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!764 (buf!1092 (_1!1638 lt!40990)))))))))))

(assert (=> b!28896 (= lt!40981 lt!40986)))

(declare-fun tail!96 (List!379) List!379)

(assert (=> b!28896 (= lt!40986 (tail!96 lt!40989))))

(declare-datatypes ((Unit!2249 0))(
  ( (Unit!2250) )
))
(declare-fun lt!40987 () Unit!2249)

(declare-fun lt!40984 () tuple2!3102)

(declare-datatypes ((tuple2!3104 0))(
  ( (tuple2!3105 (_1!1639 Unit!2249) (_2!1639 BitStream!1356)) )
))
(declare-fun lt!40979 () tuple2!3104)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1356 BitStream!1356 BitStream!1356 BitStream!1356 (_ BitVec 64) List!379) Unit!2249)

(assert (=> b!28896 (= lt!40987 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1639 lt!40979) (_2!1639 lt!40979) (_1!1638 lt!40990) (_1!1638 lt!40984) (bvsub to!314 i!635) lt!40989))))

(declare-fun b!28897 () Bool)

(declare-fun e!19417 () Bool)

(declare-fun e!19415 () Bool)

(assert (=> b!28897 (= e!19417 e!19415)))

(declare-fun res!25017 () Bool)

(assert (=> b!28897 (=> res!25017 e!19415)))

(declare-fun lt!40988 () tuple2!3104)

(declare-fun isPrefixOf!0 (BitStream!1356 BitStream!1356) Bool)

(assert (=> b!28897 (= res!25017 (not (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!40979))))))

(assert (=> b!28897 (isPrefixOf!0 thiss!1379 (_2!1639 lt!40979))))

(declare-fun lt!40975 () Unit!2249)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1356 BitStream!1356 BitStream!1356) Unit!2249)

(assert (=> b!28897 (= lt!40975 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1639 lt!40988) (_2!1639 lt!40979)))))

(declare-fun srcBuffer!2 () array!1762)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1356 array!1762 (_ BitVec 64) (_ BitVec 64)) tuple2!3104)

(assert (=> b!28897 (= lt!40979 (appendBitsMSBFirstLoop!0 (_2!1639 lt!40988) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!19409 () Bool)

(assert (=> b!28897 e!19409))

(declare-fun res!25020 () Bool)

(assert (=> b!28897 (=> (not res!25020) (not e!19409))))

(assert (=> b!28897 (= res!25020 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40978 () Unit!2249)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1356 array!1762 (_ BitVec 64)) Unit!2249)

(assert (=> b!28897 (= lt!40978 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1092 (_2!1639 lt!40988)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40983 () tuple2!3102)

(declare-fun reader!0 (BitStream!1356 BitStream!1356) tuple2!3102)

(assert (=> b!28897 (= lt!40983 (reader!0 thiss!1379 (_2!1639 lt!40988)))))

(declare-fun b!28898 () Bool)

(declare-fun e!19413 () Bool)

(assert (=> b!28898 (= e!19413 e!19412)))

(declare-fun res!25009 () Bool)

(assert (=> b!28898 (=> res!25009 e!19412)))

(assert (=> b!28898 (= res!25009 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!40985 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1356 BitStream!1356 (_ BitVec 64)) List!379)

(assert (=> b!28898 (= lt!40981 (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_1!1638 lt!40984) lt!40985))))

(assert (=> b!28898 (= lt!40989 (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_1!1638 lt!40990) (bvsub to!314 i!635)))))

(assert (=> b!28898 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!40985)))

(declare-fun lt!40977 () Unit!2249)

(assert (=> b!28898 (= lt!40977 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1639 lt!40988) (buf!1092 (_2!1639 lt!40979)) lt!40985))))

(assert (=> b!28898 (= lt!40984 (reader!0 (_2!1639 lt!40988) (_2!1639 lt!40979)))))

(assert (=> b!28898 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!40973 () Unit!2249)

(assert (=> b!28898 (= lt!40973 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1092 (_2!1639 lt!40979)) (bvsub to!314 i!635)))))

(assert (=> b!28898 (= lt!40990 (reader!0 thiss!1379 (_2!1639 lt!40979)))))

(declare-fun b!28900 () Bool)

(declare-fun res!25006 () Bool)

(assert (=> b!28900 (=> res!25006 e!19413)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!28900 (= res!25006 (not (invariant!0 (currentBit!2418 (_2!1639 lt!40988)) (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40988))))))))

(declare-fun b!28901 () Bool)

(declare-fun head!216 (List!379) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1356 array!1762 (_ BitVec 64) (_ BitVec 64)) List!379)

(assert (=> b!28901 (= e!19409 (= (head!216 (byteArrayBitContentToList!0 (_2!1639 lt!40988) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!216 (bitStreamReadBitsIntoList!0 (_2!1639 lt!40988) (_1!1638 lt!40983) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun e!19408 () Bool)

(declare-fun lt!40974 () (_ BitVec 64))

(declare-fun b!28902 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!28902 (= e!19408 (= lt!40974 (bvsub (bvsub (bvadd (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!28903 () Bool)

(declare-fun e!19406 () Bool)

(declare-fun array_inv!731 (array!1762) Bool)

(assert (=> b!28903 (= e!19406 (array_inv!731 (buf!1092 thiss!1379)))))

(declare-fun b!28904 () Bool)

(declare-fun e!19416 () Bool)

(assert (=> b!28904 (= e!19415 e!19416)))

(declare-fun res!25008 () Bool)

(assert (=> b!28904 (=> res!25008 e!19416)))

(assert (=> b!28904 (= res!25008 (not (= lt!40974 (bvsub (bvadd lt!40982 to!314) i!635))))))

(assert (=> b!28904 (= lt!40974 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40979))) (currentByte!2423 (_2!1639 lt!40979)) (currentBit!2418 (_2!1639 lt!40979))))))

(declare-fun b!28905 () Bool)

(declare-fun res!25012 () Bool)

(assert (=> b!28905 (=> res!25012 e!19413)))

(assert (=> b!28905 (= res!25012 (not (invariant!0 (currentBit!2418 (_2!1639 lt!40988)) (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40979))))))))

(declare-fun b!28906 () Bool)

(declare-fun res!25015 () Bool)

(assert (=> b!28906 (=> res!25015 e!19416)))

(assert (=> b!28906 (= res!25015 (not (= (size!764 (buf!1092 thiss!1379)) (size!764 (buf!1092 (_2!1639 lt!40979))))))))

(declare-fun b!28907 () Bool)

(declare-fun e!19411 () Bool)

(assert (=> b!28907 (= e!19411 e!19417)))

(declare-fun res!25007 () Bool)

(assert (=> b!28907 (=> res!25007 e!19417)))

(assert (=> b!28907 (= res!25007 (not (isPrefixOf!0 thiss!1379 (_2!1639 lt!40988))))))

(assert (=> b!28907 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!40985)))

(assert (=> b!28907 (= lt!40985 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!40980 () Unit!2249)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1356 BitStream!1356 (_ BitVec 64) (_ BitVec 64)) Unit!2249)

(assert (=> b!28907 (= lt!40980 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1639 lt!40988) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1356 (_ BitVec 8) (_ BitVec 32)) tuple2!3104)

(assert (=> b!28907 (= lt!40988 (appendBitFromByte!0 thiss!1379 (select (arr!1227 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!28899 () Bool)

(declare-fun res!25019 () Bool)

(assert (=> b!28899 (=> res!25019 e!19416)))

(assert (=> b!28899 (= res!25019 (not (invariant!0 (currentBit!2418 (_2!1639 lt!40979)) (currentByte!2423 (_2!1639 lt!40979)) (size!764 (buf!1092 (_2!1639 lt!40979))))))))

(declare-fun res!25011 () Bool)

(assert (=> start!6136 (=> (not res!25011) (not e!19407))))

(assert (=> start!6136 (= res!25011 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!764 srcBuffer!2))))))))

(assert (=> start!6136 e!19407))

(assert (=> start!6136 true))

(assert (=> start!6136 (array_inv!731 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1356) Bool)

(assert (=> start!6136 (and (inv!12 thiss!1379) e!19406)))

(declare-fun b!28908 () Bool)

(assert (=> b!28908 (= e!19416 e!19413)))

(declare-fun res!25013 () Bool)

(assert (=> b!28908 (=> res!25013 e!19413)))

(assert (=> b!28908 (= res!25013 (not (= (size!764 (buf!1092 (_2!1639 lt!40988))) (size!764 (buf!1092 (_2!1639 lt!40979))))))))

(assert (=> b!28908 e!19408))

(declare-fun res!25016 () Bool)

(assert (=> b!28908 (=> (not res!25016) (not e!19408))))

(assert (=> b!28908 (= res!25016 (= (size!764 (buf!1092 (_2!1639 lt!40979))) (size!764 (buf!1092 thiss!1379))))))

(declare-fun b!28909 () Bool)

(assert (=> b!28909 (= e!19407 (not e!19411))))

(declare-fun res!25010 () Bool)

(assert (=> b!28909 (=> res!25010 e!19411)))

(assert (=> b!28909 (= res!25010 (bvsge i!635 to!314))))

(assert (=> b!28909 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!40976 () Unit!2249)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1356) Unit!2249)

(assert (=> b!28909 (= lt!40976 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!28909 (= lt!40982 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(assert (= (and start!6136 res!25011) b!28894))

(assert (= (and b!28894 res!25014) b!28909))

(assert (= (and b!28909 (not res!25010)) b!28907))

(assert (= (and b!28907 (not res!25007)) b!28897))

(assert (= (and b!28897 res!25020) b!28901))

(assert (= (and b!28897 (not res!25017)) b!28904))

(assert (= (and b!28904 (not res!25008)) b!28899))

(assert (= (and b!28899 (not res!25019)) b!28906))

(assert (= (and b!28906 (not res!25015)) b!28908))

(assert (= (and b!28908 res!25016) b!28902))

(assert (= (and b!28908 (not res!25013)) b!28900))

(assert (= (and b!28900 (not res!25006)) b!28905))

(assert (= (and b!28905 (not res!25012)) b!28898))

(assert (= (and b!28898 (not res!25009)) b!28895))

(assert (= (and b!28895 (not res!25018)) b!28896))

(assert (= start!6136 b!28903))

(declare-fun m!41613 () Bool)

(assert (=> b!28899 m!41613))

(declare-fun m!41615 () Bool)

(assert (=> b!28900 m!41615))

(declare-fun m!41617 () Bool)

(assert (=> b!28907 m!41617))

(declare-fun m!41619 () Bool)

(assert (=> b!28907 m!41619))

(declare-fun m!41621 () Bool)

(assert (=> b!28907 m!41621))

(assert (=> b!28907 m!41619))

(declare-fun m!41623 () Bool)

(assert (=> b!28907 m!41623))

(declare-fun m!41625 () Bool)

(assert (=> b!28907 m!41625))

(declare-fun m!41627 () Bool)

(assert (=> b!28902 m!41627))

(declare-fun m!41629 () Bool)

(assert (=> b!28896 m!41629))

(declare-fun m!41631 () Bool)

(assert (=> b!28896 m!41631))

(declare-fun m!41633 () Bool)

(assert (=> start!6136 m!41633))

(declare-fun m!41635 () Bool)

(assert (=> start!6136 m!41635))

(declare-fun m!41637 () Bool)

(assert (=> b!28894 m!41637))

(declare-fun m!41639 () Bool)

(assert (=> b!28909 m!41639))

(declare-fun m!41641 () Bool)

(assert (=> b!28909 m!41641))

(declare-fun m!41643 () Bool)

(assert (=> b!28909 m!41643))

(declare-fun m!41645 () Bool)

(assert (=> b!28904 m!41645))

(declare-fun m!41647 () Bool)

(assert (=> b!28903 m!41647))

(declare-fun m!41649 () Bool)

(assert (=> b!28895 m!41649))

(declare-fun m!41651 () Bool)

(assert (=> b!28905 m!41651))

(declare-fun m!41653 () Bool)

(assert (=> b!28898 m!41653))

(declare-fun m!41655 () Bool)

(assert (=> b!28898 m!41655))

(declare-fun m!41657 () Bool)

(assert (=> b!28898 m!41657))

(declare-fun m!41659 () Bool)

(assert (=> b!28898 m!41659))

(declare-fun m!41661 () Bool)

(assert (=> b!28898 m!41661))

(declare-fun m!41663 () Bool)

(assert (=> b!28898 m!41663))

(declare-fun m!41665 () Bool)

(assert (=> b!28898 m!41665))

(declare-fun m!41667 () Bool)

(assert (=> b!28898 m!41667))

(declare-fun m!41669 () Bool)

(assert (=> b!28897 m!41669))

(declare-fun m!41671 () Bool)

(assert (=> b!28897 m!41671))

(declare-fun m!41673 () Bool)

(assert (=> b!28897 m!41673))

(declare-fun m!41675 () Bool)

(assert (=> b!28897 m!41675))

(declare-fun m!41677 () Bool)

(assert (=> b!28897 m!41677))

(declare-fun m!41679 () Bool)

(assert (=> b!28897 m!41679))

(declare-fun m!41681 () Bool)

(assert (=> b!28897 m!41681))

(declare-fun m!41683 () Bool)

(assert (=> b!28901 m!41683))

(assert (=> b!28901 m!41683))

(declare-fun m!41685 () Bool)

(assert (=> b!28901 m!41685))

(declare-fun m!41687 () Bool)

(assert (=> b!28901 m!41687))

(assert (=> b!28901 m!41687))

(declare-fun m!41689 () Bool)

(assert (=> b!28901 m!41689))

(check-sat (not b!28896) (not b!28895) (not b!28905) (not start!6136) (not b!28904) (not b!28899) (not b!28894) (not b!28903) (not b!28901) (not b!28900) (not b!28909) (not b!28898) (not b!28902) (not b!28897) (not b!28907))
(check-sat)
(get-model)

(declare-fun d!8110 () Bool)

(assert (=> d!8110 (= (head!216 (byteArrayBitContentToList!0 (_2!1639 lt!40988) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!494 (byteArrayBitContentToList!0 (_2!1639 lt!40988) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28901 d!8110))

(declare-fun d!8112 () Bool)

(declare-fun c!1842 () Bool)

(assert (=> d!8112 (= c!1842 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!19456 () List!379)

(assert (=> d!8112 (= (byteArrayBitContentToList!0 (_2!1639 lt!40988) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!19456)))

(declare-fun b!28962 () Bool)

(assert (=> b!28962 (= e!19456 Nil!376)))

(declare-fun b!28963 () Bool)

(assert (=> b!28963 (= e!19456 (Cons!375 (not (= (bvand ((_ sign_extend 24) (select (arr!1227 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1639 lt!40988) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8112 c!1842) b!28962))

(assert (= (and d!8112 (not c!1842)) b!28963))

(assert (=> b!28963 m!41619))

(declare-fun m!41769 () Bool)

(assert (=> b!28963 m!41769))

(declare-fun m!41771 () Bool)

(assert (=> b!28963 m!41771))

(assert (=> b!28901 d!8112))

(declare-fun d!8114 () Bool)

(assert (=> d!8114 (= (head!216 (bitStreamReadBitsIntoList!0 (_2!1639 lt!40988) (_1!1638 lt!40983) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!494 (bitStreamReadBitsIntoList!0 (_2!1639 lt!40988) (_1!1638 lt!40983) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!28901 d!8114))

(declare-fun b!28972 () Bool)

(declare-datatypes ((tuple2!3110 0))(
  ( (tuple2!3111 (_1!1642 List!379) (_2!1642 BitStream!1356)) )
))
(declare-fun e!19461 () tuple2!3110)

(assert (=> b!28972 (= e!19461 (tuple2!3111 Nil!376 (_1!1638 lt!40983)))))

(declare-fun d!8116 () Bool)

(declare-fun e!19462 () Bool)

(assert (=> d!8116 e!19462))

(declare-fun c!1848 () Bool)

(assert (=> d!8116 (= c!1848 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!41052 () List!379)

(assert (=> d!8116 (= lt!41052 (_1!1642 e!19461))))

(declare-fun c!1847 () Bool)

(assert (=> d!8116 (= c!1847 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8116 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8116 (= (bitStreamReadBitsIntoList!0 (_2!1639 lt!40988) (_1!1638 lt!40983) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41052)))

(declare-fun b!28974 () Bool)

(declare-fun isEmpty!73 (List!379) Bool)

(assert (=> b!28974 (= e!19462 (isEmpty!73 lt!41052))))

(declare-fun b!28975 () Bool)

(assert (=> b!28975 (= e!19462 (> (length!105 lt!41052) 0))))

(declare-datatypes ((tuple2!3112 0))(
  ( (tuple2!3113 (_1!1643 Bool) (_2!1643 BitStream!1356)) )
))
(declare-fun lt!41051 () tuple2!3112)

(declare-fun b!28973 () Bool)

(declare-fun lt!41053 () (_ BitVec 64))

(assert (=> b!28973 (= e!19461 (tuple2!3111 (Cons!375 (_1!1643 lt!41051) (bitStreamReadBitsIntoList!0 (_2!1639 lt!40988) (_2!1643 lt!41051) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!41053))) (_2!1643 lt!41051)))))

(declare-fun readBit!0 (BitStream!1356) tuple2!3112)

(assert (=> b!28973 (= lt!41051 (readBit!0 (_1!1638 lt!40983)))))

(assert (=> b!28973 (= lt!41053 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8116 c!1847) b!28972))

(assert (= (and d!8116 (not c!1847)) b!28973))

(assert (= (and d!8116 c!1848) b!28974))

(assert (= (and d!8116 (not c!1848)) b!28975))

(declare-fun m!41773 () Bool)

(assert (=> b!28974 m!41773))

(declare-fun m!41775 () Bool)

(assert (=> b!28975 m!41775))

(declare-fun m!41777 () Bool)

(assert (=> b!28973 m!41777))

(declare-fun m!41779 () Bool)

(assert (=> b!28973 m!41779))

(assert (=> b!28901 d!8116))

(declare-fun d!8118 () Bool)

(assert (=> d!8118 (= (invariant!0 (currentBit!2418 (_2!1639 lt!40988)) (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40988)))) (and (bvsge (currentBit!2418 (_2!1639 lt!40988)) #b00000000000000000000000000000000) (bvslt (currentBit!2418 (_2!1639 lt!40988)) #b00000000000000000000000000001000) (bvsge (currentByte!2423 (_2!1639 lt!40988)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40988)))) (and (= (currentBit!2418 (_2!1639 lt!40988)) #b00000000000000000000000000000000) (= (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40988))))))))))

(assert (=> b!28900 d!8118))

(declare-fun d!8120 () Bool)

(assert (=> d!8120 (= (invariant!0 (currentBit!2418 (_2!1639 lt!40979)) (currentByte!2423 (_2!1639 lt!40979)) (size!764 (buf!1092 (_2!1639 lt!40979)))) (and (bvsge (currentBit!2418 (_2!1639 lt!40979)) #b00000000000000000000000000000000) (bvslt (currentBit!2418 (_2!1639 lt!40979)) #b00000000000000000000000000001000) (bvsge (currentByte!2423 (_2!1639 lt!40979)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2423 (_2!1639 lt!40979)) (size!764 (buf!1092 (_2!1639 lt!40979)))) (and (= (currentBit!2418 (_2!1639 lt!40979)) #b00000000000000000000000000000000) (= (currentByte!2423 (_2!1639 lt!40979)) (size!764 (buf!1092 (_2!1639 lt!40979))))))))))

(assert (=> b!28899 d!8120))

(declare-fun d!8122 () Bool)

(declare-fun res!25074 () Bool)

(declare-fun e!19468 () Bool)

(assert (=> d!8122 (=> (not res!25074) (not e!19468))))

(assert (=> d!8122 (= res!25074 (= (size!764 (buf!1092 thiss!1379)) (size!764 (buf!1092 thiss!1379))))))

(assert (=> d!8122 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!19468)))

(declare-fun b!28982 () Bool)

(declare-fun res!25072 () Bool)

(assert (=> b!28982 (=> (not res!25072) (not e!19468))))

(assert (=> b!28982 (= res!25072 (bvsle (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)) (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379))))))

(declare-fun b!28983 () Bool)

(declare-fun e!19467 () Bool)

(assert (=> b!28983 (= e!19468 e!19467)))

(declare-fun res!25073 () Bool)

(assert (=> b!28983 (=> res!25073 e!19467)))

(assert (=> b!28983 (= res!25073 (= (size!764 (buf!1092 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!28984 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1762 array!1762 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!28984 (= e!19467 (arrayBitRangesEq!0 (buf!1092 thiss!1379) (buf!1092 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379))))))

(assert (= (and d!8122 res!25074) b!28982))

(assert (= (and b!28982 res!25072) b!28983))

(assert (= (and b!28983 (not res!25073)) b!28984))

(assert (=> b!28982 m!41643))

(assert (=> b!28982 m!41643))

(assert (=> b!28984 m!41643))

(assert (=> b!28984 m!41643))

(declare-fun m!41781 () Bool)

(assert (=> b!28984 m!41781))

(assert (=> b!28909 d!8122))

(declare-fun d!8124 () Bool)

(assert (=> d!8124 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!41056 () Unit!2249)

(declare-fun choose!11 (BitStream!1356) Unit!2249)

(assert (=> d!8124 (= lt!41056 (choose!11 thiss!1379))))

(assert (=> d!8124 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!41056)))

(declare-fun bs!2331 () Bool)

(assert (= bs!2331 d!8124))

(assert (=> bs!2331 m!41639))

(declare-fun m!41783 () Bool)

(assert (=> bs!2331 m!41783))

(assert (=> b!28909 d!8124))

(declare-fun d!8126 () Bool)

(declare-fun e!19471 () Bool)

(assert (=> d!8126 e!19471))

(declare-fun res!25079 () Bool)

(assert (=> d!8126 (=> (not res!25079) (not e!19471))))

(declare-fun lt!41070 () (_ BitVec 64))

(declare-fun lt!41074 () (_ BitVec 64))

(declare-fun lt!41072 () (_ BitVec 64))

(assert (=> d!8126 (= res!25079 (= lt!41072 (bvsub lt!41074 lt!41070)))))

(assert (=> d!8126 (or (= (bvand lt!41074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41070 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41074 lt!41070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8126 (= lt!41070 (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 thiss!1379))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379))))))

(declare-fun lt!41073 () (_ BitVec 64))

(declare-fun lt!41069 () (_ BitVec 64))

(assert (=> d!8126 (= lt!41074 (bvmul lt!41073 lt!41069))))

(assert (=> d!8126 (or (= lt!41073 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41069 (bvsdiv (bvmul lt!41073 lt!41069) lt!41073)))))

(assert (=> d!8126 (= lt!41069 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8126 (= lt!41073 ((_ sign_extend 32) (size!764 (buf!1092 thiss!1379))))))

(assert (=> d!8126 (= lt!41072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2423 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2418 thiss!1379))))))

(assert (=> d!8126 (invariant!0 (currentBit!2418 thiss!1379) (currentByte!2423 thiss!1379) (size!764 (buf!1092 thiss!1379)))))

(assert (=> d!8126 (= (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)) lt!41072)))

(declare-fun b!28989 () Bool)

(declare-fun res!25080 () Bool)

(assert (=> b!28989 (=> (not res!25080) (not e!19471))))

(assert (=> b!28989 (= res!25080 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41072))))

(declare-fun b!28990 () Bool)

(declare-fun lt!41071 () (_ BitVec 64))

(assert (=> b!28990 (= e!19471 (bvsle lt!41072 (bvmul lt!41071 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!28990 (or (= lt!41071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41071)))))

(assert (=> b!28990 (= lt!41071 ((_ sign_extend 32) (size!764 (buf!1092 thiss!1379))))))

(assert (= (and d!8126 res!25079) b!28989))

(assert (= (and b!28989 res!25080) b!28990))

(declare-fun m!41785 () Bool)

(assert (=> d!8126 m!41785))

(declare-fun m!41787 () Bool)

(assert (=> d!8126 m!41787))

(assert (=> b!28909 d!8126))

(declare-fun d!8128 () Bool)

(declare-fun e!19476 () Bool)

(assert (=> d!8128 e!19476))

(declare-fun res!25087 () Bool)

(assert (=> d!8128 (=> (not res!25087) (not e!19476))))

(declare-fun lt!41132 () tuple2!3102)

(assert (=> d!8128 (= res!25087 (isPrefixOf!0 (_1!1638 lt!41132) (_2!1638 lt!41132)))))

(declare-fun lt!41120 () BitStream!1356)

(assert (=> d!8128 (= lt!41132 (tuple2!3103 lt!41120 (_2!1639 lt!40979)))))

(declare-fun lt!41122 () Unit!2249)

(declare-fun lt!41124 () Unit!2249)

(assert (=> d!8128 (= lt!41122 lt!41124)))

(assert (=> d!8128 (isPrefixOf!0 lt!41120 (_2!1639 lt!40979))))

(assert (=> d!8128 (= lt!41124 (lemmaIsPrefixTransitive!0 lt!41120 (_2!1639 lt!40979) (_2!1639 lt!40979)))))

(declare-fun lt!41115 () Unit!2249)

(declare-fun lt!41125 () Unit!2249)

(assert (=> d!8128 (= lt!41115 lt!41125)))

(assert (=> d!8128 (isPrefixOf!0 lt!41120 (_2!1639 lt!40979))))

(assert (=> d!8128 (= lt!41125 (lemmaIsPrefixTransitive!0 lt!41120 thiss!1379 (_2!1639 lt!40979)))))

(declare-fun lt!41117 () Unit!2249)

(declare-fun e!19477 () Unit!2249)

(assert (=> d!8128 (= lt!41117 e!19477)))

(declare-fun c!1851 () Bool)

(assert (=> d!8128 (= c!1851 (not (= (size!764 (buf!1092 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!41123 () Unit!2249)

(declare-fun lt!41129 () Unit!2249)

(assert (=> d!8128 (= lt!41123 lt!41129)))

(assert (=> d!8128 (isPrefixOf!0 (_2!1639 lt!40979) (_2!1639 lt!40979))))

(assert (=> d!8128 (= lt!41129 (lemmaIsPrefixRefl!0 (_2!1639 lt!40979)))))

(declare-fun lt!41116 () Unit!2249)

(declare-fun lt!41131 () Unit!2249)

(assert (=> d!8128 (= lt!41116 lt!41131)))

(assert (=> d!8128 (= lt!41131 (lemmaIsPrefixRefl!0 (_2!1639 lt!40979)))))

(declare-fun lt!41118 () Unit!2249)

(declare-fun lt!41130 () Unit!2249)

(assert (=> d!8128 (= lt!41118 lt!41130)))

(assert (=> d!8128 (isPrefixOf!0 lt!41120 lt!41120)))

(assert (=> d!8128 (= lt!41130 (lemmaIsPrefixRefl!0 lt!41120))))

(declare-fun lt!41126 () Unit!2249)

(declare-fun lt!41128 () Unit!2249)

(assert (=> d!8128 (= lt!41126 lt!41128)))

(assert (=> d!8128 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8128 (= lt!41128 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8128 (= lt!41120 (BitStream!1357 (buf!1092 (_2!1639 lt!40979)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(assert (=> d!8128 (isPrefixOf!0 thiss!1379 (_2!1639 lt!40979))))

(assert (=> d!8128 (= (reader!0 thiss!1379 (_2!1639 lt!40979)) lt!41132)))

(declare-fun b!29001 () Bool)

(declare-fun res!25089 () Bool)

(assert (=> b!29001 (=> (not res!25089) (not e!19476))))

(assert (=> b!29001 (= res!25089 (isPrefixOf!0 (_2!1638 lt!41132) (_2!1639 lt!40979)))))

(declare-fun lt!41121 () (_ BitVec 64))

(declare-fun lt!41134 () (_ BitVec 64))

(declare-fun b!29002 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1356 (_ BitVec 64)) BitStream!1356)

(assert (=> b!29002 (= e!19476 (= (_1!1638 lt!41132) (withMovedBitIndex!0 (_2!1638 lt!41132) (bvsub lt!41134 lt!41121))))))

(assert (=> b!29002 (or (= (bvand lt!41134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41134 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41134 lt!41121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29002 (= lt!41121 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40979))) (currentByte!2423 (_2!1639 lt!40979)) (currentBit!2418 (_2!1639 lt!40979))))))

(assert (=> b!29002 (= lt!41134 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(declare-fun b!29003 () Bool)

(declare-fun Unit!2253 () Unit!2249)

(assert (=> b!29003 (= e!19477 Unit!2253)))

(declare-fun b!29004 () Bool)

(declare-fun res!25088 () Bool)

(assert (=> b!29004 (=> (not res!25088) (not e!19476))))

(assert (=> b!29004 (= res!25088 (isPrefixOf!0 (_1!1638 lt!41132) thiss!1379))))

(declare-fun b!29005 () Bool)

(declare-fun lt!41127 () Unit!2249)

(assert (=> b!29005 (= e!19477 lt!41127)))

(declare-fun lt!41133 () (_ BitVec 64))

(assert (=> b!29005 (= lt!41133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41119 () (_ BitVec 64))

(assert (=> b!29005 (= lt!41119 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1762 array!1762 (_ BitVec 64) (_ BitVec 64)) Unit!2249)

(assert (=> b!29005 (= lt!41127 (arrayBitRangesEqSymmetric!0 (buf!1092 thiss!1379) (buf!1092 (_2!1639 lt!40979)) lt!41133 lt!41119))))

(assert (=> b!29005 (arrayBitRangesEq!0 (buf!1092 (_2!1639 lt!40979)) (buf!1092 thiss!1379) lt!41133 lt!41119)))

(assert (= (and d!8128 c!1851) b!29005))

(assert (= (and d!8128 (not c!1851)) b!29003))

(assert (= (and d!8128 res!25087) b!29004))

(assert (= (and b!29004 res!25088) b!29001))

(assert (= (and b!29001 res!25089) b!29002))

(declare-fun m!41789 () Bool)

(assert (=> b!29001 m!41789))

(assert (=> b!29005 m!41643))

(declare-fun m!41791 () Bool)

(assert (=> b!29005 m!41791))

(declare-fun m!41793 () Bool)

(assert (=> b!29005 m!41793))

(declare-fun m!41795 () Bool)

(assert (=> b!29004 m!41795))

(declare-fun m!41797 () Bool)

(assert (=> b!29002 m!41797))

(assert (=> b!29002 m!41645))

(assert (=> b!29002 m!41643))

(declare-fun m!41799 () Bool)

(assert (=> d!8128 m!41799))

(assert (=> d!8128 m!41641))

(assert (=> d!8128 m!41677))

(declare-fun m!41801 () Bool)

(assert (=> d!8128 m!41801))

(declare-fun m!41803 () Bool)

(assert (=> d!8128 m!41803))

(declare-fun m!41805 () Bool)

(assert (=> d!8128 m!41805))

(declare-fun m!41807 () Bool)

(assert (=> d!8128 m!41807))

(declare-fun m!41809 () Bool)

(assert (=> d!8128 m!41809))

(assert (=> d!8128 m!41639))

(declare-fun m!41811 () Bool)

(assert (=> d!8128 m!41811))

(declare-fun m!41813 () Bool)

(assert (=> d!8128 m!41813))

(assert (=> b!28898 d!8128))

(declare-fun b!29006 () Bool)

(declare-fun e!19478 () tuple2!3110)

(assert (=> b!29006 (= e!19478 (tuple2!3111 Nil!376 (_1!1638 lt!40990)))))

(declare-fun d!8130 () Bool)

(declare-fun e!19479 () Bool)

(assert (=> d!8130 e!19479))

(declare-fun c!1853 () Bool)

(assert (=> d!8130 (= c!1853 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!41136 () List!379)

(assert (=> d!8130 (= lt!41136 (_1!1642 e!19478))))

(declare-fun c!1852 () Bool)

(assert (=> d!8130 (= c!1852 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8130 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8130 (= (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_1!1638 lt!40990) (bvsub to!314 i!635)) lt!41136)))

(declare-fun b!29008 () Bool)

(assert (=> b!29008 (= e!19479 (isEmpty!73 lt!41136))))

(declare-fun b!29009 () Bool)

(assert (=> b!29009 (= e!19479 (> (length!105 lt!41136) 0))))

(declare-fun b!29007 () Bool)

(declare-fun lt!41135 () tuple2!3112)

(declare-fun lt!41137 () (_ BitVec 64))

(assert (=> b!29007 (= e!19478 (tuple2!3111 (Cons!375 (_1!1643 lt!41135) (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_2!1643 lt!41135) (bvsub (bvsub to!314 i!635) lt!41137))) (_2!1643 lt!41135)))))

(assert (=> b!29007 (= lt!41135 (readBit!0 (_1!1638 lt!40990)))))

(assert (=> b!29007 (= lt!41137 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8130 c!1852) b!29006))

(assert (= (and d!8130 (not c!1852)) b!29007))

(assert (= (and d!8130 c!1853) b!29008))

(assert (= (and d!8130 (not c!1853)) b!29009))

(declare-fun m!41815 () Bool)

(assert (=> b!29008 m!41815))

(declare-fun m!41817 () Bool)

(assert (=> b!29009 m!41817))

(declare-fun m!41819 () Bool)

(assert (=> b!29007 m!41819))

(declare-fun m!41821 () Bool)

(assert (=> b!29007 m!41821))

(assert (=> b!28898 d!8130))

(declare-fun b!29010 () Bool)

(declare-fun e!19480 () tuple2!3110)

(assert (=> b!29010 (= e!19480 (tuple2!3111 Nil!376 (_1!1638 lt!40984)))))

(declare-fun d!8132 () Bool)

(declare-fun e!19481 () Bool)

(assert (=> d!8132 e!19481))

(declare-fun c!1855 () Bool)

(assert (=> d!8132 (= c!1855 (= lt!40985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!41139 () List!379)

(assert (=> d!8132 (= lt!41139 (_1!1642 e!19480))))

(declare-fun c!1854 () Bool)

(assert (=> d!8132 (= c!1854 (= lt!40985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8132 (bvsge lt!40985 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8132 (= (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_1!1638 lt!40984) lt!40985) lt!41139)))

(declare-fun b!29012 () Bool)

(assert (=> b!29012 (= e!19481 (isEmpty!73 lt!41139))))

(declare-fun b!29013 () Bool)

(assert (=> b!29013 (= e!19481 (> (length!105 lt!41139) 0))))

(declare-fun lt!41138 () tuple2!3112)

(declare-fun lt!41140 () (_ BitVec 64))

(declare-fun b!29011 () Bool)

(assert (=> b!29011 (= e!19480 (tuple2!3111 (Cons!375 (_1!1643 lt!41138) (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_2!1643 lt!41138) (bvsub lt!40985 lt!41140))) (_2!1643 lt!41138)))))

(assert (=> b!29011 (= lt!41138 (readBit!0 (_1!1638 lt!40984)))))

(assert (=> b!29011 (= lt!41140 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!8132 c!1854) b!29010))

(assert (= (and d!8132 (not c!1854)) b!29011))

(assert (= (and d!8132 c!1855) b!29012))

(assert (= (and d!8132 (not c!1855)) b!29013))

(declare-fun m!41823 () Bool)

(assert (=> b!29012 m!41823))

(declare-fun m!41825 () Bool)

(assert (=> b!29013 m!41825))

(declare-fun m!41827 () Bool)

(assert (=> b!29011 m!41827))

(declare-fun m!41829 () Bool)

(assert (=> b!29011 m!41829))

(assert (=> b!28898 d!8132))

(declare-fun d!8134 () Bool)

(assert (=> d!8134 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!40985) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988)))) lt!40985))))

(declare-fun bs!2332 () Bool)

(assert (= bs!2332 d!8134))

(declare-fun m!41831 () Bool)

(assert (=> bs!2332 m!41831))

(assert (=> b!28898 d!8134))

(declare-fun d!8136 () Bool)

(assert (=> d!8136 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!40985)))

(declare-fun lt!41143 () Unit!2249)

(declare-fun choose!9 (BitStream!1356 array!1762 (_ BitVec 64) BitStream!1356) Unit!2249)

(assert (=> d!8136 (= lt!41143 (choose!9 (_2!1639 lt!40988) (buf!1092 (_2!1639 lt!40979)) lt!40985 (BitStream!1357 (buf!1092 (_2!1639 lt!40979)) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988)))))))

(assert (=> d!8136 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1639 lt!40988) (buf!1092 (_2!1639 lt!40979)) lt!40985) lt!41143)))

(declare-fun bs!2333 () Bool)

(assert (= bs!2333 d!8136))

(assert (=> bs!2333 m!41661))

(declare-fun m!41833 () Bool)

(assert (=> bs!2333 m!41833))

(assert (=> b!28898 d!8136))

(declare-fun d!8138 () Bool)

(assert (=> d!8138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2334 () Bool)

(assert (= bs!2334 d!8138))

(declare-fun m!41835 () Bool)

(assert (=> bs!2334 m!41835))

(assert (=> b!28898 d!8138))

(declare-fun d!8140 () Bool)

(declare-fun e!19482 () Bool)

(assert (=> d!8140 e!19482))

(declare-fun res!25090 () Bool)

(assert (=> d!8140 (=> (not res!25090) (not e!19482))))

(declare-fun lt!41161 () tuple2!3102)

(assert (=> d!8140 (= res!25090 (isPrefixOf!0 (_1!1638 lt!41161) (_2!1638 lt!41161)))))

(declare-fun lt!41149 () BitStream!1356)

(assert (=> d!8140 (= lt!41161 (tuple2!3103 lt!41149 (_2!1639 lt!40979)))))

(declare-fun lt!41151 () Unit!2249)

(declare-fun lt!41153 () Unit!2249)

(assert (=> d!8140 (= lt!41151 lt!41153)))

(assert (=> d!8140 (isPrefixOf!0 lt!41149 (_2!1639 lt!40979))))

(assert (=> d!8140 (= lt!41153 (lemmaIsPrefixTransitive!0 lt!41149 (_2!1639 lt!40979) (_2!1639 lt!40979)))))

(declare-fun lt!41144 () Unit!2249)

(declare-fun lt!41154 () Unit!2249)

(assert (=> d!8140 (= lt!41144 lt!41154)))

(assert (=> d!8140 (isPrefixOf!0 lt!41149 (_2!1639 lt!40979))))

(assert (=> d!8140 (= lt!41154 (lemmaIsPrefixTransitive!0 lt!41149 (_2!1639 lt!40988) (_2!1639 lt!40979)))))

(declare-fun lt!41146 () Unit!2249)

(declare-fun e!19483 () Unit!2249)

(assert (=> d!8140 (= lt!41146 e!19483)))

(declare-fun c!1856 () Bool)

(assert (=> d!8140 (= c!1856 (not (= (size!764 (buf!1092 (_2!1639 lt!40988))) #b00000000000000000000000000000000)))))

(declare-fun lt!41152 () Unit!2249)

(declare-fun lt!41158 () Unit!2249)

(assert (=> d!8140 (= lt!41152 lt!41158)))

(assert (=> d!8140 (isPrefixOf!0 (_2!1639 lt!40979) (_2!1639 lt!40979))))

(assert (=> d!8140 (= lt!41158 (lemmaIsPrefixRefl!0 (_2!1639 lt!40979)))))

(declare-fun lt!41145 () Unit!2249)

(declare-fun lt!41160 () Unit!2249)

(assert (=> d!8140 (= lt!41145 lt!41160)))

(assert (=> d!8140 (= lt!41160 (lemmaIsPrefixRefl!0 (_2!1639 lt!40979)))))

(declare-fun lt!41147 () Unit!2249)

(declare-fun lt!41159 () Unit!2249)

(assert (=> d!8140 (= lt!41147 lt!41159)))

(assert (=> d!8140 (isPrefixOf!0 lt!41149 lt!41149)))

(assert (=> d!8140 (= lt!41159 (lemmaIsPrefixRefl!0 lt!41149))))

(declare-fun lt!41155 () Unit!2249)

(declare-fun lt!41157 () Unit!2249)

(assert (=> d!8140 (= lt!41155 lt!41157)))

(assert (=> d!8140 (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!40988))))

(assert (=> d!8140 (= lt!41157 (lemmaIsPrefixRefl!0 (_2!1639 lt!40988)))))

(assert (=> d!8140 (= lt!41149 (BitStream!1357 (buf!1092 (_2!1639 lt!40979)) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))))))

(assert (=> d!8140 (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!40979))))

(assert (=> d!8140 (= (reader!0 (_2!1639 lt!40988) (_2!1639 lt!40979)) lt!41161)))

(declare-fun b!29014 () Bool)

(declare-fun res!25092 () Bool)

(assert (=> b!29014 (=> (not res!25092) (not e!19482))))

(assert (=> b!29014 (= res!25092 (isPrefixOf!0 (_2!1638 lt!41161) (_2!1639 lt!40979)))))

(declare-fun lt!41163 () (_ BitVec 64))

(declare-fun lt!41150 () (_ BitVec 64))

(declare-fun b!29015 () Bool)

(assert (=> b!29015 (= e!19482 (= (_1!1638 lt!41161) (withMovedBitIndex!0 (_2!1638 lt!41161) (bvsub lt!41163 lt!41150))))))

(assert (=> b!29015 (or (= (bvand lt!41163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41163 lt!41150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29015 (= lt!41150 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40979))) (currentByte!2423 (_2!1639 lt!40979)) (currentBit!2418 (_2!1639 lt!40979))))))

(assert (=> b!29015 (= lt!41163 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))))))

(declare-fun b!29016 () Bool)

(declare-fun Unit!2254 () Unit!2249)

(assert (=> b!29016 (= e!19483 Unit!2254)))

(declare-fun b!29017 () Bool)

(declare-fun res!25091 () Bool)

(assert (=> b!29017 (=> (not res!25091) (not e!19482))))

(assert (=> b!29017 (= res!25091 (isPrefixOf!0 (_1!1638 lt!41161) (_2!1639 lt!40988)))))

(declare-fun b!29018 () Bool)

(declare-fun lt!41156 () Unit!2249)

(assert (=> b!29018 (= e!19483 lt!41156)))

(declare-fun lt!41162 () (_ BitVec 64))

(assert (=> b!29018 (= lt!41162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41148 () (_ BitVec 64))

(assert (=> b!29018 (= lt!41148 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))))))

(assert (=> b!29018 (= lt!41156 (arrayBitRangesEqSymmetric!0 (buf!1092 (_2!1639 lt!40988)) (buf!1092 (_2!1639 lt!40979)) lt!41162 lt!41148))))

(assert (=> b!29018 (arrayBitRangesEq!0 (buf!1092 (_2!1639 lt!40979)) (buf!1092 (_2!1639 lt!40988)) lt!41162 lt!41148)))

(assert (= (and d!8140 c!1856) b!29018))

(assert (= (and d!8140 (not c!1856)) b!29016))

(assert (= (and d!8140 res!25090) b!29017))

(assert (= (and b!29017 res!25091) b!29014))

(assert (= (and b!29014 res!25092) b!29015))

(declare-fun m!41837 () Bool)

(assert (=> b!29014 m!41837))

(assert (=> b!29018 m!41627))

(declare-fun m!41839 () Bool)

(assert (=> b!29018 m!41839))

(declare-fun m!41841 () Bool)

(assert (=> b!29018 m!41841))

(declare-fun m!41843 () Bool)

(assert (=> b!29017 m!41843))

(declare-fun m!41845 () Bool)

(assert (=> b!29015 m!41845))

(assert (=> b!29015 m!41645))

(assert (=> b!29015 m!41627))

(declare-fun m!41847 () Bool)

(assert (=> d!8140 m!41847))

(declare-fun m!41849 () Bool)

(assert (=> d!8140 m!41849))

(assert (=> d!8140 m!41673))

(declare-fun m!41851 () Bool)

(assert (=> d!8140 m!41851))

(assert (=> d!8140 m!41803))

(declare-fun m!41853 () Bool)

(assert (=> d!8140 m!41853))

(declare-fun m!41855 () Bool)

(assert (=> d!8140 m!41855))

(declare-fun m!41857 () Bool)

(assert (=> d!8140 m!41857))

(declare-fun m!41859 () Bool)

(assert (=> d!8140 m!41859))

(assert (=> d!8140 m!41811))

(declare-fun m!41861 () Bool)

(assert (=> d!8140 m!41861))

(assert (=> b!28898 d!8140))

(declare-fun d!8142 () Bool)

(assert (=> d!8142 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!41164 () Unit!2249)

(assert (=> d!8142 (= lt!41164 (choose!9 thiss!1379 (buf!1092 (_2!1639 lt!40979)) (bvsub to!314 i!635) (BitStream!1357 (buf!1092 (_2!1639 lt!40979)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379))))))

(assert (=> d!8142 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1092 (_2!1639 lt!40979)) (bvsub to!314 i!635)) lt!41164)))

(declare-fun bs!2335 () Bool)

(assert (= bs!2335 d!8142))

(assert (=> bs!2335 m!41657))

(declare-fun m!41863 () Bool)

(assert (=> bs!2335 m!41863))

(assert (=> b!28898 d!8142))

(declare-fun d!8144 () Bool)

(assert (=> d!8144 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2336 () Bool)

(assert (= bs!2336 d!8144))

(declare-fun m!41865 () Bool)

(assert (=> bs!2336 m!41865))

(assert (=> b!28897 d!8144))

(declare-fun d!8146 () Bool)

(declare-fun res!25095 () Bool)

(declare-fun e!19485 () Bool)

(assert (=> d!8146 (=> (not res!25095) (not e!19485))))

(assert (=> d!8146 (= res!25095 (= (size!764 (buf!1092 (_2!1639 lt!40988))) (size!764 (buf!1092 (_2!1639 lt!40979)))))))

(assert (=> d!8146 (= (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!40979)) e!19485)))

(declare-fun b!29019 () Bool)

(declare-fun res!25093 () Bool)

(assert (=> b!29019 (=> (not res!25093) (not e!19485))))

(assert (=> b!29019 (= res!25093 (bvsle (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))) (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40979))) (currentByte!2423 (_2!1639 lt!40979)) (currentBit!2418 (_2!1639 lt!40979)))))))

(declare-fun b!29020 () Bool)

(declare-fun e!19484 () Bool)

(assert (=> b!29020 (= e!19485 e!19484)))

(declare-fun res!25094 () Bool)

(assert (=> b!29020 (=> res!25094 e!19484)))

(assert (=> b!29020 (= res!25094 (= (size!764 (buf!1092 (_2!1639 lt!40988))) #b00000000000000000000000000000000))))

(declare-fun b!29021 () Bool)

(assert (=> b!29021 (= e!19484 (arrayBitRangesEq!0 (buf!1092 (_2!1639 lt!40988)) (buf!1092 (_2!1639 lt!40979)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988)))))))

(assert (= (and d!8146 res!25095) b!29019))

(assert (= (and b!29019 res!25093) b!29020))

(assert (= (and b!29020 (not res!25094)) b!29021))

(assert (=> b!29019 m!41627))

(assert (=> b!29019 m!41645))

(assert (=> b!29021 m!41627))

(assert (=> b!29021 m!41627))

(declare-fun m!41867 () Bool)

(assert (=> b!29021 m!41867))

(assert (=> b!28897 d!8146))

(declare-fun d!8148 () Bool)

(declare-fun e!19486 () Bool)

(assert (=> d!8148 e!19486))

(declare-fun res!25096 () Bool)

(assert (=> d!8148 (=> (not res!25096) (not e!19486))))

(declare-fun lt!41182 () tuple2!3102)

(assert (=> d!8148 (= res!25096 (isPrefixOf!0 (_1!1638 lt!41182) (_2!1638 lt!41182)))))

(declare-fun lt!41170 () BitStream!1356)

(assert (=> d!8148 (= lt!41182 (tuple2!3103 lt!41170 (_2!1639 lt!40988)))))

(declare-fun lt!41172 () Unit!2249)

(declare-fun lt!41174 () Unit!2249)

(assert (=> d!8148 (= lt!41172 lt!41174)))

(assert (=> d!8148 (isPrefixOf!0 lt!41170 (_2!1639 lt!40988))))

(assert (=> d!8148 (= lt!41174 (lemmaIsPrefixTransitive!0 lt!41170 (_2!1639 lt!40988) (_2!1639 lt!40988)))))

(declare-fun lt!41165 () Unit!2249)

(declare-fun lt!41175 () Unit!2249)

(assert (=> d!8148 (= lt!41165 lt!41175)))

(assert (=> d!8148 (isPrefixOf!0 lt!41170 (_2!1639 lt!40988))))

(assert (=> d!8148 (= lt!41175 (lemmaIsPrefixTransitive!0 lt!41170 thiss!1379 (_2!1639 lt!40988)))))

(declare-fun lt!41167 () Unit!2249)

(declare-fun e!19487 () Unit!2249)

(assert (=> d!8148 (= lt!41167 e!19487)))

(declare-fun c!1857 () Bool)

(assert (=> d!8148 (= c!1857 (not (= (size!764 (buf!1092 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!41173 () Unit!2249)

(declare-fun lt!41179 () Unit!2249)

(assert (=> d!8148 (= lt!41173 lt!41179)))

(assert (=> d!8148 (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!40988))))

(assert (=> d!8148 (= lt!41179 (lemmaIsPrefixRefl!0 (_2!1639 lt!40988)))))

(declare-fun lt!41166 () Unit!2249)

(declare-fun lt!41181 () Unit!2249)

(assert (=> d!8148 (= lt!41166 lt!41181)))

(assert (=> d!8148 (= lt!41181 (lemmaIsPrefixRefl!0 (_2!1639 lt!40988)))))

(declare-fun lt!41168 () Unit!2249)

(declare-fun lt!41180 () Unit!2249)

(assert (=> d!8148 (= lt!41168 lt!41180)))

(assert (=> d!8148 (isPrefixOf!0 lt!41170 lt!41170)))

(assert (=> d!8148 (= lt!41180 (lemmaIsPrefixRefl!0 lt!41170))))

(declare-fun lt!41176 () Unit!2249)

(declare-fun lt!41178 () Unit!2249)

(assert (=> d!8148 (= lt!41176 lt!41178)))

(assert (=> d!8148 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8148 (= lt!41178 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8148 (= lt!41170 (BitStream!1357 (buf!1092 (_2!1639 lt!40988)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(assert (=> d!8148 (isPrefixOf!0 thiss!1379 (_2!1639 lt!40988))))

(assert (=> d!8148 (= (reader!0 thiss!1379 (_2!1639 lt!40988)) lt!41182)))

(declare-fun b!29022 () Bool)

(declare-fun res!25098 () Bool)

(assert (=> b!29022 (=> (not res!25098) (not e!19486))))

(assert (=> b!29022 (= res!25098 (isPrefixOf!0 (_2!1638 lt!41182) (_2!1639 lt!40988)))))

(declare-fun lt!41184 () (_ BitVec 64))

(declare-fun b!29023 () Bool)

(declare-fun lt!41171 () (_ BitVec 64))

(assert (=> b!29023 (= e!19486 (= (_1!1638 lt!41182) (withMovedBitIndex!0 (_2!1638 lt!41182) (bvsub lt!41184 lt!41171))))))

(assert (=> b!29023 (or (= (bvand lt!41184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41171 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41184 lt!41171) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29023 (= lt!41171 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))))))

(assert (=> b!29023 (= lt!41184 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(declare-fun b!29024 () Bool)

(declare-fun Unit!2255 () Unit!2249)

(assert (=> b!29024 (= e!19487 Unit!2255)))

(declare-fun b!29025 () Bool)

(declare-fun res!25097 () Bool)

(assert (=> b!29025 (=> (not res!25097) (not e!19486))))

(assert (=> b!29025 (= res!25097 (isPrefixOf!0 (_1!1638 lt!41182) thiss!1379))))

(declare-fun b!29026 () Bool)

(declare-fun lt!41177 () Unit!2249)

(assert (=> b!29026 (= e!19487 lt!41177)))

(declare-fun lt!41183 () (_ BitVec 64))

(assert (=> b!29026 (= lt!41183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!41169 () (_ BitVec 64))

(assert (=> b!29026 (= lt!41169 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(assert (=> b!29026 (= lt!41177 (arrayBitRangesEqSymmetric!0 (buf!1092 thiss!1379) (buf!1092 (_2!1639 lt!40988)) lt!41183 lt!41169))))

(assert (=> b!29026 (arrayBitRangesEq!0 (buf!1092 (_2!1639 lt!40988)) (buf!1092 thiss!1379) lt!41183 lt!41169)))

(assert (= (and d!8148 c!1857) b!29026))

(assert (= (and d!8148 (not c!1857)) b!29024))

(assert (= (and d!8148 res!25096) b!29025))

(assert (= (and b!29025 res!25097) b!29022))

(assert (= (and b!29022 res!25098) b!29023))

(declare-fun m!41869 () Bool)

(assert (=> b!29022 m!41869))

(assert (=> b!29026 m!41643))

(declare-fun m!41871 () Bool)

(assert (=> b!29026 m!41871))

(declare-fun m!41873 () Bool)

(assert (=> b!29026 m!41873))

(declare-fun m!41875 () Bool)

(assert (=> b!29025 m!41875))

(declare-fun m!41877 () Bool)

(assert (=> b!29023 m!41877))

(assert (=> b!29023 m!41627))

(assert (=> b!29023 m!41643))

(declare-fun m!41879 () Bool)

(assert (=> d!8148 m!41879))

(assert (=> d!8148 m!41641))

(assert (=> d!8148 m!41617))

(declare-fun m!41881 () Bool)

(assert (=> d!8148 m!41881))

(assert (=> d!8148 m!41859))

(declare-fun m!41883 () Bool)

(assert (=> d!8148 m!41883))

(declare-fun m!41885 () Bool)

(assert (=> d!8148 m!41885))

(declare-fun m!41887 () Bool)

(assert (=> d!8148 m!41887))

(assert (=> d!8148 m!41639))

(assert (=> d!8148 m!41849))

(declare-fun m!41889 () Bool)

(assert (=> d!8148 m!41889))

(assert (=> b!28897 d!8148))

(declare-fun b!29210 () Bool)

(declare-fun e!19581 () tuple2!3104)

(declare-fun lt!41611 () tuple2!3104)

(declare-fun Unit!2256 () Unit!2249)

(assert (=> b!29210 (= e!19581 (tuple2!3105 Unit!2256 (_2!1639 lt!41611)))))

(declare-fun lt!41633 () tuple2!3104)

(assert (=> b!29210 (= lt!41633 (appendBitFromByte!0 (_2!1639 lt!40988) (select (arr!1227 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!41618 () (_ BitVec 64))

(assert (=> b!29210 (= lt!41618 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41620 () (_ BitVec 64))

(assert (=> b!29210 (= lt!41620 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41613 () Unit!2249)

(assert (=> b!29210 (= lt!41613 (validateOffsetBitsIneqLemma!0 (_2!1639 lt!40988) (_2!1639 lt!41633) lt!41618 lt!41620))))

(assert (=> b!29210 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!41633)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!41633))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!41633))) (bvsub lt!41618 lt!41620))))

(declare-fun lt!41630 () Unit!2249)

(assert (=> b!29210 (= lt!41630 lt!41613)))

(declare-fun lt!41598 () tuple2!3102)

(assert (=> b!29210 (= lt!41598 (reader!0 (_2!1639 lt!40988) (_2!1639 lt!41633)))))

(declare-fun lt!41595 () (_ BitVec 64))

(assert (=> b!29210 (= lt!41595 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41628 () Unit!2249)

(assert (=> b!29210 (= lt!41628 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1639 lt!40988) (buf!1092 (_2!1639 lt!41633)) lt!41595))))

(assert (=> b!29210 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!41633)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!41595)))

(declare-fun lt!41596 () Unit!2249)

(assert (=> b!29210 (= lt!41596 lt!41628)))

(assert (=> b!29210 (= (head!216 (byteArrayBitContentToList!0 (_2!1639 lt!41633) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!216 (bitStreamReadBitsIntoList!0 (_2!1639 lt!41633) (_1!1638 lt!41598) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41619 () Unit!2249)

(declare-fun Unit!2257 () Unit!2249)

(assert (=> b!29210 (= lt!41619 Unit!2257)))

(assert (=> b!29210 (= lt!41611 (appendBitsMSBFirstLoop!0 (_2!1639 lt!41633) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!41602 () Unit!2249)

(assert (=> b!29210 (= lt!41602 (lemmaIsPrefixTransitive!0 (_2!1639 lt!40988) (_2!1639 lt!41633) (_2!1639 lt!41611)))))

(assert (=> b!29210 (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!41611))))

(declare-fun lt!41624 () Unit!2249)

(assert (=> b!29210 (= lt!41624 lt!41602)))

(assert (=> b!29210 (= (size!764 (buf!1092 (_2!1639 lt!41611))) (size!764 (buf!1092 (_2!1639 lt!40988))))))

(declare-fun lt!41599 () Unit!2249)

(declare-fun Unit!2258 () Unit!2249)

(assert (=> b!29210 (= lt!41599 Unit!2258)))

(assert (=> b!29210 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41611))) (currentByte!2423 (_2!1639 lt!41611)) (currentBit!2418 (_2!1639 lt!41611))) (bvsub (bvadd (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41594 () Unit!2249)

(declare-fun Unit!2259 () Unit!2249)

(assert (=> b!29210 (= lt!41594 Unit!2259)))

(assert (=> b!29210 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41611))) (currentByte!2423 (_2!1639 lt!41611)) (currentBit!2418 (_2!1639 lt!41611))) (bvsub (bvsub (bvadd (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41633))) (currentByte!2423 (_2!1639 lt!41633)) (currentBit!2418 (_2!1639 lt!41633))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41606 () Unit!2249)

(declare-fun Unit!2260 () Unit!2249)

(assert (=> b!29210 (= lt!41606 Unit!2260)))

(declare-fun lt!41604 () tuple2!3102)

(assert (=> b!29210 (= lt!41604 (reader!0 (_2!1639 lt!40988) (_2!1639 lt!41611)))))

(declare-fun lt!41616 () (_ BitVec 64))

(assert (=> b!29210 (= lt!41616 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41617 () Unit!2249)

(assert (=> b!29210 (= lt!41617 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1639 lt!40988) (buf!1092 (_2!1639 lt!41611)) lt!41616))))

(assert (=> b!29210 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!41611)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!41616)))

(declare-fun lt!41610 () Unit!2249)

(assert (=> b!29210 (= lt!41610 lt!41617)))

(declare-fun lt!41608 () tuple2!3102)

(declare-fun call!367 () tuple2!3102)

(assert (=> b!29210 (= lt!41608 call!367)))

(declare-fun lt!41601 () (_ BitVec 64))

(assert (=> b!29210 (= lt!41601 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!41615 () Unit!2249)

(assert (=> b!29210 (= lt!41615 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1639 lt!41633) (buf!1092 (_2!1639 lt!41611)) lt!41601))))

(assert (=> b!29210 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!41611)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!41633))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!41633))) lt!41601)))

(declare-fun lt!41634 () Unit!2249)

(assert (=> b!29210 (= lt!41634 lt!41615)))

(declare-fun lt!41597 () List!379)

(assert (=> b!29210 (= lt!41597 (byteArrayBitContentToList!0 (_2!1639 lt!41611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!41621 () List!379)

(assert (=> b!29210 (= lt!41621 (byteArrayBitContentToList!0 (_2!1639 lt!41611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41631 () List!379)

(assert (=> b!29210 (= lt!41631 (bitStreamReadBitsIntoList!0 (_2!1639 lt!41611) (_1!1638 lt!41604) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!41614 () List!379)

(assert (=> b!29210 (= lt!41614 (bitStreamReadBitsIntoList!0 (_2!1639 lt!41611) (_1!1638 lt!41608) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!41627 () (_ BitVec 64))

(assert (=> b!29210 (= lt!41627 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!41600 () Unit!2249)

(assert (=> b!29210 (= lt!41600 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1639 lt!41611) (_2!1639 lt!41611) (_1!1638 lt!41604) (_1!1638 lt!41608) lt!41627 lt!41631))))

(assert (=> b!29210 (= (bitStreamReadBitsIntoList!0 (_2!1639 lt!41611) (_1!1638 lt!41608) (bvsub lt!41627 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!96 lt!41631))))

(declare-fun lt!41629 () Unit!2249)

(assert (=> b!29210 (= lt!41629 lt!41600)))

(declare-fun lt!41593 () (_ BitVec 64))

(declare-fun lt!41622 () Unit!2249)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1762 array!1762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2249)

(assert (=> b!29210 (= lt!41622 (arrayBitRangesEqImpliesEq!0 (buf!1092 (_2!1639 lt!41633)) (buf!1092 (_2!1639 lt!41611)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!41593 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41633))) (currentByte!2423 (_2!1639 lt!41633)) (currentBit!2418 (_2!1639 lt!41633)))))))

(declare-fun bitAt!0 (array!1762 (_ BitVec 64)) Bool)

(assert (=> b!29210 (= (bitAt!0 (buf!1092 (_2!1639 lt!41633)) lt!41593) (bitAt!0 (buf!1092 (_2!1639 lt!41611)) lt!41593))))

(declare-fun lt!41603 () Unit!2249)

(assert (=> b!29210 (= lt!41603 lt!41622)))

(declare-fun d!8150 () Bool)

(declare-fun e!19582 () Bool)

(assert (=> d!8150 e!19582))

(declare-fun res!25210 () Bool)

(assert (=> d!8150 (=> (not res!25210) (not e!19582))))

(declare-fun lt!41626 () (_ BitVec 64))

(declare-fun lt!41632 () tuple2!3104)

(assert (=> d!8150 (= res!25210 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41632))) (currentByte!2423 (_2!1639 lt!41632)) (currentBit!2418 (_2!1639 lt!41632))) (bvsub lt!41626 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8150 (or (= (bvand lt!41626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41626 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!41635 () (_ BitVec 64))

(assert (=> d!8150 (= lt!41626 (bvadd lt!41635 to!314))))

(assert (=> d!8150 (or (not (= (bvand lt!41635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!41635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!41635 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8150 (= lt!41635 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))))))

(assert (=> d!8150 (= lt!41632 e!19581)))

(declare-fun c!1894 () Bool)

(assert (=> d!8150 (= c!1894 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!41605 () Unit!2249)

(declare-fun lt!41612 () Unit!2249)

(assert (=> d!8150 (= lt!41605 lt!41612)))

(assert (=> d!8150 (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!40988))))

(assert (=> d!8150 (= lt!41612 (lemmaIsPrefixRefl!0 (_2!1639 lt!40988)))))

(assert (=> d!8150 (= lt!41593 (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))))))

(assert (=> d!8150 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8150 (= (appendBitsMSBFirstLoop!0 (_2!1639 lt!40988) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!41632)))

(declare-fun b!29211 () Bool)

(declare-fun res!25214 () Bool)

(assert (=> b!29211 (=> (not res!25214) (not e!19582))))

(assert (=> b!29211 (= res!25214 (= (size!764 (buf!1092 (_2!1639 lt!40988))) (size!764 (buf!1092 (_2!1639 lt!41632)))))))

(declare-fun b!29212 () Bool)

(declare-fun Unit!2261 () Unit!2249)

(assert (=> b!29212 (= e!19581 (tuple2!3105 Unit!2261 (_2!1639 lt!40988)))))

(assert (=> b!29212 (= (size!764 (buf!1092 (_2!1639 lt!40988))) (size!764 (buf!1092 (_2!1639 lt!40988))))))

(declare-fun lt!41607 () Unit!2249)

(declare-fun Unit!2262 () Unit!2249)

(assert (=> b!29212 (= lt!41607 Unit!2262)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1356 array!1762 array!1762 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3114 0))(
  ( (tuple2!3115 (_1!1644 array!1762) (_2!1644 BitStream!1356)) )
))
(declare-fun readBits!0 (BitStream!1356 (_ BitVec 64)) tuple2!3114)

(assert (=> b!29212 (checkByteArrayBitContent!0 (_2!1639 lt!40988) srcBuffer!2 (_1!1644 (readBits!0 (_1!1638 call!367) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!29213 () Bool)

(declare-fun res!25212 () Bool)

(assert (=> b!29213 (=> (not res!25212) (not e!19582))))

(assert (=> b!29213 (= res!25212 (invariant!0 (currentBit!2418 (_2!1639 lt!41632)) (currentByte!2423 (_2!1639 lt!41632)) (size!764 (buf!1092 (_2!1639 lt!41632)))))))

(declare-fun b!29214 () Bool)

(declare-fun res!25211 () Bool)

(assert (=> b!29214 (=> (not res!25211) (not e!19582))))

(assert (=> b!29214 (= res!25211 (= (size!764 (buf!1092 (_2!1639 lt!41632))) (size!764 (buf!1092 (_2!1639 lt!40988)))))))

(declare-fun bm!364 () Bool)

(assert (=> bm!364 (= call!367 (reader!0 (ite c!1894 (_2!1639 lt!41633) (_2!1639 lt!40988)) (ite c!1894 (_2!1639 lt!41611) (_2!1639 lt!40988))))))

(declare-fun b!29215 () Bool)

(declare-fun e!19583 () Bool)

(declare-fun lt!41623 () (_ BitVec 64))

(assert (=> b!29215 (= e!19583 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!41623))))

(declare-fun b!29216 () Bool)

(declare-fun lt!41625 () tuple2!3102)

(assert (=> b!29216 (= e!19582 (= (bitStreamReadBitsIntoList!0 (_2!1639 lt!41632) (_1!1638 lt!41625) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1639 lt!41632) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!29216 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29216 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!41609 () Unit!2249)

(declare-fun lt!41636 () Unit!2249)

(assert (=> b!29216 (= lt!41609 lt!41636)))

(assert (=> b!29216 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!41632)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!41623)))

(assert (=> b!29216 (= lt!41636 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1639 lt!40988) (buf!1092 (_2!1639 lt!41632)) lt!41623))))

(assert (=> b!29216 e!19583))

(declare-fun res!25209 () Bool)

(assert (=> b!29216 (=> (not res!25209) (not e!19583))))

(assert (=> b!29216 (= res!25209 (and (= (size!764 (buf!1092 (_2!1639 lt!40988))) (size!764 (buf!1092 (_2!1639 lt!41632)))) (bvsge lt!41623 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29216 (= lt!41623 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!29216 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29216 (= lt!41625 (reader!0 (_2!1639 lt!40988) (_2!1639 lt!41632)))))

(declare-fun b!29217 () Bool)

(declare-fun res!25213 () Bool)

(assert (=> b!29217 (=> (not res!25213) (not e!19582))))

(assert (=> b!29217 (= res!25213 (isPrefixOf!0 (_2!1639 lt!40988) (_2!1639 lt!41632)))))

(assert (= (and d!8150 c!1894) b!29210))

(assert (= (and d!8150 (not c!1894)) b!29212))

(assert (= (or b!29210 b!29212) bm!364))

(assert (= (and d!8150 res!25210) b!29213))

(assert (= (and b!29213 res!25212) b!29211))

(assert (= (and b!29211 res!25214) b!29217))

(assert (= (and b!29217 res!25213) b!29214))

(assert (= (and b!29214 res!25211) b!29216))

(assert (= (and b!29216 res!25209) b!29215))

(declare-fun m!42143 () Bool)

(assert (=> b!29212 m!42143))

(declare-fun m!42145 () Bool)

(assert (=> b!29212 m!42145))

(declare-fun m!42147 () Bool)

(assert (=> b!29210 m!42147))

(declare-fun m!42149 () Bool)

(assert (=> b!29210 m!42149))

(declare-fun m!42151 () Bool)

(assert (=> b!29210 m!42151))

(declare-fun m!42153 () Bool)

(assert (=> b!29210 m!42153))

(assert (=> b!29210 m!42153))

(declare-fun m!42155 () Bool)

(assert (=> b!29210 m!42155))

(declare-fun m!42157 () Bool)

(assert (=> b!29210 m!42157))

(declare-fun m!42159 () Bool)

(assert (=> b!29210 m!42159))

(declare-fun m!42161 () Bool)

(assert (=> b!29210 m!42161))

(declare-fun m!42163 () Bool)

(assert (=> b!29210 m!42163))

(declare-fun m!42165 () Bool)

(assert (=> b!29210 m!42165))

(assert (=> b!29210 m!42157))

(declare-fun m!42167 () Bool)

(assert (=> b!29210 m!42167))

(declare-fun m!42169 () Bool)

(assert (=> b!29210 m!42169))

(declare-fun m!42171 () Bool)

(assert (=> b!29210 m!42171))

(declare-fun m!42173 () Bool)

(assert (=> b!29210 m!42173))

(declare-fun m!42175 () Bool)

(assert (=> b!29210 m!42175))

(declare-fun m!42177 () Bool)

(assert (=> b!29210 m!42177))

(declare-fun m!42179 () Bool)

(assert (=> b!29210 m!42179))

(assert (=> b!29210 m!42163))

(declare-fun m!42181 () Bool)

(assert (=> b!29210 m!42181))

(declare-fun m!42183 () Bool)

(assert (=> b!29210 m!42183))

(declare-fun m!42185 () Bool)

(assert (=> b!29210 m!42185))

(declare-fun m!42187 () Bool)

(assert (=> b!29210 m!42187))

(assert (=> b!29210 m!41627))

(declare-fun m!42189 () Bool)

(assert (=> b!29210 m!42189))

(declare-fun m!42191 () Bool)

(assert (=> b!29210 m!42191))

(declare-fun m!42193 () Bool)

(assert (=> b!29210 m!42193))

(assert (=> b!29210 m!42159))

(declare-fun m!42195 () Bool)

(assert (=> b!29210 m!42195))

(declare-fun m!42197 () Bool)

(assert (=> b!29210 m!42197))

(declare-fun m!42199 () Bool)

(assert (=> b!29210 m!42199))

(declare-fun m!42201 () Bool)

(assert (=> b!29210 m!42201))

(declare-fun m!42203 () Bool)

(assert (=> b!29210 m!42203))

(declare-fun m!42205 () Bool)

(assert (=> b!29210 m!42205))

(declare-fun m!42207 () Bool)

(assert (=> b!29210 m!42207))

(declare-fun m!42209 () Bool)

(assert (=> b!29217 m!42209))

(declare-fun m!42211 () Bool)

(assert (=> b!29216 m!42211))

(declare-fun m!42213 () Bool)

(assert (=> b!29216 m!42213))

(declare-fun m!42215 () Bool)

(assert (=> b!29216 m!42215))

(declare-fun m!42217 () Bool)

(assert (=> b!29216 m!42217))

(declare-fun m!42219 () Bool)

(assert (=> b!29216 m!42219))

(declare-fun m!42221 () Bool)

(assert (=> b!29215 m!42221))

(declare-fun m!42223 () Bool)

(assert (=> d!8150 m!42223))

(assert (=> d!8150 m!41627))

(assert (=> d!8150 m!41859))

(assert (=> d!8150 m!41849))

(declare-fun m!42225 () Bool)

(assert (=> b!29213 m!42225))

(declare-fun m!42227 () Bool)

(assert (=> bm!364 m!42227))

(assert (=> b!28897 d!8150))

(declare-fun d!8276 () Bool)

(assert (=> d!8276 (isPrefixOf!0 thiss!1379 (_2!1639 lt!40979))))

(declare-fun lt!41639 () Unit!2249)

(declare-fun choose!30 (BitStream!1356 BitStream!1356 BitStream!1356) Unit!2249)

(assert (=> d!8276 (= lt!41639 (choose!30 thiss!1379 (_2!1639 lt!40988) (_2!1639 lt!40979)))))

(assert (=> d!8276 (isPrefixOf!0 thiss!1379 (_2!1639 lt!40988))))

(assert (=> d!8276 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1639 lt!40988) (_2!1639 lt!40979)) lt!41639)))

(declare-fun bs!2360 () Bool)

(assert (= bs!2360 d!8276))

(assert (=> bs!2360 m!41677))

(declare-fun m!42229 () Bool)

(assert (=> bs!2360 m!42229))

(assert (=> bs!2360 m!41617))

(assert (=> b!28897 d!8276))

(declare-fun d!8278 () Bool)

(assert (=> d!8278 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41640 () Unit!2249)

(assert (=> d!8278 (= lt!41640 (choose!9 thiss!1379 (buf!1092 (_2!1639 lt!40988)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1357 (buf!1092 (_2!1639 lt!40988)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379))))))

(assert (=> d!8278 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1092 (_2!1639 lt!40988)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41640)))

(declare-fun bs!2361 () Bool)

(assert (= bs!2361 d!8278))

(assert (=> bs!2361 m!41671))

(declare-fun m!42231 () Bool)

(assert (=> bs!2361 m!42231))

(assert (=> b!28897 d!8278))

(declare-fun d!8280 () Bool)

(declare-fun res!25217 () Bool)

(declare-fun e!19585 () Bool)

(assert (=> d!8280 (=> (not res!25217) (not e!19585))))

(assert (=> d!8280 (= res!25217 (= (size!764 (buf!1092 thiss!1379)) (size!764 (buf!1092 (_2!1639 lt!40979)))))))

(assert (=> d!8280 (= (isPrefixOf!0 thiss!1379 (_2!1639 lt!40979)) e!19585)))

(declare-fun b!29218 () Bool)

(declare-fun res!25215 () Bool)

(assert (=> b!29218 (=> (not res!25215) (not e!19585))))

(assert (=> b!29218 (= res!25215 (bvsle (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)) (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40979))) (currentByte!2423 (_2!1639 lt!40979)) (currentBit!2418 (_2!1639 lt!40979)))))))

(declare-fun b!29219 () Bool)

(declare-fun e!19584 () Bool)

(assert (=> b!29219 (= e!19585 e!19584)))

(declare-fun res!25216 () Bool)

(assert (=> b!29219 (=> res!25216 e!19584)))

(assert (=> b!29219 (= res!25216 (= (size!764 (buf!1092 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29220 () Bool)

(assert (=> b!29220 (= e!19584 (arrayBitRangesEq!0 (buf!1092 thiss!1379) (buf!1092 (_2!1639 lt!40979)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379))))))

(assert (= (and d!8280 res!25217) b!29218))

(assert (= (and b!29218 res!25215) b!29219))

(assert (= (and b!29219 (not res!25216)) b!29220))

(assert (=> b!29218 m!41643))

(assert (=> b!29218 m!41645))

(assert (=> b!29220 m!41643))

(assert (=> b!29220 m!41643))

(declare-fun m!42233 () Bool)

(assert (=> b!29220 m!42233))

(assert (=> b!28897 d!8280))

(declare-fun d!8282 () Bool)

(assert (=> d!8282 (= (array_inv!731 srcBuffer!2) (bvsge (size!764 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6136 d!8282))

(declare-fun d!8284 () Bool)

(assert (=> d!8284 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2418 thiss!1379) (currentByte!2423 thiss!1379) (size!764 (buf!1092 thiss!1379))))))

(declare-fun bs!2362 () Bool)

(assert (= bs!2362 d!8284))

(assert (=> bs!2362 m!41787))

(assert (=> start!6136 d!8284))

(declare-fun d!8286 () Bool)

(declare-fun res!25220 () Bool)

(declare-fun e!19587 () Bool)

(assert (=> d!8286 (=> (not res!25220) (not e!19587))))

(assert (=> d!8286 (= res!25220 (= (size!764 (buf!1092 thiss!1379)) (size!764 (buf!1092 (_2!1639 lt!40988)))))))

(assert (=> d!8286 (= (isPrefixOf!0 thiss!1379 (_2!1639 lt!40988)) e!19587)))

(declare-fun b!29221 () Bool)

(declare-fun res!25218 () Bool)

(assert (=> b!29221 (=> (not res!25218) (not e!19587))))

(assert (=> b!29221 (= res!25218 (bvsle (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)) (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988)))))))

(declare-fun b!29222 () Bool)

(declare-fun e!19586 () Bool)

(assert (=> b!29222 (= e!19587 e!19586)))

(declare-fun res!25219 () Bool)

(assert (=> b!29222 (=> res!25219 e!19586)))

(assert (=> b!29222 (= res!25219 (= (size!764 (buf!1092 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!29223 () Bool)

(assert (=> b!29223 (= e!19586 (arrayBitRangesEq!0 (buf!1092 thiss!1379) (buf!1092 (_2!1639 lt!40988)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379))))))

(assert (= (and d!8286 res!25220) b!29221))

(assert (= (and b!29221 res!25218) b!29222))

(assert (= (and b!29222 (not res!25219)) b!29223))

(assert (=> b!29221 m!41643))

(assert (=> b!29221 m!41627))

(assert (=> b!29223 m!41643))

(assert (=> b!29223 m!41643))

(declare-fun m!42235 () Bool)

(assert (=> b!29223 m!42235))

(assert (=> b!28907 d!8286))

(declare-fun d!8288 () Bool)

(assert (=> d!8288 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) lt!40985) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988)))) lt!40985))))

(declare-fun bs!2363 () Bool)

(assert (= bs!2363 d!8288))

(declare-fun m!42237 () Bool)

(assert (=> bs!2363 m!42237))

(assert (=> b!28907 d!8288))

(declare-fun d!8290 () Bool)

(declare-fun e!19590 () Bool)

(assert (=> d!8290 e!19590))

(declare-fun res!25223 () Bool)

(assert (=> d!8290 (=> (not res!25223) (not e!19590))))

(assert (=> d!8290 (= res!25223 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!41643 () Unit!2249)

(declare-fun choose!27 (BitStream!1356 BitStream!1356 (_ BitVec 64) (_ BitVec 64)) Unit!2249)

(assert (=> d!8290 (= lt!41643 (choose!27 thiss!1379 (_2!1639 lt!40988) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8290 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8290 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1639 lt!40988) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!41643)))

(declare-fun b!29226 () Bool)

(assert (=> b!29226 (= e!19590 (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8290 res!25223) b!29226))

(declare-fun m!42239 () Bool)

(assert (=> d!8290 m!42239))

(declare-fun m!42241 () Bool)

(assert (=> b!29226 m!42241))

(assert (=> b!28907 d!8290))

(declare-fun b!29244 () Bool)

(declare-fun res!25247 () Bool)

(declare-fun e!19600 () Bool)

(assert (=> b!29244 (=> (not res!25247) (not e!19600))))

(declare-fun lt!41674 () (_ BitVec 64))

(declare-fun lt!41671 () tuple2!3104)

(declare-fun lt!41675 () (_ BitVec 64))

(assert (=> b!29244 (= res!25247 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41671))) (currentByte!2423 (_2!1639 lt!41671)) (currentBit!2418 (_2!1639 lt!41671))) (bvadd lt!41674 lt!41675)))))

(assert (=> b!29244 (or (not (= (bvand lt!41674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!41674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!41674 lt!41675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!29244 (= lt!41675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!29244 (= lt!41674 (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)))))

(declare-fun b!29245 () Bool)

(declare-fun res!25240 () Bool)

(declare-fun e!19602 () Bool)

(assert (=> b!29245 (=> (not res!25240) (not e!19602))))

(declare-fun lt!41669 () tuple2!3104)

(assert (=> b!29245 (= res!25240 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41669))) (currentByte!2423 (_2!1639 lt!41669)) (currentBit!2418 (_2!1639 lt!41669))) (bvadd (bitIndex!0 (size!764 (buf!1092 thiss!1379)) (currentByte!2423 thiss!1379) (currentBit!2418 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!8292 () Bool)

(assert (=> d!8292 e!19600))

(declare-fun res!25246 () Bool)

(assert (=> d!8292 (=> (not res!25246) (not e!19600))))

(assert (=> d!8292 (= res!25246 (= (size!764 (buf!1092 (_2!1639 lt!41671))) (size!764 (buf!1092 thiss!1379))))))

(declare-fun lt!41677 () (_ BitVec 8))

(declare-fun lt!41672 () array!1762)

(assert (=> d!8292 (= lt!41677 (select (arr!1227 lt!41672) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8292 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!764 lt!41672)))))

(assert (=> d!8292 (= lt!41672 (array!1763 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!41679 () tuple2!3104)

(assert (=> d!8292 (= lt!41671 (tuple2!3105 (_1!1639 lt!41679) (_2!1639 lt!41679)))))

(assert (=> d!8292 (= lt!41679 lt!41669)))

(assert (=> d!8292 e!19602))

(declare-fun res!25244 () Bool)

(assert (=> d!8292 (=> (not res!25244) (not e!19602))))

(assert (=> d!8292 (= res!25244 (= (size!764 (buf!1092 thiss!1379)) (size!764 (buf!1092 (_2!1639 lt!41669)))))))

(declare-fun lt!41668 () Bool)

(declare-fun appendBit!0 (BitStream!1356 Bool) tuple2!3104)

(assert (=> d!8292 (= lt!41669 (appendBit!0 thiss!1379 lt!41668))))

(assert (=> d!8292 (= lt!41668 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1227 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8292 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8292 (= (appendBitFromByte!0 thiss!1379 (select (arr!1227 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!41671)))

(declare-fun b!29246 () Bool)

(declare-fun e!19601 () Bool)

(assert (=> b!29246 (= e!19602 e!19601)))

(declare-fun res!25241 () Bool)

(assert (=> b!29246 (=> (not res!25241) (not e!19601))))

(declare-datatypes ((tuple2!3116 0))(
  ( (tuple2!3117 (_1!1645 BitStream!1356) (_2!1645 Bool)) )
))
(declare-fun lt!41676 () tuple2!3116)

(assert (=> b!29246 (= res!25241 (and (= (_2!1645 lt!41676) lt!41668) (= (_1!1645 lt!41676) (_2!1639 lt!41669))))))

(declare-fun readBitPure!0 (BitStream!1356) tuple2!3116)

(declare-fun readerFrom!0 (BitStream!1356 (_ BitVec 32) (_ BitVec 32)) BitStream!1356)

(assert (=> b!29246 (= lt!41676 (readBitPure!0 (readerFrom!0 (_2!1639 lt!41669) (currentBit!2418 thiss!1379) (currentByte!2423 thiss!1379))))))

(declare-fun b!29247 () Bool)

(assert (=> b!29247 (= e!19601 (= (bitIndex!0 (size!764 (buf!1092 (_1!1645 lt!41676))) (currentByte!2423 (_1!1645 lt!41676)) (currentBit!2418 (_1!1645 lt!41676))) (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41669))) (currentByte!2423 (_2!1639 lt!41669)) (currentBit!2418 (_2!1639 lt!41669)))))))

(declare-fun b!29248 () Bool)

(declare-fun e!19599 () Bool)

(declare-fun lt!41678 () tuple2!3116)

(assert (=> b!29248 (= e!19599 (= (bitIndex!0 (size!764 (buf!1092 (_1!1645 lt!41678))) (currentByte!2423 (_1!1645 lt!41678)) (currentBit!2418 (_1!1645 lt!41678))) (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!41671))) (currentByte!2423 (_2!1639 lt!41671)) (currentBit!2418 (_2!1639 lt!41671)))))))

(declare-fun b!29249 () Bool)

(declare-fun res!25245 () Bool)

(assert (=> b!29249 (=> (not res!25245) (not e!19602))))

(assert (=> b!29249 (= res!25245 (isPrefixOf!0 thiss!1379 (_2!1639 lt!41669)))))

(declare-fun b!29250 () Bool)

(assert (=> b!29250 (= e!19600 e!19599)))

(declare-fun res!25243 () Bool)

(assert (=> b!29250 (=> (not res!25243) (not e!19599))))

(assert (=> b!29250 (= res!25243 (and (= (_2!1645 lt!41678) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1227 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!41677)) #b00000000000000000000000000000000))) (= (_1!1645 lt!41678) (_2!1639 lt!41671))))))

(declare-fun lt!41673 () tuple2!3114)

(declare-fun lt!41670 () BitStream!1356)

(assert (=> b!29250 (= lt!41673 (readBits!0 lt!41670 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!29250 (= lt!41678 (readBitPure!0 lt!41670))))

(assert (=> b!29250 (= lt!41670 (readerFrom!0 (_2!1639 lt!41671) (currentBit!2418 thiss!1379) (currentByte!2423 thiss!1379)))))

(declare-fun b!29251 () Bool)

(declare-fun res!25242 () Bool)

(assert (=> b!29251 (=> (not res!25242) (not e!19600))))

(assert (=> b!29251 (= res!25242 (isPrefixOf!0 thiss!1379 (_2!1639 lt!41671)))))

(assert (= (and d!8292 res!25244) b!29245))

(assert (= (and b!29245 res!25240) b!29249))

(assert (= (and b!29249 res!25245) b!29246))

(assert (= (and b!29246 res!25241) b!29247))

(assert (= (and d!8292 res!25246) b!29244))

(assert (= (and b!29244 res!25247) b!29251))

(assert (= (and b!29251 res!25242) b!29250))

(assert (= (and b!29250 res!25243) b!29248))

(declare-fun m!42243 () Bool)

(assert (=> b!29244 m!42243))

(assert (=> b!29244 m!41643))

(declare-fun m!42245 () Bool)

(assert (=> b!29248 m!42245))

(assert (=> b!29248 m!42243))

(declare-fun m!42247 () Bool)

(assert (=> b!29249 m!42247))

(declare-fun m!42249 () Bool)

(assert (=> b!29246 m!42249))

(assert (=> b!29246 m!42249))

(declare-fun m!42251 () Bool)

(assert (=> b!29246 m!42251))

(declare-fun m!42253 () Bool)

(assert (=> b!29247 m!42253))

(declare-fun m!42255 () Bool)

(assert (=> b!29247 m!42255))

(declare-fun m!42257 () Bool)

(assert (=> b!29251 m!42257))

(declare-fun m!42259 () Bool)

(assert (=> b!29250 m!42259))

(declare-fun m!42261 () Bool)

(assert (=> b!29250 m!42261))

(declare-fun m!42263 () Bool)

(assert (=> b!29250 m!42263))

(assert (=> b!29245 m!42255))

(assert (=> b!29245 m!41643))

(declare-fun m!42265 () Bool)

(assert (=> d!8292 m!42265))

(declare-fun m!42267 () Bool)

(assert (=> d!8292 m!42267))

(assert (=> d!8292 m!41769))

(assert (=> b!28907 d!8292))

(declare-fun d!8294 () Bool)

(assert (=> d!8294 (= (tail!96 lt!40989) (t!1129 lt!40989))))

(assert (=> b!28896 d!8294))

(declare-fun d!8296 () Bool)

(declare-fun e!19605 () Bool)

(assert (=> d!8296 e!19605))

(declare-fun res!25250 () Bool)

(assert (=> d!8296 (=> (not res!25250) (not e!19605))))

(declare-fun lt!41685 () (_ BitVec 64))

(assert (=> d!8296 (= res!25250 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41685 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!41685) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8296 (= lt!41685 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!41684 () Unit!2249)

(declare-fun choose!42 (BitStream!1356 BitStream!1356 BitStream!1356 BitStream!1356 (_ BitVec 64) List!379) Unit!2249)

(assert (=> d!8296 (= lt!41684 (choose!42 (_2!1639 lt!40979) (_2!1639 lt!40979) (_1!1638 lt!40990) (_1!1638 lt!40984) (bvsub to!314 i!635) lt!40989))))

(assert (=> d!8296 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8296 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1639 lt!40979) (_2!1639 lt!40979) (_1!1638 lt!40990) (_1!1638 lt!40984) (bvsub to!314 i!635) lt!40989) lt!41684)))

(declare-fun b!29254 () Bool)

(assert (=> b!29254 (= e!19605 (= (bitStreamReadBitsIntoList!0 (_2!1639 lt!40979) (_1!1638 lt!40984) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!96 lt!40989)))))

(assert (= (and d!8296 res!25250) b!29254))

(declare-fun m!42269 () Bool)

(assert (=> d!8296 m!42269))

(declare-fun m!42271 () Bool)

(assert (=> b!29254 m!42271))

(assert (=> b!29254 m!41629))

(assert (=> b!28896 d!8296))

(declare-fun d!8298 () Bool)

(declare-fun size!766 (List!379) Int)

(assert (=> d!8298 (= (length!105 lt!40989) (size!766 lt!40989))))

(declare-fun bs!2364 () Bool)

(assert (= bs!2364 d!8298))

(declare-fun m!42273 () Bool)

(assert (=> bs!2364 m!42273))

(assert (=> b!28895 d!8298))

(declare-fun d!8300 () Bool)

(assert (=> d!8300 (= (invariant!0 (currentBit!2418 (_2!1639 lt!40988)) (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40979)))) (and (bvsge (currentBit!2418 (_2!1639 lt!40988)) #b00000000000000000000000000000000) (bvslt (currentBit!2418 (_2!1639 lt!40988)) #b00000000000000000000000000001000) (bvsge (currentByte!2423 (_2!1639 lt!40988)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40979)))) (and (= (currentBit!2418 (_2!1639 lt!40988)) #b00000000000000000000000000000000) (= (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40979))))))))))

(assert (=> b!28905 d!8300))

(declare-fun d!8302 () Bool)

(assert (=> d!8302 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!764 (buf!1092 thiss!1379))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 thiss!1379))) ((_ sign_extend 32) (currentByte!2423 thiss!1379)) ((_ sign_extend 32) (currentBit!2418 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2365 () Bool)

(assert (= bs!2365 d!8302))

(assert (=> bs!2365 m!41785))

(assert (=> b!28894 d!8302))

(declare-fun d!8304 () Bool)

(declare-fun e!19606 () Bool)

(assert (=> d!8304 e!19606))

(declare-fun res!25251 () Bool)

(assert (=> d!8304 (=> (not res!25251) (not e!19606))))

(declare-fun lt!41691 () (_ BitVec 64))

(declare-fun lt!41687 () (_ BitVec 64))

(declare-fun lt!41689 () (_ BitVec 64))

(assert (=> d!8304 (= res!25251 (= lt!41689 (bvsub lt!41691 lt!41687)))))

(assert (=> d!8304 (or (= (bvand lt!41691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41687 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41691 lt!41687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8304 (= lt!41687 (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40979))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40979)))))))

(declare-fun lt!41690 () (_ BitVec 64))

(declare-fun lt!41686 () (_ BitVec 64))

(assert (=> d!8304 (= lt!41691 (bvmul lt!41690 lt!41686))))

(assert (=> d!8304 (or (= lt!41690 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41686 (bvsdiv (bvmul lt!41690 lt!41686) lt!41690)))))

(assert (=> d!8304 (= lt!41686 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8304 (= lt!41690 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))))))

(assert (=> d!8304 (= lt!41689 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40979))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40979)))))))

(assert (=> d!8304 (invariant!0 (currentBit!2418 (_2!1639 lt!40979)) (currentByte!2423 (_2!1639 lt!40979)) (size!764 (buf!1092 (_2!1639 lt!40979))))))

(assert (=> d!8304 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40979))) (currentByte!2423 (_2!1639 lt!40979)) (currentBit!2418 (_2!1639 lt!40979))) lt!41689)))

(declare-fun b!29255 () Bool)

(declare-fun res!25252 () Bool)

(assert (=> b!29255 (=> (not res!25252) (not e!19606))))

(assert (=> b!29255 (= res!25252 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41689))))

(declare-fun b!29256 () Bool)

(declare-fun lt!41688 () (_ BitVec 64))

(assert (=> b!29256 (= e!19606 (bvsle lt!41689 (bvmul lt!41688 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29256 (or (= lt!41688 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41688 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41688)))))

(assert (=> b!29256 (= lt!41688 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40979)))))))

(assert (= (and d!8304 res!25251) b!29255))

(assert (= (and b!29255 res!25252) b!29256))

(declare-fun m!42275 () Bool)

(assert (=> d!8304 m!42275))

(assert (=> d!8304 m!41613))

(assert (=> b!28904 d!8304))

(declare-fun d!8306 () Bool)

(assert (=> d!8306 (= (array_inv!731 (buf!1092 thiss!1379)) (bvsge (size!764 (buf!1092 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!28903 d!8306))

(declare-fun d!8308 () Bool)

(declare-fun e!19607 () Bool)

(assert (=> d!8308 e!19607))

(declare-fun res!25253 () Bool)

(assert (=> d!8308 (=> (not res!25253) (not e!19607))))

(declare-fun lt!41693 () (_ BitVec 64))

(declare-fun lt!41695 () (_ BitVec 64))

(declare-fun lt!41697 () (_ BitVec 64))

(assert (=> d!8308 (= res!25253 (= lt!41695 (bvsub lt!41697 lt!41693)))))

(assert (=> d!8308 (or (= (bvand lt!41697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!41693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!41697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!41697 lt!41693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8308 (= lt!41693 (remainingBits!0 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))) ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988)))))))

(declare-fun lt!41696 () (_ BitVec 64))

(declare-fun lt!41692 () (_ BitVec 64))

(assert (=> d!8308 (= lt!41697 (bvmul lt!41696 lt!41692))))

(assert (=> d!8308 (or (= lt!41696 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!41692 (bvsdiv (bvmul lt!41696 lt!41692) lt!41696)))))

(assert (=> d!8308 (= lt!41692 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8308 (= lt!41696 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))))))

(assert (=> d!8308 (= lt!41695 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2423 (_2!1639 lt!40988))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2418 (_2!1639 lt!40988)))))))

(assert (=> d!8308 (invariant!0 (currentBit!2418 (_2!1639 lt!40988)) (currentByte!2423 (_2!1639 lt!40988)) (size!764 (buf!1092 (_2!1639 lt!40988))))))

(assert (=> d!8308 (= (bitIndex!0 (size!764 (buf!1092 (_2!1639 lt!40988))) (currentByte!2423 (_2!1639 lt!40988)) (currentBit!2418 (_2!1639 lt!40988))) lt!41695)))

(declare-fun b!29257 () Bool)

(declare-fun res!25254 () Bool)

(assert (=> b!29257 (=> (not res!25254) (not e!19607))))

(assert (=> b!29257 (= res!25254 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!41695))))

(declare-fun b!29258 () Bool)

(declare-fun lt!41694 () (_ BitVec 64))

(assert (=> b!29258 (= e!19607 (bvsle lt!41695 (bvmul lt!41694 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!29258 (or (= lt!41694 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!41694 #b0000000000000000000000000000000000000000000000000000000000001000) lt!41694)))))

(assert (=> b!29258 (= lt!41694 ((_ sign_extend 32) (size!764 (buf!1092 (_2!1639 lt!40988)))))))

(assert (= (and d!8308 res!25253) b!29257))

(assert (= (and b!29257 res!25254) b!29258))

(assert (=> d!8308 m!42237))

(assert (=> d!8308 m!41615))

(assert (=> b!28902 d!8308))

(check-sat (not d!8148) (not b!28984) (not b!29248) (not b!29025) (not b!28963) (not d!8296) (not d!8134) (not b!29249) (not b!29216) (not d!8278) (not b!29244) (not b!29004) (not b!29017) (not b!29215) (not b!29015) (not bm!364) (not b!28973) (not d!8150) (not b!29023) (not b!29007) (not d!8298) (not d!8284) (not b!29217) (not b!29245) (not d!8128) (not b!29026) (not b!29011) (not b!29008) (not b!29254) (not d!8302) (not b!29246) (not d!8304) (not d!8290) (not b!29218) (not b!29013) (not b!29009) (not b!29247) (not b!29019) (not d!8292) (not b!29014) (not d!8288) (not d!8138) (not d!8140) (not b!29012) (not b!28974) (not b!29213) (not b!29002) (not d!8308) (not b!29220) (not b!29022) (not b!29210) (not b!29021) (not d!8136) (not b!29251) (not b!29001) (not d!8276) (not b!29212) (not b!29005) (not b!29018) (not b!29221) (not b!28982) (not b!29223) (not b!29226) (not d!8144) (not b!28975) (not b!29250) (not d!8142) (not d!8126) (not d!8124))
(check-sat)
