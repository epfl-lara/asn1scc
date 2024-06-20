; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9766 () Bool)

(assert start!9766)

(declare-fun b!48783 () Bool)

(declare-fun res!40962 () Bool)

(declare-fun e!32266 () Bool)

(assert (=> b!48783 (=> res!40962 e!32266)))

(declare-datatypes ((array!2313 0))(
  ( (array!2314 (arr!1575 (Array (_ BitVec 32) (_ BitVec 8))) (size!1049 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1818 0))(
  ( (BitStream!1819 (buf!1401 array!2313) (currentByte!2918 (_ BitVec 32)) (currentBit!2913 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3416 0))(
  ( (Unit!3417) )
))
(declare-datatypes ((tuple2!4600 0))(
  ( (tuple2!4601 (_1!2399 Unit!3416) (_2!2399 BitStream!1818)) )
))
(declare-fun lt!75747 () tuple2!4600)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!48783 (= res!40962 (not (invariant!0 (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75747))))))))

(declare-fun e!32272 () Bool)

(declare-fun lt!75749 () Bool)

(declare-fun lt!75751 () (_ BitVec 64))

(declare-fun b!48784 () Bool)

(declare-fun bitAt!0 (array!2313 (_ BitVec 64)) Bool)

(assert (=> b!48784 (= e!32272 (= (bitAt!0 (buf!1401 (_2!2399 lt!75747)) lt!75751) lt!75749))))

(declare-fun b!48785 () Bool)

(declare-fun res!40965 () Bool)

(declare-fun e!32275 () Bool)

(assert (=> b!48785 (=> (not res!40965) (not e!32275))))

(declare-fun thiss!1379 () BitStream!1818)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48785 (= res!40965 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!48786 () Bool)

(declare-fun e!32276 () Bool)

(assert (=> b!48786 (= e!32276 e!32266)))

(declare-fun res!40975 () Bool)

(assert (=> b!48786 (=> res!40975 e!32266)))

(declare-fun lt!75756 () tuple2!4600)

(assert (=> b!48786 (= res!40975 (not (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75756))))))))

(declare-fun e!32273 () Bool)

(assert (=> b!48786 e!32273))

(declare-fun res!40976 () Bool)

(assert (=> b!48786 (=> (not res!40976) (not e!32273))))

(assert (=> b!48786 (= res!40976 (= (size!1049 (buf!1401 (_2!2399 lt!75756))) (size!1049 (buf!1401 thiss!1379))))))

(declare-fun b!48787 () Bool)

(declare-fun e!32265 () Bool)

(declare-fun e!32271 () Bool)

(assert (=> b!48787 (= e!32265 e!32271)))

(declare-fun res!40963 () Bool)

(assert (=> b!48787 (=> res!40963 e!32271)))

(declare-fun isPrefixOf!0 (BitStream!1818 BitStream!1818) Bool)

(assert (=> b!48787 (= res!40963 (not (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75756))))))

(assert (=> b!48787 (isPrefixOf!0 thiss!1379 (_2!2399 lt!75756))))

(declare-fun lt!75752 () Unit!3416)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1818 BitStream!1818 BitStream!1818) Unit!3416)

(assert (=> b!48787 (= lt!75752 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2399 lt!75747) (_2!2399 lt!75756)))))

(declare-fun srcBuffer!2 () array!2313)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1818 array!2313 (_ BitVec 64) (_ BitVec 64)) tuple2!4600)

(assert (=> b!48787 (= lt!75756 (appendBitsMSBFirstLoop!0 (_2!2399 lt!75747) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!32269 () Bool)

(assert (=> b!48787 e!32269))

(declare-fun res!40966 () Bool)

(assert (=> b!48787 (=> (not res!40966) (not e!32269))))

(assert (=> b!48787 (= res!40966 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75760 () Unit!3416)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1818 array!2313 (_ BitVec 64)) Unit!3416)

(assert (=> b!48787 (= lt!75760 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4602 0))(
  ( (tuple2!4603 (_1!2400 BitStream!1818) (_2!2400 BitStream!1818)) )
))
(declare-fun lt!75745 () tuple2!4602)

(declare-fun reader!0 (BitStream!1818 BitStream!1818) tuple2!4602)

(assert (=> b!48787 (= lt!75745 (reader!0 thiss!1379 (_2!2399 lt!75747)))))

(declare-fun b!48788 () Bool)

(declare-fun e!32279 () Bool)

(declare-fun array_inv!962 (array!2313) Bool)

(assert (=> b!48788 (= e!32279 (array_inv!962 (buf!1401 thiss!1379)))))

(declare-fun b!48790 () Bool)

(declare-datatypes ((List!550 0))(
  ( (Nil!547) (Cons!546 (h!665 Bool) (t!1300 List!550)) )
))
(declare-fun head!369 (List!550) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1818 array!2313 (_ BitVec 64) (_ BitVec 64)) List!550)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1818 BitStream!1818 (_ BitVec 64)) List!550)

(assert (=> b!48790 (= e!32269 (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!369 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_1!2400 lt!75745) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!48791 () Bool)

(declare-fun res!40959 () Bool)

(declare-fun e!32268 () Bool)

(assert (=> b!48791 (=> res!40959 e!32268)))

(declare-fun lt!75755 () List!550)

(declare-fun lt!75744 () Bool)

(assert (=> b!48791 (= res!40959 (not (= (head!369 lt!75755) lt!75744)))))

(declare-fun b!48792 () Bool)

(declare-fun e!32274 () Bool)

(assert (=> b!48792 (= e!32274 e!32268)))

(declare-fun res!40970 () Bool)

(assert (=> b!48792 (=> res!40970 e!32268)))

(declare-fun lt!75750 () tuple2!4602)

(assert (=> b!48792 (= res!40970 (not (= lt!75744 (bitAt!0 (buf!1401 (_1!2400 lt!75750)) lt!75751))))))

(declare-fun lt!75754 () tuple2!4602)

(assert (=> b!48792 (= lt!75744 (bitAt!0 (buf!1401 (_1!2400 lt!75754)) lt!75751))))

(declare-fun b!48793 () Bool)

(declare-fun e!32270 () Bool)

(assert (=> b!48793 (= e!32266 e!32270)))

(declare-fun res!40977 () Bool)

(assert (=> b!48793 (=> res!40977 e!32270)))

(assert (=> b!48793 (= res!40977 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!75762 () (_ BitVec 64))

(declare-fun lt!75757 () List!550)

(assert (=> b!48793 (= lt!75757 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75750) lt!75762))))

(assert (=> b!48793 (= lt!75755 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75754) (bvsub to!314 i!635)))))

(assert (=> b!48793 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75762)))

(declare-fun lt!75761 () Unit!3416)

(assert (=> b!48793 (= lt!75761 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75756)) lt!75762))))

(assert (=> b!48793 (= lt!75750 (reader!0 (_2!2399 lt!75747) (_2!2399 lt!75756)))))

(assert (=> b!48793 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!75763 () Unit!3416)

(assert (=> b!48793 (= lt!75763 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1401 (_2!2399 lt!75756)) (bvsub to!314 i!635)))))

(assert (=> b!48793 (= lt!75754 (reader!0 thiss!1379 (_2!2399 lt!75756)))))

(declare-fun b!48794 () Bool)

(declare-fun e!32267 () Bool)

(assert (=> b!48794 (= e!32267 e!32265)))

(declare-fun res!40971 () Bool)

(assert (=> b!48794 (=> res!40971 e!32265)))

(assert (=> b!48794 (= res!40971 (not (isPrefixOf!0 thiss!1379 (_2!2399 lt!75747))))))

(assert (=> b!48794 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75762)))

(assert (=> b!48794 (= lt!75762 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75753 () Unit!3416)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1818 BitStream!1818 (_ BitVec 64) (_ BitVec 64)) Unit!3416)

(assert (=> b!48794 (= lt!75753 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2399 lt!75747) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1818 (_ BitVec 8) (_ BitVec 32)) tuple2!4600)

(assert (=> b!48794 (= lt!75747 (appendBitFromByte!0 thiss!1379 (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!48795 () Bool)

(declare-fun lt!75746 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!48795 (= e!32273 (= lt!75746 (bvsub (bvsub (bvadd (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48796 () Bool)

(assert (=> b!48796 (= e!32275 (not e!32267))))

(declare-fun res!40961 () Bool)

(assert (=> b!48796 (=> res!40961 e!32267)))

(assert (=> b!48796 (= res!40961 (bvsge i!635 to!314))))

(assert (=> b!48796 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!75758 () Unit!3416)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1818) Unit!3416)

(assert (=> b!48796 (= lt!75758 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!48796 (= lt!75751 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(declare-fun res!40964 () Bool)

(assert (=> start!9766 (=> (not res!40964) (not e!32275))))

(assert (=> start!9766 (= res!40964 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1049 srcBuffer!2))))))))

(assert (=> start!9766 e!32275))

(assert (=> start!9766 true))

(assert (=> start!9766 (array_inv!962 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1818) Bool)

(assert (=> start!9766 (and (inv!12 thiss!1379) e!32279)))

(declare-fun b!48789 () Bool)

(declare-fun res!40974 () Bool)

(assert (=> b!48789 (=> res!40974 e!32270)))

(declare-fun length!245 (List!550) Int)

(assert (=> b!48789 (= res!40974 (<= (length!245 lt!75755) 0))))

(declare-fun b!48797 () Bool)

(declare-fun res!40972 () Bool)

(assert (=> b!48797 (=> res!40972 e!32276)))

(assert (=> b!48797 (= res!40972 (not (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!75756))))))))

(declare-fun b!48798 () Bool)

(assert (=> b!48798 (= e!32270 e!32274)))

(declare-fun res!40968 () Bool)

(assert (=> b!48798 (=> res!40968 e!32274)))

(declare-fun lt!75759 () List!550)

(assert (=> b!48798 (= res!40968 (not (= lt!75759 lt!75757)))))

(assert (=> b!48798 (= lt!75757 lt!75759)))

(declare-fun tail!236 (List!550) List!550)

(assert (=> b!48798 (= lt!75759 (tail!236 lt!75755))))

(declare-fun lt!75748 () Unit!3416)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1818 BitStream!1818 BitStream!1818 BitStream!1818 (_ BitVec 64) List!550) Unit!3416)

(assert (=> b!48798 (= lt!75748 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2399 lt!75756) (_2!2399 lt!75756) (_1!2400 lt!75754) (_1!2400 lt!75750) (bvsub to!314 i!635) lt!75755))))

(declare-fun b!48799 () Bool)

(assert (=> b!48799 (= e!32271 e!32276)))

(declare-fun res!40967 () Bool)

(assert (=> b!48799 (=> res!40967 e!32276)))

(assert (=> b!48799 (= res!40967 (not (= lt!75746 (bvsub (bvadd lt!75751 to!314) i!635))))))

(assert (=> b!48799 (= lt!75746 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756))))))

(declare-fun b!48800 () Bool)

(declare-fun res!40973 () Bool)

(assert (=> b!48800 (=> res!40973 e!32266)))

(assert (=> b!48800 (= res!40973 (not (invariant!0 (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75756))))))))

(declare-fun b!48801 () Bool)

(declare-fun res!40969 () Bool)

(assert (=> b!48801 (=> res!40969 e!32276)))

(assert (=> b!48801 (= res!40969 (not (invariant!0 (currentBit!2913 (_2!2399 lt!75756)) (currentByte!2918 (_2!2399 lt!75756)) (size!1049 (buf!1401 (_2!2399 lt!75756))))))))

(declare-fun b!48802 () Bool)

(assert (=> b!48802 (= e!32268 e!32272)))

(declare-fun res!40960 () Bool)

(assert (=> b!48802 (=> res!40960 e!32272)))

(assert (=> b!48802 (= res!40960 (not (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!75749)))))

(assert (=> b!48802 (= lt!75749 (bitAt!0 srcBuffer!2 i!635))))

(assert (= (and start!9766 res!40964) b!48785))

(assert (= (and b!48785 res!40965) b!48796))

(assert (= (and b!48796 (not res!40961)) b!48794))

(assert (= (and b!48794 (not res!40971)) b!48787))

(assert (= (and b!48787 res!40966) b!48790))

(assert (= (and b!48787 (not res!40963)) b!48799))

(assert (= (and b!48799 (not res!40967)) b!48801))

(assert (= (and b!48801 (not res!40969)) b!48797))

(assert (= (and b!48797 (not res!40972)) b!48786))

(assert (= (and b!48786 res!40976) b!48795))

(assert (= (and b!48786 (not res!40975)) b!48783))

(assert (= (and b!48783 (not res!40962)) b!48800))

(assert (= (and b!48800 (not res!40973)) b!48793))

(assert (= (and b!48793 (not res!40977)) b!48789))

(assert (= (and b!48789 (not res!40974)) b!48798))

(assert (= (and b!48798 (not res!40968)) b!48792))

(assert (= (and b!48792 (not res!40970)) b!48791))

(assert (= (and b!48791 (not res!40959)) b!48802))

(assert (= (and b!48802 (not res!40960)) b!48784))

(assert (= start!9766 b!48788))

(declare-fun m!75883 () Bool)

(assert (=> b!48789 m!75883))

(declare-fun m!75885 () Bool)

(assert (=> b!48802 m!75885))

(assert (=> b!48802 m!75885))

(declare-fun m!75887 () Bool)

(assert (=> b!48802 m!75887))

(declare-fun m!75889 () Bool)

(assert (=> b!48802 m!75889))

(declare-fun m!75891 () Bool)

(assert (=> b!48799 m!75891))

(declare-fun m!75893 () Bool)

(assert (=> b!48796 m!75893))

(declare-fun m!75895 () Bool)

(assert (=> b!48796 m!75895))

(declare-fun m!75897 () Bool)

(assert (=> b!48796 m!75897))

(declare-fun m!75899 () Bool)

(assert (=> b!48787 m!75899))

(declare-fun m!75901 () Bool)

(assert (=> b!48787 m!75901))

(declare-fun m!75903 () Bool)

(assert (=> b!48787 m!75903))

(declare-fun m!75905 () Bool)

(assert (=> b!48787 m!75905))

(declare-fun m!75907 () Bool)

(assert (=> b!48787 m!75907))

(declare-fun m!75909 () Bool)

(assert (=> b!48787 m!75909))

(declare-fun m!75911 () Bool)

(assert (=> b!48787 m!75911))

(declare-fun m!75913 () Bool)

(assert (=> b!48801 m!75913))

(declare-fun m!75915 () Bool)

(assert (=> b!48795 m!75915))

(declare-fun m!75917 () Bool)

(assert (=> b!48792 m!75917))

(declare-fun m!75919 () Bool)

(assert (=> b!48792 m!75919))

(declare-fun m!75921 () Bool)

(assert (=> b!48791 m!75921))

(declare-fun m!75923 () Bool)

(assert (=> b!48800 m!75923))

(declare-fun m!75925 () Bool)

(assert (=> b!48793 m!75925))

(declare-fun m!75927 () Bool)

(assert (=> b!48793 m!75927))

(declare-fun m!75929 () Bool)

(assert (=> b!48793 m!75929))

(declare-fun m!75931 () Bool)

(assert (=> b!48793 m!75931))

(declare-fun m!75933 () Bool)

(assert (=> b!48793 m!75933))

(declare-fun m!75935 () Bool)

(assert (=> b!48793 m!75935))

(declare-fun m!75937 () Bool)

(assert (=> b!48793 m!75937))

(declare-fun m!75939 () Bool)

(assert (=> b!48793 m!75939))

(declare-fun m!75941 () Bool)

(assert (=> b!48790 m!75941))

(assert (=> b!48790 m!75941))

(declare-fun m!75943 () Bool)

(assert (=> b!48790 m!75943))

(declare-fun m!75945 () Bool)

(assert (=> b!48790 m!75945))

(assert (=> b!48790 m!75945))

(declare-fun m!75947 () Bool)

(assert (=> b!48790 m!75947))

(declare-fun m!75949 () Bool)

(assert (=> b!48794 m!75949))

(declare-fun m!75951 () Bool)

(assert (=> b!48794 m!75951))

(assert (=> b!48794 m!75949))

(declare-fun m!75953 () Bool)

(assert (=> b!48794 m!75953))

(declare-fun m!75955 () Bool)

(assert (=> b!48794 m!75955))

(declare-fun m!75957 () Bool)

(assert (=> b!48794 m!75957))

(declare-fun m!75959 () Bool)

(assert (=> b!48798 m!75959))

(declare-fun m!75961 () Bool)

(assert (=> b!48798 m!75961))

(declare-fun m!75963 () Bool)

(assert (=> b!48783 m!75963))

(declare-fun m!75965 () Bool)

(assert (=> start!9766 m!75965))

(declare-fun m!75967 () Bool)

(assert (=> start!9766 m!75967))

(declare-fun m!75969 () Bool)

(assert (=> b!48788 m!75969))

(declare-fun m!75971 () Bool)

(assert (=> b!48785 m!75971))

(declare-fun m!75973 () Bool)

(assert (=> b!48784 m!75973))

(check-sat (not b!48788) (not b!48802) (not b!48799) (not b!48789) (not b!48800) (not b!48783) (not b!48798) (not start!9766) (not b!48794) (not b!48795) (not b!48785) (not b!48793) (not b!48790) (not b!48796) (not b!48787) (not b!48791) (not b!48784) (not b!48792) (not b!48801))
(check-sat)
(get-model)

(declare-fun d!14938 () Bool)

(assert (=> d!14938 (= (array_inv!962 (buf!1401 thiss!1379)) (bvsge (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!48788 d!14938))

(declare-fun d!14940 () Bool)

(declare-fun e!32327 () Bool)

(assert (=> d!14940 e!32327))

(declare-fun res!41040 () Bool)

(assert (=> d!14940 (=> (not res!41040) (not e!32327))))

(declare-fun lt!75838 () (_ BitVec 64))

(declare-fun lt!75840 () (_ BitVec 64))

(declare-fun lt!75836 () (_ BitVec 64))

(assert (=> d!14940 (= res!41040 (= lt!75840 (bvsub lt!75838 lt!75836)))))

(assert (=> d!14940 (or (= (bvand lt!75838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75836 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75838 lt!75836) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!14940 (= lt!75836 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75756))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun lt!75841 () (_ BitVec 64))

(declare-fun lt!75839 () (_ BitVec 64))

(assert (=> d!14940 (= lt!75838 (bvmul lt!75841 lt!75839))))

(assert (=> d!14940 (or (= lt!75841 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75839 (bvsdiv (bvmul lt!75841 lt!75839) lt!75841)))))

(assert (=> d!14940 (= lt!75839 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14940 (= lt!75841 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!14940 (= lt!75840 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75756))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75756)))))))

(assert (=> d!14940 (invariant!0 (currentBit!2913 (_2!2399 lt!75756)) (currentByte!2918 (_2!2399 lt!75756)) (size!1049 (buf!1401 (_2!2399 lt!75756))))))

(assert (=> d!14940 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756))) lt!75840)))

(declare-fun b!48867 () Bool)

(declare-fun res!41039 () Bool)

(assert (=> b!48867 (=> (not res!41039) (not e!32327))))

(assert (=> b!48867 (= res!41039 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75840))))

(declare-fun b!48868 () Bool)

(declare-fun lt!75837 () (_ BitVec 64))

(assert (=> b!48868 (= e!32327 (bvsle lt!75840 (bvmul lt!75837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48868 (or (= lt!75837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75837)))))

(assert (=> b!48868 (= lt!75837 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (= (and d!14940 res!41040) b!48867))

(assert (= (and b!48867 res!41039) b!48868))

(declare-fun m!76067 () Bool)

(assert (=> d!14940 m!76067))

(assert (=> d!14940 m!75913))

(assert (=> b!48799 d!14940))

(declare-fun d!14942 () Bool)

(assert (=> d!14942 (= (tail!236 lt!75755) (t!1300 lt!75755))))

(assert (=> b!48798 d!14942))

(declare-fun d!14944 () Bool)

(declare-fun e!32330 () Bool)

(assert (=> d!14944 e!32330))

(declare-fun res!41043 () Bool)

(assert (=> d!14944 (=> (not res!41043) (not e!32330))))

(declare-fun lt!75847 () (_ BitVec 64))

(assert (=> d!14944 (= res!41043 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!75847) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14944 (= lt!75847 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75846 () Unit!3416)

(declare-fun choose!42 (BitStream!1818 BitStream!1818 BitStream!1818 BitStream!1818 (_ BitVec 64) List!550) Unit!3416)

(assert (=> d!14944 (= lt!75846 (choose!42 (_2!2399 lt!75756) (_2!2399 lt!75756) (_1!2400 lt!75754) (_1!2400 lt!75750) (bvsub to!314 i!635) lt!75755))))

(assert (=> d!14944 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14944 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2399 lt!75756) (_2!2399 lt!75756) (_1!2400 lt!75754) (_1!2400 lt!75750) (bvsub to!314 i!635) lt!75755) lt!75846)))

(declare-fun b!48871 () Bool)

(assert (=> b!48871 (= e!32330 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75750) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!236 lt!75755)))))

(assert (= (and d!14944 res!41043) b!48871))

(declare-fun m!76069 () Bool)

(assert (=> d!14944 m!76069))

(declare-fun m!76071 () Bool)

(assert (=> b!48871 m!76071))

(assert (=> b!48871 m!75959))

(assert (=> b!48798 d!14944))

(declare-fun d!14946 () Bool)

(assert (=> d!14946 (isPrefixOf!0 thiss!1379 (_2!2399 lt!75756))))

(declare-fun lt!75850 () Unit!3416)

(declare-fun choose!30 (BitStream!1818 BitStream!1818 BitStream!1818) Unit!3416)

(assert (=> d!14946 (= lt!75850 (choose!30 thiss!1379 (_2!2399 lt!75747) (_2!2399 lt!75756)))))

(assert (=> d!14946 (isPrefixOf!0 thiss!1379 (_2!2399 lt!75747))))

(assert (=> d!14946 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2399 lt!75747) (_2!2399 lt!75756)) lt!75850)))

(declare-fun bs!3823 () Bool)

(assert (= bs!3823 d!14946))

(assert (=> bs!3823 m!75903))

(declare-fun m!76073 () Bool)

(assert (=> bs!3823 m!76073))

(assert (=> bs!3823 m!75957))

(assert (=> b!48787 d!14946))

(declare-fun d!14948 () Bool)

(declare-fun res!41052 () Bool)

(declare-fun e!32336 () Bool)

(assert (=> d!14948 (=> (not res!41052) (not e!32336))))

(assert (=> d!14948 (= res!41052 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!14948 (= (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75756)) e!32336)))

(declare-fun b!48878 () Bool)

(declare-fun res!41051 () Bool)

(assert (=> b!48878 (=> (not res!41051) (not e!32336))))

(assert (=> b!48878 (= res!41051 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!48879 () Bool)

(declare-fun e!32335 () Bool)

(assert (=> b!48879 (= e!32336 e!32335)))

(declare-fun res!41050 () Bool)

(assert (=> b!48879 (=> res!41050 e!32335)))

(assert (=> b!48879 (= res!41050 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000))))

(declare-fun b!48880 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2313 array!2313 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48880 (= e!32335 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (= (and d!14948 res!41052) b!48878))

(assert (= (and b!48878 res!41051) b!48879))

(assert (= (and b!48879 (not res!41050)) b!48880))

(assert (=> b!48878 m!75915))

(assert (=> b!48878 m!75891))

(assert (=> b!48880 m!75915))

(assert (=> b!48880 m!75915))

(declare-fun m!76075 () Bool)

(assert (=> b!48880 m!76075))

(assert (=> b!48787 d!14948))

(declare-fun d!14950 () Bool)

(assert (=> d!14950 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75853 () Unit!3416)

(declare-fun choose!9 (BitStream!1818 array!2313 (_ BitVec 64) BitStream!1818) Unit!3416)

(assert (=> d!14950 (= lt!75853 (choose!9 thiss!1379 (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1819 (buf!1401 (_2!2399 lt!75747)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (=> d!14950 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!75853)))

(declare-fun bs!3824 () Bool)

(assert (= bs!3824 d!14950))

(assert (=> bs!3824 m!75905))

(declare-fun m!76077 () Bool)

(assert (=> bs!3824 m!76077))

(assert (=> b!48787 d!14950))

(declare-fun d!14952 () Bool)

(assert (=> d!14952 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3825 () Bool)

(assert (= bs!3825 d!14952))

(declare-fun m!76079 () Bool)

(assert (=> bs!3825 m!76079))

(assert (=> b!48787 d!14952))

(declare-fun d!14954 () Bool)

(declare-fun res!41055 () Bool)

(declare-fun e!32338 () Bool)

(assert (=> d!14954 (=> (not res!41055) (not e!32338))))

(assert (=> d!14954 (= res!41055 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!14954 (= (isPrefixOf!0 thiss!1379 (_2!2399 lt!75756)) e!32338)))

(declare-fun b!48881 () Bool)

(declare-fun res!41054 () Bool)

(assert (=> b!48881 (=> (not res!41054) (not e!32338))))

(assert (=> b!48881 (= res!41054 (bvsle (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!48882 () Bool)

(declare-fun e!32337 () Bool)

(assert (=> b!48882 (= e!32338 e!32337)))

(declare-fun res!41053 () Bool)

(assert (=> b!48882 (=> res!41053 e!32337)))

(assert (=> b!48882 (= res!41053 (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48883 () Bool)

(assert (=> b!48883 (= e!32337 (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (= (and d!14954 res!41055) b!48881))

(assert (= (and b!48881 res!41054) b!48882))

(assert (= (and b!48882 (not res!41053)) b!48883))

(assert (=> b!48881 m!75897))

(assert (=> b!48881 m!75891))

(assert (=> b!48883 m!75897))

(assert (=> b!48883 m!75897))

(declare-fun m!76081 () Bool)

(assert (=> b!48883 m!76081))

(assert (=> b!48787 d!14954))

(declare-fun b!48921 () Bool)

(declare-fun res!41093 () Bool)

(declare-fun e!32361 () Bool)

(assert (=> b!48921 (=> (not res!41093) (not e!32361))))

(declare-fun lt!75984 () tuple2!4600)

(assert (=> b!48921 (= res!41093 (invariant!0 (currentBit!2913 (_2!2399 lt!75984)) (currentByte!2918 (_2!2399 lt!75984)) (size!1049 (buf!1401 (_2!2399 lt!75984)))))))

(declare-fun b!48922 () Bool)

(declare-fun res!41089 () Bool)

(assert (=> b!48922 (=> (not res!41089) (not e!32361))))

(assert (=> b!48922 (= res!41089 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75984)))))))

(declare-fun lt!76012 () tuple2!4600)

(declare-fun bm!610 () Bool)

(declare-fun lt!75987 () tuple2!4600)

(declare-fun c!3426 () Bool)

(declare-fun call!613 () tuple2!4602)

(assert (=> bm!610 (= call!613 (reader!0 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun b!48923 () Bool)

(declare-fun res!41092 () Bool)

(assert (=> b!48923 (=> (not res!41092) (not e!32361))))

(assert (=> b!48923 (= res!41092 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75984)))))

(declare-fun b!48924 () Bool)

(declare-fun res!41094 () Bool)

(assert (=> b!48924 (=> (not res!41094) (not e!32361))))

(assert (=> b!48924 (= res!41094 (= (size!1049 (buf!1401 (_2!2399 lt!75984))) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(declare-fun b!48925 () Bool)

(declare-fun e!32359 () tuple2!4600)

(declare-fun Unit!3420 () Unit!3416)

(assert (=> b!48925 (= e!32359 (tuple2!4601 Unit!3420 (_2!2399 lt!75747)))))

(assert (=> b!48925 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75747))))))

(declare-fun lt!75974 () Unit!3416)

(declare-fun Unit!3421 () Unit!3416)

(assert (=> b!48925 (= lt!75974 Unit!3421)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1818 array!2313 array!2313 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4608 0))(
  ( (tuple2!4609 (_1!2403 array!2313) (_2!2403 BitStream!1818)) )
))
(declare-fun readBits!0 (BitStream!1818 (_ BitVec 64)) tuple2!4608)

(assert (=> b!48925 (checkByteArrayBitContent!0 (_2!2399 lt!75747) srcBuffer!2 (_1!2403 (readBits!0 (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!48926 () Bool)

(declare-fun lt!75969 () tuple2!4602)

(assert (=> b!48926 (= e!32361 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75984) (_1!2400 lt!75969) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2399 lt!75984) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!48926 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48926 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75980 () Unit!3416)

(declare-fun lt!75971 () Unit!3416)

(assert (=> b!48926 (= lt!75980 lt!75971)))

(declare-fun lt!75983 () (_ BitVec 64))

(assert (=> b!48926 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75983)))

(assert (=> b!48926 (= lt!75971 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75984)) lt!75983))))

(declare-fun e!32360 () Bool)

(assert (=> b!48926 e!32360))

(declare-fun res!41091 () Bool)

(assert (=> b!48926 (=> (not res!41091) (not e!32360))))

(assert (=> b!48926 (= res!41091 (and (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75984)))) (bvsge lt!75983 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48926 (= lt!75983 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!48926 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48926 (= lt!75969 (reader!0 (_2!2399 lt!75747) (_2!2399 lt!75984)))))

(declare-fun b!48928 () Bool)

(assert (=> b!48928 (= e!32360 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75983))))

(declare-fun b!48927 () Bool)

(declare-fun Unit!3422 () Unit!3416)

(assert (=> b!48927 (= e!32359 (tuple2!4601 Unit!3422 (_2!2399 lt!75987)))))

(assert (=> b!48927 (= lt!76012 (appendBitFromByte!0 (_2!2399 lt!75747) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!76006 () (_ BitVec 64))

(assert (=> b!48927 (= lt!76006 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75976 () (_ BitVec 64))

(assert (=> b!48927 (= lt!75976 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75993 () Unit!3416)

(assert (=> b!48927 (= lt!75993 (validateOffsetBitsIneqLemma!0 (_2!2399 lt!75747) (_2!2399 lt!76012) lt!76006 lt!75976))))

(assert (=> b!48927 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) (bvsub lt!76006 lt!75976))))

(declare-fun lt!75972 () Unit!3416)

(assert (=> b!48927 (= lt!75972 lt!75993)))

(declare-fun lt!75973 () tuple2!4602)

(assert (=> b!48927 (= lt!75973 (reader!0 (_2!2399 lt!75747) (_2!2399 lt!76012)))))

(declare-fun lt!75989 () (_ BitVec 64))

(assert (=> b!48927 (= lt!75989 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75990 () Unit!3416)

(assert (=> b!48927 (= lt!75990 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!76012)) lt!75989))))

(assert (=> b!48927 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75989)))

(declare-fun lt!75998 () Unit!3416)

(assert (=> b!48927 (= lt!75998 lt!75990)))

(assert (=> b!48927 (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!369 (bitStreamReadBitsIntoList!0 (_2!2399 lt!76012) (_1!2400 lt!75973) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76007 () Unit!3416)

(declare-fun Unit!3423 () Unit!3416)

(assert (=> b!48927 (= lt!76007 Unit!3423)))

(assert (=> b!48927 (= lt!75987 (appendBitsMSBFirstLoop!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!75982 () Unit!3416)

(assert (=> b!48927 (= lt!75982 (lemmaIsPrefixTransitive!0 (_2!2399 lt!75747) (_2!2399 lt!76012) (_2!2399 lt!75987)))))

(assert (=> b!48927 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75987))))

(declare-fun lt!76010 () Unit!3416)

(assert (=> b!48927 (= lt!76010 lt!75982)))

(assert (=> b!48927 (= (size!1049 (buf!1401 (_2!2399 lt!75987))) (size!1049 (buf!1401 (_2!2399 lt!75747))))))

(declare-fun lt!76011 () Unit!3416)

(declare-fun Unit!3424 () Unit!3416)

(assert (=> b!48927 (= lt!76011 Unit!3424)))

(assert (=> b!48927 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75987))) (currentByte!2918 (_2!2399 lt!75987)) (currentBit!2913 (_2!2399 lt!75987))) (bvsub (bvadd (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75991 () Unit!3416)

(declare-fun Unit!3425 () Unit!3416)

(assert (=> b!48927 (= lt!75991 Unit!3425)))

(assert (=> b!48927 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75987))) (currentByte!2918 (_2!2399 lt!75987)) (currentBit!2913 (_2!2399 lt!75987))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75994 () Unit!3416)

(declare-fun Unit!3426 () Unit!3416)

(assert (=> b!48927 (= lt!75994 Unit!3426)))

(declare-fun lt!75970 () tuple2!4602)

(assert (=> b!48927 (= lt!75970 (reader!0 (_2!2399 lt!75747) (_2!2399 lt!75987)))))

(declare-fun lt!75996 () (_ BitVec 64))

(assert (=> b!48927 (= lt!75996 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76005 () Unit!3416)

(assert (=> b!48927 (= lt!76005 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75987)) lt!75996))))

(assert (=> b!48927 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75996)))

(declare-fun lt!76000 () Unit!3416)

(assert (=> b!48927 (= lt!76000 lt!76005)))

(declare-fun lt!75981 () tuple2!4602)

(assert (=> b!48927 (= lt!75981 call!613)))

(declare-fun lt!76004 () (_ BitVec 64))

(assert (=> b!48927 (= lt!76004 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75975 () Unit!3416)

(assert (=> b!48927 (= lt!75975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!76012) (buf!1401 (_2!2399 lt!75987)) lt!76004))))

(assert (=> b!48927 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!76004)))

(declare-fun lt!75977 () Unit!3416)

(assert (=> b!48927 (= lt!75977 lt!75975)))

(declare-fun lt!76008 () List!550)

(assert (=> b!48927 (= lt!76008 (byteArrayBitContentToList!0 (_2!2399 lt!75987) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!76002 () List!550)

(assert (=> b!48927 (= lt!76002 (byteArrayBitContentToList!0 (_2!2399 lt!75987) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75985 () List!550)

(assert (=> b!48927 (= lt!75985 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75970) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!75979 () List!550)

(assert (=> b!48927 (= lt!75979 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75981) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!75995 () (_ BitVec 64))

(assert (=> b!48927 (= lt!75995 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!75986 () Unit!3416)

(assert (=> b!48927 (= lt!75986 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2399 lt!75987) (_2!2399 lt!75987) (_1!2400 lt!75970) (_1!2400 lt!75981) lt!75995 lt!75985))))

(assert (=> b!48927 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75981) (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!236 lt!75985))))

(declare-fun lt!76001 () Unit!3416)

(assert (=> b!48927 (= lt!76001 lt!75986)))

(declare-fun lt!75999 () (_ BitVec 64))

(declare-fun lt!75988 () Unit!3416)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2313 array!2313 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3416)

(assert (=> b!48927 (= lt!75988 (arrayBitRangesEqImpliesEq!0 (buf!1401 (_2!2399 lt!76012)) (buf!1401 (_2!2399 lt!75987)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!75999 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012)))))))

(assert (=> b!48927 (= (bitAt!0 (buf!1401 (_2!2399 lt!76012)) lt!75999) (bitAt!0 (buf!1401 (_2!2399 lt!75987)) lt!75999))))

(declare-fun lt!76009 () Unit!3416)

(assert (=> b!48927 (= lt!76009 lt!75988)))

(declare-fun d!14956 () Bool)

(assert (=> d!14956 e!32361))

(declare-fun res!41090 () Bool)

(assert (=> d!14956 (=> (not res!41090) (not e!32361))))

(declare-fun lt!76003 () (_ BitVec 64))

(assert (=> d!14956 (= res!41090 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75984))) (currentByte!2918 (_2!2399 lt!75984)) (currentBit!2913 (_2!2399 lt!75984))) (bvsub lt!76003 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14956 (or (= (bvand lt!76003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76003 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!75992 () (_ BitVec 64))

(assert (=> d!14956 (= lt!76003 (bvadd lt!75992 to!314))))

(assert (=> d!14956 (or (not (= (bvand lt!75992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!75992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!75992 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14956 (= lt!75992 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> d!14956 (= lt!75984 e!32359)))

(assert (=> d!14956 (= c!3426 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!75978 () Unit!3416)

(declare-fun lt!75997 () Unit!3416)

(assert (=> d!14956 (= lt!75978 lt!75997)))

(assert (=> d!14956 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(assert (=> d!14956 (= lt!75997 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(assert (=> d!14956 (= lt!75999 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> d!14956 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14956 (= (appendBitsMSBFirstLoop!0 (_2!2399 lt!75747) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!75984)))

(assert (= (and d!14956 c!3426) b!48927))

(assert (= (and d!14956 (not c!3426)) b!48925))

(assert (= (or b!48927 b!48925) bm!610))

(assert (= (and d!14956 res!41090) b!48921))

(assert (= (and b!48921 res!41093) b!48922))

(assert (= (and b!48922 res!41089) b!48923))

(assert (= (and b!48923 res!41092) b!48924))

(assert (= (and b!48924 res!41094) b!48926))

(assert (= (and b!48926 res!41091) b!48928))

(declare-fun m!76101 () Bool)

(assert (=> d!14956 m!76101))

(assert (=> d!14956 m!75915))

(declare-fun m!76103 () Bool)

(assert (=> d!14956 m!76103))

(declare-fun m!76105 () Bool)

(assert (=> d!14956 m!76105))

(declare-fun m!76107 () Bool)

(assert (=> b!48921 m!76107))

(declare-fun m!76109 () Bool)

(assert (=> b!48925 m!76109))

(declare-fun m!76111 () Bool)

(assert (=> b!48925 m!76111))

(declare-fun m!76113 () Bool)

(assert (=> bm!610 m!76113))

(assert (=> b!48927 m!75915))

(declare-fun m!76115 () Bool)

(assert (=> b!48927 m!76115))

(declare-fun m!76117 () Bool)

(assert (=> b!48927 m!76117))

(declare-fun m!76119 () Bool)

(assert (=> b!48927 m!76119))

(declare-fun m!76121 () Bool)

(assert (=> b!48927 m!76121))

(declare-fun m!76123 () Bool)

(assert (=> b!48927 m!76123))

(declare-fun m!76125 () Bool)

(assert (=> b!48927 m!76125))

(declare-fun m!76127 () Bool)

(assert (=> b!48927 m!76127))

(declare-fun m!76129 () Bool)

(assert (=> b!48927 m!76129))

(declare-fun m!76131 () Bool)

(assert (=> b!48927 m!76131))

(declare-fun m!76133 () Bool)

(assert (=> b!48927 m!76133))

(declare-fun m!76135 () Bool)

(assert (=> b!48927 m!76135))

(declare-fun m!76137 () Bool)

(assert (=> b!48927 m!76137))

(assert (=> b!48927 m!76135))

(declare-fun m!76139 () Bool)

(assert (=> b!48927 m!76139))

(declare-fun m!76141 () Bool)

(assert (=> b!48927 m!76141))

(declare-fun m!76143 () Bool)

(assert (=> b!48927 m!76143))

(declare-fun m!76145 () Bool)

(assert (=> b!48927 m!76145))

(declare-fun m!76147 () Bool)

(assert (=> b!48927 m!76147))

(declare-fun m!76149 () Bool)

(assert (=> b!48927 m!76149))

(declare-fun m!76151 () Bool)

(assert (=> b!48927 m!76151))

(declare-fun m!76153 () Bool)

(assert (=> b!48927 m!76153))

(assert (=> b!48927 m!76125))

(declare-fun m!76155 () Bool)

(assert (=> b!48927 m!76155))

(declare-fun m!76157 () Bool)

(assert (=> b!48927 m!76157))

(declare-fun m!76159 () Bool)

(assert (=> b!48927 m!76159))

(assert (=> b!48927 m!76121))

(declare-fun m!76161 () Bool)

(assert (=> b!48927 m!76161))

(declare-fun m!76163 () Bool)

(assert (=> b!48927 m!76163))

(declare-fun m!76165 () Bool)

(assert (=> b!48927 m!76165))

(declare-fun m!76167 () Bool)

(assert (=> b!48927 m!76167))

(declare-fun m!76169 () Bool)

(assert (=> b!48927 m!76169))

(declare-fun m!76171 () Bool)

(assert (=> b!48927 m!76171))

(declare-fun m!76173 () Bool)

(assert (=> b!48927 m!76173))

(assert (=> b!48927 m!76145))

(declare-fun m!76175 () Bool)

(assert (=> b!48927 m!76175))

(declare-fun m!76177 () Bool)

(assert (=> b!48928 m!76177))

(declare-fun m!76179 () Bool)

(assert (=> b!48923 m!76179))

(declare-fun m!76181 () Bool)

(assert (=> b!48926 m!76181))

(declare-fun m!76183 () Bool)

(assert (=> b!48926 m!76183))

(declare-fun m!76185 () Bool)

(assert (=> b!48926 m!76185))

(declare-fun m!76187 () Bool)

(assert (=> b!48926 m!76187))

(declare-fun m!76189 () Bool)

(assert (=> b!48926 m!76189))

(assert (=> b!48787 d!14956))

(declare-fun b!48939 () Bool)

(declare-fun e!32366 () Unit!3416)

(declare-fun lt!76058 () Unit!3416)

(assert (=> b!48939 (= e!32366 lt!76058)))

(declare-fun lt!76069 () (_ BitVec 64))

(assert (=> b!48939 (= lt!76069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76055 () (_ BitVec 64))

(assert (=> b!48939 (= lt!76055 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2313 array!2313 (_ BitVec 64) (_ BitVec 64)) Unit!3416)

(assert (=> b!48939 (= lt!76058 (arrayBitRangesEqSymmetric!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75747)) lt!76069 lt!76055))))

(assert (=> b!48939 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 thiss!1379) lt!76069 lt!76055)))

(declare-fun b!48940 () Bool)

(declare-fun Unit!3427 () Unit!3416)

(assert (=> b!48940 (= e!32366 Unit!3427)))

(declare-fun d!14976 () Bool)

(declare-fun e!32367 () Bool)

(assert (=> d!14976 e!32367))

(declare-fun res!41103 () Bool)

(assert (=> d!14976 (=> (not res!41103) (not e!32367))))

(declare-fun lt!76061 () tuple2!4602)

(assert (=> d!14976 (= res!41103 (isPrefixOf!0 (_1!2400 lt!76061) (_2!2400 lt!76061)))))

(declare-fun lt!76060 () BitStream!1818)

(assert (=> d!14976 (= lt!76061 (tuple2!4603 lt!76060 (_2!2399 lt!75747)))))

(declare-fun lt!76064 () Unit!3416)

(declare-fun lt!76054 () Unit!3416)

(assert (=> d!14976 (= lt!76064 lt!76054)))

(assert (=> d!14976 (isPrefixOf!0 lt!76060 (_2!2399 lt!75747))))

(assert (=> d!14976 (= lt!76054 (lemmaIsPrefixTransitive!0 lt!76060 (_2!2399 lt!75747) (_2!2399 lt!75747)))))

(declare-fun lt!76057 () Unit!3416)

(declare-fun lt!76071 () Unit!3416)

(assert (=> d!14976 (= lt!76057 lt!76071)))

(assert (=> d!14976 (isPrefixOf!0 lt!76060 (_2!2399 lt!75747))))

(assert (=> d!14976 (= lt!76071 (lemmaIsPrefixTransitive!0 lt!76060 thiss!1379 (_2!2399 lt!75747)))))

(declare-fun lt!76070 () Unit!3416)

(assert (=> d!14976 (= lt!76070 e!32366)))

(declare-fun c!3429 () Bool)

(assert (=> d!14976 (= c!3429 (not (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!76059 () Unit!3416)

(declare-fun lt!76053 () Unit!3416)

(assert (=> d!14976 (= lt!76059 lt!76053)))

(assert (=> d!14976 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(assert (=> d!14976 (= lt!76053 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(declare-fun lt!76056 () Unit!3416)

(declare-fun lt!76067 () Unit!3416)

(assert (=> d!14976 (= lt!76056 lt!76067)))

(assert (=> d!14976 (= lt!76067 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(declare-fun lt!76065 () Unit!3416)

(declare-fun lt!76063 () Unit!3416)

(assert (=> d!14976 (= lt!76065 lt!76063)))

(assert (=> d!14976 (isPrefixOf!0 lt!76060 lt!76060)))

(assert (=> d!14976 (= lt!76063 (lemmaIsPrefixRefl!0 lt!76060))))

(declare-fun lt!76068 () Unit!3416)

(declare-fun lt!76072 () Unit!3416)

(assert (=> d!14976 (= lt!76068 lt!76072)))

(assert (=> d!14976 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14976 (= lt!76072 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!14976 (= lt!76060 (BitStream!1819 (buf!1401 (_2!2399 lt!75747)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(assert (=> d!14976 (isPrefixOf!0 thiss!1379 (_2!2399 lt!75747))))

(assert (=> d!14976 (= (reader!0 thiss!1379 (_2!2399 lt!75747)) lt!76061)))

(declare-fun b!48941 () Bool)

(declare-fun res!41102 () Bool)

(assert (=> b!48941 (=> (not res!41102) (not e!32367))))

(assert (=> b!48941 (= res!41102 (isPrefixOf!0 (_2!2400 lt!76061) (_2!2399 lt!75747)))))

(declare-fun b!48942 () Bool)

(declare-fun res!41101 () Bool)

(assert (=> b!48942 (=> (not res!41101) (not e!32367))))

(assert (=> b!48942 (= res!41101 (isPrefixOf!0 (_1!2400 lt!76061) thiss!1379))))

(declare-fun lt!76066 () (_ BitVec 64))

(declare-fun lt!76062 () (_ BitVec 64))

(declare-fun b!48943 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1818 (_ BitVec 64)) BitStream!1818)

(assert (=> b!48943 (= e!32367 (= (_1!2400 lt!76061) (withMovedBitIndex!0 (_2!2400 lt!76061) (bvsub lt!76062 lt!76066))))))

(assert (=> b!48943 (or (= (bvand lt!76062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76066 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76062 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76062 lt!76066) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48943 (= lt!76066 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> b!48943 (= lt!76062 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(assert (= (and d!14976 c!3429) b!48939))

(assert (= (and d!14976 (not c!3429)) b!48940))

(assert (= (and d!14976 res!41103) b!48942))

(assert (= (and b!48942 res!41101) b!48941))

(assert (= (and b!48941 res!41102) b!48943))

(declare-fun m!76191 () Bool)

(assert (=> b!48941 m!76191))

(assert (=> b!48939 m!75897))

(declare-fun m!76193 () Bool)

(assert (=> b!48939 m!76193))

(declare-fun m!76195 () Bool)

(assert (=> b!48939 m!76195))

(declare-fun m!76197 () Bool)

(assert (=> b!48943 m!76197))

(assert (=> b!48943 m!75915))

(assert (=> b!48943 m!75897))

(declare-fun m!76199 () Bool)

(assert (=> b!48942 m!76199))

(declare-fun m!76201 () Bool)

(assert (=> d!14976 m!76201))

(declare-fun m!76203 () Bool)

(assert (=> d!14976 m!76203))

(assert (=> d!14976 m!75957))

(declare-fun m!76205 () Bool)

(assert (=> d!14976 m!76205))

(declare-fun m!76207 () Bool)

(assert (=> d!14976 m!76207))

(assert (=> d!14976 m!75895))

(declare-fun m!76209 () Bool)

(assert (=> d!14976 m!76209))

(assert (=> d!14976 m!75893))

(declare-fun m!76211 () Bool)

(assert (=> d!14976 m!76211))

(assert (=> d!14976 m!76103))

(assert (=> d!14976 m!76105))

(assert (=> b!48787 d!14976))

(declare-fun d!14978 () Bool)

(declare-fun res!41106 () Bool)

(declare-fun e!32369 () Bool)

(assert (=> d!14978 (=> (not res!41106) (not e!32369))))

(assert (=> d!14978 (= res!41106 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 thiss!1379))))))

(assert (=> d!14978 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!32369)))

(declare-fun b!48944 () Bool)

(declare-fun res!41105 () Bool)

(assert (=> b!48944 (=> (not res!41105) (not e!32369))))

(assert (=> b!48944 (= res!41105 (bvsle (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(declare-fun b!48945 () Bool)

(declare-fun e!32368 () Bool)

(assert (=> b!48945 (= e!32369 e!32368)))

(declare-fun res!41104 () Bool)

(assert (=> b!48945 (=> res!41104 e!32368)))

(assert (=> b!48945 (= res!41104 (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48946 () Bool)

(assert (=> b!48946 (= e!32368 (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (= (and d!14978 res!41106) b!48944))

(assert (= (and b!48944 res!41105) b!48945))

(assert (= (and b!48945 (not res!41104)) b!48946))

(assert (=> b!48944 m!75897))

(assert (=> b!48944 m!75897))

(assert (=> b!48946 m!75897))

(assert (=> b!48946 m!75897))

(declare-fun m!76213 () Bool)

(assert (=> b!48946 m!76213))

(assert (=> b!48796 d!14978))

(declare-fun d!14980 () Bool)

(assert (=> d!14980 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!76083 () Unit!3416)

(declare-fun choose!11 (BitStream!1818) Unit!3416)

(assert (=> d!14980 (= lt!76083 (choose!11 thiss!1379))))

(assert (=> d!14980 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!76083)))

(declare-fun bs!3830 () Bool)

(assert (= bs!3830 d!14980))

(assert (=> bs!3830 m!75893))

(declare-fun m!76215 () Bool)

(assert (=> bs!3830 m!76215))

(assert (=> b!48796 d!14980))

(declare-fun d!14982 () Bool)

(declare-fun e!32370 () Bool)

(assert (=> d!14982 e!32370))

(declare-fun res!41108 () Bool)

(assert (=> d!14982 (=> (not res!41108) (not e!32370))))

(declare-fun lt!76088 () (_ BitVec 64))

(declare-fun lt!76084 () (_ BitVec 64))

(declare-fun lt!76086 () (_ BitVec 64))

(assert (=> d!14982 (= res!41108 (= lt!76088 (bvsub lt!76086 lt!76084)))))

(assert (=> d!14982 (or (= (bvand lt!76086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76086 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76086 lt!76084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14982 (= lt!76084 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))))))

(declare-fun lt!76089 () (_ BitVec 64))

(declare-fun lt!76087 () (_ BitVec 64))

(assert (=> d!14982 (= lt!76086 (bvmul lt!76089 lt!76087))))

(assert (=> d!14982 (or (= lt!76089 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76087 (bvsdiv (bvmul lt!76089 lt!76087) lt!76089)))))

(assert (=> d!14982 (= lt!76087 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14982 (= lt!76089 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))))))

(assert (=> d!14982 (= lt!76088 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 thiss!1379))))))

(assert (=> d!14982 (invariant!0 (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379) (size!1049 (buf!1401 thiss!1379)))))

(assert (=> d!14982 (= (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) lt!76088)))

(declare-fun b!48947 () Bool)

(declare-fun res!41107 () Bool)

(assert (=> b!48947 (=> (not res!41107) (not e!32370))))

(assert (=> b!48947 (= res!41107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76088))))

(declare-fun b!48948 () Bool)

(declare-fun lt!76085 () (_ BitVec 64))

(assert (=> b!48948 (= e!32370 (bvsle lt!76088 (bvmul lt!76085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48948 (or (= lt!76085 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76085 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76085)))))

(assert (=> b!48948 (= lt!76085 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))))))

(assert (= (and d!14982 res!41108) b!48947))

(assert (= (and b!48947 res!41107) b!48948))

(declare-fun m!76217 () Bool)

(assert (=> d!14982 m!76217))

(declare-fun m!76219 () Bool)

(assert (=> d!14982 m!76219))

(assert (=> b!48796 d!14982))

(declare-fun d!14984 () Bool)

(assert (=> d!14984 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3831 () Bool)

(assert (= bs!3831 d!14984))

(assert (=> bs!3831 m!76217))

(assert (=> b!48785 d!14984))

(declare-fun d!14986 () Bool)

(assert (=> d!14986 (= (bitAt!0 (buf!1401 (_2!2399 lt!75747)) lt!75751) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) ((_ extract 31 0) (bvsdiv lt!75751 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75751 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3832 () Bool)

(assert (= bs!3832 d!14986))

(declare-fun m!76221 () Bool)

(assert (=> bs!3832 m!76221))

(declare-fun m!76223 () Bool)

(assert (=> bs!3832 m!76223))

(assert (=> b!48784 d!14986))

(declare-fun d!14988 () Bool)

(declare-fun e!32373 () Bool)

(assert (=> d!14988 e!32373))

(declare-fun res!41110 () Bool)

(assert (=> d!14988 (=> (not res!41110) (not e!32373))))

(declare-fun lt!76126 () (_ BitVec 64))

(declare-fun lt!76124 () (_ BitVec 64))

(declare-fun lt!76122 () (_ BitVec 64))

(assert (=> d!14988 (= res!41110 (= lt!76126 (bvsub lt!76124 lt!76122)))))

(assert (=> d!14988 (or (= (bvand lt!76124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76122 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76124 lt!76122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14988 (= lt!76122 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun lt!76127 () (_ BitVec 64))

(declare-fun lt!76125 () (_ BitVec 64))

(assert (=> d!14988 (= lt!76124 (bvmul lt!76127 lt!76125))))

(assert (=> d!14988 (or (= lt!76127 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76125 (bvsdiv (bvmul lt!76127 lt!76125) lt!76127)))))

(assert (=> d!14988 (= lt!76125 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14988 (= lt!76127 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (=> d!14988 (= lt!76126 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (=> d!14988 (invariant!0 (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75747))))))

(assert (=> d!14988 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) lt!76126)))

(declare-fun b!48953 () Bool)

(declare-fun res!41109 () Bool)

(assert (=> b!48953 (=> (not res!41109) (not e!32373))))

(assert (=> b!48953 (= res!41109 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76126))))

(declare-fun b!48954 () Bool)

(declare-fun lt!76123 () (_ BitVec 64))

(assert (=> b!48954 (= e!32373 (bvsle lt!76126 (bvmul lt!76123 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48954 (or (= lt!76123 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76123 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76123)))))

(assert (=> b!48954 (= lt!76123 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (= (and d!14988 res!41110) b!48953))

(assert (= (and b!48953 res!41109) b!48954))

(declare-fun m!76225 () Bool)

(assert (=> d!14988 m!76225))

(assert (=> d!14988 m!75963))

(assert (=> b!48795 d!14988))

(declare-fun d!14990 () Bool)

(declare-fun res!41113 () Bool)

(declare-fun e!32375 () Bool)

(assert (=> d!14990 (=> (not res!41113) (not e!32375))))

(assert (=> d!14990 (= res!41113 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (=> d!14990 (= (isPrefixOf!0 thiss!1379 (_2!2399 lt!75747)) e!32375)))

(declare-fun b!48955 () Bool)

(declare-fun res!41112 () Bool)

(assert (=> b!48955 (=> (not res!41112) (not e!32375))))

(assert (=> b!48955 (= res!41112 (bvsle (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun b!48956 () Bool)

(declare-fun e!32374 () Bool)

(assert (=> b!48956 (= e!32375 e!32374)))

(declare-fun res!41111 () Bool)

(assert (=> b!48956 (=> res!41111 e!32374)))

(assert (=> b!48956 (= res!41111 (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48957 () Bool)

(assert (=> b!48957 (= e!32374 (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (= (and d!14990 res!41113) b!48955))

(assert (= (and b!48955 res!41112) b!48956))

(assert (= (and b!48956 (not res!41111)) b!48957))

(assert (=> b!48955 m!75897))

(assert (=> b!48955 m!75915))

(assert (=> b!48957 m!75897))

(assert (=> b!48957 m!75897))

(declare-fun m!76227 () Bool)

(assert (=> b!48957 m!76227))

(assert (=> b!48794 d!14990))

(declare-fun d!14992 () Bool)

(assert (=> d!14992 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75762) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) lt!75762))))

(declare-fun bs!3833 () Bool)

(assert (= bs!3833 d!14992))

(assert (=> bs!3833 m!76225))

(assert (=> b!48794 d!14992))

(declare-fun d!14994 () Bool)

(declare-fun e!32382 () Bool)

(assert (=> d!14994 e!32382))

(declare-fun res!41128 () Bool)

(assert (=> d!14994 (=> (not res!41128) (not e!32382))))

(assert (=> d!14994 (= res!41128 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76176 () Unit!3416)

(declare-fun choose!27 (BitStream!1818 BitStream!1818 (_ BitVec 64) (_ BitVec 64)) Unit!3416)

(assert (=> d!14994 (= lt!76176 (choose!27 thiss!1379 (_2!2399 lt!75747) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14994 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!14994 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2399 lt!75747) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76176)))

(declare-fun b!48972 () Bool)

(assert (=> b!48972 (= e!32382 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14994 res!41128) b!48972))

(declare-fun m!76229 () Bool)

(assert (=> d!14994 m!76229))

(declare-fun m!76231 () Bool)

(assert (=> b!48972 m!76231))

(assert (=> b!48794 d!14994))

(declare-fun b!49035 () Bool)

(declare-fun res!41177 () Bool)

(declare-fun e!32414 () Bool)

(assert (=> b!49035 (=> (not res!41177) (not e!32414))))

(declare-fun lt!76369 () tuple2!4600)

(assert (=> b!49035 (= res!41177 (isPrefixOf!0 thiss!1379 (_2!2399 lt!76369)))))

(declare-fun b!49036 () Bool)

(declare-fun res!41174 () Bool)

(declare-fun e!32413 () Bool)

(assert (=> b!49036 (=> (not res!41174) (not e!32413))))

(declare-fun lt!76362 () tuple2!4600)

(assert (=> b!49036 (= res!41174 (isPrefixOf!0 thiss!1379 (_2!2399 lt!76362)))))

(declare-fun b!49037 () Bool)

(declare-fun res!41180 () Bool)

(assert (=> b!49037 (=> (not res!41180) (not e!32413))))

(declare-fun lt!76363 () (_ BitVec 64))

(declare-fun lt!76367 () (_ BitVec 64))

(assert (=> b!49037 (= res!41180 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76362))) (currentByte!2918 (_2!2399 lt!76362)) (currentBit!2913 (_2!2399 lt!76362))) (bvadd lt!76363 lt!76367)))))

(assert (=> b!49037 (or (not (= (bvand lt!76363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76367 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76363 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76363 lt!76367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49037 (= lt!76367 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49037 (= lt!76363 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(declare-fun b!49038 () Bool)

(declare-fun e!32411 () Bool)

(assert (=> b!49038 (= e!32414 e!32411)))

(declare-fun res!41181 () Bool)

(assert (=> b!49038 (=> (not res!41181) (not e!32411))))

(declare-fun lt!76361 () Bool)

(declare-datatypes ((tuple2!4610 0))(
  ( (tuple2!4611 (_1!2404 BitStream!1818) (_2!2404 Bool)) )
))
(declare-fun lt!76359 () tuple2!4610)

(assert (=> b!49038 (= res!41181 (and (= (_2!2404 lt!76359) lt!76361) (= (_1!2404 lt!76359) (_2!2399 lt!76369))))))

(declare-fun readBitPure!0 (BitStream!1818) tuple2!4610)

(declare-fun readerFrom!0 (BitStream!1818 (_ BitVec 32) (_ BitVec 32)) BitStream!1818)

(assert (=> b!49038 (= lt!76359 (readBitPure!0 (readerFrom!0 (_2!2399 lt!76369) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379))))))

(declare-fun b!49039 () Bool)

(declare-fun res!41179 () Bool)

(assert (=> b!49039 (=> (not res!41179) (not e!32414))))

(assert (=> b!49039 (= res!41179 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76369))) (currentByte!2918 (_2!2399 lt!76369)) (currentBit!2913 (_2!2399 lt!76369))) (bvadd (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49040 () Bool)

(declare-fun e!32412 () Bool)

(assert (=> b!49040 (= e!32413 e!32412)))

(declare-fun res!41175 () Bool)

(assert (=> b!49040 (=> (not res!41175) (not e!32412))))

(declare-fun lt!76366 () tuple2!4610)

(declare-fun lt!76364 () (_ BitVec 8))

(assert (=> b!49040 (= res!41175 (and (= (_2!2404 lt!76366) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!76364)) #b00000000000000000000000000000000))) (= (_1!2404 lt!76366) (_2!2399 lt!76362))))))

(declare-fun lt!76358 () tuple2!4608)

(declare-fun lt!76365 () BitStream!1818)

(assert (=> b!49040 (= lt!76358 (readBits!0 lt!76365 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!49040 (= lt!76366 (readBitPure!0 lt!76365))))

(assert (=> b!49040 (= lt!76365 (readerFrom!0 (_2!2399 lt!76362) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379)))))

(declare-fun d!14996 () Bool)

(assert (=> d!14996 e!32413))

(declare-fun res!41178 () Bool)

(assert (=> d!14996 (=> (not res!41178) (not e!32413))))

(assert (=> d!14996 (= res!41178 (= (size!1049 (buf!1401 (_2!2399 lt!76362))) (size!1049 (buf!1401 thiss!1379))))))

(declare-fun lt!76368 () array!2313)

(assert (=> d!14996 (= lt!76364 (select (arr!1575 lt!76368) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14996 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1049 lt!76368)))))

(assert (=> d!14996 (= lt!76368 (array!2314 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!76360 () tuple2!4600)

(assert (=> d!14996 (= lt!76362 (tuple2!4601 (_1!2399 lt!76360) (_2!2399 lt!76360)))))

(assert (=> d!14996 (= lt!76360 lt!76369)))

(assert (=> d!14996 e!32414))

(declare-fun res!41176 () Bool)

(assert (=> d!14996 (=> (not res!41176) (not e!32414))))

(assert (=> d!14996 (= res!41176 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!76369)))))))

(declare-fun appendBit!0 (BitStream!1818 Bool) tuple2!4600)

(assert (=> d!14996 (= lt!76369 (appendBit!0 thiss!1379 lt!76361))))

(assert (=> d!14996 (= lt!76361 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14996 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14996 (= (appendBitFromByte!0 thiss!1379 (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!76362)))

(declare-fun b!49041 () Bool)

(assert (=> b!49041 (= e!32412 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!76366))) (currentByte!2918 (_1!2404 lt!76366)) (currentBit!2913 (_1!2404 lt!76366))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76362))) (currentByte!2918 (_2!2399 lt!76362)) (currentBit!2913 (_2!2399 lt!76362)))))))

(declare-fun b!49042 () Bool)

(assert (=> b!49042 (= e!32411 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!76359))) (currentByte!2918 (_1!2404 lt!76359)) (currentBit!2913 (_1!2404 lt!76359))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76369))) (currentByte!2918 (_2!2399 lt!76369)) (currentBit!2913 (_2!2399 lt!76369)))))))

(assert (= (and d!14996 res!41176) b!49039))

(assert (= (and b!49039 res!41179) b!49035))

(assert (= (and b!49035 res!41177) b!49038))

(assert (= (and b!49038 res!41181) b!49042))

(assert (= (and d!14996 res!41178) b!49037))

(assert (= (and b!49037 res!41180) b!49036))

(assert (= (and b!49036 res!41174) b!49040))

(assert (= (and b!49040 res!41175) b!49041))

(declare-fun m!76393 () Bool)

(assert (=> b!49042 m!76393))

(declare-fun m!76395 () Bool)

(assert (=> b!49042 m!76395))

(declare-fun m!76397 () Bool)

(assert (=> b!49041 m!76397))

(declare-fun m!76399 () Bool)

(assert (=> b!49041 m!76399))

(declare-fun m!76401 () Bool)

(assert (=> b!49036 m!76401))

(declare-fun m!76403 () Bool)

(assert (=> b!49040 m!76403))

(declare-fun m!76405 () Bool)

(assert (=> b!49040 m!76405))

(declare-fun m!76407 () Bool)

(assert (=> b!49040 m!76407))

(assert (=> b!49039 m!76395))

(assert (=> b!49039 m!75897))

(declare-fun m!76409 () Bool)

(assert (=> d!14996 m!76409))

(declare-fun m!76411 () Bool)

(assert (=> d!14996 m!76411))

(declare-fun m!76413 () Bool)

(assert (=> d!14996 m!76413))

(declare-fun m!76415 () Bool)

(assert (=> b!49035 m!76415))

(assert (=> b!49037 m!76399))

(assert (=> b!49037 m!75897))

(declare-fun m!76417 () Bool)

(assert (=> b!49038 m!76417))

(assert (=> b!49038 m!76417))

(declare-fun m!76419 () Bool)

(assert (=> b!49038 m!76419))

(assert (=> b!48794 d!14996))

(declare-fun d!15036 () Bool)

(assert (=> d!15036 (= (array_inv!962 srcBuffer!2) (bvsge (size!1049 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9766 d!15036))

(declare-fun d!15038 () Bool)

(assert (=> d!15038 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379) (size!1049 (buf!1401 thiss!1379))))))

(declare-fun bs!3842 () Bool)

(assert (= bs!3842 d!15038))

(assert (=> bs!3842 m!76219))

(assert (=> start!9766 d!15038))

(declare-fun d!15040 () Bool)

(assert (=> d!15040 (= (invariant!0 (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75747)))) (and (bvsge (currentBit!2913 (_2!2399 lt!75747)) #b00000000000000000000000000000000) (bvslt (currentBit!2913 (_2!2399 lt!75747)) #b00000000000000000000000000001000) (bvsge (currentByte!2918 (_2!2399 lt!75747)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75747)))) (and (= (currentBit!2913 (_2!2399 lt!75747)) #b00000000000000000000000000000000) (= (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75747))))))))))

(assert (=> b!48783 d!15040))

(declare-fun d!15042 () Bool)

(assert (=> d!15042 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75762) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) lt!75762))))

(declare-fun bs!3843 () Bool)

(assert (= bs!3843 d!15042))

(declare-fun m!76421 () Bool)

(assert (=> bs!3843 m!76421))

(assert (=> b!48793 d!15042))

(declare-fun b!49053 () Bool)

(declare-fun e!32419 () Unit!3416)

(declare-fun lt!76415 () Unit!3416)

(assert (=> b!49053 (= e!32419 lt!76415)))

(declare-fun lt!76426 () (_ BitVec 64))

(assert (=> b!49053 (= lt!76426 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76412 () (_ BitVec 64))

(assert (=> b!49053 (= lt!76412 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(assert (=> b!49053 (= lt!76415 (arrayBitRangesEqSymmetric!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75756)) lt!76426 lt!76412))))

(assert (=> b!49053 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 thiss!1379) lt!76426 lt!76412)))

(declare-fun b!49054 () Bool)

(declare-fun Unit!3429 () Unit!3416)

(assert (=> b!49054 (= e!32419 Unit!3429)))

(declare-fun d!15044 () Bool)

(declare-fun e!32420 () Bool)

(assert (=> d!15044 e!32420))

(declare-fun res!41190 () Bool)

(assert (=> d!15044 (=> (not res!41190) (not e!32420))))

(declare-fun lt!76418 () tuple2!4602)

(assert (=> d!15044 (= res!41190 (isPrefixOf!0 (_1!2400 lt!76418) (_2!2400 lt!76418)))))

(declare-fun lt!76417 () BitStream!1818)

(assert (=> d!15044 (= lt!76418 (tuple2!4603 lt!76417 (_2!2399 lt!75756)))))

(declare-fun lt!76421 () Unit!3416)

(declare-fun lt!76411 () Unit!3416)

(assert (=> d!15044 (= lt!76421 lt!76411)))

(assert (=> d!15044 (isPrefixOf!0 lt!76417 (_2!2399 lt!75756))))

(assert (=> d!15044 (= lt!76411 (lemmaIsPrefixTransitive!0 lt!76417 (_2!2399 lt!75756) (_2!2399 lt!75756)))))

(declare-fun lt!76414 () Unit!3416)

(declare-fun lt!76428 () Unit!3416)

(assert (=> d!15044 (= lt!76414 lt!76428)))

(assert (=> d!15044 (isPrefixOf!0 lt!76417 (_2!2399 lt!75756))))

(assert (=> d!15044 (= lt!76428 (lemmaIsPrefixTransitive!0 lt!76417 thiss!1379 (_2!2399 lt!75756)))))

(declare-fun lt!76427 () Unit!3416)

(assert (=> d!15044 (= lt!76427 e!32419)))

(declare-fun c!3442 () Bool)

(assert (=> d!15044 (= c!3442 (not (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!76416 () Unit!3416)

(declare-fun lt!76410 () Unit!3416)

(assert (=> d!15044 (= lt!76416 lt!76410)))

(assert (=> d!15044 (isPrefixOf!0 (_2!2399 lt!75756) (_2!2399 lt!75756))))

(assert (=> d!15044 (= lt!76410 (lemmaIsPrefixRefl!0 (_2!2399 lt!75756)))))

(declare-fun lt!76413 () Unit!3416)

(declare-fun lt!76424 () Unit!3416)

(assert (=> d!15044 (= lt!76413 lt!76424)))

(assert (=> d!15044 (= lt!76424 (lemmaIsPrefixRefl!0 (_2!2399 lt!75756)))))

(declare-fun lt!76422 () Unit!3416)

(declare-fun lt!76420 () Unit!3416)

(assert (=> d!15044 (= lt!76422 lt!76420)))

(assert (=> d!15044 (isPrefixOf!0 lt!76417 lt!76417)))

(assert (=> d!15044 (= lt!76420 (lemmaIsPrefixRefl!0 lt!76417))))

(declare-fun lt!76425 () Unit!3416)

(declare-fun lt!76429 () Unit!3416)

(assert (=> d!15044 (= lt!76425 lt!76429)))

(assert (=> d!15044 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15044 (= lt!76429 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!15044 (= lt!76417 (BitStream!1819 (buf!1401 (_2!2399 lt!75756)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(assert (=> d!15044 (isPrefixOf!0 thiss!1379 (_2!2399 lt!75756))))

(assert (=> d!15044 (= (reader!0 thiss!1379 (_2!2399 lt!75756)) lt!76418)))

(declare-fun b!49055 () Bool)

(declare-fun res!41189 () Bool)

(assert (=> b!49055 (=> (not res!41189) (not e!32420))))

(assert (=> b!49055 (= res!41189 (isPrefixOf!0 (_2!2400 lt!76418) (_2!2399 lt!75756)))))

(declare-fun b!49056 () Bool)

(declare-fun res!41188 () Bool)

(assert (=> b!49056 (=> (not res!41188) (not e!32420))))

(assert (=> b!49056 (= res!41188 (isPrefixOf!0 (_1!2400 lt!76418) thiss!1379))))

(declare-fun lt!76423 () (_ BitVec 64))

(declare-fun b!49057 () Bool)

(declare-fun lt!76419 () (_ BitVec 64))

(assert (=> b!49057 (= e!32420 (= (_1!2400 lt!76418) (withMovedBitIndex!0 (_2!2400 lt!76418) (bvsub lt!76419 lt!76423))))))

(assert (=> b!49057 (or (= (bvand lt!76419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76423 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76419 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76419 lt!76423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49057 (= lt!76423 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756))))))

(assert (=> b!49057 (= lt!76419 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(assert (= (and d!15044 c!3442) b!49053))

(assert (= (and d!15044 (not c!3442)) b!49054))

(assert (= (and d!15044 res!41190) b!49056))

(assert (= (and b!49056 res!41188) b!49055))

(assert (= (and b!49055 res!41189) b!49057))

(declare-fun m!76423 () Bool)

(assert (=> b!49055 m!76423))

(assert (=> b!49053 m!75897))

(declare-fun m!76425 () Bool)

(assert (=> b!49053 m!76425))

(declare-fun m!76427 () Bool)

(assert (=> b!49053 m!76427))

(declare-fun m!76429 () Bool)

(assert (=> b!49057 m!76429))

(assert (=> b!49057 m!75891))

(assert (=> b!49057 m!75897))

(declare-fun m!76431 () Bool)

(assert (=> b!49056 m!76431))

(declare-fun m!76433 () Bool)

(assert (=> d!15044 m!76433))

(declare-fun m!76435 () Bool)

(assert (=> d!15044 m!76435))

(assert (=> d!15044 m!75903))

(declare-fun m!76437 () Bool)

(assert (=> d!15044 m!76437))

(declare-fun m!76439 () Bool)

(assert (=> d!15044 m!76439))

(assert (=> d!15044 m!75895))

(declare-fun m!76441 () Bool)

(assert (=> d!15044 m!76441))

(assert (=> d!15044 m!75893))

(declare-fun m!76443 () Bool)

(assert (=> d!15044 m!76443))

(declare-fun m!76445 () Bool)

(assert (=> d!15044 m!76445))

(declare-fun m!76447 () Bool)

(assert (=> d!15044 m!76447))

(assert (=> b!48793 d!15044))

(declare-fun d!15046 () Bool)

(assert (=> d!15046 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75762)))

(declare-fun lt!76436 () Unit!3416)

(assert (=> d!15046 (= lt!76436 (choose!9 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75756)) lt!75762 (BitStream!1819 (buf!1401 (_2!2399 lt!75756)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (=> d!15046 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75756)) lt!75762) lt!76436)))

(declare-fun bs!3844 () Bool)

(assert (= bs!3844 d!15046))

(assert (=> bs!3844 m!75927))

(declare-fun m!76449 () Bool)

(assert (=> bs!3844 m!76449))

(assert (=> b!48793 d!15046))

(declare-fun d!15048 () Bool)

(assert (=> d!15048 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3845 () Bool)

(assert (= bs!3845 d!15048))

(declare-fun m!76451 () Bool)

(assert (=> bs!3845 m!76451))

(assert (=> b!48793 d!15048))

(declare-fun b!49066 () Bool)

(declare-fun e!32425 () Unit!3416)

(declare-fun lt!76442 () Unit!3416)

(assert (=> b!49066 (= e!32425 lt!76442)))

(declare-fun lt!76453 () (_ BitVec 64))

(assert (=> b!49066 (= lt!76453 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76439 () (_ BitVec 64))

(assert (=> b!49066 (= lt!76439 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> b!49066 (= lt!76442 (arrayBitRangesEqSymmetric!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75756)) lt!76453 lt!76439))))

(assert (=> b!49066 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 (_2!2399 lt!75747)) lt!76453 lt!76439)))

(declare-fun b!49067 () Bool)

(declare-fun Unit!3434 () Unit!3416)

(assert (=> b!49067 (= e!32425 Unit!3434)))

(declare-fun d!15050 () Bool)

(declare-fun e!32426 () Bool)

(assert (=> d!15050 e!32426))

(declare-fun res!41193 () Bool)

(assert (=> d!15050 (=> (not res!41193) (not e!32426))))

(declare-fun lt!76445 () tuple2!4602)

(assert (=> d!15050 (= res!41193 (isPrefixOf!0 (_1!2400 lt!76445) (_2!2400 lt!76445)))))

(declare-fun lt!76444 () BitStream!1818)

(assert (=> d!15050 (= lt!76445 (tuple2!4603 lt!76444 (_2!2399 lt!75756)))))

(declare-fun lt!76448 () Unit!3416)

(declare-fun lt!76438 () Unit!3416)

(assert (=> d!15050 (= lt!76448 lt!76438)))

(assert (=> d!15050 (isPrefixOf!0 lt!76444 (_2!2399 lt!75756))))

(assert (=> d!15050 (= lt!76438 (lemmaIsPrefixTransitive!0 lt!76444 (_2!2399 lt!75756) (_2!2399 lt!75756)))))

(declare-fun lt!76441 () Unit!3416)

(declare-fun lt!76455 () Unit!3416)

(assert (=> d!15050 (= lt!76441 lt!76455)))

(assert (=> d!15050 (isPrefixOf!0 lt!76444 (_2!2399 lt!75756))))

(assert (=> d!15050 (= lt!76455 (lemmaIsPrefixTransitive!0 lt!76444 (_2!2399 lt!75747) (_2!2399 lt!75756)))))

(declare-fun lt!76454 () Unit!3416)

(assert (=> d!15050 (= lt!76454 e!32425)))

(declare-fun c!3447 () Bool)

(assert (=> d!15050 (= c!3447 (not (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000)))))

(declare-fun lt!76443 () Unit!3416)

(declare-fun lt!76437 () Unit!3416)

(assert (=> d!15050 (= lt!76443 lt!76437)))

(assert (=> d!15050 (isPrefixOf!0 (_2!2399 lt!75756) (_2!2399 lt!75756))))

(assert (=> d!15050 (= lt!76437 (lemmaIsPrefixRefl!0 (_2!2399 lt!75756)))))

(declare-fun lt!76440 () Unit!3416)

(declare-fun lt!76451 () Unit!3416)

(assert (=> d!15050 (= lt!76440 lt!76451)))

(assert (=> d!15050 (= lt!76451 (lemmaIsPrefixRefl!0 (_2!2399 lt!75756)))))

(declare-fun lt!76449 () Unit!3416)

(declare-fun lt!76447 () Unit!3416)

(assert (=> d!15050 (= lt!76449 lt!76447)))

(assert (=> d!15050 (isPrefixOf!0 lt!76444 lt!76444)))

(assert (=> d!15050 (= lt!76447 (lemmaIsPrefixRefl!0 lt!76444))))

(declare-fun lt!76452 () Unit!3416)

(declare-fun lt!76456 () Unit!3416)

(assert (=> d!15050 (= lt!76452 lt!76456)))

(assert (=> d!15050 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(assert (=> d!15050 (= lt!76456 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(assert (=> d!15050 (= lt!76444 (BitStream!1819 (buf!1401 (_2!2399 lt!75756)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> d!15050 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75756))))

(assert (=> d!15050 (= (reader!0 (_2!2399 lt!75747) (_2!2399 lt!75756)) lt!76445)))

(declare-fun b!49068 () Bool)

(declare-fun res!41192 () Bool)

(assert (=> b!49068 (=> (not res!41192) (not e!32426))))

(assert (=> b!49068 (= res!41192 (isPrefixOf!0 (_2!2400 lt!76445) (_2!2399 lt!75756)))))

(declare-fun b!49069 () Bool)

(declare-fun res!41191 () Bool)

(assert (=> b!49069 (=> (not res!41191) (not e!32426))))

(assert (=> b!49069 (= res!41191 (isPrefixOf!0 (_1!2400 lt!76445) (_2!2399 lt!75747)))))

(declare-fun lt!76446 () (_ BitVec 64))

(declare-fun b!49070 () Bool)

(declare-fun lt!76450 () (_ BitVec 64))

(assert (=> b!49070 (= e!32426 (= (_1!2400 lt!76445) (withMovedBitIndex!0 (_2!2400 lt!76445) (bvsub lt!76446 lt!76450))))))

(assert (=> b!49070 (or (= (bvand lt!76446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76446 lt!76450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49070 (= lt!76450 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756))))))

(assert (=> b!49070 (= lt!76446 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (= (and d!15050 c!3447) b!49066))

(assert (= (and d!15050 (not c!3447)) b!49067))

(assert (= (and d!15050 res!41193) b!49069))

(assert (= (and b!49069 res!41191) b!49068))

(assert (= (and b!49068 res!41192) b!49070))

(declare-fun m!76453 () Bool)

(assert (=> b!49068 m!76453))

(assert (=> b!49066 m!75915))

(declare-fun m!76461 () Bool)

(assert (=> b!49066 m!76461))

(declare-fun m!76465 () Bool)

(assert (=> b!49066 m!76465))

(declare-fun m!76467 () Bool)

(assert (=> b!49070 m!76467))

(assert (=> b!49070 m!75891))

(assert (=> b!49070 m!75915))

(declare-fun m!76469 () Bool)

(assert (=> b!49069 m!76469))

(declare-fun m!76471 () Bool)

(assert (=> d!15050 m!76471))

(declare-fun m!76473 () Bool)

(assert (=> d!15050 m!76473))

(assert (=> d!15050 m!75909))

(declare-fun m!76477 () Bool)

(assert (=> d!15050 m!76477))

(declare-fun m!76479 () Bool)

(assert (=> d!15050 m!76479))

(assert (=> d!15050 m!76105))

(declare-fun m!76481 () Bool)

(assert (=> d!15050 m!76481))

(assert (=> d!15050 m!76103))

(declare-fun m!76483 () Bool)

(assert (=> d!15050 m!76483))

(assert (=> d!15050 m!76445))

(assert (=> d!15050 m!76447))

(assert (=> b!48793 d!15050))

(declare-fun d!15056 () Bool)

(assert (=> d!15056 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!76483 () Unit!3416)

(assert (=> d!15056 (= lt!76483 (choose!9 thiss!1379 (buf!1401 (_2!2399 lt!75756)) (bvsub to!314 i!635) (BitStream!1819 (buf!1401 (_2!2399 lt!75756)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (=> d!15056 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1401 (_2!2399 lt!75756)) (bvsub to!314 i!635)) lt!76483)))

(declare-fun bs!3847 () Bool)

(assert (= bs!3847 d!15056))

(assert (=> bs!3847 m!75929))

(declare-fun m!76491 () Bool)

(assert (=> bs!3847 m!76491))

(assert (=> b!48793 d!15056))

(declare-fun b!49115 () Bool)

(declare-datatypes ((tuple2!4614 0))(
  ( (tuple2!4615 (_1!2406 Bool) (_2!2406 BitStream!1818)) )
))
(declare-fun lt!76524 () tuple2!4614)

(declare-fun lt!76523 () (_ BitVec 64))

(declare-datatypes ((tuple2!4616 0))(
  ( (tuple2!4617 (_1!2407 List!550) (_2!2407 BitStream!1818)) )
))
(declare-fun e!32452 () tuple2!4616)

(assert (=> b!49115 (= e!32452 (tuple2!4617 (Cons!546 (_1!2406 lt!76524) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!76524) (bvsub (bvsub to!314 i!635) lt!76523))) (_2!2406 lt!76524)))))

(declare-fun readBit!0 (BitStream!1818) tuple2!4614)

(assert (=> b!49115 (= lt!76524 (readBit!0 (_1!2400 lt!75754)))))

(assert (=> b!49115 (= lt!76523 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15060 () Bool)

(declare-fun e!32451 () Bool)

(assert (=> d!15060 e!32451))

(declare-fun c!3459 () Bool)

(assert (=> d!15060 (= c!3459 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76522 () List!550)

(assert (=> d!15060 (= lt!76522 (_1!2407 e!32452))))

(declare-fun c!3458 () Bool)

(assert (=> d!15060 (= c!3458 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15060 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15060 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75754) (bvsub to!314 i!635)) lt!76522)))

(declare-fun b!49116 () Bool)

(declare-fun isEmpty!143 (List!550) Bool)

(assert (=> b!49116 (= e!32451 (isEmpty!143 lt!76522))))

(declare-fun b!49117 () Bool)

(assert (=> b!49117 (= e!32451 (> (length!245 lt!76522) 0))))

(declare-fun b!49114 () Bool)

(assert (=> b!49114 (= e!32452 (tuple2!4617 Nil!547 (_1!2400 lt!75754)))))

(assert (= (and d!15060 c!3458) b!49114))

(assert (= (and d!15060 (not c!3458)) b!49115))

(assert (= (and d!15060 c!3459) b!49116))

(assert (= (and d!15060 (not c!3459)) b!49117))

(declare-fun m!76555 () Bool)

(assert (=> b!49115 m!76555))

(declare-fun m!76557 () Bool)

(assert (=> b!49115 m!76557))

(declare-fun m!76559 () Bool)

(assert (=> b!49116 m!76559))

(declare-fun m!76561 () Bool)

(assert (=> b!49117 m!76561))

(assert (=> b!48793 d!15060))

(declare-fun b!49119 () Bool)

(declare-fun lt!76526 () (_ BitVec 64))

(declare-fun lt!76527 () tuple2!4614)

(declare-fun e!32454 () tuple2!4616)

(assert (=> b!49119 (= e!32454 (tuple2!4617 (Cons!546 (_1!2406 lt!76527) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!76527) (bvsub lt!75762 lt!76526))) (_2!2406 lt!76527)))))

(assert (=> b!49119 (= lt!76527 (readBit!0 (_1!2400 lt!75750)))))

(assert (=> b!49119 (= lt!76526 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15078 () Bool)

(declare-fun e!32453 () Bool)

(assert (=> d!15078 e!32453))

(declare-fun c!3461 () Bool)

(assert (=> d!15078 (= c!3461 (= lt!75762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76525 () List!550)

(assert (=> d!15078 (= lt!76525 (_1!2407 e!32454))))

(declare-fun c!3460 () Bool)

(assert (=> d!15078 (= c!3460 (= lt!75762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15078 (bvsge lt!75762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15078 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75750) lt!75762) lt!76525)))

(declare-fun b!49120 () Bool)

(assert (=> b!49120 (= e!32453 (isEmpty!143 lt!76525))))

(declare-fun b!49121 () Bool)

(assert (=> b!49121 (= e!32453 (> (length!245 lt!76525) 0))))

(declare-fun b!49118 () Bool)

(assert (=> b!49118 (= e!32454 (tuple2!4617 Nil!547 (_1!2400 lt!75750)))))

(assert (= (and d!15078 c!3460) b!49118))

(assert (= (and d!15078 (not c!3460)) b!49119))

(assert (= (and d!15078 c!3461) b!49120))

(assert (= (and d!15078 (not c!3461)) b!49121))

(declare-fun m!76563 () Bool)

(assert (=> b!49119 m!76563))

(declare-fun m!76565 () Bool)

(assert (=> b!49119 m!76565))

(declare-fun m!76567 () Bool)

(assert (=> b!49120 m!76567))

(declare-fun m!76569 () Bool)

(assert (=> b!49121 m!76569))

(assert (=> b!48793 d!15078))

(declare-fun d!15080 () Bool)

(assert (=> d!15080 (= (bitAt!0 (buf!1401 (_1!2400 lt!75750)) lt!75751) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75750))) ((_ extract 31 0) (bvsdiv lt!75751 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75751 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3851 () Bool)

(assert (= bs!3851 d!15080))

(declare-fun m!76573 () Bool)

(assert (=> bs!3851 m!76573))

(assert (=> bs!3851 m!76223))

(assert (=> b!48792 d!15080))

(declare-fun d!15084 () Bool)

(assert (=> d!15084 (= (bitAt!0 (buf!1401 (_1!2400 lt!75754)) lt!75751) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75754))) ((_ extract 31 0) (bvsdiv lt!75751 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75751 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3852 () Bool)

(assert (= bs!3852 d!15084))

(declare-fun m!76575 () Bool)

(assert (=> bs!3852 m!76575))

(assert (=> bs!3852 m!76223))

(assert (=> b!48792 d!15084))

(declare-fun d!15086 () Bool)

(assert (=> d!15086 (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!665 (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!48802 d!15086))

(declare-fun d!15088 () Bool)

(declare-fun c!3464 () Bool)

(assert (=> d!15088 (= c!3464 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32457 () List!550)

(assert (=> d!15088 (= (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!32457)))

(declare-fun b!49126 () Bool)

(assert (=> b!49126 (= e!32457 Nil!547)))

(declare-fun b!49127 () Bool)

(assert (=> b!49127 (= e!32457 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15088 c!3464) b!49126))

(assert (= (and d!15088 (not c!3464)) b!49127))

(assert (=> b!49127 m!75949))

(assert (=> b!49127 m!76413))

(declare-fun m!76579 () Bool)

(assert (=> b!49127 m!76579))

(assert (=> b!48802 d!15088))

(declare-fun d!15092 () Bool)

(assert (=> d!15092 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3854 () Bool)

(assert (= bs!3854 d!15092))

(assert (=> bs!3854 m!75949))

(assert (=> bs!3854 m!76413))

(assert (=> b!48802 d!15092))

(declare-fun d!15094 () Bool)

(assert (=> d!15094 (= (head!369 lt!75755) (h!665 lt!75755))))

(assert (=> b!48791 d!15094))

(declare-fun d!15096 () Bool)

(assert (=> d!15096 (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!665 (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48790 d!15096))

(declare-fun d!15098 () Bool)

(declare-fun c!3465 () Bool)

(assert (=> d!15098 (= c!3465 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32458 () List!550)

(assert (=> d!15098 (= (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!32458)))

(declare-fun b!49128 () Bool)

(assert (=> b!49128 (= e!32458 Nil!547)))

(declare-fun b!49129 () Bool)

(assert (=> b!49129 (= e!32458 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15098 c!3465) b!49128))

(assert (= (and d!15098 (not c!3465)) b!49129))

(assert (=> b!49129 m!75949))

(assert (=> b!49129 m!76413))

(declare-fun m!76581 () Bool)

(assert (=> b!49129 m!76581))

(assert (=> b!48790 d!15098))

(declare-fun d!15100 () Bool)

(assert (=> d!15100 (= (head!369 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_1!2400 lt!75745) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!665 (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_1!2400 lt!75745) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48790 d!15100))

(declare-fun b!49131 () Bool)

(declare-fun lt!76533 () (_ BitVec 64))

(declare-fun e!32460 () tuple2!4616)

(declare-fun lt!76534 () tuple2!4614)

(assert (=> b!49131 (= e!32460 (tuple2!4617 (Cons!546 (_1!2406 lt!76534) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_2!2406 lt!76534) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76533))) (_2!2406 lt!76534)))))

(assert (=> b!49131 (= lt!76534 (readBit!0 (_1!2400 lt!75745)))))

(assert (=> b!49131 (= lt!76533 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15102 () Bool)

(declare-fun e!32459 () Bool)

(assert (=> d!15102 e!32459))

(declare-fun c!3467 () Bool)

(assert (=> d!15102 (= c!3467 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76532 () List!550)

(assert (=> d!15102 (= lt!76532 (_1!2407 e!32460))))

(declare-fun c!3466 () Bool)

(assert (=> d!15102 (= c!3466 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15102 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15102 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_1!2400 lt!75745) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76532)))

(declare-fun b!49132 () Bool)

(assert (=> b!49132 (= e!32459 (isEmpty!143 lt!76532))))

(declare-fun b!49133 () Bool)

(assert (=> b!49133 (= e!32459 (> (length!245 lt!76532) 0))))

(declare-fun b!49130 () Bool)

(assert (=> b!49130 (= e!32460 (tuple2!4617 Nil!547 (_1!2400 lt!75745)))))

(assert (= (and d!15102 c!3466) b!49130))

(assert (= (and d!15102 (not c!3466)) b!49131))

(assert (= (and d!15102 c!3467) b!49132))

(assert (= (and d!15102 (not c!3467)) b!49133))

(declare-fun m!76583 () Bool)

(assert (=> b!49131 m!76583))

(declare-fun m!76585 () Bool)

(assert (=> b!49131 m!76585))

(declare-fun m!76587 () Bool)

(assert (=> b!49132 m!76587))

(declare-fun m!76589 () Bool)

(assert (=> b!49133 m!76589))

(assert (=> b!48790 d!15102))

(declare-fun d!15104 () Bool)

(assert (=> d!15104 (= (invariant!0 (currentBit!2913 (_2!2399 lt!75756)) (currentByte!2918 (_2!2399 lt!75756)) (size!1049 (buf!1401 (_2!2399 lt!75756)))) (and (bvsge (currentBit!2913 (_2!2399 lt!75756)) #b00000000000000000000000000000000) (bvslt (currentBit!2913 (_2!2399 lt!75756)) #b00000000000000000000000000001000) (bvsge (currentByte!2918 (_2!2399 lt!75756)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2918 (_2!2399 lt!75756)) (size!1049 (buf!1401 (_2!2399 lt!75756)))) (and (= (currentBit!2913 (_2!2399 lt!75756)) #b00000000000000000000000000000000) (= (currentByte!2918 (_2!2399 lt!75756)) (size!1049 (buf!1401 (_2!2399 lt!75756))))))))))

(assert (=> b!48801 d!15104))

(declare-fun d!15106 () Bool)

(assert (=> d!15106 (= (invariant!0 (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75756)))) (and (bvsge (currentBit!2913 (_2!2399 lt!75747)) #b00000000000000000000000000000000) (bvslt (currentBit!2913 (_2!2399 lt!75747)) #b00000000000000000000000000001000) (bvsge (currentByte!2918 (_2!2399 lt!75747)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75756)))) (and (= (currentBit!2913 (_2!2399 lt!75747)) #b00000000000000000000000000000000) (= (currentByte!2918 (_2!2399 lt!75747)) (size!1049 (buf!1401 (_2!2399 lt!75756))))))))))

(assert (=> b!48800 d!15106))

(declare-fun d!15108 () Bool)

(declare-fun size!1052 (List!550) Int)

(assert (=> d!15108 (= (length!245 lt!75755) (size!1052 lt!75755))))

(declare-fun bs!3855 () Bool)

(assert (= bs!3855 d!15108))

(declare-fun m!76591 () Bool)

(assert (=> bs!3855 m!76591))

(assert (=> b!48789 d!15108))

(check-sat (not b!48944) (not b!49119) (not b!49056) (not d!15048) (not d!14992) (not d!14994) (not d!14982) (not b!48955) (not b!49037) (not b!49069) (not b!49053) (not d!15056) (not d!15046) (not b!48957) (not b!48878) (not b!48883) (not b!49041) (not d!15108) (not bm!610) (not b!49039) (not b!48941) (not b!48972) (not b!49035) (not b!49117) (not d!14956) (not b!49115) (not d!14940) (not b!48928) (not b!48943) (not d!15042) (not d!15050) (not b!48880) (not b!48939) (not d!14996) (not b!49070) (not b!49120) (not b!48923) (not b!49131) (not d!14980) (not b!49066) (not b!48926) (not b!48946) (not b!48942) (not b!49121) (not b!48881) (not b!49116) (not b!49127) (not d!14976) (not d!14984) (not b!49068) (not b!49129) (not b!48871) (not d!14950) (not d!14952) (not d!14988) (not b!49057) (not b!48925) (not b!49055) (not b!49042) (not b!49040) (not b!49038) (not b!48921) (not b!48927) (not d!14944) (not b!49036) (not d!15038) (not d!14946) (not b!49132) (not b!49133) (not d!15044))
(check-sat)
(get-model)

(declare-fun d!15712 () Bool)

(declare-fun e!32891 () Bool)

(assert (=> d!15712 e!32891))

(declare-fun res!41715 () Bool)

(assert (=> d!15712 (=> (not res!41715) (not e!32891))))

(declare-fun lt!77545 () (_ BitVec 64))

(declare-fun lt!77543 () (_ BitVec 64))

(declare-fun lt!77541 () (_ BitVec 64))

(assert (=> d!15712 (= res!41715 (= lt!77545 (bvsub lt!77543 lt!77541)))))

(assert (=> d!15712 (or (= (bvand lt!77543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77541 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77543 lt!77541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15712 (= lt!77541 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2404 lt!76359)))) ((_ sign_extend 32) (currentByte!2918 (_1!2404 lt!76359))) ((_ sign_extend 32) (currentBit!2913 (_1!2404 lt!76359)))))))

(declare-fun lt!77546 () (_ BitVec 64))

(declare-fun lt!77544 () (_ BitVec 64))

(assert (=> d!15712 (= lt!77543 (bvmul lt!77546 lt!77544))))

(assert (=> d!15712 (or (= lt!77546 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77544 (bvsdiv (bvmul lt!77546 lt!77544) lt!77546)))))

(assert (=> d!15712 (= lt!77544 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15712 (= lt!77546 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2404 lt!76359)))))))

(assert (=> d!15712 (= lt!77545 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_1!2404 lt!76359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_1!2404 lt!76359)))))))

(assert (=> d!15712 (invariant!0 (currentBit!2913 (_1!2404 lt!76359)) (currentByte!2918 (_1!2404 lt!76359)) (size!1049 (buf!1401 (_1!2404 lt!76359))))))

(assert (=> d!15712 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!76359))) (currentByte!2918 (_1!2404 lt!76359)) (currentBit!2913 (_1!2404 lt!76359))) lt!77545)))

(declare-fun b!49841 () Bool)

(declare-fun res!41714 () Bool)

(assert (=> b!49841 (=> (not res!41714) (not e!32891))))

(assert (=> b!49841 (= res!41714 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77545))))

(declare-fun b!49842 () Bool)

(declare-fun lt!77542 () (_ BitVec 64))

(assert (=> b!49842 (= e!32891 (bvsle lt!77545 (bvmul lt!77542 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49842 (or (= lt!77542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77542)))))

(assert (=> b!49842 (= lt!77542 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2404 lt!76359)))))))

(assert (= (and d!15712 res!41715) b!49841))

(assert (= (and b!49841 res!41714) b!49842))

(declare-fun m!78221 () Bool)

(assert (=> d!15712 m!78221))

(declare-fun m!78223 () Bool)

(assert (=> d!15712 m!78223))

(assert (=> b!49042 d!15712))

(declare-fun d!15714 () Bool)

(declare-fun e!32892 () Bool)

(assert (=> d!15714 e!32892))

(declare-fun res!41717 () Bool)

(assert (=> d!15714 (=> (not res!41717) (not e!32892))))

(declare-fun lt!77551 () (_ BitVec 64))

(declare-fun lt!77547 () (_ BitVec 64))

(declare-fun lt!77549 () (_ BitVec 64))

(assert (=> d!15714 (= res!41717 (= lt!77551 (bvsub lt!77549 lt!77547)))))

(assert (=> d!15714 (or (= (bvand lt!77549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77547 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77549 lt!77547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15714 (= lt!77547 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76369)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76369))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76369)))))))

(declare-fun lt!77552 () (_ BitVec 64))

(declare-fun lt!77550 () (_ BitVec 64))

(assert (=> d!15714 (= lt!77549 (bvmul lt!77552 lt!77550))))

(assert (=> d!15714 (or (= lt!77552 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77550 (bvsdiv (bvmul lt!77552 lt!77550) lt!77552)))))

(assert (=> d!15714 (= lt!77550 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15714 (= lt!77552 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76369)))))))

(assert (=> d!15714 (= lt!77551 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76369))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76369)))))))

(assert (=> d!15714 (invariant!0 (currentBit!2913 (_2!2399 lt!76369)) (currentByte!2918 (_2!2399 lt!76369)) (size!1049 (buf!1401 (_2!2399 lt!76369))))))

(assert (=> d!15714 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76369))) (currentByte!2918 (_2!2399 lt!76369)) (currentBit!2913 (_2!2399 lt!76369))) lt!77551)))

(declare-fun b!49843 () Bool)

(declare-fun res!41716 () Bool)

(assert (=> b!49843 (=> (not res!41716) (not e!32892))))

(assert (=> b!49843 (= res!41716 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77551))))

(declare-fun b!49844 () Bool)

(declare-fun lt!77548 () (_ BitVec 64))

(assert (=> b!49844 (= e!32892 (bvsle lt!77551 (bvmul lt!77548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49844 (or (= lt!77548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77548)))))

(assert (=> b!49844 (= lt!77548 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76369)))))))

(assert (= (and d!15714 res!41717) b!49843))

(assert (= (and b!49843 res!41716) b!49844))

(declare-fun m!78225 () Bool)

(assert (=> d!15714 m!78225))

(declare-fun m!78227 () Bool)

(assert (=> d!15714 m!78227))

(assert (=> b!49042 d!15714))

(declare-fun d!15716 () Bool)

(declare-fun res!41720 () Bool)

(declare-fun e!32894 () Bool)

(assert (=> d!15716 (=> (not res!41720) (not e!32894))))

(assert (=> d!15716 (= res!41720 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75984)))))))

(assert (=> d!15716 (= (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75984)) e!32894)))

(declare-fun b!49845 () Bool)

(declare-fun res!41719 () Bool)

(assert (=> b!49845 (=> (not res!41719) (not e!32894))))

(assert (=> b!49845 (= res!41719 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75984))) (currentByte!2918 (_2!2399 lt!75984)) (currentBit!2913 (_2!2399 lt!75984)))))))

(declare-fun b!49846 () Bool)

(declare-fun e!32893 () Bool)

(assert (=> b!49846 (= e!32894 e!32893)))

(declare-fun res!41718 () Bool)

(assert (=> b!49846 (=> res!41718 e!32893)))

(assert (=> b!49846 (= res!41718 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000))))

(declare-fun b!49847 () Bool)

(assert (=> b!49847 (= e!32893 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75984)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (= (and d!15716 res!41720) b!49845))

(assert (= (and b!49845 res!41719) b!49846))

(assert (= (and b!49846 (not res!41718)) b!49847))

(assert (=> b!49845 m!75915))

(assert (=> b!49845 m!76101))

(assert (=> b!49847 m!75915))

(assert (=> b!49847 m!75915))

(declare-fun m!78229 () Bool)

(assert (=> b!49847 m!78229))

(assert (=> b!48923 d!15716))

(declare-fun d!15718 () Bool)

(declare-fun e!32897 () Bool)

(assert (=> d!15718 e!32897))

(declare-fun res!41723 () Bool)

(assert (=> d!15718 (=> (not res!41723) (not e!32897))))

(declare-fun lt!77557 () BitStream!1818)

(declare-fun lt!77558 () (_ BitVec 64))

(assert (=> d!15718 (= res!41723 (= (bvadd lt!77558 (bvsub lt!76419 lt!76423)) (bitIndex!0 (size!1049 (buf!1401 lt!77557)) (currentByte!2918 lt!77557) (currentBit!2913 lt!77557))))))

(assert (=> d!15718 (or (not (= (bvand lt!77558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76419 lt!76423) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77558 (bvsub lt!76419 lt!76423)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15718 (= lt!77558 (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76418))) (currentByte!2918 (_2!2400 lt!76418)) (currentBit!2913 (_2!2400 lt!76418))))))

(declare-fun moveBitIndex!0 (BitStream!1818 (_ BitVec 64)) tuple2!4600)

(assert (=> d!15718 (= lt!77557 (_2!2399 (moveBitIndex!0 (_2!2400 lt!76418) (bvsub lt!76419 lt!76423))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1818 (_ BitVec 64)) Bool)

(assert (=> d!15718 (moveBitIndexPrecond!0 (_2!2400 lt!76418) (bvsub lt!76419 lt!76423))))

(assert (=> d!15718 (= (withMovedBitIndex!0 (_2!2400 lt!76418) (bvsub lt!76419 lt!76423)) lt!77557)))

(declare-fun b!49850 () Bool)

(assert (=> b!49850 (= e!32897 (= (size!1049 (buf!1401 (_2!2400 lt!76418))) (size!1049 (buf!1401 lt!77557))))))

(assert (= (and d!15718 res!41723) b!49850))

(declare-fun m!78231 () Bool)

(assert (=> d!15718 m!78231))

(declare-fun m!78233 () Bool)

(assert (=> d!15718 m!78233))

(declare-fun m!78235 () Bool)

(assert (=> d!15718 m!78235))

(declare-fun m!78237 () Bool)

(assert (=> d!15718 m!78237))

(assert (=> b!49057 d!15718))

(assert (=> b!49057 d!14940))

(assert (=> b!49057 d!14982))

(assert (=> d!14946 d!14954))

(declare-fun d!15720 () Bool)

(assert (=> d!15720 (isPrefixOf!0 thiss!1379 (_2!2399 lt!75756))))

(assert (=> d!15720 true))

(declare-fun _$15!162 () Unit!3416)

(assert (=> d!15720 (= (choose!30 thiss!1379 (_2!2399 lt!75747) (_2!2399 lt!75756)) _$15!162)))

(declare-fun bs!3958 () Bool)

(assert (= bs!3958 d!15720))

(assert (=> bs!3958 m!75903))

(assert (=> d!14946 d!15720))

(assert (=> d!14946 d!14990))

(declare-fun b!49861 () Bool)

(declare-fun res!41734 () Bool)

(declare-fun e!32900 () Bool)

(assert (=> b!49861 (=> (not res!41734) (not e!32900))))

(declare-fun lt!77581 () tuple2!4608)

(assert (=> b!49861 (= res!41734 (invariant!0 (currentBit!2913 (_2!2403 lt!77581)) (currentByte!2918 (_2!2403 lt!77581)) (size!1049 (buf!1401 (_2!2403 lt!77581)))))))

(declare-fun b!49862 () Bool)

(assert (=> b!49862 (= e!32900 (= (byteArrayBitContentToList!0 (_2!2403 lt!77581) (_1!2403 lt!77581) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2403 lt!77581) lt!76365 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49863 () Bool)

(declare-fun res!41737 () Bool)

(assert (=> b!49863 (=> (not res!41737) (not e!32900))))

(declare-fun lt!77582 () (_ BitVec 64))

(assert (=> b!49863 (= res!41737 (= (size!1049 (_1!2403 lt!77581)) ((_ extract 31 0) lt!77582)))))

(assert (=> b!49863 (and (bvslt lt!77582 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!77582 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!77585 () (_ BitVec 64))

(declare-fun lt!77579 () (_ BitVec 64))

(assert (=> b!49863 (= lt!77582 (bvsdiv lt!77585 lt!77579))))

(assert (=> b!49863 (and (not (= lt!77579 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!77585 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77579 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!49863 (= lt!77579 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!77578 () (_ BitVec 64))

(declare-fun lt!77580 () (_ BitVec 64))

(assert (=> b!49863 (= lt!77585 (bvsub lt!77578 lt!77580))))

(assert (=> b!49863 (or (= (bvand lt!77578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77580 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77578 lt!77580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49863 (= lt!77580 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77584 () (_ BitVec 64))

(assert (=> b!49863 (= lt!77578 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!77584))))

(assert (=> b!49863 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77584 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!77584) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49863 (= lt!77584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!15722 () Bool)

(assert (=> d!15722 e!32900))

(declare-fun res!41736 () Bool)

(assert (=> d!15722 (=> (not res!41736) (not e!32900))))

(assert (=> d!15722 (= res!41736 (= (buf!1401 (_2!2403 lt!77581)) (buf!1401 lt!76365)))))

(declare-datatypes ((tuple3!182 0))(
  ( (tuple3!183 (_1!2419 Unit!3416) (_2!2419 BitStream!1818) (_3!103 array!2313)) )
))
(declare-fun lt!77577 () tuple3!182)

(assert (=> d!15722 (= lt!77581 (tuple2!4609 (_3!103 lt!77577) (_2!2419 lt!77577)))))

(declare-fun readBitsLoop!0 (BitStream!1818 (_ BitVec 64) array!2313 (_ BitVec 64) (_ BitVec 64)) tuple3!182)

(assert (=> d!15722 (= lt!77577 (readBitsLoop!0 lt!76365 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2314 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15722 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!15722 (= (readBits!0 lt!76365 #b0000000000000000000000000000000000000000000000000000000000000001) lt!77581)))

(declare-fun b!49864 () Bool)

(declare-fun res!41738 () Bool)

(assert (=> b!49864 (=> (not res!41738) (not e!32900))))

(assert (=> b!49864 (= res!41738 (bvsle (currentByte!2918 lt!76365) (currentByte!2918 (_2!2403 lt!77581))))))

(declare-fun b!49865 () Bool)

(declare-fun res!41735 () Bool)

(assert (=> b!49865 (=> (not res!41735) (not e!32900))))

(declare-fun lt!77583 () (_ BitVec 64))

(assert (=> b!49865 (= res!41735 (= (bvadd lt!77583 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1049 (buf!1401 (_2!2403 lt!77581))) (currentByte!2918 (_2!2403 lt!77581)) (currentBit!2913 (_2!2403 lt!77581)))))))

(assert (=> b!49865 (or (not (= (bvand lt!77583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77583 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49865 (= lt!77583 (bitIndex!0 (size!1049 (buf!1401 lt!76365)) (currentByte!2918 lt!76365) (currentBit!2913 lt!76365)))))

(assert (= (and d!15722 res!41736) b!49865))

(assert (= (and b!49865 res!41735) b!49861))

(assert (= (and b!49861 res!41734) b!49863))

(assert (= (and b!49863 res!41737) b!49864))

(assert (= (and b!49864 res!41738) b!49862))

(declare-fun m!78239 () Bool)

(assert (=> b!49861 m!78239))

(declare-fun m!78241 () Bool)

(assert (=> b!49862 m!78241))

(declare-fun m!78243 () Bool)

(assert (=> b!49862 m!78243))

(declare-fun m!78245 () Bool)

(assert (=> d!15722 m!78245))

(declare-fun m!78247 () Bool)

(assert (=> b!49865 m!78247))

(declare-fun m!78249 () Bool)

(assert (=> b!49865 m!78249))

(assert (=> b!49040 d!15722))

(declare-fun d!15724 () Bool)

(declare-fun lt!77588 () tuple2!4614)

(assert (=> d!15724 (= lt!77588 (readBit!0 lt!76365))))

(assert (=> d!15724 (= (readBitPure!0 lt!76365) (tuple2!4611 (_2!2406 lt!77588) (_1!2406 lt!77588)))))

(declare-fun bs!3959 () Bool)

(assert (= bs!3959 d!15724))

(declare-fun m!78251 () Bool)

(assert (=> bs!3959 m!78251))

(assert (=> b!49040 d!15724))

(declare-fun d!15726 () Bool)

(declare-fun e!32903 () Bool)

(assert (=> d!15726 e!32903))

(declare-fun res!41742 () Bool)

(assert (=> d!15726 (=> (not res!41742) (not e!32903))))

(assert (=> d!15726 (= res!41742 (invariant!0 (currentBit!2913 (_2!2399 lt!76362)) (currentByte!2918 (_2!2399 lt!76362)) (size!1049 (buf!1401 (_2!2399 lt!76362)))))))

(assert (=> d!15726 (= (readerFrom!0 (_2!2399 lt!76362) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379)) (BitStream!1819 (buf!1401 (_2!2399 lt!76362)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(declare-fun b!49868 () Bool)

(assert (=> b!49868 (= e!32903 (invariant!0 (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379) (size!1049 (buf!1401 (_2!2399 lt!76362)))))))

(assert (= (and d!15726 res!41742) b!49868))

(declare-fun m!78253 () Bool)

(assert (=> d!15726 m!78253))

(declare-fun m!78255 () Bool)

(assert (=> b!49868 m!78255))

(assert (=> b!49040 d!15726))

(declare-fun d!15728 () Bool)

(declare-fun lt!77589 () tuple2!4614)

(assert (=> d!15728 (= lt!77589 (readBit!0 (readerFrom!0 (_2!2399 lt!76369) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379))))))

(assert (=> d!15728 (= (readBitPure!0 (readerFrom!0 (_2!2399 lt!76369) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379))) (tuple2!4611 (_2!2406 lt!77589) (_1!2406 lt!77589)))))

(declare-fun bs!3960 () Bool)

(assert (= bs!3960 d!15728))

(assert (=> bs!3960 m!76417))

(declare-fun m!78257 () Bool)

(assert (=> bs!3960 m!78257))

(assert (=> b!49038 d!15728))

(declare-fun d!15730 () Bool)

(declare-fun e!32904 () Bool)

(assert (=> d!15730 e!32904))

(declare-fun res!41743 () Bool)

(assert (=> d!15730 (=> (not res!41743) (not e!32904))))

(assert (=> d!15730 (= res!41743 (invariant!0 (currentBit!2913 (_2!2399 lt!76369)) (currentByte!2918 (_2!2399 lt!76369)) (size!1049 (buf!1401 (_2!2399 lt!76369)))))))

(assert (=> d!15730 (= (readerFrom!0 (_2!2399 lt!76369) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379)) (BitStream!1819 (buf!1401 (_2!2399 lt!76369)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(declare-fun b!49869 () Bool)

(assert (=> b!49869 (= e!32904 (invariant!0 (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379) (size!1049 (buf!1401 (_2!2399 lt!76369)))))))

(assert (= (and d!15730 res!41743) b!49869))

(assert (=> d!15730 m!78227))

(declare-fun m!78259 () Bool)

(assert (=> b!49869 m!78259))

(assert (=> b!49038 d!15730))

(declare-fun d!15732 () Bool)

(assert (=> d!15732 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3961 () Bool)

(assert (= bs!3961 d!15732))

(assert (=> bs!3961 m!76225))

(assert (=> b!48972 d!15732))

(declare-fun d!15734 () Bool)

(assert (=> d!15734 (= (length!245 lt!76532) (size!1052 lt!76532))))

(declare-fun bs!3962 () Bool)

(assert (= bs!3962 d!15734))

(declare-fun m!78261 () Bool)

(assert (=> bs!3962 m!78261))

(assert (=> b!49133 d!15734))

(declare-fun d!15736 () Bool)

(assert (=> d!15736 (= (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) (bvsub (bvmul ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))))))))

(assert (=> d!15042 d!15736))

(declare-fun d!15738 () Bool)

(declare-fun e!32905 () Bool)

(assert (=> d!15738 e!32905))

(declare-fun res!41745 () Bool)

(assert (=> d!15738 (=> (not res!41745) (not e!32905))))

(declare-fun lt!77594 () (_ BitVec 64))

(declare-fun lt!77590 () (_ BitVec 64))

(declare-fun lt!77592 () (_ BitVec 64))

(assert (=> d!15738 (= res!41745 (= lt!77594 (bvsub lt!77592 lt!77590)))))

(assert (=> d!15738 (or (= (bvand lt!77592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77590 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77592 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77592 lt!77590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15738 (= lt!77590 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012)))))))

(declare-fun lt!77595 () (_ BitVec 64))

(declare-fun lt!77593 () (_ BitVec 64))

(assert (=> d!15738 (= lt!77592 (bvmul lt!77595 lt!77593))))

(assert (=> d!15738 (or (= lt!77595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77593 (bvsdiv (bvmul lt!77595 lt!77593) lt!77595)))))

(assert (=> d!15738 (= lt!77593 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15738 (= lt!77595 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))))))

(assert (=> d!15738 (= lt!77594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012)))))))

(assert (=> d!15738 (invariant!0 (currentBit!2913 (_2!2399 lt!76012)) (currentByte!2918 (_2!2399 lt!76012)) (size!1049 (buf!1401 (_2!2399 lt!76012))))))

(assert (=> d!15738 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012))) lt!77594)))

(declare-fun b!49870 () Bool)

(declare-fun res!41744 () Bool)

(assert (=> b!49870 (=> (not res!41744) (not e!32905))))

(assert (=> b!49870 (= res!41744 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77594))))

(declare-fun b!49871 () Bool)

(declare-fun lt!77591 () (_ BitVec 64))

(assert (=> b!49871 (= e!32905 (bvsle lt!77594 (bvmul lt!77591 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49871 (or (= lt!77591 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77591 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77591)))))

(assert (=> b!49871 (= lt!77591 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))))))

(assert (= (and d!15738 res!41745) b!49870))

(assert (= (and b!49870 res!41744) b!49871))

(declare-fun m!78263 () Bool)

(assert (=> d!15738 m!78263))

(declare-fun m!78265 () Bool)

(assert (=> d!15738 m!78265))

(assert (=> b!48927 d!15738))

(declare-fun d!15740 () Bool)

(assert (=> d!15740 (= (bitAt!0 (buf!1401 (_2!2399 lt!76012)) lt!75999) (bitAt!0 (buf!1401 (_2!2399 lt!75987)) lt!75999))))

(declare-fun lt!77598 () Unit!3416)

(declare-fun choose!31 (array!2313 array!2313 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3416)

(assert (=> d!15740 (= lt!77598 (choose!31 (buf!1401 (_2!2399 lt!76012)) (buf!1401 (_2!2399 lt!75987)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!75999 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012)))))))

(assert (=> d!15740 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012)))))))

(assert (=> d!15740 (= (arrayBitRangesEqImpliesEq!0 (buf!1401 (_2!2399 lt!76012)) (buf!1401 (_2!2399 lt!75987)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!75999 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012)))) lt!77598)))

(declare-fun bs!3963 () Bool)

(assert (= bs!3963 d!15740))

(assert (=> bs!3963 m!76115))

(assert (=> bs!3963 m!76159))

(assert (=> bs!3963 m!76135))

(declare-fun m!78267 () Bool)

(assert (=> bs!3963 m!78267))

(assert (=> b!48927 d!15740))

(declare-fun d!15742 () Bool)

(declare-fun res!41748 () Bool)

(declare-fun e!32907 () Bool)

(assert (=> d!15742 (=> (not res!41748) (not e!32907))))

(assert (=> d!15742 (= res!41748 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75987)))))))

(assert (=> d!15742 (= (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75987)) e!32907)))

(declare-fun b!49872 () Bool)

(declare-fun res!41747 () Bool)

(assert (=> b!49872 (=> (not res!41747) (not e!32907))))

(assert (=> b!49872 (= res!41747 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75987))) (currentByte!2918 (_2!2399 lt!75987)) (currentBit!2913 (_2!2399 lt!75987)))))))

(declare-fun b!49873 () Bool)

(declare-fun e!32906 () Bool)

(assert (=> b!49873 (= e!32907 e!32906)))

(declare-fun res!41746 () Bool)

(assert (=> b!49873 (=> res!41746 e!32906)))

(assert (=> b!49873 (= res!41746 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000))))

(declare-fun b!49874 () Bool)

(assert (=> b!49874 (= e!32906 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75987)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (= (and d!15742 res!41748) b!49872))

(assert (= (and b!49872 res!41747) b!49873))

(assert (= (and b!49873 (not res!41746)) b!49874))

(assert (=> b!49872 m!75915))

(assert (=> b!49872 m!76163))

(assert (=> b!49874 m!75915))

(assert (=> b!49874 m!75915))

(declare-fun m!78269 () Bool)

(assert (=> b!49874 m!78269))

(assert (=> b!48927 d!15742))

(declare-fun d!15744 () Bool)

(assert (=> d!15744 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) (bvsub lt!76006 lt!75976)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012)))) (bvsub lt!76006 lt!75976)))))

(declare-fun bs!3964 () Bool)

(assert (= bs!3964 d!15744))

(assert (=> bs!3964 m!78263))

(assert (=> b!48927 d!15744))

(declare-fun d!15746 () Bool)

(assert (=> d!15746 (= (tail!236 lt!75985) (t!1300 lt!75985))))

(assert (=> b!48927 d!15746))

(declare-fun d!15748 () Bool)

(declare-fun e!32908 () Bool)

(assert (=> d!15748 e!32908))

(declare-fun res!41750 () Bool)

(assert (=> d!15748 (=> (not res!41750) (not e!32908))))

(declare-fun lt!77603 () (_ BitVec 64))

(declare-fun lt!77601 () (_ BitVec 64))

(declare-fun lt!77599 () (_ BitVec 64))

(assert (=> d!15748 (= res!41750 (= lt!77603 (bvsub lt!77601 lt!77599)))))

(assert (=> d!15748 (or (= (bvand lt!77601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77601 lt!77599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15748 (= lt!77599 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75987))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75987)))))))

(declare-fun lt!77604 () (_ BitVec 64))

(declare-fun lt!77602 () (_ BitVec 64))

(assert (=> d!15748 (= lt!77601 (bvmul lt!77604 lt!77602))))

(assert (=> d!15748 (or (= lt!77604 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77602 (bvsdiv (bvmul lt!77604 lt!77602) lt!77604)))))

(assert (=> d!15748 (= lt!77602 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15748 (= lt!77604 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))))))

(assert (=> d!15748 (= lt!77603 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75987))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75987)))))))

(assert (=> d!15748 (invariant!0 (currentBit!2913 (_2!2399 lt!75987)) (currentByte!2918 (_2!2399 lt!75987)) (size!1049 (buf!1401 (_2!2399 lt!75987))))))

(assert (=> d!15748 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75987))) (currentByte!2918 (_2!2399 lt!75987)) (currentBit!2913 (_2!2399 lt!75987))) lt!77603)))

(declare-fun b!49875 () Bool)

(declare-fun res!41749 () Bool)

(assert (=> b!49875 (=> (not res!41749) (not e!32908))))

(assert (=> b!49875 (= res!41749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77603))))

(declare-fun b!49876 () Bool)

(declare-fun lt!77600 () (_ BitVec 64))

(assert (=> b!49876 (= e!32908 (bvsle lt!77603 (bvmul lt!77600 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49876 (or (= lt!77600 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77600 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77600)))))

(assert (=> b!49876 (= lt!77600 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))))))

(assert (= (and d!15748 res!41750) b!49875))

(assert (= (and b!49875 res!41749) b!49876))

(declare-fun m!78271 () Bool)

(assert (=> d!15748 m!78271))

(declare-fun m!78273 () Bool)

(assert (=> d!15748 m!78273))

(assert (=> b!48927 d!15748))

(declare-fun d!15750 () Bool)

(assert (=> d!15750 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75989) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) lt!75989))))

(declare-fun bs!3965 () Bool)

(assert (= bs!3965 d!15750))

(declare-fun m!78275 () Bool)

(assert (=> bs!3965 m!78275))

(assert (=> b!48927 d!15750))

(declare-fun b!49878 () Bool)

(declare-fun lt!77606 () (_ BitVec 64))

(declare-fun lt!77607 () tuple2!4614)

(declare-fun e!32910 () tuple2!4616)

(assert (=> b!49878 (= e!32910 (tuple2!4617 (Cons!546 (_1!2406 lt!77607) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_2!2406 lt!77607) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77606))) (_2!2406 lt!77607)))))

(assert (=> b!49878 (= lt!77607 (readBit!0 (_1!2400 lt!75970)))))

(assert (=> b!49878 (= lt!77606 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15752 () Bool)

(declare-fun e!32909 () Bool)

(assert (=> d!15752 e!32909))

(declare-fun c!3573 () Bool)

(assert (=> d!15752 (= c!3573 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77605 () List!550)

(assert (=> d!15752 (= lt!77605 (_1!2407 e!32910))))

(declare-fun c!3572 () Bool)

(assert (=> d!15752 (= c!3572 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15752 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15752 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75970) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77605)))

(declare-fun b!49879 () Bool)

(assert (=> b!49879 (= e!32909 (isEmpty!143 lt!77605))))

(declare-fun b!49880 () Bool)

(assert (=> b!49880 (= e!32909 (> (length!245 lt!77605) 0))))

(declare-fun b!49877 () Bool)

(assert (=> b!49877 (= e!32910 (tuple2!4617 Nil!547 (_1!2400 lt!75970)))))

(assert (= (and d!15752 c!3572) b!49877))

(assert (= (and d!15752 (not c!3572)) b!49878))

(assert (= (and d!15752 c!3573) b!49879))

(assert (= (and d!15752 (not c!3573)) b!49880))

(declare-fun m!78277 () Bool)

(assert (=> b!49878 m!78277))

(declare-fun m!78279 () Bool)

(assert (=> b!49878 m!78279))

(declare-fun m!78281 () Bool)

(assert (=> b!49879 m!78281))

(declare-fun m!78283 () Bool)

(assert (=> b!49880 m!78283))

(assert (=> b!48927 d!15752))

(declare-fun b!49881 () Bool)

(declare-fun e!32911 () Unit!3416)

(declare-fun lt!77613 () Unit!3416)

(assert (=> b!49881 (= e!32911 lt!77613)))

(declare-fun lt!77624 () (_ BitVec 64))

(assert (=> b!49881 (= lt!77624 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77610 () (_ BitVec 64))

(assert (=> b!49881 (= lt!77610 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> b!49881 (= lt!77613 (arrayBitRangesEqSymmetric!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!76012)) lt!77624 lt!77610))))

(assert (=> b!49881 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!76012)) (buf!1401 (_2!2399 lt!75747)) lt!77624 lt!77610)))

(declare-fun b!49882 () Bool)

(declare-fun Unit!3472 () Unit!3416)

(assert (=> b!49882 (= e!32911 Unit!3472)))

(declare-fun d!15754 () Bool)

(declare-fun e!32912 () Bool)

(assert (=> d!15754 e!32912))

(declare-fun res!41753 () Bool)

(assert (=> d!15754 (=> (not res!41753) (not e!32912))))

(declare-fun lt!77616 () tuple2!4602)

(assert (=> d!15754 (= res!41753 (isPrefixOf!0 (_1!2400 lt!77616) (_2!2400 lt!77616)))))

(declare-fun lt!77615 () BitStream!1818)

(assert (=> d!15754 (= lt!77616 (tuple2!4603 lt!77615 (_2!2399 lt!76012)))))

(declare-fun lt!77619 () Unit!3416)

(declare-fun lt!77609 () Unit!3416)

(assert (=> d!15754 (= lt!77619 lt!77609)))

(assert (=> d!15754 (isPrefixOf!0 lt!77615 (_2!2399 lt!76012))))

(assert (=> d!15754 (= lt!77609 (lemmaIsPrefixTransitive!0 lt!77615 (_2!2399 lt!76012) (_2!2399 lt!76012)))))

(declare-fun lt!77612 () Unit!3416)

(declare-fun lt!77626 () Unit!3416)

(assert (=> d!15754 (= lt!77612 lt!77626)))

(assert (=> d!15754 (isPrefixOf!0 lt!77615 (_2!2399 lt!76012))))

(assert (=> d!15754 (= lt!77626 (lemmaIsPrefixTransitive!0 lt!77615 (_2!2399 lt!75747) (_2!2399 lt!76012)))))

(declare-fun lt!77625 () Unit!3416)

(assert (=> d!15754 (= lt!77625 e!32911)))

(declare-fun c!3574 () Bool)

(assert (=> d!15754 (= c!3574 (not (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000)))))

(declare-fun lt!77614 () Unit!3416)

(declare-fun lt!77608 () Unit!3416)

(assert (=> d!15754 (= lt!77614 lt!77608)))

(assert (=> d!15754 (isPrefixOf!0 (_2!2399 lt!76012) (_2!2399 lt!76012))))

(assert (=> d!15754 (= lt!77608 (lemmaIsPrefixRefl!0 (_2!2399 lt!76012)))))

(declare-fun lt!77611 () Unit!3416)

(declare-fun lt!77622 () Unit!3416)

(assert (=> d!15754 (= lt!77611 lt!77622)))

(assert (=> d!15754 (= lt!77622 (lemmaIsPrefixRefl!0 (_2!2399 lt!76012)))))

(declare-fun lt!77620 () Unit!3416)

(declare-fun lt!77618 () Unit!3416)

(assert (=> d!15754 (= lt!77620 lt!77618)))

(assert (=> d!15754 (isPrefixOf!0 lt!77615 lt!77615)))

(assert (=> d!15754 (= lt!77618 (lemmaIsPrefixRefl!0 lt!77615))))

(declare-fun lt!77623 () Unit!3416)

(declare-fun lt!77627 () Unit!3416)

(assert (=> d!15754 (= lt!77623 lt!77627)))

(assert (=> d!15754 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(assert (=> d!15754 (= lt!77627 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(assert (=> d!15754 (= lt!77615 (BitStream!1819 (buf!1401 (_2!2399 lt!76012)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> d!15754 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!76012))))

(assert (=> d!15754 (= (reader!0 (_2!2399 lt!75747) (_2!2399 lt!76012)) lt!77616)))

(declare-fun b!49883 () Bool)

(declare-fun res!41752 () Bool)

(assert (=> b!49883 (=> (not res!41752) (not e!32912))))

(assert (=> b!49883 (= res!41752 (isPrefixOf!0 (_2!2400 lt!77616) (_2!2399 lt!76012)))))

(declare-fun b!49884 () Bool)

(declare-fun res!41751 () Bool)

(assert (=> b!49884 (=> (not res!41751) (not e!32912))))

(assert (=> b!49884 (= res!41751 (isPrefixOf!0 (_1!2400 lt!77616) (_2!2399 lt!75747)))))

(declare-fun lt!77617 () (_ BitVec 64))

(declare-fun lt!77621 () (_ BitVec 64))

(declare-fun b!49885 () Bool)

(assert (=> b!49885 (= e!32912 (= (_1!2400 lt!77616) (withMovedBitIndex!0 (_2!2400 lt!77616) (bvsub lt!77617 lt!77621))))))

(assert (=> b!49885 (or (= (bvand lt!77617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77617 lt!77621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49885 (= lt!77621 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012))))))

(assert (=> b!49885 (= lt!77617 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (= (and d!15754 c!3574) b!49881))

(assert (= (and d!15754 (not c!3574)) b!49882))

(assert (= (and d!15754 res!41753) b!49884))

(assert (= (and b!49884 res!41751) b!49883))

(assert (= (and b!49883 res!41752) b!49885))

(declare-fun m!78285 () Bool)

(assert (=> b!49883 m!78285))

(assert (=> b!49881 m!75915))

(declare-fun m!78287 () Bool)

(assert (=> b!49881 m!78287))

(declare-fun m!78289 () Bool)

(assert (=> b!49881 m!78289))

(declare-fun m!78291 () Bool)

(assert (=> b!49885 m!78291))

(assert (=> b!49885 m!76135))

(assert (=> b!49885 m!75915))

(declare-fun m!78293 () Bool)

(assert (=> b!49884 m!78293))

(declare-fun m!78295 () Bool)

(assert (=> d!15754 m!78295))

(declare-fun m!78297 () Bool)

(assert (=> d!15754 m!78297))

(declare-fun m!78299 () Bool)

(assert (=> d!15754 m!78299))

(declare-fun m!78301 () Bool)

(assert (=> d!15754 m!78301))

(declare-fun m!78303 () Bool)

(assert (=> d!15754 m!78303))

(assert (=> d!15754 m!76105))

(declare-fun m!78305 () Bool)

(assert (=> d!15754 m!78305))

(assert (=> d!15754 m!76103))

(declare-fun m!78307 () Bool)

(assert (=> d!15754 m!78307))

(declare-fun m!78309 () Bool)

(assert (=> d!15754 m!78309))

(declare-fun m!78311 () Bool)

(assert (=> d!15754 m!78311))

(assert (=> b!48927 d!15754))

(declare-fun d!15756 () Bool)

(assert (=> d!15756 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75989)))

(declare-fun lt!77628 () Unit!3416)

(assert (=> d!15756 (= lt!77628 (choose!9 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!76012)) lt!75989 (BitStream!1819 (buf!1401 (_2!2399 lt!76012)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (=> d!15756 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!76012)) lt!75989) lt!77628)))

(declare-fun bs!3966 () Bool)

(assert (= bs!3966 d!15756))

(assert (=> bs!3966 m!76129))

(declare-fun m!78313 () Bool)

(assert (=> bs!3966 m!78313))

(assert (=> b!48927 d!15756))

(declare-fun d!15758 () Bool)

(assert (=> d!15758 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!76004)))

(declare-fun lt!77629 () Unit!3416)

(assert (=> d!15758 (= lt!77629 (choose!9 (_2!2399 lt!76012) (buf!1401 (_2!2399 lt!75987)) lt!76004 (BitStream!1819 (buf!1401 (_2!2399 lt!75987)) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012)))))))

(assert (=> d!15758 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!76012) (buf!1401 (_2!2399 lt!75987)) lt!76004) lt!77629)))

(declare-fun bs!3967 () Bool)

(assert (= bs!3967 d!15758))

(assert (=> bs!3967 m!76155))

(declare-fun m!78315 () Bool)

(assert (=> bs!3967 m!78315))

(assert (=> b!48927 d!15758))

(declare-fun d!15760 () Bool)

(assert (=> d!15760 (= (head!369 (bitStreamReadBitsIntoList!0 (_2!2399 lt!76012) (_1!2400 lt!75973) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!665 (bitStreamReadBitsIntoList!0 (_2!2399 lt!76012) (_1!2400 lt!75973) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48927 d!15760))

(declare-fun d!15762 () Bool)

(declare-fun c!3575 () Bool)

(assert (=> d!15762 (= c!3575 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32913 () List!550)

(assert (=> d!15762 (= (byteArrayBitContentToList!0 (_2!2399 lt!75987) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!32913)))

(declare-fun b!49886 () Bool)

(assert (=> b!49886 (= e!32913 Nil!547)))

(declare-fun b!49887 () Bool)

(assert (=> b!49887 (= e!32913 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75987) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15762 c!3575) b!49886))

(assert (= (and d!15762 (not c!3575)) b!49887))

(declare-fun m!78317 () Bool)

(assert (=> b!49887 m!78317))

(declare-fun m!78319 () Bool)

(assert (=> b!49887 m!78319))

(declare-fun m!78321 () Bool)

(assert (=> b!49887 m!78321))

(assert (=> b!48927 d!15762))

(declare-fun b!49889 () Bool)

(declare-fun e!32915 () tuple2!4616)

(declare-fun lt!77631 () (_ BitVec 64))

(declare-fun lt!77632 () tuple2!4614)

(assert (=> b!49889 (= e!32915 (tuple2!4617 (Cons!546 (_1!2406 lt!77632) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_2!2406 lt!77632) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77631))) (_2!2406 lt!77632)))))

(assert (=> b!49889 (= lt!77632 (readBit!0 (_1!2400 lt!75981)))))

(assert (=> b!49889 (= lt!77631 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15764 () Bool)

(declare-fun e!32914 () Bool)

(assert (=> d!15764 e!32914))

(declare-fun c!3577 () Bool)

(assert (=> d!15764 (= c!3577 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77630 () List!550)

(assert (=> d!15764 (= lt!77630 (_1!2407 e!32915))))

(declare-fun c!3576 () Bool)

(assert (=> d!15764 (= c!3576 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15764 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15764 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75981) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77630)))

(declare-fun b!49890 () Bool)

(assert (=> b!49890 (= e!32914 (isEmpty!143 lt!77630))))

(declare-fun b!49891 () Bool)

(assert (=> b!49891 (= e!32914 (> (length!245 lt!77630) 0))))

(declare-fun b!49888 () Bool)

(assert (=> b!49888 (= e!32915 (tuple2!4617 Nil!547 (_1!2400 lt!75981)))))

(assert (= (and d!15764 c!3576) b!49888))

(assert (= (and d!15764 (not c!3576)) b!49889))

(assert (= (and d!15764 c!3577) b!49890))

(assert (= (and d!15764 (not c!3577)) b!49891))

(declare-fun m!78323 () Bool)

(assert (=> b!49889 m!78323))

(declare-fun m!78325 () Bool)

(assert (=> b!49889 m!78325))

(declare-fun m!78327 () Bool)

(assert (=> b!49890 m!78327))

(declare-fun m!78329 () Bool)

(assert (=> b!49891 m!78329))

(assert (=> b!48927 d!15764))

(declare-fun d!15766 () Bool)

(assert (=> d!15766 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75996)))

(declare-fun lt!77633 () Unit!3416)

(assert (=> d!15766 (= lt!77633 (choose!9 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75987)) lt!75996 (BitStream!1819 (buf!1401 (_2!2399 lt!75987)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (=> d!15766 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75987)) lt!75996) lt!77633)))

(declare-fun bs!3968 () Bool)

(assert (= bs!3968 d!15766))

(assert (=> bs!3968 m!76119))

(declare-fun m!78331 () Bool)

(assert (=> bs!3968 m!78331))

(assert (=> b!48927 d!15766))

(declare-fun d!15768 () Bool)

(assert (=> d!15768 (= (bitAt!0 (buf!1401 (_2!2399 lt!75987)) lt!75999) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_2!2399 lt!75987))) ((_ extract 31 0) (bvsdiv lt!75999 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75999 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3969 () Bool)

(assert (= bs!3969 d!15768))

(declare-fun m!78333 () Bool)

(assert (=> bs!3969 m!78333))

(declare-fun m!78335 () Bool)

(assert (=> bs!3969 m!78335))

(assert (=> b!48927 d!15768))

(declare-fun d!15770 () Bool)

(assert (=> d!15770 (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!665 (byteArrayBitContentToList!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48927 d!15770))

(assert (=> b!48927 d!14988))

(declare-fun d!15772 () Bool)

(assert (=> d!15772 (= (bitAt!0 (buf!1401 (_2!2399 lt!76012)) lt!75999) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_2!2399 lt!76012))) ((_ extract 31 0) (bvsdiv lt!75999 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75999 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3970 () Bool)

(assert (= bs!3970 d!15772))

(declare-fun m!78337 () Bool)

(assert (=> bs!3970 m!78337))

(assert (=> bs!3970 m!78335))

(assert (=> b!48927 d!15772))

(declare-fun d!15774 () Bool)

(declare-fun c!3578 () Bool)

(assert (=> d!15774 (= c!3578 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32916 () List!550)

(assert (=> d!15774 (= (byteArrayBitContentToList!0 (_2!2399 lt!75987) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32916)))

(declare-fun b!49892 () Bool)

(assert (=> b!49892 (= e!32916 Nil!547)))

(declare-fun b!49893 () Bool)

(assert (=> b!49893 (= e!32916 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75987) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15774 c!3578) b!49892))

(assert (= (and d!15774 (not c!3578)) b!49893))

(assert (=> b!49893 m!76125))

(declare-fun m!78339 () Bool)

(assert (=> b!49893 m!78339))

(assert (=> b!49893 m!76137))

(assert (=> b!48927 d!15774))

(declare-fun lt!77636 () tuple2!4614)

(declare-fun b!49895 () Bool)

(declare-fun lt!77635 () (_ BitVec 64))

(declare-fun e!32918 () tuple2!4616)

(assert (=> b!49895 (= e!32918 (tuple2!4617 (Cons!546 (_1!2406 lt!77636) (bitStreamReadBitsIntoList!0 (_2!2399 lt!76012) (_2!2406 lt!77636) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!77635))) (_2!2406 lt!77636)))))

(assert (=> b!49895 (= lt!77636 (readBit!0 (_1!2400 lt!75973)))))

(assert (=> b!49895 (= lt!77635 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15776 () Bool)

(declare-fun e!32917 () Bool)

(assert (=> d!15776 e!32917))

(declare-fun c!3580 () Bool)

(assert (=> d!15776 (= c!3580 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77634 () List!550)

(assert (=> d!15776 (= lt!77634 (_1!2407 e!32918))))

(declare-fun c!3579 () Bool)

(assert (=> d!15776 (= c!3579 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15776 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15776 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!76012) (_1!2400 lt!75973) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77634)))

(declare-fun b!49896 () Bool)

(assert (=> b!49896 (= e!32917 (isEmpty!143 lt!77634))))

(declare-fun b!49897 () Bool)

(assert (=> b!49897 (= e!32917 (> (length!245 lt!77634) 0))))

(declare-fun b!49894 () Bool)

(assert (=> b!49894 (= e!32918 (tuple2!4617 Nil!547 (_1!2400 lt!75973)))))

(assert (= (and d!15776 c!3579) b!49894))

(assert (= (and d!15776 (not c!3579)) b!49895))

(assert (= (and d!15776 c!3580) b!49896))

(assert (= (and d!15776 (not c!3580)) b!49897))

(declare-fun m!78341 () Bool)

(assert (=> b!49895 m!78341))

(declare-fun m!78343 () Bool)

(assert (=> b!49895 m!78343))

(declare-fun m!78345 () Bool)

(assert (=> b!49896 m!78345))

(declare-fun m!78347 () Bool)

(assert (=> b!49897 m!78347))

(assert (=> b!48927 d!15776))

(declare-fun b!49899 () Bool)

(declare-fun e!32920 () tuple2!4616)

(declare-fun lt!77639 () tuple2!4614)

(declare-fun lt!77638 () (_ BitVec 64))

(assert (=> b!49899 (= e!32920 (tuple2!4617 (Cons!546 (_1!2406 lt!77639) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_2!2406 lt!77639) (bvsub (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001) lt!77638))) (_2!2406 lt!77639)))))

(assert (=> b!49899 (= lt!77639 (readBit!0 (_1!2400 lt!75981)))))

(assert (=> b!49899 (= lt!77638 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15778 () Bool)

(declare-fun e!32919 () Bool)

(assert (=> d!15778 e!32919))

(declare-fun c!3582 () Bool)

(assert (=> d!15778 (= c!3582 (= (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77637 () List!550)

(assert (=> d!15778 (= lt!77637 (_1!2407 e!32920))))

(declare-fun c!3581 () Bool)

(assert (=> d!15778 (= c!3581 (= (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15778 (bvsge (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15778 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75981) (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77637)))

(declare-fun b!49900 () Bool)

(assert (=> b!49900 (= e!32919 (isEmpty!143 lt!77637))))

(declare-fun b!49901 () Bool)

(assert (=> b!49901 (= e!32919 (> (length!245 lt!77637) 0))))

(declare-fun b!49898 () Bool)

(assert (=> b!49898 (= e!32920 (tuple2!4617 Nil!547 (_1!2400 lt!75981)))))

(assert (= (and d!15778 c!3581) b!49898))

(assert (= (and d!15778 (not c!3581)) b!49899))

(assert (= (and d!15778 c!3582) b!49900))

(assert (= (and d!15778 (not c!3582)) b!49901))

(declare-fun m!78349 () Bool)

(assert (=> b!49899 m!78349))

(assert (=> b!49899 m!78325))

(declare-fun m!78351 () Bool)

(assert (=> b!49900 m!78351))

(declare-fun m!78353 () Bool)

(assert (=> b!49901 m!78353))

(assert (=> b!48927 d!15778))

(declare-fun d!15780 () Bool)

(assert (=> d!15780 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75996) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) lt!75996))))

(declare-fun bs!3971 () Bool)

(assert (= bs!3971 d!15780))

(declare-fun m!78355 () Bool)

(assert (=> bs!3971 m!78355))

(assert (=> b!48927 d!15780))

(declare-fun d!15782 () Bool)

(assert (=> d!15782 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75987))))

(declare-fun lt!77640 () Unit!3416)

(assert (=> d!15782 (= lt!77640 (choose!30 (_2!2399 lt!75747) (_2!2399 lt!76012) (_2!2399 lt!75987)))))

(assert (=> d!15782 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!76012))))

(assert (=> d!15782 (= (lemmaIsPrefixTransitive!0 (_2!2399 lt!75747) (_2!2399 lt!76012) (_2!2399 lt!75987)) lt!77640)))

(declare-fun bs!3972 () Bool)

(assert (= bs!3972 d!15782))

(assert (=> bs!3972 m!76123))

(declare-fun m!78357 () Bool)

(assert (=> bs!3972 m!78357))

(assert (=> bs!3972 m!78299))

(assert (=> b!48927 d!15782))

(declare-fun b!49902 () Bool)

(declare-fun res!41757 () Bool)

(declare-fun e!32924 () Bool)

(assert (=> b!49902 (=> (not res!41757) (not e!32924))))

(declare-fun lt!77652 () tuple2!4600)

(assert (=> b!49902 (= res!41757 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!77652)))))

(declare-fun b!49903 () Bool)

(declare-fun res!41754 () Bool)

(declare-fun e!32923 () Bool)

(assert (=> b!49903 (=> (not res!41754) (not e!32923))))

(declare-fun lt!77645 () tuple2!4600)

(assert (=> b!49903 (= res!41754 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!77645)))))

(declare-fun b!49904 () Bool)

(declare-fun res!41760 () Bool)

(assert (=> b!49904 (=> (not res!41760) (not e!32923))))

(declare-fun lt!77650 () (_ BitVec 64))

(declare-fun lt!77646 () (_ BitVec 64))

(assert (=> b!49904 (= res!41760 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77645))) (currentByte!2918 (_2!2399 lt!77645)) (currentBit!2913 (_2!2399 lt!77645))) (bvadd lt!77646 lt!77650)))))

(assert (=> b!49904 (or (not (= (bvand lt!77646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77650 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77646 lt!77650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49904 (= lt!77650 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49904 (= lt!77646 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(declare-fun b!49905 () Bool)

(declare-fun e!32921 () Bool)

(assert (=> b!49905 (= e!32924 e!32921)))

(declare-fun res!41761 () Bool)

(assert (=> b!49905 (=> (not res!41761) (not e!32921))))

(declare-fun lt!77642 () tuple2!4610)

(declare-fun lt!77644 () Bool)

(assert (=> b!49905 (= res!41761 (and (= (_2!2404 lt!77642) lt!77644) (= (_1!2404 lt!77642) (_2!2399 lt!77652))))))

(assert (=> b!49905 (= lt!77642 (readBitPure!0 (readerFrom!0 (_2!2399 lt!77652) (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747)))))))

(declare-fun b!49906 () Bool)

(declare-fun res!41759 () Bool)

(assert (=> b!49906 (=> (not res!41759) (not e!32924))))

(assert (=> b!49906 (= res!41759 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77652))) (currentByte!2918 (_2!2399 lt!77652)) (currentBit!2913 (_2!2399 lt!77652))) (bvadd (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49907 () Bool)

(declare-fun e!32922 () Bool)

(assert (=> b!49907 (= e!32923 e!32922)))

(declare-fun res!41755 () Bool)

(assert (=> b!49907 (=> (not res!41755) (not e!32922))))

(declare-fun lt!77647 () (_ BitVec 8))

(declare-fun lt!77649 () tuple2!4610)

(assert (=> b!49907 (= res!41755 (and (= (_2!2404 lt!77649) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!77647)) #b00000000000000000000000000000000))) (= (_1!2404 lt!77649) (_2!2399 lt!77645))))))

(declare-fun lt!77641 () tuple2!4608)

(declare-fun lt!77648 () BitStream!1818)

(assert (=> b!49907 (= lt!77641 (readBits!0 lt!77648 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!49907 (= lt!77649 (readBitPure!0 lt!77648))))

(assert (=> b!49907 (= lt!77648 (readerFrom!0 (_2!2399 lt!77645) (currentBit!2913 (_2!2399 lt!75747)) (currentByte!2918 (_2!2399 lt!75747))))))

(declare-fun d!15784 () Bool)

(assert (=> d!15784 e!32923))

(declare-fun res!41758 () Bool)

(assert (=> d!15784 (=> (not res!41758) (not e!32923))))

(assert (=> d!15784 (= res!41758 (= (size!1049 (buf!1401 (_2!2399 lt!77645))) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(declare-fun lt!77651 () array!2313)

(assert (=> d!15784 (= lt!77647 (select (arr!1575 lt!77651) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!15784 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1049 lt!77651)))))

(assert (=> d!15784 (= lt!77651 (array!2314 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!77643 () tuple2!4600)

(assert (=> d!15784 (= lt!77645 (tuple2!4601 (_1!2399 lt!77643) (_2!2399 lt!77643)))))

(assert (=> d!15784 (= lt!77643 lt!77652)))

(assert (=> d!15784 e!32924))

(declare-fun res!41756 () Bool)

(assert (=> d!15784 (=> (not res!41756) (not e!32924))))

(assert (=> d!15784 (= res!41756 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!77652)))))))

(assert (=> d!15784 (= lt!77652 (appendBit!0 (_2!2399 lt!75747) lt!77644))))

(assert (=> d!15784 (= lt!77644 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!15784 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!15784 (= (appendBitFromByte!0 (_2!2399 lt!75747) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!77645)))

(declare-fun b!49908 () Bool)

(assert (=> b!49908 (= e!32922 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!77649))) (currentByte!2918 (_1!2404 lt!77649)) (currentBit!2913 (_1!2404 lt!77649))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77645))) (currentByte!2918 (_2!2399 lt!77645)) (currentBit!2913 (_2!2399 lt!77645)))))))

(declare-fun b!49909 () Bool)

(assert (=> b!49909 (= e!32921 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!77642))) (currentByte!2918 (_1!2404 lt!77642)) (currentBit!2913 (_1!2404 lt!77642))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77652))) (currentByte!2918 (_2!2399 lt!77652)) (currentBit!2913 (_2!2399 lt!77652)))))))

(assert (= (and d!15784 res!41756) b!49906))

(assert (= (and b!49906 res!41759) b!49902))

(assert (= (and b!49902 res!41757) b!49905))

(assert (= (and b!49905 res!41761) b!49909))

(assert (= (and d!15784 res!41758) b!49904))

(assert (= (and b!49904 res!41760) b!49903))

(assert (= (and b!49903 res!41754) b!49907))

(assert (= (and b!49907 res!41755) b!49908))

(declare-fun m!78359 () Bool)

(assert (=> b!49909 m!78359))

(declare-fun m!78361 () Bool)

(assert (=> b!49909 m!78361))

(declare-fun m!78363 () Bool)

(assert (=> b!49908 m!78363))

(declare-fun m!78365 () Bool)

(assert (=> b!49908 m!78365))

(declare-fun m!78367 () Bool)

(assert (=> b!49903 m!78367))

(declare-fun m!78369 () Bool)

(assert (=> b!49907 m!78369))

(declare-fun m!78371 () Bool)

(assert (=> b!49907 m!78371))

(declare-fun m!78373 () Bool)

(assert (=> b!49907 m!78373))

(assert (=> b!49906 m!78361))

(assert (=> b!49906 m!75915))

(declare-fun m!78375 () Bool)

(assert (=> d!15784 m!78375))

(declare-fun m!78377 () Bool)

(assert (=> d!15784 m!78377))

(assert (=> d!15784 m!78339))

(declare-fun m!78379 () Bool)

(assert (=> b!49902 m!78379))

(assert (=> b!49904 m!78365))

(assert (=> b!49904 m!75915))

(declare-fun m!78381 () Bool)

(assert (=> b!49905 m!78381))

(assert (=> b!49905 m!78381))

(declare-fun m!78383 () Bool)

(assert (=> b!49905 m!78383))

(assert (=> b!48927 d!15784))

(declare-fun d!15786 () Bool)

(declare-fun c!3583 () Bool)

(assert (=> d!15786 (= c!3583 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32925 () List!550)

(assert (=> d!15786 (= (byteArrayBitContentToList!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!32925)))

(declare-fun b!49910 () Bool)

(assert (=> b!49910 (= e!32925 Nil!547)))

(declare-fun b!49911 () Bool)

(assert (=> b!49911 (= e!32925 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15786 c!3583) b!49910))

(assert (= (and d!15786 (not c!3583)) b!49911))

(assert (=> b!49911 m!76125))

(assert (=> b!49911 m!78339))

(declare-fun m!78385 () Bool)

(assert (=> b!49911 m!78385))

(assert (=> b!48927 d!15786))

(declare-fun d!15788 () Bool)

(assert (=> d!15788 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!76004) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75987)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012)))) lt!76004))))

(declare-fun bs!3973 () Bool)

(assert (= bs!3973 d!15788))

(declare-fun m!78387 () Bool)

(assert (=> bs!3973 m!78387))

(assert (=> b!48927 d!15788))

(declare-fun b!49912 () Bool)

(declare-fun e!32926 () Unit!3416)

(declare-fun lt!77658 () Unit!3416)

(assert (=> b!49912 (= e!32926 lt!77658)))

(declare-fun lt!77669 () (_ BitVec 64))

(assert (=> b!49912 (= lt!77669 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77655 () (_ BitVec 64))

(assert (=> b!49912 (= lt!77655 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> b!49912 (= lt!77658 (arrayBitRangesEqSymmetric!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75987)) lt!77669 lt!77655))))

(assert (=> b!49912 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75987)) (buf!1401 (_2!2399 lt!75747)) lt!77669 lt!77655)))

(declare-fun b!49913 () Bool)

(declare-fun Unit!3473 () Unit!3416)

(assert (=> b!49913 (= e!32926 Unit!3473)))

(declare-fun d!15790 () Bool)

(declare-fun e!32927 () Bool)

(assert (=> d!15790 e!32927))

(declare-fun res!41764 () Bool)

(assert (=> d!15790 (=> (not res!41764) (not e!32927))))

(declare-fun lt!77661 () tuple2!4602)

(assert (=> d!15790 (= res!41764 (isPrefixOf!0 (_1!2400 lt!77661) (_2!2400 lt!77661)))))

(declare-fun lt!77660 () BitStream!1818)

(assert (=> d!15790 (= lt!77661 (tuple2!4603 lt!77660 (_2!2399 lt!75987)))))

(declare-fun lt!77664 () Unit!3416)

(declare-fun lt!77654 () Unit!3416)

(assert (=> d!15790 (= lt!77664 lt!77654)))

(assert (=> d!15790 (isPrefixOf!0 lt!77660 (_2!2399 lt!75987))))

(assert (=> d!15790 (= lt!77654 (lemmaIsPrefixTransitive!0 lt!77660 (_2!2399 lt!75987) (_2!2399 lt!75987)))))

(declare-fun lt!77657 () Unit!3416)

(declare-fun lt!77671 () Unit!3416)

(assert (=> d!15790 (= lt!77657 lt!77671)))

(assert (=> d!15790 (isPrefixOf!0 lt!77660 (_2!2399 lt!75987))))

(assert (=> d!15790 (= lt!77671 (lemmaIsPrefixTransitive!0 lt!77660 (_2!2399 lt!75747) (_2!2399 lt!75987)))))

(declare-fun lt!77670 () Unit!3416)

(assert (=> d!15790 (= lt!77670 e!32926)))

(declare-fun c!3584 () Bool)

(assert (=> d!15790 (= c!3584 (not (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000)))))

(declare-fun lt!77659 () Unit!3416)

(declare-fun lt!77653 () Unit!3416)

(assert (=> d!15790 (= lt!77659 lt!77653)))

(assert (=> d!15790 (isPrefixOf!0 (_2!2399 lt!75987) (_2!2399 lt!75987))))

(assert (=> d!15790 (= lt!77653 (lemmaIsPrefixRefl!0 (_2!2399 lt!75987)))))

(declare-fun lt!77656 () Unit!3416)

(declare-fun lt!77667 () Unit!3416)

(assert (=> d!15790 (= lt!77656 lt!77667)))

(assert (=> d!15790 (= lt!77667 (lemmaIsPrefixRefl!0 (_2!2399 lt!75987)))))

(declare-fun lt!77665 () Unit!3416)

(declare-fun lt!77663 () Unit!3416)

(assert (=> d!15790 (= lt!77665 lt!77663)))

(assert (=> d!15790 (isPrefixOf!0 lt!77660 lt!77660)))

(assert (=> d!15790 (= lt!77663 (lemmaIsPrefixRefl!0 lt!77660))))

(declare-fun lt!77668 () Unit!3416)

(declare-fun lt!77672 () Unit!3416)

(assert (=> d!15790 (= lt!77668 lt!77672)))

(assert (=> d!15790 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(assert (=> d!15790 (= lt!77672 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(assert (=> d!15790 (= lt!77660 (BitStream!1819 (buf!1401 (_2!2399 lt!75987)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> d!15790 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75987))))

(assert (=> d!15790 (= (reader!0 (_2!2399 lt!75747) (_2!2399 lt!75987)) lt!77661)))

(declare-fun b!49914 () Bool)

(declare-fun res!41763 () Bool)

(assert (=> b!49914 (=> (not res!41763) (not e!32927))))

(assert (=> b!49914 (= res!41763 (isPrefixOf!0 (_2!2400 lt!77661) (_2!2399 lt!75987)))))

(declare-fun b!49915 () Bool)

(declare-fun res!41762 () Bool)

(assert (=> b!49915 (=> (not res!41762) (not e!32927))))

(assert (=> b!49915 (= res!41762 (isPrefixOf!0 (_1!2400 lt!77661) (_2!2399 lt!75747)))))

(declare-fun lt!77662 () (_ BitVec 64))

(declare-fun b!49916 () Bool)

(declare-fun lt!77666 () (_ BitVec 64))

(assert (=> b!49916 (= e!32927 (= (_1!2400 lt!77661) (withMovedBitIndex!0 (_2!2400 lt!77661) (bvsub lt!77662 lt!77666))))))

(assert (=> b!49916 (or (= (bvand lt!77662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77666 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77662 lt!77666) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49916 (= lt!77666 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75987))) (currentByte!2918 (_2!2399 lt!75987)) (currentBit!2913 (_2!2399 lt!75987))))))

(assert (=> b!49916 (= lt!77662 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (= (and d!15790 c!3584) b!49912))

(assert (= (and d!15790 (not c!3584)) b!49913))

(assert (= (and d!15790 res!41764) b!49915))

(assert (= (and b!49915 res!41762) b!49914))

(assert (= (and b!49914 res!41763) b!49916))

(declare-fun m!78389 () Bool)

(assert (=> b!49914 m!78389))

(assert (=> b!49912 m!75915))

(declare-fun m!78391 () Bool)

(assert (=> b!49912 m!78391))

(declare-fun m!78393 () Bool)

(assert (=> b!49912 m!78393))

(declare-fun m!78395 () Bool)

(assert (=> b!49916 m!78395))

(assert (=> b!49916 m!76163))

(assert (=> b!49916 m!75915))

(declare-fun m!78397 () Bool)

(assert (=> b!49915 m!78397))

(declare-fun m!78399 () Bool)

(assert (=> d!15790 m!78399))

(declare-fun m!78401 () Bool)

(assert (=> d!15790 m!78401))

(assert (=> d!15790 m!76123))

(declare-fun m!78403 () Bool)

(assert (=> d!15790 m!78403))

(declare-fun m!78405 () Bool)

(assert (=> d!15790 m!78405))

(assert (=> d!15790 m!76105))

(declare-fun m!78407 () Bool)

(assert (=> d!15790 m!78407))

(assert (=> d!15790 m!76103))

(declare-fun m!78409 () Bool)

(assert (=> d!15790 m!78409))

(declare-fun m!78411 () Bool)

(assert (=> d!15790 m!78411))

(declare-fun m!78413 () Bool)

(assert (=> d!15790 m!78413))

(assert (=> b!48927 d!15790))

(declare-fun d!15792 () Bool)

(declare-fun e!32928 () Bool)

(assert (=> d!15792 e!32928))

(declare-fun res!41765 () Bool)

(assert (=> d!15792 (=> (not res!41765) (not e!32928))))

(assert (=> d!15792 (= res!41765 (or (= (bvand lt!76006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76006 lt!75976) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77673 () Unit!3416)

(assert (=> d!15792 (= lt!77673 (choose!27 (_2!2399 lt!75747) (_2!2399 lt!76012) lt!76006 lt!75976))))

(assert (=> d!15792 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75976) (bvsle lt!75976 lt!76006))))

(assert (=> d!15792 (= (validateOffsetBitsIneqLemma!0 (_2!2399 lt!75747) (_2!2399 lt!76012) lt!76006 lt!75976) lt!77673)))

(declare-fun b!49917 () Bool)

(assert (=> b!49917 (= e!32928 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) (bvsub lt!76006 lt!75976)))))

(assert (= (and d!15792 res!41765) b!49917))

(declare-fun m!78415 () Bool)

(assert (=> d!15792 m!78415))

(assert (=> b!49917 m!76175))

(assert (=> b!48927 d!15792))

(declare-fun d!15794 () Bool)

(declare-fun e!32929 () Bool)

(assert (=> d!15794 e!32929))

(declare-fun res!41766 () Bool)

(assert (=> d!15794 (=> (not res!41766) (not e!32929))))

(declare-fun lt!77675 () (_ BitVec 64))

(assert (=> d!15794 (= res!41766 (or (= (bvand lt!75995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77675 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75995 lt!77675) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!15794 (= lt!77675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77674 () Unit!3416)

(assert (=> d!15794 (= lt!77674 (choose!42 (_2!2399 lt!75987) (_2!2399 lt!75987) (_1!2400 lt!75970) (_1!2400 lt!75981) lt!75995 lt!75985))))

(assert (=> d!15794 (bvsgt lt!75995 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15794 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2399 lt!75987) (_2!2399 lt!75987) (_1!2400 lt!75970) (_1!2400 lt!75981) lt!75995 lt!75985) lt!77674)))

(declare-fun b!49918 () Bool)

(assert (=> b!49918 (= e!32929 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75987) (_1!2400 lt!75981) (bvsub lt!75995 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!236 lt!75985)))))

(assert (= (and d!15794 res!41766) b!49918))

(declare-fun m!78417 () Bool)

(assert (=> d!15794 m!78417))

(assert (=> b!49918 m!76151))

(assert (=> b!49918 m!76131))

(assert (=> b!48927 d!15794))

(declare-fun b!49919 () Bool)

(declare-fun res!41771 () Bool)

(declare-fun e!32932 () Bool)

(assert (=> b!49919 (=> (not res!41771) (not e!32932))))

(declare-fun lt!77691 () tuple2!4600)

(assert (=> b!49919 (= res!41771 (invariant!0 (currentBit!2913 (_2!2399 lt!77691)) (currentByte!2918 (_2!2399 lt!77691)) (size!1049 (buf!1401 (_2!2399 lt!77691)))))))

(declare-fun b!49920 () Bool)

(declare-fun res!41767 () Bool)

(assert (=> b!49920 (=> (not res!41767) (not e!32932))))

(assert (=> b!49920 (= res!41767 (= (size!1049 (buf!1401 (_2!2399 lt!76012))) (size!1049 (buf!1401 (_2!2399 lt!77691)))))))

(declare-fun bm!637 () Bool)

(declare-fun lt!77719 () tuple2!4600)

(declare-fun call!640 () tuple2!4602)

(declare-fun lt!77694 () tuple2!4600)

(declare-fun c!3585 () Bool)

(assert (=> bm!637 (= call!640 (reader!0 (ite c!3585 (_2!2399 lt!77719) (_2!2399 lt!76012)) (ite c!3585 (_2!2399 lt!77694) (_2!2399 lt!76012))))))

(declare-fun b!49921 () Bool)

(declare-fun res!41770 () Bool)

(assert (=> b!49921 (=> (not res!41770) (not e!32932))))

(assert (=> b!49921 (= res!41770 (isPrefixOf!0 (_2!2399 lt!76012) (_2!2399 lt!77691)))))

(declare-fun b!49922 () Bool)

(declare-fun res!41772 () Bool)

(assert (=> b!49922 (=> (not res!41772) (not e!32932))))

(assert (=> b!49922 (= res!41772 (= (size!1049 (buf!1401 (_2!2399 lt!77691))) (size!1049 (buf!1401 (_2!2399 lt!76012)))))))

(declare-fun b!49923 () Bool)

(declare-fun e!32930 () tuple2!4600)

(declare-fun Unit!3474 () Unit!3416)

(assert (=> b!49923 (= e!32930 (tuple2!4601 Unit!3474 (_2!2399 lt!76012)))))

(assert (=> b!49923 (= (size!1049 (buf!1401 (_2!2399 lt!76012))) (size!1049 (buf!1401 (_2!2399 lt!76012))))))

(declare-fun lt!77681 () Unit!3416)

(declare-fun Unit!3475 () Unit!3416)

(assert (=> b!49923 (= lt!77681 Unit!3475)))

(assert (=> b!49923 (checkByteArrayBitContent!0 (_2!2399 lt!76012) srcBuffer!2 (_1!2403 (readBits!0 (_1!2400 call!640) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77676 () tuple2!4602)

(declare-fun b!49924 () Bool)

(assert (=> b!49924 (= e!32932 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!77691) (_1!2400 lt!77676) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!2399 lt!77691) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!49924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!77687 () Unit!3416)

(declare-fun lt!77678 () Unit!3416)

(assert (=> b!49924 (= lt!77687 lt!77678)))

(declare-fun lt!77690 () (_ BitVec 64))

(assert (=> b!49924 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!77691)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!77690)))

(assert (=> b!49924 (= lt!77678 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!76012) (buf!1401 (_2!2399 lt!77691)) lt!77690))))

(declare-fun e!32931 () Bool)

(assert (=> b!49924 e!32931))

(declare-fun res!41769 () Bool)

(assert (=> b!49924 (=> (not res!41769) (not e!32931))))

(assert (=> b!49924 (= res!41769 (and (= (size!1049 (buf!1401 (_2!2399 lt!76012))) (size!1049 (buf!1401 (_2!2399 lt!77691)))) (bvsge lt!77690 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49924 (= lt!77690 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!49924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49924 (= lt!77676 (reader!0 (_2!2399 lt!76012) (_2!2399 lt!77691)))))

(declare-fun b!49926 () Bool)

(assert (=> b!49926 (= e!32931 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76012)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!77690))))

(declare-fun b!49925 () Bool)

(declare-fun Unit!3476 () Unit!3416)

(assert (=> b!49925 (= e!32930 (tuple2!4601 Unit!3476 (_2!2399 lt!77694)))))

(assert (=> b!49925 (= lt!77719 (appendBitFromByte!0 (_2!2399 lt!76012) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!77713 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77713 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77683 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77683 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77700 () Unit!3416)

(assert (=> b!49925 (= lt!77700 (validateOffsetBitsIneqLemma!0 (_2!2399 lt!76012) (_2!2399 lt!77719) lt!77713 lt!77683))))

(assert (=> b!49925 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!77719)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!77719))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!77719))) (bvsub lt!77713 lt!77683))))

(declare-fun lt!77679 () Unit!3416)

(assert (=> b!49925 (= lt!77679 lt!77700)))

(declare-fun lt!77680 () tuple2!4602)

(assert (=> b!49925 (= lt!77680 (reader!0 (_2!2399 lt!76012) (_2!2399 lt!77719)))))

(declare-fun lt!77696 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77696 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77697 () Unit!3416)

(assert (=> b!49925 (= lt!77697 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!76012) (buf!1401 (_2!2399 lt!77719)) lt!77696))))

(assert (=> b!49925 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!77719)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!77696)))

(declare-fun lt!77705 () Unit!3416)

(assert (=> b!49925 (= lt!77705 lt!77697)))

(assert (=> b!49925 (= (head!369 (byteArrayBitContentToList!0 (_2!2399 lt!77719) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!369 (bitStreamReadBitsIntoList!0 (_2!2399 lt!77719) (_1!2400 lt!77680) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77714 () Unit!3416)

(declare-fun Unit!3477 () Unit!3416)

(assert (=> b!49925 (= lt!77714 Unit!3477)))

(assert (=> b!49925 (= lt!77694 (appendBitsMSBFirstLoop!0 (_2!2399 lt!77719) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!77689 () Unit!3416)

(assert (=> b!49925 (= lt!77689 (lemmaIsPrefixTransitive!0 (_2!2399 lt!76012) (_2!2399 lt!77719) (_2!2399 lt!77694)))))

(assert (=> b!49925 (isPrefixOf!0 (_2!2399 lt!76012) (_2!2399 lt!77694))))

(declare-fun lt!77717 () Unit!3416)

(assert (=> b!49925 (= lt!77717 lt!77689)))

(assert (=> b!49925 (= (size!1049 (buf!1401 (_2!2399 lt!77694))) (size!1049 (buf!1401 (_2!2399 lt!76012))))))

(declare-fun lt!77718 () Unit!3416)

(declare-fun Unit!3478 () Unit!3416)

(assert (=> b!49925 (= lt!77718 Unit!3478)))

(assert (=> b!49925 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77694))) (currentByte!2918 (_2!2399 lt!77694)) (currentBit!2913 (_2!2399 lt!77694))) (bvsub (bvadd (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77698 () Unit!3416)

(declare-fun Unit!3479 () Unit!3416)

(assert (=> b!49925 (= lt!77698 Unit!3479)))

(assert (=> b!49925 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77694))) (currentByte!2918 (_2!2399 lt!77694)) (currentBit!2913 (_2!2399 lt!77694))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77719))) (currentByte!2918 (_2!2399 lt!77719)) (currentBit!2913 (_2!2399 lt!77719))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77701 () Unit!3416)

(declare-fun Unit!3480 () Unit!3416)

(assert (=> b!49925 (= lt!77701 Unit!3480)))

(declare-fun lt!77677 () tuple2!4602)

(assert (=> b!49925 (= lt!77677 (reader!0 (_2!2399 lt!76012) (_2!2399 lt!77694)))))

(declare-fun lt!77703 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77703 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77712 () Unit!3416)

(assert (=> b!49925 (= lt!77712 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!76012) (buf!1401 (_2!2399 lt!77694)) lt!77703))))

(assert (=> b!49925 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!77694)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76012))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76012))) lt!77703)))

(declare-fun lt!77707 () Unit!3416)

(assert (=> b!49925 (= lt!77707 lt!77712)))

(declare-fun lt!77688 () tuple2!4602)

(assert (=> b!49925 (= lt!77688 call!640)))

(declare-fun lt!77711 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77711 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77682 () Unit!3416)

(assert (=> b!49925 (= lt!77682 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!77719) (buf!1401 (_2!2399 lt!77694)) lt!77711))))

(assert (=> b!49925 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!77694)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!77719))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!77719))) lt!77711)))

(declare-fun lt!77684 () Unit!3416)

(assert (=> b!49925 (= lt!77684 lt!77682)))

(declare-fun lt!77715 () List!550)

(assert (=> b!49925 (= lt!77715 (byteArrayBitContentToList!0 (_2!2399 lt!77694) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!77709 () List!550)

(assert (=> b!49925 (= lt!77709 (byteArrayBitContentToList!0 (_2!2399 lt!77694) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77692 () List!550)

(assert (=> b!49925 (= lt!77692 (bitStreamReadBitsIntoList!0 (_2!2399 lt!77694) (_1!2400 lt!77677) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!77686 () List!550)

(assert (=> b!49925 (= lt!77686 (bitStreamReadBitsIntoList!0 (_2!2399 lt!77694) (_1!2400 lt!77688) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77702 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77702 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77693 () Unit!3416)

(assert (=> b!49925 (= lt!77693 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2399 lt!77694) (_2!2399 lt!77694) (_1!2400 lt!77677) (_1!2400 lt!77688) lt!77702 lt!77692))))

(assert (=> b!49925 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!77694) (_1!2400 lt!77688) (bvsub lt!77702 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!236 lt!77692))))

(declare-fun lt!77708 () Unit!3416)

(assert (=> b!49925 (= lt!77708 lt!77693)))

(declare-fun lt!77695 () Unit!3416)

(declare-fun lt!77706 () (_ BitVec 64))

(assert (=> b!49925 (= lt!77695 (arrayBitRangesEqImpliesEq!0 (buf!1401 (_2!2399 lt!77719)) (buf!1401 (_2!2399 lt!77694)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!77706 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77719))) (currentByte!2918 (_2!2399 lt!77719)) (currentBit!2913 (_2!2399 lt!77719)))))))

(assert (=> b!49925 (= (bitAt!0 (buf!1401 (_2!2399 lt!77719)) lt!77706) (bitAt!0 (buf!1401 (_2!2399 lt!77694)) lt!77706))))

(declare-fun lt!77716 () Unit!3416)

(assert (=> b!49925 (= lt!77716 lt!77695)))

(declare-fun d!15796 () Bool)

(assert (=> d!15796 e!32932))

(declare-fun res!41768 () Bool)

(assert (=> d!15796 (=> (not res!41768) (not e!32932))))

(declare-fun lt!77710 () (_ BitVec 64))

(assert (=> d!15796 (= res!41768 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77691))) (currentByte!2918 (_2!2399 lt!77691)) (currentBit!2913 (_2!2399 lt!77691))) (bvsub lt!77710 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!15796 (or (= (bvand lt!77710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77710 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!77699 () (_ BitVec 64))

(assert (=> d!15796 (= lt!77710 (bvadd lt!77699 to!314))))

(assert (=> d!15796 (or (not (= (bvand lt!77699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77699 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15796 (= lt!77699 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012))))))

(assert (=> d!15796 (= lt!77691 e!32930)))

(assert (=> d!15796 (= c!3585 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!77685 () Unit!3416)

(declare-fun lt!77704 () Unit!3416)

(assert (=> d!15796 (= lt!77685 lt!77704)))

(assert (=> d!15796 (isPrefixOf!0 (_2!2399 lt!76012) (_2!2399 lt!76012))))

(assert (=> d!15796 (= lt!77704 (lemmaIsPrefixRefl!0 (_2!2399 lt!76012)))))

(assert (=> d!15796 (= lt!77706 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76012))) (currentByte!2918 (_2!2399 lt!76012)) (currentBit!2913 (_2!2399 lt!76012))))))

(assert (=> d!15796 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15796 (= (appendBitsMSBFirstLoop!0 (_2!2399 lt!76012) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!77691)))

(assert (= (and d!15796 c!3585) b!49925))

(assert (= (and d!15796 (not c!3585)) b!49923))

(assert (= (or b!49925 b!49923) bm!637))

(assert (= (and d!15796 res!41768) b!49919))

(assert (= (and b!49919 res!41771) b!49920))

(assert (= (and b!49920 res!41767) b!49921))

(assert (= (and b!49921 res!41770) b!49922))

(assert (= (and b!49922 res!41772) b!49924))

(assert (= (and b!49924 res!41769) b!49926))

(declare-fun m!78419 () Bool)

(assert (=> d!15796 m!78419))

(assert (=> d!15796 m!76135))

(assert (=> d!15796 m!78309))

(assert (=> d!15796 m!78311))

(declare-fun m!78421 () Bool)

(assert (=> b!49919 m!78421))

(declare-fun m!78423 () Bool)

(assert (=> b!49923 m!78423))

(declare-fun m!78425 () Bool)

(assert (=> b!49923 m!78425))

(declare-fun m!78427 () Bool)

(assert (=> bm!637 m!78427))

(assert (=> b!49925 m!76135))

(declare-fun m!78429 () Bool)

(assert (=> b!49925 m!78429))

(declare-fun m!78431 () Bool)

(assert (=> b!49925 m!78431))

(declare-fun m!78433 () Bool)

(assert (=> b!49925 m!78433))

(declare-fun m!78435 () Bool)

(assert (=> b!49925 m!78435))

(declare-fun m!78437 () Bool)

(assert (=> b!49925 m!78437))

(assert (=> b!49925 m!78317))

(declare-fun m!78439 () Bool)

(assert (=> b!49925 m!78439))

(declare-fun m!78441 () Bool)

(assert (=> b!49925 m!78441))

(declare-fun m!78443 () Bool)

(assert (=> b!49925 m!78443))

(declare-fun m!78445 () Bool)

(assert (=> b!49925 m!78445))

(declare-fun m!78447 () Bool)

(assert (=> b!49925 m!78447))

(declare-fun m!78449 () Bool)

(assert (=> b!49925 m!78449))

(assert (=> b!49925 m!78447))

(declare-fun m!78451 () Bool)

(assert (=> b!49925 m!78451))

(declare-fun m!78453 () Bool)

(assert (=> b!49925 m!78453))

(declare-fun m!78455 () Bool)

(assert (=> b!49925 m!78455))

(declare-fun m!78457 () Bool)

(assert (=> b!49925 m!78457))

(declare-fun m!78459 () Bool)

(assert (=> b!49925 m!78459))

(declare-fun m!78461 () Bool)

(assert (=> b!49925 m!78461))

(declare-fun m!78463 () Bool)

(assert (=> b!49925 m!78463))

(declare-fun m!78465 () Bool)

(assert (=> b!49925 m!78465))

(assert (=> b!49925 m!78317))

(declare-fun m!78467 () Bool)

(assert (=> b!49925 m!78467))

(declare-fun m!78469 () Bool)

(assert (=> b!49925 m!78469))

(declare-fun m!78471 () Bool)

(assert (=> b!49925 m!78471))

(assert (=> b!49925 m!78435))

(declare-fun m!78473 () Bool)

(assert (=> b!49925 m!78473))

(declare-fun m!78475 () Bool)

(assert (=> b!49925 m!78475))

(declare-fun m!78477 () Bool)

(assert (=> b!49925 m!78477))

(declare-fun m!78479 () Bool)

(assert (=> b!49925 m!78479))

(declare-fun m!78481 () Bool)

(assert (=> b!49925 m!78481))

(declare-fun m!78483 () Bool)

(assert (=> b!49925 m!78483))

(declare-fun m!78485 () Bool)

(assert (=> b!49925 m!78485))

(assert (=> b!49925 m!78457))

(declare-fun m!78487 () Bool)

(assert (=> b!49925 m!78487))

(declare-fun m!78489 () Bool)

(assert (=> b!49926 m!78489))

(declare-fun m!78491 () Bool)

(assert (=> b!49921 m!78491))

(declare-fun m!78493 () Bool)

(assert (=> b!49924 m!78493))

(declare-fun m!78495 () Bool)

(assert (=> b!49924 m!78495))

(declare-fun m!78497 () Bool)

(assert (=> b!49924 m!78497))

(declare-fun m!78499 () Bool)

(assert (=> b!49924 m!78499))

(declare-fun m!78501 () Bool)

(assert (=> b!49924 m!78501))

(assert (=> b!48927 d!15796))

(declare-fun d!15798 () Bool)

(declare-fun res!41777 () Bool)

(declare-fun e!32937 () Bool)

(assert (=> d!15798 (=> res!41777 e!32937)))

(assert (=> d!15798 (= res!41777 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15798 (= (checkByteArrayBitContent!0 (_2!2399 lt!75747) srcBuffer!2 (_1!2403 (readBits!0 (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32937)))

(declare-fun b!49931 () Bool)

(declare-fun e!32938 () Bool)

(assert (=> b!49931 (= e!32937 e!32938)))

(declare-fun res!41778 () Bool)

(assert (=> b!49931 (=> (not res!41778) (not e!32938))))

(assert (=> b!49931 (= res!41778 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (_1!2403 (readBits!0 (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!49932 () Bool)

(assert (=> b!49932 (= e!32938 (checkByteArrayBitContent!0 (_2!2399 lt!75747) srcBuffer!2 (_1!2403 (readBits!0 (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!15798 (not res!41777)) b!49931))

(assert (= (and b!49931 res!41778) b!49932))

(assert (=> b!49931 m!76125))

(assert (=> b!49931 m!78339))

(declare-fun m!78503 () Bool)

(assert (=> b!49931 m!78503))

(declare-fun m!78505 () Bool)

(assert (=> b!49931 m!78505))

(declare-fun m!78507 () Bool)

(assert (=> b!49932 m!78507))

(assert (=> b!48925 d!15798))

(declare-fun b!49933 () Bool)

(declare-fun res!41779 () Bool)

(declare-fun e!32939 () Bool)

(assert (=> b!49933 (=> (not res!41779) (not e!32939))))

(declare-fun lt!77724 () tuple2!4608)

(assert (=> b!49933 (= res!41779 (invariant!0 (currentBit!2913 (_2!2403 lt!77724)) (currentByte!2918 (_2!2403 lt!77724)) (size!1049 (buf!1401 (_2!2403 lt!77724)))))))

(declare-fun b!49934 () Bool)

(assert (=> b!49934 (= e!32939 (= (byteArrayBitContentToList!0 (_2!2403 lt!77724) (_1!2403 lt!77724) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!2403 lt!77724) (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(declare-fun b!49935 () Bool)

(declare-fun res!41782 () Bool)

(assert (=> b!49935 (=> (not res!41782) (not e!32939))))

(declare-fun lt!77725 () (_ BitVec 64))

(assert (=> b!49935 (= res!41782 (= (size!1049 (_1!2403 lt!77724)) ((_ extract 31 0) lt!77725)))))

(assert (=> b!49935 (and (bvslt lt!77725 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!77725 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!77728 () (_ BitVec 64))

(declare-fun lt!77722 () (_ BitVec 64))

(assert (=> b!49935 (= lt!77725 (bvsdiv lt!77728 lt!77722))))

(assert (=> b!49935 (and (not (= lt!77722 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!77728 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77722 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!49935 (= lt!77722 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!77721 () (_ BitVec 64))

(declare-fun lt!77723 () (_ BitVec 64))

(assert (=> b!49935 (= lt!77728 (bvsub lt!77721 lt!77723))))

(assert (=> b!49935 (or (= (bvand lt!77721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77721 lt!77723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49935 (= lt!77723 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77727 () (_ BitVec 64))

(assert (=> b!49935 (= lt!77721 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77727))))

(assert (=> b!49935 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77727 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77727) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49935 (= lt!77727 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!15800 () Bool)

(assert (=> d!15800 e!32939))

(declare-fun res!41781 () Bool)

(assert (=> d!15800 (=> (not res!41781) (not e!32939))))

(assert (=> d!15800 (= res!41781 (= (buf!1401 (_2!2403 lt!77724)) (buf!1401 (_1!2400 call!613))))))

(declare-fun lt!77720 () tuple3!182)

(assert (=> d!15800 (= lt!77724 (tuple2!4609 (_3!103 lt!77720) (_2!2419 lt!77720)))))

(assert (=> d!15800 (= lt!77720 (readBitsLoop!0 (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!2314 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!15800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!15800 (= (readBits!0 (_1!2400 call!613) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77724)))

(declare-fun b!49936 () Bool)

(declare-fun res!41783 () Bool)

(assert (=> b!49936 (=> (not res!41783) (not e!32939))))

(assert (=> b!49936 (= res!41783 (bvsle (currentByte!2918 (_1!2400 call!613)) (currentByte!2918 (_2!2403 lt!77724))))))

(declare-fun b!49937 () Bool)

(declare-fun res!41780 () Bool)

(assert (=> b!49937 (=> (not res!41780) (not e!32939))))

(declare-fun lt!77726 () (_ BitVec 64))

(assert (=> b!49937 (= res!41780 (= (bvadd lt!77726 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!1049 (buf!1401 (_2!2403 lt!77724))) (currentByte!2918 (_2!2403 lt!77724)) (currentBit!2913 (_2!2403 lt!77724)))))))

(assert (=> b!49937 (or (not (= (bvand lt!77726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77726 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49937 (= lt!77726 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 call!613))) (currentByte!2918 (_1!2400 call!613)) (currentBit!2913 (_1!2400 call!613))))))

(assert (= (and d!15800 res!41781) b!49937))

(assert (= (and b!49937 res!41780) b!49933))

(assert (= (and b!49933 res!41779) b!49935))

(assert (= (and b!49935 res!41782) b!49936))

(assert (= (and b!49936 res!41783) b!49934))

(declare-fun m!78509 () Bool)

(assert (=> b!49933 m!78509))

(declare-fun m!78511 () Bool)

(assert (=> b!49934 m!78511))

(declare-fun m!78513 () Bool)

(assert (=> b!49934 m!78513))

(declare-fun m!78515 () Bool)

(assert (=> d!15800 m!78515))

(declare-fun m!78517 () Bool)

(assert (=> b!49937 m!78517))

(declare-fun m!78519 () Bool)

(assert (=> b!49937 m!78519))

(assert (=> b!48925 d!15800))

(declare-fun lt!77731 () tuple2!4614)

(declare-fun lt!77730 () (_ BitVec 64))

(declare-fun e!32941 () tuple2!4616)

(declare-fun b!49939 () Bool)

(assert (=> b!49939 (= e!32941 (tuple2!4617 (Cons!546 (_1!2406 lt!77731) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_2!2406 lt!77731) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76533) lt!77730))) (_2!2406 lt!77731)))))

(assert (=> b!49939 (= lt!77731 (readBit!0 (_2!2406 lt!76534)))))

(assert (=> b!49939 (= lt!77730 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15802 () Bool)

(declare-fun e!32940 () Bool)

(assert (=> d!15802 e!32940))

(declare-fun c!3587 () Bool)

(assert (=> d!15802 (= c!3587 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77729 () List!550)

(assert (=> d!15802 (= lt!77729 (_1!2407 e!32941))))

(declare-fun c!3586 () Bool)

(assert (=> d!15802 (= c!3586 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76533) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15802 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76533) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15802 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75747) (_2!2406 lt!76534) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76533)) lt!77729)))

(declare-fun b!49940 () Bool)

(assert (=> b!49940 (= e!32940 (isEmpty!143 lt!77729))))

(declare-fun b!49941 () Bool)

(assert (=> b!49941 (= e!32940 (> (length!245 lt!77729) 0))))

(declare-fun b!49938 () Bool)

(assert (=> b!49938 (= e!32941 (tuple2!4617 Nil!547 (_2!2406 lt!76534)))))

(assert (= (and d!15802 c!3586) b!49938))

(assert (= (and d!15802 (not c!3586)) b!49939))

(assert (= (and d!15802 c!3587) b!49940))

(assert (= (and d!15802 (not c!3587)) b!49941))

(declare-fun m!78521 () Bool)

(assert (=> b!49939 m!78521))

(declare-fun m!78523 () Bool)

(assert (=> b!49939 m!78523))

(declare-fun m!78525 () Bool)

(assert (=> b!49940 m!78525))

(declare-fun m!78527 () Bool)

(assert (=> b!49941 m!78527))

(assert (=> b!49131 d!15802))

(declare-fun d!15804 () Bool)

(declare-fun e!32948 () Bool)

(assert (=> d!15804 e!32948))

(declare-fun res!41786 () Bool)

(assert (=> d!15804 (=> (not res!41786) (not e!32948))))

(declare-fun increaseBitIndex!0 (BitStream!1818) tuple2!4600)

(assert (=> d!15804 (= res!41786 (= (buf!1401 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75745)))) (buf!1401 (_1!2400 lt!75745))))))

(declare-fun lt!77746 () Bool)

(assert (=> d!15804 (= lt!77746 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75745))) (currentByte!2918 (_1!2400 lt!75745)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75745))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77750 () tuple2!4614)

(assert (=> d!15804 (= lt!77750 (tuple2!4615 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75745))) (currentByte!2918 (_1!2400 lt!75745)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75745))))) #b00000000000000000000000000000000)) (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75745)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!15804 (validate_offset_bit!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2400 lt!75745)))) ((_ sign_extend 32) (currentByte!2918 (_1!2400 lt!75745))) ((_ sign_extend 32) (currentBit!2913 (_1!2400 lt!75745))))))

(assert (=> d!15804 (= (readBit!0 (_1!2400 lt!75745)) lt!77750)))

(declare-fun lt!77747 () (_ BitVec 64))

(declare-fun lt!77749 () (_ BitVec 64))

(declare-fun b!49944 () Bool)

(assert (=> b!49944 (= e!32948 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75745))))) (currentByte!2918 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75745)))) (currentBit!2913 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75745))))) (bvadd lt!77747 lt!77749)))))

(assert (=> b!49944 (or (not (= (bvand lt!77747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77749 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77747 lt!77749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49944 (= lt!77749 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49944 (= lt!77747 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!75745))) (currentByte!2918 (_1!2400 lt!75745)) (currentBit!2913 (_1!2400 lt!75745))))))

(declare-fun lt!77752 () Bool)

(assert (=> b!49944 (= lt!77752 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75745))) (currentByte!2918 (_1!2400 lt!75745)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75745))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77748 () Bool)

(assert (=> b!49944 (= lt!77748 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75745))) (currentByte!2918 (_1!2400 lt!75745)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75745))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77751 () Bool)

(assert (=> b!49944 (= lt!77751 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75745))) (currentByte!2918 (_1!2400 lt!75745)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75745))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15804 res!41786) b!49944))

(declare-fun m!78529 () Bool)

(assert (=> d!15804 m!78529))

(declare-fun m!78531 () Bool)

(assert (=> d!15804 m!78531))

(declare-fun m!78533 () Bool)

(assert (=> d!15804 m!78533))

(declare-fun m!78535 () Bool)

(assert (=> d!15804 m!78535))

(assert (=> b!49944 m!78533))

(declare-fun m!78537 () Bool)

(assert (=> b!49944 m!78537))

(assert (=> b!49944 m!78531))

(assert (=> b!49944 m!78529))

(declare-fun m!78539 () Bool)

(assert (=> b!49944 m!78539))

(assert (=> b!49131 d!15804))

(declare-fun d!15806 () Bool)

(declare-fun res!41789 () Bool)

(declare-fun e!32950 () Bool)

(assert (=> d!15806 (=> (not res!41789) (not e!32950))))

(assert (=> d!15806 (= res!41789 (= (size!1049 (buf!1401 (_1!2400 lt!76061))) (size!1049 (buf!1401 thiss!1379))))))

(assert (=> d!15806 (= (isPrefixOf!0 (_1!2400 lt!76061) thiss!1379) e!32950)))

(declare-fun b!49945 () Bool)

(declare-fun res!41788 () Bool)

(assert (=> b!49945 (=> (not res!41788) (not e!32950))))

(assert (=> b!49945 (= res!41788 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76061))) (currentByte!2918 (_1!2400 lt!76061)) (currentBit!2913 (_1!2400 lt!76061))) (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(declare-fun b!49946 () Bool)

(declare-fun e!32949 () Bool)

(assert (=> b!49946 (= e!32950 e!32949)))

(declare-fun res!41787 () Bool)

(assert (=> b!49946 (=> res!41787 e!32949)))

(assert (=> b!49946 (= res!41787 (= (size!1049 (buf!1401 (_1!2400 lt!76061))) #b00000000000000000000000000000000))))

(declare-fun b!49947 () Bool)

(assert (=> b!49947 (= e!32949 (arrayBitRangesEq!0 (buf!1401 (_1!2400 lt!76061)) (buf!1401 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76061))) (currentByte!2918 (_1!2400 lt!76061)) (currentBit!2913 (_1!2400 lt!76061)))))))

(assert (= (and d!15806 res!41789) b!49945))

(assert (= (and b!49945 res!41788) b!49946))

(assert (= (and b!49946 (not res!41787)) b!49947))

(declare-fun m!78541 () Bool)

(assert (=> b!49945 m!78541))

(assert (=> b!49945 m!75897))

(assert (=> b!49947 m!78541))

(assert (=> b!49947 m!78541))

(declare-fun m!78543 () Bool)

(assert (=> b!49947 m!78543))

(assert (=> b!48942 d!15806))

(declare-fun d!15808 () Bool)

(declare-fun e!32951 () Bool)

(assert (=> d!15808 e!32951))

(declare-fun res!41790 () Bool)

(assert (=> d!15808 (=> (not res!41790) (not e!32951))))

(declare-fun lt!77754 () (_ BitVec 64))

(declare-fun lt!77753 () BitStream!1818)

(assert (=> d!15808 (= res!41790 (= (bvadd lt!77754 (bvsub lt!76446 lt!76450)) (bitIndex!0 (size!1049 (buf!1401 lt!77753)) (currentByte!2918 lt!77753) (currentBit!2913 lt!77753))))))

(assert (=> d!15808 (or (not (= (bvand lt!77754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76446 lt!76450) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77754 (bvsub lt!76446 lt!76450)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15808 (= lt!77754 (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76445))) (currentByte!2918 (_2!2400 lt!76445)) (currentBit!2913 (_2!2400 lt!76445))))))

(assert (=> d!15808 (= lt!77753 (_2!2399 (moveBitIndex!0 (_2!2400 lt!76445) (bvsub lt!76446 lt!76450))))))

(assert (=> d!15808 (moveBitIndexPrecond!0 (_2!2400 lt!76445) (bvsub lt!76446 lt!76450))))

(assert (=> d!15808 (= (withMovedBitIndex!0 (_2!2400 lt!76445) (bvsub lt!76446 lt!76450)) lt!77753)))

(declare-fun b!49948 () Bool)

(assert (=> b!49948 (= e!32951 (= (size!1049 (buf!1401 (_2!2400 lt!76445))) (size!1049 (buf!1401 lt!77753))))))

(assert (= (and d!15808 res!41790) b!49948))

(declare-fun m!78545 () Bool)

(assert (=> d!15808 m!78545))

(declare-fun m!78547 () Bool)

(assert (=> d!15808 m!78547))

(declare-fun m!78549 () Bool)

(assert (=> d!15808 m!78549))

(declare-fun m!78551 () Bool)

(assert (=> d!15808 m!78551))

(assert (=> b!49070 d!15808))

(assert (=> b!49070 d!14940))

(assert (=> b!49070 d!14988))

(assert (=> d!15044 d!14978))

(declare-fun d!15810 () Bool)

(assert (=> d!15810 (isPrefixOf!0 lt!76417 lt!76417)))

(declare-fun lt!77755 () Unit!3416)

(assert (=> d!15810 (= lt!77755 (choose!11 lt!76417))))

(assert (=> d!15810 (= (lemmaIsPrefixRefl!0 lt!76417) lt!77755)))

(declare-fun bs!3974 () Bool)

(assert (= bs!3974 d!15810))

(assert (=> bs!3974 m!76437))

(declare-fun m!78553 () Bool)

(assert (=> bs!3974 m!78553))

(assert (=> d!15044 d!15810))

(declare-fun d!15812 () Bool)

(declare-fun res!41793 () Bool)

(declare-fun e!32953 () Bool)

(assert (=> d!15812 (=> (not res!41793) (not e!32953))))

(assert (=> d!15812 (= res!41793 (= (size!1049 (buf!1401 (_1!2400 lt!76418))) (size!1049 (buf!1401 (_2!2400 lt!76418)))))))

(assert (=> d!15812 (= (isPrefixOf!0 (_1!2400 lt!76418) (_2!2400 lt!76418)) e!32953)))

(declare-fun b!49949 () Bool)

(declare-fun res!41792 () Bool)

(assert (=> b!49949 (=> (not res!41792) (not e!32953))))

(assert (=> b!49949 (= res!41792 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76418))) (currentByte!2918 (_1!2400 lt!76418)) (currentBit!2913 (_1!2400 lt!76418))) (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76418))) (currentByte!2918 (_2!2400 lt!76418)) (currentBit!2913 (_2!2400 lt!76418)))))))

(declare-fun b!49950 () Bool)

(declare-fun e!32952 () Bool)

(assert (=> b!49950 (= e!32953 e!32952)))

(declare-fun res!41791 () Bool)

(assert (=> b!49950 (=> res!41791 e!32952)))

(assert (=> b!49950 (= res!41791 (= (size!1049 (buf!1401 (_1!2400 lt!76418))) #b00000000000000000000000000000000))))

(declare-fun b!49951 () Bool)

(assert (=> b!49951 (= e!32952 (arrayBitRangesEq!0 (buf!1401 (_1!2400 lt!76418)) (buf!1401 (_2!2400 lt!76418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76418))) (currentByte!2918 (_1!2400 lt!76418)) (currentBit!2913 (_1!2400 lt!76418)))))))

(assert (= (and d!15812 res!41793) b!49949))

(assert (= (and b!49949 res!41792) b!49950))

(assert (= (and b!49950 (not res!41791)) b!49951))

(declare-fun m!78555 () Bool)

(assert (=> b!49949 m!78555))

(assert (=> b!49949 m!78233))

(assert (=> b!49951 m!78555))

(assert (=> b!49951 m!78555))

(declare-fun m!78557 () Bool)

(assert (=> b!49951 m!78557))

(assert (=> d!15044 d!15812))

(assert (=> d!15044 d!14954))

(declare-fun d!15814 () Bool)

(declare-fun res!41796 () Bool)

(declare-fun e!32955 () Bool)

(assert (=> d!15814 (=> (not res!41796) (not e!32955))))

(assert (=> d!15814 (= res!41796 (= (size!1049 (buf!1401 lt!76417)) (size!1049 (buf!1401 lt!76417))))))

(assert (=> d!15814 (= (isPrefixOf!0 lt!76417 lt!76417) e!32955)))

(declare-fun b!49952 () Bool)

(declare-fun res!41795 () Bool)

(assert (=> b!49952 (=> (not res!41795) (not e!32955))))

(assert (=> b!49952 (= res!41795 (bvsle (bitIndex!0 (size!1049 (buf!1401 lt!76417)) (currentByte!2918 lt!76417) (currentBit!2913 lt!76417)) (bitIndex!0 (size!1049 (buf!1401 lt!76417)) (currentByte!2918 lt!76417) (currentBit!2913 lt!76417))))))

(declare-fun b!49953 () Bool)

(declare-fun e!32954 () Bool)

(assert (=> b!49953 (= e!32955 e!32954)))

(declare-fun res!41794 () Bool)

(assert (=> b!49953 (=> res!41794 e!32954)))

(assert (=> b!49953 (= res!41794 (= (size!1049 (buf!1401 lt!76417)) #b00000000000000000000000000000000))))

(declare-fun b!49954 () Bool)

(assert (=> b!49954 (= e!32954 (arrayBitRangesEq!0 (buf!1401 lt!76417) (buf!1401 lt!76417) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 lt!76417)) (currentByte!2918 lt!76417) (currentBit!2913 lt!76417))))))

(assert (= (and d!15814 res!41796) b!49952))

(assert (= (and b!49952 res!41795) b!49953))

(assert (= (and b!49953 (not res!41794)) b!49954))

(declare-fun m!78559 () Bool)

(assert (=> b!49952 m!78559))

(assert (=> b!49952 m!78559))

(assert (=> b!49954 m!78559))

(assert (=> b!49954 m!78559))

(declare-fun m!78561 () Bool)

(assert (=> b!49954 m!78561))

(assert (=> d!15044 d!15814))

(declare-fun d!15816 () Bool)

(assert (=> d!15816 (isPrefixOf!0 lt!76417 (_2!2399 lt!75756))))

(declare-fun lt!77756 () Unit!3416)

(assert (=> d!15816 (= lt!77756 (choose!30 lt!76417 thiss!1379 (_2!2399 lt!75756)))))

(assert (=> d!15816 (isPrefixOf!0 lt!76417 thiss!1379)))

(assert (=> d!15816 (= (lemmaIsPrefixTransitive!0 lt!76417 thiss!1379 (_2!2399 lt!75756)) lt!77756)))

(declare-fun bs!3975 () Bool)

(assert (= bs!3975 d!15816))

(assert (=> bs!3975 m!76435))

(declare-fun m!78563 () Bool)

(assert (=> bs!3975 m!78563))

(declare-fun m!78565 () Bool)

(assert (=> bs!3975 m!78565))

(assert (=> d!15044 d!15816))

(declare-fun d!15818 () Bool)

(declare-fun res!41799 () Bool)

(declare-fun e!32957 () Bool)

(assert (=> d!15818 (=> (not res!41799) (not e!32957))))

(assert (=> d!15818 (= res!41799 (= (size!1049 (buf!1401 (_2!2399 lt!75756))) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!15818 (= (isPrefixOf!0 (_2!2399 lt!75756) (_2!2399 lt!75756)) e!32957)))

(declare-fun b!49955 () Bool)

(declare-fun res!41798 () Bool)

(assert (=> b!49955 (=> (not res!41798) (not e!32957))))

(assert (=> b!49955 (= res!41798 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!49956 () Bool)

(declare-fun e!32956 () Bool)

(assert (=> b!49956 (= e!32957 e!32956)))

(declare-fun res!41797 () Bool)

(assert (=> b!49956 (=> res!41797 e!32956)))

(assert (=> b!49956 (= res!41797 (= (size!1049 (buf!1401 (_2!2399 lt!75756))) #b00000000000000000000000000000000))))

(declare-fun b!49957 () Bool)

(assert (=> b!49957 (= e!32956 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(assert (= (and d!15818 res!41799) b!49955))

(assert (= (and b!49955 res!41798) b!49956))

(assert (= (and b!49956 (not res!41797)) b!49957))

(assert (=> b!49955 m!75891))

(assert (=> b!49955 m!75891))

(assert (=> b!49957 m!75891))

(assert (=> b!49957 m!75891))

(declare-fun m!78567 () Bool)

(assert (=> b!49957 m!78567))

(assert (=> d!15044 d!15818))

(declare-fun d!15820 () Bool)

(assert (=> d!15820 (isPrefixOf!0 lt!76417 (_2!2399 lt!75756))))

(declare-fun lt!77757 () Unit!3416)

(assert (=> d!15820 (= lt!77757 (choose!30 lt!76417 (_2!2399 lt!75756) (_2!2399 lt!75756)))))

(assert (=> d!15820 (isPrefixOf!0 lt!76417 (_2!2399 lt!75756))))

(assert (=> d!15820 (= (lemmaIsPrefixTransitive!0 lt!76417 (_2!2399 lt!75756) (_2!2399 lt!75756)) lt!77757)))

(declare-fun bs!3976 () Bool)

(assert (= bs!3976 d!15820))

(assert (=> bs!3976 m!76435))

(declare-fun m!78569 () Bool)

(assert (=> bs!3976 m!78569))

(assert (=> bs!3976 m!76435))

(assert (=> d!15044 d!15820))

(assert (=> d!15044 d!14980))

(declare-fun d!15822 () Bool)

(assert (=> d!15822 (isPrefixOf!0 (_2!2399 lt!75756) (_2!2399 lt!75756))))

(declare-fun lt!77758 () Unit!3416)

(assert (=> d!15822 (= lt!77758 (choose!11 (_2!2399 lt!75756)))))

(assert (=> d!15822 (= (lemmaIsPrefixRefl!0 (_2!2399 lt!75756)) lt!77758)))

(declare-fun bs!3977 () Bool)

(assert (= bs!3977 d!15822))

(assert (=> bs!3977 m!76445))

(declare-fun m!78571 () Bool)

(assert (=> bs!3977 m!78571))

(assert (=> d!15044 d!15822))

(declare-fun d!15824 () Bool)

(declare-fun res!41802 () Bool)

(declare-fun e!32959 () Bool)

(assert (=> d!15824 (=> (not res!41802) (not e!32959))))

(assert (=> d!15824 (= res!41802 (= (size!1049 (buf!1401 lt!76417)) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!15824 (= (isPrefixOf!0 lt!76417 (_2!2399 lt!75756)) e!32959)))

(declare-fun b!49958 () Bool)

(declare-fun res!41801 () Bool)

(assert (=> b!49958 (=> (not res!41801) (not e!32959))))

(assert (=> b!49958 (= res!41801 (bvsle (bitIndex!0 (size!1049 (buf!1401 lt!76417)) (currentByte!2918 lt!76417) (currentBit!2913 lt!76417)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!49959 () Bool)

(declare-fun e!32958 () Bool)

(assert (=> b!49959 (= e!32959 e!32958)))

(declare-fun res!41800 () Bool)

(assert (=> b!49959 (=> res!41800 e!32958)))

(assert (=> b!49959 (= res!41800 (= (size!1049 (buf!1401 lt!76417)) #b00000000000000000000000000000000))))

(declare-fun b!49960 () Bool)

(assert (=> b!49960 (= e!32958 (arrayBitRangesEq!0 (buf!1401 lt!76417) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 lt!76417)) (currentByte!2918 lt!76417) (currentBit!2913 lt!76417))))))

(assert (= (and d!15824 res!41802) b!49958))

(assert (= (and b!49958 res!41801) b!49959))

(assert (= (and b!49959 (not res!41800)) b!49960))

(assert (=> b!49958 m!78559))

(assert (=> b!49958 m!75891))

(assert (=> b!49960 m!78559))

(assert (=> b!49960 m!78559))

(declare-fun m!78573 () Bool)

(assert (=> b!49960 m!78573))

(assert (=> d!15044 d!15824))

(assert (=> d!15046 d!15042))

(declare-fun d!15826 () Bool)

(assert (=> d!15826 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75762)))

(assert (=> d!15826 true))

(declare-fun _$6!205 () Unit!3416)

(assert (=> d!15826 (= (choose!9 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75756)) lt!75762 (BitStream!1819 (buf!1401 (_2!2399 lt!75756)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))) _$6!205)))

(declare-fun bs!3978 () Bool)

(assert (= bs!3978 d!15826))

(assert (=> bs!3978 m!75927))

(assert (=> d!15046 d!15826))

(declare-fun d!15828 () Bool)

(assert (=> d!15828 (= (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) (bvsub (bvmul ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))))))))

(assert (=> d!14992 d!15828))

(declare-fun d!15830 () Bool)

(declare-fun res!41805 () Bool)

(declare-fun e!32961 () Bool)

(assert (=> d!15830 (=> (not res!41805) (not e!32961))))

(assert (=> d!15830 (= res!41805 (= (size!1049 (buf!1401 (_2!2400 lt!76445))) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!15830 (= (isPrefixOf!0 (_2!2400 lt!76445) (_2!2399 lt!75756)) e!32961)))

(declare-fun b!49961 () Bool)

(declare-fun res!41804 () Bool)

(assert (=> b!49961 (=> (not res!41804) (not e!32961))))

(assert (=> b!49961 (= res!41804 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76445))) (currentByte!2918 (_2!2400 lt!76445)) (currentBit!2913 (_2!2400 lt!76445))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!49962 () Bool)

(declare-fun e!32960 () Bool)

(assert (=> b!49962 (= e!32961 e!32960)))

(declare-fun res!41803 () Bool)

(assert (=> b!49962 (=> res!41803 e!32960)))

(assert (=> b!49962 (= res!41803 (= (size!1049 (buf!1401 (_2!2400 lt!76445))) #b00000000000000000000000000000000))))

(declare-fun b!49963 () Bool)

(assert (=> b!49963 (= e!32960 (arrayBitRangesEq!0 (buf!1401 (_2!2400 lt!76445)) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76445))) (currentByte!2918 (_2!2400 lt!76445)) (currentBit!2913 (_2!2400 lt!76445)))))))

(assert (= (and d!15830 res!41805) b!49961))

(assert (= (and b!49961 res!41804) b!49962))

(assert (= (and b!49962 (not res!41803)) b!49963))

(assert (=> b!49961 m!78547))

(assert (=> b!49961 m!75891))

(assert (=> b!49963 m!78547))

(assert (=> b!49963 m!78547))

(declare-fun m!78575 () Bool)

(assert (=> b!49963 m!78575))

(assert (=> b!49068 d!15830))

(declare-fun d!15832 () Bool)

(get-info :version)

(assert (=> d!15832 (= (isEmpty!143 lt!76525) ((_ is Nil!547) lt!76525))))

(assert (=> b!49120 d!15832))

(assert (=> d!15056 d!15048))

(declare-fun d!15834 () Bool)

(assert (=> d!15834 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) (bvsub to!314 i!635))))

(assert (=> d!15834 true))

(declare-fun _$6!206 () Unit!3416)

(assert (=> d!15834 (= (choose!9 thiss!1379 (buf!1401 (_2!2399 lt!75756)) (bvsub to!314 i!635) (BitStream!1819 (buf!1401 (_2!2399 lt!75756)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))) _$6!206)))

(declare-fun bs!3979 () Bool)

(assert (= bs!3979 d!15834))

(assert (=> bs!3979 m!75929))

(assert (=> d!15056 d!15834))

(declare-fun d!15836 () Bool)

(assert (=> d!15836 (= (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 thiss!1379)))))))

(assert (=> d!15048 d!15836))

(declare-fun d!15838 () Bool)

(assert (=> d!15838 (= (isEmpty!143 lt!76522) ((_ is Nil!547) lt!76522))))

(assert (=> b!49116 d!15838))

(declare-fun d!15840 () Bool)

(declare-fun res!41808 () Bool)

(declare-fun e!32963 () Bool)

(assert (=> d!15840 (=> (not res!41808) (not e!32963))))

(assert (=> d!15840 (= res!41808 (= (size!1049 (buf!1401 (_2!2400 lt!76418))) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!15840 (= (isPrefixOf!0 (_2!2400 lt!76418) (_2!2399 lt!75756)) e!32963)))

(declare-fun b!49964 () Bool)

(declare-fun res!41807 () Bool)

(assert (=> b!49964 (=> (not res!41807) (not e!32963))))

(assert (=> b!49964 (= res!41807 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76418))) (currentByte!2918 (_2!2400 lt!76418)) (currentBit!2913 (_2!2400 lt!76418))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!49965 () Bool)

(declare-fun e!32962 () Bool)

(assert (=> b!49965 (= e!32963 e!32962)))

(declare-fun res!41806 () Bool)

(assert (=> b!49965 (=> res!41806 e!32962)))

(assert (=> b!49965 (= res!41806 (= (size!1049 (buf!1401 (_2!2400 lt!76418))) #b00000000000000000000000000000000))))

(declare-fun b!49966 () Bool)

(assert (=> b!49966 (= e!32962 (arrayBitRangesEq!0 (buf!1401 (_2!2400 lt!76418)) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76418))) (currentByte!2918 (_2!2400 lt!76418)) (currentBit!2913 (_2!2400 lt!76418)))))))

(assert (= (and d!15840 res!41808) b!49964))

(assert (= (and b!49964 res!41807) b!49965))

(assert (= (and b!49965 (not res!41806)) b!49966))

(assert (=> b!49964 m!78233))

(assert (=> b!49964 m!75891))

(assert (=> b!49966 m!78233))

(assert (=> b!49966 m!78233))

(declare-fun m!78577 () Bool)

(assert (=> b!49966 m!78577))

(assert (=> b!49055 d!15840))

(assert (=> b!49053 d!14982))

(declare-fun d!15842 () Bool)

(assert (=> d!15842 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 thiss!1379) lt!76426 lt!76412)))

(declare-fun lt!77761 () Unit!3416)

(declare-fun choose!8 (array!2313 array!2313 (_ BitVec 64) (_ BitVec 64)) Unit!3416)

(assert (=> d!15842 (= lt!77761 (choose!8 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75756)) lt!76426 lt!76412))))

(assert (=> d!15842 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76426) (bvsle lt!76426 lt!76412))))

(assert (=> d!15842 (= (arrayBitRangesEqSymmetric!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75756)) lt!76426 lt!76412) lt!77761)))

(declare-fun bs!3980 () Bool)

(assert (= bs!3980 d!15842))

(assert (=> bs!3980 m!76427))

(declare-fun m!78579 () Bool)

(assert (=> bs!3980 m!78579))

(assert (=> b!49053 d!15842))

(declare-fun lt!77768 () (_ BitVec 32))

(declare-fun b!49981 () Bool)

(declare-fun e!32981 () Bool)

(declare-datatypes ((tuple4!24 0))(
  ( (tuple4!25 (_1!2420 (_ BitVec 32)) (_2!2420 (_ BitVec 32)) (_3!104 (_ BitVec 32)) (_4!12 (_ BitVec 32))) )
))
(declare-fun lt!77769 () tuple4!24)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!49981 (= e!32981 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_4!12 lt!77769)) (select (arr!1575 (buf!1401 thiss!1379)) (_4!12 lt!77769)) #b00000000000000000000000000000000 lt!77768))))

(declare-fun lt!77770 () (_ BitVec 32))

(declare-fun bm!640 () Bool)

(declare-fun c!3590 () Bool)

(declare-fun call!643 () Bool)

(assert (=> bm!640 (= call!643 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_3!104 lt!77769)) (select (arr!1575 (buf!1401 thiss!1379)) (_3!104 lt!77769)) lt!77770 (ite c!3590 lt!77768 #b00000000000000000000000000001000)))))

(declare-fun e!32977 () Bool)

(declare-fun b!49982 () Bool)

(declare-fun arrayRangesEq!13 (array!2313 array!2313 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!49982 (= e!32977 (arrayRangesEq!13 (buf!1401 (_2!2399 lt!75756)) (buf!1401 thiss!1379) (_1!2420 lt!77769) (_2!2420 lt!77769)))))

(declare-fun b!49983 () Bool)

(declare-fun e!32976 () Bool)

(declare-fun e!32979 () Bool)

(assert (=> b!49983 (= e!32976 e!32979)))

(declare-fun res!41819 () Bool)

(assert (=> b!49983 (=> (not res!41819) (not e!32979))))

(assert (=> b!49983 (= res!41819 e!32977)))

(declare-fun res!41823 () Bool)

(assert (=> b!49983 (=> res!41823 e!32977)))

(assert (=> b!49983 (= res!41823 (bvsge (_1!2420 lt!77769) (_2!2420 lt!77769)))))

(assert (=> b!49983 (= lt!77768 ((_ extract 31 0) (bvsrem lt!76412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49983 (= lt!77770 ((_ extract 31 0) (bvsrem lt!76426 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!24)

(assert (=> b!49983 (= lt!77769 (arrayBitIndices!0 lt!76426 lt!76412))))

(declare-fun b!49985 () Bool)

(declare-fun e!32980 () Bool)

(assert (=> b!49985 (= e!32980 call!643)))

(declare-fun b!49986 () Bool)

(declare-fun e!32978 () Bool)

(assert (=> b!49986 (= e!32980 e!32978)))

(declare-fun res!41822 () Bool)

(assert (=> b!49986 (= res!41822 call!643)))

(assert (=> b!49986 (=> (not res!41822) (not e!32978))))

(declare-fun b!49987 () Bool)

(declare-fun res!41821 () Bool)

(assert (=> b!49987 (= res!41821 (= lt!77768 #b00000000000000000000000000000000))))

(assert (=> b!49987 (=> res!41821 e!32981)))

(assert (=> b!49987 (= e!32978 e!32981)))

(declare-fun b!49984 () Bool)

(assert (=> b!49984 (= e!32979 e!32980)))

(assert (=> b!49984 (= c!3590 (= (_3!104 lt!77769) (_4!12 lt!77769)))))

(declare-fun d!15844 () Bool)

(declare-fun res!41820 () Bool)

(assert (=> d!15844 (=> res!41820 e!32976)))

(assert (=> d!15844 (= res!41820 (bvsge lt!76426 lt!76412))))

(assert (=> d!15844 (= (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 thiss!1379) lt!76426 lt!76412) e!32976)))

(assert (= (and d!15844 (not res!41820)) b!49983))

(assert (= (and b!49983 (not res!41823)) b!49982))

(assert (= (and b!49983 res!41819) b!49984))

(assert (= (and b!49984 c!3590) b!49985))

(assert (= (and b!49984 (not c!3590)) b!49986))

(assert (= (and b!49986 res!41822) b!49987))

(assert (= (and b!49987 (not res!41821)) b!49981))

(assert (= (or b!49985 b!49986) bm!640))

(declare-fun m!78581 () Bool)

(assert (=> b!49981 m!78581))

(declare-fun m!78583 () Bool)

(assert (=> b!49981 m!78583))

(assert (=> b!49981 m!78581))

(assert (=> b!49981 m!78583))

(declare-fun m!78585 () Bool)

(assert (=> b!49981 m!78585))

(declare-fun m!78587 () Bool)

(assert (=> bm!640 m!78587))

(declare-fun m!78589 () Bool)

(assert (=> bm!640 m!78589))

(assert (=> bm!640 m!78587))

(assert (=> bm!640 m!78589))

(declare-fun m!78591 () Bool)

(assert (=> bm!640 m!78591))

(declare-fun m!78593 () Bool)

(assert (=> b!49982 m!78593))

(declare-fun m!78595 () Bool)

(assert (=> b!49983 m!78595))

(assert (=> b!49053 d!15844))

(declare-fun d!15846 () Bool)

(declare-fun res!41826 () Bool)

(declare-fun e!32983 () Bool)

(assert (=> d!15846 (=> (not res!41826) (not e!32983))))

(assert (=> d!15846 (= res!41826 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!76362)))))))

(assert (=> d!15846 (= (isPrefixOf!0 thiss!1379 (_2!2399 lt!76362)) e!32983)))

(declare-fun b!49988 () Bool)

(declare-fun res!41825 () Bool)

(assert (=> b!49988 (=> (not res!41825) (not e!32983))))

(assert (=> b!49988 (= res!41825 (bvsle (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76362))) (currentByte!2918 (_2!2399 lt!76362)) (currentBit!2913 (_2!2399 lt!76362)))))))

(declare-fun b!49989 () Bool)

(declare-fun e!32982 () Bool)

(assert (=> b!49989 (= e!32983 e!32982)))

(declare-fun res!41824 () Bool)

(assert (=> b!49989 (=> res!41824 e!32982)))

(assert (=> b!49989 (= res!41824 (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49990 () Bool)

(assert (=> b!49990 (= e!32982 (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!76362)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (= (and d!15846 res!41826) b!49988))

(assert (= (and b!49988 res!41825) b!49989))

(assert (= (and b!49989 (not res!41824)) b!49990))

(assert (=> b!49988 m!75897))

(assert (=> b!49988 m!76399))

(assert (=> b!49990 m!75897))

(assert (=> b!49990 m!75897))

(declare-fun m!78597 () Bool)

(assert (=> b!49990 m!78597))

(assert (=> b!49036 d!15846))

(declare-fun lt!77773 () tuple2!4614)

(declare-fun e!32985 () tuple2!4616)

(declare-fun lt!77772 () (_ BitVec 64))

(declare-fun b!49992 () Bool)

(assert (=> b!49992 (= e!32985 (tuple2!4617 (Cons!546 (_1!2406 lt!77773) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!77773) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77772))) (_2!2406 lt!77773)))))

(assert (=> b!49992 (= lt!77773 (readBit!0 (_1!2400 lt!75750)))))

(assert (=> b!49992 (= lt!77772 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15848 () Bool)

(declare-fun e!32984 () Bool)

(assert (=> d!15848 e!32984))

(declare-fun c!3592 () Bool)

(assert (=> d!15848 (= c!3592 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77771 () List!550)

(assert (=> d!15848 (= lt!77771 (_1!2407 e!32985))))

(declare-fun c!3591 () Bool)

(assert (=> d!15848 (= c!3591 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15848 (bvsge (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15848 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75750) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77771)))

(declare-fun b!49993 () Bool)

(assert (=> b!49993 (= e!32984 (isEmpty!143 lt!77771))))

(declare-fun b!49994 () Bool)

(assert (=> b!49994 (= e!32984 (> (length!245 lt!77771) 0))))

(declare-fun b!49991 () Bool)

(assert (=> b!49991 (= e!32985 (tuple2!4617 Nil!547 (_1!2400 lt!75750)))))

(assert (= (and d!15848 c!3591) b!49991))

(assert (= (and d!15848 (not c!3591)) b!49992))

(assert (= (and d!15848 c!3592) b!49993))

(assert (= (and d!15848 (not c!3592)) b!49994))

(declare-fun m!78599 () Bool)

(assert (=> b!49992 m!78599))

(assert (=> b!49992 m!76565))

(declare-fun m!78601 () Bool)

(assert (=> b!49993 m!78601))

(declare-fun m!78603 () Bool)

(assert (=> b!49994 m!78603))

(assert (=> b!48871 d!15848))

(assert (=> b!48871 d!14942))

(declare-fun d!15850 () Bool)

(declare-fun res!41829 () Bool)

(declare-fun e!32987 () Bool)

(assert (=> d!15850 (=> (not res!41829) (not e!32987))))

(assert (=> d!15850 (= res!41829 (= (size!1049 (buf!1401 (_1!2400 lt!76061))) (size!1049 (buf!1401 (_2!2400 lt!76061)))))))

(assert (=> d!15850 (= (isPrefixOf!0 (_1!2400 lt!76061) (_2!2400 lt!76061)) e!32987)))

(declare-fun b!49995 () Bool)

(declare-fun res!41828 () Bool)

(assert (=> b!49995 (=> (not res!41828) (not e!32987))))

(assert (=> b!49995 (= res!41828 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76061))) (currentByte!2918 (_1!2400 lt!76061)) (currentBit!2913 (_1!2400 lt!76061))) (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76061))) (currentByte!2918 (_2!2400 lt!76061)) (currentBit!2913 (_2!2400 lt!76061)))))))

(declare-fun b!49996 () Bool)

(declare-fun e!32986 () Bool)

(assert (=> b!49996 (= e!32987 e!32986)))

(declare-fun res!41827 () Bool)

(assert (=> b!49996 (=> res!41827 e!32986)))

(assert (=> b!49996 (= res!41827 (= (size!1049 (buf!1401 (_1!2400 lt!76061))) #b00000000000000000000000000000000))))

(declare-fun b!49997 () Bool)

(assert (=> b!49997 (= e!32986 (arrayBitRangesEq!0 (buf!1401 (_1!2400 lt!76061)) (buf!1401 (_2!2400 lt!76061)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76061))) (currentByte!2918 (_1!2400 lt!76061)) (currentBit!2913 (_1!2400 lt!76061)))))))

(assert (= (and d!15850 res!41829) b!49995))

(assert (= (and b!49995 res!41828) b!49996))

(assert (= (and b!49996 (not res!41827)) b!49997))

(assert (=> b!49995 m!78541))

(declare-fun m!78605 () Bool)

(assert (=> b!49995 m!78605))

(assert (=> b!49997 m!78541))

(assert (=> b!49997 m!78541))

(declare-fun m!78607 () Bool)

(assert (=> b!49997 m!78607))

(assert (=> d!14976 d!15850))

(declare-fun d!15852 () Bool)

(assert (=> d!15852 (isPrefixOf!0 lt!76060 lt!76060)))

(declare-fun lt!77774 () Unit!3416)

(assert (=> d!15852 (= lt!77774 (choose!11 lt!76060))))

(assert (=> d!15852 (= (lemmaIsPrefixRefl!0 lt!76060) lt!77774)))

(declare-fun bs!3981 () Bool)

(assert (= bs!3981 d!15852))

(assert (=> bs!3981 m!76205))

(declare-fun m!78609 () Bool)

(assert (=> bs!3981 m!78609))

(assert (=> d!14976 d!15852))

(declare-fun d!15854 () Bool)

(assert (=> d!15854 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(declare-fun lt!77775 () Unit!3416)

(assert (=> d!15854 (= lt!77775 (choose!11 (_2!2399 lt!75747)))))

(assert (=> d!15854 (= (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)) lt!77775)))

(declare-fun bs!3982 () Bool)

(assert (= bs!3982 d!15854))

(assert (=> bs!3982 m!76103))

(declare-fun m!78611 () Bool)

(assert (=> bs!3982 m!78611))

(assert (=> d!14976 d!15854))

(assert (=> d!14976 d!14980))

(declare-fun d!15856 () Bool)

(declare-fun res!41832 () Bool)

(declare-fun e!32989 () Bool)

(assert (=> d!15856 (=> (not res!41832) (not e!32989))))

(assert (=> d!15856 (= res!41832 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (=> d!15856 (= (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747)) e!32989)))

(declare-fun b!49998 () Bool)

(declare-fun res!41831 () Bool)

(assert (=> b!49998 (=> (not res!41831) (not e!32989))))

(assert (=> b!49998 (= res!41831 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun b!49999 () Bool)

(declare-fun e!32988 () Bool)

(assert (=> b!49999 (= e!32989 e!32988)))

(declare-fun res!41830 () Bool)

(assert (=> b!49999 (=> res!41830 e!32988)))

(assert (=> b!49999 (= res!41830 (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000))))

(declare-fun b!50000 () Bool)

(assert (=> b!50000 (= e!32988 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (= (and d!15856 res!41832) b!49998))

(assert (= (and b!49998 res!41831) b!49999))

(assert (= (and b!49999 (not res!41830)) b!50000))

(assert (=> b!49998 m!75915))

(assert (=> b!49998 m!75915))

(assert (=> b!50000 m!75915))

(assert (=> b!50000 m!75915))

(declare-fun m!78613 () Bool)

(assert (=> b!50000 m!78613))

(assert (=> d!14976 d!15856))

(declare-fun d!15858 () Bool)

(assert (=> d!15858 (isPrefixOf!0 lt!76060 (_2!2399 lt!75747))))

(declare-fun lt!77776 () Unit!3416)

(assert (=> d!15858 (= lt!77776 (choose!30 lt!76060 thiss!1379 (_2!2399 lt!75747)))))

(assert (=> d!15858 (isPrefixOf!0 lt!76060 thiss!1379)))

(assert (=> d!15858 (= (lemmaIsPrefixTransitive!0 lt!76060 thiss!1379 (_2!2399 lt!75747)) lt!77776)))

(declare-fun bs!3983 () Bool)

(assert (= bs!3983 d!15858))

(assert (=> bs!3983 m!76203))

(declare-fun m!78615 () Bool)

(assert (=> bs!3983 m!78615))

(declare-fun m!78617 () Bool)

(assert (=> bs!3983 m!78617))

(assert (=> d!14976 d!15858))

(assert (=> d!14976 d!14990))

(declare-fun d!15860 () Bool)

(declare-fun res!41835 () Bool)

(declare-fun e!32991 () Bool)

(assert (=> d!15860 (=> (not res!41835) (not e!32991))))

(assert (=> d!15860 (= res!41835 (= (size!1049 (buf!1401 lt!76060)) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (=> d!15860 (= (isPrefixOf!0 lt!76060 (_2!2399 lt!75747)) e!32991)))

(declare-fun b!50001 () Bool)

(declare-fun res!41834 () Bool)

(assert (=> b!50001 (=> (not res!41834) (not e!32991))))

(assert (=> b!50001 (= res!41834 (bvsle (bitIndex!0 (size!1049 (buf!1401 lt!76060)) (currentByte!2918 lt!76060) (currentBit!2913 lt!76060)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun b!50002 () Bool)

(declare-fun e!32990 () Bool)

(assert (=> b!50002 (= e!32991 e!32990)))

(declare-fun res!41833 () Bool)

(assert (=> b!50002 (=> res!41833 e!32990)))

(assert (=> b!50002 (= res!41833 (= (size!1049 (buf!1401 lt!76060)) #b00000000000000000000000000000000))))

(declare-fun b!50003 () Bool)

(assert (=> b!50003 (= e!32990 (arrayBitRangesEq!0 (buf!1401 lt!76060) (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 lt!76060)) (currentByte!2918 lt!76060) (currentBit!2913 lt!76060))))))

(assert (= (and d!15860 res!41835) b!50001))

(assert (= (and b!50001 res!41834) b!50002))

(assert (= (and b!50002 (not res!41833)) b!50003))

(declare-fun m!78619 () Bool)

(assert (=> b!50001 m!78619))

(assert (=> b!50001 m!75915))

(assert (=> b!50003 m!78619))

(assert (=> b!50003 m!78619))

(declare-fun m!78621 () Bool)

(assert (=> b!50003 m!78621))

(assert (=> d!14976 d!15860))

(assert (=> d!14976 d!14978))

(declare-fun d!15862 () Bool)

(assert (=> d!15862 (isPrefixOf!0 lt!76060 (_2!2399 lt!75747))))

(declare-fun lt!77777 () Unit!3416)

(assert (=> d!15862 (= lt!77777 (choose!30 lt!76060 (_2!2399 lt!75747) (_2!2399 lt!75747)))))

(assert (=> d!15862 (isPrefixOf!0 lt!76060 (_2!2399 lt!75747))))

(assert (=> d!15862 (= (lemmaIsPrefixTransitive!0 lt!76060 (_2!2399 lt!75747) (_2!2399 lt!75747)) lt!77777)))

(declare-fun bs!3984 () Bool)

(assert (= bs!3984 d!15862))

(assert (=> bs!3984 m!76203))

(declare-fun m!78623 () Bool)

(assert (=> bs!3984 m!78623))

(assert (=> bs!3984 m!76203))

(assert (=> d!14976 d!15862))

(declare-fun d!15864 () Bool)

(declare-fun res!41838 () Bool)

(declare-fun e!32993 () Bool)

(assert (=> d!15864 (=> (not res!41838) (not e!32993))))

(assert (=> d!15864 (= res!41838 (= (size!1049 (buf!1401 lt!76060)) (size!1049 (buf!1401 lt!76060))))))

(assert (=> d!15864 (= (isPrefixOf!0 lt!76060 lt!76060) e!32993)))

(declare-fun b!50004 () Bool)

(declare-fun res!41837 () Bool)

(assert (=> b!50004 (=> (not res!41837) (not e!32993))))

(assert (=> b!50004 (= res!41837 (bvsle (bitIndex!0 (size!1049 (buf!1401 lt!76060)) (currentByte!2918 lt!76060) (currentBit!2913 lt!76060)) (bitIndex!0 (size!1049 (buf!1401 lt!76060)) (currentByte!2918 lt!76060) (currentBit!2913 lt!76060))))))

(declare-fun b!50005 () Bool)

(declare-fun e!32992 () Bool)

(assert (=> b!50005 (= e!32993 e!32992)))

(declare-fun res!41836 () Bool)

(assert (=> b!50005 (=> res!41836 e!32992)))

(assert (=> b!50005 (= res!41836 (= (size!1049 (buf!1401 lt!76060)) #b00000000000000000000000000000000))))

(declare-fun b!50006 () Bool)

(assert (=> b!50006 (= e!32992 (arrayBitRangesEq!0 (buf!1401 lt!76060) (buf!1401 lt!76060) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 lt!76060)) (currentByte!2918 lt!76060) (currentBit!2913 lt!76060))))))

(assert (= (and d!15864 res!41838) b!50004))

(assert (= (and b!50004 res!41837) b!50005))

(assert (= (and b!50005 (not res!41836)) b!50006))

(assert (=> b!50004 m!78619))

(assert (=> b!50004 m!78619))

(assert (=> b!50006 m!78619))

(assert (=> b!50006 m!78619))

(declare-fun m!78625 () Bool)

(assert (=> b!50006 m!78625))

(assert (=> d!14976 d!15864))

(declare-fun d!15866 () Bool)

(declare-fun res!41841 () Bool)

(declare-fun e!32995 () Bool)

(assert (=> d!15866 (=> (not res!41841) (not e!32995))))

(assert (=> d!15866 (= res!41841 (= (size!1049 (buf!1401 (_2!2400 lt!76061))) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (=> d!15866 (= (isPrefixOf!0 (_2!2400 lt!76061) (_2!2399 lt!75747)) e!32995)))

(declare-fun b!50007 () Bool)

(declare-fun res!41840 () Bool)

(assert (=> b!50007 (=> (not res!41840) (not e!32995))))

(assert (=> b!50007 (= res!41840 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76061))) (currentByte!2918 (_2!2400 lt!76061)) (currentBit!2913 (_2!2400 lt!76061))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun b!50008 () Bool)

(declare-fun e!32994 () Bool)

(assert (=> b!50008 (= e!32995 e!32994)))

(declare-fun res!41839 () Bool)

(assert (=> b!50008 (=> res!41839 e!32994)))

(assert (=> b!50008 (= res!41839 (= (size!1049 (buf!1401 (_2!2400 lt!76061))) #b00000000000000000000000000000000))))

(declare-fun b!50009 () Bool)

(assert (=> b!50009 (= e!32994 (arrayBitRangesEq!0 (buf!1401 (_2!2400 lt!76061)) (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76061))) (currentByte!2918 (_2!2400 lt!76061)) (currentBit!2913 (_2!2400 lt!76061)))))))

(assert (= (and d!15866 res!41841) b!50007))

(assert (= (and b!50007 res!41840) b!50008))

(assert (= (and b!50008 (not res!41839)) b!50009))

(assert (=> b!50007 m!78605))

(assert (=> b!50007 m!75915))

(assert (=> b!50009 m!78605))

(assert (=> b!50009 m!78605))

(declare-fun m!78627 () Bool)

(assert (=> b!50009 m!78627))

(assert (=> b!48941 d!15866))

(assert (=> d!14950 d!14952))

(declare-fun d!15868 () Bool)

(assert (=> d!15868 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!15868 true))

(declare-fun _$6!207 () Unit!3416)

(assert (=> d!15868 (= (choose!9 thiss!1379 (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1819 (buf!1401 (_2!2399 lt!75747)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))) _$6!207)))

(declare-fun bs!3985 () Bool)

(assert (= bs!3985 d!15868))

(assert (=> bs!3985 m!75905))

(assert (=> d!14950 d!15868))

(assert (=> b!48939 d!14982))

(declare-fun d!15870 () Bool)

(assert (=> d!15870 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 thiss!1379) lt!76069 lt!76055)))

(declare-fun lt!77778 () Unit!3416)

(assert (=> d!15870 (= lt!77778 (choose!8 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75747)) lt!76069 lt!76055))))

(assert (=> d!15870 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76069) (bvsle lt!76069 lt!76055))))

(assert (=> d!15870 (= (arrayBitRangesEqSymmetric!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75747)) lt!76069 lt!76055) lt!77778)))

(declare-fun bs!3986 () Bool)

(assert (= bs!3986 d!15870))

(assert (=> bs!3986 m!76195))

(declare-fun m!78629 () Bool)

(assert (=> bs!3986 m!78629))

(assert (=> b!48939 d!15870))

(declare-fun lt!77779 () (_ BitVec 32))

(declare-fun lt!77780 () tuple4!24)

(declare-fun e!33001 () Bool)

(declare-fun b!50010 () Bool)

(assert (=> b!50010 (= e!33001 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_4!12 lt!77780)) (select (arr!1575 (buf!1401 thiss!1379)) (_4!12 lt!77780)) #b00000000000000000000000000000000 lt!77779))))

(declare-fun call!644 () Bool)

(declare-fun lt!77781 () (_ BitVec 32))

(declare-fun c!3593 () Bool)

(declare-fun bm!641 () Bool)

(assert (=> bm!641 (= call!644 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_3!104 lt!77780)) (select (arr!1575 (buf!1401 thiss!1379)) (_3!104 lt!77780)) lt!77781 (ite c!3593 lt!77779 #b00000000000000000000000000001000)))))

(declare-fun b!50011 () Bool)

(declare-fun e!32997 () Bool)

(assert (=> b!50011 (= e!32997 (arrayRangesEq!13 (buf!1401 (_2!2399 lt!75747)) (buf!1401 thiss!1379) (_1!2420 lt!77780) (_2!2420 lt!77780)))))

(declare-fun b!50012 () Bool)

(declare-fun e!32996 () Bool)

(declare-fun e!32999 () Bool)

(assert (=> b!50012 (= e!32996 e!32999)))

(declare-fun res!41842 () Bool)

(assert (=> b!50012 (=> (not res!41842) (not e!32999))))

(assert (=> b!50012 (= res!41842 e!32997)))

(declare-fun res!41846 () Bool)

(assert (=> b!50012 (=> res!41846 e!32997)))

(assert (=> b!50012 (= res!41846 (bvsge (_1!2420 lt!77780) (_2!2420 lt!77780)))))

(assert (=> b!50012 (= lt!77779 ((_ extract 31 0) (bvsrem lt!76055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50012 (= lt!77781 ((_ extract 31 0) (bvsrem lt!76069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50012 (= lt!77780 (arrayBitIndices!0 lt!76069 lt!76055))))

(declare-fun b!50014 () Bool)

(declare-fun e!33000 () Bool)

(assert (=> b!50014 (= e!33000 call!644)))

(declare-fun b!50015 () Bool)

(declare-fun e!32998 () Bool)

(assert (=> b!50015 (= e!33000 e!32998)))

(declare-fun res!41845 () Bool)

(assert (=> b!50015 (= res!41845 call!644)))

(assert (=> b!50015 (=> (not res!41845) (not e!32998))))

(declare-fun b!50016 () Bool)

(declare-fun res!41844 () Bool)

(assert (=> b!50016 (= res!41844 (= lt!77779 #b00000000000000000000000000000000))))

(assert (=> b!50016 (=> res!41844 e!33001)))

(assert (=> b!50016 (= e!32998 e!33001)))

(declare-fun b!50013 () Bool)

(assert (=> b!50013 (= e!32999 e!33000)))

(assert (=> b!50013 (= c!3593 (= (_3!104 lt!77780) (_4!12 lt!77780)))))

(declare-fun d!15872 () Bool)

(declare-fun res!41843 () Bool)

(assert (=> d!15872 (=> res!41843 e!32996)))

(assert (=> d!15872 (= res!41843 (bvsge lt!76069 lt!76055))))

(assert (=> d!15872 (= (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 thiss!1379) lt!76069 lt!76055) e!32996)))

(assert (= (and d!15872 (not res!41843)) b!50012))

(assert (= (and b!50012 (not res!41846)) b!50011))

(assert (= (and b!50012 res!41842) b!50013))

(assert (= (and b!50013 c!3593) b!50014))

(assert (= (and b!50013 (not c!3593)) b!50015))

(assert (= (and b!50015 res!41845) b!50016))

(assert (= (and b!50016 (not res!41844)) b!50010))

(assert (= (or b!50014 b!50015) bm!641))

(declare-fun m!78631 () Bool)

(assert (=> b!50010 m!78631))

(declare-fun m!78633 () Bool)

(assert (=> b!50010 m!78633))

(assert (=> b!50010 m!78631))

(assert (=> b!50010 m!78633))

(declare-fun m!78635 () Bool)

(assert (=> b!50010 m!78635))

(declare-fun m!78637 () Bool)

(assert (=> bm!641 m!78637))

(declare-fun m!78639 () Bool)

(assert (=> bm!641 m!78639))

(assert (=> bm!641 m!78637))

(assert (=> bm!641 m!78639))

(declare-fun m!78641 () Bool)

(assert (=> bm!641 m!78641))

(declare-fun m!78643 () Bool)

(assert (=> b!50011 m!78643))

(declare-fun m!78645 () Bool)

(assert (=> b!50012 m!78645))

(assert (=> b!48939 d!15872))

(declare-fun d!15874 () Bool)

(declare-fun e!33002 () Bool)

(assert (=> d!15874 e!33002))

(declare-fun res!41848 () Bool)

(assert (=> d!15874 (=> (not res!41848) (not e!33002))))

(declare-fun lt!77782 () (_ BitVec 64))

(declare-fun lt!77784 () (_ BitVec 64))

(declare-fun lt!77786 () (_ BitVec 64))

(assert (=> d!15874 (= res!41848 (= lt!77786 (bvsub lt!77784 lt!77782)))))

(assert (=> d!15874 (or (= (bvand lt!77784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77784 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77784 lt!77782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15874 (= lt!77782 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2404 lt!76366)))) ((_ sign_extend 32) (currentByte!2918 (_1!2404 lt!76366))) ((_ sign_extend 32) (currentBit!2913 (_1!2404 lt!76366)))))))

(declare-fun lt!77787 () (_ BitVec 64))

(declare-fun lt!77785 () (_ BitVec 64))

(assert (=> d!15874 (= lt!77784 (bvmul lt!77787 lt!77785))))

(assert (=> d!15874 (or (= lt!77787 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77785 (bvsdiv (bvmul lt!77787 lt!77785) lt!77787)))))

(assert (=> d!15874 (= lt!77785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15874 (= lt!77787 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2404 lt!76366)))))))

(assert (=> d!15874 (= lt!77786 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_1!2404 lt!76366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_1!2404 lt!76366)))))))

(assert (=> d!15874 (invariant!0 (currentBit!2913 (_1!2404 lt!76366)) (currentByte!2918 (_1!2404 lt!76366)) (size!1049 (buf!1401 (_1!2404 lt!76366))))))

(assert (=> d!15874 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!76366))) (currentByte!2918 (_1!2404 lt!76366)) (currentBit!2913 (_1!2404 lt!76366))) lt!77786)))

(declare-fun b!50017 () Bool)

(declare-fun res!41847 () Bool)

(assert (=> b!50017 (=> (not res!41847) (not e!33002))))

(assert (=> b!50017 (= res!41847 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77786))))

(declare-fun b!50018 () Bool)

(declare-fun lt!77783 () (_ BitVec 64))

(assert (=> b!50018 (= e!33002 (bvsle lt!77786 (bvmul lt!77783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50018 (or (= lt!77783 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77783 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77783)))))

(assert (=> b!50018 (= lt!77783 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2404 lt!76366)))))))

(assert (= (and d!15874 res!41848) b!50017))

(assert (= (and b!50017 res!41847) b!50018))

(declare-fun m!78647 () Bool)

(assert (=> d!15874 m!78647))

(declare-fun m!78649 () Bool)

(assert (=> d!15874 m!78649))

(assert (=> b!49041 d!15874))

(declare-fun d!15876 () Bool)

(declare-fun e!33003 () Bool)

(assert (=> d!15876 e!33003))

(declare-fun res!41850 () Bool)

(assert (=> d!15876 (=> (not res!41850) (not e!33003))))

(declare-fun lt!77792 () (_ BitVec 64))

(declare-fun lt!77788 () (_ BitVec 64))

(declare-fun lt!77790 () (_ BitVec 64))

(assert (=> d!15876 (= res!41850 (= lt!77792 (bvsub lt!77790 lt!77788)))))

(assert (=> d!15876 (or (= (bvand lt!77790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77788 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77790 lt!77788) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15876 (= lt!77788 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76362)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76362))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76362)))))))

(declare-fun lt!77793 () (_ BitVec 64))

(declare-fun lt!77791 () (_ BitVec 64))

(assert (=> d!15876 (= lt!77790 (bvmul lt!77793 lt!77791))))

(assert (=> d!15876 (or (= lt!77793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77791 (bvsdiv (bvmul lt!77793 lt!77791) lt!77793)))))

(assert (=> d!15876 (= lt!77791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15876 (= lt!77793 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76362)))))))

(assert (=> d!15876 (= lt!77792 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!76362))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!76362)))))))

(assert (=> d!15876 (invariant!0 (currentBit!2913 (_2!2399 lt!76362)) (currentByte!2918 (_2!2399 lt!76362)) (size!1049 (buf!1401 (_2!2399 lt!76362))))))

(assert (=> d!15876 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76362))) (currentByte!2918 (_2!2399 lt!76362)) (currentBit!2913 (_2!2399 lt!76362))) lt!77792)))

(declare-fun b!50019 () Bool)

(declare-fun res!41849 () Bool)

(assert (=> b!50019 (=> (not res!41849) (not e!33003))))

(assert (=> b!50019 (= res!41849 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77792))))

(declare-fun b!50020 () Bool)

(declare-fun lt!77789 () (_ BitVec 64))

(assert (=> b!50020 (= e!33003 (bvsle lt!77792 (bvmul lt!77789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50020 (or (= lt!77789 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77789 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77789)))))

(assert (=> b!50020 (= lt!77789 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!76362)))))))

(assert (= (and d!15876 res!41850) b!50019))

(assert (= (and b!50019 res!41849) b!50020))

(declare-fun m!78651 () Bool)

(assert (=> d!15876 m!78651))

(assert (=> d!15876 m!78253))

(assert (=> b!49041 d!15876))

(declare-fun d!15878 () Bool)

(assert (=> d!15878 (= (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 thiss!1379)))))))

(assert (=> d!14982 d!15878))

(declare-fun d!15880 () Bool)

(assert (=> d!15880 (= (invariant!0 (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379) (size!1049 (buf!1401 thiss!1379))) (and (bvsge (currentBit!2913 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2913 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2918 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2918 thiss!1379) (size!1049 (buf!1401 thiss!1379))) (and (= (currentBit!2913 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2918 thiss!1379) (size!1049 (buf!1401 thiss!1379)))))))))

(assert (=> d!14982 d!15880))

(declare-fun b!50021 () Bool)

(declare-fun e!33004 () Unit!3416)

(declare-fun lt!77799 () Unit!3416)

(assert (=> b!50021 (= e!33004 lt!77799)))

(declare-fun lt!77810 () (_ BitVec 64))

(assert (=> b!50021 (= lt!77810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77796 () (_ BitVec 64))

(assert (=> b!50021 (= lt!77796 (bitIndex!0 (size!1049 (buf!1401 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))) (currentByte!2918 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))) (currentBit!2913 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))))))

(assert (=> b!50021 (= lt!77799 (arrayBitRangesEqSymmetric!0 (buf!1401 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))) (buf!1401 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))) lt!77810 lt!77796))))

(assert (=> b!50021 (arrayBitRangesEq!0 (buf!1401 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))) (buf!1401 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))) lt!77810 lt!77796)))

(declare-fun b!50022 () Bool)

(declare-fun Unit!3481 () Unit!3416)

(assert (=> b!50022 (= e!33004 Unit!3481)))

(declare-fun d!15882 () Bool)

(declare-fun e!33005 () Bool)

(assert (=> d!15882 e!33005))

(declare-fun res!41853 () Bool)

(assert (=> d!15882 (=> (not res!41853) (not e!33005))))

(declare-fun lt!77802 () tuple2!4602)

(assert (=> d!15882 (= res!41853 (isPrefixOf!0 (_1!2400 lt!77802) (_2!2400 lt!77802)))))

(declare-fun lt!77801 () BitStream!1818)

(assert (=> d!15882 (= lt!77802 (tuple2!4603 lt!77801 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun lt!77805 () Unit!3416)

(declare-fun lt!77795 () Unit!3416)

(assert (=> d!15882 (= lt!77805 lt!77795)))

(assert (=> d!15882 (isPrefixOf!0 lt!77801 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)))))

(assert (=> d!15882 (= lt!77795 (lemmaIsPrefixTransitive!0 lt!77801 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun lt!77798 () Unit!3416)

(declare-fun lt!77812 () Unit!3416)

(assert (=> d!15882 (= lt!77798 lt!77812)))

(assert (=> d!15882 (isPrefixOf!0 lt!77801 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)))))

(assert (=> d!15882 (= lt!77812 (lemmaIsPrefixTransitive!0 lt!77801 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun lt!77811 () Unit!3416)

(assert (=> d!15882 (= lt!77811 e!33004)))

(declare-fun c!3594 () Bool)

(assert (=> d!15882 (= c!3594 (not (= (size!1049 (buf!1401 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))) #b00000000000000000000000000000000)))))

(declare-fun lt!77800 () Unit!3416)

(declare-fun lt!77794 () Unit!3416)

(assert (=> d!15882 (= lt!77800 lt!77794)))

(assert (=> d!15882 (isPrefixOf!0 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)))))

(assert (=> d!15882 (= lt!77794 (lemmaIsPrefixRefl!0 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun lt!77797 () Unit!3416)

(declare-fun lt!77808 () Unit!3416)

(assert (=> d!15882 (= lt!77797 lt!77808)))

(assert (=> d!15882 (= lt!77808 (lemmaIsPrefixRefl!0 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun lt!77806 () Unit!3416)

(declare-fun lt!77804 () Unit!3416)

(assert (=> d!15882 (= lt!77806 lt!77804)))

(assert (=> d!15882 (isPrefixOf!0 lt!77801 lt!77801)))

(assert (=> d!15882 (= lt!77804 (lemmaIsPrefixRefl!0 lt!77801))))

(declare-fun lt!77809 () Unit!3416)

(declare-fun lt!77813 () Unit!3416)

(assert (=> d!15882 (= lt!77809 lt!77813)))

(assert (=> d!15882 (isPrefixOf!0 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))))

(assert (=> d!15882 (= lt!77813 (lemmaIsPrefixRefl!0 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))))))

(assert (=> d!15882 (= lt!77801 (BitStream!1819 (buf!1401 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))) (currentByte!2918 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))) (currentBit!2913 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))))))

(assert (=> d!15882 (isPrefixOf!0 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)))))

(assert (=> d!15882 (= (reader!0 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))) lt!77802)))

(declare-fun b!50023 () Bool)

(declare-fun res!41852 () Bool)

(assert (=> b!50023 (=> (not res!41852) (not e!33005))))

(assert (=> b!50023 (= res!41852 (isPrefixOf!0 (_2!2400 lt!77802) (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))))))

(declare-fun b!50024 () Bool)

(declare-fun res!41851 () Bool)

(assert (=> b!50024 (=> (not res!41851) (not e!33005))))

(assert (=> b!50024 (= res!41851 (isPrefixOf!0 (_1!2400 lt!77802) (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))))))

(declare-fun lt!77803 () (_ BitVec 64))

(declare-fun b!50025 () Bool)

(declare-fun lt!77807 () (_ BitVec 64))

(assert (=> b!50025 (= e!33005 (= (_1!2400 lt!77802) (withMovedBitIndex!0 (_2!2400 lt!77802) (bvsub lt!77803 lt!77807))))))

(assert (=> b!50025 (or (= (bvand lt!77803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77807 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77803 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77803 lt!77807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!50025 (= lt!77807 (bitIndex!0 (size!1049 (buf!1401 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)))) (currentByte!2918 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747))) (currentBit!2913 (ite c!3426 (_2!2399 lt!75987) (_2!2399 lt!75747)))))))

(assert (=> b!50025 (= lt!77803 (bitIndex!0 (size!1049 (buf!1401 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))) (currentByte!2918 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747))) (currentBit!2913 (ite c!3426 (_2!2399 lt!76012) (_2!2399 lt!75747)))))))

(assert (= (and d!15882 c!3594) b!50021))

(assert (= (and d!15882 (not c!3594)) b!50022))

(assert (= (and d!15882 res!41853) b!50024))

(assert (= (and b!50024 res!41851) b!50023))

(assert (= (and b!50023 res!41852) b!50025))

(declare-fun m!78653 () Bool)

(assert (=> b!50023 m!78653))

(declare-fun m!78655 () Bool)

(assert (=> b!50021 m!78655))

(declare-fun m!78657 () Bool)

(assert (=> b!50021 m!78657))

(declare-fun m!78659 () Bool)

(assert (=> b!50021 m!78659))

(declare-fun m!78661 () Bool)

(assert (=> b!50025 m!78661))

(declare-fun m!78663 () Bool)

(assert (=> b!50025 m!78663))

(assert (=> b!50025 m!78655))

(declare-fun m!78665 () Bool)

(assert (=> b!50024 m!78665))

(declare-fun m!78667 () Bool)

(assert (=> d!15882 m!78667))

(declare-fun m!78669 () Bool)

(assert (=> d!15882 m!78669))

(declare-fun m!78671 () Bool)

(assert (=> d!15882 m!78671))

(declare-fun m!78673 () Bool)

(assert (=> d!15882 m!78673))

(declare-fun m!78675 () Bool)

(assert (=> d!15882 m!78675))

(declare-fun m!78677 () Bool)

(assert (=> d!15882 m!78677))

(declare-fun m!78679 () Bool)

(assert (=> d!15882 m!78679))

(declare-fun m!78681 () Bool)

(assert (=> d!15882 m!78681))

(declare-fun m!78683 () Bool)

(assert (=> d!15882 m!78683))

(declare-fun m!78685 () Bool)

(assert (=> d!15882 m!78685))

(declare-fun m!78687 () Bool)

(assert (=> d!15882 m!78687))

(assert (=> bm!610 d!15882))

(declare-fun d!15884 () Bool)

(assert (=> d!15884 (isPrefixOf!0 lt!76444 (_2!2399 lt!75756))))

(declare-fun lt!77814 () Unit!3416)

(assert (=> d!15884 (= lt!77814 (choose!30 lt!76444 (_2!2399 lt!75747) (_2!2399 lt!75756)))))

(assert (=> d!15884 (isPrefixOf!0 lt!76444 (_2!2399 lt!75747))))

(assert (=> d!15884 (= (lemmaIsPrefixTransitive!0 lt!76444 (_2!2399 lt!75747) (_2!2399 lt!75756)) lt!77814)))

(declare-fun bs!3987 () Bool)

(assert (= bs!3987 d!15884))

(assert (=> bs!3987 m!76473))

(declare-fun m!78689 () Bool)

(assert (=> bs!3987 m!78689))

(declare-fun m!78691 () Bool)

(assert (=> bs!3987 m!78691))

(assert (=> d!15050 d!15884))

(assert (=> d!15050 d!14948))

(declare-fun d!15886 () Bool)

(assert (=> d!15886 (isPrefixOf!0 lt!76444 (_2!2399 lt!75756))))

(declare-fun lt!77815 () Unit!3416)

(assert (=> d!15886 (= lt!77815 (choose!30 lt!76444 (_2!2399 lt!75756) (_2!2399 lt!75756)))))

(assert (=> d!15886 (isPrefixOf!0 lt!76444 (_2!2399 lt!75756))))

(assert (=> d!15886 (= (lemmaIsPrefixTransitive!0 lt!76444 (_2!2399 lt!75756) (_2!2399 lt!75756)) lt!77815)))

(declare-fun bs!3988 () Bool)

(assert (= bs!3988 d!15886))

(assert (=> bs!3988 m!76473))

(declare-fun m!78693 () Bool)

(assert (=> bs!3988 m!78693))

(assert (=> bs!3988 m!76473))

(assert (=> d!15050 d!15886))

(declare-fun d!15888 () Bool)

(assert (=> d!15888 (isPrefixOf!0 lt!76444 lt!76444)))

(declare-fun lt!77816 () Unit!3416)

(assert (=> d!15888 (= lt!77816 (choose!11 lt!76444))))

(assert (=> d!15888 (= (lemmaIsPrefixRefl!0 lt!76444) lt!77816)))

(declare-fun bs!3989 () Bool)

(assert (= bs!3989 d!15888))

(assert (=> bs!3989 m!76477))

(declare-fun m!78695 () Bool)

(assert (=> bs!3989 m!78695))

(assert (=> d!15050 d!15888))

(assert (=> d!15050 d!15854))

(declare-fun d!15890 () Bool)

(declare-fun res!41856 () Bool)

(declare-fun e!33007 () Bool)

(assert (=> d!15890 (=> (not res!41856) (not e!33007))))

(assert (=> d!15890 (= res!41856 (= (size!1049 (buf!1401 lt!76444)) (size!1049 (buf!1401 lt!76444))))))

(assert (=> d!15890 (= (isPrefixOf!0 lt!76444 lt!76444) e!33007)))

(declare-fun b!50026 () Bool)

(declare-fun res!41855 () Bool)

(assert (=> b!50026 (=> (not res!41855) (not e!33007))))

(assert (=> b!50026 (= res!41855 (bvsle (bitIndex!0 (size!1049 (buf!1401 lt!76444)) (currentByte!2918 lt!76444) (currentBit!2913 lt!76444)) (bitIndex!0 (size!1049 (buf!1401 lt!76444)) (currentByte!2918 lt!76444) (currentBit!2913 lt!76444))))))

(declare-fun b!50027 () Bool)

(declare-fun e!33006 () Bool)

(assert (=> b!50027 (= e!33007 e!33006)))

(declare-fun res!41854 () Bool)

(assert (=> b!50027 (=> res!41854 e!33006)))

(assert (=> b!50027 (= res!41854 (= (size!1049 (buf!1401 lt!76444)) #b00000000000000000000000000000000))))

(declare-fun b!50028 () Bool)

(assert (=> b!50028 (= e!33006 (arrayBitRangesEq!0 (buf!1401 lt!76444) (buf!1401 lt!76444) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 lt!76444)) (currentByte!2918 lt!76444) (currentBit!2913 lt!76444))))))

(assert (= (and d!15890 res!41856) b!50026))

(assert (= (and b!50026 res!41855) b!50027))

(assert (= (and b!50027 (not res!41854)) b!50028))

(declare-fun m!78697 () Bool)

(assert (=> b!50026 m!78697))

(assert (=> b!50026 m!78697))

(assert (=> b!50028 m!78697))

(assert (=> b!50028 m!78697))

(declare-fun m!78699 () Bool)

(assert (=> b!50028 m!78699))

(assert (=> d!15050 d!15890))

(assert (=> d!15050 d!15822))

(declare-fun d!15892 () Bool)

(declare-fun res!41859 () Bool)

(declare-fun e!33009 () Bool)

(assert (=> d!15892 (=> (not res!41859) (not e!33009))))

(assert (=> d!15892 (= res!41859 (= (size!1049 (buf!1401 (_1!2400 lt!76445))) (size!1049 (buf!1401 (_2!2400 lt!76445)))))))

(assert (=> d!15892 (= (isPrefixOf!0 (_1!2400 lt!76445) (_2!2400 lt!76445)) e!33009)))

(declare-fun b!50029 () Bool)

(declare-fun res!41858 () Bool)

(assert (=> b!50029 (=> (not res!41858) (not e!33009))))

(assert (=> b!50029 (= res!41858 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76445))) (currentByte!2918 (_1!2400 lt!76445)) (currentBit!2913 (_1!2400 lt!76445))) (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76445))) (currentByte!2918 (_2!2400 lt!76445)) (currentBit!2913 (_2!2400 lt!76445)))))))

(declare-fun b!50030 () Bool)

(declare-fun e!33008 () Bool)

(assert (=> b!50030 (= e!33009 e!33008)))

(declare-fun res!41857 () Bool)

(assert (=> b!50030 (=> res!41857 e!33008)))

(assert (=> b!50030 (= res!41857 (= (size!1049 (buf!1401 (_1!2400 lt!76445))) #b00000000000000000000000000000000))))

(declare-fun b!50031 () Bool)

(assert (=> b!50031 (= e!33008 (arrayBitRangesEq!0 (buf!1401 (_1!2400 lt!76445)) (buf!1401 (_2!2400 lt!76445)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76445))) (currentByte!2918 (_1!2400 lt!76445)) (currentBit!2913 (_1!2400 lt!76445)))))))

(assert (= (and d!15892 res!41859) b!50029))

(assert (= (and b!50029 res!41858) b!50030))

(assert (= (and b!50030 (not res!41857)) b!50031))

(declare-fun m!78701 () Bool)

(assert (=> b!50029 m!78701))

(assert (=> b!50029 m!78547))

(assert (=> b!50031 m!78701))

(assert (=> b!50031 m!78701))

(declare-fun m!78703 () Bool)

(assert (=> b!50031 m!78703))

(assert (=> d!15050 d!15892))

(assert (=> d!15050 d!15856))

(assert (=> d!15050 d!15818))

(declare-fun d!15894 () Bool)

(declare-fun res!41862 () Bool)

(declare-fun e!33011 () Bool)

(assert (=> d!15894 (=> (not res!41862) (not e!33011))))

(assert (=> d!15894 (= res!41862 (= (size!1049 (buf!1401 lt!76444)) (size!1049 (buf!1401 (_2!2399 lt!75756)))))))

(assert (=> d!15894 (= (isPrefixOf!0 lt!76444 (_2!2399 lt!75756)) e!33011)))

(declare-fun b!50032 () Bool)

(declare-fun res!41861 () Bool)

(assert (=> b!50032 (=> (not res!41861) (not e!33011))))

(assert (=> b!50032 (= res!41861 (bvsle (bitIndex!0 (size!1049 (buf!1401 lt!76444)) (currentByte!2918 lt!76444) (currentBit!2913 lt!76444)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75756))) (currentByte!2918 (_2!2399 lt!75756)) (currentBit!2913 (_2!2399 lt!75756)))))))

(declare-fun b!50033 () Bool)

(declare-fun e!33010 () Bool)

(assert (=> b!50033 (= e!33011 e!33010)))

(declare-fun res!41860 () Bool)

(assert (=> b!50033 (=> res!41860 e!33010)))

(assert (=> b!50033 (= res!41860 (= (size!1049 (buf!1401 lt!76444)) #b00000000000000000000000000000000))))

(declare-fun b!50034 () Bool)

(assert (=> b!50034 (= e!33010 (arrayBitRangesEq!0 (buf!1401 lt!76444) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 lt!76444)) (currentByte!2918 lt!76444) (currentBit!2913 lt!76444))))))

(assert (= (and d!15894 res!41862) b!50032))

(assert (= (and b!50032 res!41861) b!50033))

(assert (= (and b!50033 (not res!41860)) b!50034))

(assert (=> b!50032 m!78697))

(assert (=> b!50032 m!75891))

(assert (=> b!50034 m!78697))

(assert (=> b!50034 m!78697))

(declare-fun m!78705 () Bool)

(assert (=> b!50034 m!78705))

(assert (=> d!15050 d!15894))

(declare-fun d!15896 () Bool)

(assert (=> d!15896 (= (invariant!0 (currentBit!2913 (_2!2399 lt!75984)) (currentByte!2918 (_2!2399 lt!75984)) (size!1049 (buf!1401 (_2!2399 lt!75984)))) (and (bvsge (currentBit!2913 (_2!2399 lt!75984)) #b00000000000000000000000000000000) (bvslt (currentBit!2913 (_2!2399 lt!75984)) #b00000000000000000000000000001000) (bvsge (currentByte!2918 (_2!2399 lt!75984)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2918 (_2!2399 lt!75984)) (size!1049 (buf!1401 (_2!2399 lt!75984)))) (and (= (currentBit!2913 (_2!2399 lt!75984)) #b00000000000000000000000000000000) (= (currentByte!2918 (_2!2399 lt!75984)) (size!1049 (buf!1401 (_2!2399 lt!75984))))))))))

(assert (=> b!48921 d!15896))

(assert (=> d!14984 d!15878))

(declare-fun d!15898 () Bool)

(declare-fun lt!77819 () Int)

(assert (=> d!15898 (>= lt!77819 0)))

(declare-fun e!33014 () Int)

(assert (=> d!15898 (= lt!77819 e!33014)))

(declare-fun c!3597 () Bool)

(assert (=> d!15898 (= c!3597 ((_ is Nil!547) lt!75755))))

(assert (=> d!15898 (= (size!1052 lt!75755) lt!77819)))

(declare-fun b!50039 () Bool)

(assert (=> b!50039 (= e!33014 0)))

(declare-fun b!50040 () Bool)

(assert (=> b!50040 (= e!33014 (+ 1 (size!1052 (t!1300 lt!75755))))))

(assert (= (and d!15898 c!3597) b!50039))

(assert (= (and d!15898 (not c!3597)) b!50040))

(declare-fun m!78707 () Bool)

(assert (=> b!50040 m!78707))

(assert (=> d!15108 d!15898))

(declare-fun d!15900 () Bool)

(assert (=> d!15900 (= (length!245 lt!76522) (size!1052 lt!76522))))

(declare-fun bs!3990 () Bool)

(assert (= bs!3990 d!15900))

(declare-fun m!78709 () Bool)

(assert (=> bs!3990 m!78709))

(assert (=> b!49117 d!15900))

(assert (=> d!15038 d!15880))

(declare-fun lt!77821 () tuple4!24)

(declare-fun b!50041 () Bool)

(declare-fun e!33020 () Bool)

(declare-fun lt!77820 () (_ BitVec 32))

(assert (=> b!50041 (= e!33020 (byteRangesEq!0 (select (arr!1575 (buf!1401 thiss!1379)) (_4!12 lt!77821)) (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_4!12 lt!77821)) #b00000000000000000000000000000000 lt!77820))))

(declare-fun lt!77822 () (_ BitVec 32))

(declare-fun bm!642 () Bool)

(declare-fun call!645 () Bool)

(declare-fun c!3598 () Bool)

(assert (=> bm!642 (= call!645 (byteRangesEq!0 (select (arr!1575 (buf!1401 thiss!1379)) (_3!104 lt!77821)) (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_3!104 lt!77821)) lt!77822 (ite c!3598 lt!77820 #b00000000000000000000000000001000)))))

(declare-fun b!50042 () Bool)

(declare-fun e!33016 () Bool)

(assert (=> b!50042 (= e!33016 (arrayRangesEq!13 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75747)) (_1!2420 lt!77821) (_2!2420 lt!77821)))))

(declare-fun b!50043 () Bool)

(declare-fun e!33015 () Bool)

(declare-fun e!33018 () Bool)

(assert (=> b!50043 (= e!33015 e!33018)))

(declare-fun res!41863 () Bool)

(assert (=> b!50043 (=> (not res!41863) (not e!33018))))

(assert (=> b!50043 (= res!41863 e!33016)))

(declare-fun res!41867 () Bool)

(assert (=> b!50043 (=> res!41867 e!33016)))

(assert (=> b!50043 (= res!41867 (bvsge (_1!2420 lt!77821) (_2!2420 lt!77821)))))

(assert (=> b!50043 (= lt!77820 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50043 (= lt!77822 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50043 (= lt!77821 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(declare-fun b!50045 () Bool)

(declare-fun e!33019 () Bool)

(assert (=> b!50045 (= e!33019 call!645)))

(declare-fun b!50046 () Bool)

(declare-fun e!33017 () Bool)

(assert (=> b!50046 (= e!33019 e!33017)))

(declare-fun res!41866 () Bool)

(assert (=> b!50046 (= res!41866 call!645)))

(assert (=> b!50046 (=> (not res!41866) (not e!33017))))

(declare-fun b!50047 () Bool)

(declare-fun res!41865 () Bool)

(assert (=> b!50047 (= res!41865 (= lt!77820 #b00000000000000000000000000000000))))

(assert (=> b!50047 (=> res!41865 e!33020)))

(assert (=> b!50047 (= e!33017 e!33020)))

(declare-fun b!50044 () Bool)

(assert (=> b!50044 (= e!33018 e!33019)))

(assert (=> b!50044 (= c!3598 (= (_3!104 lt!77821) (_4!12 lt!77821)))))

(declare-fun d!15902 () Bool)

(declare-fun res!41864 () Bool)

(assert (=> d!15902 (=> res!41864 e!33015)))

(assert (=> d!15902 (= res!41864 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (=> d!15902 (= (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))) e!33015)))

(assert (= (and d!15902 (not res!41864)) b!50043))

(assert (= (and b!50043 (not res!41867)) b!50042))

(assert (= (and b!50043 res!41863) b!50044))

(assert (= (and b!50044 c!3598) b!50045))

(assert (= (and b!50044 (not c!3598)) b!50046))

(assert (= (and b!50046 res!41866) b!50047))

(assert (= (and b!50047 (not res!41865)) b!50041))

(assert (= (or b!50045 b!50046) bm!642))

(declare-fun m!78711 () Bool)

(assert (=> b!50041 m!78711))

(declare-fun m!78713 () Bool)

(assert (=> b!50041 m!78713))

(assert (=> b!50041 m!78711))

(assert (=> b!50041 m!78713))

(declare-fun m!78715 () Bool)

(assert (=> b!50041 m!78715))

(declare-fun m!78717 () Bool)

(assert (=> bm!642 m!78717))

(declare-fun m!78719 () Bool)

(assert (=> bm!642 m!78719))

(assert (=> bm!642 m!78717))

(assert (=> bm!642 m!78719))

(declare-fun m!78721 () Bool)

(assert (=> bm!642 m!78721))

(declare-fun m!78723 () Bool)

(assert (=> b!50042 m!78723))

(assert (=> b!50043 m!75897))

(declare-fun m!78725 () Bool)

(assert (=> b!50043 m!78725))

(assert (=> b!48957 d!15902))

(assert (=> b!48957 d!14982))

(assert (=> d!14980 d!14978))

(declare-fun d!15904 () Bool)

(assert (=> d!15904 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15904 true))

(declare-fun _$14!244 () Unit!3416)

(assert (=> d!15904 (= (choose!11 thiss!1379) _$14!244)))

(declare-fun bs!3992 () Bool)

(assert (= bs!3992 d!15904))

(assert (=> bs!3992 m!75893))

(assert (=> d!14980 d!15904))

(declare-fun d!15906 () Bool)

(declare-fun res!41870 () Bool)

(declare-fun e!33022 () Bool)

(assert (=> d!15906 (=> (not res!41870) (not e!33022))))

(assert (=> d!15906 (= res!41870 (= (size!1049 (buf!1401 (_1!2400 lt!76418))) (size!1049 (buf!1401 thiss!1379))))))

(assert (=> d!15906 (= (isPrefixOf!0 (_1!2400 lt!76418) thiss!1379) e!33022)))

(declare-fun b!50048 () Bool)

(declare-fun res!41869 () Bool)

(assert (=> b!50048 (=> (not res!41869) (not e!33022))))

(assert (=> b!50048 (= res!41869 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76418))) (currentByte!2918 (_1!2400 lt!76418)) (currentBit!2913 (_1!2400 lt!76418))) (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(declare-fun b!50049 () Bool)

(declare-fun e!33021 () Bool)

(assert (=> b!50049 (= e!33022 e!33021)))

(declare-fun res!41868 () Bool)

(assert (=> b!50049 (=> res!41868 e!33021)))

(assert (=> b!50049 (= res!41868 (= (size!1049 (buf!1401 (_1!2400 lt!76418))) #b00000000000000000000000000000000))))

(declare-fun b!50050 () Bool)

(assert (=> b!50050 (= e!33021 (arrayBitRangesEq!0 (buf!1401 (_1!2400 lt!76418)) (buf!1401 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76418))) (currentByte!2918 (_1!2400 lt!76418)) (currentBit!2913 (_1!2400 lt!76418)))))))

(assert (= (and d!15906 res!41870) b!50048))

(assert (= (and b!50048 res!41869) b!50049))

(assert (= (and b!50049 (not res!41868)) b!50050))

(assert (=> b!50048 m!78555))

(assert (=> b!50048 m!75897))

(assert (=> b!50050 m!78555))

(assert (=> b!50050 m!78555))

(declare-fun m!78727 () Bool)

(assert (=> b!50050 m!78727))

(assert (=> b!49056 d!15906))

(assert (=> b!49039 d!15714))

(assert (=> b!49039 d!14982))

(declare-fun d!15908 () Bool)

(assert (=> d!15908 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75983) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) lt!75983))))

(declare-fun bs!3993 () Bool)

(assert (= bs!3993 d!15908))

(assert (=> bs!3993 m!76225))

(assert (=> b!48928 d!15908))

(assert (=> b!49066 d!14988))

(declare-fun d!15910 () Bool)

(assert (=> d!15910 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 (_2!2399 lt!75747)) lt!76453 lt!76439)))

(declare-fun lt!77823 () Unit!3416)

(assert (=> d!15910 (= lt!77823 (choose!8 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75756)) lt!76453 lt!76439))))

(assert (=> d!15910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76453) (bvsle lt!76453 lt!76439))))

(assert (=> d!15910 (= (arrayBitRangesEqSymmetric!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75756)) lt!76453 lt!76439) lt!77823)))

(declare-fun bs!3994 () Bool)

(assert (= bs!3994 d!15910))

(assert (=> bs!3994 m!76465))

(declare-fun m!78729 () Bool)

(assert (=> bs!3994 m!78729))

(assert (=> b!49066 d!15910))

(declare-fun e!33028 () Bool)

(declare-fun lt!77824 () (_ BitVec 32))

(declare-fun lt!77825 () tuple4!24)

(declare-fun b!50051 () Bool)

(assert (=> b!50051 (= e!33028 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_4!12 lt!77825)) (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_4!12 lt!77825)) #b00000000000000000000000000000000 lt!77824))))

(declare-fun bm!643 () Bool)

(declare-fun c!3599 () Bool)

(declare-fun call!646 () Bool)

(declare-fun lt!77826 () (_ BitVec 32))

(assert (=> bm!643 (= call!646 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_3!104 lt!77825)) (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_3!104 lt!77825)) lt!77826 (ite c!3599 lt!77824 #b00000000000000000000000000001000)))))

(declare-fun b!50052 () Bool)

(declare-fun e!33024 () Bool)

(assert (=> b!50052 (= e!33024 (arrayRangesEq!13 (buf!1401 (_2!2399 lt!75756)) (buf!1401 (_2!2399 lt!75747)) (_1!2420 lt!77825) (_2!2420 lt!77825)))))

(declare-fun b!50053 () Bool)

(declare-fun e!33023 () Bool)

(declare-fun e!33026 () Bool)

(assert (=> b!50053 (= e!33023 e!33026)))

(declare-fun res!41871 () Bool)

(assert (=> b!50053 (=> (not res!41871) (not e!33026))))

(assert (=> b!50053 (= res!41871 e!33024)))

(declare-fun res!41875 () Bool)

(assert (=> b!50053 (=> res!41875 e!33024)))

(assert (=> b!50053 (= res!41875 (bvsge (_1!2420 lt!77825) (_2!2420 lt!77825)))))

(assert (=> b!50053 (= lt!77824 ((_ extract 31 0) (bvsrem lt!76439 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50053 (= lt!77826 ((_ extract 31 0) (bvsrem lt!76453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50053 (= lt!77825 (arrayBitIndices!0 lt!76453 lt!76439))))

(declare-fun b!50055 () Bool)

(declare-fun e!33027 () Bool)

(assert (=> b!50055 (= e!33027 call!646)))

(declare-fun b!50056 () Bool)

(declare-fun e!33025 () Bool)

(assert (=> b!50056 (= e!33027 e!33025)))

(declare-fun res!41874 () Bool)

(assert (=> b!50056 (= res!41874 call!646)))

(assert (=> b!50056 (=> (not res!41874) (not e!33025))))

(declare-fun b!50057 () Bool)

(declare-fun res!41873 () Bool)

(assert (=> b!50057 (= res!41873 (= lt!77824 #b00000000000000000000000000000000))))

(assert (=> b!50057 (=> res!41873 e!33028)))

(assert (=> b!50057 (= e!33025 e!33028)))

(declare-fun b!50054 () Bool)

(assert (=> b!50054 (= e!33026 e!33027)))

(assert (=> b!50054 (= c!3599 (= (_3!104 lt!77825) (_4!12 lt!77825)))))

(declare-fun d!15912 () Bool)

(declare-fun res!41872 () Bool)

(assert (=> d!15912 (=> res!41872 e!33023)))

(assert (=> d!15912 (= res!41872 (bvsge lt!76453 lt!76439))))

(assert (=> d!15912 (= (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75756)) (buf!1401 (_2!2399 lt!75747)) lt!76453 lt!76439) e!33023)))

(assert (= (and d!15912 (not res!41872)) b!50053))

(assert (= (and b!50053 (not res!41875)) b!50052))

(assert (= (and b!50053 res!41871) b!50054))

(assert (= (and b!50054 c!3599) b!50055))

(assert (= (and b!50054 (not c!3599)) b!50056))

(assert (= (and b!50056 res!41874) b!50057))

(assert (= (and b!50057 (not res!41873)) b!50051))

(assert (= (or b!50055 b!50056) bm!643))

(declare-fun m!78731 () Bool)

(assert (=> b!50051 m!78731))

(declare-fun m!78733 () Bool)

(assert (=> b!50051 m!78733))

(assert (=> b!50051 m!78731))

(assert (=> b!50051 m!78733))

(declare-fun m!78735 () Bool)

(assert (=> b!50051 m!78735))

(declare-fun m!78737 () Bool)

(assert (=> bm!643 m!78737))

(declare-fun m!78739 () Bool)

(assert (=> bm!643 m!78739))

(assert (=> bm!643 m!78737))

(assert (=> bm!643 m!78739))

(declare-fun m!78741 () Bool)

(assert (=> bm!643 m!78741))

(declare-fun m!78743 () Bool)

(assert (=> b!50052 m!78743))

(declare-fun m!78745 () Bool)

(assert (=> b!50053 m!78745))

(assert (=> b!49066 d!15912))

(declare-fun d!15914 () Bool)

(assert (=> d!15914 (= (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75756))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75756)))) (bvsub (bvmul ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75756)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75756))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75756))))))))

(assert (=> d!14940 d!15914))

(assert (=> d!14940 d!15104))

(declare-fun d!15916 () Bool)

(assert (=> d!15916 (= (isEmpty!143 lt!76532) ((_ is Nil!547) lt!76532))))

(assert (=> b!49132 d!15916))

(declare-fun d!15918 () Bool)

(declare-fun e!33029 () Bool)

(assert (=> d!15918 e!33029))

(declare-fun res!41876 () Bool)

(assert (=> d!15918 (=> (not res!41876) (not e!33029))))

(declare-fun lt!77828 () (_ BitVec 64))

(declare-fun lt!77827 () BitStream!1818)

(assert (=> d!15918 (= res!41876 (= (bvadd lt!77828 (bvsub lt!76062 lt!76066)) (bitIndex!0 (size!1049 (buf!1401 lt!77827)) (currentByte!2918 lt!77827) (currentBit!2913 lt!77827))))))

(assert (=> d!15918 (or (not (= (bvand lt!77828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76062 lt!76066) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77828 (bvsub lt!76062 lt!76066)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15918 (= lt!77828 (bitIndex!0 (size!1049 (buf!1401 (_2!2400 lt!76061))) (currentByte!2918 (_2!2400 lt!76061)) (currentBit!2913 (_2!2400 lt!76061))))))

(assert (=> d!15918 (= lt!77827 (_2!2399 (moveBitIndex!0 (_2!2400 lt!76061) (bvsub lt!76062 lt!76066))))))

(assert (=> d!15918 (moveBitIndexPrecond!0 (_2!2400 lt!76061) (bvsub lt!76062 lt!76066))))

(assert (=> d!15918 (= (withMovedBitIndex!0 (_2!2400 lt!76061) (bvsub lt!76062 lt!76066)) lt!77827)))

(declare-fun b!50058 () Bool)

(assert (=> b!50058 (= e!33029 (= (size!1049 (buf!1401 (_2!2400 lt!76061))) (size!1049 (buf!1401 lt!77827))))))

(assert (= (and d!15918 res!41876) b!50058))

(declare-fun m!78747 () Bool)

(assert (=> d!15918 m!78747))

(assert (=> d!15918 m!78605))

(declare-fun m!78749 () Bool)

(assert (=> d!15918 m!78749))

(declare-fun m!78751 () Bool)

(assert (=> d!15918 m!78751))

(assert (=> b!48943 d!15918))

(assert (=> b!48943 d!14988))

(assert (=> b!48943 d!14982))

(declare-fun b!50059 () Bool)

(declare-fun e!33030 () Unit!3416)

(declare-fun lt!77834 () Unit!3416)

(assert (=> b!50059 (= e!33030 lt!77834)))

(declare-fun lt!77845 () (_ BitVec 64))

(assert (=> b!50059 (= lt!77845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77831 () (_ BitVec 64))

(assert (=> b!50059 (= lt!77831 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> b!50059 (= lt!77834 (arrayBitRangesEqSymmetric!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75984)) lt!77845 lt!77831))))

(assert (=> b!50059 (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75984)) (buf!1401 (_2!2399 lt!75747)) lt!77845 lt!77831)))

(declare-fun b!50060 () Bool)

(declare-fun Unit!3482 () Unit!3416)

(assert (=> b!50060 (= e!33030 Unit!3482)))

(declare-fun d!15920 () Bool)

(declare-fun e!33031 () Bool)

(assert (=> d!15920 e!33031))

(declare-fun res!41879 () Bool)

(assert (=> d!15920 (=> (not res!41879) (not e!33031))))

(declare-fun lt!77837 () tuple2!4602)

(assert (=> d!15920 (= res!41879 (isPrefixOf!0 (_1!2400 lt!77837) (_2!2400 lt!77837)))))

(declare-fun lt!77836 () BitStream!1818)

(assert (=> d!15920 (= lt!77837 (tuple2!4603 lt!77836 (_2!2399 lt!75984)))))

(declare-fun lt!77840 () Unit!3416)

(declare-fun lt!77830 () Unit!3416)

(assert (=> d!15920 (= lt!77840 lt!77830)))

(assert (=> d!15920 (isPrefixOf!0 lt!77836 (_2!2399 lt!75984))))

(assert (=> d!15920 (= lt!77830 (lemmaIsPrefixTransitive!0 lt!77836 (_2!2399 lt!75984) (_2!2399 lt!75984)))))

(declare-fun lt!77833 () Unit!3416)

(declare-fun lt!77847 () Unit!3416)

(assert (=> d!15920 (= lt!77833 lt!77847)))

(assert (=> d!15920 (isPrefixOf!0 lt!77836 (_2!2399 lt!75984))))

(assert (=> d!15920 (= lt!77847 (lemmaIsPrefixTransitive!0 lt!77836 (_2!2399 lt!75747) (_2!2399 lt!75984)))))

(declare-fun lt!77846 () Unit!3416)

(assert (=> d!15920 (= lt!77846 e!33030)))

(declare-fun c!3600 () Bool)

(assert (=> d!15920 (= c!3600 (not (= (size!1049 (buf!1401 (_2!2399 lt!75747))) #b00000000000000000000000000000000)))))

(declare-fun lt!77835 () Unit!3416)

(declare-fun lt!77829 () Unit!3416)

(assert (=> d!15920 (= lt!77835 lt!77829)))

(assert (=> d!15920 (isPrefixOf!0 (_2!2399 lt!75984) (_2!2399 lt!75984))))

(assert (=> d!15920 (= lt!77829 (lemmaIsPrefixRefl!0 (_2!2399 lt!75984)))))

(declare-fun lt!77832 () Unit!3416)

(declare-fun lt!77843 () Unit!3416)

(assert (=> d!15920 (= lt!77832 lt!77843)))

(assert (=> d!15920 (= lt!77843 (lemmaIsPrefixRefl!0 (_2!2399 lt!75984)))))

(declare-fun lt!77841 () Unit!3416)

(declare-fun lt!77839 () Unit!3416)

(assert (=> d!15920 (= lt!77841 lt!77839)))

(assert (=> d!15920 (isPrefixOf!0 lt!77836 lt!77836)))

(assert (=> d!15920 (= lt!77839 (lemmaIsPrefixRefl!0 lt!77836))))

(declare-fun lt!77844 () Unit!3416)

(declare-fun lt!77848 () Unit!3416)

(assert (=> d!15920 (= lt!77844 lt!77848)))

(assert (=> d!15920 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75747))))

(assert (=> d!15920 (= lt!77848 (lemmaIsPrefixRefl!0 (_2!2399 lt!75747)))))

(assert (=> d!15920 (= lt!77836 (BitStream!1819 (buf!1401 (_2!2399 lt!75984)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (=> d!15920 (isPrefixOf!0 (_2!2399 lt!75747) (_2!2399 lt!75984))))

(assert (=> d!15920 (= (reader!0 (_2!2399 lt!75747) (_2!2399 lt!75984)) lt!77837)))

(declare-fun b!50061 () Bool)

(declare-fun res!41878 () Bool)

(assert (=> b!50061 (=> (not res!41878) (not e!33031))))

(assert (=> b!50061 (= res!41878 (isPrefixOf!0 (_2!2400 lt!77837) (_2!2399 lt!75984)))))

(declare-fun b!50062 () Bool)

(declare-fun res!41877 () Bool)

(assert (=> b!50062 (=> (not res!41877) (not e!33031))))

(assert (=> b!50062 (= res!41877 (isPrefixOf!0 (_1!2400 lt!77837) (_2!2399 lt!75747)))))

(declare-fun lt!77842 () (_ BitVec 64))

(declare-fun lt!77838 () (_ BitVec 64))

(declare-fun b!50063 () Bool)

(assert (=> b!50063 (= e!33031 (= (_1!2400 lt!77837) (withMovedBitIndex!0 (_2!2400 lt!77837) (bvsub lt!77838 lt!77842))))))

(assert (=> b!50063 (or (= (bvand lt!77838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77842 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77838 lt!77842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!50063 (= lt!77842 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75984))) (currentByte!2918 (_2!2399 lt!75984)) (currentBit!2913 (_2!2399 lt!75984))))))

(assert (=> b!50063 (= lt!77838 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))))))

(assert (= (and d!15920 c!3600) b!50059))

(assert (= (and d!15920 (not c!3600)) b!50060))

(assert (= (and d!15920 res!41879) b!50062))

(assert (= (and b!50062 res!41877) b!50061))

(assert (= (and b!50061 res!41878) b!50063))

(declare-fun m!78753 () Bool)

(assert (=> b!50061 m!78753))

(assert (=> b!50059 m!75915))

(declare-fun m!78755 () Bool)

(assert (=> b!50059 m!78755))

(declare-fun m!78757 () Bool)

(assert (=> b!50059 m!78757))

(declare-fun m!78759 () Bool)

(assert (=> b!50063 m!78759))

(assert (=> b!50063 m!76101))

(assert (=> b!50063 m!75915))

(declare-fun m!78761 () Bool)

(assert (=> b!50062 m!78761))

(declare-fun m!78763 () Bool)

(assert (=> d!15920 m!78763))

(declare-fun m!78765 () Bool)

(assert (=> d!15920 m!78765))

(assert (=> d!15920 m!76179))

(declare-fun m!78767 () Bool)

(assert (=> d!15920 m!78767))

(declare-fun m!78769 () Bool)

(assert (=> d!15920 m!78769))

(assert (=> d!15920 m!76105))

(declare-fun m!78771 () Bool)

(assert (=> d!15920 m!78771))

(assert (=> d!15920 m!76103))

(declare-fun m!78773 () Bool)

(assert (=> d!15920 m!78773))

(declare-fun m!78775 () Bool)

(assert (=> d!15920 m!78775))

(declare-fun m!78777 () Bool)

(assert (=> d!15920 m!78777))

(assert (=> b!48926 d!15920))

(declare-fun d!15922 () Bool)

(assert (=> d!15922 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75983) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747)))) lt!75983))))

(declare-fun bs!3995 () Bool)

(assert (= bs!3995 d!15922))

(declare-fun m!78779 () Bool)

(assert (=> bs!3995 m!78779))

(assert (=> b!48926 d!15922))

(declare-fun d!15924 () Bool)

(assert (=> d!15924 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) lt!75983)))

(declare-fun lt!77849 () Unit!3416)

(assert (=> d!15924 (= lt!77849 (choose!9 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75984)) lt!75983 (BitStream!1819 (buf!1401 (_2!2399 lt!75984)) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (=> d!15924 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2399 lt!75747) (buf!1401 (_2!2399 lt!75984)) lt!75983) lt!77849)))

(declare-fun bs!3996 () Bool)

(assert (= bs!3996 d!15924))

(assert (=> bs!3996 m!76181))

(declare-fun m!78781 () Bool)

(assert (=> bs!3996 m!78781))

(assert (=> b!48926 d!15924))

(declare-fun lt!77851 () (_ BitVec 64))

(declare-fun e!33033 () tuple2!4616)

(declare-fun b!50065 () Bool)

(declare-fun lt!77852 () tuple2!4614)

(assert (=> b!50065 (= e!33033 (tuple2!4617 (Cons!546 (_1!2406 lt!77852) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75984) (_2!2406 lt!77852) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77851))) (_2!2406 lt!77852)))))

(assert (=> b!50065 (= lt!77852 (readBit!0 (_1!2400 lt!75969)))))

(assert (=> b!50065 (= lt!77851 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15926 () Bool)

(declare-fun e!33032 () Bool)

(assert (=> d!15926 e!33032))

(declare-fun c!3602 () Bool)

(assert (=> d!15926 (= c!3602 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77850 () List!550)

(assert (=> d!15926 (= lt!77850 (_1!2407 e!33033))))

(declare-fun c!3601 () Bool)

(assert (=> d!15926 (= c!3601 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15926 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15926 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75984) (_1!2400 lt!75969) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77850)))

(declare-fun b!50066 () Bool)

(assert (=> b!50066 (= e!33032 (isEmpty!143 lt!77850))))

(declare-fun b!50067 () Bool)

(assert (=> b!50067 (= e!33032 (> (length!245 lt!77850) 0))))

(declare-fun b!50064 () Bool)

(assert (=> b!50064 (= e!33033 (tuple2!4617 Nil!547 (_1!2400 lt!75969)))))

(assert (= (and d!15926 c!3601) b!50064))

(assert (= (and d!15926 (not c!3601)) b!50065))

(assert (= (and d!15926 c!3602) b!50066))

(assert (= (and d!15926 (not c!3602)) b!50067))

(declare-fun m!78783 () Bool)

(assert (=> b!50065 m!78783))

(declare-fun m!78785 () Bool)

(assert (=> b!50065 m!78785))

(declare-fun m!78787 () Bool)

(assert (=> b!50066 m!78787))

(declare-fun m!78789 () Bool)

(assert (=> b!50067 m!78789))

(assert (=> b!48926 d!15926))

(declare-fun d!15928 () Bool)

(declare-fun c!3603 () Bool)

(assert (=> d!15928 (= c!3603 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33034 () List!550)

(assert (=> d!15928 (= (byteArrayBitContentToList!0 (_2!2399 lt!75984) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!33034)))

(declare-fun b!50068 () Bool)

(assert (=> b!50068 (= e!33034 Nil!547)))

(declare-fun b!50069 () Bool)

(assert (=> b!50069 (= e!33034 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75984) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15928 c!3603) b!50068))

(assert (= (and d!15928 (not c!3603)) b!50069))

(assert (=> b!50069 m!76125))

(assert (=> b!50069 m!78339))

(declare-fun m!78791 () Bool)

(assert (=> b!50069 m!78791))

(assert (=> b!48926 d!15928))

(assert (=> b!48944 d!14982))

(declare-fun d!15930 () Bool)

(assert (=> d!15930 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_1!2400 lt!75750) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!236 lt!75755))))

(assert (=> d!15930 true))

(declare-fun _$34!47 () Unit!3416)

(assert (=> d!15930 (= (choose!42 (_2!2399 lt!75756) (_2!2399 lt!75756) (_1!2400 lt!75754) (_1!2400 lt!75750) (bvsub to!314 i!635) lt!75755) _$34!47)))

(declare-fun bs!3997 () Bool)

(assert (= bs!3997 d!15930))

(assert (=> bs!3997 m!76071))

(assert (=> bs!3997 m!75959))

(assert (=> d!14944 d!15930))

(declare-fun lt!77854 () tuple4!24)

(declare-fun e!33040 () Bool)

(declare-fun lt!77853 () (_ BitVec 32))

(declare-fun b!50070 () Bool)

(assert (=> b!50070 (= e!33040 (byteRangesEq!0 (select (arr!1575 (buf!1401 thiss!1379)) (_4!12 lt!77854)) (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_4!12 lt!77854)) #b00000000000000000000000000000000 lt!77853))))

(declare-fun call!647 () Bool)

(declare-fun c!3604 () Bool)

(declare-fun bm!644 () Bool)

(declare-fun lt!77855 () (_ BitVec 32))

(assert (=> bm!644 (= call!647 (byteRangesEq!0 (select (arr!1575 (buf!1401 thiss!1379)) (_3!104 lt!77854)) (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_3!104 lt!77854)) lt!77855 (ite c!3604 lt!77853 #b00000000000000000000000000001000)))))

(declare-fun b!50071 () Bool)

(declare-fun e!33036 () Bool)

(assert (=> b!50071 (= e!33036 (arrayRangesEq!13 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75756)) (_1!2420 lt!77854) (_2!2420 lt!77854)))))

(declare-fun b!50072 () Bool)

(declare-fun e!33035 () Bool)

(declare-fun e!33038 () Bool)

(assert (=> b!50072 (= e!33035 e!33038)))

(declare-fun res!41880 () Bool)

(assert (=> b!50072 (=> (not res!41880) (not e!33038))))

(assert (=> b!50072 (= res!41880 e!33036)))

(declare-fun res!41884 () Bool)

(assert (=> b!50072 (=> res!41884 e!33036)))

(assert (=> b!50072 (= res!41884 (bvsge (_1!2420 lt!77854) (_2!2420 lt!77854)))))

(assert (=> b!50072 (= lt!77853 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50072 (= lt!77855 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50072 (= lt!77854 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(declare-fun b!50074 () Bool)

(declare-fun e!33039 () Bool)

(assert (=> b!50074 (= e!33039 call!647)))

(declare-fun b!50075 () Bool)

(declare-fun e!33037 () Bool)

(assert (=> b!50075 (= e!33039 e!33037)))

(declare-fun res!41883 () Bool)

(assert (=> b!50075 (= res!41883 call!647)))

(assert (=> b!50075 (=> (not res!41883) (not e!33037))))

(declare-fun b!50076 () Bool)

(declare-fun res!41882 () Bool)

(assert (=> b!50076 (= res!41882 (= lt!77853 #b00000000000000000000000000000000))))

(assert (=> b!50076 (=> res!41882 e!33040)))

(assert (=> b!50076 (= e!33037 e!33040)))

(declare-fun b!50073 () Bool)

(assert (=> b!50073 (= e!33038 e!33039)))

(assert (=> b!50073 (= c!3604 (= (_3!104 lt!77854) (_4!12 lt!77854)))))

(declare-fun d!15932 () Bool)

(declare-fun res!41881 () Bool)

(assert (=> d!15932 (=> res!41881 e!33035)))

(assert (=> d!15932 (= res!41881 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (=> d!15932 (= (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))) e!33035)))

(assert (= (and d!15932 (not res!41881)) b!50072))

(assert (= (and b!50072 (not res!41884)) b!50071))

(assert (= (and b!50072 res!41880) b!50073))

(assert (= (and b!50073 c!3604) b!50074))

(assert (= (and b!50073 (not c!3604)) b!50075))

(assert (= (and b!50075 res!41883) b!50076))

(assert (= (and b!50076 (not res!41882)) b!50070))

(assert (= (or b!50074 b!50075) bm!644))

(declare-fun m!78793 () Bool)

(assert (=> b!50070 m!78793))

(declare-fun m!78795 () Bool)

(assert (=> b!50070 m!78795))

(assert (=> b!50070 m!78793))

(assert (=> b!50070 m!78795))

(declare-fun m!78797 () Bool)

(assert (=> b!50070 m!78797))

(declare-fun m!78799 () Bool)

(assert (=> bm!644 m!78799))

(declare-fun m!78801 () Bool)

(assert (=> bm!644 m!78801))

(assert (=> bm!644 m!78799))

(assert (=> bm!644 m!78801))

(declare-fun m!78803 () Bool)

(assert (=> bm!644 m!78803))

(declare-fun m!78805 () Bool)

(assert (=> b!50071 m!78805))

(assert (=> b!50072 m!75897))

(assert (=> b!50072 m!78725))

(assert (=> b!48883 d!15932))

(assert (=> b!48883 d!14982))

(declare-fun d!15934 () Bool)

(declare-fun c!3605 () Bool)

(assert (=> d!15934 (= c!3605 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33041 () List!550)

(assert (=> d!15934 (= (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!33041)))

(declare-fun b!50077 () Bool)

(assert (=> b!50077 (= e!33041 Nil!547)))

(declare-fun b!50078 () Bool)

(assert (=> b!50078 (= e!33041 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75747) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15934 c!3605) b!50077))

(assert (= (and d!15934 (not c!3605)) b!50078))

(declare-fun m!78807 () Bool)

(assert (=> b!50078 m!78807))

(declare-fun m!78809 () Bool)

(assert (=> b!50078 m!78809))

(declare-fun m!78811 () Bool)

(assert (=> b!50078 m!78811))

(assert (=> b!49129 d!15934))

(declare-fun d!15936 () Bool)

(declare-fun res!41887 () Bool)

(declare-fun e!33043 () Bool)

(assert (=> d!15936 (=> (not res!41887) (not e!33043))))

(assert (=> d!15936 (= res!41887 (= (size!1049 (buf!1401 (_1!2400 lt!76445))) (size!1049 (buf!1401 (_2!2399 lt!75747)))))))

(assert (=> d!15936 (= (isPrefixOf!0 (_1!2400 lt!76445) (_2!2399 lt!75747)) e!33043)))

(declare-fun b!50079 () Bool)

(declare-fun res!41886 () Bool)

(assert (=> b!50079 (=> (not res!41886) (not e!33043))))

(assert (=> b!50079 (= res!41886 (bvsle (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76445))) (currentByte!2918 (_1!2400 lt!76445)) (currentBit!2913 (_1!2400 lt!76445))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun b!50080 () Bool)

(declare-fun e!33042 () Bool)

(assert (=> b!50080 (= e!33043 e!33042)))

(declare-fun res!41885 () Bool)

(assert (=> b!50080 (=> res!41885 e!33042)))

(assert (=> b!50080 (= res!41885 (= (size!1049 (buf!1401 (_1!2400 lt!76445))) #b00000000000000000000000000000000))))

(declare-fun b!50081 () Bool)

(assert (=> b!50081 (= e!33042 (arrayBitRangesEq!0 (buf!1401 (_1!2400 lt!76445)) (buf!1401 (_2!2399 lt!75747)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!76445))) (currentByte!2918 (_1!2400 lt!76445)) (currentBit!2913 (_1!2400 lt!76445)))))))

(assert (= (and d!15936 res!41887) b!50079))

(assert (= (and b!50079 res!41886) b!50080))

(assert (= (and b!50080 (not res!41885)) b!50081))

(assert (=> b!50079 m!78701))

(assert (=> b!50079 m!75915))

(assert (=> b!50081 m!78701))

(assert (=> b!50081 m!78701))

(declare-fun m!78813 () Bool)

(assert (=> b!50081 m!78813))

(assert (=> b!49069 d!15936))

(assert (=> b!48881 d!14982))

(assert (=> b!48881 d!14940))

(assert (=> d!14988 d!15828))

(assert (=> d!14988 d!15040))

(declare-fun d!15938 () Bool)

(declare-fun c!3606 () Bool)

(assert (=> d!15938 (= c!3606 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33044 () List!550)

(assert (=> d!15938 (= (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) e!33044)))

(declare-fun b!50082 () Bool)

(assert (=> b!50082 (= e!33044 Nil!547)))

(declare-fun b!50083 () Bool)

(assert (=> b!50083 (= e!33044 (Cons!546 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2399 lt!75756) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15938 c!3606) b!50082))

(assert (= (and d!15938 (not c!3606)) b!50083))

(assert (=> b!50083 m!78807))

(assert (=> b!50083 m!78809))

(declare-fun m!78815 () Bool)

(assert (=> b!50083 m!78815))

(assert (=> b!49127 d!15938))

(declare-fun b!50084 () Bool)

(declare-fun lt!77856 () (_ BitVec 32))

(declare-fun lt!77857 () tuple4!24)

(declare-fun e!33050 () Bool)

(assert (=> b!50084 (= e!33050 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_4!12 lt!77857)) (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_4!12 lt!77857)) #b00000000000000000000000000000000 lt!77856))))

(declare-fun lt!77858 () (_ BitVec 32))

(declare-fun c!3607 () Bool)

(declare-fun bm!645 () Bool)

(declare-fun call!648 () Bool)

(assert (=> bm!645 (= call!648 (byteRangesEq!0 (select (arr!1575 (buf!1401 (_2!2399 lt!75747))) (_3!104 lt!77857)) (select (arr!1575 (buf!1401 (_2!2399 lt!75756))) (_3!104 lt!77857)) lt!77858 (ite c!3607 lt!77856 #b00000000000000000000000000001000)))))

(declare-fun b!50085 () Bool)

(declare-fun e!33046 () Bool)

(assert (=> b!50085 (= e!33046 (arrayRangesEq!13 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75756)) (_1!2420 lt!77857) (_2!2420 lt!77857)))))

(declare-fun b!50086 () Bool)

(declare-fun e!33045 () Bool)

(declare-fun e!33048 () Bool)

(assert (=> b!50086 (= e!33045 e!33048)))

(declare-fun res!41888 () Bool)

(assert (=> b!50086 (=> (not res!41888) (not e!33048))))

(assert (=> b!50086 (= res!41888 e!33046)))

(declare-fun res!41892 () Bool)

(assert (=> b!50086 (=> res!41892 e!33046)))

(assert (=> b!50086 (= res!41892 (bvsge (_1!2420 lt!77857) (_2!2420 lt!77857)))))

(assert (=> b!50086 (= lt!77856 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50086 (= lt!77858 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50086 (= lt!77857 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(declare-fun b!50088 () Bool)

(declare-fun e!33049 () Bool)

(assert (=> b!50088 (= e!33049 call!648)))

(declare-fun b!50089 () Bool)

(declare-fun e!33047 () Bool)

(assert (=> b!50089 (= e!33049 e!33047)))

(declare-fun res!41891 () Bool)

(assert (=> b!50089 (= res!41891 call!648)))

(assert (=> b!50089 (=> (not res!41891) (not e!33047))))

(declare-fun b!50090 () Bool)

(declare-fun res!41890 () Bool)

(assert (=> b!50090 (= res!41890 (= lt!77856 #b00000000000000000000000000000000))))

(assert (=> b!50090 (=> res!41890 e!33050)))

(assert (=> b!50090 (= e!33047 e!33050)))

(declare-fun b!50087 () Bool)

(assert (=> b!50087 (= e!33048 e!33049)))

(assert (=> b!50087 (= c!3607 (= (_3!104 lt!77857) (_4!12 lt!77857)))))

(declare-fun d!15940 () Bool)

(declare-fun res!41889 () Bool)

(assert (=> d!15940 (=> res!41889 e!33045)))

(assert (=> d!15940 (= res!41889 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))))))

(assert (=> d!15940 (= (arrayBitRangesEq!0 (buf!1401 (_2!2399 lt!75747)) (buf!1401 (_2!2399 lt!75756)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75747))) (currentByte!2918 (_2!2399 lt!75747)) (currentBit!2913 (_2!2399 lt!75747)))) e!33045)))

(assert (= (and d!15940 (not res!41889)) b!50086))

(assert (= (and b!50086 (not res!41892)) b!50085))

(assert (= (and b!50086 res!41888) b!50087))

(assert (= (and b!50087 c!3607) b!50088))

(assert (= (and b!50087 (not c!3607)) b!50089))

(assert (= (and b!50089 res!41891) b!50090))

(assert (= (and b!50090 (not res!41890)) b!50084))

(assert (= (or b!50088 b!50089) bm!645))

(declare-fun m!78817 () Bool)

(assert (=> b!50084 m!78817))

(declare-fun m!78819 () Bool)

(assert (=> b!50084 m!78819))

(assert (=> b!50084 m!78817))

(assert (=> b!50084 m!78819))

(declare-fun m!78821 () Bool)

(assert (=> b!50084 m!78821))

(declare-fun m!78823 () Bool)

(assert (=> bm!645 m!78823))

(declare-fun m!78825 () Bool)

(assert (=> bm!645 m!78825))

(assert (=> bm!645 m!78823))

(assert (=> bm!645 m!78825))

(declare-fun m!78827 () Bool)

(assert (=> bm!645 m!78827))

(declare-fun m!78829 () Bool)

(assert (=> b!50085 m!78829))

(assert (=> b!50086 m!75915))

(declare-fun m!78831 () Bool)

(assert (=> b!50086 m!78831))

(assert (=> b!48880 d!15940))

(assert (=> b!48880 d!14988))

(assert (=> b!49037 d!15876))

(assert (=> b!49037 d!14982))

(declare-fun d!15942 () Bool)

(assert (=> d!15942 (validate_offset_bits!1 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75747))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75747))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15942 true))

(declare-fun _$1!306 () Unit!3416)

(assert (=> d!15942 (= (choose!27 thiss!1379 (_2!2399 lt!75747) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!306)))

(declare-fun bs!3998 () Bool)

(assert (= bs!3998 d!15942))

(assert (=> bs!3998 m!76231))

(assert (=> d!14994 d!15942))

(declare-fun d!15944 () Bool)

(assert (=> d!15944 (= (length!245 lt!76525) (size!1052 lt!76525))))

(declare-fun bs!3999 () Bool)

(assert (= bs!3999 d!15944))

(declare-fun m!78833 () Bool)

(assert (=> bs!3999 m!78833))

(assert (=> b!49121 d!15944))

(declare-fun lt!77861 () tuple2!4614)

(declare-fun e!33052 () tuple2!4616)

(declare-fun b!50092 () Bool)

(declare-fun lt!77860 () (_ BitVec 64))

(assert (=> b!50092 (= e!33052 (tuple2!4617 (Cons!546 (_1!2406 lt!77861) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!77861) (bvsub (bvsub lt!75762 lt!76526) lt!77860))) (_2!2406 lt!77861)))))

(assert (=> b!50092 (= lt!77861 (readBit!0 (_2!2406 lt!76527)))))

(assert (=> b!50092 (= lt!77860 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15946 () Bool)

(declare-fun e!33051 () Bool)

(assert (=> d!15946 e!33051))

(declare-fun c!3609 () Bool)

(assert (=> d!15946 (= c!3609 (= (bvsub lt!75762 lt!76526) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77859 () List!550)

(assert (=> d!15946 (= lt!77859 (_1!2407 e!33052))))

(declare-fun c!3608 () Bool)

(assert (=> d!15946 (= c!3608 (= (bvsub lt!75762 lt!76526) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15946 (bvsge (bvsub lt!75762 lt!76526) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15946 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!76527) (bvsub lt!75762 lt!76526)) lt!77859)))

(declare-fun b!50093 () Bool)

(assert (=> b!50093 (= e!33051 (isEmpty!143 lt!77859))))

(declare-fun b!50094 () Bool)

(assert (=> b!50094 (= e!33051 (> (length!245 lt!77859) 0))))

(declare-fun b!50091 () Bool)

(assert (=> b!50091 (= e!33052 (tuple2!4617 Nil!547 (_2!2406 lt!76527)))))

(assert (= (and d!15946 c!3608) b!50091))

(assert (= (and d!15946 (not c!3608)) b!50092))

(assert (= (and d!15946 c!3609) b!50093))

(assert (= (and d!15946 (not c!3609)) b!50094))

(declare-fun m!78835 () Bool)

(assert (=> b!50092 m!78835))

(declare-fun m!78837 () Bool)

(assert (=> b!50092 m!78837))

(declare-fun m!78839 () Bool)

(assert (=> b!50093 m!78839))

(declare-fun m!78841 () Bool)

(assert (=> b!50094 m!78841))

(assert (=> b!49119 d!15946))

(declare-fun d!15948 () Bool)

(declare-fun e!33053 () Bool)

(assert (=> d!15948 e!33053))

(declare-fun res!41893 () Bool)

(assert (=> d!15948 (=> (not res!41893) (not e!33053))))

(assert (=> d!15948 (= res!41893 (= (buf!1401 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75750)))) (buf!1401 (_1!2400 lt!75750))))))

(declare-fun lt!77862 () Bool)

(assert (=> d!15948 (= lt!77862 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75750))) (currentByte!2918 (_1!2400 lt!75750)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75750))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77866 () tuple2!4614)

(assert (=> d!15948 (= lt!77866 (tuple2!4615 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75750))) (currentByte!2918 (_1!2400 lt!75750)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75750))))) #b00000000000000000000000000000000)) (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75750)))))))

(assert (=> d!15948 (validate_offset_bit!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2400 lt!75750)))) ((_ sign_extend 32) (currentByte!2918 (_1!2400 lt!75750))) ((_ sign_extend 32) (currentBit!2913 (_1!2400 lt!75750))))))

(assert (=> d!15948 (= (readBit!0 (_1!2400 lt!75750)) lt!77866)))

(declare-fun b!50095 () Bool)

(declare-fun lt!77865 () (_ BitVec 64))

(declare-fun lt!77863 () (_ BitVec 64))

(assert (=> b!50095 (= e!33053 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75750))))) (currentByte!2918 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75750)))) (currentBit!2913 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75750))))) (bvadd lt!77863 lt!77865)))))

(assert (=> b!50095 (or (not (= (bvand lt!77863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77865 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77863 lt!77865) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!50095 (= lt!77865 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!50095 (= lt!77863 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!75750))) (currentByte!2918 (_1!2400 lt!75750)) (currentBit!2913 (_1!2400 lt!75750))))))

(declare-fun lt!77868 () Bool)

(assert (=> b!50095 (= lt!77868 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75750))) (currentByte!2918 (_1!2400 lt!75750)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75750))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77864 () Bool)

(assert (=> b!50095 (= lt!77864 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75750))) (currentByte!2918 (_1!2400 lt!75750)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75750))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77867 () Bool)

(assert (=> b!50095 (= lt!77867 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75750))) (currentByte!2918 (_1!2400 lt!75750)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75750))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15948 res!41893) b!50095))

(declare-fun m!78843 () Bool)

(assert (=> d!15948 m!78843))

(declare-fun m!78845 () Bool)

(assert (=> d!15948 m!78845))

(declare-fun m!78847 () Bool)

(assert (=> d!15948 m!78847))

(declare-fun m!78849 () Bool)

(assert (=> d!15948 m!78849))

(assert (=> b!50095 m!78847))

(declare-fun m!78851 () Bool)

(assert (=> b!50095 m!78851))

(assert (=> b!50095 m!78845))

(assert (=> b!50095 m!78843))

(declare-fun m!78853 () Bool)

(assert (=> b!50095 m!78853))

(assert (=> b!49119 d!15948))

(declare-fun e!33055 () tuple2!4616)

(declare-fun lt!77871 () tuple2!4614)

(declare-fun lt!77870 () (_ BitVec 64))

(declare-fun b!50097 () Bool)

(assert (=> b!50097 (= e!33055 (tuple2!4617 (Cons!546 (_1!2406 lt!77871) (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!77871) (bvsub (bvsub (bvsub to!314 i!635) lt!76523) lt!77870))) (_2!2406 lt!77871)))))

(assert (=> b!50097 (= lt!77871 (readBit!0 (_2!2406 lt!76524)))))

(assert (=> b!50097 (= lt!77870 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!15950 () Bool)

(declare-fun e!33054 () Bool)

(assert (=> d!15950 e!33054))

(declare-fun c!3611 () Bool)

(assert (=> d!15950 (= c!3611 (= (bvsub (bvsub to!314 i!635) lt!76523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77869 () List!550)

(assert (=> d!15950 (= lt!77869 (_1!2407 e!33055))))

(declare-fun c!3610 () Bool)

(assert (=> d!15950 (= c!3610 (= (bvsub (bvsub to!314 i!635) lt!76523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15950 (bvsge (bvsub (bvsub to!314 i!635) lt!76523) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15950 (= (bitStreamReadBitsIntoList!0 (_2!2399 lt!75756) (_2!2406 lt!76524) (bvsub (bvsub to!314 i!635) lt!76523)) lt!77869)))

(declare-fun b!50098 () Bool)

(assert (=> b!50098 (= e!33054 (isEmpty!143 lt!77869))))

(declare-fun b!50099 () Bool)

(assert (=> b!50099 (= e!33054 (> (length!245 lt!77869) 0))))

(declare-fun b!50096 () Bool)

(assert (=> b!50096 (= e!33055 (tuple2!4617 Nil!547 (_2!2406 lt!76524)))))

(assert (= (and d!15950 c!3610) b!50096))

(assert (= (and d!15950 (not c!3610)) b!50097))

(assert (= (and d!15950 c!3611) b!50098))

(assert (= (and d!15950 (not c!3611)) b!50099))

(declare-fun m!78855 () Bool)

(assert (=> b!50097 m!78855))

(declare-fun m!78857 () Bool)

(assert (=> b!50097 m!78857))

(declare-fun m!78859 () Bool)

(assert (=> b!50098 m!78859))

(declare-fun m!78861 () Bool)

(assert (=> b!50099 m!78861))

(assert (=> b!49115 d!15950))

(declare-fun d!15952 () Bool)

(declare-fun e!33056 () Bool)

(assert (=> d!15952 e!33056))

(declare-fun res!41894 () Bool)

(assert (=> d!15952 (=> (not res!41894) (not e!33056))))

(assert (=> d!15952 (= res!41894 (= (buf!1401 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75754)))) (buf!1401 (_1!2400 lt!75754))))))

(declare-fun lt!77872 () Bool)

(assert (=> d!15952 (= lt!77872 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75754))) (currentByte!2918 (_1!2400 lt!75754)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75754))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77876 () tuple2!4614)

(assert (=> d!15952 (= lt!77876 (tuple2!4615 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75754))) (currentByte!2918 (_1!2400 lt!75754)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75754))))) #b00000000000000000000000000000000)) (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75754)))))))

(assert (=> d!15952 (validate_offset_bit!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_1!2400 lt!75754)))) ((_ sign_extend 32) (currentByte!2918 (_1!2400 lt!75754))) ((_ sign_extend 32) (currentBit!2913 (_1!2400 lt!75754))))))

(assert (=> d!15952 (= (readBit!0 (_1!2400 lt!75754)) lt!77876)))

(declare-fun lt!77873 () (_ BitVec 64))

(declare-fun b!50100 () Bool)

(declare-fun lt!77875 () (_ BitVec 64))

(assert (=> b!50100 (= e!33056 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75754))))) (currentByte!2918 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75754)))) (currentBit!2913 (_2!2399 (increaseBitIndex!0 (_1!2400 lt!75754))))) (bvadd lt!77873 lt!77875)))))

(assert (=> b!50100 (or (not (= (bvand lt!77873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77875 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77873 lt!77875) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!50100 (= lt!77875 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!50100 (= lt!77873 (bitIndex!0 (size!1049 (buf!1401 (_1!2400 lt!75754))) (currentByte!2918 (_1!2400 lt!75754)) (currentBit!2913 (_1!2400 lt!75754))))))

(declare-fun lt!77878 () Bool)

(assert (=> b!50100 (= lt!77878 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75754))) (currentByte!2918 (_1!2400 lt!75754)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75754))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77874 () Bool)

(assert (=> b!50100 (= lt!77874 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75754))) (currentByte!2918 (_1!2400 lt!75754)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75754))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77877 () Bool)

(assert (=> b!50100 (= lt!77877 (not (= (bvand ((_ sign_extend 24) (select (arr!1575 (buf!1401 (_1!2400 lt!75754))) (currentByte!2918 (_1!2400 lt!75754)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2913 (_1!2400 lt!75754))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15952 res!41894) b!50100))

(declare-fun m!78863 () Bool)

(assert (=> d!15952 m!78863))

(declare-fun m!78865 () Bool)

(assert (=> d!15952 m!78865))

(declare-fun m!78867 () Bool)

(assert (=> d!15952 m!78867))

(declare-fun m!78869 () Bool)

(assert (=> d!15952 m!78869))

(assert (=> b!50100 m!78867))

(declare-fun m!78871 () Bool)

(assert (=> b!50100 m!78871))

(assert (=> b!50100 m!78865))

(assert (=> b!50100 m!78863))

(declare-fun m!78873 () Bool)

(assert (=> b!50100 m!78873))

(assert (=> b!49115 d!15952))

(assert (=> b!48878 d!14988))

(assert (=> b!48878 d!14940))

(assert (=> b!48955 d!14982))

(assert (=> b!48955 d!14988))

(declare-fun b!50111 () Bool)

(declare-fun res!41903 () Bool)

(declare-fun e!33062 () Bool)

(assert (=> b!50111 (=> (not res!41903) (not e!33062))))

(declare-fun lt!77887 () tuple2!4600)

(assert (=> b!50111 (= res!41903 (isPrefixOf!0 thiss!1379 (_2!2399 lt!77887)))))

(declare-fun b!50113 () Bool)

(declare-fun e!33061 () Bool)

(declare-fun lt!77890 () tuple2!4610)

(assert (=> b!50113 (= e!33061 (= (bitIndex!0 (size!1049 (buf!1401 (_1!2404 lt!77890))) (currentByte!2918 (_1!2404 lt!77890)) (currentBit!2913 (_1!2404 lt!77890))) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77887))) (currentByte!2918 (_2!2399 lt!77887)) (currentBit!2913 (_2!2399 lt!77887)))))))

(declare-fun b!50112 () Bool)

(assert (=> b!50112 (= e!33062 e!33061)))

(declare-fun res!41906 () Bool)

(assert (=> b!50112 (=> (not res!41906) (not e!33061))))

(assert (=> b!50112 (= res!41906 (and (= (_2!2404 lt!77890) lt!76361) (= (_1!2404 lt!77890) (_2!2399 lt!77887))))))

(assert (=> b!50112 (= lt!77890 (readBitPure!0 (readerFrom!0 (_2!2399 lt!77887) (currentBit!2913 thiss!1379) (currentByte!2918 thiss!1379))))))

(declare-fun b!50110 () Bool)

(declare-fun res!41904 () Bool)

(assert (=> b!50110 (=> (not res!41904) (not e!33062))))

(declare-fun lt!77889 () (_ BitVec 64))

(declare-fun lt!77888 () (_ BitVec 64))

(assert (=> b!50110 (= res!41904 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!77887))) (currentByte!2918 (_2!2399 lt!77887)) (currentBit!2913 (_2!2399 lt!77887))) (bvadd lt!77889 lt!77888)))))

(assert (=> b!50110 (or (not (= (bvand lt!77889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77888 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77889 lt!77888) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!50110 (= lt!77888 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!50110 (= lt!77889 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)))))

(declare-fun d!15954 () Bool)

(assert (=> d!15954 e!33062))

(declare-fun res!41905 () Bool)

(assert (=> d!15954 (=> (not res!41905) (not e!33062))))

(assert (=> d!15954 (= res!41905 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!77887)))))))

(declare-fun choose!16 (BitStream!1818 Bool) tuple2!4600)

(assert (=> d!15954 (= lt!77887 (choose!16 thiss!1379 lt!76361))))

(assert (=> d!15954 (validate_offset_bit!0 ((_ sign_extend 32) (size!1049 (buf!1401 thiss!1379))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379)))))

(assert (=> d!15954 (= (appendBit!0 thiss!1379 lt!76361) lt!77887)))

(assert (= (and d!15954 res!41905) b!50110))

(assert (= (and b!50110 res!41904) b!50111))

(assert (= (and b!50111 res!41903) b!50112))

(assert (= (and b!50112 res!41906) b!50113))

(declare-fun m!78875 () Bool)

(assert (=> b!50111 m!78875))

(declare-fun m!78877 () Bool)

(assert (=> b!50112 m!78877))

(assert (=> b!50112 m!78877))

(declare-fun m!78879 () Bool)

(assert (=> b!50112 m!78879))

(declare-fun m!78881 () Bool)

(assert (=> b!50113 m!78881))

(declare-fun m!78883 () Bool)

(assert (=> b!50113 m!78883))

(declare-fun m!78885 () Bool)

(assert (=> d!15954 m!78885))

(declare-fun m!78887 () Bool)

(assert (=> d!15954 m!78887))

(assert (=> b!50110 m!78883))

(assert (=> b!50110 m!75897))

(assert (=> d!14996 d!15954))

(declare-fun d!15956 () Bool)

(declare-fun e!33063 () Bool)

(assert (=> d!15956 e!33063))

(declare-fun res!41908 () Bool)

(assert (=> d!15956 (=> (not res!41908) (not e!33063))))

(declare-fun lt!77891 () (_ BitVec 64))

(declare-fun lt!77893 () (_ BitVec 64))

(declare-fun lt!77895 () (_ BitVec 64))

(assert (=> d!15956 (= res!41908 (= lt!77895 (bvsub lt!77893 lt!77891)))))

(assert (=> d!15956 (or (= (bvand lt!77893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77891 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77893 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77893 lt!77891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15956 (= lt!77891 (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))) ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75984))) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75984)))))))

(declare-fun lt!77896 () (_ BitVec 64))

(declare-fun lt!77894 () (_ BitVec 64))

(assert (=> d!15956 (= lt!77893 (bvmul lt!77896 lt!77894))))

(assert (=> d!15956 (or (= lt!77896 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77894 (bvsdiv (bvmul lt!77896 lt!77894) lt!77896)))))

(assert (=> d!15956 (= lt!77894 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15956 (= lt!77896 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))))))

(assert (=> d!15956 (= lt!77895 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 (_2!2399 lt!75984))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 (_2!2399 lt!75984)))))))

(assert (=> d!15956 (invariant!0 (currentBit!2913 (_2!2399 lt!75984)) (currentByte!2918 (_2!2399 lt!75984)) (size!1049 (buf!1401 (_2!2399 lt!75984))))))

(assert (=> d!15956 (= (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!75984))) (currentByte!2918 (_2!2399 lt!75984)) (currentBit!2913 (_2!2399 lt!75984))) lt!77895)))

(declare-fun b!50114 () Bool)

(declare-fun res!41907 () Bool)

(assert (=> b!50114 (=> (not res!41907) (not e!33063))))

(assert (=> b!50114 (= res!41907 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77895))))

(declare-fun b!50115 () Bool)

(declare-fun lt!77892 () (_ BitVec 64))

(assert (=> b!50115 (= e!33063 (bvsle lt!77895 (bvmul lt!77892 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50115 (or (= lt!77892 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77892 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77892)))))

(assert (=> b!50115 (= lt!77892 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75984)))))))

(assert (= (and d!15956 res!41908) b!50114))

(assert (= (and b!50114 res!41907) b!50115))

(declare-fun m!78889 () Bool)

(assert (=> d!15956 m!78889))

(assert (=> d!15956 m!76107))

(assert (=> d!14956 d!15956))

(assert (=> d!14956 d!14988))

(assert (=> d!14956 d!15856))

(assert (=> d!14956 d!15854))

(declare-fun b!50116 () Bool)

(declare-fun lt!77898 () tuple4!24)

(declare-fun e!33069 () Bool)

(declare-fun lt!77897 () (_ BitVec 32))

(assert (=> b!50116 (= e!33069 (byteRangesEq!0 (select (arr!1575 (buf!1401 thiss!1379)) (_4!12 lt!77898)) (select (arr!1575 (buf!1401 thiss!1379)) (_4!12 lt!77898)) #b00000000000000000000000000000000 lt!77897))))

(declare-fun c!3612 () Bool)

(declare-fun call!649 () Bool)

(declare-fun bm!646 () Bool)

(declare-fun lt!77899 () (_ BitVec 32))

(assert (=> bm!646 (= call!649 (byteRangesEq!0 (select (arr!1575 (buf!1401 thiss!1379)) (_3!104 lt!77898)) (select (arr!1575 (buf!1401 thiss!1379)) (_3!104 lt!77898)) lt!77899 (ite c!3612 lt!77897 #b00000000000000000000000000001000)))))

(declare-fun b!50117 () Bool)

(declare-fun e!33065 () Bool)

(assert (=> b!50117 (= e!33065 (arrayRangesEq!13 (buf!1401 thiss!1379) (buf!1401 thiss!1379) (_1!2420 lt!77898) (_2!2420 lt!77898)))))

(declare-fun b!50118 () Bool)

(declare-fun e!33064 () Bool)

(declare-fun e!33067 () Bool)

(assert (=> b!50118 (= e!33064 e!33067)))

(declare-fun res!41909 () Bool)

(assert (=> b!50118 (=> (not res!41909) (not e!33067))))

(assert (=> b!50118 (= res!41909 e!33065)))

(declare-fun res!41913 () Bool)

(assert (=> b!50118 (=> res!41913 e!33065)))

(assert (=> b!50118 (= res!41913 (bvsge (_1!2420 lt!77898) (_2!2420 lt!77898)))))

(assert (=> b!50118 (= lt!77897 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50118 (= lt!77899 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!50118 (= lt!77898 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(declare-fun b!50120 () Bool)

(declare-fun e!33068 () Bool)

(assert (=> b!50120 (= e!33068 call!649)))

(declare-fun b!50121 () Bool)

(declare-fun e!33066 () Bool)

(assert (=> b!50121 (= e!33068 e!33066)))

(declare-fun res!41912 () Bool)

(assert (=> b!50121 (= res!41912 call!649)))

(assert (=> b!50121 (=> (not res!41912) (not e!33066))))

(declare-fun b!50122 () Bool)

(declare-fun res!41911 () Bool)

(assert (=> b!50122 (= res!41911 (= lt!77897 #b00000000000000000000000000000000))))

(assert (=> b!50122 (=> res!41911 e!33069)))

(assert (=> b!50122 (= e!33066 e!33069)))

(declare-fun b!50119 () Bool)

(assert (=> b!50119 (= e!33067 e!33068)))

(assert (=> b!50119 (= c!3612 (= (_3!104 lt!77898) (_4!12 lt!77898)))))

(declare-fun d!15958 () Bool)

(declare-fun res!41910 () Bool)

(assert (=> d!15958 (=> res!41910 e!33064)))

(assert (=> d!15958 (= res!41910 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (=> d!15958 (= (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))) e!33064)))

(assert (= (and d!15958 (not res!41910)) b!50118))

(assert (= (and b!50118 (not res!41913)) b!50117))

(assert (= (and b!50118 res!41909) b!50119))

(assert (= (and b!50119 c!3612) b!50120))

(assert (= (and b!50119 (not c!3612)) b!50121))

(assert (= (and b!50121 res!41912) b!50122))

(assert (= (and b!50122 (not res!41911)) b!50116))

(assert (= (or b!50120 b!50121) bm!646))

(declare-fun m!78891 () Bool)

(assert (=> b!50116 m!78891))

(assert (=> b!50116 m!78891))

(assert (=> b!50116 m!78891))

(assert (=> b!50116 m!78891))

(declare-fun m!78893 () Bool)

(assert (=> b!50116 m!78893))

(declare-fun m!78895 () Bool)

(assert (=> bm!646 m!78895))

(assert (=> bm!646 m!78895))

(assert (=> bm!646 m!78895))

(assert (=> bm!646 m!78895))

(declare-fun m!78897 () Bool)

(assert (=> bm!646 m!78897))

(declare-fun m!78899 () Bool)

(assert (=> b!50117 m!78899))

(assert (=> b!50118 m!75897))

(assert (=> b!50118 m!78725))

(assert (=> b!48946 d!15958))

(assert (=> b!48946 d!14982))

(declare-fun d!15960 () Bool)

(declare-fun res!41916 () Bool)

(declare-fun e!33071 () Bool)

(assert (=> d!15960 (=> (not res!41916) (not e!33071))))

(assert (=> d!15960 (= res!41916 (= (size!1049 (buf!1401 thiss!1379)) (size!1049 (buf!1401 (_2!2399 lt!76369)))))))

(assert (=> d!15960 (= (isPrefixOf!0 thiss!1379 (_2!2399 lt!76369)) e!33071)))

(declare-fun b!50123 () Bool)

(declare-fun res!41915 () Bool)

(assert (=> b!50123 (=> (not res!41915) (not e!33071))))

(assert (=> b!50123 (= res!41915 (bvsle (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379)) (bitIndex!0 (size!1049 (buf!1401 (_2!2399 lt!76369))) (currentByte!2918 (_2!2399 lt!76369)) (currentBit!2913 (_2!2399 lt!76369)))))))

(declare-fun b!50124 () Bool)

(declare-fun e!33070 () Bool)

(assert (=> b!50124 (= e!33071 e!33070)))

(declare-fun res!41914 () Bool)

(assert (=> b!50124 (=> res!41914 e!33070)))

(assert (=> b!50124 (= res!41914 (= (size!1049 (buf!1401 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!50125 () Bool)

(assert (=> b!50125 (= e!33070 (arrayBitRangesEq!0 (buf!1401 thiss!1379) (buf!1401 (_2!2399 lt!76369)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1049 (buf!1401 thiss!1379)) (currentByte!2918 thiss!1379) (currentBit!2913 thiss!1379))))))

(assert (= (and d!15960 res!41916) b!50123))

(assert (= (and b!50123 res!41915) b!50124))

(assert (= (and b!50124 (not res!41914)) b!50125))

(assert (=> b!50123 m!75897))

(assert (=> b!50123 m!76395))

(assert (=> b!50125 m!75897))

(assert (=> b!50125 m!75897))

(declare-fun m!78901 () Bool)

(assert (=> b!50125 m!78901))

(assert (=> b!49035 d!15960))

(declare-fun d!15962 () Bool)

(assert (=> d!15962 (= (remainingBits!0 ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) ((_ sign_extend 32) (currentByte!2918 thiss!1379)) ((_ sign_extend 32) (currentBit!2913 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1049 (buf!1401 (_2!2399 lt!75747)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2918 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2913 thiss!1379)))))))

(assert (=> d!14952 d!15962))

(check-sat (not b!50097) (not d!15738) (not b!49862) (not d!15820) (not b!50086) (not d!15796) (not b!50043) (not b!50024) (not b!50052) (not b!50110) (not b!49934) (not d!15766) (not b!50125) (not b!49992) (not b!50072) (not b!49878) (not d!15782) (not d!15876) (not b!49945) (not b!50066) (not b!49993) (not b!50029) (not d!15748) (not b!49868) (not b!49982) (not d!15712) (not d!15908) (not b!49900) (not d!15740) (not b!50010) (not b!49897) (not b!49902) (not b!49890) (not b!49997) (not b!49925) (not b!49966) (not d!15784) (not b!49885) (not d!15744) (not b!49911) (not b!50117) (not b!49903) (not d!15862) (not d!15804) (not d!15728) (not b!50021) (not b!49923) (not b!49995) (not b!49869) (not b!50084) (not d!15882) (not b!49921) (not b!50059) (not b!49983) (not b!49907) (not b!50092) (not b!49933) (not b!49958) (not d!15800) (not b!49908) (not bm!643) (not b!50000) (not b!50100) (not b!49994) (not b!50063) (not b!50061) (not d!15794) (not b!49951) (not d!15948) (not b!49883) (not d!15754) (not b!50118) (not b!49881) (not d!15790) (not b!49891) (not d!15910) (not b!49960) (not b!49949) (not b!50041) (not d!15714) (not b!50025) (not b!50067) (not b!50026) (not b!49990) (not d!15834) (not b!50023) (not b!49932) (not b!49963) (not b!49893) (not d!15822) (not b!50116) (not b!50031) (not b!50007) (not b!49906) (not bm!645) (not d!15842) (not b!49865) (not d!15724) (not b!49998) (not b!50012) (not d!15722) (not d!15852) (not b!50006) (not b!50009) (not d!15924) (not b!49988) (not b!50098) (not b!49964) (not b!50069) (not b!50071) (not b!49896) (not b!50079) (not d!15920) (not d!15952) (not b!49981) (not d!15874) (not b!50032) (not b!49954) (not b!50051) (not bm!646) (not b!50095) (not b!50053) (not b!49889) (not b!49901) (not b!49937) (not b!49919) (not b!49895) (not d!15930) (not b!49915) (not b!50034) (not b!49861) (not d!15956) (not b!50085) (not d!15756) (not b!49924) (not b!50111) (not b!50001) (not b!50083) (not d!15720) (not d!15918) (not d!15808) (not d!15734) (not bm!641) (not bm!644) (not d!15900) (not b!49955) (not b!49914) (not b!49947) (not b!50003) (not b!49917) (not b!49845) (not b!50112) (not d!15922) (not d!15780) (not b!50050) (not b!49961) (not b!50113) (not d!15730) (not b!49887) (not d!15854) (not b!49847) (not b!50004) (not d!15718) (not b!50081) (not b!50048) (not b!50093) (not d!15826) (not d!15750) (not b!50099) (not d!15884) (not b!49941) (not d!15788) (not b!49905) (not b!49916) (not bm!640) (not d!15870) (not b!50011) (not d!15792) (not d!15816) (not d!15868) (not b!49957) (not b!50042) (not b!49952) (not b!50094) (not d!15942) (not b!49880) (not bm!637) (not b!49944) (not b!49899) (not b!49904) (not b!49912) (not b!50062) (not d!15888) (not d!15810) (not b!50065) (not d!15726) (not d!15732) (not bm!642) (not d!15858) (not b!49884) (not d!15904) (not b!49939) (not b!50040) (not b!49872) (not b!50070) (not b!50028) (not d!15886) (not b!49874) (not d!15954) (not d!15944) (not b!49940) (not b!49926) (not b!49918) (not d!15758) (not b!49909) (not b!50078) (not b!50123) (not b!49879))
(check-sat)
