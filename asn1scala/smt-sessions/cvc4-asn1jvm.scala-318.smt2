; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6906 () Bool)

(assert start!6906)

(declare-datatypes ((array!1842 0))(
  ( (array!1843 (arr!1288 (Array (_ BitVec 32) (_ BitVec 8))) (size!813 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1842)

(declare-datatypes ((BitStream!1418 0))(
  ( (BitStream!1419 (buf!1141 array!1842) (currentByte!2508 (_ BitVec 32)) (currentBit!2503 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2481 0))(
  ( (Unit!2482) )
))
(declare-datatypes ((tuple2!3366 0))(
  ( (tuple2!3367 (_1!1770 Unit!2481) (_2!1770 BitStream!1418)) )
))
(declare-fun lt!48670 () tuple2!3366)

(declare-datatypes ((tuple2!3368 0))(
  ( (tuple2!3369 (_1!1771 BitStream!1418) (_2!1771 BitStream!1418)) )
))
(declare-fun lt!48675 () tuple2!3368)

(declare-fun b!32986 () Bool)

(declare-fun e!21844 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((List!410 0))(
  ( (Nil!407) (Cons!406 (h!525 Bool) (t!1160 List!410)) )
))
(declare-fun head!247 (List!410) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1418 array!1842 (_ BitVec 64) (_ BitVec 64)) List!410)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1418 BitStream!1418 (_ BitVec 64)) List!410)

(assert (=> b!32986 (= e!21844 (= (head!247 (byteArrayBitContentToList!0 (_2!1770 lt!48670) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!247 (bitStreamReadBitsIntoList!0 (_2!1770 lt!48670) (_1!1771 lt!48675) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32987 () Bool)

(declare-fun e!21849 () Bool)

(declare-fun e!21842 () Bool)

(assert (=> b!32987 (= e!21849 e!21842)))

(declare-fun res!28221 () Bool)

(assert (=> b!32987 (=> res!28221 e!21842)))

(declare-fun lt!48683 () tuple2!3366)

(declare-fun isPrefixOf!0 (BitStream!1418 BitStream!1418) Bool)

(assert (=> b!32987 (= res!28221 (not (isPrefixOf!0 (_2!1770 lt!48670) (_2!1770 lt!48683))))))

(declare-fun thiss!1379 () BitStream!1418)

(assert (=> b!32987 (isPrefixOf!0 thiss!1379 (_2!1770 lt!48683))))

(declare-fun lt!48674 () Unit!2481)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1418 BitStream!1418 BitStream!1418) Unit!2481)

(assert (=> b!32987 (= lt!48674 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1770 lt!48670) (_2!1770 lt!48683)))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1418 array!1842 (_ BitVec 64) (_ BitVec 64)) tuple2!3366)

(assert (=> b!32987 (= lt!48683 (appendBitsMSBFirstLoop!0 (_2!1770 lt!48670) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!32987 e!21844))

(declare-fun res!28231 () Bool)

(assert (=> b!32987 (=> (not res!28231) (not e!21844))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32987 (= res!28231 (validate_offset_bits!1 ((_ sign_extend 32) (size!813 (buf!1141 (_2!1770 lt!48670)))) ((_ sign_extend 32) (currentByte!2508 thiss!1379)) ((_ sign_extend 32) (currentBit!2503 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48672 () Unit!2481)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1418 array!1842 (_ BitVec 64)) Unit!2481)

(assert (=> b!32987 (= lt!48672 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1141 (_2!1770 lt!48670)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1418 BitStream!1418) tuple2!3368)

(assert (=> b!32987 (= lt!48675 (reader!0 thiss!1379 (_2!1770 lt!48670)))))

(declare-fun b!32988 () Bool)

(declare-fun res!28229 () Bool)

(declare-fun e!21845 () Bool)

(assert (=> b!32988 (=> (not res!28229) (not e!21845))))

(assert (=> b!32988 (= res!28229 (validate_offset_bits!1 ((_ sign_extend 32) (size!813 (buf!1141 thiss!1379))) ((_ sign_extend 32) (currentByte!2508 thiss!1379)) ((_ sign_extend 32) (currentBit!2503 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!28224 () Bool)

(assert (=> start!6906 (=> (not res!28224) (not e!21845))))

(assert (=> start!6906 (= res!28224 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!813 srcBuffer!2))))))))

(assert (=> start!6906 e!21845))

(assert (=> start!6906 true))

(declare-fun array_inv!762 (array!1842) Bool)

(assert (=> start!6906 (array_inv!762 srcBuffer!2)))

(declare-fun e!21853 () Bool)

(declare-fun inv!12 (BitStream!1418) Bool)

(assert (=> start!6906 (and (inv!12 thiss!1379) e!21853)))

(declare-fun lt!48678 () (_ BitVec 64))

(declare-fun e!21852 () Bool)

(declare-fun b!32989 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32989 (= e!21852 (= lt!48678 (bvsub (bvsub (bvadd (bitIndex!0 (size!813 (buf!1141 (_2!1770 lt!48670))) (currentByte!2508 (_2!1770 lt!48670)) (currentBit!2503 (_2!1770 lt!48670))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32990 () Bool)

(declare-fun e!21850 () Bool)

(declare-fun e!21851 () Bool)

(assert (=> b!32990 (= e!21850 e!21851)))

(declare-fun res!28230 () Bool)

(assert (=> b!32990 (=> res!28230 e!21851)))

(assert (=> b!32990 (= res!28230 (not (= (size!813 (buf!1141 (_2!1770 lt!48670))) (size!813 (buf!1141 (_2!1770 lt!48683))))))))

(assert (=> b!32990 e!21852))

(declare-fun res!28225 () Bool)

(assert (=> b!32990 (=> (not res!28225) (not e!21852))))

(assert (=> b!32990 (= res!28225 (= (size!813 (buf!1141 (_2!1770 lt!48683))) (size!813 (buf!1141 thiss!1379))))))

(declare-fun b!32991 () Bool)

(declare-fun e!21843 () Bool)

(assert (=> b!32991 (= e!21843 true)))

(declare-fun lt!48679 () List!410)

(declare-fun lt!48680 () List!410)

(declare-fun tail!127 (List!410) List!410)

(assert (=> b!32991 (= lt!48679 (tail!127 lt!48680))))

(declare-fun lt!48682 () tuple2!3368)

(declare-fun lt!48673 () Unit!2481)

(declare-fun lt!48684 () tuple2!3368)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1418 BitStream!1418 BitStream!1418 BitStream!1418 (_ BitVec 64) List!410) Unit!2481)

(assert (=> b!32991 (= lt!48673 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1770 lt!48683) (_2!1770 lt!48683) (_1!1771 lt!48684) (_1!1771 lt!48682) (bvsub to!314 i!635) lt!48680))))

(declare-fun b!32992 () Bool)

(declare-fun res!28232 () Bool)

(assert (=> b!32992 (=> res!28232 e!21850)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32992 (= res!28232 (not (invariant!0 (currentBit!2503 (_2!1770 lt!48683)) (currentByte!2508 (_2!1770 lt!48683)) (size!813 (buf!1141 (_2!1770 lt!48683))))))))

(declare-fun b!32993 () Bool)

(declare-fun res!28226 () Bool)

(assert (=> b!32993 (=> res!28226 e!21851)))

(assert (=> b!32993 (= res!28226 (not (invariant!0 (currentBit!2503 (_2!1770 lt!48670)) (currentByte!2508 (_2!1770 lt!48670)) (size!813 (buf!1141 (_2!1770 lt!48683))))))))

(declare-fun b!32994 () Bool)

(assert (=> b!32994 (= e!21842 e!21850)))

(declare-fun res!28219 () Bool)

(assert (=> b!32994 (=> res!28219 e!21850)))

(declare-fun lt!48671 () (_ BitVec 64))

(assert (=> b!32994 (= res!28219 (not (= lt!48678 (bvsub (bvadd lt!48671 to!314) i!635))))))

(assert (=> b!32994 (= lt!48678 (bitIndex!0 (size!813 (buf!1141 (_2!1770 lt!48683))) (currentByte!2508 (_2!1770 lt!48683)) (currentBit!2503 (_2!1770 lt!48683))))))

(declare-fun b!32995 () Bool)

(declare-fun e!21846 () Bool)

(assert (=> b!32995 (= e!21845 (not e!21846))))

(declare-fun res!28222 () Bool)

(assert (=> b!32995 (=> res!28222 e!21846)))

(assert (=> b!32995 (= res!28222 (bvsge i!635 to!314))))

(assert (=> b!32995 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48681 () Unit!2481)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1418) Unit!2481)

(assert (=> b!32995 (= lt!48681 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!32995 (= lt!48671 (bitIndex!0 (size!813 (buf!1141 thiss!1379)) (currentByte!2508 thiss!1379) (currentBit!2503 thiss!1379)))))

(declare-fun b!32996 () Bool)

(declare-fun res!28223 () Bool)

(assert (=> b!32996 (=> res!28223 e!21851)))

(assert (=> b!32996 (= res!28223 (not (invariant!0 (currentBit!2503 (_2!1770 lt!48670)) (currentByte!2508 (_2!1770 lt!48670)) (size!813 (buf!1141 (_2!1770 lt!48670))))))))

(declare-fun b!32997 () Bool)

(declare-fun res!28228 () Bool)

(assert (=> b!32997 (=> res!28228 e!21843)))

(declare-fun length!136 (List!410) Int)

(assert (=> b!32997 (= res!28228 (<= (length!136 lt!48680) 0))))

(declare-fun b!32998 () Bool)

(assert (=> b!32998 (= e!21851 e!21843)))

(declare-fun res!28227 () Bool)

(assert (=> b!32998 (=> res!28227 e!21843)))

(assert (=> b!32998 (= res!28227 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!48677 () (_ BitVec 64))

(assert (=> b!32998 (= lt!48679 (bitStreamReadBitsIntoList!0 (_2!1770 lt!48683) (_1!1771 lt!48682) lt!48677))))

(assert (=> b!32998 (= lt!48680 (bitStreamReadBitsIntoList!0 (_2!1770 lt!48683) (_1!1771 lt!48684) (bvsub to!314 i!635)))))

(assert (=> b!32998 (validate_offset_bits!1 ((_ sign_extend 32) (size!813 (buf!1141 (_2!1770 lt!48683)))) ((_ sign_extend 32) (currentByte!2508 (_2!1770 lt!48670))) ((_ sign_extend 32) (currentBit!2503 (_2!1770 lt!48670))) lt!48677)))

(declare-fun lt!48676 () Unit!2481)

(assert (=> b!32998 (= lt!48676 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1770 lt!48670) (buf!1141 (_2!1770 lt!48683)) lt!48677))))

(assert (=> b!32998 (= lt!48682 (reader!0 (_2!1770 lt!48670) (_2!1770 lt!48683)))))

(assert (=> b!32998 (validate_offset_bits!1 ((_ sign_extend 32) (size!813 (buf!1141 (_2!1770 lt!48683)))) ((_ sign_extend 32) (currentByte!2508 thiss!1379)) ((_ sign_extend 32) (currentBit!2503 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48669 () Unit!2481)

(assert (=> b!32998 (= lt!48669 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1141 (_2!1770 lt!48683)) (bvsub to!314 i!635)))))

(assert (=> b!32998 (= lt!48684 (reader!0 thiss!1379 (_2!1770 lt!48683)))))

(declare-fun b!32999 () Bool)

(declare-fun res!28233 () Bool)

(assert (=> b!32999 (=> res!28233 e!21850)))

(assert (=> b!32999 (= res!28233 (not (= (size!813 (buf!1141 thiss!1379)) (size!813 (buf!1141 (_2!1770 lt!48683))))))))

(declare-fun b!33000 () Bool)

(assert (=> b!33000 (= e!21853 (array_inv!762 (buf!1141 thiss!1379)))))

(declare-fun b!33001 () Bool)

(assert (=> b!33001 (= e!21846 e!21849)))

(declare-fun res!28220 () Bool)

(assert (=> b!33001 (=> res!28220 e!21849)))

(assert (=> b!33001 (= res!28220 (not (isPrefixOf!0 thiss!1379 (_2!1770 lt!48670))))))

(assert (=> b!33001 (validate_offset_bits!1 ((_ sign_extend 32) (size!813 (buf!1141 (_2!1770 lt!48670)))) ((_ sign_extend 32) (currentByte!2508 (_2!1770 lt!48670))) ((_ sign_extend 32) (currentBit!2503 (_2!1770 lt!48670))) lt!48677)))

(assert (=> b!33001 (= lt!48677 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48685 () Unit!2481)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1418 BitStream!1418 (_ BitVec 64) (_ BitVec 64)) Unit!2481)

(assert (=> b!33001 (= lt!48685 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1770 lt!48670) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1418 (_ BitVec 8) (_ BitVec 32)) tuple2!3366)

(assert (=> b!33001 (= lt!48670 (appendBitFromByte!0 thiss!1379 (select (arr!1288 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!6906 res!28224) b!32988))

(assert (= (and b!32988 res!28229) b!32995))

(assert (= (and b!32995 (not res!28222)) b!33001))

(assert (= (and b!33001 (not res!28220)) b!32987))

(assert (= (and b!32987 res!28231) b!32986))

(assert (= (and b!32987 (not res!28221)) b!32994))

(assert (= (and b!32994 (not res!28219)) b!32992))

(assert (= (and b!32992 (not res!28232)) b!32999))

(assert (= (and b!32999 (not res!28233)) b!32990))

(assert (= (and b!32990 res!28225) b!32989))

(assert (= (and b!32990 (not res!28230)) b!32996))

(assert (= (and b!32996 (not res!28223)) b!32993))

(assert (= (and b!32993 (not res!28226)) b!32998))

(assert (= (and b!32998 (not res!28227)) b!32997))

(assert (= (and b!32997 (not res!28228)) b!32991))

(assert (= start!6906 b!33000))

(declare-fun m!48861 () Bool)

(assert (=> b!32989 m!48861))

(declare-fun m!48863 () Bool)

(assert (=> b!32987 m!48863))

(declare-fun m!48865 () Bool)

(assert (=> b!32987 m!48865))

(declare-fun m!48867 () Bool)

(assert (=> b!32987 m!48867))

(declare-fun m!48869 () Bool)

(assert (=> b!32987 m!48869))

(declare-fun m!48871 () Bool)

(assert (=> b!32987 m!48871))

(declare-fun m!48873 () Bool)

(assert (=> b!32987 m!48873))

(declare-fun m!48875 () Bool)

(assert (=> b!32987 m!48875))

(declare-fun m!48877 () Bool)

(assert (=> b!32995 m!48877))

(declare-fun m!48879 () Bool)

(assert (=> b!32995 m!48879))

(declare-fun m!48881 () Bool)

(assert (=> b!32995 m!48881))

(declare-fun m!48883 () Bool)

(assert (=> b!32997 m!48883))

(declare-fun m!48885 () Bool)

(assert (=> b!32988 m!48885))

(declare-fun m!48887 () Bool)

(assert (=> b!32996 m!48887))

(declare-fun m!48889 () Bool)

(assert (=> start!6906 m!48889))

(declare-fun m!48891 () Bool)

(assert (=> start!6906 m!48891))

(declare-fun m!48893 () Bool)

(assert (=> b!33001 m!48893))

(declare-fun m!48895 () Bool)

(assert (=> b!33001 m!48895))

(declare-fun m!48897 () Bool)

(assert (=> b!33001 m!48897))

(assert (=> b!33001 m!48893))

(declare-fun m!48899 () Bool)

(assert (=> b!33001 m!48899))

(declare-fun m!48901 () Bool)

(assert (=> b!33001 m!48901))

(declare-fun m!48903 () Bool)

(assert (=> b!32992 m!48903))

(declare-fun m!48905 () Bool)

(assert (=> b!32998 m!48905))

(declare-fun m!48907 () Bool)

(assert (=> b!32998 m!48907))

(declare-fun m!48909 () Bool)

(assert (=> b!32998 m!48909))

(declare-fun m!48911 () Bool)

(assert (=> b!32998 m!48911))

(declare-fun m!48913 () Bool)

(assert (=> b!32998 m!48913))

(declare-fun m!48915 () Bool)

(assert (=> b!32998 m!48915))

(declare-fun m!48917 () Bool)

(assert (=> b!32998 m!48917))

(declare-fun m!48919 () Bool)

(assert (=> b!32998 m!48919))

(declare-fun m!48921 () Bool)

(assert (=> b!33000 m!48921))

(declare-fun m!48923 () Bool)

(assert (=> b!32993 m!48923))

(declare-fun m!48925 () Bool)

(assert (=> b!32986 m!48925))

(assert (=> b!32986 m!48925))

(declare-fun m!48927 () Bool)

(assert (=> b!32986 m!48927))

(declare-fun m!48929 () Bool)

(assert (=> b!32986 m!48929))

(assert (=> b!32986 m!48929))

(declare-fun m!48931 () Bool)

(assert (=> b!32986 m!48931))

(declare-fun m!48933 () Bool)

(assert (=> b!32994 m!48933))

(declare-fun m!48935 () Bool)

(assert (=> b!32991 m!48935))

(declare-fun m!48937 () Bool)

(assert (=> b!32991 m!48937))

(push 1)

