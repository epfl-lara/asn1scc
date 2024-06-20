; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12664 () Bool)

(assert start!12664)

(declare-fun b!64841 () Bool)

(declare-fun res!53813 () Bool)

(declare-fun e!42770 () Bool)

(assert (=> b!64841 (=> res!53813 e!42770)))

(declare-datatypes ((array!2828 0))(
  ( (array!2829 (arr!1864 (Array (_ BitVec 32) (_ BitVec 8))) (size!1300 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2246 0))(
  ( (BitStream!2247 (buf!1681 array!2828) (currentByte!3341 (_ BitVec 32)) (currentBit!3336 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5780 0))(
  ( (tuple2!5781 (_1!3001 BitStream!2246) (_2!3001 BitStream!2246)) )
))
(declare-fun lt!102528 () tuple2!5780)

(declare-datatypes ((Unit!4389 0))(
  ( (Unit!4390) )
))
(declare-datatypes ((tuple2!5782 0))(
  ( (tuple2!5783 (_1!3002 Unit!4389) (_2!3002 BitStream!2246)) )
))
(declare-fun lt!102525 () tuple2!5782)

(declare-fun isPrefixOf!0 (BitStream!2246 BitStream!2246) Bool)

(assert (=> b!64841 (= res!53813 (not (isPrefixOf!0 (_1!3001 lt!102528) (_2!3002 lt!102525))))))

(declare-fun e!42771 () Bool)

(declare-fun b!64842 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!102532 () tuple2!5782)

(declare-fun lt!102535 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!64842 (= e!42771 (= lt!102535 (bvsub (bvsub (bvadd (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64843 () Bool)

(declare-fun res!53818 () Bool)

(declare-fun e!42765 () Bool)

(assert (=> b!64843 (=> (not res!53818) (not e!42765))))

(declare-fun thiss!1379 () BitStream!2246)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!64843 (= res!53818 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 thiss!1379))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!64844 () Bool)

(declare-fun e!42768 () Bool)

(declare-fun array_inv!1182 (array!2828) Bool)

(assert (=> b!64844 (= e!42768 (array_inv!1182 (buf!1681 thiss!1379)))))

(declare-fun b!64845 () Bool)

(declare-fun res!53822 () Bool)

(declare-fun e!42773 () Bool)

(assert (=> b!64845 (=> res!53822 e!42773)))

(assert (=> b!64845 (= res!53822 (not (= (size!1300 (buf!1681 thiss!1379)) (size!1300 (buf!1681 (_2!3002 lt!102525))))))))

(declare-fun b!64846 () Bool)

(declare-fun e!42763 () Bool)

(declare-fun e!42764 () Bool)

(assert (=> b!64846 (= e!42763 e!42764)))

(declare-fun res!53817 () Bool)

(assert (=> b!64846 (=> res!53817 e!42764)))

(assert (=> b!64846 (= res!53817 (not (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!102525))))))

(assert (=> b!64846 (isPrefixOf!0 thiss!1379 (_2!3002 lt!102525))))

(declare-fun lt!102531 () Unit!4389)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2246 BitStream!2246 BitStream!2246) Unit!4389)

(assert (=> b!64846 (= lt!102531 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3002 lt!102532) (_2!3002 lt!102525)))))

(declare-fun srcBuffer!2 () array!2828)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2246 array!2828 (_ BitVec 64) (_ BitVec 64)) tuple2!5782)

(assert (=> b!64846 (= lt!102525 (appendBitsMSBFirstLoop!0 (_2!3002 lt!102532) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!42762 () Bool)

(assert (=> b!64846 e!42762))

(declare-fun res!53828 () Bool)

(assert (=> b!64846 (=> (not res!53828) (not e!42762))))

(assert (=> b!64846 (= res!53828 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102524 () Unit!4389)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2246 array!2828 (_ BitVec 64)) Unit!4389)

(assert (=> b!64846 (= lt!102524 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1681 (_2!3002 lt!102532)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102533 () tuple2!5780)

(declare-fun reader!0 (BitStream!2246 BitStream!2246) tuple2!5780)

(assert (=> b!64846 (= lt!102533 (reader!0 thiss!1379 (_2!3002 lt!102532)))))

(declare-fun b!64847 () Bool)

(declare-fun res!53824 () Bool)

(declare-fun e!42769 () Bool)

(assert (=> b!64847 (=> res!53824 e!42769)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!64847 (= res!53824 (not (invariant!0 (currentBit!3336 (_2!3002 lt!102532)) (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102532))))))))

(declare-fun b!64848 () Bool)

(assert (=> b!64848 (= e!42773 e!42769)))

(declare-fun res!53815 () Bool)

(assert (=> b!64848 (=> res!53815 e!42769)))

(assert (=> b!64848 (= res!53815 (not (= (size!1300 (buf!1681 (_2!3002 lt!102532))) (size!1300 (buf!1681 (_2!3002 lt!102525))))))))

(assert (=> b!64848 e!42771))

(declare-fun res!53825 () Bool)

(assert (=> b!64848 (=> (not res!53825) (not e!42771))))

(assert (=> b!64848 (= res!53825 (= (size!1300 (buf!1681 (_2!3002 lt!102525))) (size!1300 (buf!1681 thiss!1379))))))

(declare-fun b!64850 () Bool)

(declare-fun res!53819 () Bool)

(assert (=> b!64850 (=> res!53819 e!42770)))

(declare-fun lt!102523 () tuple2!5780)

(assert (=> b!64850 (= res!53819 (not (isPrefixOf!0 (_1!3001 lt!102528) (_1!3001 lt!102523))))))

(declare-fun b!64851 () Bool)

(declare-datatypes ((List!698 0))(
  ( (Nil!695) (Cons!694 (h!813 Bool) (t!1448 List!698)) )
))
(declare-fun head!517 (List!698) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2246 array!2828 (_ BitVec 64) (_ BitVec 64)) List!698)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2246 BitStream!2246 (_ BitVec 64)) List!698)

(assert (=> b!64851 (= e!42762 (= (head!517 (byteArrayBitContentToList!0 (_2!3002 lt!102532) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!517 (bitStreamReadBitsIntoList!0 (_2!3002 lt!102532) (_1!3001 lt!102533) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!64852 () Bool)

(declare-fun res!53827 () Bool)

(assert (=> b!64852 (=> res!53827 e!42770)))

(assert (=> b!64852 (= res!53827 (or (not (= (buf!1681 (_1!3001 lt!102528)) (buf!1681 (_1!3001 lt!102523)))) (not (= (buf!1681 (_1!3001 lt!102528)) (buf!1681 (_2!3002 lt!102525)))) (bvsge lt!102535 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!64853 () Bool)

(declare-fun res!53832 () Bool)

(assert (=> b!64853 (=> res!53832 e!42773)))

(assert (=> b!64853 (= res!53832 (not (invariant!0 (currentBit!3336 (_2!3002 lt!102525)) (currentByte!3341 (_2!3002 lt!102525)) (size!1300 (buf!1681 (_2!3002 lt!102525))))))))

(declare-fun b!64854 () Bool)

(assert (=> b!64854 (= e!42769 e!42770)))

(declare-fun res!53814 () Bool)

(assert (=> b!64854 (=> res!53814 e!42770)))

(assert (=> b!64854 (= res!53814 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102534 () (_ BitVec 64))

(declare-fun lt!102527 () List!698)

(assert (=> b!64854 (= lt!102527 (bitStreamReadBitsIntoList!0 (_2!3002 lt!102525) (_1!3001 lt!102523) lt!102534))))

(declare-fun lt!102520 () List!698)

(assert (=> b!64854 (= lt!102520 (bitStreamReadBitsIntoList!0 (_2!3002 lt!102525) (_1!3001 lt!102528) (bvsub to!314 i!635)))))

(assert (=> b!64854 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!102534)))

(declare-fun lt!102521 () Unit!4389)

(assert (=> b!64854 (= lt!102521 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3002 lt!102532) (buf!1681 (_2!3002 lt!102525)) lt!102534))))

(assert (=> b!64854 (= lt!102523 (reader!0 (_2!3002 lt!102532) (_2!3002 lt!102525)))))

(assert (=> b!64854 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102526 () Unit!4389)

(assert (=> b!64854 (= lt!102526 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1681 (_2!3002 lt!102525)) (bvsub to!314 i!635)))))

(assert (=> b!64854 (= lt!102528 (reader!0 thiss!1379 (_2!3002 lt!102525)))))

(declare-fun b!64855 () Bool)

(declare-fun res!53823 () Bool)

(assert (=> b!64855 (=> res!53823 e!42770)))

(declare-fun length!326 (List!698) Int)

(assert (=> b!64855 (= res!53823 (<= (length!326 lt!102520) 0))))

(declare-fun b!64856 () Bool)

(declare-fun e!42772 () Bool)

(assert (=> b!64856 (= e!42772 e!42763)))

(declare-fun res!53816 () Bool)

(assert (=> b!64856 (=> res!53816 e!42763)))

(assert (=> b!64856 (= res!53816 (not (isPrefixOf!0 thiss!1379 (_2!3002 lt!102532))))))

(assert (=> b!64856 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!102534)))

(assert (=> b!64856 (= lt!102534 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!102530 () Unit!4389)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2246 BitStream!2246 (_ BitVec 64) (_ BitVec 64)) Unit!4389)

(assert (=> b!64856 (= lt!102530 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3002 lt!102532) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2246 (_ BitVec 8) (_ BitVec 32)) tuple2!5782)

(assert (=> b!64856 (= lt!102532 (appendBitFromByte!0 thiss!1379 (select (arr!1864 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!64857 () Bool)

(declare-fun res!53821 () Bool)

(assert (=> b!64857 (=> res!53821 e!42770)))

(assert (=> b!64857 (= res!53821 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102528))) (currentByte!3341 (_1!3001 lt!102528)) (currentBit!3336 (_1!3001 lt!102528)))) (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102523))) (currentByte!3341 (_1!3001 lt!102523)) (currentBit!3336 (_1!3001 lt!102523))))))))

(declare-fun b!64858 () Bool)

(declare-fun res!53830 () Bool)

(assert (=> b!64858 (=> res!53830 e!42769)))

(assert (=> b!64858 (= res!53830 (not (invariant!0 (currentBit!3336 (_2!3002 lt!102532)) (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102525))))))))

(declare-fun b!64859 () Bool)

(assert (=> b!64859 (= e!42770 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102528)))) ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102528))) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102528))) (bvsub to!314 i!635)))))

(declare-fun b!64849 () Bool)

(declare-fun res!53826 () Bool)

(assert (=> b!64849 (=> res!53826 e!42770)))

(assert (=> b!64849 (= res!53826 (not (isPrefixOf!0 (_1!3001 lt!102523) (_2!3002 lt!102525))))))

(declare-fun res!53831 () Bool)

(assert (=> start!12664 (=> (not res!53831) (not e!42765))))

(assert (=> start!12664 (= res!53831 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1300 srcBuffer!2))))))))

(assert (=> start!12664 e!42765))

(assert (=> start!12664 true))

(assert (=> start!12664 (array_inv!1182 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2246) Bool)

(assert (=> start!12664 (and (inv!12 thiss!1379) e!42768)))

(declare-fun b!64860 () Bool)

(assert (=> b!64860 (= e!42764 e!42773)))

(declare-fun res!53829 () Bool)

(assert (=> b!64860 (=> res!53829 e!42773)))

(declare-fun lt!102522 () (_ BitVec 64))

(assert (=> b!64860 (= res!53829 (not (= lt!102535 (bvsub (bvadd lt!102522 to!314) i!635))))))

(assert (=> b!64860 (= lt!102535 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525))))))

(declare-fun b!64861 () Bool)

(assert (=> b!64861 (= e!42765 (not e!42772))))

(declare-fun res!53820 () Bool)

(assert (=> b!64861 (=> res!53820 e!42772)))

(assert (=> b!64861 (= res!53820 (bvsge i!635 to!314))))

(assert (=> b!64861 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!102529 () Unit!4389)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2246) Unit!4389)

(assert (=> b!64861 (= lt!102529 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!64861 (= lt!102522 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(assert (= (and start!12664 res!53831) b!64843))

(assert (= (and b!64843 res!53818) b!64861))

(assert (= (and b!64861 (not res!53820)) b!64856))

(assert (= (and b!64856 (not res!53816)) b!64846))

(assert (= (and b!64846 res!53828) b!64851))

(assert (= (and b!64846 (not res!53817)) b!64860))

(assert (= (and b!64860 (not res!53829)) b!64853))

(assert (= (and b!64853 (not res!53832)) b!64845))

(assert (= (and b!64845 (not res!53822)) b!64848))

(assert (= (and b!64848 res!53825) b!64842))

(assert (= (and b!64848 (not res!53815)) b!64847))

(assert (= (and b!64847 (not res!53824)) b!64858))

(assert (= (and b!64858 (not res!53830)) b!64854))

(assert (= (and b!64854 (not res!53814)) b!64855))

(assert (= (and b!64855 (not res!53823)) b!64841))

(assert (= (and b!64841 (not res!53813)) b!64849))

(assert (= (and b!64849 (not res!53826)) b!64850))

(assert (= (and b!64850 (not res!53819)) b!64852))

(assert (= (and b!64852 (not res!53827)) b!64857))

(assert (= (and b!64857 (not res!53821)) b!64859))

(assert (= start!12664 b!64844))

(declare-fun m!102875 () Bool)

(assert (=> b!64861 m!102875))

(declare-fun m!102877 () Bool)

(assert (=> b!64861 m!102877))

(declare-fun m!102879 () Bool)

(assert (=> b!64861 m!102879))

(declare-fun m!102881 () Bool)

(assert (=> b!64853 m!102881))

(declare-fun m!102883 () Bool)

(assert (=> b!64849 m!102883))

(declare-fun m!102885 () Bool)

(assert (=> b!64843 m!102885))

(declare-fun m!102887 () Bool)

(assert (=> b!64846 m!102887))

(declare-fun m!102889 () Bool)

(assert (=> b!64846 m!102889))

(declare-fun m!102891 () Bool)

(assert (=> b!64846 m!102891))

(declare-fun m!102893 () Bool)

(assert (=> b!64846 m!102893))

(declare-fun m!102895 () Bool)

(assert (=> b!64846 m!102895))

(declare-fun m!102897 () Bool)

(assert (=> b!64846 m!102897))

(declare-fun m!102899 () Bool)

(assert (=> b!64846 m!102899))

(declare-fun m!102901 () Bool)

(assert (=> b!64850 m!102901))

(declare-fun m!102903 () Bool)

(assert (=> b!64858 m!102903))

(declare-fun m!102905 () Bool)

(assert (=> b!64842 m!102905))

(declare-fun m!102907 () Bool)

(assert (=> start!12664 m!102907))

(declare-fun m!102909 () Bool)

(assert (=> start!12664 m!102909))

(declare-fun m!102911 () Bool)

(assert (=> b!64860 m!102911))

(declare-fun m!102913 () Bool)

(assert (=> b!64847 m!102913))

(declare-fun m!102915 () Bool)

(assert (=> b!64854 m!102915))

(declare-fun m!102917 () Bool)

(assert (=> b!64854 m!102917))

(declare-fun m!102919 () Bool)

(assert (=> b!64854 m!102919))

(declare-fun m!102921 () Bool)

(assert (=> b!64854 m!102921))

(declare-fun m!102923 () Bool)

(assert (=> b!64854 m!102923))

(declare-fun m!102925 () Bool)

(assert (=> b!64854 m!102925))

(declare-fun m!102927 () Bool)

(assert (=> b!64854 m!102927))

(declare-fun m!102929 () Bool)

(assert (=> b!64854 m!102929))

(declare-fun m!102931 () Bool)

(assert (=> b!64841 m!102931))

(declare-fun m!102933 () Bool)

(assert (=> b!64855 m!102933))

(declare-fun m!102935 () Bool)

(assert (=> b!64859 m!102935))

(declare-fun m!102937 () Bool)

(assert (=> b!64856 m!102937))

(declare-fun m!102939 () Bool)

(assert (=> b!64856 m!102939))

(declare-fun m!102941 () Bool)

(assert (=> b!64856 m!102941))

(assert (=> b!64856 m!102937))

(declare-fun m!102943 () Bool)

(assert (=> b!64856 m!102943))

(declare-fun m!102945 () Bool)

(assert (=> b!64856 m!102945))

(declare-fun m!102947 () Bool)

(assert (=> b!64851 m!102947))

(assert (=> b!64851 m!102947))

(declare-fun m!102949 () Bool)

(assert (=> b!64851 m!102949))

(declare-fun m!102951 () Bool)

(assert (=> b!64851 m!102951))

(assert (=> b!64851 m!102951))

(declare-fun m!102953 () Bool)

(assert (=> b!64851 m!102953))

(declare-fun m!102955 () Bool)

(assert (=> b!64844 m!102955))

(declare-fun m!102957 () Bool)

(assert (=> b!64857 m!102957))

(declare-fun m!102959 () Bool)

(assert (=> b!64857 m!102959))

(push 1)

(assert (not b!64846))

(assert (not b!64855))

(assert (not b!64844))

(assert (not b!64857))

(assert (not b!64860))

(assert (not b!64843))

(assert (not b!64851))

(assert (not b!64853))

(assert (not b!64861))

(assert (not b!64841))

(assert (not b!64854))

(assert (not b!64859))

(assert (not b!64858))

(assert (not b!64850))

(assert (not b!64842))

(assert (not b!64849))

(assert (not start!12664))

(assert (not b!64847))

(assert (not b!64856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!64981 () Bool)

(declare-datatypes ((tuple2!5800 0))(
  ( (tuple2!5801 (_1!3011 List!698) (_2!3011 BitStream!2246)) )
))
(declare-fun e!42833 () tuple2!5800)

(assert (=> b!64981 (= e!42833 (tuple2!5801 Nil!695 (_1!3001 lt!102528)))))

(declare-fun d!20298 () Bool)

(declare-fun e!42834 () Bool)

(assert (=> d!20298 e!42834))

(declare-fun c!4703 () Bool)

(assert (=> d!20298 (= c!4703 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102761 () List!698)

(assert (=> d!20298 (= lt!102761 (_1!3011 e!42833))))

(declare-fun c!4704 () Bool)

(assert (=> d!20298 (= c!4704 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20298 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20298 (= (bitStreamReadBitsIntoList!0 (_2!3002 lt!102525) (_1!3001 lt!102528) (bvsub to!314 i!635)) lt!102761)))

(declare-fun b!64984 () Bool)

(assert (=> b!64984 (= e!42834 (> (length!326 lt!102761) 0))))

(declare-fun lt!102762 () (_ BitVec 64))

(declare-fun b!64982 () Bool)

(declare-datatypes ((tuple2!5802 0))(
  ( (tuple2!5803 (_1!3012 Bool) (_2!3012 BitStream!2246)) )
))
(declare-fun lt!102763 () tuple2!5802)

(assert (=> b!64982 (= e!42833 (tuple2!5801 (Cons!694 (_1!3012 lt!102763) (bitStreamReadBitsIntoList!0 (_2!3002 lt!102525) (_2!3012 lt!102763) (bvsub (bvsub to!314 i!635) lt!102762))) (_2!3012 lt!102763)))))

(declare-fun readBit!0 (BitStream!2246) tuple2!5802)

(assert (=> b!64982 (= lt!102763 (readBit!0 (_1!3001 lt!102528)))))

(assert (=> b!64982 (= lt!102762 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!64983 () Bool)

(declare-fun isEmpty!203 (List!698) Bool)

(assert (=> b!64983 (= e!42834 (isEmpty!203 lt!102761))))

(assert (= (and d!20298 c!4704) b!64981))

(assert (= (and d!20298 (not c!4704)) b!64982))

(assert (= (and d!20298 c!4703) b!64983))

(assert (= (and d!20298 (not c!4703)) b!64984))

(declare-fun m!103171 () Bool)

(assert (=> b!64984 m!103171))

(declare-fun m!103173 () Bool)

(assert (=> b!64982 m!103173))

(declare-fun m!103175 () Bool)

(assert (=> b!64982 m!103175))

(declare-fun m!103177 () Bool)

(assert (=> b!64983 m!103177))

(assert (=> b!64854 d!20298))

(declare-fun d!20318 () Bool)

(assert (=> d!20318 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!102534)))

(declare-fun lt!102769 () Unit!4389)

(declare-fun choose!9 (BitStream!2246 array!2828 (_ BitVec 64) BitStream!2246) Unit!4389)

(assert (=> d!20318 (= lt!102769 (choose!9 (_2!3002 lt!102532) (buf!1681 (_2!3002 lt!102525)) lt!102534 (BitStream!2247 (buf!1681 (_2!3002 lt!102525)) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532)))))))

(assert (=> d!20318 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3002 lt!102532) (buf!1681 (_2!3002 lt!102525)) lt!102534) lt!102769)))

(declare-fun bs!4975 () Bool)

(assert (= bs!4975 d!20318))

(assert (=> bs!4975 m!102917))

(declare-fun m!103183 () Bool)

(assert (=> bs!4975 m!103183))

(assert (=> b!64854 d!20318))

(declare-fun lt!102827 () (_ BitVec 64))

(declare-fun lt!102824 () tuple2!5780)

(declare-fun b!64998 () Bool)

(declare-fun lt!102816 () (_ BitVec 64))

(declare-fun e!42842 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2246 (_ BitVec 64)) BitStream!2246)

(assert (=> b!64998 (= e!42842 (= (_1!3001 lt!102824) (withMovedBitIndex!0 (_2!3001 lt!102824) (bvsub lt!102816 lt!102827))))))

(assert (=> b!64998 (or (= (bvand lt!102816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102816 lt!102827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64998 (= lt!102827 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525))))))

(assert (=> b!64998 (= lt!102816 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))))))

(declare-fun b!64999 () Bool)

(declare-fun res!53893 () Bool)

(assert (=> b!64999 (=> (not res!53893) (not e!42842))))

(assert (=> b!64999 (= res!53893 (isPrefixOf!0 (_2!3001 lt!102824) (_2!3002 lt!102525)))))

(declare-fun b!65000 () Bool)

(declare-fun e!42843 () Unit!4389)

(declare-fun Unit!4403 () Unit!4389)

(assert (=> b!65000 (= e!42843 Unit!4403)))

(declare-fun b!65001 () Bool)

(declare-fun lt!102823 () Unit!4389)

(assert (=> b!65001 (= e!42843 lt!102823)))

(declare-fun lt!102829 () (_ BitVec 64))

(assert (=> b!65001 (= lt!102829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102828 () (_ BitVec 64))

(assert (=> b!65001 (= lt!102828 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2828 array!2828 (_ BitVec 64) (_ BitVec 64)) Unit!4389)

(assert (=> b!65001 (= lt!102823 (arrayBitRangesEqSymmetric!0 (buf!1681 (_2!3002 lt!102532)) (buf!1681 (_2!3002 lt!102525)) lt!102829 lt!102828))))

(declare-fun arrayBitRangesEq!0 (array!2828 array!2828 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65001 (arrayBitRangesEq!0 (buf!1681 (_2!3002 lt!102525)) (buf!1681 (_2!3002 lt!102532)) lt!102829 lt!102828)))

(declare-fun b!65002 () Bool)

(declare-fun res!53894 () Bool)

(assert (=> b!65002 (=> (not res!53894) (not e!42842))))

(assert (=> b!65002 (= res!53894 (isPrefixOf!0 (_1!3001 lt!102824) (_2!3002 lt!102532)))))

(declare-fun d!20322 () Bool)

(assert (=> d!20322 e!42842))

(declare-fun res!53895 () Bool)

(assert (=> d!20322 (=> (not res!53895) (not e!42842))))

(assert (=> d!20322 (= res!53895 (isPrefixOf!0 (_1!3001 lt!102824) (_2!3001 lt!102824)))))

(declare-fun lt!102822 () BitStream!2246)

(assert (=> d!20322 (= lt!102824 (tuple2!5781 lt!102822 (_2!3002 lt!102525)))))

(declare-fun lt!102825 () Unit!4389)

(declare-fun lt!102818 () Unit!4389)

(assert (=> d!20322 (= lt!102825 lt!102818)))

(assert (=> d!20322 (isPrefixOf!0 lt!102822 (_2!3002 lt!102525))))

(assert (=> d!20322 (= lt!102818 (lemmaIsPrefixTransitive!0 lt!102822 (_2!3002 lt!102525) (_2!3002 lt!102525)))))

(declare-fun lt!102821 () Unit!4389)

(declare-fun lt!102811 () Unit!4389)

(assert (=> d!20322 (= lt!102821 lt!102811)))

(assert (=> d!20322 (isPrefixOf!0 lt!102822 (_2!3002 lt!102525))))

(assert (=> d!20322 (= lt!102811 (lemmaIsPrefixTransitive!0 lt!102822 (_2!3002 lt!102532) (_2!3002 lt!102525)))))

(declare-fun lt!102815 () Unit!4389)

(assert (=> d!20322 (= lt!102815 e!42843)))

(declare-fun c!4707 () Bool)

(assert (=> d!20322 (= c!4707 (not (= (size!1300 (buf!1681 (_2!3002 lt!102532))) #b00000000000000000000000000000000)))))

(declare-fun lt!102810 () Unit!4389)

(declare-fun lt!102813 () Unit!4389)

(assert (=> d!20322 (= lt!102810 lt!102813)))

(assert (=> d!20322 (isPrefixOf!0 (_2!3002 lt!102525) (_2!3002 lt!102525))))

(assert (=> d!20322 (= lt!102813 (lemmaIsPrefixRefl!0 (_2!3002 lt!102525)))))

(declare-fun lt!102820 () Unit!4389)

(declare-fun lt!102826 () Unit!4389)

(assert (=> d!20322 (= lt!102820 lt!102826)))

(assert (=> d!20322 (= lt!102826 (lemmaIsPrefixRefl!0 (_2!3002 lt!102525)))))

(declare-fun lt!102812 () Unit!4389)

(declare-fun lt!102819 () Unit!4389)

(assert (=> d!20322 (= lt!102812 lt!102819)))

(assert (=> d!20322 (isPrefixOf!0 lt!102822 lt!102822)))

(assert (=> d!20322 (= lt!102819 (lemmaIsPrefixRefl!0 lt!102822))))

(declare-fun lt!102814 () Unit!4389)

(declare-fun lt!102817 () Unit!4389)

(assert (=> d!20322 (= lt!102814 lt!102817)))

(assert (=> d!20322 (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!102532))))

(assert (=> d!20322 (= lt!102817 (lemmaIsPrefixRefl!0 (_2!3002 lt!102532)))))

(assert (=> d!20322 (= lt!102822 (BitStream!2247 (buf!1681 (_2!3002 lt!102525)) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))))))

(assert (=> d!20322 (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!102525))))

(assert (=> d!20322 (= (reader!0 (_2!3002 lt!102532) (_2!3002 lt!102525)) lt!102824)))

(assert (= (and d!20322 c!4707) b!65001))

(assert (= (and d!20322 (not c!4707)) b!65000))

(assert (= (and d!20322 res!53895) b!65002))

(assert (= (and b!65002 res!53894) b!64999))

(assert (= (and b!64999 res!53893) b!64998))

(declare-fun m!103185 () Bool)

(assert (=> b!64998 m!103185))

(assert (=> b!64998 m!102911))

(assert (=> b!64998 m!102905))

(assert (=> d!20322 m!102893))

(declare-fun m!103187 () Bool)

(assert (=> d!20322 m!103187))

(declare-fun m!103189 () Bool)

(assert (=> d!20322 m!103189))

(declare-fun m!103191 () Bool)

(assert (=> d!20322 m!103191))

(declare-fun m!103193 () Bool)

(assert (=> d!20322 m!103193))

(declare-fun m!103195 () Bool)

(assert (=> d!20322 m!103195))

(declare-fun m!103197 () Bool)

(assert (=> d!20322 m!103197))

(declare-fun m!103199 () Bool)

(assert (=> d!20322 m!103199))

(declare-fun m!103201 () Bool)

(assert (=> d!20322 m!103201))

(declare-fun m!103203 () Bool)

(assert (=> d!20322 m!103203))

(declare-fun m!103205 () Bool)

(assert (=> d!20322 m!103205))

(assert (=> b!65001 m!102905))

(declare-fun m!103207 () Bool)

(assert (=> b!65001 m!103207))

(declare-fun m!103209 () Bool)

(assert (=> b!65001 m!103209))

(declare-fun m!103211 () Bool)

(assert (=> b!65002 m!103211))

(declare-fun m!103213 () Bool)

(assert (=> b!64999 m!103213))

(assert (=> b!64854 d!20322))

(declare-fun d!20324 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!102534) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532)))) lt!102534))))

(declare-fun bs!4976 () Bool)

(assert (= bs!4976 d!20324))

(declare-fun m!103215 () Bool)

(assert (=> bs!4976 m!103215))

(assert (=> b!64854 d!20324))

(declare-fun d!20326 () Bool)

(assert (=> d!20326 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!102830 () Unit!4389)

(assert (=> d!20326 (= lt!102830 (choose!9 thiss!1379 (buf!1681 (_2!3002 lt!102525)) (bvsub to!314 i!635) (BitStream!2247 (buf!1681 (_2!3002 lt!102525)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379))))))

(assert (=> d!20326 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1681 (_2!3002 lt!102525)) (bvsub to!314 i!635)) lt!102830)))

(declare-fun bs!4977 () Bool)

(assert (= bs!4977 d!20326))

(assert (=> bs!4977 m!102921))

(declare-fun m!103217 () Bool)

(assert (=> bs!4977 m!103217))

(assert (=> b!64854 d!20326))

(declare-fun d!20328 () Bool)

(assert (=> d!20328 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4978 () Bool)

(assert (= bs!4978 d!20328))

(declare-fun m!103219 () Bool)

(assert (=> bs!4978 m!103219))

(assert (=> b!64854 d!20328))

(declare-fun b!65003 () Bool)

(declare-fun e!42844 () tuple2!5800)

(assert (=> b!65003 (= e!42844 (tuple2!5801 Nil!695 (_1!3001 lt!102523)))))

(declare-fun d!20330 () Bool)

(declare-fun e!42845 () Bool)

(assert (=> d!20330 e!42845))

(declare-fun c!4708 () Bool)

(assert (=> d!20330 (= c!4708 (= lt!102534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102831 () List!698)

(assert (=> d!20330 (= lt!102831 (_1!3011 e!42844))))

(declare-fun c!4709 () Bool)

(assert (=> d!20330 (= c!4709 (= lt!102534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20330 (bvsge lt!102534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20330 (= (bitStreamReadBitsIntoList!0 (_2!3002 lt!102525) (_1!3001 lt!102523) lt!102534) lt!102831)))

(declare-fun b!65006 () Bool)

(assert (=> b!65006 (= e!42845 (> (length!326 lt!102831) 0))))

(declare-fun lt!102833 () tuple2!5802)

(declare-fun lt!102832 () (_ BitVec 64))

(declare-fun b!65004 () Bool)

(assert (=> b!65004 (= e!42844 (tuple2!5801 (Cons!694 (_1!3012 lt!102833) (bitStreamReadBitsIntoList!0 (_2!3002 lt!102525) (_2!3012 lt!102833) (bvsub lt!102534 lt!102832))) (_2!3012 lt!102833)))))

(assert (=> b!65004 (= lt!102833 (readBit!0 (_1!3001 lt!102523)))))

(assert (=> b!65004 (= lt!102832 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!65005 () Bool)

(assert (=> b!65005 (= e!42845 (isEmpty!203 lt!102831))))

(assert (= (and d!20330 c!4709) b!65003))

(assert (= (and d!20330 (not c!4709)) b!65004))

(assert (= (and d!20330 c!4708) b!65005))

(assert (= (and d!20330 (not c!4708)) b!65006))

(declare-fun m!103221 () Bool)

(assert (=> b!65006 m!103221))

(declare-fun m!103223 () Bool)

(assert (=> b!65004 m!103223))

(declare-fun m!103225 () Bool)

(assert (=> b!65004 m!103225))

(declare-fun m!103227 () Bool)

(assert (=> b!65005 m!103227))

(assert (=> b!64854 d!20330))

(declare-fun lt!102851 () (_ BitVec 64))

(declare-fun b!65007 () Bool)

(declare-fun lt!102848 () tuple2!5780)

(declare-fun lt!102840 () (_ BitVec 64))

(declare-fun e!42846 () Bool)

(assert (=> b!65007 (= e!42846 (= (_1!3001 lt!102848) (withMovedBitIndex!0 (_2!3001 lt!102848) (bvsub lt!102840 lt!102851))))))

(assert (=> b!65007 (or (= (bvand lt!102840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102851 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102840 lt!102851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65007 (= lt!102851 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525))))))

(assert (=> b!65007 (= lt!102840 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(declare-fun b!65008 () Bool)

(declare-fun res!53896 () Bool)

(assert (=> b!65008 (=> (not res!53896) (not e!42846))))

(assert (=> b!65008 (= res!53896 (isPrefixOf!0 (_2!3001 lt!102848) (_2!3002 lt!102525)))))

(declare-fun b!65009 () Bool)

(declare-fun e!42847 () Unit!4389)

(declare-fun Unit!4411 () Unit!4389)

(assert (=> b!65009 (= e!42847 Unit!4411)))

(declare-fun b!65010 () Bool)

(declare-fun lt!102847 () Unit!4389)

(assert (=> b!65010 (= e!42847 lt!102847)))

(declare-fun lt!102853 () (_ BitVec 64))

(assert (=> b!65010 (= lt!102853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102852 () (_ BitVec 64))

(assert (=> b!65010 (= lt!102852 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(assert (=> b!65010 (= lt!102847 (arrayBitRangesEqSymmetric!0 (buf!1681 thiss!1379) (buf!1681 (_2!3002 lt!102525)) lt!102853 lt!102852))))

(assert (=> b!65010 (arrayBitRangesEq!0 (buf!1681 (_2!3002 lt!102525)) (buf!1681 thiss!1379) lt!102853 lt!102852)))

(declare-fun b!65011 () Bool)

(declare-fun res!53897 () Bool)

(assert (=> b!65011 (=> (not res!53897) (not e!42846))))

(assert (=> b!65011 (= res!53897 (isPrefixOf!0 (_1!3001 lt!102848) thiss!1379))))

(declare-fun d!20332 () Bool)

(assert (=> d!20332 e!42846))

(declare-fun res!53898 () Bool)

(assert (=> d!20332 (=> (not res!53898) (not e!42846))))

(assert (=> d!20332 (= res!53898 (isPrefixOf!0 (_1!3001 lt!102848) (_2!3001 lt!102848)))))

(declare-fun lt!102846 () BitStream!2246)

(assert (=> d!20332 (= lt!102848 (tuple2!5781 lt!102846 (_2!3002 lt!102525)))))

(declare-fun lt!102849 () Unit!4389)

(declare-fun lt!102842 () Unit!4389)

(assert (=> d!20332 (= lt!102849 lt!102842)))

(assert (=> d!20332 (isPrefixOf!0 lt!102846 (_2!3002 lt!102525))))

(assert (=> d!20332 (= lt!102842 (lemmaIsPrefixTransitive!0 lt!102846 (_2!3002 lt!102525) (_2!3002 lt!102525)))))

(declare-fun lt!102845 () Unit!4389)

(declare-fun lt!102835 () Unit!4389)

(assert (=> d!20332 (= lt!102845 lt!102835)))

(assert (=> d!20332 (isPrefixOf!0 lt!102846 (_2!3002 lt!102525))))

(assert (=> d!20332 (= lt!102835 (lemmaIsPrefixTransitive!0 lt!102846 thiss!1379 (_2!3002 lt!102525)))))

(declare-fun lt!102839 () Unit!4389)

(assert (=> d!20332 (= lt!102839 e!42847)))

(declare-fun c!4710 () Bool)

(assert (=> d!20332 (= c!4710 (not (= (size!1300 (buf!1681 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!102834 () Unit!4389)

(declare-fun lt!102837 () Unit!4389)

(assert (=> d!20332 (= lt!102834 lt!102837)))

(assert (=> d!20332 (isPrefixOf!0 (_2!3002 lt!102525) (_2!3002 lt!102525))))

(assert (=> d!20332 (= lt!102837 (lemmaIsPrefixRefl!0 (_2!3002 lt!102525)))))

(declare-fun lt!102844 () Unit!4389)

(declare-fun lt!102850 () Unit!4389)

(assert (=> d!20332 (= lt!102844 lt!102850)))

(assert (=> d!20332 (= lt!102850 (lemmaIsPrefixRefl!0 (_2!3002 lt!102525)))))

(declare-fun lt!102836 () Unit!4389)

(declare-fun lt!102843 () Unit!4389)

(assert (=> d!20332 (= lt!102836 lt!102843)))

(assert (=> d!20332 (isPrefixOf!0 lt!102846 lt!102846)))

(assert (=> d!20332 (= lt!102843 (lemmaIsPrefixRefl!0 lt!102846))))

(declare-fun lt!102838 () Unit!4389)

(declare-fun lt!102841 () Unit!4389)

(assert (=> d!20332 (= lt!102838 lt!102841)))

(assert (=> d!20332 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20332 (= lt!102841 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20332 (= lt!102846 (BitStream!2247 (buf!1681 (_2!3002 lt!102525)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(assert (=> d!20332 (isPrefixOf!0 thiss!1379 (_2!3002 lt!102525))))

(assert (=> d!20332 (= (reader!0 thiss!1379 (_2!3002 lt!102525)) lt!102848)))

(assert (= (and d!20332 c!4710) b!65010))

(assert (= (and d!20332 (not c!4710)) b!65009))

(assert (= (and d!20332 res!53898) b!65011))

(assert (= (and b!65011 res!53897) b!65008))

(assert (= (and b!65008 res!53896) b!65007))

(declare-fun m!103229 () Bool)

(assert (=> b!65007 m!103229))

(assert (=> b!65007 m!102911))

(assert (=> b!65007 m!102879))

(assert (=> d!20332 m!102889))

(assert (=> d!20332 m!102877))

(assert (=> d!20332 m!103189))

(declare-fun m!103231 () Bool)

(assert (=> d!20332 m!103231))

(assert (=> d!20332 m!103193))

(assert (=> d!20332 m!102875))

(declare-fun m!103233 () Bool)

(assert (=> d!20332 m!103233))

(declare-fun m!103235 () Bool)

(assert (=> d!20332 m!103235))

(declare-fun m!103237 () Bool)

(assert (=> d!20332 m!103237))

(declare-fun m!103239 () Bool)

(assert (=> d!20332 m!103239))

(declare-fun m!103241 () Bool)

(assert (=> d!20332 m!103241))

(assert (=> b!65010 m!102879))

(declare-fun m!103243 () Bool)

(assert (=> b!65010 m!103243))

(declare-fun m!103245 () Bool)

(assert (=> b!65010 m!103245))

(declare-fun m!103247 () Bool)

(assert (=> b!65011 m!103247))

(declare-fun m!103249 () Bool)

(assert (=> b!65008 m!103249))

(assert (=> b!64854 d!20332))

(declare-fun d!20334 () Bool)

(assert (=> d!20334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 thiss!1379))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 thiss!1379))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4979 () Bool)

(assert (= bs!4979 d!20334))

(declare-fun m!103251 () Bool)

(assert (=> bs!4979 m!103251))

(assert (=> b!64843 d!20334))

(declare-fun d!20336 () Bool)

(assert (=> d!20336 (= (array_inv!1182 (buf!1681 thiss!1379)) (bvsge (size!1300 (buf!1681 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!64844 d!20336))

(declare-fun d!20338 () Bool)

(declare-fun size!1302 (List!698) Int)

(assert (=> d!20338 (= (length!326 lt!102520) (size!1302 lt!102520))))

(declare-fun bs!4980 () Bool)

(assert (= bs!4980 d!20338))

(declare-fun m!103253 () Bool)

(assert (=> bs!4980 m!103253))

(assert (=> b!64855 d!20338))

(declare-fun d!20340 () Bool)

(declare-fun res!53906 () Bool)

(declare-fun e!42853 () Bool)

(assert (=> d!20340 (=> (not res!53906) (not e!42853))))

(assert (=> d!20340 (= res!53906 (= (size!1300 (buf!1681 (_1!3001 lt!102528))) (size!1300 (buf!1681 (_2!3002 lt!102525)))))))

(assert (=> d!20340 (= (isPrefixOf!0 (_1!3001 lt!102528) (_2!3002 lt!102525)) e!42853)))

(declare-fun b!65018 () Bool)

(declare-fun res!53905 () Bool)

(assert (=> b!65018 (=> (not res!53905) (not e!42853))))

(assert (=> b!65018 (= res!53905 (bvsle (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102528))) (currentByte!3341 (_1!3001 lt!102528)) (currentBit!3336 (_1!3001 lt!102528))) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525)))))))

(declare-fun b!65019 () Bool)

(declare-fun e!42852 () Bool)

(assert (=> b!65019 (= e!42853 e!42852)))

(declare-fun res!53907 () Bool)

(assert (=> b!65019 (=> res!53907 e!42852)))

(assert (=> b!65019 (= res!53907 (= (size!1300 (buf!1681 (_1!3001 lt!102528))) #b00000000000000000000000000000000))))

(declare-fun b!65020 () Bool)

(assert (=> b!65020 (= e!42852 (arrayBitRangesEq!0 (buf!1681 (_1!3001 lt!102528)) (buf!1681 (_2!3002 lt!102525)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102528))) (currentByte!3341 (_1!3001 lt!102528)) (currentBit!3336 (_1!3001 lt!102528)))))))

(assert (= (and d!20340 res!53906) b!65018))

(assert (= (and b!65018 res!53905) b!65019))

(assert (= (and b!65019 (not res!53907)) b!65020))

(assert (=> b!65018 m!102957))

(assert (=> b!65018 m!102911))

(assert (=> b!65020 m!102957))

(assert (=> b!65020 m!102957))

(declare-fun m!103255 () Bool)

(assert (=> b!65020 m!103255))

(assert (=> b!64841 d!20340))

(declare-fun d!20342 () Bool)

(assert (=> d!20342 (= (head!517 (byteArrayBitContentToList!0 (_2!3002 lt!102532) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!813 (byteArrayBitContentToList!0 (_2!3002 lt!102532) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64851 d!20342))

(declare-fun d!20344 () Bool)

(declare-fun c!4713 () Bool)

(assert (=> d!20344 (= c!4713 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42856 () List!698)

(assert (=> d!20344 (= (byteArrayBitContentToList!0 (_2!3002 lt!102532) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42856)))

(declare-fun b!65025 () Bool)

(assert (=> b!65025 (= e!42856 Nil!695)))

(declare-fun b!65026 () Bool)

(assert (=> b!65026 (= e!42856 (Cons!694 (not (= (bvand ((_ sign_extend 24) (select (arr!1864 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3002 lt!102532) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20344 c!4713) b!65025))

(assert (= (and d!20344 (not c!4713)) b!65026))

(assert (=> b!65026 m!102937))

(declare-fun m!103257 () Bool)

(assert (=> b!65026 m!103257))

(declare-fun m!103259 () Bool)

(assert (=> b!65026 m!103259))

(assert (=> b!64851 d!20344))

(declare-fun d!20346 () Bool)

(assert (=> d!20346 (= (head!517 (bitStreamReadBitsIntoList!0 (_2!3002 lt!102532) (_1!3001 lt!102533) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!813 (bitStreamReadBitsIntoList!0 (_2!3002 lt!102532) (_1!3001 lt!102533) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!64851 d!20346))

(declare-fun b!65028 () Bool)

(declare-fun e!42859 () tuple2!5800)

(assert (=> b!65028 (= e!42859 (tuple2!5801 Nil!695 (_1!3001 lt!102533)))))

(declare-fun d!20348 () Bool)

(declare-fun e!42860 () Bool)

(assert (=> d!20348 e!42860))

(declare-fun c!4714 () Bool)

(assert (=> d!20348 (= c!4714 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102862 () List!698)

(assert (=> d!20348 (= lt!102862 (_1!3011 e!42859))))

(declare-fun c!4715 () Bool)

(assert (=> d!20348 (= c!4715 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20348 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20348 (= (bitStreamReadBitsIntoList!0 (_2!3002 lt!102532) (_1!3001 lt!102533) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102862)))

(declare-fun b!65031 () Bool)

(assert (=> b!65031 (= e!42860 (> (length!326 lt!102862) 0))))

(declare-fun lt!102864 () tuple2!5802)

(declare-fun lt!102863 () (_ BitVec 64))

(declare-fun b!65029 () Bool)

(assert (=> b!65029 (= e!42859 (tuple2!5801 (Cons!694 (_1!3012 lt!102864) (bitStreamReadBitsIntoList!0 (_2!3002 lt!102532) (_2!3012 lt!102864) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!102863))) (_2!3012 lt!102864)))))

(assert (=> b!65029 (= lt!102864 (readBit!0 (_1!3001 lt!102533)))))

(assert (=> b!65029 (= lt!102863 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!65030 () Bool)

(assert (=> b!65030 (= e!42860 (isEmpty!203 lt!102862))))

(assert (= (and d!20348 c!4715) b!65028))

(assert (= (and d!20348 (not c!4715)) b!65029))

(assert (= (and d!20348 c!4714) b!65030))

(assert (= (and d!20348 (not c!4714)) b!65031))

(declare-fun m!103261 () Bool)

(assert (=> b!65031 m!103261))

(declare-fun m!103263 () Bool)

(assert (=> b!65029 m!103263))

(declare-fun m!103265 () Bool)

(assert (=> b!65029 m!103265))

(declare-fun m!103267 () Bool)

(assert (=> b!65030 m!103267))

(assert (=> b!64851 d!20348))

(declare-fun d!20350 () Bool)

(declare-fun e!42873 () Bool)

(assert (=> d!20350 e!42873))

(declare-fun res!53936 () Bool)

(assert (=> d!20350 (=> (not res!53936) (not e!42873))))

(declare-fun lt!102907 () (_ BitVec 64))

(declare-fun lt!102908 () (_ BitVec 64))

(declare-fun lt!102910 () (_ BitVec 64))

(assert (=> d!20350 (= res!53936 (= lt!102910 (bvsub lt!102907 lt!102908)))))

(assert (=> d!20350 (or (= (bvand lt!102907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102908 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102907 lt!102908) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20350 (= lt!102908 (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532)))))))

(declare-fun lt!102905 () (_ BitVec 64))

(declare-fun lt!102909 () (_ BitVec 64))

(assert (=> d!20350 (= lt!102907 (bvmul lt!102905 lt!102909))))

(assert (=> d!20350 (or (= lt!102905 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102909 (bvsdiv (bvmul lt!102905 lt!102909) lt!102905)))))

(assert (=> d!20350 (= lt!102909 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20350 (= lt!102905 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))))))

(assert (=> d!20350 (= lt!102910 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532)))))))

(assert (=> d!20350 (invariant!0 (currentBit!3336 (_2!3002 lt!102532)) (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102532))))))

(assert (=> d!20350 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))) lt!102910)))

(declare-fun b!65060 () Bool)

(declare-fun res!53937 () Bool)

(assert (=> b!65060 (=> (not res!53937) (not e!42873))))

(assert (=> b!65060 (= res!53937 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102910))))

(declare-fun b!65061 () Bool)

(declare-fun lt!102906 () (_ BitVec 64))

(assert (=> b!65061 (= e!42873 (bvsle lt!102910 (bvmul lt!102906 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65061 (or (= lt!102906 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102906 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102906)))))

(assert (=> b!65061 (= lt!102906 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))))))

(assert (= (and d!20350 res!53936) b!65060))

(assert (= (and b!65060 res!53937) b!65061))

(declare-fun m!103297 () Bool)

(assert (=> d!20350 m!103297))

(assert (=> d!20350 m!102913))

(assert (=> b!64842 d!20350))

(declare-fun d!20354 () Bool)

(assert (=> d!20354 (= (invariant!0 (currentBit!3336 (_2!3002 lt!102525)) (currentByte!3341 (_2!3002 lt!102525)) (size!1300 (buf!1681 (_2!3002 lt!102525)))) (and (bvsge (currentBit!3336 (_2!3002 lt!102525)) #b00000000000000000000000000000000) (bvslt (currentBit!3336 (_2!3002 lt!102525)) #b00000000000000000000000000001000) (bvsge (currentByte!3341 (_2!3002 lt!102525)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3341 (_2!3002 lt!102525)) (size!1300 (buf!1681 (_2!3002 lt!102525)))) (and (= (currentBit!3336 (_2!3002 lt!102525)) #b00000000000000000000000000000000) (= (currentByte!3341 (_2!3002 lt!102525)) (size!1300 (buf!1681 (_2!3002 lt!102525))))))))))

(assert (=> b!64853 d!20354))

(declare-fun d!20356 () Bool)

(declare-fun res!53939 () Bool)

(declare-fun e!42875 () Bool)

(assert (=> d!20356 (=> (not res!53939) (not e!42875))))

(assert (=> d!20356 (= res!53939 (= (size!1300 (buf!1681 (_1!3001 lt!102523))) (size!1300 (buf!1681 (_2!3002 lt!102525)))))))

(assert (=> d!20356 (= (isPrefixOf!0 (_1!3001 lt!102523) (_2!3002 lt!102525)) e!42875)))

(declare-fun b!65062 () Bool)

(declare-fun res!53938 () Bool)

(assert (=> b!65062 (=> (not res!53938) (not e!42875))))

(assert (=> b!65062 (= res!53938 (bvsle (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102523))) (currentByte!3341 (_1!3001 lt!102523)) (currentBit!3336 (_1!3001 lt!102523))) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525)))))))

(declare-fun b!65063 () Bool)

(declare-fun e!42874 () Bool)

(assert (=> b!65063 (= e!42875 e!42874)))

(declare-fun res!53940 () Bool)

(assert (=> b!65063 (=> res!53940 e!42874)))

(assert (=> b!65063 (= res!53940 (= (size!1300 (buf!1681 (_1!3001 lt!102523))) #b00000000000000000000000000000000))))

(declare-fun b!65064 () Bool)

(assert (=> b!65064 (= e!42874 (arrayBitRangesEq!0 (buf!1681 (_1!3001 lt!102523)) (buf!1681 (_2!3002 lt!102525)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102523))) (currentByte!3341 (_1!3001 lt!102523)) (currentBit!3336 (_1!3001 lt!102523)))))))

(assert (= (and d!20356 res!53939) b!65062))

(assert (= (and b!65062 res!53938) b!65063))

(assert (= (and b!65063 (not res!53940)) b!65064))

(assert (=> b!65062 m!102959))

(assert (=> b!65062 m!102911))

(assert (=> b!65064 m!102959))

(assert (=> b!65064 m!102959))

(declare-fun m!103299 () Bool)

(assert (=> b!65064 m!103299))

(assert (=> b!64849 d!20356))

(declare-fun d!20358 () Bool)

(assert (=> d!20358 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102528)))) ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102528))) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102528))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102528)))) ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102528))) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102528)))) (bvsub to!314 i!635)))))

(declare-fun bs!4981 () Bool)

(assert (= bs!4981 d!20358))

(declare-fun m!103301 () Bool)

(assert (=> bs!4981 m!103301))

(assert (=> b!64859 d!20358))

(declare-fun d!20360 () Bool)

(declare-fun res!53942 () Bool)

(declare-fun e!42877 () Bool)

(assert (=> d!20360 (=> (not res!53942) (not e!42877))))

(assert (=> d!20360 (= res!53942 (= (size!1300 (buf!1681 (_1!3001 lt!102528))) (size!1300 (buf!1681 (_1!3001 lt!102523)))))))

(assert (=> d!20360 (= (isPrefixOf!0 (_1!3001 lt!102528) (_1!3001 lt!102523)) e!42877)))

(declare-fun b!65065 () Bool)

(declare-fun res!53941 () Bool)

(assert (=> b!65065 (=> (not res!53941) (not e!42877))))

(assert (=> b!65065 (= res!53941 (bvsle (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102528))) (currentByte!3341 (_1!3001 lt!102528)) (currentBit!3336 (_1!3001 lt!102528))) (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102523))) (currentByte!3341 (_1!3001 lt!102523)) (currentBit!3336 (_1!3001 lt!102523)))))))

(declare-fun b!65066 () Bool)

(declare-fun e!42876 () Bool)

(assert (=> b!65066 (= e!42877 e!42876)))

(declare-fun res!53943 () Bool)

(assert (=> b!65066 (=> res!53943 e!42876)))

(assert (=> b!65066 (= res!53943 (= (size!1300 (buf!1681 (_1!3001 lt!102528))) #b00000000000000000000000000000000))))

(declare-fun b!65067 () Bool)

(assert (=> b!65067 (= e!42876 (arrayBitRangesEq!0 (buf!1681 (_1!3001 lt!102528)) (buf!1681 (_1!3001 lt!102523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102528))) (currentByte!3341 (_1!3001 lt!102528)) (currentBit!3336 (_1!3001 lt!102528)))))))

(assert (= (and d!20360 res!53942) b!65065))

(assert (= (and b!65065 res!53941) b!65066))

(assert (= (and b!65066 (not res!53943)) b!65067))

(assert (=> b!65065 m!102957))

(assert (=> b!65065 m!102959))

(assert (=> b!65067 m!102957))

(assert (=> b!65067 m!102957))

(declare-fun m!103303 () Bool)

(assert (=> b!65067 m!103303))

(assert (=> b!64850 d!20360))

(declare-fun d!20362 () Bool)

(declare-fun res!53947 () Bool)

(declare-fun e!42881 () Bool)

(assert (=> d!20362 (=> (not res!53947) (not e!42881))))

(assert (=> d!20362 (= res!53947 (= (size!1300 (buf!1681 thiss!1379)) (size!1300 (buf!1681 thiss!1379))))))

(assert (=> d!20362 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42881)))

(declare-fun b!65068 () Bool)

(declare-fun res!53946 () Bool)

(assert (=> b!65068 (=> (not res!53946) (not e!42881))))

(assert (=> b!65068 (= res!53946 (bvsle (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)) (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379))))))

(declare-fun b!65069 () Bool)

(declare-fun e!42880 () Bool)

(assert (=> b!65069 (= e!42881 e!42880)))

(declare-fun res!53948 () Bool)

(assert (=> b!65069 (=> res!53948 e!42880)))

(assert (=> b!65069 (= res!53948 (= (size!1300 (buf!1681 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65070 () Bool)

(assert (=> b!65070 (= e!42880 (arrayBitRangesEq!0 (buf!1681 thiss!1379) (buf!1681 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379))))))

(assert (= (and d!20362 res!53947) b!65068))

(assert (= (and b!65068 res!53946) b!65069))

(assert (= (and b!65069 (not res!53948)) b!65070))

(assert (=> b!65068 m!102879))

(assert (=> b!65068 m!102879))

(assert (=> b!65070 m!102879))

(assert (=> b!65070 m!102879))

(declare-fun m!103305 () Bool)

(assert (=> b!65070 m!103305))

(assert (=> b!64861 d!20362))

(declare-fun d!20364 () Bool)

(assert (=> d!20364 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!102943 () Unit!4389)

(declare-fun choose!11 (BitStream!2246) Unit!4389)

(assert (=> d!20364 (= lt!102943 (choose!11 thiss!1379))))

(assert (=> d!20364 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!102943)))

(declare-fun bs!4983 () Bool)

(assert (= bs!4983 d!20364))

(assert (=> bs!4983 m!102875))

(declare-fun m!103313 () Bool)

(assert (=> bs!4983 m!103313))

(assert (=> b!64861 d!20364))

(declare-fun d!20372 () Bool)

(declare-fun e!42885 () Bool)

(assert (=> d!20372 e!42885))

(declare-fun res!53957 () Bool)

(assert (=> d!20372 (=> (not res!53957) (not e!42885))))

(declare-fun lt!102946 () (_ BitVec 64))

(declare-fun lt!102949 () (_ BitVec 64))

(declare-fun lt!102947 () (_ BitVec 64))

(assert (=> d!20372 (= res!53957 (= lt!102949 (bvsub lt!102946 lt!102947)))))

(assert (=> d!20372 (or (= (bvand lt!102946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102947 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102946 lt!102947) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20372 (= lt!102947 (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 thiss!1379))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379))))))

(declare-fun lt!102944 () (_ BitVec 64))

(declare-fun lt!102948 () (_ BitVec 64))

(assert (=> d!20372 (= lt!102946 (bvmul lt!102944 lt!102948))))

(assert (=> d!20372 (or (= lt!102944 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102948 (bvsdiv (bvmul lt!102944 lt!102948) lt!102944)))))

(assert (=> d!20372 (= lt!102948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20372 (= lt!102944 ((_ sign_extend 32) (size!1300 (buf!1681 thiss!1379))))))

(assert (=> d!20372 (= lt!102949 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3341 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3336 thiss!1379))))))

(assert (=> d!20372 (invariant!0 (currentBit!3336 thiss!1379) (currentByte!3341 thiss!1379) (size!1300 (buf!1681 thiss!1379)))))

(assert (=> d!20372 (= (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)) lt!102949)))

(declare-fun b!65081 () Bool)

(declare-fun res!53958 () Bool)

(assert (=> b!65081 (=> (not res!53958) (not e!42885))))

(assert (=> b!65081 (= res!53958 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102949))))

(declare-fun b!65082 () Bool)

(declare-fun lt!102945 () (_ BitVec 64))

(assert (=> b!65082 (= e!42885 (bvsle lt!102949 (bvmul lt!102945 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65082 (or (= lt!102945 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102945 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102945)))))

(assert (=> b!65082 (= lt!102945 ((_ sign_extend 32) (size!1300 (buf!1681 thiss!1379))))))

(assert (= (and d!20372 res!53957) b!65081))

(assert (= (and b!65081 res!53958) b!65082))

(assert (=> d!20372 m!103251))

(declare-fun m!103315 () Bool)

(assert (=> d!20372 m!103315))

(assert (=> b!64861 d!20372))

(declare-fun d!20376 () Bool)

(declare-fun e!42886 () Bool)

(assert (=> d!20376 e!42886))

(declare-fun res!53959 () Bool)

(assert (=> d!20376 (=> (not res!53959) (not e!42886))))

(declare-fun lt!102955 () (_ BitVec 64))

(declare-fun lt!102952 () (_ BitVec 64))

(declare-fun lt!102953 () (_ BitVec 64))

(assert (=> d!20376 (= res!53959 (= lt!102955 (bvsub lt!102952 lt!102953)))))

(assert (=> d!20376 (or (= (bvand lt!102952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102953 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102952 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102952 lt!102953) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20376 (= lt!102953 (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102525))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102525)))))))

(declare-fun lt!102950 () (_ BitVec 64))

(declare-fun lt!102954 () (_ BitVec 64))

(assert (=> d!20376 (= lt!102952 (bvmul lt!102950 lt!102954))))

(assert (=> d!20376 (or (= lt!102950 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!102954 (bvsdiv (bvmul lt!102950 lt!102954) lt!102950)))))

(assert (=> d!20376 (= lt!102954 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20376 (= lt!102950 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))))))

(assert (=> d!20376 (= lt!102955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102525))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102525)))))))

(assert (=> d!20376 (invariant!0 (currentBit!3336 (_2!3002 lt!102525)) (currentByte!3341 (_2!3002 lt!102525)) (size!1300 (buf!1681 (_2!3002 lt!102525))))))

(assert (=> d!20376 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525))) lt!102955)))

(declare-fun b!65083 () Bool)

(declare-fun res!53960 () Bool)

(assert (=> b!65083 (=> (not res!53960) (not e!42886))))

(assert (=> b!65083 (= res!53960 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!102955))))

(declare-fun b!65084 () Bool)

(declare-fun lt!102951 () (_ BitVec 64))

(assert (=> b!65084 (= e!42886 (bvsle lt!102955 (bvmul lt!102951 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65084 (or (= lt!102951 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!102951 #b0000000000000000000000000000000000000000000000000000000000001000) lt!102951)))))

(assert (=> b!65084 (= lt!102951 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102525)))))))

(assert (= (and d!20376 res!53959) b!65083))

(assert (= (and b!65083 res!53960) b!65084))

(declare-fun m!103317 () Bool)

(assert (=> d!20376 m!103317))

(assert (=> d!20376 m!102881))

(assert (=> b!64860 d!20376))

(declare-fun b!65085 () Bool)

(declare-fun lt!102973 () (_ BitVec 64))

(declare-fun lt!102970 () tuple2!5780)

(declare-fun e!42887 () Bool)

(declare-fun lt!102962 () (_ BitVec 64))

(assert (=> b!65085 (= e!42887 (= (_1!3001 lt!102970) (withMovedBitIndex!0 (_2!3001 lt!102970) (bvsub lt!102962 lt!102973))))))

(assert (=> b!65085 (or (= (bvand lt!102962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!102973 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!102962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!102962 lt!102973) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65085 (= lt!102973 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))))))

(assert (=> b!65085 (= lt!102962 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(declare-fun b!65086 () Bool)

(declare-fun res!53961 () Bool)

(assert (=> b!65086 (=> (not res!53961) (not e!42887))))

(assert (=> b!65086 (= res!53961 (isPrefixOf!0 (_2!3001 lt!102970) (_2!3002 lt!102532)))))

(declare-fun b!65087 () Bool)

(declare-fun e!42888 () Unit!4389)

(declare-fun Unit!4413 () Unit!4389)

(assert (=> b!65087 (= e!42888 Unit!4413)))

(declare-fun b!65088 () Bool)

(declare-fun lt!102969 () Unit!4389)

(assert (=> b!65088 (= e!42888 lt!102969)))

(declare-fun lt!102975 () (_ BitVec 64))

(assert (=> b!65088 (= lt!102975 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!102974 () (_ BitVec 64))

(assert (=> b!65088 (= lt!102974 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(assert (=> b!65088 (= lt!102969 (arrayBitRangesEqSymmetric!0 (buf!1681 thiss!1379) (buf!1681 (_2!3002 lt!102532)) lt!102975 lt!102974))))

(assert (=> b!65088 (arrayBitRangesEq!0 (buf!1681 (_2!3002 lt!102532)) (buf!1681 thiss!1379) lt!102975 lt!102974)))

(declare-fun b!65089 () Bool)

(declare-fun res!53962 () Bool)

(assert (=> b!65089 (=> (not res!53962) (not e!42887))))

(assert (=> b!65089 (= res!53962 (isPrefixOf!0 (_1!3001 lt!102970) thiss!1379))))

(declare-fun d!20378 () Bool)

(assert (=> d!20378 e!42887))

(declare-fun res!53963 () Bool)

(assert (=> d!20378 (=> (not res!53963) (not e!42887))))

(assert (=> d!20378 (= res!53963 (isPrefixOf!0 (_1!3001 lt!102970) (_2!3001 lt!102970)))))

(declare-fun lt!102968 () BitStream!2246)

(assert (=> d!20378 (= lt!102970 (tuple2!5781 lt!102968 (_2!3002 lt!102532)))))

(declare-fun lt!102971 () Unit!4389)

(declare-fun lt!102964 () Unit!4389)

(assert (=> d!20378 (= lt!102971 lt!102964)))

(assert (=> d!20378 (isPrefixOf!0 lt!102968 (_2!3002 lt!102532))))

(assert (=> d!20378 (= lt!102964 (lemmaIsPrefixTransitive!0 lt!102968 (_2!3002 lt!102532) (_2!3002 lt!102532)))))

(declare-fun lt!102967 () Unit!4389)

(declare-fun lt!102957 () Unit!4389)

(assert (=> d!20378 (= lt!102967 lt!102957)))

(assert (=> d!20378 (isPrefixOf!0 lt!102968 (_2!3002 lt!102532))))

(assert (=> d!20378 (= lt!102957 (lemmaIsPrefixTransitive!0 lt!102968 thiss!1379 (_2!3002 lt!102532)))))

(declare-fun lt!102961 () Unit!4389)

(assert (=> d!20378 (= lt!102961 e!42888)))

(declare-fun c!4716 () Bool)

(assert (=> d!20378 (= c!4716 (not (= (size!1300 (buf!1681 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!102956 () Unit!4389)

(declare-fun lt!102959 () Unit!4389)

(assert (=> d!20378 (= lt!102956 lt!102959)))

(assert (=> d!20378 (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!102532))))

(assert (=> d!20378 (= lt!102959 (lemmaIsPrefixRefl!0 (_2!3002 lt!102532)))))

(declare-fun lt!102966 () Unit!4389)

(declare-fun lt!102972 () Unit!4389)

(assert (=> d!20378 (= lt!102966 lt!102972)))

(assert (=> d!20378 (= lt!102972 (lemmaIsPrefixRefl!0 (_2!3002 lt!102532)))))

(declare-fun lt!102958 () Unit!4389)

(declare-fun lt!102965 () Unit!4389)

(assert (=> d!20378 (= lt!102958 lt!102965)))

(assert (=> d!20378 (isPrefixOf!0 lt!102968 lt!102968)))

(assert (=> d!20378 (= lt!102965 (lemmaIsPrefixRefl!0 lt!102968))))

(declare-fun lt!102960 () Unit!4389)

(declare-fun lt!102963 () Unit!4389)

(assert (=> d!20378 (= lt!102960 lt!102963)))

(assert (=> d!20378 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20378 (= lt!102963 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20378 (= lt!102968 (BitStream!2247 (buf!1681 (_2!3002 lt!102532)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(assert (=> d!20378 (isPrefixOf!0 thiss!1379 (_2!3002 lt!102532))))

(assert (=> d!20378 (= (reader!0 thiss!1379 (_2!3002 lt!102532)) lt!102970)))

(assert (= (and d!20378 c!4716) b!65088))

(assert (= (and d!20378 (not c!4716)) b!65087))

(assert (= (and d!20378 res!53963) b!65089))

(assert (= (and b!65089 res!53962) b!65086))

(assert (= (and b!65086 res!53961) b!65085))

(declare-fun m!103319 () Bool)

(assert (=> b!65085 m!103319))

(assert (=> b!65085 m!102905))

(assert (=> b!65085 m!102879))

(assert (=> d!20378 m!102941))

(assert (=> d!20378 m!102877))

(assert (=> d!20378 m!103187))

(declare-fun m!103321 () Bool)

(assert (=> d!20378 m!103321))

(assert (=> d!20378 m!103195))

(assert (=> d!20378 m!102875))

(declare-fun m!103323 () Bool)

(assert (=> d!20378 m!103323))

(declare-fun m!103325 () Bool)

(assert (=> d!20378 m!103325))

(declare-fun m!103327 () Bool)

(assert (=> d!20378 m!103327))

(declare-fun m!103329 () Bool)

(assert (=> d!20378 m!103329))

(declare-fun m!103331 () Bool)

(assert (=> d!20378 m!103331))

(assert (=> b!65088 m!102879))

(declare-fun m!103333 () Bool)

(assert (=> b!65088 m!103333))

(declare-fun m!103335 () Bool)

(assert (=> b!65088 m!103335))

(declare-fun m!103337 () Bool)

(assert (=> b!65089 m!103337))

(declare-fun m!103339 () Bool)

(assert (=> b!65086 m!103339))

(assert (=> b!64846 d!20378))

(declare-fun d!20380 () Bool)

(declare-fun res!53965 () Bool)

(declare-fun e!42890 () Bool)

(assert (=> d!20380 (=> (not res!53965) (not e!42890))))

(assert (=> d!20380 (= res!53965 (= (size!1300 (buf!1681 (_2!3002 lt!102532))) (size!1300 (buf!1681 (_2!3002 lt!102525)))))))

(assert (=> d!20380 (= (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!102525)) e!42890)))

(declare-fun b!65090 () Bool)

(declare-fun res!53964 () Bool)

(assert (=> b!65090 (=> (not res!53964) (not e!42890))))

(assert (=> b!65090 (= res!53964 (bvsle (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525)))))))

(declare-fun b!65091 () Bool)

(declare-fun e!42889 () Bool)

(assert (=> b!65091 (= e!42890 e!42889)))

(declare-fun res!53966 () Bool)

(assert (=> b!65091 (=> res!53966 e!42889)))

(assert (=> b!65091 (= res!53966 (= (size!1300 (buf!1681 (_2!3002 lt!102532))) #b00000000000000000000000000000000))))

(declare-fun b!65092 () Bool)

(assert (=> b!65092 (= e!42889 (arrayBitRangesEq!0 (buf!1681 (_2!3002 lt!102532)) (buf!1681 (_2!3002 lt!102525)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532)))))))

(assert (= (and d!20380 res!53965) b!65090))

(assert (= (and b!65090 res!53964) b!65091))

(assert (= (and b!65091 (not res!53966)) b!65092))

(assert (=> b!65090 m!102905))

(assert (=> b!65090 m!102911))

(assert (=> b!65092 m!102905))

(assert (=> b!65092 m!102905))

(declare-fun m!103341 () Bool)

(assert (=> b!65092 m!103341))

(assert (=> b!64846 d!20380))

(declare-fun d!20382 () Bool)

(assert (=> d!20382 (isPrefixOf!0 thiss!1379 (_2!3002 lt!102525))))

(declare-fun lt!102987 () Unit!4389)

(declare-fun choose!30 (BitStream!2246 BitStream!2246 BitStream!2246) Unit!4389)

(assert (=> d!20382 (= lt!102987 (choose!30 thiss!1379 (_2!3002 lt!102532) (_2!3002 lt!102525)))))

(assert (=> d!20382 (isPrefixOf!0 thiss!1379 (_2!3002 lt!102532))))

(assert (=> d!20382 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3002 lt!102532) (_2!3002 lt!102525)) lt!102987)))

(declare-fun bs!4984 () Bool)

(assert (= bs!4984 d!20382))

(assert (=> bs!4984 m!102889))

(declare-fun m!103355 () Bool)

(assert (=> bs!4984 m!103355))

(assert (=> bs!4984 m!102941))

(assert (=> b!64846 d!20382))

(declare-fun d!20392 () Bool)

(assert (=> d!20392 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4985 () Bool)

(assert (= bs!4985 d!20392))

(declare-fun m!103357 () Bool)

(assert (=> bs!4985 m!103357))

(assert (=> b!64846 d!20392))

(declare-fun d!20396 () Bool)

(assert (=> d!20396 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 thiss!1379)) ((_ sign_extend 32) (currentBit!3336 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!102988 () Unit!4389)

(assert (=> d!20396 (= lt!102988 (choose!9 thiss!1379 (buf!1681 (_2!3002 lt!102532)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2247 (buf!1681 (_2!3002 lt!102532)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379))))))

(assert (=> d!20396 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1681 (_2!3002 lt!102532)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!102988)))

(declare-fun bs!4986 () Bool)

(assert (= bs!4986 d!20396))

(assert (=> bs!4986 m!102895))

(declare-fun m!103359 () Bool)

(assert (=> bs!4986 m!103359))

(assert (=> b!64846 d!20396))

(declare-fun b!65248 () Bool)

(declare-fun e!42967 () tuple2!5782)

(declare-fun Unit!4414 () Unit!4389)

(assert (=> b!65248 (= e!42967 (tuple2!5783 Unit!4414 (_2!3002 lt!102532)))))

(assert (=> b!65248 (= (size!1300 (buf!1681 (_2!3002 lt!102532))) (size!1300 (buf!1681 (_2!3002 lt!102532))))))

(declare-fun lt!103484 () Unit!4389)

(declare-fun Unit!4415 () Unit!4389)

(assert (=> b!65248 (= lt!103484 Unit!4415)))

(declare-fun call!835 () tuple2!5780)

(declare-fun checkByteArrayBitContent!0 (BitStream!2246 array!2828 array!2828 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5804 0))(
  ( (tuple2!5805 (_1!3013 array!2828) (_2!3013 BitStream!2246)) )
))
(declare-fun readBits!0 (BitStream!2246 (_ BitVec 64)) tuple2!5804)

(assert (=> b!65248 (checkByteArrayBitContent!0 (_2!3002 lt!102532) srcBuffer!2 (_1!3013 (readBits!0 (_1!3001 call!835) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!20398 () Bool)

(declare-fun e!42966 () Bool)

(assert (=> d!20398 e!42966))

(declare-fun res!54095 () Bool)

(assert (=> d!20398 (=> (not res!54095) (not e!42966))))

(declare-fun lt!103466 () tuple2!5782)

(declare-fun lt!103478 () (_ BitVec 64))

(assert (=> d!20398 (= res!54095 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103466))) (currentByte!3341 (_2!3002 lt!103466)) (currentBit!3336 (_2!3002 lt!103466))) (bvsub lt!103478 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20398 (or (= (bvand lt!103478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103478 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!103499 () (_ BitVec 64))

(assert (=> d!20398 (= lt!103478 (bvadd lt!103499 to!314))))

(assert (=> d!20398 (or (not (= (bvand lt!103499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103499 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20398 (= lt!103499 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))))))

(assert (=> d!20398 (= lt!103466 e!42967)))

(declare-fun c!4731 () Bool)

(assert (=> d!20398 (= c!4731 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!103477 () Unit!4389)

(declare-fun lt!103483 () Unit!4389)

(assert (=> d!20398 (= lt!103477 lt!103483)))

(assert (=> d!20398 (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!102532))))

(assert (=> d!20398 (= lt!103483 (lemmaIsPrefixRefl!0 (_2!3002 lt!102532)))))

(declare-fun lt!103468 () (_ BitVec 64))

(assert (=> d!20398 (= lt!103468 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))))))

(assert (=> d!20398 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20398 (= (appendBitsMSBFirstLoop!0 (_2!3002 lt!102532) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!103466)))

(declare-fun b!65249 () Bool)

(declare-fun lt!103464 () tuple2!5780)

(assert (=> b!65249 (= e!42966 (= (bitStreamReadBitsIntoList!0 (_2!3002 lt!103466) (_1!3001 lt!103464) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3002 lt!103466) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!65249 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65249 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!103475 () Unit!4389)

(declare-fun lt!103493 () Unit!4389)

(assert (=> b!65249 (= lt!103475 lt!103493)))

(declare-fun lt!103487 () (_ BitVec 64))

(assert (=> b!65249 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!103466)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!103487)))

(assert (=> b!65249 (= lt!103493 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3002 lt!102532) (buf!1681 (_2!3002 lt!103466)) lt!103487))))

(declare-fun e!42968 () Bool)

(assert (=> b!65249 e!42968))

(declare-fun res!54096 () Bool)

(assert (=> b!65249 (=> (not res!54096) (not e!42968))))

(assert (=> b!65249 (= res!54096 (and (= (size!1300 (buf!1681 (_2!3002 lt!102532))) (size!1300 (buf!1681 (_2!3002 lt!103466)))) (bvsge lt!103487 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65249 (= lt!103487 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!65249 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65249 (= lt!103464 (reader!0 (_2!3002 lt!102532) (_2!3002 lt!103466)))))

(declare-fun b!65250 () Bool)

(declare-fun res!54093 () Bool)

(assert (=> b!65250 (=> (not res!54093) (not e!42966))))

(assert (=> b!65250 (= res!54093 (invariant!0 (currentBit!3336 (_2!3002 lt!103466)) (currentByte!3341 (_2!3002 lt!103466)) (size!1300 (buf!1681 (_2!3002 lt!103466)))))))

(declare-fun b!65251 () Bool)

(declare-fun res!54094 () Bool)

(assert (=> b!65251 (=> (not res!54094) (not e!42966))))

(assert (=> b!65251 (= res!54094 (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!103466)))))

(declare-fun b!65252 () Bool)

(assert (=> b!65252 (= e!42968 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!103487))))

(declare-fun b!65253 () Bool)

(declare-fun lt!103458 () tuple2!5782)

(declare-fun Unit!4416 () Unit!4389)

(assert (=> b!65253 (= e!42967 (tuple2!5783 Unit!4416 (_2!3002 lt!103458)))))

(declare-fun lt!103501 () tuple2!5782)

(assert (=> b!65253 (= lt!103501 (appendBitFromByte!0 (_2!3002 lt!102532) (select (arr!1864 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!103471 () (_ BitVec 64))

(assert (=> b!65253 (= lt!103471 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103470 () (_ BitVec 64))

(assert (=> b!65253 (= lt!103470 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103492 () Unit!4389)

(assert (=> b!65253 (= lt!103492 (validateOffsetBitsIneqLemma!0 (_2!3002 lt!102532) (_2!3002 lt!103501) lt!103471 lt!103470))))

(assert (=> b!65253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!103501)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!103501))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!103501))) (bvsub lt!103471 lt!103470))))

(declare-fun lt!103467 () Unit!4389)

(assert (=> b!65253 (= lt!103467 lt!103492)))

(declare-fun lt!103460 () tuple2!5780)

(assert (=> b!65253 (= lt!103460 (reader!0 (_2!3002 lt!102532) (_2!3002 lt!103501)))))

(declare-fun lt!103498 () (_ BitVec 64))

(assert (=> b!65253 (= lt!103498 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!103465 () Unit!4389)

(assert (=> b!65253 (= lt!103465 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3002 lt!102532) (buf!1681 (_2!3002 lt!103501)) lt!103498))))

(assert (=> b!65253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!103501)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!103498)))

(declare-fun lt!103485 () Unit!4389)

(assert (=> b!65253 (= lt!103485 lt!103465)))

(assert (=> b!65253 (= (head!517 (byteArrayBitContentToList!0 (_2!3002 lt!103501) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!517 (bitStreamReadBitsIntoList!0 (_2!3002 lt!103501) (_1!3001 lt!103460) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103489 () Unit!4389)

(declare-fun Unit!4417 () Unit!4389)

(assert (=> b!65253 (= lt!103489 Unit!4417)))

(assert (=> b!65253 (= lt!103458 (appendBitsMSBFirstLoop!0 (_2!3002 lt!103501) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!103472 () Unit!4389)

(assert (=> b!65253 (= lt!103472 (lemmaIsPrefixTransitive!0 (_2!3002 lt!102532) (_2!3002 lt!103501) (_2!3002 lt!103458)))))

(assert (=> b!65253 (isPrefixOf!0 (_2!3002 lt!102532) (_2!3002 lt!103458))))

(declare-fun lt!103497 () Unit!4389)

(assert (=> b!65253 (= lt!103497 lt!103472)))

(assert (=> b!65253 (= (size!1300 (buf!1681 (_2!3002 lt!103458))) (size!1300 (buf!1681 (_2!3002 lt!102532))))))

(declare-fun lt!103476 () Unit!4389)

(declare-fun Unit!4418 () Unit!4389)

(assert (=> b!65253 (= lt!103476 Unit!4418)))

(assert (=> b!65253 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103458))) (currentByte!3341 (_2!3002 lt!103458)) (currentBit!3336 (_2!3002 lt!103458))) (bvsub (bvadd (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103463 () Unit!4389)

(declare-fun Unit!4419 () Unit!4389)

(assert (=> b!65253 (= lt!103463 Unit!4419)))

(assert (=> b!65253 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103458))) (currentByte!3341 (_2!3002 lt!103458)) (currentBit!3336 (_2!3002 lt!103458))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103501))) (currentByte!3341 (_2!3002 lt!103501)) (currentBit!3336 (_2!3002 lt!103501))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103462 () Unit!4389)

(declare-fun Unit!4420 () Unit!4389)

(assert (=> b!65253 (= lt!103462 Unit!4420)))

(declare-fun lt!103486 () tuple2!5780)

(assert (=> b!65253 (= lt!103486 (reader!0 (_2!3002 lt!102532) (_2!3002 lt!103458)))))

(declare-fun lt!103469 () (_ BitVec 64))

(assert (=> b!65253 (= lt!103469 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103459 () Unit!4389)

(assert (=> b!65253 (= lt!103459 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3002 lt!102532) (buf!1681 (_2!3002 lt!103458)) lt!103469))))

(assert (=> b!65253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!103458)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!103469)))

(declare-fun lt!103495 () Unit!4389)

(assert (=> b!65253 (= lt!103495 lt!103459)))

(declare-fun lt!103473 () tuple2!5780)

(assert (=> b!65253 (= lt!103473 call!835)))

(declare-fun lt!103479 () (_ BitVec 64))

(assert (=> b!65253 (= lt!103479 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103474 () Unit!4389)

(assert (=> b!65253 (= lt!103474 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3002 lt!103501) (buf!1681 (_2!3002 lt!103458)) lt!103479))))

(assert (=> b!65253 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!103458)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!103501))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!103501))) lt!103479)))

(declare-fun lt!103500 () Unit!4389)

(assert (=> b!65253 (= lt!103500 lt!103474)))

(declare-fun lt!103494 () List!698)

(assert (=> b!65253 (= lt!103494 (byteArrayBitContentToList!0 (_2!3002 lt!103458) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!103461 () List!698)

(assert (=> b!65253 (= lt!103461 (byteArrayBitContentToList!0 (_2!3002 lt!103458) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103488 () List!698)

(assert (=> b!65253 (= lt!103488 (bitStreamReadBitsIntoList!0 (_2!3002 lt!103458) (_1!3001 lt!103486) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!103491 () List!698)

(assert (=> b!65253 (= lt!103491 (bitStreamReadBitsIntoList!0 (_2!3002 lt!103458) (_1!3001 lt!103473) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!103481 () (_ BitVec 64))

(assert (=> b!65253 (= lt!103481 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!103482 () Unit!4389)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2246 BitStream!2246 BitStream!2246 BitStream!2246 (_ BitVec 64) List!698) Unit!4389)

(assert (=> b!65253 (= lt!103482 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3002 lt!103458) (_2!3002 lt!103458) (_1!3001 lt!103486) (_1!3001 lt!103473) lt!103481 lt!103488))))

(declare-fun tail!305 (List!698) List!698)

(assert (=> b!65253 (= (bitStreamReadBitsIntoList!0 (_2!3002 lt!103458) (_1!3001 lt!103473) (bvsub lt!103481 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!305 lt!103488))))

(declare-fun lt!103490 () Unit!4389)

(assert (=> b!65253 (= lt!103490 lt!103482)))

(declare-fun lt!103496 () Unit!4389)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2828 array!2828 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4389)

(assert (=> b!65253 (= lt!103496 (arrayBitRangesEqImpliesEq!0 (buf!1681 (_2!3002 lt!103501)) (buf!1681 (_2!3002 lt!103458)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!103468 (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103501))) (currentByte!3341 (_2!3002 lt!103501)) (currentBit!3336 (_2!3002 lt!103501)))))))

(declare-fun bitAt!0 (array!2828 (_ BitVec 64)) Bool)

(assert (=> b!65253 (= (bitAt!0 (buf!1681 (_2!3002 lt!103501)) lt!103468) (bitAt!0 (buf!1681 (_2!3002 lt!103458)) lt!103468))))

(declare-fun lt!103480 () Unit!4389)

(assert (=> b!65253 (= lt!103480 lt!103496)))

(declare-fun bm!832 () Bool)

(assert (=> bm!832 (= call!835 (reader!0 (ite c!4731 (_2!3002 lt!103501) (_2!3002 lt!102532)) (ite c!4731 (_2!3002 lt!103458) (_2!3002 lt!102532))))))

(declare-fun b!65254 () Bool)

(declare-fun res!54097 () Bool)

(assert (=> b!65254 (=> (not res!54097) (not e!42966))))

(assert (=> b!65254 (= res!54097 (= (size!1300 (buf!1681 (_2!3002 lt!103466))) (size!1300 (buf!1681 (_2!3002 lt!102532)))))))

(declare-fun b!65255 () Bool)

(declare-fun res!54098 () Bool)

(assert (=> b!65255 (=> (not res!54098) (not e!42966))))

(assert (=> b!65255 (= res!54098 (= (size!1300 (buf!1681 (_2!3002 lt!102532))) (size!1300 (buf!1681 (_2!3002 lt!103466)))))))

(assert (= (and d!20398 c!4731) b!65253))

(assert (= (and d!20398 (not c!4731)) b!65248))

(assert (= (or b!65253 b!65248) bm!832))

(assert (= (and d!20398 res!54095) b!65250))

(assert (= (and b!65250 res!54093) b!65255))

(assert (= (and b!65255 res!54098) b!65251))

(assert (= (and b!65251 res!54094) b!65254))

(assert (= (and b!65254 res!54097) b!65249))

(assert (= (and b!65249 res!54096) b!65252))

(declare-fun m!103633 () Bool)

(assert (=> b!65249 m!103633))

(declare-fun m!103635 () Bool)

(assert (=> b!65249 m!103635))

(declare-fun m!103637 () Bool)

(assert (=> b!65249 m!103637))

(declare-fun m!103639 () Bool)

(assert (=> b!65249 m!103639))

(declare-fun m!103641 () Bool)

(assert (=> b!65249 m!103641))

(declare-fun m!103643 () Bool)

(assert (=> b!65251 m!103643))

(declare-fun m!103645 () Bool)

(assert (=> bm!832 m!103645))

(declare-fun m!103647 () Bool)

(assert (=> b!65248 m!103647))

(declare-fun m!103649 () Bool)

(assert (=> b!65248 m!103649))

(declare-fun m!103651 () Bool)

(assert (=> b!65253 m!103651))

(declare-fun m!103653 () Bool)

(assert (=> b!65253 m!103653))

(declare-fun m!103655 () Bool)

(assert (=> b!65253 m!103655))

(declare-fun m!103657 () Bool)

(assert (=> b!65253 m!103657))

(declare-fun m!103659 () Bool)

(assert (=> b!65253 m!103659))

(declare-fun m!103661 () Bool)

(assert (=> b!65253 m!103661))

(declare-fun m!103663 () Bool)

(assert (=> b!65253 m!103663))

(assert (=> b!65253 m!103651))

(declare-fun m!103665 () Bool)

(assert (=> b!65253 m!103665))

(declare-fun m!103667 () Bool)

(assert (=> b!65253 m!103667))

(declare-fun m!103669 () Bool)

(assert (=> b!65253 m!103669))

(declare-fun m!103671 () Bool)

(assert (=> b!65253 m!103671))

(declare-fun m!103673 () Bool)

(assert (=> b!65253 m!103673))

(declare-fun m!103675 () Bool)

(assert (=> b!65253 m!103675))

(declare-fun m!103677 () Bool)

(assert (=> b!65253 m!103677))

(declare-fun m!103679 () Bool)

(assert (=> b!65253 m!103679))

(declare-fun m!103681 () Bool)

(assert (=> b!65253 m!103681))

(declare-fun m!103683 () Bool)

(assert (=> b!65253 m!103683))

(assert (=> b!65253 m!103665))

(declare-fun m!103685 () Bool)

(assert (=> b!65253 m!103685))

(declare-fun m!103687 () Bool)

(assert (=> b!65253 m!103687))

(declare-fun m!103689 () Bool)

(assert (=> b!65253 m!103689))

(declare-fun m!103691 () Bool)

(assert (=> b!65253 m!103691))

(declare-fun m!103693 () Bool)

(assert (=> b!65253 m!103693))

(declare-fun m!103695 () Bool)

(assert (=> b!65253 m!103695))

(declare-fun m!103697 () Bool)

(assert (=> b!65253 m!103697))

(declare-fun m!103699 () Bool)

(assert (=> b!65253 m!103699))

(declare-fun m!103701 () Bool)

(assert (=> b!65253 m!103701))

(declare-fun m!103703 () Bool)

(assert (=> b!65253 m!103703))

(declare-fun m!103705 () Bool)

(assert (=> b!65253 m!103705))

(declare-fun m!103707 () Bool)

(assert (=> b!65253 m!103707))

(assert (=> b!65253 m!103671))

(declare-fun m!103709 () Bool)

(assert (=> b!65253 m!103709))

(assert (=> b!65253 m!103689))

(assert (=> b!65253 m!102905))

(declare-fun m!103711 () Bool)

(assert (=> b!65253 m!103711))

(declare-fun m!103713 () Bool)

(assert (=> d!20398 m!103713))

(assert (=> d!20398 m!102905))

(assert (=> d!20398 m!103195))

(assert (=> d!20398 m!103187))

(declare-fun m!103715 () Bool)

(assert (=> b!65250 m!103715))

(declare-fun m!103717 () Bool)

(assert (=> b!65252 m!103717))

(assert (=> b!64846 d!20398))

(declare-fun d!20468 () Bool)

(declare-fun res!54100 () Bool)

(declare-fun e!42970 () Bool)

(assert (=> d!20468 (=> (not res!54100) (not e!42970))))

(assert (=> d!20468 (= res!54100 (= (size!1300 (buf!1681 thiss!1379)) (size!1300 (buf!1681 (_2!3002 lt!102525)))))))

(assert (=> d!20468 (= (isPrefixOf!0 thiss!1379 (_2!3002 lt!102525)) e!42970)))

(declare-fun b!65256 () Bool)

(declare-fun res!54099 () Bool)

(assert (=> b!65256 (=> (not res!54099) (not e!42970))))

(assert (=> b!65256 (= res!54099 (bvsle (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102525))) (currentByte!3341 (_2!3002 lt!102525)) (currentBit!3336 (_2!3002 lt!102525)))))))

(declare-fun b!65257 () Bool)

(declare-fun e!42969 () Bool)

(assert (=> b!65257 (= e!42970 e!42969)))

(declare-fun res!54101 () Bool)

(assert (=> b!65257 (=> res!54101 e!42969)))

(assert (=> b!65257 (= res!54101 (= (size!1300 (buf!1681 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65258 () Bool)

(assert (=> b!65258 (= e!42969 (arrayBitRangesEq!0 (buf!1681 thiss!1379) (buf!1681 (_2!3002 lt!102525)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379))))))

(assert (= (and d!20468 res!54100) b!65256))

(assert (= (and b!65256 res!54099) b!65257))

(assert (= (and b!65257 (not res!54101)) b!65258))

(assert (=> b!65256 m!102879))

(assert (=> b!65256 m!102911))

(assert (=> b!65258 m!102879))

(assert (=> b!65258 m!102879))

(declare-fun m!103719 () Bool)

(assert (=> b!65258 m!103719))

(assert (=> b!64846 d!20468))

(declare-fun d!20470 () Bool)

(assert (=> d!20470 (= (array_inv!1182 srcBuffer!2) (bvsge (size!1300 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12664 d!20470))

(declare-fun d!20472 () Bool)

(assert (=> d!20472 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3336 thiss!1379) (currentByte!3341 thiss!1379) (size!1300 (buf!1681 thiss!1379))))))

(declare-fun bs!4999 () Bool)

(assert (= bs!4999 d!20472))

(assert (=> bs!4999 m!103315))

(assert (=> start!12664 d!20472))

(declare-fun d!20474 () Bool)

(declare-fun e!42971 () Bool)

(assert (=> d!20474 e!42971))

(declare-fun res!54102 () Bool)

(assert (=> d!20474 (=> (not res!54102) (not e!42971))))

(declare-fun lt!103504 () (_ BitVec 64))

(declare-fun lt!103505 () (_ BitVec 64))

(declare-fun lt!103507 () (_ BitVec 64))

(assert (=> d!20474 (= res!54102 (= lt!103507 (bvsub lt!103504 lt!103505)))))

(assert (=> d!20474 (or (= (bvand lt!103504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103504 lt!103505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20474 (= lt!103505 (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102528)))) ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102528))) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102528)))))))

(declare-fun lt!103502 () (_ BitVec 64))

(declare-fun lt!103506 () (_ BitVec 64))

(assert (=> d!20474 (= lt!103504 (bvmul lt!103502 lt!103506))))

(assert (=> d!20474 (or (= lt!103502 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103506 (bvsdiv (bvmul lt!103502 lt!103506) lt!103502)))))

(assert (=> d!20474 (= lt!103506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20474 (= lt!103502 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102528)))))))

(assert (=> d!20474 (= lt!103507 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102528)))))))

(assert (=> d!20474 (invariant!0 (currentBit!3336 (_1!3001 lt!102528)) (currentByte!3341 (_1!3001 lt!102528)) (size!1300 (buf!1681 (_1!3001 lt!102528))))))

(assert (=> d!20474 (= (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102528))) (currentByte!3341 (_1!3001 lt!102528)) (currentBit!3336 (_1!3001 lt!102528))) lt!103507)))

(declare-fun b!65259 () Bool)

(declare-fun res!54103 () Bool)

(assert (=> b!65259 (=> (not res!54103) (not e!42971))))

(assert (=> b!65259 (= res!54103 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103507))))

(declare-fun b!65260 () Bool)

(declare-fun lt!103503 () (_ BitVec 64))

(assert (=> b!65260 (= e!42971 (bvsle lt!103507 (bvmul lt!103503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65260 (or (= lt!103503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103503)))))

(assert (=> b!65260 (= lt!103503 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102528)))))))

(assert (= (and d!20474 res!54102) b!65259))

(assert (= (and b!65259 res!54103) b!65260))

(assert (=> d!20474 m!103301))

(declare-fun m!103721 () Bool)

(assert (=> d!20474 m!103721))

(assert (=> b!64857 d!20474))

(declare-fun d!20476 () Bool)

(declare-fun e!42972 () Bool)

(assert (=> d!20476 e!42972))

(declare-fun res!54104 () Bool)

(assert (=> d!20476 (=> (not res!54104) (not e!42972))))

(declare-fun lt!103513 () (_ BitVec 64))

(declare-fun lt!103511 () (_ BitVec 64))

(declare-fun lt!103510 () (_ BitVec 64))

(assert (=> d!20476 (= res!54104 (= lt!103513 (bvsub lt!103510 lt!103511)))))

(assert (=> d!20476 (or (= (bvand lt!103510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103511 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!103510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!103510 lt!103511) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20476 (= lt!103511 (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102523)))) ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102523))) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102523)))))))

(declare-fun lt!103508 () (_ BitVec 64))

(declare-fun lt!103512 () (_ BitVec 64))

(assert (=> d!20476 (= lt!103510 (bvmul lt!103508 lt!103512))))

(assert (=> d!20476 (or (= lt!103508 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!103512 (bvsdiv (bvmul lt!103508 lt!103512) lt!103508)))))

(assert (=> d!20476 (= lt!103512 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20476 (= lt!103508 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102523)))))))

(assert (=> d!20476 (= lt!103513 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3341 (_1!3001 lt!102523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3336 (_1!3001 lt!102523)))))))

(assert (=> d!20476 (invariant!0 (currentBit!3336 (_1!3001 lt!102523)) (currentByte!3341 (_1!3001 lt!102523)) (size!1300 (buf!1681 (_1!3001 lt!102523))))))

(assert (=> d!20476 (= (bitIndex!0 (size!1300 (buf!1681 (_1!3001 lt!102523))) (currentByte!3341 (_1!3001 lt!102523)) (currentBit!3336 (_1!3001 lt!102523))) lt!103513)))

(declare-fun b!65261 () Bool)

(declare-fun res!54105 () Bool)

(assert (=> b!65261 (=> (not res!54105) (not e!42972))))

(assert (=> b!65261 (= res!54105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!103513))))

(declare-fun b!65262 () Bool)

(declare-fun lt!103509 () (_ BitVec 64))

(assert (=> b!65262 (= e!42972 (bvsle lt!103513 (bvmul lt!103509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65262 (or (= lt!103509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!103509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!103509)))))

(assert (=> b!65262 (= lt!103509 ((_ sign_extend 32) (size!1300 (buf!1681 (_1!3001 lt!102523)))))))

(assert (= (and d!20476 res!54104) b!65261))

(assert (= (and b!65261 res!54105) b!65262))

(declare-fun m!103723 () Bool)

(assert (=> d!20476 m!103723))

(declare-fun m!103725 () Bool)

(assert (=> d!20476 m!103725))

(assert (=> b!64857 d!20476))

(declare-fun d!20478 () Bool)

(declare-fun res!54107 () Bool)

(declare-fun e!42974 () Bool)

(assert (=> d!20478 (=> (not res!54107) (not e!42974))))

(assert (=> d!20478 (= res!54107 (= (size!1300 (buf!1681 thiss!1379)) (size!1300 (buf!1681 (_2!3002 lt!102532)))))))

(assert (=> d!20478 (= (isPrefixOf!0 thiss!1379 (_2!3002 lt!102532)) e!42974)))

(declare-fun b!65263 () Bool)

(declare-fun res!54106 () Bool)

(assert (=> b!65263 (=> (not res!54106) (not e!42974))))

(assert (=> b!65263 (= res!54106 (bvsle (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!102532))) (currentByte!3341 (_2!3002 lt!102532)) (currentBit!3336 (_2!3002 lt!102532)))))))

(declare-fun b!65264 () Bool)

(declare-fun e!42973 () Bool)

(assert (=> b!65264 (= e!42974 e!42973)))

(declare-fun res!54108 () Bool)

(assert (=> b!65264 (=> res!54108 e!42973)))

(assert (=> b!65264 (= res!54108 (= (size!1300 (buf!1681 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65265 () Bool)

(assert (=> b!65265 (= e!42973 (arrayBitRangesEq!0 (buf!1681 thiss!1379) (buf!1681 (_2!3002 lt!102532)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379))))))

(assert (= (and d!20478 res!54107) b!65263))

(assert (= (and b!65263 res!54106) b!65264))

(assert (= (and b!65264 (not res!54108)) b!65265))

(assert (=> b!65263 m!102879))

(assert (=> b!65263 m!102905))

(assert (=> b!65265 m!102879))

(assert (=> b!65265 m!102879))

(declare-fun m!103727 () Bool)

(assert (=> b!65265 m!103727))

(assert (=> b!64856 d!20478))

(declare-fun d!20480 () Bool)

(assert (=> d!20480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) lt!102534) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532)))) lt!102534))))

(declare-fun bs!5000 () Bool)

(assert (= bs!5000 d!20480))

(assert (=> bs!5000 m!103297))

(assert (=> b!64856 d!20480))

(declare-fun d!20482 () Bool)

(declare-fun e!42977 () Bool)

(assert (=> d!20482 e!42977))

(declare-fun res!54111 () Bool)

(assert (=> d!20482 (=> (not res!54111) (not e!42977))))

(assert (=> d!20482 (= res!54111 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!103516 () Unit!4389)

(declare-fun choose!27 (BitStream!2246 BitStream!2246 (_ BitVec 64) (_ BitVec 64)) Unit!4389)

(assert (=> d!20482 (= lt!103516 (choose!27 thiss!1379 (_2!3002 lt!102532) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20482 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20482 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3002 lt!102532) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103516)))

(declare-fun b!65268 () Bool)

(assert (=> b!65268 (= e!42977 (validate_offset_bits!1 ((_ sign_extend 32) (size!1300 (buf!1681 (_2!3002 lt!102532)))) ((_ sign_extend 32) (currentByte!3341 (_2!3002 lt!102532))) ((_ sign_extend 32) (currentBit!3336 (_2!3002 lt!102532))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20482 res!54111) b!65268))

(declare-fun m!103729 () Bool)

(assert (=> d!20482 m!103729))

(declare-fun m!103731 () Bool)

(assert (=> b!65268 m!103731))

(assert (=> b!64856 d!20482))

(declare-fun b!65286 () Bool)

(declare-fun res!54132 () Bool)

(declare-fun e!42987 () Bool)

(assert (=> b!65286 (=> (not res!54132) (not e!42987))))

(declare-fun lt!103544 () tuple2!5782)

(assert (=> b!65286 (= res!54132 (isPrefixOf!0 thiss!1379 (_2!3002 lt!103544)))))

(declare-fun b!65287 () Bool)

(declare-fun res!54128 () Bool)

(declare-fun e!42989 () Bool)

(assert (=> b!65287 (=> (not res!54128) (not e!42989))))

(declare-fun lt!103542 () tuple2!5782)

(assert (=> b!65287 (= res!54128 (isPrefixOf!0 thiss!1379 (_2!3002 lt!103542)))))

(declare-fun d!20484 () Bool)

(assert (=> d!20484 e!42989))

(declare-fun res!54131 () Bool)

(assert (=> d!20484 (=> (not res!54131) (not e!42989))))

(assert (=> d!20484 (= res!54131 (= (size!1300 (buf!1681 (_2!3002 lt!103542))) (size!1300 (buf!1681 thiss!1379))))))

(declare-fun lt!103549 () (_ BitVec 8))

(declare-fun lt!103541 () array!2828)

(assert (=> d!20484 (= lt!103549 (select (arr!1864 lt!103541) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20484 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1300 lt!103541)))))

(assert (=> d!20484 (= lt!103541 (array!2829 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!103551 () tuple2!5782)

(assert (=> d!20484 (= lt!103542 (tuple2!5783 (_1!3002 lt!103551) (_2!3002 lt!103551)))))

(assert (=> d!20484 (= lt!103551 lt!103544)))

(assert (=> d!20484 e!42987))

(declare-fun res!54134 () Bool)

(assert (=> d!20484 (=> (not res!54134) (not e!42987))))

(assert (=> d!20484 (= res!54134 (= (size!1300 (buf!1681 thiss!1379)) (size!1300 (buf!1681 (_2!3002 lt!103544)))))))

(declare-fun lt!103545 () Bool)

(declare-fun appendBit!0 (BitStream!2246 Bool) tuple2!5782)

(assert (=> d!20484 (= lt!103544 (appendBit!0 thiss!1379 lt!103545))))

(assert (=> d!20484 (= lt!103545 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1864 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20484 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20484 (= (appendBitFromByte!0 thiss!1379 (select (arr!1864 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!103542)))

(declare-fun b!65288 () Bool)

(declare-fun e!42986 () Bool)

(declare-datatypes ((tuple2!5806 0))(
  ( (tuple2!5807 (_1!3014 BitStream!2246) (_2!3014 Bool)) )
))
(declare-fun lt!103543 () tuple2!5806)

(assert (=> b!65288 (= e!42986 (= (bitIndex!0 (size!1300 (buf!1681 (_1!3014 lt!103543))) (currentByte!3341 (_1!3014 lt!103543)) (currentBit!3336 (_1!3014 lt!103543))) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103544))) (currentByte!3341 (_2!3002 lt!103544)) (currentBit!3336 (_2!3002 lt!103544)))))))

(declare-fun b!65289 () Bool)

(declare-fun e!42988 () Bool)

(assert (=> b!65289 (= e!42989 e!42988)))

(declare-fun res!54130 () Bool)

(assert (=> b!65289 (=> (not res!54130) (not e!42988))))

(declare-fun lt!103546 () tuple2!5806)

(assert (=> b!65289 (= res!54130 (and (= (_2!3014 lt!103546) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1864 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!103549)) #b00000000000000000000000000000000))) (= (_1!3014 lt!103546) (_2!3002 lt!103542))))))

(declare-fun lt!103550 () tuple2!5804)

(declare-fun lt!103552 () BitStream!2246)

(assert (=> b!65289 (= lt!103550 (readBits!0 lt!103552 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2246) tuple2!5806)

(assert (=> b!65289 (= lt!103546 (readBitPure!0 lt!103552))))

(declare-fun readerFrom!0 (BitStream!2246 (_ BitVec 32) (_ BitVec 32)) BitStream!2246)

(assert (=> b!65289 (= lt!103552 (readerFrom!0 (_2!3002 lt!103542) (currentBit!3336 thiss!1379) (currentByte!3341 thiss!1379)))))

(declare-fun b!65290 () Bool)

(assert (=> b!65290 (= e!42987 e!42986)))

(declare-fun res!54129 () Bool)

(assert (=> b!65290 (=> (not res!54129) (not e!42986))))

(assert (=> b!65290 (= res!54129 (and (= (_2!3014 lt!103543) lt!103545) (= (_1!3014 lt!103543) (_2!3002 lt!103544))))))

(assert (=> b!65290 (= lt!103543 (readBitPure!0 (readerFrom!0 (_2!3002 lt!103544) (currentBit!3336 thiss!1379) (currentByte!3341 thiss!1379))))))

(declare-fun b!65291 () Bool)

(assert (=> b!65291 (= e!42988 (= (bitIndex!0 (size!1300 (buf!1681 (_1!3014 lt!103546))) (currentByte!3341 (_1!3014 lt!103546)) (currentBit!3336 (_1!3014 lt!103546))) (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103542))) (currentByte!3341 (_2!3002 lt!103542)) (currentBit!3336 (_2!3002 lt!103542)))))))

(declare-fun b!65292 () Bool)

(declare-fun res!54135 () Bool)

(assert (=> b!65292 (=> (not res!54135) (not e!42989))))

(declare-fun lt!103547 () (_ BitVec 64))

(declare-fun lt!103548 () (_ BitVec 64))

(assert (=> b!65292 (= res!54135 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103542))) (currentByte!3341 (_2!3002 lt!103542)) (currentBit!3336 (_2!3002 lt!103542))) (bvadd lt!103548 lt!103547)))))

(assert (=> b!65292 (or (not (= (bvand lt!103548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!103547 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!103548 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!103548 lt!103547) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65292 (= lt!103547 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!65292 (= lt!103548 (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)))))

(declare-fun b!65293 () Bool)

(declare-fun res!54133 () Bool)

(assert (=> b!65293 (=> (not res!54133) (not e!42987))))

(assert (=> b!65293 (= res!54133 (= (bitIndex!0 (size!1300 (buf!1681 (_2!3002 lt!103544))) (currentByte!3341 (_2!3002 lt!103544)) (currentBit!3336 (_2!3002 lt!103544))) (bvadd (bitIndex!0 (size!1300 (buf!1681 thiss!1379)) (currentByte!3341 thiss!1379) (currentBit!3336 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20484 res!54134) b!65293))

(assert (= (and b!65293 res!54133) b!65286))

(assert (= (and b!65286 res!54132) b!65290))

(assert (= (and b!65290 res!54129) b!65288))

(assert (= (and d!20484 res!54131) b!65292))

(assert (= (and b!65292 res!54135) b!65287))

(assert (= (and b!65287 res!54128) b!65289))

(assert (= (and b!65289 res!54130) b!65291))

(declare-fun m!103733 () Bool)

(assert (=> b!65288 m!103733))

(declare-fun m!103735 () Bool)

(assert (=> b!65288 m!103735))

(declare-fun m!103737 () Bool)

(assert (=> b!65292 m!103737))

(assert (=> b!65292 m!102879))

(declare-fun m!103739 () Bool)

(assert (=> b!65289 m!103739))

(declare-fun m!103741 () Bool)

(assert (=> b!65289 m!103741))

(declare-fun m!103743 () Bool)

(assert (=> b!65289 m!103743))

(declare-fun m!103745 () Bool)

(assert (=> b!65287 m!103745))

(assert (=> b!65293 m!103735))

(assert (=> b!65293 m!102879))

(declare-fun m!103747 () Bool)

(assert (=> b!65286 m!103747))

(declare-fun m!103749 () Bool)

(assert (=> b!65290 m!103749))

(assert (=> b!65290 m!103749))

(declare-fun m!103751 () Bool)

(assert (=> b!65290 m!103751))

(declare-fun m!103753 () Bool)

(assert (=> d!20484 m!103753))

(declare-fun m!103755 () Bool)

(assert (=> d!20484 m!103755))

(assert (=> d!20484 m!103257))

(declare-fun m!103757 () Bool)

(assert (=> b!65291 m!103757))

(assert (=> b!65291 m!103737))

(assert (=> b!64856 d!20484))

(declare-fun d!20486 () Bool)

(assert (=> d!20486 (= (invariant!0 (currentBit!3336 (_2!3002 lt!102532)) (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102525)))) (and (bvsge (currentBit!3336 (_2!3002 lt!102532)) #b00000000000000000000000000000000) (bvslt (currentBit!3336 (_2!3002 lt!102532)) #b00000000000000000000000000001000) (bvsge (currentByte!3341 (_2!3002 lt!102532)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102525)))) (and (= (currentBit!3336 (_2!3002 lt!102532)) #b00000000000000000000000000000000) (= (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102525))))))))))

(assert (=> b!64858 d!20486))

(declare-fun d!20488 () Bool)

(assert (=> d!20488 (= (invariant!0 (currentBit!3336 (_2!3002 lt!102532)) (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102532)))) (and (bvsge (currentBit!3336 (_2!3002 lt!102532)) #b00000000000000000000000000000000) (bvslt (currentBit!3336 (_2!3002 lt!102532)) #b00000000000000000000000000001000) (bvsge (currentByte!3341 (_2!3002 lt!102532)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102532)))) (and (= (currentBit!3336 (_2!3002 lt!102532)) #b00000000000000000000000000000000) (= (currentByte!3341 (_2!3002 lt!102532)) (size!1300 (buf!1681 (_2!3002 lt!102532))))))))))

(assert (=> b!64847 d!20488))

(push 1)

(assert (not b!65249))

(assert (not b!65026))

(assert (not b!64984))

(assert (not b!65253))

(assert (not d!20396))

(assert (not d!20372))

(assert (not b!64999))

(assert (not d!20326))

(assert (not b!65020))

(assert (not b!65286))

(assert (not b!65029))

(assert (not b!65002))

(assert (not b!65289))

(assert (not b!65008))

(assert (not d!20482))

(assert (not b!65256))

(assert (not b!65062))

(assert (not b!65292))

(assert (not b!65085))

(assert (not d!20322))

(assert (not d!20392))

(assert (not d!20364))

(assert (not d!20338))

(assert (not b!65067))

(assert (not b!65287))

(assert (not b!65064))

(assert (not b!65031))

(assert (not b!65068))

(assert (not b!64983))

(assert (not b!65248))

(assert (not b!65007))

(assert (not b!65092))

(assert (not b!65293))

(assert (not d!20474))

(assert (not b!65291))

(assert (not b!65268))

(assert (not b!65018))

(assert (not b!65250))

(assert (not d!20332))

(assert (not b!65088))

(assert (not d!20484))

(assert (not b!65252))

(assert (not d!20472))

(assert (not b!65089))

(assert (not b!65006))

(assert (not d!20328))

(assert (not b!65086))

(assert (not d!20376))

(assert (not b!65065))

(assert (not bm!832))

(assert (not b!65001))

(assert (not b!64982))

(assert (not b!65011))

(assert (not b!65265))

(assert (not b!64998))

(assert (not b!65251))

(assert (not d!20382))

(assert (not b!65263))

(assert (not d!20318))

(assert (not b!65290))

(assert (not b!65258))

(assert (not b!65090))

(assert (not d!20358))

(assert (not d!20378))

(assert (not d!20350))

(assert (not b!65005))

(assert (not d!20480))

(assert (not d!20334))

(assert (not d!20324))

(assert (not b!65030))

(assert (not b!65010))

(assert (not b!65288))

(assert (not d!20398))

(assert (not b!65070))

(assert (not b!65004))

(assert (not d!20476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

