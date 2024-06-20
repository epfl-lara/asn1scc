; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10022 () Bool)

(assert start!10022)

(declare-fun b!50816 () Bool)

(declare-fun e!33594 () Bool)

(declare-fun e!33600 () Bool)

(assert (=> b!50816 (= e!33594 e!33600)))

(declare-fun res!42574 () Bool)

(assert (=> b!50816 (=> res!42574 e!33600)))

(declare-datatypes ((array!2344 0))(
  ( (array!2345 (arr!1595 (Array (_ BitVec 32) (_ BitVec 8))) (size!1066 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1846 0))(
  ( (BitStream!1847 (buf!1421 array!2344) (currentByte!2944 (_ BitVec 32)) (currentBit!2939 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1846)

(declare-datatypes ((Unit!3507 0))(
  ( (Unit!3508) )
))
(declare-datatypes ((tuple2!4680 0))(
  ( (tuple2!4681 (_1!2445 Unit!3507) (_2!2445 BitStream!1846)) )
))
(declare-fun lt!78686 () tuple2!4680)

(declare-fun isPrefixOf!0 (BitStream!1846 BitStream!1846) Bool)

(assert (=> b!50816 (= res!42574 (not (isPrefixOf!0 thiss!1379 (_2!2445 lt!78686))))))

(declare-fun lt!78680 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50816 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!78680)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!50816 (= lt!78680 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78698 () Unit!3507)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1846 BitStream!1846 (_ BitVec 64) (_ BitVec 64)) Unit!3507)

(assert (=> b!50816 (= lt!78698 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2445 lt!78686) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2344)

(declare-fun appendBitFromByte!0 (BitStream!1846 (_ BitVec 8) (_ BitVec 32)) tuple2!4680)

(assert (=> b!50816 (= lt!78686 (appendBitFromByte!0 thiss!1379 (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50817 () Bool)

(declare-fun e!33596 () Bool)

(declare-datatypes ((tuple2!4682 0))(
  ( (tuple2!4683 (_1!2446 BitStream!1846) (_2!2446 BitStream!1846)) )
))
(declare-fun lt!78691 () tuple2!4682)

(declare-fun lt!78694 () Bool)

(declare-datatypes ((tuple2!4684 0))(
  ( (tuple2!4685 (_1!2447 BitStream!1846) (_2!2447 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1846) tuple2!4684)

(assert (=> b!50817 (= e!33596 (= (_2!2447 (readBitPure!0 (_1!2446 lt!78691))) lt!78694))))

(declare-fun b!50818 () Bool)

(declare-fun res!42584 () Bool)

(declare-fun e!33590 () Bool)

(assert (=> b!50818 (=> (not res!42584) (not e!33590))))

(assert (=> b!50818 (= res!42584 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 thiss!1379))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50819 () Bool)

(declare-fun e!33591 () Bool)

(declare-fun e!33593 () Bool)

(assert (=> b!50819 (= e!33591 e!33593)))

(declare-fun res!42587 () Bool)

(assert (=> b!50819 (=> res!42587 e!33593)))

(declare-fun lt!78695 () Bool)

(assert (=> b!50819 (= res!42587 (not (= lt!78695 lt!78694)))))

(declare-fun lt!78677 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2344 (_ BitVec 64)) Bool)

(assert (=> b!50819 (= lt!78695 (bitAt!0 (buf!1421 (_2!2445 lt!78686)) lt!78677))))

(declare-fun b!50820 () Bool)

(declare-fun e!33592 () Bool)

(declare-fun e!33595 () Bool)

(assert (=> b!50820 (= e!33592 e!33595)))

(declare-fun res!42579 () Bool)

(assert (=> b!50820 (=> res!42579 e!33595)))

(assert (=> b!50820 (= res!42579 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!564 0))(
  ( (Nil!561) (Cons!560 (h!679 Bool) (t!1314 List!564)) )
))
(declare-fun lt!78679 () List!564)

(declare-fun lt!78699 () tuple2!4682)

(declare-fun lt!78682 () tuple2!4680)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1846 BitStream!1846 (_ BitVec 64)) List!564)

(assert (=> b!50820 (= lt!78679 (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_1!2446 lt!78699) lt!78680))))

(declare-fun lt!78689 () List!564)

(assert (=> b!50820 (= lt!78689 (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_1!2446 lt!78691) (bvsub to!314 i!635)))))

(assert (=> b!50820 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!78680)))

(declare-fun lt!78687 () Unit!3507)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1846 array!2344 (_ BitVec 64)) Unit!3507)

(assert (=> b!50820 (= lt!78687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2445 lt!78686) (buf!1421 (_2!2445 lt!78682)) lt!78680))))

(declare-fun reader!0 (BitStream!1846 BitStream!1846) tuple2!4682)

(assert (=> b!50820 (= lt!78699 (reader!0 (_2!2445 lt!78686) (_2!2445 lt!78682)))))

(assert (=> b!50820 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78693 () Unit!3507)

(assert (=> b!50820 (= lt!78693 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1421 (_2!2445 lt!78682)) (bvsub to!314 i!635)))))

(assert (=> b!50820 (= lt!78691 (reader!0 thiss!1379 (_2!2445 lt!78682)))))

(declare-fun b!50821 () Bool)

(declare-fun e!33601 () Bool)

(declare-fun array_inv!976 (array!2344) Bool)

(assert (=> b!50821 (= e!33601 (array_inv!976 (buf!1421 thiss!1379)))))

(declare-fun res!42583 () Bool)

(assert (=> start!10022 (=> (not res!42583) (not e!33590))))

(assert (=> start!10022 (= res!42583 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1066 srcBuffer!2))))))))

(assert (=> start!10022 e!33590))

(assert (=> start!10022 true))

(assert (=> start!10022 (array_inv!976 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1846) Bool)

(assert (=> start!10022 (and (inv!12 thiss!1379) e!33601)))

(declare-fun b!50822 () Bool)

(declare-fun res!42580 () Bool)

(declare-fun e!33597 () Bool)

(assert (=> b!50822 (=> res!42580 e!33597)))

(assert (=> b!50822 (= res!42580 (not (= (size!1066 (buf!1421 thiss!1379)) (size!1066 (buf!1421 (_2!2445 lt!78682))))))))

(declare-fun b!50823 () Bool)

(declare-fun res!42573 () Bool)

(assert (=> b!50823 (=> res!42573 e!33595)))

(declare-fun length!259 (List!564) Int)

(assert (=> b!50823 (= res!42573 (<= (length!259 lt!78689) 0))))

(declare-fun b!50824 () Bool)

(declare-fun res!42576 () Bool)

(assert (=> b!50824 (=> res!42576 e!33597)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50824 (= res!42576 (not (invariant!0 (currentBit!2939 (_2!2445 lt!78682)) (currentByte!2944 (_2!2445 lt!78682)) (size!1066 (buf!1421 (_2!2445 lt!78682))))))))

(declare-fun b!50825 () Bool)

(declare-fun res!42572 () Bool)

(assert (=> b!50825 (=> res!42572 e!33592)))

(assert (=> b!50825 (= res!42572 (not (invariant!0 (currentBit!2939 (_2!2445 lt!78686)) (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78686))))))))

(declare-fun b!50826 () Bool)

(declare-fun e!33604 () Bool)

(assert (=> b!50826 (= e!33604 e!33591)))

(declare-fun res!42588 () Bool)

(assert (=> b!50826 (=> res!42588 e!33591)))

(declare-fun head!383 (List!564) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1846 array!2344 (_ BitVec 64) (_ BitVec 64)) List!564)

(assert (=> b!50826 (= res!42588 (not (= (head!383 (byteArrayBitContentToList!0 (_2!2445 lt!78682) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78694)))))

(assert (=> b!50826 (= lt!78694 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50827 () Bool)

(declare-fun res!42582 () Bool)

(assert (=> b!50827 (=> res!42582 e!33604)))

(declare-fun lt!78683 () Bool)

(assert (=> b!50827 (= res!42582 (not (= (head!383 lt!78689) lt!78683)))))

(declare-fun b!50828 () Bool)

(declare-fun e!33598 () Bool)

(assert (=> b!50828 (= e!33595 e!33598)))

(declare-fun res!42569 () Bool)

(assert (=> b!50828 (=> res!42569 e!33598)))

(declare-fun lt!78696 () List!564)

(assert (=> b!50828 (= res!42569 (not (= lt!78696 lt!78679)))))

(assert (=> b!50828 (= lt!78679 lt!78696)))

(declare-fun tail!250 (List!564) List!564)

(assert (=> b!50828 (= lt!78696 (tail!250 lt!78689))))

(declare-fun lt!78692 () Unit!3507)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1846 BitStream!1846 BitStream!1846 BitStream!1846 (_ BitVec 64) List!564) Unit!3507)

(assert (=> b!50828 (= lt!78692 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2445 lt!78682) (_2!2445 lt!78682) (_1!2446 lt!78691) (_1!2446 lt!78699) (bvsub to!314 i!635) lt!78689))))

(declare-fun b!50829 () Bool)

(assert (=> b!50829 (= e!33597 e!33592)))

(declare-fun res!42571 () Bool)

(assert (=> b!50829 (=> res!42571 e!33592)))

(assert (=> b!50829 (= res!42571 (not (= (size!1066 (buf!1421 (_2!2445 lt!78686))) (size!1066 (buf!1421 (_2!2445 lt!78682))))))))

(declare-fun lt!78700 () (_ BitVec 64))

(declare-fun lt!78685 () (_ BitVec 64))

(assert (=> b!50829 (= lt!78685 (bvsub (bvsub (bvadd lt!78700 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50829 (= lt!78700 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(assert (=> b!50829 (= (size!1066 (buf!1421 (_2!2445 lt!78682))) (size!1066 (buf!1421 thiss!1379)))))

(declare-fun b!50830 () Bool)

(assert (=> b!50830 (= e!33590 (not e!33594))))

(declare-fun res!42577 () Bool)

(assert (=> b!50830 (=> res!42577 e!33594)))

(assert (=> b!50830 (= res!42577 (bvsge i!635 to!314))))

(assert (=> b!50830 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78678 () Unit!3507)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1846) Unit!3507)

(assert (=> b!50830 (= lt!78678 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!50830 (= lt!78677 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(declare-fun b!50831 () Bool)

(declare-fun lt!78684 () tuple2!4682)

(declare-fun e!33603 () Bool)

(assert (=> b!50831 (= e!33603 (= (head!383 (byteArrayBitContentToList!0 (_2!2445 lt!78686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!383 (bitStreamReadBitsIntoList!0 (_2!2445 lt!78686) (_1!2446 lt!78684) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50832 () Bool)

(assert (=> b!50832 (= e!33598 e!33604)))

(declare-fun res!42575 () Bool)

(assert (=> b!50832 (=> res!42575 e!33604)))

(assert (=> b!50832 (= res!42575 (not (= lt!78683 (bitAt!0 (buf!1421 (_1!2446 lt!78699)) lt!78677))))))

(assert (=> b!50832 (= lt!78683 (bitAt!0 (buf!1421 (_1!2446 lt!78691)) lt!78677))))

(declare-fun b!50833 () Bool)

(declare-fun e!33599 () Bool)

(assert (=> b!50833 (= e!33599 e!33597)))

(declare-fun res!42585 () Bool)

(assert (=> b!50833 (=> res!42585 e!33597)))

(assert (=> b!50833 (= res!42585 (not (= lt!78685 (bvsub (bvadd lt!78677 to!314) i!635))))))

(assert (=> b!50833 (= lt!78685 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78682))) (currentByte!2944 (_2!2445 lt!78682)) (currentBit!2939 (_2!2445 lt!78682))))))

(declare-fun b!50834 () Bool)

(declare-fun res!42578 () Bool)

(assert (=> b!50834 (=> res!42578 e!33592)))

(assert (=> b!50834 (= res!42578 (not (invariant!0 (currentBit!2939 (_2!2445 lt!78686)) (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78682))))))))

(declare-fun b!50835 () Bool)

(assert (=> b!50835 (= e!33600 e!33599)))

(declare-fun res!42586 () Bool)

(assert (=> b!50835 (=> res!42586 e!33599)))

(assert (=> b!50835 (= res!42586 (not (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!78682))))))

(assert (=> b!50835 (isPrefixOf!0 thiss!1379 (_2!2445 lt!78682))))

(declare-fun lt!78690 () Unit!3507)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1846 BitStream!1846 BitStream!1846) Unit!3507)

(assert (=> b!50835 (= lt!78690 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2445 lt!78686) (_2!2445 lt!78682)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1846 array!2344 (_ BitVec 64) (_ BitVec 64)) tuple2!4680)

(assert (=> b!50835 (= lt!78682 (appendBitsMSBFirstLoop!0 (_2!2445 lt!78686) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50835 e!33603))

(declare-fun res!42570 () Bool)

(assert (=> b!50835 (=> (not res!42570) (not e!33603))))

(assert (=> b!50835 (= res!42570 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78688 () Unit!3507)

(assert (=> b!50835 (= lt!78688 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1421 (_2!2445 lt!78686)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50835 (= lt!78684 (reader!0 thiss!1379 (_2!2445 lt!78686)))))

(declare-fun b!50836 () Bool)

(assert (=> b!50836 (= e!33593 e!33596)))

(declare-fun res!42581 () Bool)

(assert (=> b!50836 (=> res!42581 e!33596)))

(declare-fun lt!78697 () Bool)

(assert (=> b!50836 (= res!42581 (not (= lt!78697 lt!78694)))))

(assert (=> b!50836 (= lt!78695 lt!78697)))

(assert (=> b!50836 (= lt!78697 (bitAt!0 (buf!1421 (_2!2445 lt!78682)) lt!78677))))

(declare-fun lt!78681 () Unit!3507)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2344 array!2344 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3507)

(assert (=> b!50836 (= lt!78681 (arrayBitRangesEqImpliesEq!0 (buf!1421 (_2!2445 lt!78686)) (buf!1421 (_2!2445 lt!78682)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78677 lt!78700))))

(assert (= (and start!10022 res!42583) b!50818))

(assert (= (and b!50818 res!42584) b!50830))

(assert (= (and b!50830 (not res!42577)) b!50816))

(assert (= (and b!50816 (not res!42574)) b!50835))

(assert (= (and b!50835 res!42570) b!50831))

(assert (= (and b!50835 (not res!42586)) b!50833))

(assert (= (and b!50833 (not res!42585)) b!50824))

(assert (= (and b!50824 (not res!42576)) b!50822))

(assert (= (and b!50822 (not res!42580)) b!50829))

(assert (= (and b!50829 (not res!42571)) b!50825))

(assert (= (and b!50825 (not res!42572)) b!50834))

(assert (= (and b!50834 (not res!42578)) b!50820))

(assert (= (and b!50820 (not res!42579)) b!50823))

(assert (= (and b!50823 (not res!42573)) b!50828))

(assert (= (and b!50828 (not res!42569)) b!50832))

(assert (= (and b!50832 (not res!42575)) b!50827))

(assert (= (and b!50827 (not res!42582)) b!50826))

(assert (= (and b!50826 (not res!42588)) b!50819))

(assert (= (and b!50819 (not res!42587)) b!50836))

(assert (= (and b!50836 (not res!42581)) b!50817))

(assert (= start!10022 b!50821))

(declare-fun m!79947 () Bool)

(assert (=> b!50832 m!79947))

(declare-fun m!79949 () Bool)

(assert (=> b!50832 m!79949))

(declare-fun m!79951 () Bool)

(assert (=> b!50826 m!79951))

(assert (=> b!50826 m!79951))

(declare-fun m!79953 () Bool)

(assert (=> b!50826 m!79953))

(declare-fun m!79955 () Bool)

(assert (=> b!50826 m!79955))

(declare-fun m!79957 () Bool)

(assert (=> b!50830 m!79957))

(declare-fun m!79959 () Bool)

(assert (=> b!50830 m!79959))

(declare-fun m!79961 () Bool)

(assert (=> b!50830 m!79961))

(declare-fun m!79963 () Bool)

(assert (=> b!50835 m!79963))

(declare-fun m!79965 () Bool)

(assert (=> b!50835 m!79965))

(declare-fun m!79967 () Bool)

(assert (=> b!50835 m!79967))

(declare-fun m!79969 () Bool)

(assert (=> b!50835 m!79969))

(declare-fun m!79971 () Bool)

(assert (=> b!50835 m!79971))

(declare-fun m!79973 () Bool)

(assert (=> b!50835 m!79973))

(declare-fun m!79975 () Bool)

(assert (=> b!50835 m!79975))

(declare-fun m!79977 () Bool)

(assert (=> b!50816 m!79977))

(declare-fun m!79979 () Bool)

(assert (=> b!50816 m!79979))

(assert (=> b!50816 m!79979))

(declare-fun m!79981 () Bool)

(assert (=> b!50816 m!79981))

(declare-fun m!79983 () Bool)

(assert (=> b!50816 m!79983))

(declare-fun m!79985 () Bool)

(assert (=> b!50816 m!79985))

(declare-fun m!79987 () Bool)

(assert (=> b!50824 m!79987))

(declare-fun m!79989 () Bool)

(assert (=> b!50829 m!79989))

(declare-fun m!79991 () Bool)

(assert (=> b!50831 m!79991))

(assert (=> b!50831 m!79991))

(declare-fun m!79993 () Bool)

(assert (=> b!50831 m!79993))

(declare-fun m!79995 () Bool)

(assert (=> b!50831 m!79995))

(assert (=> b!50831 m!79995))

(declare-fun m!79997 () Bool)

(assert (=> b!50831 m!79997))

(declare-fun m!79999 () Bool)

(assert (=> b!50827 m!79999))

(declare-fun m!80001 () Bool)

(assert (=> b!50825 m!80001))

(declare-fun m!80003 () Bool)

(assert (=> b!50836 m!80003))

(declare-fun m!80005 () Bool)

(assert (=> b!50836 m!80005))

(declare-fun m!80007 () Bool)

(assert (=> b!50818 m!80007))

(declare-fun m!80009 () Bool)

(assert (=> b!50821 m!80009))

(declare-fun m!80011 () Bool)

(assert (=> b!50833 m!80011))

(declare-fun m!80013 () Bool)

(assert (=> b!50817 m!80013))

(declare-fun m!80015 () Bool)

(assert (=> b!50823 m!80015))

(declare-fun m!80017 () Bool)

(assert (=> b!50819 m!80017))

(declare-fun m!80019 () Bool)

(assert (=> b!50834 m!80019))

(declare-fun m!80021 () Bool)

(assert (=> start!10022 m!80021))

(declare-fun m!80023 () Bool)

(assert (=> start!10022 m!80023))

(declare-fun m!80025 () Bool)

(assert (=> b!50828 m!80025))

(declare-fun m!80027 () Bool)

(assert (=> b!50828 m!80027))

(declare-fun m!80029 () Bool)

(assert (=> b!50820 m!80029))

(declare-fun m!80031 () Bool)

(assert (=> b!50820 m!80031))

(declare-fun m!80033 () Bool)

(assert (=> b!50820 m!80033))

(declare-fun m!80035 () Bool)

(assert (=> b!50820 m!80035))

(declare-fun m!80037 () Bool)

(assert (=> b!50820 m!80037))

(declare-fun m!80039 () Bool)

(assert (=> b!50820 m!80039))

(declare-fun m!80041 () Bool)

(assert (=> b!50820 m!80041))

(declare-fun m!80043 () Bool)

(assert (=> b!50820 m!80043))

(push 1)

(assert (not b!50824))

(assert (not b!50817))

(assert (not b!50833))

(assert (not b!50816))

(assert (not b!50820))

(assert (not b!50819))

(assert (not b!50818))

(assert (not b!50826))

(assert (not b!50832))

(assert (not b!50830))

(assert (not b!50828))

(assert (not b!50825))

(assert (not b!50827))

(assert (not b!50831))

(assert (not b!50829))

(assert (not b!50835))

(assert (not b!50836))

(assert (not b!50821))

(assert (not b!50834))

(assert (not b!50823))

(assert (not start!10022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!15994 () Bool)

(declare-fun size!1070 (List!564) Int)

(assert (=> d!15994 (= (length!259 lt!78689) (size!1070 lt!78689))))

(declare-fun bs!4021 () Bool)

(assert (= bs!4021 d!15994))

(declare-fun m!80285 () Bool)

(assert (=> bs!4021 m!80285))

(assert (=> b!50823 d!15994))

(declare-fun d!16000 () Bool)

(assert (=> d!16000 (= (invariant!0 (currentBit!2939 (_2!2445 lt!78686)) (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78682)))) (and (bvsge (currentBit!2939 (_2!2445 lt!78686)) #b00000000000000000000000000000000) (bvslt (currentBit!2939 (_2!2445 lt!78686)) #b00000000000000000000000000001000) (bvsge (currentByte!2944 (_2!2445 lt!78686)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78682)))) (and (= (currentBit!2939 (_2!2445 lt!78686)) #b00000000000000000000000000000000) (= (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78682))))))))))

(assert (=> b!50834 d!16000))

(declare-fun d!16008 () Bool)

(assert (=> d!16008 (= (invariant!0 (currentBit!2939 (_2!2445 lt!78682)) (currentByte!2944 (_2!2445 lt!78682)) (size!1066 (buf!1421 (_2!2445 lt!78682)))) (and (bvsge (currentBit!2939 (_2!2445 lt!78682)) #b00000000000000000000000000000000) (bvslt (currentBit!2939 (_2!2445 lt!78682)) #b00000000000000000000000000001000) (bvsge (currentByte!2944 (_2!2445 lt!78682)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2944 (_2!2445 lt!78682)) (size!1066 (buf!1421 (_2!2445 lt!78682)))) (and (= (currentBit!2939 (_2!2445 lt!78682)) #b00000000000000000000000000000000) (= (currentByte!2944 (_2!2445 lt!78682)) (size!1066 (buf!1421 (_2!2445 lt!78682))))))))))

(assert (=> b!50824 d!16008))

(declare-fun d!16010 () Bool)

(declare-fun res!42744 () Bool)

(declare-fun e!33728 () Bool)

(assert (=> d!16010 (=> (not res!42744) (not e!33728))))

(assert (=> d!16010 (= res!42744 (= (size!1066 (buf!1421 thiss!1379)) (size!1066 (buf!1421 (_2!2445 lt!78682)))))))

(assert (=> d!16010 (= (isPrefixOf!0 thiss!1379 (_2!2445 lt!78682)) e!33728)))

(declare-fun b!51008 () Bool)

(declare-fun res!42742 () Bool)

(assert (=> b!51008 (=> (not res!42742) (not e!33728))))

(assert (=> b!51008 (= res!42742 (bvsle (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)) (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78682))) (currentByte!2944 (_2!2445 lt!78682)) (currentBit!2939 (_2!2445 lt!78682)))))))

(declare-fun b!51009 () Bool)

(declare-fun e!33727 () Bool)

(assert (=> b!51009 (= e!33728 e!33727)))

(declare-fun res!42743 () Bool)

(assert (=> b!51009 (=> res!42743 e!33727)))

(assert (=> b!51009 (= res!42743 (= (size!1066 (buf!1421 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51010 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2344 array!2344 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51010 (= e!33727 (arrayBitRangesEq!0 (buf!1421 thiss!1379) (buf!1421 (_2!2445 lt!78682)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379))))))

(assert (= (and d!16010 res!42744) b!51008))

(assert (= (and b!51008 res!42742) b!51009))

(assert (= (and b!51009 (not res!42743)) b!51010))

(assert (=> b!51008 m!79961))

(assert (=> b!51008 m!80011))

(assert (=> b!51010 m!79961))

(assert (=> b!51010 m!79961))

(declare-fun m!80293 () Bool)

(assert (=> b!51010 m!80293))

(assert (=> b!50835 d!16010))

(declare-fun b!51196 () Bool)

(declare-fun e!33820 () tuple2!4680)

(declare-fun lt!79508 () tuple2!4680)

(declare-fun Unit!3530 () Unit!3507)

(assert (=> b!51196 (= e!33820 (tuple2!4681 Unit!3530 (_2!2445 lt!79508)))))

(declare-fun lt!79535 () tuple2!4680)

(assert (=> b!51196 (= lt!79535 (appendBitFromByte!0 (_2!2445 lt!78686) (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!79509 () (_ BitVec 64))

(assert (=> b!51196 (= lt!79509 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79501 () (_ BitVec 64))

(assert (=> b!51196 (= lt!79501 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79528 () Unit!3507)

(assert (=> b!51196 (= lt!79528 (validateOffsetBitsIneqLemma!0 (_2!2445 lt!78686) (_2!2445 lt!79535) lt!79509 lt!79501))))

(assert (=> b!51196 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!79535)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!79535))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!79535))) (bvsub lt!79509 lt!79501))))

(declare-fun lt!79516 () Unit!3507)

(assert (=> b!51196 (= lt!79516 lt!79528)))

(declare-fun lt!79507 () tuple2!4682)

(assert (=> b!51196 (= lt!79507 (reader!0 (_2!2445 lt!78686) (_2!2445 lt!79535)))))

(declare-fun lt!79531 () (_ BitVec 64))

(assert (=> b!51196 (= lt!79531 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79523 () Unit!3507)

(assert (=> b!51196 (= lt!79523 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2445 lt!78686) (buf!1421 (_2!2445 lt!79535)) lt!79531))))

(assert (=> b!51196 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!79535)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!79531)))

(declare-fun lt!79539 () Unit!3507)

(assert (=> b!51196 (= lt!79539 lt!79523)))

(assert (=> b!51196 (= (head!383 (byteArrayBitContentToList!0 (_2!2445 lt!79535) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!383 (bitStreamReadBitsIntoList!0 (_2!2445 lt!79535) (_1!2446 lt!79507) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79522 () Unit!3507)

(declare-fun Unit!3531 () Unit!3507)

(assert (=> b!51196 (= lt!79522 Unit!3531)))

(assert (=> b!51196 (= lt!79508 (appendBitsMSBFirstLoop!0 (_2!2445 lt!79535) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!79497 () Unit!3507)

(assert (=> b!51196 (= lt!79497 (lemmaIsPrefixTransitive!0 (_2!2445 lt!78686) (_2!2445 lt!79535) (_2!2445 lt!79508)))))

(assert (=> b!51196 (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!79508))))

(declare-fun lt!79499 () Unit!3507)

(assert (=> b!51196 (= lt!79499 lt!79497)))

(assert (=> b!51196 (= (size!1066 (buf!1421 (_2!2445 lt!79508))) (size!1066 (buf!1421 (_2!2445 lt!78686))))))

(declare-fun lt!79533 () Unit!3507)

(declare-fun Unit!3532 () Unit!3507)

(assert (=> b!51196 (= lt!79533 Unit!3532)))

(assert (=> b!51196 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79508))) (currentByte!2944 (_2!2445 lt!79508)) (currentBit!2939 (_2!2445 lt!79508))) (bvsub (bvadd (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79518 () Unit!3507)

(declare-fun Unit!3533 () Unit!3507)

(assert (=> b!51196 (= lt!79518 Unit!3533)))

(assert (=> b!51196 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79508))) (currentByte!2944 (_2!2445 lt!79508)) (currentBit!2939 (_2!2445 lt!79508))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79535))) (currentByte!2944 (_2!2445 lt!79535)) (currentBit!2939 (_2!2445 lt!79535))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79500 () Unit!3507)

(declare-fun Unit!3534 () Unit!3507)

(assert (=> b!51196 (= lt!79500 Unit!3534)))

(declare-fun lt!79529 () tuple2!4682)

(declare-fun call!658 () tuple2!4682)

(assert (=> b!51196 (= lt!79529 call!658)))

(declare-fun lt!79498 () (_ BitVec 64))

(assert (=> b!51196 (= lt!79498 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79512 () Unit!3507)

(assert (=> b!51196 (= lt!79512 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2445 lt!78686) (buf!1421 (_2!2445 lt!79508)) lt!79498))))

(assert (=> b!51196 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!79508)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!79498)))

(declare-fun lt!79527 () Unit!3507)

(assert (=> b!51196 (= lt!79527 lt!79512)))

(declare-fun lt!79519 () tuple2!4682)

(assert (=> b!51196 (= lt!79519 (reader!0 (_2!2445 lt!79535) (_2!2445 lt!79508)))))

(declare-fun lt!79540 () (_ BitVec 64))

(assert (=> b!51196 (= lt!79540 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79526 () Unit!3507)

(assert (=> b!51196 (= lt!79526 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2445 lt!79535) (buf!1421 (_2!2445 lt!79508)) lt!79540))))

(assert (=> b!51196 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!79508)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!79535))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!79535))) lt!79540)))

(declare-fun lt!79524 () Unit!3507)

(assert (=> b!51196 (= lt!79524 lt!79526)))

(declare-fun lt!79502 () List!564)

(assert (=> b!51196 (= lt!79502 (byteArrayBitContentToList!0 (_2!2445 lt!79508) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!79513 () List!564)

(assert (=> b!51196 (= lt!79513 (byteArrayBitContentToList!0 (_2!2445 lt!79508) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79506 () List!564)

(assert (=> b!51196 (= lt!79506 (bitStreamReadBitsIntoList!0 (_2!2445 lt!79508) (_1!2446 lt!79529) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!79505 () List!564)

(assert (=> b!51196 (= lt!79505 (bitStreamReadBitsIntoList!0 (_2!2445 lt!79508) (_1!2446 lt!79519) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79517 () (_ BitVec 64))

(assert (=> b!51196 (= lt!79517 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79538 () Unit!3507)

(assert (=> b!51196 (= lt!79538 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2445 lt!79508) (_2!2445 lt!79508) (_1!2446 lt!79529) (_1!2446 lt!79519) lt!79517 lt!79506))))

(assert (=> b!51196 (= (bitStreamReadBitsIntoList!0 (_2!2445 lt!79508) (_1!2446 lt!79519) (bvsub lt!79517 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!250 lt!79506))))

(declare-fun lt!79510 () Unit!3507)

(assert (=> b!51196 (= lt!79510 lt!79538)))

(declare-fun lt!79520 () (_ BitVec 64))

(declare-fun lt!79530 () Unit!3507)

(assert (=> b!51196 (= lt!79530 (arrayBitRangesEqImpliesEq!0 (buf!1421 (_2!2445 lt!79535)) (buf!1421 (_2!2445 lt!79508)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79520 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79535))) (currentByte!2944 (_2!2445 lt!79535)) (currentBit!2939 (_2!2445 lt!79535)))))))

(assert (=> b!51196 (= (bitAt!0 (buf!1421 (_2!2445 lt!79535)) lt!79520) (bitAt!0 (buf!1421 (_2!2445 lt!79508)) lt!79520))))

(declare-fun lt!79532 () Unit!3507)

(assert (=> b!51196 (= lt!79532 lt!79530)))

(declare-fun b!51197 () Bool)

(declare-fun e!33818 () Bool)

(declare-fun lt!79537 () (_ BitVec 64))

(assert (=> b!51197 (= e!33818 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!79537))))

(declare-fun b!51198 () Bool)

(declare-fun res!42880 () Bool)

(declare-fun e!33819 () Bool)

(assert (=> b!51198 (=> (not res!42880) (not e!33819))))

(declare-fun lt!79515 () tuple2!4680)

(assert (=> b!51198 (= res!42880 (= (size!1066 (buf!1421 (_2!2445 lt!79515))) (size!1066 (buf!1421 (_2!2445 lt!78686)))))))

(declare-fun b!51200 () Bool)

(declare-fun Unit!3536 () Unit!3507)

(assert (=> b!51200 (= e!33820 (tuple2!4681 Unit!3536 (_2!2445 lt!78686)))))

(assert (=> b!51200 (= (size!1066 (buf!1421 (_2!2445 lt!78686))) (size!1066 (buf!1421 (_2!2445 lt!78686))))))

(declare-fun lt!79504 () Unit!3507)

(declare-fun Unit!3537 () Unit!3507)

(assert (=> b!51200 (= lt!79504 Unit!3537)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1846 array!2344 array!2344 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4706 0))(
  ( (tuple2!4707 (_1!2458 array!2344) (_2!2458 BitStream!1846)) )
))
(declare-fun readBits!0 (BitStream!1846 (_ BitVec 64)) tuple2!4706)

(assert (=> b!51200 (checkByteArrayBitContent!0 (_2!2445 lt!78686) srcBuffer!2 (_1!2458 (readBits!0 (_1!2446 call!658) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!51201 () Bool)

(declare-fun res!42875 () Bool)

(assert (=> b!51201 (=> (not res!42875) (not e!33819))))

(assert (=> b!51201 (= res!42875 (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!79515)))))

(declare-fun lt!79525 () tuple2!4682)

(declare-fun b!51202 () Bool)

(assert (=> b!51202 (= e!33819 (= (bitStreamReadBitsIntoList!0 (_2!2445 lt!79515) (_1!2446 lt!79525) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2445 lt!79515) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!51202 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51202 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!79536 () Unit!3507)

(declare-fun lt!79534 () Unit!3507)

(assert (=> b!51202 (= lt!79536 lt!79534)))

(assert (=> b!51202 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!79515)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!79537)))

(assert (=> b!51202 (= lt!79534 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2445 lt!78686) (buf!1421 (_2!2445 lt!79515)) lt!79537))))

(assert (=> b!51202 e!33818))

(declare-fun res!42877 () Bool)

(assert (=> b!51202 (=> (not res!42877) (not e!33818))))

(assert (=> b!51202 (= res!42877 (and (= (size!1066 (buf!1421 (_2!2445 lt!78686))) (size!1066 (buf!1421 (_2!2445 lt!79515)))) (bvsge lt!79537 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51202 (= lt!79537 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!51202 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51202 (= lt!79525 (reader!0 (_2!2445 lt!78686) (_2!2445 lt!79515)))))

(declare-fun b!51203 () Bool)

(declare-fun res!42879 () Bool)

(assert (=> b!51203 (=> (not res!42879) (not e!33819))))

(assert (=> b!51203 (= res!42879 (invariant!0 (currentBit!2939 (_2!2445 lt!79515)) (currentByte!2944 (_2!2445 lt!79515)) (size!1066 (buf!1421 (_2!2445 lt!79515)))))))

(declare-fun bm!655 () Bool)

(declare-fun c!3646 () Bool)

(assert (=> bm!655 (= call!658 (reader!0 (_2!2445 lt!78686) (ite c!3646 (_2!2445 lt!79508) (_2!2445 lt!78686))))))

(declare-fun d!16016 () Bool)

(assert (=> d!16016 e!33819))

(declare-fun res!42876 () Bool)

(assert (=> d!16016 (=> (not res!42876) (not e!33819))))

(declare-fun lt!79514 () (_ BitVec 64))

(assert (=> d!16016 (= res!42876 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79515))) (currentByte!2944 (_2!2445 lt!79515)) (currentBit!2939 (_2!2445 lt!79515))) (bvsub lt!79514 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!16016 (or (= (bvand lt!79514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79514 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!79511 () (_ BitVec 64))

(assert (=> d!16016 (= lt!79514 (bvadd lt!79511 to!314))))

(assert (=> d!16016 (or (not (= (bvand lt!79511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!79511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!79511 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16016 (= lt!79511 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(assert (=> d!16016 (= lt!79515 e!33820)))

(assert (=> d!16016 (= c!3646 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!79521 () Unit!3507)

(declare-fun lt!79503 () Unit!3507)

(assert (=> d!16016 (= lt!79521 lt!79503)))

(assert (=> d!16016 (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!78686))))

(assert (=> d!16016 (= lt!79503 (lemmaIsPrefixRefl!0 (_2!2445 lt!78686)))))

(assert (=> d!16016 (= lt!79520 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(assert (=> d!16016 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16016 (= (appendBitsMSBFirstLoop!0 (_2!2445 lt!78686) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!79515)))

(declare-fun b!51199 () Bool)

(declare-fun res!42878 () Bool)

(assert (=> b!51199 (=> (not res!42878) (not e!33819))))

(assert (=> b!51199 (= res!42878 (= (size!1066 (buf!1421 (_2!2445 lt!78686))) (size!1066 (buf!1421 (_2!2445 lt!79515)))))))

(assert (= (and d!16016 c!3646) b!51196))

(assert (= (and d!16016 (not c!3646)) b!51200))

(assert (= (or b!51196 b!51200) bm!655))

(assert (= (and d!16016 res!42876) b!51203))

(assert (= (and b!51203 res!42879) b!51199))

(assert (= (and b!51199 res!42878) b!51201))

(assert (= (and b!51201 res!42875) b!51198))

(assert (= (and b!51198 res!42880) b!51202))

(assert (= (and b!51202 res!42877) b!51197))

(declare-fun m!80669 () Bool)

(assert (=> bm!655 m!80669))

(declare-fun m!80671 () Bool)

(assert (=> b!51200 m!80671))

(declare-fun m!80673 () Bool)

(assert (=> b!51200 m!80673))

(declare-fun m!80675 () Bool)

(assert (=> b!51197 m!80675))

(declare-fun m!80677 () Bool)

(assert (=> b!51196 m!80677))

(declare-fun m!80679 () Bool)

(assert (=> b!51196 m!80679))

(declare-fun m!80681 () Bool)

(assert (=> b!51196 m!80681))

(declare-fun m!80683 () Bool)

(assert (=> b!51196 m!80683))

(declare-fun m!80685 () Bool)

(assert (=> b!51196 m!80685))

(declare-fun m!80687 () Bool)

(assert (=> b!51196 m!80687))

(declare-fun m!80689 () Bool)

(assert (=> b!51196 m!80689))

(declare-fun m!80691 () Bool)

(assert (=> b!51196 m!80691))

(declare-fun m!80693 () Bool)

(assert (=> b!51196 m!80693))

(declare-fun m!80695 () Bool)

(assert (=> b!51196 m!80695))

(declare-fun m!80697 () Bool)

(assert (=> b!51196 m!80697))

(declare-fun m!80699 () Bool)

(assert (=> b!51196 m!80699))

(declare-fun m!80701 () Bool)

(assert (=> b!51196 m!80701))

(declare-fun m!80703 () Bool)

(assert (=> b!51196 m!80703))

(declare-fun m!80705 () Bool)

(assert (=> b!51196 m!80705))

(declare-fun m!80707 () Bool)

(assert (=> b!51196 m!80707))

(declare-fun m!80709 () Bool)

(assert (=> b!51196 m!80709))

(declare-fun m!80711 () Bool)

(assert (=> b!51196 m!80711))

(declare-fun m!80713 () Bool)

(assert (=> b!51196 m!80713))

(assert (=> b!51196 m!80703))

(declare-fun m!80715 () Bool)

(assert (=> b!51196 m!80715))

(declare-fun m!80717 () Bool)

(assert (=> b!51196 m!80717))

(declare-fun m!80719 () Bool)

(assert (=> b!51196 m!80719))

(declare-fun m!80721 () Bool)

(assert (=> b!51196 m!80721))

(declare-fun m!80723 () Bool)

(assert (=> b!51196 m!80723))

(assert (=> b!51196 m!80695))

(declare-fun m!80725 () Bool)

(assert (=> b!51196 m!80725))

(declare-fun m!80727 () Bool)

(assert (=> b!51196 m!80727))

(declare-fun m!80729 () Bool)

(assert (=> b!51196 m!80729))

(declare-fun m!80731 () Bool)

(assert (=> b!51196 m!80731))

(assert (=> b!51196 m!80697))

(declare-fun m!80733 () Bool)

(assert (=> b!51196 m!80733))

(declare-fun m!80735 () Bool)

(assert (=> b!51196 m!80735))

(declare-fun m!80737 () Bool)

(assert (=> b!51196 m!80737))

(assert (=> b!51196 m!79989))

(assert (=> b!51196 m!80711))

(declare-fun m!80739 () Bool)

(assert (=> b!51203 m!80739))

(declare-fun m!80741 () Bool)

(assert (=> d!16016 m!80741))

(assert (=> d!16016 m!79989))

(declare-fun m!80743 () Bool)

(assert (=> d!16016 m!80743))

(declare-fun m!80745 () Bool)

(assert (=> d!16016 m!80745))

(declare-fun m!80747 () Bool)

(assert (=> b!51201 m!80747))

(declare-fun m!80749 () Bool)

(assert (=> b!51202 m!80749))

(declare-fun m!80751 () Bool)

(assert (=> b!51202 m!80751))

(declare-fun m!80753 () Bool)

(assert (=> b!51202 m!80753))

(declare-fun m!80755 () Bool)

(assert (=> b!51202 m!80755))

(declare-fun m!80757 () Bool)

(assert (=> b!51202 m!80757))

(assert (=> b!50835 d!16016))

(declare-fun d!16132 () Bool)

(declare-fun res!42883 () Bool)

(declare-fun e!33822 () Bool)

(assert (=> d!16132 (=> (not res!42883) (not e!33822))))

(assert (=> d!16132 (= res!42883 (= (size!1066 (buf!1421 (_2!2445 lt!78686))) (size!1066 (buf!1421 (_2!2445 lt!78682)))))))

(assert (=> d!16132 (= (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!78682)) e!33822)))

(declare-fun b!51204 () Bool)

(declare-fun res!42881 () Bool)

(assert (=> b!51204 (=> (not res!42881) (not e!33822))))

(assert (=> b!51204 (= res!42881 (bvsle (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))) (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78682))) (currentByte!2944 (_2!2445 lt!78682)) (currentBit!2939 (_2!2445 lt!78682)))))))

(declare-fun b!51205 () Bool)

(declare-fun e!33821 () Bool)

(assert (=> b!51205 (= e!33822 e!33821)))

(declare-fun res!42882 () Bool)

(assert (=> b!51205 (=> res!42882 e!33821)))

(assert (=> b!51205 (= res!42882 (= (size!1066 (buf!1421 (_2!2445 lt!78686))) #b00000000000000000000000000000000))))

(declare-fun b!51206 () Bool)

(assert (=> b!51206 (= e!33821 (arrayBitRangesEq!0 (buf!1421 (_2!2445 lt!78686)) (buf!1421 (_2!2445 lt!78682)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686)))))))

(assert (= (and d!16132 res!42883) b!51204))

(assert (= (and b!51204 res!42881) b!51205))

(assert (= (and b!51205 (not res!42882)) b!51206))

(assert (=> b!51204 m!79989))

(assert (=> b!51204 m!80011))

(assert (=> b!51206 m!79989))

(assert (=> b!51206 m!79989))

(declare-fun m!80759 () Bool)

(assert (=> b!51206 m!80759))

(assert (=> b!50835 d!16132))

(declare-fun d!16134 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16134 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4049 () Bool)

(assert (= bs!4049 d!16134))

(declare-fun m!80761 () Bool)

(assert (=> bs!4049 m!80761))

(assert (=> b!50835 d!16134))

(declare-fun d!16136 () Bool)

(assert (=> d!16136 (isPrefixOf!0 thiss!1379 (_2!2445 lt!78682))))

(declare-fun lt!79543 () Unit!3507)

(declare-fun choose!30 (BitStream!1846 BitStream!1846 BitStream!1846) Unit!3507)

(assert (=> d!16136 (= lt!79543 (choose!30 thiss!1379 (_2!2445 lt!78686) (_2!2445 lt!78682)))))

(assert (=> d!16136 (isPrefixOf!0 thiss!1379 (_2!2445 lt!78686))))

(assert (=> d!16136 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2445 lt!78686) (_2!2445 lt!78682)) lt!79543)))

(declare-fun bs!4050 () Bool)

(assert (= bs!4050 d!16136))

(assert (=> bs!4050 m!79965))

(declare-fun m!80763 () Bool)

(assert (=> bs!4050 m!80763))

(assert (=> bs!4050 m!79983))

(assert (=> b!50835 d!16136))

(declare-fun d!16138 () Bool)

(assert (=> d!16138 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79546 () Unit!3507)

(declare-fun choose!9 (BitStream!1846 array!2344 (_ BitVec 64) BitStream!1846) Unit!3507)

(assert (=> d!16138 (= lt!79546 (choose!9 thiss!1379 (buf!1421 (_2!2445 lt!78686)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1847 (buf!1421 (_2!2445 lt!78686)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379))))))

(assert (=> d!16138 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1421 (_2!2445 lt!78686)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79546)))

(declare-fun bs!4051 () Bool)

(assert (= bs!4051 d!16138))

(assert (=> bs!4051 m!79975))

(declare-fun m!80765 () Bool)

(assert (=> bs!4051 m!80765))

(assert (=> b!50835 d!16138))

(declare-fun d!16140 () Bool)

(declare-fun e!33828 () Bool)

(assert (=> d!16140 e!33828))

(declare-fun res!42892 () Bool)

(assert (=> d!16140 (=> (not res!42892) (not e!33828))))

(declare-fun lt!79602 () tuple2!4682)

(assert (=> d!16140 (= res!42892 (isPrefixOf!0 (_1!2446 lt!79602) (_2!2446 lt!79602)))))

(declare-fun lt!79590 () BitStream!1846)

(assert (=> d!16140 (= lt!79602 (tuple2!4683 lt!79590 (_2!2445 lt!78686)))))

(declare-fun lt!79598 () Unit!3507)

(declare-fun lt!79587 () Unit!3507)

(assert (=> d!16140 (= lt!79598 lt!79587)))

(assert (=> d!16140 (isPrefixOf!0 lt!79590 (_2!2445 lt!78686))))

(assert (=> d!16140 (= lt!79587 (lemmaIsPrefixTransitive!0 lt!79590 (_2!2445 lt!78686) (_2!2445 lt!78686)))))

(declare-fun lt!79605 () Unit!3507)

(declare-fun lt!79594 () Unit!3507)

(assert (=> d!16140 (= lt!79605 lt!79594)))

(assert (=> d!16140 (isPrefixOf!0 lt!79590 (_2!2445 lt!78686))))

(assert (=> d!16140 (= lt!79594 (lemmaIsPrefixTransitive!0 lt!79590 thiss!1379 (_2!2445 lt!78686)))))

(declare-fun lt!79595 () Unit!3507)

(declare-fun e!33827 () Unit!3507)

(assert (=> d!16140 (= lt!79595 e!33827)))

(declare-fun c!3649 () Bool)

(assert (=> d!16140 (= c!3649 (not (= (size!1066 (buf!1421 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!79603 () Unit!3507)

(declare-fun lt!79604 () Unit!3507)

(assert (=> d!16140 (= lt!79603 lt!79604)))

(assert (=> d!16140 (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!78686))))

(assert (=> d!16140 (= lt!79604 (lemmaIsPrefixRefl!0 (_2!2445 lt!78686)))))

(declare-fun lt!79592 () Unit!3507)

(declare-fun lt!79597 () Unit!3507)

(assert (=> d!16140 (= lt!79592 lt!79597)))

(assert (=> d!16140 (= lt!79597 (lemmaIsPrefixRefl!0 (_2!2445 lt!78686)))))

(declare-fun lt!79596 () Unit!3507)

(declare-fun lt!79606 () Unit!3507)

(assert (=> d!16140 (= lt!79596 lt!79606)))

(assert (=> d!16140 (isPrefixOf!0 lt!79590 lt!79590)))

(assert (=> d!16140 (= lt!79606 (lemmaIsPrefixRefl!0 lt!79590))))

(declare-fun lt!79589 () Unit!3507)

(declare-fun lt!79591 () Unit!3507)

(assert (=> d!16140 (= lt!79589 lt!79591)))

(assert (=> d!16140 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16140 (= lt!79591 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16140 (= lt!79590 (BitStream!1847 (buf!1421 (_2!2445 lt!78686)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(assert (=> d!16140 (isPrefixOf!0 thiss!1379 (_2!2445 lt!78686))))

(assert (=> d!16140 (= (reader!0 thiss!1379 (_2!2445 lt!78686)) lt!79602)))

(declare-fun b!51217 () Bool)

(declare-fun lt!79588 () Unit!3507)

(assert (=> b!51217 (= e!33827 lt!79588)))

(declare-fun lt!79601 () (_ BitVec 64))

(assert (=> b!51217 (= lt!79601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79599 () (_ BitVec 64))

(assert (=> b!51217 (= lt!79599 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2344 array!2344 (_ BitVec 64) (_ BitVec 64)) Unit!3507)

(assert (=> b!51217 (= lt!79588 (arrayBitRangesEqSymmetric!0 (buf!1421 thiss!1379) (buf!1421 (_2!2445 lt!78686)) lt!79601 lt!79599))))

(assert (=> b!51217 (arrayBitRangesEq!0 (buf!1421 (_2!2445 lt!78686)) (buf!1421 thiss!1379) lt!79601 lt!79599)))

(declare-fun b!51218 () Bool)

(declare-fun res!42890 () Bool)

(assert (=> b!51218 (=> (not res!42890) (not e!33828))))

(assert (=> b!51218 (= res!42890 (isPrefixOf!0 (_1!2446 lt!79602) thiss!1379))))

(declare-fun lt!79600 () (_ BitVec 64))

(declare-fun lt!79593 () (_ BitVec 64))

(declare-fun b!51219 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1846 (_ BitVec 64)) BitStream!1846)

(assert (=> b!51219 (= e!33828 (= (_1!2446 lt!79602) (withMovedBitIndex!0 (_2!2446 lt!79602) (bvsub lt!79593 lt!79600))))))

(assert (=> b!51219 (or (= (bvand lt!79593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79593 lt!79600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51219 (= lt!79600 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(assert (=> b!51219 (= lt!79593 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(declare-fun b!51220 () Bool)

(declare-fun Unit!3538 () Unit!3507)

(assert (=> b!51220 (= e!33827 Unit!3538)))

(declare-fun b!51221 () Bool)

(declare-fun res!42891 () Bool)

(assert (=> b!51221 (=> (not res!42891) (not e!33828))))

(assert (=> b!51221 (= res!42891 (isPrefixOf!0 (_2!2446 lt!79602) (_2!2445 lt!78686)))))

(assert (= (and d!16140 c!3649) b!51217))

(assert (= (and d!16140 (not c!3649)) b!51220))

(assert (= (and d!16140 res!42892) b!51218))

(assert (= (and b!51218 res!42890) b!51221))

(assert (= (and b!51221 res!42891) b!51219))

(assert (=> b!51217 m!79961))

(declare-fun m!80767 () Bool)

(assert (=> b!51217 m!80767))

(declare-fun m!80769 () Bool)

(assert (=> b!51217 m!80769))

(declare-fun m!80771 () Bool)

(assert (=> b!51219 m!80771))

(assert (=> b!51219 m!79989))

(assert (=> b!51219 m!79961))

(declare-fun m!80773 () Bool)

(assert (=> b!51218 m!80773))

(declare-fun m!80775 () Bool)

(assert (=> b!51221 m!80775))

(assert (=> d!16140 m!79959))

(assert (=> d!16140 m!79983))

(declare-fun m!80777 () Bool)

(assert (=> d!16140 m!80777))

(declare-fun m!80779 () Bool)

(assert (=> d!16140 m!80779))

(declare-fun m!80781 () Bool)

(assert (=> d!16140 m!80781))

(assert (=> d!16140 m!80745))

(declare-fun m!80783 () Bool)

(assert (=> d!16140 m!80783))

(assert (=> d!16140 m!79957))

(assert (=> d!16140 m!80743))

(declare-fun m!80785 () Bool)

(assert (=> d!16140 m!80785))

(declare-fun m!80787 () Bool)

(assert (=> d!16140 m!80787))

(assert (=> b!50835 d!16140))

(declare-fun d!16142 () Bool)

(assert (=> d!16142 (= (invariant!0 (currentBit!2939 (_2!2445 lt!78686)) (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78686)))) (and (bvsge (currentBit!2939 (_2!2445 lt!78686)) #b00000000000000000000000000000000) (bvslt (currentBit!2939 (_2!2445 lt!78686)) #b00000000000000000000000000001000) (bvsge (currentByte!2944 (_2!2445 lt!78686)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78686)))) (and (= (currentBit!2939 (_2!2445 lt!78686)) #b00000000000000000000000000000000) (= (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78686))))))))))

(assert (=> b!50825 d!16142))

(declare-fun d!16144 () Bool)

(assert (=> d!16144 (= (bitAt!0 (buf!1421 (_2!2445 lt!78682)) lt!78677) (not (= (bvand ((_ sign_extend 24) (select (arr!1595 (buf!1421 (_2!2445 lt!78682))) ((_ extract 31 0) (bvsdiv lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4052 () Bool)

(assert (= bs!4052 d!16144))

(declare-fun m!80789 () Bool)

(assert (=> bs!4052 m!80789))

(declare-fun m!80791 () Bool)

(assert (=> bs!4052 m!80791))

(assert (=> b!50836 d!16144))

(declare-fun d!16146 () Bool)

(assert (=> d!16146 (= (bitAt!0 (buf!1421 (_2!2445 lt!78686)) lt!78677) (bitAt!0 (buf!1421 (_2!2445 lt!78682)) lt!78677))))

(declare-fun lt!79609 () Unit!3507)

(declare-fun choose!31 (array!2344 array!2344 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3507)

(assert (=> d!16146 (= lt!79609 (choose!31 (buf!1421 (_2!2445 lt!78686)) (buf!1421 (_2!2445 lt!78682)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78677 lt!78700))))

(assert (=> d!16146 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!78700))))

(assert (=> d!16146 (= (arrayBitRangesEqImpliesEq!0 (buf!1421 (_2!2445 lt!78686)) (buf!1421 (_2!2445 lt!78682)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78677 lt!78700) lt!79609)))

(declare-fun bs!4053 () Bool)

(assert (= bs!4053 d!16146))

(assert (=> bs!4053 m!80017))

(assert (=> bs!4053 m!80003))

(declare-fun m!80793 () Bool)

(assert (=> bs!4053 m!80793))

(assert (=> b!50836 d!16146))

(declare-fun d!16148 () Bool)

(assert (=> d!16148 (= (head!383 (byteArrayBitContentToList!0 (_2!2445 lt!78682) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!679 (byteArrayBitContentToList!0 (_2!2445 lt!78682) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!50826 d!16148))

(declare-fun d!16150 () Bool)

(declare-fun c!3652 () Bool)

(assert (=> d!16150 (= c!3652 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33831 () List!564)

(assert (=> d!16150 (= (byteArrayBitContentToList!0 (_2!2445 lt!78682) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!33831)))

(declare-fun b!51226 () Bool)

(assert (=> b!51226 (= e!33831 Nil!561)))

(declare-fun b!51227 () Bool)

(assert (=> b!51227 (= e!33831 (Cons!560 (not (= (bvand ((_ sign_extend 24) (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2445 lt!78682) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16150 c!3652) b!51226))

(assert (= (and d!16150 (not c!3652)) b!51227))

(assert (=> b!51227 m!79979))

(declare-fun m!80795 () Bool)

(assert (=> b!51227 m!80795))

(declare-fun m!80797 () Bool)

(assert (=> b!51227 m!80797))

(assert (=> b!50826 d!16150))

(declare-fun d!16152 () Bool)

(assert (=> d!16152 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4054 () Bool)

(assert (= bs!4054 d!16152))

(assert (=> bs!4054 m!79979))

(assert (=> bs!4054 m!80795))

(assert (=> b!50826 d!16152))

(declare-fun d!16154 () Bool)

(declare-fun res!42895 () Bool)

(declare-fun e!33833 () Bool)

(assert (=> d!16154 (=> (not res!42895) (not e!33833))))

(assert (=> d!16154 (= res!42895 (= (size!1066 (buf!1421 thiss!1379)) (size!1066 (buf!1421 (_2!2445 lt!78686)))))))

(assert (=> d!16154 (= (isPrefixOf!0 thiss!1379 (_2!2445 lt!78686)) e!33833)))

(declare-fun b!51228 () Bool)

(declare-fun res!42893 () Bool)

(assert (=> b!51228 (=> (not res!42893) (not e!33833))))

(assert (=> b!51228 (= res!42893 (bvsle (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)) (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686)))))))

(declare-fun b!51229 () Bool)

(declare-fun e!33832 () Bool)

(assert (=> b!51229 (= e!33833 e!33832)))

(declare-fun res!42894 () Bool)

(assert (=> b!51229 (=> res!42894 e!33832)))

(assert (=> b!51229 (= res!42894 (= (size!1066 (buf!1421 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51230 () Bool)

(assert (=> b!51230 (= e!33832 (arrayBitRangesEq!0 (buf!1421 thiss!1379) (buf!1421 (_2!2445 lt!78686)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379))))))

(assert (= (and d!16154 res!42895) b!51228))

(assert (= (and b!51228 res!42893) b!51229))

(assert (= (and b!51229 (not res!42894)) b!51230))

(assert (=> b!51228 m!79961))

(assert (=> b!51228 m!79989))

(assert (=> b!51230 m!79961))

(assert (=> b!51230 m!79961))

(declare-fun m!80799 () Bool)

(assert (=> b!51230 m!80799))

(assert (=> b!50816 d!16154))

(declare-fun d!16156 () Bool)

(assert (=> d!16156 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!78680) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686)))) lt!78680))))

(declare-fun bs!4055 () Bool)

(assert (= bs!4055 d!16156))

(declare-fun m!80801 () Bool)

(assert (=> bs!4055 m!80801))

(assert (=> b!50816 d!16156))

(declare-fun d!16158 () Bool)

(declare-fun e!33844 () Bool)

(assert (=> d!16158 e!33844))

(declare-fun res!42914 () Bool)

(assert (=> d!16158 (=> (not res!42914) (not e!33844))))

(assert (=> d!16158 (= res!42914 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!79636 () Unit!3507)

(declare-fun choose!27 (BitStream!1846 BitStream!1846 (_ BitVec 64) (_ BitVec 64)) Unit!3507)

(assert (=> d!16158 (= lt!79636 (choose!27 thiss!1379 (_2!2445 lt!78686) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16158 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16158 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2445 lt!78686) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79636)))

(declare-fun b!51250 () Bool)

(assert (=> b!51250 (= e!33844 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16158 res!42914) b!51250))

(declare-fun m!80803 () Bool)

(assert (=> d!16158 m!80803))

(declare-fun m!80805 () Bool)

(assert (=> b!51250 m!80805))

(assert (=> b!50816 d!16158))

(declare-fun b!51315 () Bool)

(declare-fun e!33877 () Bool)

(declare-fun lt!79761 () tuple2!4684)

(declare-fun lt!79755 () tuple2!4680)

(assert (=> b!51315 (= e!33877 (= (bitIndex!0 (size!1066 (buf!1421 (_1!2447 lt!79761))) (currentByte!2944 (_1!2447 lt!79761)) (currentBit!2939 (_1!2447 lt!79761))) (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79755))) (currentByte!2944 (_2!2445 lt!79755)) (currentBit!2939 (_2!2445 lt!79755)))))))

(declare-fun b!51316 () Bool)

(declare-fun e!33880 () Bool)

(assert (=> b!51316 (= e!33880 e!33877)))

(declare-fun res!42958 () Bool)

(assert (=> b!51316 (=> (not res!42958) (not e!33877))))

(declare-fun lt!79758 () (_ BitVec 8))

(assert (=> b!51316 (= res!42958 (and (= (_2!2447 lt!79761) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!79758)) #b00000000000000000000000000000000))) (= (_1!2447 lt!79761) (_2!2445 lt!79755))))))

(declare-fun lt!79759 () tuple2!4706)

(declare-fun lt!79752 () BitStream!1846)

(assert (=> b!51316 (= lt!79759 (readBits!0 lt!79752 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51316 (= lt!79761 (readBitPure!0 lt!79752))))

(declare-fun readerFrom!0 (BitStream!1846 (_ BitVec 32) (_ BitVec 32)) BitStream!1846)

(assert (=> b!51316 (= lt!79752 (readerFrom!0 (_2!2445 lt!79755) (currentBit!2939 thiss!1379) (currentByte!2944 thiss!1379)))))

(declare-fun b!51317 () Bool)

(declare-fun e!33878 () Bool)

(declare-fun e!33879 () Bool)

(assert (=> b!51317 (= e!33878 e!33879)))

(declare-fun res!42952 () Bool)

(assert (=> b!51317 (=> (not res!42952) (not e!33879))))

(declare-fun lt!79756 () Bool)

(declare-fun lt!79757 () tuple2!4684)

(declare-fun lt!79751 () tuple2!4680)

(assert (=> b!51317 (= res!42952 (and (= (_2!2447 lt!79757) lt!79756) (= (_1!2447 lt!79757) (_2!2445 lt!79751))))))

(assert (=> b!51317 (= lt!79757 (readBitPure!0 (readerFrom!0 (_2!2445 lt!79751) (currentBit!2939 thiss!1379) (currentByte!2944 thiss!1379))))))

(declare-fun b!51318 () Bool)

(assert (=> b!51318 (= e!33879 (= (bitIndex!0 (size!1066 (buf!1421 (_1!2447 lt!79757))) (currentByte!2944 (_1!2447 lt!79757)) (currentBit!2939 (_1!2447 lt!79757))) (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79751))) (currentByte!2944 (_2!2445 lt!79751)) (currentBit!2939 (_2!2445 lt!79751)))))))

(declare-fun b!51319 () Bool)

(declare-fun res!42955 () Bool)

(assert (=> b!51319 (=> (not res!42955) (not e!33878))))

(assert (=> b!51319 (= res!42955 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79751))) (currentByte!2944 (_2!2445 lt!79751)) (currentBit!2939 (_2!2445 lt!79751))) (bvadd (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!51320 () Bool)

(declare-fun res!42959 () Bool)

(assert (=> b!51320 (=> (not res!42959) (not e!33878))))

(assert (=> b!51320 (= res!42959 (isPrefixOf!0 thiss!1379 (_2!2445 lt!79751)))))

(declare-fun d!16160 () Bool)

(assert (=> d!16160 e!33880))

(declare-fun res!42957 () Bool)

(assert (=> d!16160 (=> (not res!42957) (not e!33880))))

(assert (=> d!16160 (= res!42957 (= (size!1066 (buf!1421 (_2!2445 lt!79755))) (size!1066 (buf!1421 thiss!1379))))))

(declare-fun lt!79762 () array!2344)

(assert (=> d!16160 (= lt!79758 (select (arr!1595 lt!79762) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16160 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1066 lt!79762)))))

(assert (=> d!16160 (= lt!79762 (array!2345 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!79760 () tuple2!4680)

(assert (=> d!16160 (= lt!79755 (tuple2!4681 (_1!2445 lt!79760) (_2!2445 lt!79760)))))

(assert (=> d!16160 (= lt!79760 lt!79751)))

(assert (=> d!16160 e!33878))

(declare-fun res!42954 () Bool)

(assert (=> d!16160 (=> (not res!42954) (not e!33878))))

(assert (=> d!16160 (= res!42954 (= (size!1066 (buf!1421 thiss!1379)) (size!1066 (buf!1421 (_2!2445 lt!79751)))))))

(declare-fun appendBit!0 (BitStream!1846 Bool) tuple2!4680)

(assert (=> d!16160 (= lt!79751 (appendBit!0 thiss!1379 lt!79756))))

(assert (=> d!16160 (= lt!79756 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16160 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16160 (= (appendBitFromByte!0 thiss!1379 (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!79755)))

(declare-fun b!51321 () Bool)

(declare-fun res!42953 () Bool)

(assert (=> b!51321 (=> (not res!42953) (not e!33880))))

(assert (=> b!51321 (= res!42953 (isPrefixOf!0 thiss!1379 (_2!2445 lt!79755)))))

(declare-fun b!51322 () Bool)

(declare-fun res!42956 () Bool)

(assert (=> b!51322 (=> (not res!42956) (not e!33880))))

(declare-fun lt!79753 () (_ BitVec 64))

(declare-fun lt!79754 () (_ BitVec 64))

(assert (=> b!51322 (= res!42956 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!79755))) (currentByte!2944 (_2!2445 lt!79755)) (currentBit!2939 (_2!2445 lt!79755))) (bvadd lt!79754 lt!79753)))))

(assert (=> b!51322 (or (not (= (bvand lt!79754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79753 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!79754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!79754 lt!79753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51322 (= lt!79753 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!51322 (= lt!79754 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(assert (= (and d!16160 res!42954) b!51319))

(assert (= (and b!51319 res!42955) b!51320))

(assert (= (and b!51320 res!42959) b!51317))

(assert (= (and b!51317 res!42952) b!51318))

(assert (= (and d!16160 res!42957) b!51322))

(assert (= (and b!51322 res!42956) b!51321))

(assert (= (and b!51321 res!42953) b!51316))

(assert (= (and b!51316 res!42958) b!51315))

(declare-fun m!80923 () Bool)

(assert (=> b!51320 m!80923))

(declare-fun m!80925 () Bool)

(assert (=> b!51322 m!80925))

(assert (=> b!51322 m!79961))

(declare-fun m!80927 () Bool)

(assert (=> b!51318 m!80927))

(declare-fun m!80929 () Bool)

(assert (=> b!51318 m!80929))

(declare-fun m!80931 () Bool)

(assert (=> b!51316 m!80931))

(declare-fun m!80933 () Bool)

(assert (=> b!51316 m!80933))

(declare-fun m!80935 () Bool)

(assert (=> b!51316 m!80935))

(assert (=> b!51319 m!80929))

(assert (=> b!51319 m!79961))

(declare-fun m!80937 () Bool)

(assert (=> b!51317 m!80937))

(assert (=> b!51317 m!80937))

(declare-fun m!80939 () Bool)

(assert (=> b!51317 m!80939))

(declare-fun m!80941 () Bool)

(assert (=> b!51321 m!80941))

(declare-fun m!80943 () Bool)

(assert (=> b!51315 m!80943))

(assert (=> b!51315 m!80925))

(declare-fun m!80945 () Bool)

(assert (=> d!16160 m!80945))

(declare-fun m!80947 () Bool)

(assert (=> d!16160 m!80947))

(assert (=> d!16160 m!80795))

(assert (=> b!50816 d!16160))

(declare-fun d!16206 () Bool)

(assert (=> d!16206 (= (head!383 lt!78689) (h!679 lt!78689))))

(assert (=> b!50827 d!16206))

(declare-fun d!16208 () Bool)

(declare-datatypes ((tuple2!4710 0))(
  ( (tuple2!4711 (_1!2460 Bool) (_2!2460 BitStream!1846)) )
))
(declare-fun lt!79765 () tuple2!4710)

(declare-fun readBit!0 (BitStream!1846) tuple2!4710)

(assert (=> d!16208 (= lt!79765 (readBit!0 (_1!2446 lt!78691)))))

(assert (=> d!16208 (= (readBitPure!0 (_1!2446 lt!78691)) (tuple2!4685 (_2!2460 lt!79765) (_1!2460 lt!79765)))))

(declare-fun bs!4063 () Bool)

(assert (= bs!4063 d!16208))

(declare-fun m!80949 () Bool)

(assert (=> bs!4063 m!80949))

(assert (=> b!50817 d!16208))

(declare-fun d!16210 () Bool)

(assert (=> d!16210 (= (array_inv!976 srcBuffer!2) (bvsge (size!1066 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10022 d!16210))

(declare-fun d!16212 () Bool)

(assert (=> d!16212 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2939 thiss!1379) (currentByte!2944 thiss!1379) (size!1066 (buf!1421 thiss!1379))))))

(declare-fun bs!4064 () Bool)

(assert (= bs!4064 d!16212))

(declare-fun m!80951 () Bool)

(assert (=> bs!4064 m!80951))

(assert (=> start!10022 d!16212))

(declare-fun d!16214 () Bool)

(assert (=> d!16214 (= (tail!250 lt!78689) (t!1314 lt!78689))))

(assert (=> b!50828 d!16214))

(declare-fun d!16216 () Bool)

(declare-fun e!33883 () Bool)

(assert (=> d!16216 e!33883))

(declare-fun res!42962 () Bool)

(assert (=> d!16216 (=> (not res!42962) (not e!33883))))

(declare-fun lt!79771 () (_ BitVec 64))

(assert (=> d!16216 (= res!42962 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!79771) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!16216 (= lt!79771 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79770 () Unit!3507)

(declare-fun choose!42 (BitStream!1846 BitStream!1846 BitStream!1846 BitStream!1846 (_ BitVec 64) List!564) Unit!3507)

(assert (=> d!16216 (= lt!79770 (choose!42 (_2!2445 lt!78682) (_2!2445 lt!78682) (_1!2446 lt!78691) (_1!2446 lt!78699) (bvsub to!314 i!635) lt!78689))))

(assert (=> d!16216 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16216 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2445 lt!78682) (_2!2445 lt!78682) (_1!2446 lt!78691) (_1!2446 lt!78699) (bvsub to!314 i!635) lt!78689) lt!79770)))

(declare-fun b!51325 () Bool)

(assert (=> b!51325 (= e!33883 (= (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_1!2446 lt!78699) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!250 lt!78689)))))

(assert (= (and d!16216 res!42962) b!51325))

(declare-fun m!80953 () Bool)

(assert (=> d!16216 m!80953))

(declare-fun m!80955 () Bool)

(assert (=> b!51325 m!80955))

(assert (=> b!51325 m!80025))

(assert (=> b!50828 d!16216))

(declare-fun d!16218 () Bool)

(assert (=> d!16218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 thiss!1379))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 thiss!1379))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4065 () Bool)

(assert (= bs!4065 d!16218))

(declare-fun m!80957 () Bool)

(assert (=> bs!4065 m!80957))

(assert (=> b!50818 d!16218))

(declare-fun d!16220 () Bool)

(declare-fun e!33886 () Bool)

(assert (=> d!16220 e!33886))

(declare-fun res!42968 () Bool)

(assert (=> d!16220 (=> (not res!42968) (not e!33886))))

(declare-fun lt!79786 () (_ BitVec 64))

(declare-fun lt!79789 () (_ BitVec 64))

(declare-fun lt!79787 () (_ BitVec 64))

(assert (=> d!16220 (= res!42968 (= lt!79787 (bvsub lt!79786 lt!79789)))))

(assert (=> d!16220 (or (= (bvand lt!79786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79789 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79786 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79786 lt!79789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16220 (= lt!79789 (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686)))))))

(declare-fun lt!79784 () (_ BitVec 64))

(declare-fun lt!79785 () (_ BitVec 64))

(assert (=> d!16220 (= lt!79786 (bvmul lt!79784 lt!79785))))

(assert (=> d!16220 (or (= lt!79784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79785 (bvsdiv (bvmul lt!79784 lt!79785) lt!79784)))))

(assert (=> d!16220 (= lt!79785 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16220 (= lt!79784 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))))))

(assert (=> d!16220 (= lt!79787 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686)))))))

(assert (=> d!16220 (invariant!0 (currentBit!2939 (_2!2445 lt!78686)) (currentByte!2944 (_2!2445 lt!78686)) (size!1066 (buf!1421 (_2!2445 lt!78686))))))

(assert (=> d!16220 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))) lt!79787)))

(declare-fun b!51330 () Bool)

(declare-fun res!42967 () Bool)

(assert (=> b!51330 (=> (not res!42967) (not e!33886))))

(assert (=> b!51330 (= res!42967 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79787))))

(declare-fun b!51331 () Bool)

(declare-fun lt!79788 () (_ BitVec 64))

(assert (=> b!51331 (= e!33886 (bvsle lt!79787 (bvmul lt!79788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51331 (or (= lt!79788 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79788 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79788)))))

(assert (=> b!51331 (= lt!79788 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78686)))))))

(assert (= (and d!16220 res!42968) b!51330))

(assert (= (and b!51330 res!42967) b!51331))

(assert (=> d!16220 m!80801))

(assert (=> d!16220 m!80001))

(assert (=> b!50829 d!16220))

(declare-fun d!16222 () Bool)

(assert (=> d!16222 (= (bitAt!0 (buf!1421 (_2!2445 lt!78686)) lt!78677) (not (= (bvand ((_ sign_extend 24) (select (arr!1595 (buf!1421 (_2!2445 lt!78686))) ((_ extract 31 0) (bvsdiv lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4066 () Bool)

(assert (= bs!4066 d!16222))

(declare-fun m!80959 () Bool)

(assert (=> bs!4066 m!80959))

(assert (=> bs!4066 m!80791))

(assert (=> b!50819 d!16222))

(declare-fun d!16224 () Bool)

(declare-fun res!42971 () Bool)

(declare-fun e!33888 () Bool)

(assert (=> d!16224 (=> (not res!42971) (not e!33888))))

(assert (=> d!16224 (= res!42971 (= (size!1066 (buf!1421 thiss!1379)) (size!1066 (buf!1421 thiss!1379))))))

(assert (=> d!16224 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!33888)))

(declare-fun b!51332 () Bool)

(declare-fun res!42969 () Bool)

(assert (=> b!51332 (=> (not res!42969) (not e!33888))))

(assert (=> b!51332 (= res!42969 (bvsle (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)) (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379))))))

(declare-fun b!51333 () Bool)

(declare-fun e!33887 () Bool)

(assert (=> b!51333 (= e!33888 e!33887)))

(declare-fun res!42970 () Bool)

(assert (=> b!51333 (=> res!42970 e!33887)))

(assert (=> b!51333 (= res!42970 (= (size!1066 (buf!1421 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51334 () Bool)

(assert (=> b!51334 (= e!33887 (arrayBitRangesEq!0 (buf!1421 thiss!1379) (buf!1421 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379))))))

(assert (= (and d!16224 res!42971) b!51332))

(assert (= (and b!51332 res!42969) b!51333))

(assert (= (and b!51333 (not res!42970)) b!51334))

(assert (=> b!51332 m!79961))

(assert (=> b!51332 m!79961))

(assert (=> b!51334 m!79961))

(assert (=> b!51334 m!79961))

(declare-fun m!80961 () Bool)

(assert (=> b!51334 m!80961))

(assert (=> b!50830 d!16224))

(declare-fun d!16226 () Bool)

(assert (=> d!16226 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!79792 () Unit!3507)

(declare-fun choose!11 (BitStream!1846) Unit!3507)

(assert (=> d!16226 (= lt!79792 (choose!11 thiss!1379))))

(assert (=> d!16226 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!79792)))

(declare-fun bs!4068 () Bool)

(assert (= bs!4068 d!16226))

(assert (=> bs!4068 m!79957))

(declare-fun m!80963 () Bool)

(assert (=> bs!4068 m!80963))

(assert (=> b!50830 d!16226))

(declare-fun d!16228 () Bool)

(declare-fun e!33889 () Bool)

(assert (=> d!16228 e!33889))

(declare-fun res!42973 () Bool)

(assert (=> d!16228 (=> (not res!42973) (not e!33889))))

(declare-fun lt!79798 () (_ BitVec 64))

(declare-fun lt!79796 () (_ BitVec 64))

(declare-fun lt!79795 () (_ BitVec 64))

(assert (=> d!16228 (= res!42973 (= lt!79796 (bvsub lt!79795 lt!79798)))))

(assert (=> d!16228 (or (= (bvand lt!79795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79795 lt!79798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16228 (= lt!79798 (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 thiss!1379))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379))))))

(declare-fun lt!79793 () (_ BitVec 64))

(declare-fun lt!79794 () (_ BitVec 64))

(assert (=> d!16228 (= lt!79795 (bvmul lt!79793 lt!79794))))

(assert (=> d!16228 (or (= lt!79793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79794 (bvsdiv (bvmul lt!79793 lt!79794) lt!79793)))))

(assert (=> d!16228 (= lt!79794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16228 (= lt!79793 ((_ sign_extend 32) (size!1066 (buf!1421 thiss!1379))))))

(assert (=> d!16228 (= lt!79796 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2944 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2939 thiss!1379))))))

(assert (=> d!16228 (invariant!0 (currentBit!2939 thiss!1379) (currentByte!2944 thiss!1379) (size!1066 (buf!1421 thiss!1379)))))

(assert (=> d!16228 (= (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)) lt!79796)))

(declare-fun b!51335 () Bool)

(declare-fun res!42972 () Bool)

(assert (=> b!51335 (=> (not res!42972) (not e!33889))))

(assert (=> b!51335 (= res!42972 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79796))))

(declare-fun b!51336 () Bool)

(declare-fun lt!79797 () (_ BitVec 64))

(assert (=> b!51336 (= e!33889 (bvsle lt!79796 (bvmul lt!79797 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51336 (or (= lt!79797 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79797 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79797)))))

(assert (=> b!51336 (= lt!79797 ((_ sign_extend 32) (size!1066 (buf!1421 thiss!1379))))))

(assert (= (and d!16228 res!42973) b!51335))

(assert (= (and b!51335 res!42972) b!51336))

(assert (=> d!16228 m!80957))

(assert (=> d!16228 m!80951))

(assert (=> b!50830 d!16228))

(declare-fun d!16230 () Bool)

(assert (=> d!16230 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!78680)))

(declare-fun lt!79799 () Unit!3507)

(assert (=> d!16230 (= lt!79799 (choose!9 (_2!2445 lt!78686) (buf!1421 (_2!2445 lt!78682)) lt!78680 (BitStream!1847 (buf!1421 (_2!2445 lt!78682)) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686)))))))

(assert (=> d!16230 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2445 lt!78686) (buf!1421 (_2!2445 lt!78682)) lt!78680) lt!79799)))

(declare-fun bs!4069 () Bool)

(assert (= bs!4069 d!16230))

(assert (=> bs!4069 m!80039))

(declare-fun m!80965 () Bool)

(assert (=> bs!4069 m!80965))

(assert (=> b!50820 d!16230))

(declare-fun b!51348 () Bool)

(declare-fun e!33895 () Bool)

(declare-fun lt!79806 () List!564)

(assert (=> b!51348 (= e!33895 (> (length!259 lt!79806) 0))))

(declare-fun d!16232 () Bool)

(assert (=> d!16232 e!33895))

(declare-fun c!3671 () Bool)

(assert (=> d!16232 (= c!3671 (= lt!78680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4714 0))(
  ( (tuple2!4715 (_1!2462 List!564) (_2!2462 BitStream!1846)) )
))
(declare-fun e!33894 () tuple2!4714)

(assert (=> d!16232 (= lt!79806 (_1!2462 e!33894))))

(declare-fun c!3670 () Bool)

(assert (=> d!16232 (= c!3670 (= lt!78680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16232 (bvsge lt!78680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16232 (= (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_1!2446 lt!78699) lt!78680) lt!79806)))

(declare-fun b!51347 () Bool)

(declare-fun isEmpty!148 (List!564) Bool)

(assert (=> b!51347 (= e!33895 (isEmpty!148 lt!79806))))

(declare-fun b!51345 () Bool)

(assert (=> b!51345 (= e!33894 (tuple2!4715 Nil!561 (_1!2446 lt!78699)))))

(declare-fun lt!79807 () (_ BitVec 64))

(declare-fun b!51346 () Bool)

(declare-fun lt!79808 () tuple2!4710)

(assert (=> b!51346 (= e!33894 (tuple2!4715 (Cons!560 (_1!2460 lt!79808) (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_2!2460 lt!79808) (bvsub lt!78680 lt!79807))) (_2!2460 lt!79808)))))

(assert (=> b!51346 (= lt!79808 (readBit!0 (_1!2446 lt!78699)))))

(assert (=> b!51346 (= lt!79807 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16232 c!3670) b!51345))

(assert (= (and d!16232 (not c!3670)) b!51346))

(assert (= (and d!16232 c!3671) b!51347))

(assert (= (and d!16232 (not c!3671)) b!51348))

(declare-fun m!80967 () Bool)

(assert (=> b!51348 m!80967))

(declare-fun m!80969 () Bool)

(assert (=> b!51347 m!80969))

(declare-fun m!80971 () Bool)

(assert (=> b!51346 m!80971))

(declare-fun m!80973 () Bool)

(assert (=> b!51346 m!80973))

(assert (=> b!50820 d!16232))

(declare-fun d!16234 () Bool)

(assert (=> d!16234 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686))) lt!78680) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78686))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78686)))) lt!78680))))

(declare-fun bs!4070 () Bool)

(assert (= bs!4070 d!16234))

(declare-fun m!80975 () Bool)

(assert (=> bs!4070 m!80975))

(assert (=> b!50820 d!16234))

(declare-fun b!51352 () Bool)

(declare-fun e!33897 () Bool)

(declare-fun lt!79809 () List!564)

(assert (=> b!51352 (= e!33897 (> (length!259 lt!79809) 0))))

(declare-fun d!16236 () Bool)

(assert (=> d!16236 e!33897))

(declare-fun c!3673 () Bool)

(assert (=> d!16236 (= c!3673 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33896 () tuple2!4714)

(assert (=> d!16236 (= lt!79809 (_1!2462 e!33896))))

(declare-fun c!3672 () Bool)

(assert (=> d!16236 (= c!3672 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16236 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16236 (= (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_1!2446 lt!78691) (bvsub to!314 i!635)) lt!79809)))

(declare-fun b!51351 () Bool)

(assert (=> b!51351 (= e!33897 (isEmpty!148 lt!79809))))

(declare-fun b!51349 () Bool)

(assert (=> b!51349 (= e!33896 (tuple2!4715 Nil!561 (_1!2446 lt!78691)))))

(declare-fun b!51350 () Bool)

(declare-fun lt!79810 () (_ BitVec 64))

(declare-fun lt!79811 () tuple2!4710)

(assert (=> b!51350 (= e!33896 (tuple2!4715 (Cons!560 (_1!2460 lt!79811) (bitStreamReadBitsIntoList!0 (_2!2445 lt!78682) (_2!2460 lt!79811) (bvsub (bvsub to!314 i!635) lt!79810))) (_2!2460 lt!79811)))))

(assert (=> b!51350 (= lt!79811 (readBit!0 (_1!2446 lt!78691)))))

(assert (=> b!51350 (= lt!79810 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16236 c!3672) b!51349))

(assert (= (and d!16236 (not c!3672)) b!51350))

(assert (= (and d!16236 c!3673) b!51351))

(assert (= (and d!16236 (not c!3673)) b!51352))

(declare-fun m!80977 () Bool)

(assert (=> b!51352 m!80977))

(declare-fun m!80979 () Bool)

(assert (=> b!51351 m!80979))

(declare-fun m!80981 () Bool)

(assert (=> b!51350 m!80981))

(assert (=> b!51350 m!80949))

(assert (=> b!50820 d!16236))

(declare-fun d!16238 () Bool)

(declare-fun e!33899 () Bool)

(assert (=> d!16238 e!33899))

(declare-fun res!42976 () Bool)

(assert (=> d!16238 (=> (not res!42976) (not e!33899))))

(declare-fun lt!79827 () tuple2!4682)

(assert (=> d!16238 (= res!42976 (isPrefixOf!0 (_1!2446 lt!79827) (_2!2446 lt!79827)))))

(declare-fun lt!79815 () BitStream!1846)

(assert (=> d!16238 (= lt!79827 (tuple2!4683 lt!79815 (_2!2445 lt!78682)))))

(declare-fun lt!79823 () Unit!3507)

(declare-fun lt!79812 () Unit!3507)

(assert (=> d!16238 (= lt!79823 lt!79812)))

(assert (=> d!16238 (isPrefixOf!0 lt!79815 (_2!2445 lt!78682))))

(assert (=> d!16238 (= lt!79812 (lemmaIsPrefixTransitive!0 lt!79815 (_2!2445 lt!78682) (_2!2445 lt!78682)))))

(declare-fun lt!79830 () Unit!3507)

(declare-fun lt!79819 () Unit!3507)

(assert (=> d!16238 (= lt!79830 lt!79819)))

(assert (=> d!16238 (isPrefixOf!0 lt!79815 (_2!2445 lt!78682))))

(assert (=> d!16238 (= lt!79819 (lemmaIsPrefixTransitive!0 lt!79815 thiss!1379 (_2!2445 lt!78682)))))

(declare-fun lt!79820 () Unit!3507)

(declare-fun e!33898 () Unit!3507)

(assert (=> d!16238 (= lt!79820 e!33898)))

(declare-fun c!3674 () Bool)

(assert (=> d!16238 (= c!3674 (not (= (size!1066 (buf!1421 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!79828 () Unit!3507)

(declare-fun lt!79829 () Unit!3507)

(assert (=> d!16238 (= lt!79828 lt!79829)))

(assert (=> d!16238 (isPrefixOf!0 (_2!2445 lt!78682) (_2!2445 lt!78682))))

(assert (=> d!16238 (= lt!79829 (lemmaIsPrefixRefl!0 (_2!2445 lt!78682)))))

(declare-fun lt!79817 () Unit!3507)

(declare-fun lt!79822 () Unit!3507)

(assert (=> d!16238 (= lt!79817 lt!79822)))

(assert (=> d!16238 (= lt!79822 (lemmaIsPrefixRefl!0 (_2!2445 lt!78682)))))

(declare-fun lt!79821 () Unit!3507)

(declare-fun lt!79831 () Unit!3507)

(assert (=> d!16238 (= lt!79821 lt!79831)))

(assert (=> d!16238 (isPrefixOf!0 lt!79815 lt!79815)))

(assert (=> d!16238 (= lt!79831 (lemmaIsPrefixRefl!0 lt!79815))))

(declare-fun lt!79814 () Unit!3507)

(declare-fun lt!79816 () Unit!3507)

(assert (=> d!16238 (= lt!79814 lt!79816)))

(assert (=> d!16238 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16238 (= lt!79816 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16238 (= lt!79815 (BitStream!1847 (buf!1421 (_2!2445 lt!78682)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(assert (=> d!16238 (isPrefixOf!0 thiss!1379 (_2!2445 lt!78682))))

(assert (=> d!16238 (= (reader!0 thiss!1379 (_2!2445 lt!78682)) lt!79827)))

(declare-fun b!51353 () Bool)

(declare-fun lt!79813 () Unit!3507)

(assert (=> b!51353 (= e!33898 lt!79813)))

(declare-fun lt!79826 () (_ BitVec 64))

(assert (=> b!51353 (= lt!79826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79824 () (_ BitVec 64))

(assert (=> b!51353 (= lt!79824 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(assert (=> b!51353 (= lt!79813 (arrayBitRangesEqSymmetric!0 (buf!1421 thiss!1379) (buf!1421 (_2!2445 lt!78682)) lt!79826 lt!79824))))

(assert (=> b!51353 (arrayBitRangesEq!0 (buf!1421 (_2!2445 lt!78682)) (buf!1421 thiss!1379) lt!79826 lt!79824)))

(declare-fun b!51354 () Bool)

(declare-fun res!42974 () Bool)

(assert (=> b!51354 (=> (not res!42974) (not e!33899))))

(assert (=> b!51354 (= res!42974 (isPrefixOf!0 (_1!2446 lt!79827) thiss!1379))))

(declare-fun lt!79825 () (_ BitVec 64))

(declare-fun lt!79818 () (_ BitVec 64))

(declare-fun b!51355 () Bool)

(assert (=> b!51355 (= e!33899 (= (_1!2446 lt!79827) (withMovedBitIndex!0 (_2!2446 lt!79827) (bvsub lt!79818 lt!79825))))))

(assert (=> b!51355 (or (= (bvand lt!79818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79825 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79818 lt!79825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51355 (= lt!79825 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78682))) (currentByte!2944 (_2!2445 lt!78682)) (currentBit!2939 (_2!2445 lt!78682))))))

(assert (=> b!51355 (= lt!79818 (bitIndex!0 (size!1066 (buf!1421 thiss!1379)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379)))))

(declare-fun b!51356 () Bool)

(declare-fun Unit!3540 () Unit!3507)

(assert (=> b!51356 (= e!33898 Unit!3540)))

(declare-fun b!51357 () Bool)

(declare-fun res!42975 () Bool)

(assert (=> b!51357 (=> (not res!42975) (not e!33899))))

(assert (=> b!51357 (= res!42975 (isPrefixOf!0 (_2!2446 lt!79827) (_2!2445 lt!78682)))))

(assert (= (and d!16238 c!3674) b!51353))

(assert (= (and d!16238 (not c!3674)) b!51356))

(assert (= (and d!16238 res!42976) b!51354))

(assert (= (and b!51354 res!42974) b!51357))

(assert (= (and b!51357 res!42975) b!51355))

(assert (=> b!51353 m!79961))

(declare-fun m!80983 () Bool)

(assert (=> b!51353 m!80983))

(declare-fun m!80985 () Bool)

(assert (=> b!51353 m!80985))

(declare-fun m!80987 () Bool)

(assert (=> b!51355 m!80987))

(assert (=> b!51355 m!80011))

(assert (=> b!51355 m!79961))

(declare-fun m!80989 () Bool)

(assert (=> b!51354 m!80989))

(declare-fun m!80991 () Bool)

(assert (=> b!51357 m!80991))

(assert (=> d!16238 m!79959))

(assert (=> d!16238 m!79965))

(declare-fun m!80993 () Bool)

(assert (=> d!16238 m!80993))

(declare-fun m!80995 () Bool)

(assert (=> d!16238 m!80995))

(declare-fun m!80997 () Bool)

(assert (=> d!16238 m!80997))

(declare-fun m!80999 () Bool)

(assert (=> d!16238 m!80999))

(declare-fun m!81001 () Bool)

(assert (=> d!16238 m!81001))

(assert (=> d!16238 m!79957))

(declare-fun m!81003 () Bool)

(assert (=> d!16238 m!81003))

(declare-fun m!81005 () Bool)

(assert (=> d!16238 m!81005))

(declare-fun m!81007 () Bool)

(assert (=> d!16238 m!81007))

(assert (=> b!50820 d!16238))

(declare-fun d!16240 () Bool)

(assert (=> d!16240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4071 () Bool)

(assert (= bs!4071 d!16240))

(declare-fun m!81009 () Bool)

(assert (=> bs!4071 m!81009))

(assert (=> b!50820 d!16240))

(declare-fun d!16242 () Bool)

(declare-fun e!33901 () Bool)

(assert (=> d!16242 e!33901))

(declare-fun res!42979 () Bool)

(assert (=> d!16242 (=> (not res!42979) (not e!33901))))

(declare-fun lt!79847 () tuple2!4682)

(assert (=> d!16242 (= res!42979 (isPrefixOf!0 (_1!2446 lt!79847) (_2!2446 lt!79847)))))

(declare-fun lt!79835 () BitStream!1846)

(assert (=> d!16242 (= lt!79847 (tuple2!4683 lt!79835 (_2!2445 lt!78682)))))

(declare-fun lt!79843 () Unit!3507)

(declare-fun lt!79832 () Unit!3507)

(assert (=> d!16242 (= lt!79843 lt!79832)))

(assert (=> d!16242 (isPrefixOf!0 lt!79835 (_2!2445 lt!78682))))

(assert (=> d!16242 (= lt!79832 (lemmaIsPrefixTransitive!0 lt!79835 (_2!2445 lt!78682) (_2!2445 lt!78682)))))

(declare-fun lt!79850 () Unit!3507)

(declare-fun lt!79839 () Unit!3507)

(assert (=> d!16242 (= lt!79850 lt!79839)))

(assert (=> d!16242 (isPrefixOf!0 lt!79835 (_2!2445 lt!78682))))

(assert (=> d!16242 (= lt!79839 (lemmaIsPrefixTransitive!0 lt!79835 (_2!2445 lt!78686) (_2!2445 lt!78682)))))

(declare-fun lt!79840 () Unit!3507)

(declare-fun e!33900 () Unit!3507)

(assert (=> d!16242 (= lt!79840 e!33900)))

(declare-fun c!3675 () Bool)

(assert (=> d!16242 (= c!3675 (not (= (size!1066 (buf!1421 (_2!2445 lt!78686))) #b00000000000000000000000000000000)))))

(declare-fun lt!79848 () Unit!3507)

(declare-fun lt!79849 () Unit!3507)

(assert (=> d!16242 (= lt!79848 lt!79849)))

(assert (=> d!16242 (isPrefixOf!0 (_2!2445 lt!78682) (_2!2445 lt!78682))))

(assert (=> d!16242 (= lt!79849 (lemmaIsPrefixRefl!0 (_2!2445 lt!78682)))))

(declare-fun lt!79837 () Unit!3507)

(declare-fun lt!79842 () Unit!3507)

(assert (=> d!16242 (= lt!79837 lt!79842)))

(assert (=> d!16242 (= lt!79842 (lemmaIsPrefixRefl!0 (_2!2445 lt!78682)))))

(declare-fun lt!79841 () Unit!3507)

(declare-fun lt!79851 () Unit!3507)

(assert (=> d!16242 (= lt!79841 lt!79851)))

(assert (=> d!16242 (isPrefixOf!0 lt!79835 lt!79835)))

(assert (=> d!16242 (= lt!79851 (lemmaIsPrefixRefl!0 lt!79835))))

(declare-fun lt!79834 () Unit!3507)

(declare-fun lt!79836 () Unit!3507)

(assert (=> d!16242 (= lt!79834 lt!79836)))

(assert (=> d!16242 (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!78686))))

(assert (=> d!16242 (= lt!79836 (lemmaIsPrefixRefl!0 (_2!2445 lt!78686)))))

(assert (=> d!16242 (= lt!79835 (BitStream!1847 (buf!1421 (_2!2445 lt!78682)) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(assert (=> d!16242 (isPrefixOf!0 (_2!2445 lt!78686) (_2!2445 lt!78682))))

(assert (=> d!16242 (= (reader!0 (_2!2445 lt!78686) (_2!2445 lt!78682)) lt!79847)))

(declare-fun b!51358 () Bool)

(declare-fun lt!79833 () Unit!3507)

(assert (=> b!51358 (= e!33900 lt!79833)))

(declare-fun lt!79846 () (_ BitVec 64))

(assert (=> b!51358 (= lt!79846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79844 () (_ BitVec 64))

(assert (=> b!51358 (= lt!79844 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(assert (=> b!51358 (= lt!79833 (arrayBitRangesEqSymmetric!0 (buf!1421 (_2!2445 lt!78686)) (buf!1421 (_2!2445 lt!78682)) lt!79846 lt!79844))))

(assert (=> b!51358 (arrayBitRangesEq!0 (buf!1421 (_2!2445 lt!78682)) (buf!1421 (_2!2445 lt!78686)) lt!79846 lt!79844)))

(declare-fun b!51359 () Bool)

(declare-fun res!42977 () Bool)

(assert (=> b!51359 (=> (not res!42977) (not e!33901))))

(assert (=> b!51359 (= res!42977 (isPrefixOf!0 (_1!2446 lt!79847) (_2!2445 lt!78686)))))

(declare-fun lt!79845 () (_ BitVec 64))

(declare-fun b!51360 () Bool)

(declare-fun lt!79838 () (_ BitVec 64))

(assert (=> b!51360 (= e!33901 (= (_1!2446 lt!79847) (withMovedBitIndex!0 (_2!2446 lt!79847) (bvsub lt!79838 lt!79845))))))

(assert (=> b!51360 (or (= (bvand lt!79838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79845 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79838 lt!79845) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51360 (= lt!79845 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78682))) (currentByte!2944 (_2!2445 lt!78682)) (currentBit!2939 (_2!2445 lt!78682))))))

(assert (=> b!51360 (= lt!79838 (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78686))) (currentByte!2944 (_2!2445 lt!78686)) (currentBit!2939 (_2!2445 lt!78686))))))

(declare-fun b!51361 () Bool)

(declare-fun Unit!3542 () Unit!3507)

(assert (=> b!51361 (= e!33900 Unit!3542)))

(declare-fun b!51362 () Bool)

(declare-fun res!42978 () Bool)

(assert (=> b!51362 (=> (not res!42978) (not e!33901))))

(assert (=> b!51362 (= res!42978 (isPrefixOf!0 (_2!2446 lt!79847) (_2!2445 lt!78682)))))

(assert (= (and d!16242 c!3675) b!51358))

(assert (= (and d!16242 (not c!3675)) b!51361))

(assert (= (and d!16242 res!42979) b!51359))

(assert (= (and b!51359 res!42977) b!51362))

(assert (= (and b!51362 res!42978) b!51360))

(assert (=> b!51358 m!79989))

(declare-fun m!81011 () Bool)

(assert (=> b!51358 m!81011))

(declare-fun m!81013 () Bool)

(assert (=> b!51358 m!81013))

(declare-fun m!81015 () Bool)

(assert (=> b!51360 m!81015))

(assert (=> b!51360 m!80011))

(assert (=> b!51360 m!79989))

(declare-fun m!81017 () Bool)

(assert (=> b!51359 m!81017))

(declare-fun m!81019 () Bool)

(assert (=> b!51362 m!81019))

(assert (=> d!16242 m!80745))

(assert (=> d!16242 m!79971))

(declare-fun m!81021 () Bool)

(assert (=> d!16242 m!81021))

(declare-fun m!81023 () Bool)

(assert (=> d!16242 m!81023))

(declare-fun m!81025 () Bool)

(assert (=> d!16242 m!81025))

(assert (=> d!16242 m!80999))

(declare-fun m!81027 () Bool)

(assert (=> d!16242 m!81027))

(assert (=> d!16242 m!80743))

(assert (=> d!16242 m!81003))

(declare-fun m!81029 () Bool)

(assert (=> d!16242 m!81029))

(declare-fun m!81031 () Bool)

(assert (=> d!16242 m!81031))

(assert (=> b!50820 d!16242))

(declare-fun d!16244 () Bool)

(assert (=> d!16244 (validate_offset_bits!1 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 thiss!1379)) ((_ sign_extend 32) (currentBit!2939 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!79852 () Unit!3507)

(assert (=> d!16244 (= lt!79852 (choose!9 thiss!1379 (buf!1421 (_2!2445 lt!78682)) (bvsub to!314 i!635) (BitStream!1847 (buf!1421 (_2!2445 lt!78682)) (currentByte!2944 thiss!1379) (currentBit!2939 thiss!1379))))))

(assert (=> d!16244 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1421 (_2!2445 lt!78682)) (bvsub to!314 i!635)) lt!79852)))

(declare-fun bs!4072 () Bool)

(assert (= bs!4072 d!16244))

(assert (=> bs!4072 m!80043))

(declare-fun m!81033 () Bool)

(assert (=> bs!4072 m!81033))

(assert (=> b!50820 d!16244))

(declare-fun d!16246 () Bool)

(assert (=> d!16246 (= (head!383 (byteArrayBitContentToList!0 (_2!2445 lt!78686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!679 (byteArrayBitContentToList!0 (_2!2445 lt!78686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!50831 d!16246))

(declare-fun d!16248 () Bool)

(declare-fun c!3676 () Bool)

(assert (=> d!16248 (= c!3676 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33902 () List!564)

(assert (=> d!16248 (= (byteArrayBitContentToList!0 (_2!2445 lt!78686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!33902)))

(declare-fun b!51363 () Bool)

(assert (=> b!51363 (= e!33902 Nil!561)))

(declare-fun b!51364 () Bool)

(assert (=> b!51364 (= e!33902 (Cons!560 (not (= (bvand ((_ sign_extend 24) (select (arr!1595 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2445 lt!78686) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16248 c!3676) b!51363))

(assert (= (and d!16248 (not c!3676)) b!51364))

(assert (=> b!51364 m!79979))

(assert (=> b!51364 m!80795))

(declare-fun m!81035 () Bool)

(assert (=> b!51364 m!81035))

(assert (=> b!50831 d!16248))

(declare-fun d!16250 () Bool)

(assert (=> d!16250 (= (head!383 (bitStreamReadBitsIntoList!0 (_2!2445 lt!78686) (_1!2446 lt!78684) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!679 (bitStreamReadBitsIntoList!0 (_2!2445 lt!78686) (_1!2446 lt!78684) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!50831 d!16250))

(declare-fun b!51368 () Bool)

(declare-fun e!33904 () Bool)

(declare-fun lt!79853 () List!564)

(assert (=> b!51368 (= e!33904 (> (length!259 lt!79853) 0))))

(declare-fun d!16252 () Bool)

(assert (=> d!16252 e!33904))

(declare-fun c!3678 () Bool)

(assert (=> d!16252 (= c!3678 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33903 () tuple2!4714)

(assert (=> d!16252 (= lt!79853 (_1!2462 e!33903))))

(declare-fun c!3677 () Bool)

(assert (=> d!16252 (= c!3677 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16252 (= (bitStreamReadBitsIntoList!0 (_2!2445 lt!78686) (_1!2446 lt!78684) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79853)))

(declare-fun b!51367 () Bool)

(assert (=> b!51367 (= e!33904 (isEmpty!148 lt!79853))))

(declare-fun b!51365 () Bool)

(assert (=> b!51365 (= e!33903 (tuple2!4715 Nil!561 (_1!2446 lt!78684)))))

(declare-fun lt!79854 () (_ BitVec 64))

(declare-fun lt!79855 () tuple2!4710)

(declare-fun b!51366 () Bool)

(assert (=> b!51366 (= e!33903 (tuple2!4715 (Cons!560 (_1!2460 lt!79855) (bitStreamReadBitsIntoList!0 (_2!2445 lt!78686) (_2!2460 lt!79855) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!79854))) (_2!2460 lt!79855)))))

(assert (=> b!51366 (= lt!79855 (readBit!0 (_1!2446 lt!78684)))))

(assert (=> b!51366 (= lt!79854 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!16252 c!3677) b!51365))

(assert (= (and d!16252 (not c!3677)) b!51366))

(assert (= (and d!16252 c!3678) b!51367))

(assert (= (and d!16252 (not c!3678)) b!51368))

(declare-fun m!81037 () Bool)

(assert (=> b!51368 m!81037))

(declare-fun m!81039 () Bool)

(assert (=> b!51367 m!81039))

(declare-fun m!81041 () Bool)

(assert (=> b!51366 m!81041))

(declare-fun m!81043 () Bool)

(assert (=> b!51366 m!81043))

(assert (=> b!50831 d!16252))

(declare-fun d!16254 () Bool)

(assert (=> d!16254 (= (array_inv!976 (buf!1421 thiss!1379)) (bvsge (size!1066 (buf!1421 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!50821 d!16254))

(declare-fun d!16256 () Bool)

(assert (=> d!16256 (= (bitAt!0 (buf!1421 (_1!2446 lt!78699)) lt!78677) (not (= (bvand ((_ sign_extend 24) (select (arr!1595 (buf!1421 (_1!2446 lt!78699))) ((_ extract 31 0) (bvsdiv lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4073 () Bool)

(assert (= bs!4073 d!16256))

(declare-fun m!81045 () Bool)

(assert (=> bs!4073 m!81045))

(assert (=> bs!4073 m!80791))

(assert (=> b!50832 d!16256))

(declare-fun d!16258 () Bool)

(assert (=> d!16258 (= (bitAt!0 (buf!1421 (_1!2446 lt!78691)) lt!78677) (not (= (bvand ((_ sign_extend 24) (select (arr!1595 (buf!1421 (_1!2446 lt!78691))) ((_ extract 31 0) (bvsdiv lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78677 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4074 () Bool)

(assert (= bs!4074 d!16258))

(declare-fun m!81047 () Bool)

(assert (=> bs!4074 m!81047))

(assert (=> bs!4074 m!80791))

(assert (=> b!50832 d!16258))

(declare-fun d!16260 () Bool)

(declare-fun e!33905 () Bool)

(assert (=> d!16260 e!33905))

(declare-fun res!42981 () Bool)

(assert (=> d!16260 (=> (not res!42981) (not e!33905))))

(declare-fun lt!79859 () (_ BitVec 64))

(declare-fun lt!79861 () (_ BitVec 64))

(declare-fun lt!79858 () (_ BitVec 64))

(assert (=> d!16260 (= res!42981 (= lt!79859 (bvsub lt!79858 lt!79861)))))

(assert (=> d!16260 (or (= (bvand lt!79858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79861 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79858 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79858 lt!79861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16260 (= lt!79861 (remainingBits!0 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))) ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78682))) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78682)))))))

(declare-fun lt!79856 () (_ BitVec 64))

(declare-fun lt!79857 () (_ BitVec 64))

(assert (=> d!16260 (= lt!79858 (bvmul lt!79856 lt!79857))))

(assert (=> d!16260 (or (= lt!79856 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79857 (bvsdiv (bvmul lt!79856 lt!79857) lt!79856)))))

(assert (=> d!16260 (= lt!79857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16260 (= lt!79856 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))))))

(assert (=> d!16260 (= lt!79859 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2944 (_2!2445 lt!78682))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2939 (_2!2445 lt!78682)))))))

(assert (=> d!16260 (invariant!0 (currentBit!2939 (_2!2445 lt!78682)) (currentByte!2944 (_2!2445 lt!78682)) (size!1066 (buf!1421 (_2!2445 lt!78682))))))

(assert (=> d!16260 (= (bitIndex!0 (size!1066 (buf!1421 (_2!2445 lt!78682))) (currentByte!2944 (_2!2445 lt!78682)) (currentBit!2939 (_2!2445 lt!78682))) lt!79859)))

(declare-fun b!51369 () Bool)

(declare-fun res!42980 () Bool)

(assert (=> b!51369 (=> (not res!42980) (not e!33905))))

(assert (=> b!51369 (= res!42980 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79859))))

(declare-fun b!51370 () Bool)

(declare-fun lt!79860 () (_ BitVec 64))

(assert (=> b!51370 (= e!33905 (bvsle lt!79859 (bvmul lt!79860 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51370 (or (= lt!79860 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79860 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79860)))))

(assert (=> b!51370 (= lt!79860 ((_ sign_extend 32) (size!1066 (buf!1421 (_2!2445 lt!78682)))))))

(assert (= (and d!16260 res!42981) b!51369))

(assert (= (and b!51369 res!42980) b!51370))

(declare-fun m!81049 () Bool)

(assert (=> d!16260 m!81049))

(assert (=> d!16260 m!79987))

(assert (=> b!50833 d!16260))

(push 1)

(assert (not d!16158))

(assert (not b!51196))

(assert (not d!16016))

(assert (not b!51201))

(assert (not d!16240))

(assert (not b!51352))

(assert (not d!16156))

(assert (not b!51321))

(assert (not d!16140))

(assert (not b!51219))

(assert (not d!16244))

(assert (not b!51366))

(assert (not b!51320))

(assert (not b!51362))

(assert (not d!16138))

(assert (not b!51334))

(assert (not bm!655))

(assert (not b!51230))

(assert (not b!51204))

(assert (not b!51218))

(assert (not b!51364))

(assert (not b!51325))

(assert (not b!51203))

(assert (not b!51200))

(assert (not b!51346))

(assert (not d!16212))

(assert (not d!16220))

(assert (not d!16228))

(assert (not d!16238))

(assert (not b!51354))

(assert (not b!51351))

(assert (not d!16208))

(assert (not d!16242))

(assert (not b!51358))

(assert (not d!16234))

(assert (not d!16134))

(assert (not b!51357))

(assert (not b!51360))

(assert (not b!51319))

(assert (not b!51368))

(assert (not d!15994))

(assert (not b!51206))

(assert (not d!16226))

(assert (not b!51332))

(assert (not d!16216))

(assert (not b!51228))

(assert (not b!51316))

(assert (not b!51347))

(assert (not d!16218))

(assert (not b!51197))

(assert (not b!51315))

(assert (not b!51350))

(assert (not b!51250))

(assert (not b!51221))

(assert (not b!51008))

(assert (not b!51355))

(assert (not b!51348))

(assert (not b!51317))

(assert (not d!16146))

(assert (not d!16260))

(assert (not b!51202))

(assert (not b!51359))

(assert (not b!51353))

(assert (not b!51010))

(assert (not b!51367))

(assert (not b!51318))

(assert (not b!51227))

(assert (not d!16160))

(assert (not b!51217))

(assert (not d!16230))

(assert (not b!51322))

(assert (not d!16136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

