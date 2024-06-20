; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5172 () Bool)

(assert start!5172)

(declare-datatypes ((array!1507 0))(
  ( (array!1508 (arr!1088 (Array (_ BitVec 32) (_ BitVec 8))) (size!644 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1507)

(declare-datatypes ((BitStream!1122 0))(
  ( (BitStream!1123 (buf!953 array!1507) (currentByte!2242 (_ BitVec 32)) (currentBit!2237 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2484 0))(
  ( (tuple2!2485 (_1!1327 BitStream!1122) (_2!1327 BitStream!1122)) )
))
(declare-fun lt!29594 () tuple2!2484)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!20876 () Bool)

(declare-datatypes ((Unit!1841 0))(
  ( (Unit!1842) )
))
(declare-datatypes ((tuple2!2486 0))(
  ( (tuple2!2487 (_1!1328 Unit!1841) (_2!1328 BitStream!1122)) )
))
(declare-fun lt!29597 () tuple2!2486)

(declare-fun e!14228 () Bool)

(declare-datatypes ((List!262 0))(
  ( (Nil!259) (Cons!258 (h!377 Bool) (t!1012 List!262)) )
))
(declare-fun head!99 (List!262) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1122 array!1507 (_ BitVec 64) (_ BitVec 64)) List!262)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1122 BitStream!1122 (_ BitVec 64)) List!262)

(assert (=> b!20876 (= e!14228 (= (head!99 (byteArrayBitContentToList!0 (_2!1328 lt!29597) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!99 (bitStreamReadBitsIntoList!0 (_2!1328 lt!29597) (_1!1327 lt!29594) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20877 () Bool)

(declare-fun e!14223 () Bool)

(declare-fun e!14229 () Bool)

(assert (=> b!20877 (= e!14223 e!14229)))

(declare-fun res!18122 () Bool)

(assert (=> b!20877 (=> res!18122 e!14229)))

(declare-fun thiss!1379 () BitStream!1122)

(declare-fun isPrefixOf!0 (BitStream!1122 BitStream!1122) Bool)

(assert (=> b!20877 (= res!18122 (not (isPrefixOf!0 thiss!1379 (_2!1328 lt!29597))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20877 (validate_offset_bits!1 ((_ sign_extend 32) (size!644 (buf!953 (_2!1328 lt!29597)))) ((_ sign_extend 32) (currentByte!2242 (_2!1328 lt!29597))) ((_ sign_extend 32) (currentBit!2237 (_2!1328 lt!29597))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29592 () Unit!1841)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1122 BitStream!1122 (_ BitVec 64) (_ BitVec 64)) Unit!1841)

(assert (=> b!20877 (= lt!29592 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1328 lt!29597) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1122 (_ BitVec 8) (_ BitVec 32)) tuple2!2486)

(assert (=> b!20877 (= lt!29597 (appendBitFromByte!0 thiss!1379 (select (arr!1088 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20878 () Bool)

(declare-fun res!18123 () Bool)

(declare-fun e!14225 () Bool)

(assert (=> b!20878 (=> (not res!18123) (not e!14225))))

(assert (=> b!20878 (= res!18123 (validate_offset_bits!1 ((_ sign_extend 32) (size!644 (buf!953 thiss!1379))) ((_ sign_extend 32) (currentByte!2242 thiss!1379)) ((_ sign_extend 32) (currentBit!2237 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20879 () Bool)

(declare-fun e!14224 () Bool)

(declare-fun lt!29598 () tuple2!2486)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!20879 (= e!14224 (invariant!0 (currentBit!2237 (_2!1328 lt!29598)) (currentByte!2242 (_2!1328 lt!29598)) (size!644 (buf!953 (_2!1328 lt!29598)))))))

(declare-fun b!20880 () Bool)

(assert (=> b!20880 (= e!14229 e!14224)))

(declare-fun res!18120 () Bool)

(assert (=> b!20880 (=> res!18120 e!14224)))

(assert (=> b!20880 (= res!18120 (not (isPrefixOf!0 (_2!1328 lt!29597) (_2!1328 lt!29598))))))

(assert (=> b!20880 (isPrefixOf!0 thiss!1379 (_2!1328 lt!29598))))

(declare-fun lt!29595 () Unit!1841)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1122 BitStream!1122 BitStream!1122) Unit!1841)

(assert (=> b!20880 (= lt!29595 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1328 lt!29597) (_2!1328 lt!29598)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1122 array!1507 (_ BitVec 64) (_ BitVec 64)) tuple2!2486)

(assert (=> b!20880 (= lt!29598 (appendBitsMSBFirstLoop!0 (_2!1328 lt!29597) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!20880 e!14228))

(declare-fun res!18125 () Bool)

(assert (=> b!20880 (=> (not res!18125) (not e!14228))))

(assert (=> b!20880 (= res!18125 (validate_offset_bits!1 ((_ sign_extend 32) (size!644 (buf!953 (_2!1328 lt!29597)))) ((_ sign_extend 32) (currentByte!2242 thiss!1379)) ((_ sign_extend 32) (currentBit!2237 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29593 () Unit!1841)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1122 array!1507 (_ BitVec 64)) Unit!1841)

(assert (=> b!20880 (= lt!29593 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!953 (_2!1328 lt!29597)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1122 BitStream!1122) tuple2!2484)

(assert (=> b!20880 (= lt!29594 (reader!0 thiss!1379 (_2!1328 lt!29597)))))

(declare-fun b!20881 () Bool)

(assert (=> b!20881 (= e!14225 (not e!14223))))

(declare-fun res!18121 () Bool)

(assert (=> b!20881 (=> res!18121 e!14223)))

(assert (=> b!20881 (= res!18121 (bvsge i!635 to!314))))

(assert (=> b!20881 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29599 () Unit!1841)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1122) Unit!1841)

(assert (=> b!20881 (= lt!29599 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29596 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20881 (= lt!29596 (bitIndex!0 (size!644 (buf!953 thiss!1379)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379)))))

(declare-fun res!18124 () Bool)

(assert (=> start!5172 (=> (not res!18124) (not e!14225))))

(assert (=> start!5172 (= res!18124 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!644 srcBuffer!2))))))))

(assert (=> start!5172 e!14225))

(assert (=> start!5172 true))

(declare-fun array_inv!614 (array!1507) Bool)

(assert (=> start!5172 (array_inv!614 srcBuffer!2)))

(declare-fun e!14226 () Bool)

(declare-fun inv!12 (BitStream!1122) Bool)

(assert (=> start!5172 (and (inv!12 thiss!1379) e!14226)))

(declare-fun b!20882 () Bool)

(assert (=> b!20882 (= e!14226 (array_inv!614 (buf!953 thiss!1379)))))

(assert (= (and start!5172 res!18124) b!20878))

(assert (= (and b!20878 res!18123) b!20881))

(assert (= (and b!20881 (not res!18121)) b!20877))

(assert (= (and b!20877 (not res!18122)) b!20880))

(assert (= (and b!20880 res!18125) b!20876))

(assert (= (and b!20880 (not res!18120)) b!20879))

(assert (= start!5172 b!20882))

(declare-fun m!28653 () Bool)

(assert (=> b!20876 m!28653))

(assert (=> b!20876 m!28653))

(declare-fun m!28655 () Bool)

(assert (=> b!20876 m!28655))

(declare-fun m!28657 () Bool)

(assert (=> b!20876 m!28657))

(assert (=> b!20876 m!28657))

(declare-fun m!28659 () Bool)

(assert (=> b!20876 m!28659))

(declare-fun m!28661 () Bool)

(assert (=> start!5172 m!28661))

(declare-fun m!28663 () Bool)

(assert (=> start!5172 m!28663))

(declare-fun m!28665 () Bool)

(assert (=> b!20879 m!28665))

(declare-fun m!28667 () Bool)

(assert (=> b!20878 m!28667))

(declare-fun m!28669 () Bool)

(assert (=> b!20877 m!28669))

(declare-fun m!28671 () Bool)

(assert (=> b!20877 m!28671))

(declare-fun m!28673 () Bool)

(assert (=> b!20877 m!28673))

(declare-fun m!28675 () Bool)

(assert (=> b!20877 m!28675))

(assert (=> b!20877 m!28671))

(declare-fun m!28677 () Bool)

(assert (=> b!20877 m!28677))

(declare-fun m!28679 () Bool)

(assert (=> b!20881 m!28679))

(declare-fun m!28681 () Bool)

(assert (=> b!20881 m!28681))

(declare-fun m!28683 () Bool)

(assert (=> b!20881 m!28683))

(declare-fun m!28685 () Bool)

(assert (=> b!20880 m!28685))

(declare-fun m!28687 () Bool)

(assert (=> b!20880 m!28687))

(declare-fun m!28689 () Bool)

(assert (=> b!20880 m!28689))

(declare-fun m!28691 () Bool)

(assert (=> b!20880 m!28691))

(declare-fun m!28693 () Bool)

(assert (=> b!20880 m!28693))

(declare-fun m!28695 () Bool)

(assert (=> b!20880 m!28695))

(declare-fun m!28697 () Bool)

(assert (=> b!20880 m!28697))

(declare-fun m!28699 () Bool)

(assert (=> b!20882 m!28699))

(check-sat (not b!20878) (not start!5172) (not b!20877) (not b!20880) (not b!20882) (not b!20881) (not b!20879) (not b!20876))
(check-sat)
(get-model)

(declare-fun d!6642 () Bool)

(assert (=> d!6642 (= (array_inv!614 srcBuffer!2) (bvsge (size!644 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5172 d!6642))

(declare-fun d!6644 () Bool)

(assert (=> d!6644 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2237 thiss!1379) (currentByte!2242 thiss!1379) (size!644 (buf!953 thiss!1379))))))

(declare-fun bs!1973 () Bool)

(assert (= bs!1973 d!6644))

(declare-fun m!28749 () Bool)

(assert (=> bs!1973 m!28749))

(assert (=> start!5172 d!6644))

(declare-fun d!6646 () Bool)

(assert (=> d!6646 (validate_offset_bits!1 ((_ sign_extend 32) (size!644 (buf!953 (_2!1328 lt!29597)))) ((_ sign_extend 32) (currentByte!2242 thiss!1379)) ((_ sign_extend 32) (currentBit!2237 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!29626 () Unit!1841)

(declare-fun choose!9 (BitStream!1122 array!1507 (_ BitVec 64) BitStream!1122) Unit!1841)

(assert (=> d!6646 (= lt!29626 (choose!9 thiss!1379 (buf!953 (_2!1328 lt!29597)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1123 (buf!953 (_2!1328 lt!29597)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379))))))

(assert (=> d!6646 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!953 (_2!1328 lt!29597)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!29626)))

(declare-fun bs!1974 () Bool)

(assert (= bs!1974 d!6646))

(assert (=> bs!1974 m!28685))

(declare-fun m!28751 () Bool)

(assert (=> bs!1974 m!28751))

(assert (=> b!20880 d!6646))

(declare-fun d!6650 () Bool)

(declare-fun res!18152 () Bool)

(declare-fun e!14261 () Bool)

(assert (=> d!6650 (=> (not res!18152) (not e!14261))))

(assert (=> d!6650 (= res!18152 (= (size!644 (buf!953 thiss!1379)) (size!644 (buf!953 (_2!1328 lt!29598)))))))

(assert (=> d!6650 (= (isPrefixOf!0 thiss!1379 (_2!1328 lt!29598)) e!14261)))

(declare-fun b!20916 () Bool)

(declare-fun res!18151 () Bool)

(assert (=> b!20916 (=> (not res!18151) (not e!14261))))

(assert (=> b!20916 (= res!18151 (bvsle (bitIndex!0 (size!644 (buf!953 thiss!1379)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379)) (bitIndex!0 (size!644 (buf!953 (_2!1328 lt!29598))) (currentByte!2242 (_2!1328 lt!29598)) (currentBit!2237 (_2!1328 lt!29598)))))))

(declare-fun b!20917 () Bool)

(declare-fun e!14262 () Bool)

(assert (=> b!20917 (= e!14261 e!14262)))

(declare-fun res!18150 () Bool)

(assert (=> b!20917 (=> res!18150 e!14262)))

(assert (=> b!20917 (= res!18150 (= (size!644 (buf!953 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20918 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1507 array!1507 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20918 (= e!14262 (arrayBitRangesEq!0 (buf!953 thiss!1379) (buf!953 (_2!1328 lt!29598)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!644 (buf!953 thiss!1379)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379))))))

(assert (= (and d!6650 res!18152) b!20916))

(assert (= (and b!20916 res!18151) b!20917))

(assert (= (and b!20917 (not res!18150)) b!20918))

(assert (=> b!20916 m!28683))

(declare-fun m!28757 () Bool)

(assert (=> b!20916 m!28757))

(assert (=> b!20918 m!28683))

(assert (=> b!20918 m!28683))

(declare-fun m!28759 () Bool)

(assert (=> b!20918 m!28759))

(assert (=> b!20880 d!6650))

(declare-fun d!6658 () Bool)

(assert (=> d!6658 (isPrefixOf!0 thiss!1379 (_2!1328 lt!29598))))

(declare-fun lt!29629 () Unit!1841)

(declare-fun choose!30 (BitStream!1122 BitStream!1122 BitStream!1122) Unit!1841)

(assert (=> d!6658 (= lt!29629 (choose!30 thiss!1379 (_2!1328 lt!29597) (_2!1328 lt!29598)))))

(assert (=> d!6658 (isPrefixOf!0 thiss!1379 (_2!1328 lt!29597))))

(assert (=> d!6658 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1328 lt!29597) (_2!1328 lt!29598)) lt!29629)))

(declare-fun bs!1975 () Bool)

(assert (= bs!1975 d!6658))

(assert (=> bs!1975 m!28693))

(declare-fun m!28761 () Bool)

(assert (=> bs!1975 m!28761))

(assert (=> bs!1975 m!28669))

(assert (=> b!20880 d!6658))

(declare-fun d!6660 () Bool)

(declare-fun res!18155 () Bool)

(declare-fun e!14263 () Bool)

(assert (=> d!6660 (=> (not res!18155) (not e!14263))))

(assert (=> d!6660 (= res!18155 (= (size!644 (buf!953 (_2!1328 lt!29597))) (size!644 (buf!953 (_2!1328 lt!29598)))))))

(assert (=> d!6660 (= (isPrefixOf!0 (_2!1328 lt!29597) (_2!1328 lt!29598)) e!14263)))

(declare-fun b!20919 () Bool)

(declare-fun res!18154 () Bool)

(assert (=> b!20919 (=> (not res!18154) (not e!14263))))

(assert (=> b!20919 (= res!18154 (bvsle (bitIndex!0 (size!644 (buf!953 (_2!1328 lt!29597))) (currentByte!2242 (_2!1328 lt!29597)) (currentBit!2237 (_2!1328 lt!29597))) (bitIndex!0 (size!644 (buf!953 (_2!1328 lt!29598))) (currentByte!2242 (_2!1328 lt!29598)) (currentBit!2237 (_2!1328 lt!29598)))))))

(declare-fun b!20920 () Bool)

(declare-fun e!14264 () Bool)

(assert (=> b!20920 (= e!14263 e!14264)))

(declare-fun res!18153 () Bool)

(assert (=> b!20920 (=> res!18153 e!14264)))

(assert (=> b!20920 (= res!18153 (= (size!644 (buf!953 (_2!1328 lt!29597))) #b00000000000000000000000000000000))))

(declare-fun b!20921 () Bool)

(assert (=> b!20921 (= e!14264 (arrayBitRangesEq!0 (buf!953 (_2!1328 lt!29597)) (buf!953 (_2!1328 lt!29598)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!644 (buf!953 (_2!1328 lt!29597))) (currentByte!2242 (_2!1328 lt!29597)) (currentBit!2237 (_2!1328 lt!29597)))))))

(assert (= (and d!6660 res!18155) b!20919))

(assert (= (and b!20919 res!18154) b!20920))

(assert (= (and b!20920 (not res!18153)) b!20921))

(declare-fun m!28763 () Bool)

(assert (=> b!20919 m!28763))

(assert (=> b!20919 m!28757))

(assert (=> b!20921 m!28763))

(assert (=> b!20921 m!28763))

(declare-fun m!28765 () Bool)

(assert (=> b!20921 m!28765))

(assert (=> b!20880 d!6660))

(declare-fun b!20977 () Bool)

(declare-fun e!14299 () Unit!1841)

(declare-fun Unit!1861 () Unit!1841)

(assert (=> b!20977 (= e!14299 Unit!1861)))

(declare-fun b!20978 () Bool)

(declare-fun res!18196 () Bool)

(declare-fun e!14298 () Bool)

(assert (=> b!20978 (=> (not res!18196) (not e!14298))))

(declare-fun lt!29715 () tuple2!2484)

(assert (=> b!20978 (= res!18196 (isPrefixOf!0 (_1!1327 lt!29715) thiss!1379))))

(declare-fun b!20979 () Bool)

(declare-fun lt!29716 () Unit!1841)

(assert (=> b!20979 (= e!14299 lt!29716)))

(declare-fun lt!29717 () (_ BitVec 64))

(assert (=> b!20979 (= lt!29717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!29710 () (_ BitVec 64))

(assert (=> b!20979 (= lt!29710 (bitIndex!0 (size!644 (buf!953 thiss!1379)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1507 array!1507 (_ BitVec 64) (_ BitVec 64)) Unit!1841)

(assert (=> b!20979 (= lt!29716 (arrayBitRangesEqSymmetric!0 (buf!953 thiss!1379) (buf!953 (_2!1328 lt!29597)) lt!29717 lt!29710))))

(assert (=> b!20979 (arrayBitRangesEq!0 (buf!953 (_2!1328 lt!29597)) (buf!953 thiss!1379) lt!29717 lt!29710)))

(declare-fun b!20980 () Bool)

(declare-fun lt!29721 () (_ BitVec 64))

(declare-fun lt!29707 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1122 (_ BitVec 64)) BitStream!1122)

(assert (=> b!20980 (= e!14298 (= (_1!1327 lt!29715) (withMovedBitIndex!0 (_2!1327 lt!29715) (bvsub lt!29721 lt!29707))))))

(assert (=> b!20980 (or (= (bvand lt!29721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!29707 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!29721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!29721 lt!29707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20980 (= lt!29707 (bitIndex!0 (size!644 (buf!953 (_2!1328 lt!29597))) (currentByte!2242 (_2!1328 lt!29597)) (currentBit!2237 (_2!1328 lt!29597))))))

(assert (=> b!20980 (= lt!29721 (bitIndex!0 (size!644 (buf!953 thiss!1379)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379)))))

(declare-fun d!6662 () Bool)

(assert (=> d!6662 e!14298))

(declare-fun res!18195 () Bool)

(assert (=> d!6662 (=> (not res!18195) (not e!14298))))

(assert (=> d!6662 (= res!18195 (isPrefixOf!0 (_1!1327 lt!29715) (_2!1327 lt!29715)))))

(declare-fun lt!29719 () BitStream!1122)

(assert (=> d!6662 (= lt!29715 (tuple2!2485 lt!29719 (_2!1328 lt!29597)))))

(declare-fun lt!29725 () Unit!1841)

(declare-fun lt!29706 () Unit!1841)

(assert (=> d!6662 (= lt!29725 lt!29706)))

(assert (=> d!6662 (isPrefixOf!0 lt!29719 (_2!1328 lt!29597))))

(assert (=> d!6662 (= lt!29706 (lemmaIsPrefixTransitive!0 lt!29719 (_2!1328 lt!29597) (_2!1328 lt!29597)))))

(declare-fun lt!29722 () Unit!1841)

(declare-fun lt!29711 () Unit!1841)

(assert (=> d!6662 (= lt!29722 lt!29711)))

(assert (=> d!6662 (isPrefixOf!0 lt!29719 (_2!1328 lt!29597))))

(assert (=> d!6662 (= lt!29711 (lemmaIsPrefixTransitive!0 lt!29719 thiss!1379 (_2!1328 lt!29597)))))

(declare-fun lt!29709 () Unit!1841)

(assert (=> d!6662 (= lt!29709 e!14299)))

(declare-fun c!1471 () Bool)

(assert (=> d!6662 (= c!1471 (not (= (size!644 (buf!953 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!29723 () Unit!1841)

(declare-fun lt!29718 () Unit!1841)

(assert (=> d!6662 (= lt!29723 lt!29718)))

(assert (=> d!6662 (isPrefixOf!0 (_2!1328 lt!29597) (_2!1328 lt!29597))))

(assert (=> d!6662 (= lt!29718 (lemmaIsPrefixRefl!0 (_2!1328 lt!29597)))))

(declare-fun lt!29712 () Unit!1841)

(declare-fun lt!29724 () Unit!1841)

(assert (=> d!6662 (= lt!29712 lt!29724)))

(assert (=> d!6662 (= lt!29724 (lemmaIsPrefixRefl!0 (_2!1328 lt!29597)))))

(declare-fun lt!29708 () Unit!1841)

(declare-fun lt!29720 () Unit!1841)

(assert (=> d!6662 (= lt!29708 lt!29720)))

(assert (=> d!6662 (isPrefixOf!0 lt!29719 lt!29719)))

(assert (=> d!6662 (= lt!29720 (lemmaIsPrefixRefl!0 lt!29719))))

(declare-fun lt!29714 () Unit!1841)

(declare-fun lt!29713 () Unit!1841)

(assert (=> d!6662 (= lt!29714 lt!29713)))

(assert (=> d!6662 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6662 (= lt!29713 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6662 (= lt!29719 (BitStream!1123 (buf!953 (_2!1328 lt!29597)) (currentByte!2242 thiss!1379) (currentBit!2237 thiss!1379)))))

(assert (=> d!6662 (isPrefixOf!0 thiss!1379 (_2!1328 lt!29597))))

(assert (=> d!6662 (= (reader!0 thiss!1379 (_2!1328 lt!29597)) lt!29715)))

(declare-fun b!20981 () Bool)

(declare-fun res!18197 () Bool)

(assert (=> b!20981 (=> (not res!18197) (not e!14298))))

(assert (=> b!20981 (= res!18197 (isPrefixOf!0 (_2!1327 lt!29715) (_2!1328 lt!29597)))))

(assert (= (and d!6662 c!1471) b!20979))

(assert (= (and d!6662 (not c!1471)) b!20977))

(assert (= (and d!6662 res!18195) b!20978))

(assert (= (and b!20978 res!18196) b!20981))

(assert (= (and b!20981 res!18197) b!20980))

(declare-fun m!28801 () Bool)

(assert (=> d!6662 m!28801))

(declare-fun m!28803 () Bool)

(assert (=> d!6662 m!28803))

(assert (=> d!6662 m!28679))

(declare-fun m!28805 () Bool)

(assert (=> d!6662 m!28805))

(declare-fun m!28807 () Bool)

(assert (=> d!6662 m!28807))

(assert (=> d!6662 m!28669))

(declare-fun m!28809 () Bool)

(assert (=> d!6662 m!28809))

(assert (=> d!6662 m!28681))

(declare-fun m!28811 () Bool)

(assert (=> d!6662 m!28811))

(declare-fun m!28813 () Bool)

(assert (=> d!6662 m!28813))

(declare-fun m!28815 () Bool)

(assert (=> d!6662 m!28815))

(assert (=> b!20979 m!28683))

(declare-fun m!28817 () Bool)

(assert (=> b!20979 m!28817))

(declare-fun m!28819 () Bool)

(assert (=> b!20979 m!28819))

(declare-fun m!28821 () Bool)

(assert (=> b!20981 m!28821))

(declare-fun m!28823 () Bool)

(assert (=> b!20978 m!28823))

(declare-fun m!28825 () Bool)

(assert (=> b!20980 m!28825))

(assert (=> b!20980 m!28763))

(assert (=> b!20980 m!28683))

(assert (=> b!20880 d!6662))

(declare-fun b!21133 () Bool)

(declare-fun e!14368 () Bool)

(declare-fun lt!30300 () (_ BitVec 64))

(assert (=> b!21133 (= e!14368 (validate_offset_bits!1 ((_ sign_extend 32) (size!644 (buf!953 (_2!1328 lt!29597)))) ((_ sign_extend 32) (currentByte!2242 (_2!1328 lt!29597))) ((_ sign_extend 32) (currentBit!2237 (_2!1328 lt!29597))) lt!30300))))

(declare-fun c!1485 () Bool)

(declare-fun lt!30285 () tuple2!2486)

(declare-fun lt!30268 () tuple2!2486)

(declare-fun call!302 () tuple2!2484)

(declare-fun bm!299 () Bool)

(assert (=> bm!299 (= call!302 (reader!0 (ite c!1485 (_2!1328 lt!30285) (_2!1328 lt!29597)) (ite c!1485 (_2!1328 lt!30268) (_2!1328 lt!29597))))))

(declare-fun b!21134 () Bool)

(declare-fun res!18326 () Bool)

(declare-fun e!14367 () Bool)

(assert (=> b!21134 (=> (not res!18326) (not e!14367))))

(declare-fun lt!30287 () tuple2!2486)

(assert (=> b!21134 (= res!18326 (isPrefixOf!0 (_2!1328 lt!29597) (_2!1328 lt!30287)))))

(declare-fun d!6694 () Bool)

(assert (=> d!6694 e!14367))

(declare-fun res!18322 () Bool)

(assert (=> d!6694 (=> (not res!18322) (not e!14367))))

(declare-fun lt!30273 () (_ BitVec 64))

