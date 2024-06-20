; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7912 () Bool)

(assert start!7912)

(declare-fun b!38771 () Bool)

(declare-fun e!25483 () Bool)

(declare-fun e!25479 () Bool)

(assert (=> b!38771 (= e!25483 e!25479)))

(declare-fun res!32914 () Bool)

(assert (=> b!38771 (=> res!32914 e!25479)))

(declare-datatypes ((List!460 0))(
  ( (Nil!457) (Cons!456 (h!575 Bool) (t!1210 List!460)) )
))
(declare-fun lt!59069 () List!460)

(declare-fun lt!59070 () List!460)

(assert (=> b!38771 (= res!32914 (not (= lt!59069 lt!59070)))))

(assert (=> b!38771 (= lt!59070 lt!59069)))

(declare-fun lt!59065 () List!460)

(declare-fun tail!177 (List!460) List!460)

(assert (=> b!38771 (= lt!59069 (tail!177 lt!59065))))

(declare-datatypes ((array!1963 0))(
  ( (array!1964 (arr!1380 (Array (_ BitVec 32) (_ BitVec 8))) (size!884 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1518 0))(
  ( (BitStream!1519 (buf!1212 array!1963) (currentByte!2624 (_ BitVec 32)) (currentBit!2619 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3748 0))(
  ( (tuple2!3749 (_1!1961 BitStream!1518) (_2!1961 BitStream!1518)) )
))
(declare-fun lt!59075 () tuple2!3748)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((Unit!2789 0))(
  ( (Unit!2790) )
))
(declare-datatypes ((tuple2!3750 0))(
  ( (tuple2!3751 (_1!1962 Unit!2789) (_2!1962 BitStream!1518)) )
))
(declare-fun lt!59076 () tuple2!3750)

(declare-fun lt!59084 () tuple2!3748)

(declare-fun lt!59085 () Unit!2789)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1518 BitStream!1518 BitStream!1518 BitStream!1518 (_ BitVec 64) List!460) Unit!2789)

(assert (=> b!38771 (= lt!59085 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1962 lt!59076) (_2!1962 lt!59076) (_1!1961 lt!59084) (_1!1961 lt!59075) (bvsub to!314 i!635) lt!59065))))

(declare-fun b!38772 () Bool)

(declare-fun e!25469 () Bool)

(assert (=> b!38772 (= e!25469 e!25483)))

(declare-fun res!32924 () Bool)

(assert (=> b!38772 (=> res!32924 e!25483)))

(assert (=> b!38772 (= res!32924 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!59083 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1518 BitStream!1518 (_ BitVec 64)) List!460)

(assert (=> b!38772 (= lt!59070 (bitStreamReadBitsIntoList!0 (_2!1962 lt!59076) (_1!1961 lt!59075) lt!59083))))

(assert (=> b!38772 (= lt!59065 (bitStreamReadBitsIntoList!0 (_2!1962 lt!59076) (_1!1961 lt!59084) (bvsub to!314 i!635)))))

(declare-fun lt!59066 () tuple2!3750)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38772 (validate_offset_bits!1 ((_ sign_extend 32) (size!884 (buf!1212 (_2!1962 lt!59076)))) ((_ sign_extend 32) (currentByte!2624 (_2!1962 lt!59066))) ((_ sign_extend 32) (currentBit!2619 (_2!1962 lt!59066))) lt!59083)))

(declare-fun lt!59079 () Unit!2789)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1518 array!1963 (_ BitVec 64)) Unit!2789)

(assert (=> b!38772 (= lt!59079 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1962 lt!59066) (buf!1212 (_2!1962 lt!59076)) lt!59083))))

(declare-fun reader!0 (BitStream!1518 BitStream!1518) tuple2!3748)

(assert (=> b!38772 (= lt!59075 (reader!0 (_2!1962 lt!59066) (_2!1962 lt!59076)))))

(declare-fun thiss!1379 () BitStream!1518)

(assert (=> b!38772 (validate_offset_bits!1 ((_ sign_extend 32) (size!884 (buf!1212 (_2!1962 lt!59076)))) ((_ sign_extend 32) (currentByte!2624 thiss!1379)) ((_ sign_extend 32) (currentBit!2619 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59086 () Unit!2789)

(assert (=> b!38772 (= lt!59086 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1212 (_2!1962 lt!59076)) (bvsub to!314 i!635)))))

(assert (=> b!38772 (= lt!59084 (reader!0 thiss!1379 (_2!1962 lt!59076)))))

(declare-fun b!38773 () Bool)

(declare-fun e!25476 () Bool)

(declare-fun e!25480 () Bool)

(assert (=> b!38773 (= e!25476 e!25480)))

(declare-fun res!32910 () Bool)

(assert (=> b!38773 (=> res!32910 e!25480)))

(declare-fun lt!59074 () Bool)

(declare-fun lt!59067 () Bool)

(assert (=> b!38773 (= res!32910 (not (= lt!59074 lt!59067)))))

(declare-fun lt!59080 () Bool)

(assert (=> b!38773 (= lt!59080 lt!59074)))

(declare-fun lt!59073 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1963 (_ BitVec 64)) Bool)

(assert (=> b!38773 (= lt!59074 (bitAt!0 (buf!1212 (_2!1962 lt!59076)) lt!59073))))

(declare-fun lt!59078 () (_ BitVec 64))

(declare-fun lt!59071 () Unit!2789)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1963 array!1963 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2789)

(assert (=> b!38773 (= lt!59071 (arrayBitRangesEqImpliesEq!0 (buf!1212 (_2!1962 lt!59066)) (buf!1212 (_2!1962 lt!59076)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59073 lt!59078))))

(declare-fun srcBuffer!2 () array!1963)

(declare-fun lt!59072 () tuple2!3748)

(declare-fun e!25482 () Bool)

(declare-fun b!38774 () Bool)

(declare-fun head!297 (List!460) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1518 array!1963 (_ BitVec 64) (_ BitVec 64)) List!460)

(assert (=> b!38774 (= e!25482 (= (head!297 (byteArrayBitContentToList!0 (_2!1962 lt!59066) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!297 (bitStreamReadBitsIntoList!0 (_2!1962 lt!59066) (_1!1961 lt!59072) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38775 () Bool)

(declare-fun e!25477 () Bool)

(declare-fun e!25481 () Bool)

(assert (=> b!38775 (= e!25477 e!25481)))

(declare-fun res!32928 () Bool)

(assert (=> b!38775 (=> res!32928 e!25481)))

(assert (=> b!38775 (= res!32928 (not (= (head!297 (byteArrayBitContentToList!0 (_2!1962 lt!59076) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59067)))))

(assert (=> b!38775 (= lt!59067 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun res!32909 () Bool)

(declare-fun e!25478 () Bool)

(assert (=> start!7912 (=> (not res!32909) (not e!25478))))

(assert (=> start!7912 (= res!32909 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!884 srcBuffer!2))))))))

(assert (=> start!7912 e!25478))

(assert (=> start!7912 true))

(declare-fun array_inv!812 (array!1963) Bool)

(assert (=> start!7912 (array_inv!812 srcBuffer!2)))

(declare-fun e!25468 () Bool)

(declare-fun inv!12 (BitStream!1518) Bool)

(assert (=> start!7912 (and (inv!12 thiss!1379) e!25468)))

(declare-fun b!38776 () Bool)

(declare-fun res!32911 () Bool)

(assert (=> b!38776 (=> res!32911 e!25477)))

(declare-fun lt!59082 () Bool)

(assert (=> b!38776 (= res!32911 (not (= (head!297 lt!59065) lt!59082)))))

(declare-fun b!38777 () Bool)

(declare-fun res!32912 () Bool)

(assert (=> b!38777 (=> res!32912 e!25469)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38777 (= res!32912 (not (invariant!0 (currentBit!2619 (_2!1962 lt!59066)) (currentByte!2624 (_2!1962 lt!59066)) (size!884 (buf!1212 (_2!1962 lt!59076))))))))

(declare-fun b!38778 () Bool)

(declare-fun e!25475 () Bool)

(assert (=> b!38778 (= e!25478 (not e!25475))))

(declare-fun res!32923 () Bool)

(assert (=> b!38778 (=> res!32923 e!25475)))

(assert (=> b!38778 (= res!32923 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1518 BitStream!1518) Bool)

(assert (=> b!38778 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59077 () Unit!2789)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1518) Unit!2789)

(assert (=> b!38778 (= lt!59077 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38778 (= lt!59073 (bitIndex!0 (size!884 (buf!1212 thiss!1379)) (currentByte!2624 thiss!1379) (currentBit!2619 thiss!1379)))))

(declare-fun b!38779 () Bool)

(declare-fun e!25471 () Bool)

(declare-fun e!25470 () Bool)

(assert (=> b!38779 (= e!25471 e!25470)))

(declare-fun res!32918 () Bool)

(assert (=> b!38779 (=> res!32918 e!25470)))

(assert (=> b!38779 (= res!32918 (not (isPrefixOf!0 (_2!1962 lt!59066) (_2!1962 lt!59076))))))

(assert (=> b!38779 (isPrefixOf!0 thiss!1379 (_2!1962 lt!59076))))

(declare-fun lt!59064 () Unit!2789)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1518 BitStream!1518 BitStream!1518) Unit!2789)

(assert (=> b!38779 (= lt!59064 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1962 lt!59066) (_2!1962 lt!59076)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1518 array!1963 (_ BitVec 64) (_ BitVec 64)) tuple2!3750)

(assert (=> b!38779 (= lt!59076 (appendBitsMSBFirstLoop!0 (_2!1962 lt!59066) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38779 e!25482))

(declare-fun res!32926 () Bool)

(assert (=> b!38779 (=> (not res!32926) (not e!25482))))

(assert (=> b!38779 (= res!32926 (validate_offset_bits!1 ((_ sign_extend 32) (size!884 (buf!1212 (_2!1962 lt!59066)))) ((_ sign_extend 32) (currentByte!2624 thiss!1379)) ((_ sign_extend 32) (currentBit!2619 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59081 () Unit!2789)

(assert (=> b!38779 (= lt!59081 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1212 (_2!1962 lt!59066)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38779 (= lt!59072 (reader!0 thiss!1379 (_2!1962 lt!59066)))))

(declare-fun b!38780 () Bool)

(declare-fun res!32917 () Bool)

(assert (=> b!38780 (=> (not res!32917) (not e!25478))))

(assert (=> b!38780 (= res!32917 (validate_offset_bits!1 ((_ sign_extend 32) (size!884 (buf!1212 thiss!1379))) ((_ sign_extend 32) (currentByte!2624 thiss!1379)) ((_ sign_extend 32) (currentBit!2619 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38781 () Bool)

(declare-fun e!25474 () Bool)

(assert (=> b!38781 (= e!25474 e!25469)))

(declare-fun res!32922 () Bool)

(assert (=> b!38781 (=> res!32922 e!25469)))

(assert (=> b!38781 (= res!32922 (not (= (size!884 (buf!1212 (_2!1962 lt!59066))) (size!884 (buf!1212 (_2!1962 lt!59076))))))))

(declare-fun lt!59063 () (_ BitVec 64))

(assert (=> b!38781 (= lt!59063 (bvsub (bvsub (bvadd lt!59078 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38781 (= lt!59078 (bitIndex!0 (size!884 (buf!1212 (_2!1962 lt!59066))) (currentByte!2624 (_2!1962 lt!59066)) (currentBit!2619 (_2!1962 lt!59066))))))

(assert (=> b!38781 (= (size!884 (buf!1212 (_2!1962 lt!59076))) (size!884 (buf!1212 thiss!1379)))))

(declare-fun b!38782 () Bool)

(declare-fun res!32919 () Bool)

(assert (=> b!38782 (=> res!32919 e!25483)))

(declare-fun length!186 (List!460) Int)

(assert (=> b!38782 (= res!32919 (<= (length!186 lt!59065) 0))))

(declare-fun b!38783 () Bool)

(assert (=> b!38783 (= e!25470 e!25474)))

(declare-fun res!32915 () Bool)

(assert (=> b!38783 (=> res!32915 e!25474)))

(assert (=> b!38783 (= res!32915 (not (= lt!59063 (bvsub (bvadd lt!59073 to!314) i!635))))))

(assert (=> b!38783 (= lt!59063 (bitIndex!0 (size!884 (buf!1212 (_2!1962 lt!59076))) (currentByte!2624 (_2!1962 lt!59076)) (currentBit!2619 (_2!1962 lt!59076))))))

(declare-fun b!38784 () Bool)

(assert (=> b!38784 (= e!25468 (array_inv!812 (buf!1212 thiss!1379)))))

(declare-fun b!38785 () Bool)

(assert (=> b!38785 (= e!25479 e!25477)))

(declare-fun res!32927 () Bool)

(assert (=> b!38785 (=> res!32927 e!25477)))

(assert (=> b!38785 (= res!32927 (not (= lt!59082 (bitAt!0 (buf!1212 (_1!1961 lt!59075)) lt!59073))))))

(assert (=> b!38785 (= lt!59082 (bitAt!0 (buf!1212 (_1!1961 lt!59084)) lt!59073))))

(declare-fun b!38786 () Bool)

(assert (=> b!38786 (= e!25480 true)))

(declare-datatypes ((tuple2!3752 0))(
  ( (tuple2!3753 (_1!1963 BitStream!1518) (_2!1963 Bool)) )
))
(declare-fun lt!59068 () tuple2!3752)

(declare-fun readBitPure!0 (BitStream!1518) tuple2!3752)

(assert (=> b!38786 (= lt!59068 (readBitPure!0 (_1!1961 lt!59084)))))

(declare-fun b!38787 () Bool)

(declare-fun res!32921 () Bool)

(assert (=> b!38787 (=> res!32921 e!25474)))

(assert (=> b!38787 (= res!32921 (not (invariant!0 (currentBit!2619 (_2!1962 lt!59076)) (currentByte!2624 (_2!1962 lt!59076)) (size!884 (buf!1212 (_2!1962 lt!59076))))))))

(declare-fun b!38788 () Bool)

(assert (=> b!38788 (= e!25475 e!25471)))

(declare-fun res!32925 () Bool)

(assert (=> b!38788 (=> res!32925 e!25471)))

(assert (=> b!38788 (= res!32925 (not (isPrefixOf!0 thiss!1379 (_2!1962 lt!59066))))))

(assert (=> b!38788 (validate_offset_bits!1 ((_ sign_extend 32) (size!884 (buf!1212 (_2!1962 lt!59066)))) ((_ sign_extend 32) (currentByte!2624 (_2!1962 lt!59066))) ((_ sign_extend 32) (currentBit!2619 (_2!1962 lt!59066))) lt!59083)))

(assert (=> b!38788 (= lt!59083 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59062 () Unit!2789)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1518 BitStream!1518 (_ BitVec 64) (_ BitVec 64)) Unit!2789)

(assert (=> b!38788 (= lt!59062 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1962 lt!59066) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1518 (_ BitVec 8) (_ BitVec 32)) tuple2!3750)

(assert (=> b!38788 (= lt!59066 (appendBitFromByte!0 thiss!1379 (select (arr!1380 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38789 () Bool)

(declare-fun res!32916 () Bool)

(assert (=> b!38789 (=> res!32916 e!25474)))

(assert (=> b!38789 (= res!32916 (not (= (size!884 (buf!1212 thiss!1379)) (size!884 (buf!1212 (_2!1962 lt!59076))))))))

(declare-fun b!38790 () Bool)

(assert (=> b!38790 (= e!25481 e!25476)))

(declare-fun res!32913 () Bool)

(assert (=> b!38790 (=> res!32913 e!25476)))

(assert (=> b!38790 (= res!32913 (not (= lt!59080 lt!59067)))))

(assert (=> b!38790 (= lt!59080 (bitAt!0 (buf!1212 (_2!1962 lt!59066)) lt!59073))))

(declare-fun b!38791 () Bool)

(declare-fun res!32920 () Bool)

(assert (=> b!38791 (=> res!32920 e!25469)))

(assert (=> b!38791 (= res!32920 (not (invariant!0 (currentBit!2619 (_2!1962 lt!59066)) (currentByte!2624 (_2!1962 lt!59066)) (size!884 (buf!1212 (_2!1962 lt!59066))))))))

(assert (= (and start!7912 res!32909) b!38780))

(assert (= (and b!38780 res!32917) b!38778))

(assert (= (and b!38778 (not res!32923)) b!38788))

(assert (= (and b!38788 (not res!32925)) b!38779))

(assert (= (and b!38779 res!32926) b!38774))

(assert (= (and b!38779 (not res!32918)) b!38783))

(assert (= (and b!38783 (not res!32915)) b!38787))

(assert (= (and b!38787 (not res!32921)) b!38789))

(assert (= (and b!38789 (not res!32916)) b!38781))

(assert (= (and b!38781 (not res!32922)) b!38791))

(assert (= (and b!38791 (not res!32920)) b!38777))

(assert (= (and b!38777 (not res!32912)) b!38772))

(assert (= (and b!38772 (not res!32924)) b!38782))

(assert (= (and b!38782 (not res!32919)) b!38771))

(assert (= (and b!38771 (not res!32914)) b!38785))

(assert (= (and b!38785 (not res!32927)) b!38776))

(assert (= (and b!38776 (not res!32911)) b!38775))

(assert (= (and b!38775 (not res!32928)) b!38790))

(assert (= (and b!38790 (not res!32913)) b!38773))

(assert (= (and b!38773 (not res!32910)) b!38786))

(assert (= start!7912 b!38784))

(declare-fun m!59087 () Bool)

(assert (=> b!38776 m!59087))

(declare-fun m!59089 () Bool)

(assert (=> b!38772 m!59089))

(declare-fun m!59091 () Bool)

(assert (=> b!38772 m!59091))

(declare-fun m!59093 () Bool)

(assert (=> b!38772 m!59093))

(declare-fun m!59095 () Bool)

(assert (=> b!38772 m!59095))

(declare-fun m!59097 () Bool)

(assert (=> b!38772 m!59097))

(declare-fun m!59099 () Bool)

(assert (=> b!38772 m!59099))

(declare-fun m!59101 () Bool)

(assert (=> b!38772 m!59101))

(declare-fun m!59103 () Bool)

(assert (=> b!38772 m!59103))

(declare-fun m!59105 () Bool)

(assert (=> b!38779 m!59105))

(declare-fun m!59107 () Bool)

(assert (=> b!38779 m!59107))

(declare-fun m!59109 () Bool)

(assert (=> b!38779 m!59109))

(declare-fun m!59111 () Bool)

(assert (=> b!38779 m!59111))

(declare-fun m!59113 () Bool)

(assert (=> b!38779 m!59113))

(declare-fun m!59115 () Bool)

(assert (=> b!38779 m!59115))

(declare-fun m!59117 () Bool)

(assert (=> b!38779 m!59117))

(declare-fun m!59119 () Bool)

(assert (=> b!38783 m!59119))

(declare-fun m!59121 () Bool)

(assert (=> b!38786 m!59121))

(declare-fun m!59123 () Bool)

(assert (=> b!38791 m!59123))

(declare-fun m!59125 () Bool)

(assert (=> b!38788 m!59125))

(declare-fun m!59127 () Bool)

(assert (=> b!38788 m!59127))

(declare-fun m!59129 () Bool)

(assert (=> b!38788 m!59129))

(declare-fun m!59131 () Bool)

(assert (=> b!38788 m!59131))

(assert (=> b!38788 m!59125))

(declare-fun m!59133 () Bool)

(assert (=> b!38788 m!59133))

(declare-fun m!59135 () Bool)

(assert (=> b!38790 m!59135))

(declare-fun m!59137 () Bool)

(assert (=> b!38785 m!59137))

(declare-fun m!59139 () Bool)

(assert (=> b!38785 m!59139))

(declare-fun m!59141 () Bool)

(assert (=> b!38775 m!59141))

(assert (=> b!38775 m!59141))

(declare-fun m!59143 () Bool)

(assert (=> b!38775 m!59143))

(declare-fun m!59145 () Bool)

(assert (=> b!38775 m!59145))

(declare-fun m!59147 () Bool)

(assert (=> b!38782 m!59147))

(declare-fun m!59149 () Bool)

(assert (=> b!38781 m!59149))

(declare-fun m!59151 () Bool)

(assert (=> start!7912 m!59151))

(declare-fun m!59153 () Bool)

(assert (=> start!7912 m!59153))

(declare-fun m!59155 () Bool)

(assert (=> b!38780 m!59155))

(declare-fun m!59157 () Bool)

(assert (=> b!38771 m!59157))

(declare-fun m!59159 () Bool)

(assert (=> b!38771 m!59159))

(declare-fun m!59161 () Bool)

(assert (=> b!38773 m!59161))

(declare-fun m!59163 () Bool)

(assert (=> b!38773 m!59163))

(declare-fun m!59165 () Bool)

(assert (=> b!38787 m!59165))

(declare-fun m!59167 () Bool)

(assert (=> b!38777 m!59167))

(declare-fun m!59169 () Bool)

(assert (=> b!38784 m!59169))

(declare-fun m!59171 () Bool)

(assert (=> b!38778 m!59171))

(declare-fun m!59173 () Bool)

(assert (=> b!38778 m!59173))

(declare-fun m!59175 () Bool)

(assert (=> b!38778 m!59175))

(declare-fun m!59177 () Bool)

(assert (=> b!38774 m!59177))

(assert (=> b!38774 m!59177))

(declare-fun m!59179 () Bool)

(assert (=> b!38774 m!59179))

(declare-fun m!59181 () Bool)

(assert (=> b!38774 m!59181))

(assert (=> b!38774 m!59181))

(declare-fun m!59183 () Bool)

(assert (=> b!38774 m!59183))

(check-sat (not b!38773) (not b!38775) (not b!38779) (not b!38772) (not start!7912) (not b!38776) (not b!38780) (not b!38785) (not b!38791) (not b!38782) (not b!38771) (not b!38787) (not b!38783) (not b!38790) (not b!38778) (not b!38781) (not b!38774) (not b!38788) (not b!38777) (not b!38784) (not b!38786))
