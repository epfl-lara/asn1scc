; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7908 () Bool)

(assert start!7908)

(declare-fun b!38645 () Bool)

(declare-fun e!25382 () Bool)

(declare-fun e!25385 () Bool)

(assert (=> b!38645 (= e!25382 e!25385)))

(declare-fun res!32789 () Bool)

(assert (=> b!38645 (=> res!32789 e!25385)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!38645 (= res!32789 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!458 0))(
  ( (Nil!455) (Cons!454 (h!573 Bool) (t!1208 List!458)) )
))
(declare-fun lt!58925 () List!458)

(declare-datatypes ((array!1959 0))(
  ( (array!1960 (arr!1378 (Array (_ BitVec 32) (_ BitVec 8))) (size!882 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1514 0))(
  ( (BitStream!1515 (buf!1210 array!1959) (currentByte!2622 (_ BitVec 32)) (currentBit!2617 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3736 0))(
  ( (tuple2!3737 (_1!1955 BitStream!1514) (_2!1955 BitStream!1514)) )
))
(declare-fun lt!58924 () tuple2!3736)

(declare-datatypes ((Unit!2785 0))(
  ( (Unit!2786) )
))
(declare-datatypes ((tuple2!3738 0))(
  ( (tuple2!3739 (_1!1956 Unit!2785) (_2!1956 BitStream!1514)) )
))
(declare-fun lt!58923 () tuple2!3738)

(declare-fun lt!58916 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1514 BitStream!1514 (_ BitVec 64)) List!458)

(assert (=> b!38645 (= lt!58925 (bitStreamReadBitsIntoList!0 (_2!1956 lt!58923) (_1!1955 lt!58924) lt!58916))))

(declare-fun lt!58928 () tuple2!3736)

(declare-fun lt!58934 () List!458)

(assert (=> b!38645 (= lt!58934 (bitStreamReadBitsIntoList!0 (_2!1956 lt!58923) (_1!1955 lt!58928) (bvsub to!314 i!635)))))

(declare-fun lt!58929 () tuple2!3738)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38645 (validate_offset_bits!1 ((_ sign_extend 32) (size!882 (buf!1210 (_2!1956 lt!58923)))) ((_ sign_extend 32) (currentByte!2622 (_2!1956 lt!58929))) ((_ sign_extend 32) (currentBit!2617 (_2!1956 lt!58929))) lt!58916)))

(declare-fun lt!58930 () Unit!2785)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1514 array!1959 (_ BitVec 64)) Unit!2785)

(assert (=> b!38645 (= lt!58930 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1956 lt!58929) (buf!1210 (_2!1956 lt!58923)) lt!58916))))

(declare-fun reader!0 (BitStream!1514 BitStream!1514) tuple2!3736)

(assert (=> b!38645 (= lt!58924 (reader!0 (_2!1956 lt!58929) (_2!1956 lt!58923)))))

(declare-fun thiss!1379 () BitStream!1514)

(assert (=> b!38645 (validate_offset_bits!1 ((_ sign_extend 32) (size!882 (buf!1210 (_2!1956 lt!58923)))) ((_ sign_extend 32) (currentByte!2622 thiss!1379)) ((_ sign_extend 32) (currentBit!2617 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!58919 () Unit!2785)

(assert (=> b!38645 (= lt!58919 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1210 (_2!1956 lt!58923)) (bvsub to!314 i!635)))))

(assert (=> b!38645 (= lt!58928 (reader!0 thiss!1379 (_2!1956 lt!58923)))))

(declare-fun b!38646 () Bool)

(declare-fun res!32806 () Bool)

(assert (=> b!38646 (=> res!32806 e!25385)))

(declare-fun length!184 (List!458) Int)

(assert (=> b!38646 (= res!32806 (<= (length!184 lt!58934) 0))))

(declare-fun srcBuffer!2 () array!1959)

(declare-fun e!25373 () Bool)

(declare-fun b!38647 () Bool)

(declare-fun lt!58915 () tuple2!3736)

(declare-fun head!295 (List!458) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1514 array!1959 (_ BitVec 64) (_ BitVec 64)) List!458)

(assert (=> b!38647 (= e!25373 (= (head!295 (byteArrayBitContentToList!0 (_2!1956 lt!58929) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!295 (bitStreamReadBitsIntoList!0 (_2!1956 lt!58929) (_1!1955 lt!58915) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38648 () Bool)

(declare-fun e!25374 () Bool)

(declare-fun e!25383 () Bool)

(assert (=> b!38648 (= e!25374 (not e!25383))))

(declare-fun res!32804 () Bool)

(assert (=> b!38648 (=> res!32804 e!25383)))

(assert (=> b!38648 (= res!32804 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1514 BitStream!1514) Bool)

(assert (=> b!38648 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!58931 () Unit!2785)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1514) Unit!2785)

(assert (=> b!38648 (= lt!58931 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!58922 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38648 (= lt!58922 (bitIndex!0 (size!882 (buf!1210 thiss!1379)) (currentByte!2622 thiss!1379) (currentBit!2617 thiss!1379)))))

(declare-fun b!38649 () Bool)

(declare-fun res!32803 () Bool)

(assert (=> b!38649 (=> (not res!32803) (not e!25374))))

(assert (=> b!38649 (= res!32803 (validate_offset_bits!1 ((_ sign_extend 32) (size!882 (buf!1210 thiss!1379))) ((_ sign_extend 32) (currentByte!2622 thiss!1379)) ((_ sign_extend 32) (currentBit!2617 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!32799 () Bool)

(assert (=> start!7908 (=> (not res!32799) (not e!25374))))

(assert (=> start!7908 (= res!32799 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!882 srcBuffer!2))))))))

(assert (=> start!7908 e!25374))

(assert (=> start!7908 true))

(declare-fun array_inv!810 (array!1959) Bool)

(assert (=> start!7908 (array_inv!810 srcBuffer!2)))

(declare-fun e!25379 () Bool)

(declare-fun inv!12 (BitStream!1514) Bool)

(assert (=> start!7908 (and (inv!12 thiss!1379) e!25379)))

(declare-fun b!38650 () Bool)

(declare-fun e!25377 () Bool)

(declare-fun e!25375 () Bool)

(assert (=> b!38650 (= e!25377 e!25375)))

(declare-fun res!32800 () Bool)

(assert (=> b!38650 (=> res!32800 e!25375)))

(assert (=> b!38650 (= res!32800 (not (isPrefixOf!0 (_2!1956 lt!58929) (_2!1956 lt!58923))))))

(assert (=> b!38650 (isPrefixOf!0 thiss!1379 (_2!1956 lt!58923))))

(declare-fun lt!58936 () Unit!2785)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1514 BitStream!1514 BitStream!1514) Unit!2785)

(assert (=> b!38650 (= lt!58936 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1956 lt!58929) (_2!1956 lt!58923)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1514 array!1959 (_ BitVec 64) (_ BitVec 64)) tuple2!3738)

(assert (=> b!38650 (= lt!58923 (appendBitsMSBFirstLoop!0 (_2!1956 lt!58929) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38650 e!25373))

(declare-fun res!32791 () Bool)

(assert (=> b!38650 (=> (not res!32791) (not e!25373))))

(assert (=> b!38650 (= res!32791 (validate_offset_bits!1 ((_ sign_extend 32) (size!882 (buf!1210 (_2!1956 lt!58929)))) ((_ sign_extend 32) (currentByte!2622 thiss!1379)) ((_ sign_extend 32) (currentBit!2617 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58933 () Unit!2785)

(assert (=> b!38650 (= lt!58933 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1210 (_2!1956 lt!58929)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38650 (= lt!58915 (reader!0 thiss!1379 (_2!1956 lt!58929)))))

(declare-fun b!38651 () Bool)

(declare-fun res!32796 () Bool)

(declare-fun e!25380 () Bool)

(assert (=> b!38651 (=> res!32796 e!25380)))

(declare-fun lt!58927 () Bool)

(assert (=> b!38651 (= res!32796 (not (= (head!295 lt!58934) lt!58927)))))

(declare-fun b!38652 () Bool)

(declare-fun e!25384 () Bool)

(assert (=> b!38652 (= e!25385 e!25384)))

(declare-fun res!32802 () Bool)

(assert (=> b!38652 (=> res!32802 e!25384)))

(declare-fun lt!58926 () List!458)

(assert (=> b!38652 (= res!32802 (not (= lt!58926 lt!58925)))))

(assert (=> b!38652 (= lt!58925 lt!58926)))

(declare-fun tail!175 (List!458) List!458)

(assert (=> b!38652 (= lt!58926 (tail!175 lt!58934))))

(declare-fun lt!58935 () Unit!2785)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1514 BitStream!1514 BitStream!1514 BitStream!1514 (_ BitVec 64) List!458) Unit!2785)

(assert (=> b!38652 (= lt!58935 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1956 lt!58923) (_2!1956 lt!58923) (_1!1955 lt!58928) (_1!1955 lt!58924) (bvsub to!314 i!635) lt!58934))))

(declare-fun b!38653 () Bool)

(declare-fun res!32801 () Bool)

(assert (=> b!38653 (=> res!32801 e!25382)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38653 (= res!32801 (not (invariant!0 (currentBit!2617 (_2!1956 lt!58929)) (currentByte!2622 (_2!1956 lt!58929)) (size!882 (buf!1210 (_2!1956 lt!58923))))))))

(declare-fun b!38654 () Bool)

(declare-fun e!25378 () Bool)

(declare-fun e!25386 () Bool)

(assert (=> b!38654 (= e!25378 e!25386)))

(declare-fun res!32790 () Bool)

(assert (=> b!38654 (=> res!32790 e!25386)))

(declare-fun lt!58912 () Bool)

(declare-fun lt!58917 () Bool)

(assert (=> b!38654 (= res!32790 (not (= lt!58912 lt!58917)))))

(declare-fun bitAt!0 (array!1959 (_ BitVec 64)) Bool)

(assert (=> b!38654 (= lt!58912 (bitAt!0 (buf!1210 (_2!1956 lt!58929)) lt!58922))))

(declare-fun b!38655 () Bool)

(assert (=> b!38655 (= e!25384 e!25380)))

(declare-fun res!32795 () Bool)

(assert (=> b!38655 (=> res!32795 e!25380)))

(assert (=> b!38655 (= res!32795 (not (= lt!58927 (bitAt!0 (buf!1210 (_1!1955 lt!58924)) lt!58922))))))

(assert (=> b!38655 (= lt!58927 (bitAt!0 (buf!1210 (_1!1955 lt!58928)) lt!58922))))

(declare-fun b!38656 () Bool)

(declare-fun res!32805 () Bool)

(assert (=> b!38656 (=> res!32805 e!25382)))

(assert (=> b!38656 (= res!32805 (not (invariant!0 (currentBit!2617 (_2!1956 lt!58929)) (currentByte!2622 (_2!1956 lt!58929)) (size!882 (buf!1210 (_2!1956 lt!58929))))))))

(declare-fun b!38657 () Bool)

(declare-fun res!32807 () Bool)

(declare-fun e!25387 () Bool)

(assert (=> b!38657 (=> res!32807 e!25387)))

(assert (=> b!38657 (= res!32807 (not (invariant!0 (currentBit!2617 (_2!1956 lt!58923)) (currentByte!2622 (_2!1956 lt!58923)) (size!882 (buf!1210 (_2!1956 lt!58923))))))))

(declare-fun b!38658 () Bool)

(declare-fun e!25376 () Bool)

(assert (=> b!38658 (= e!25376 true)))

(declare-datatypes ((tuple2!3740 0))(
  ( (tuple2!3741 (_1!1957 BitStream!1514) (_2!1957 Bool)) )
))
(declare-fun lt!58921 () tuple2!3740)

(declare-fun readBitPure!0 (BitStream!1514) tuple2!3740)

(assert (=> b!38658 (= lt!58921 (readBitPure!0 (_1!1955 lt!58928)))))

(declare-fun b!38659 () Bool)

(assert (=> b!38659 (= e!25383 e!25377)))

(declare-fun res!32794 () Bool)

(assert (=> b!38659 (=> res!32794 e!25377)))

(assert (=> b!38659 (= res!32794 (not (isPrefixOf!0 thiss!1379 (_2!1956 lt!58929))))))

(assert (=> b!38659 (validate_offset_bits!1 ((_ sign_extend 32) (size!882 (buf!1210 (_2!1956 lt!58929)))) ((_ sign_extend 32) (currentByte!2622 (_2!1956 lt!58929))) ((_ sign_extend 32) (currentBit!2617 (_2!1956 lt!58929))) lt!58916)))

(assert (=> b!38659 (= lt!58916 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58918 () Unit!2785)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1514 BitStream!1514 (_ BitVec 64) (_ BitVec 64)) Unit!2785)

(assert (=> b!38659 (= lt!58918 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1956 lt!58929) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1514 (_ BitVec 8) (_ BitVec 32)) tuple2!3738)

(assert (=> b!38659 (= lt!58929 (appendBitFromByte!0 thiss!1379 (select (arr!1378 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38660 () Bool)

(assert (=> b!38660 (= e!25375 e!25387)))

(declare-fun res!32793 () Bool)

(assert (=> b!38660 (=> res!32793 e!25387)))

(declare-fun lt!58932 () (_ BitVec 64))

(assert (=> b!38660 (= res!32793 (not (= lt!58932 (bvsub (bvadd lt!58922 to!314) i!635))))))

(assert (=> b!38660 (= lt!58932 (bitIndex!0 (size!882 (buf!1210 (_2!1956 lt!58923))) (currentByte!2622 (_2!1956 lt!58923)) (currentBit!2617 (_2!1956 lt!58923))))))

(declare-fun b!38661 () Bool)

(assert (=> b!38661 (= e!25387 e!25382)))

(declare-fun res!32797 () Bool)

(assert (=> b!38661 (=> res!32797 e!25382)))

(assert (=> b!38661 (= res!32797 (not (= (size!882 (buf!1210 (_2!1956 lt!58929))) (size!882 (buf!1210 (_2!1956 lt!58923))))))))

(declare-fun lt!58914 () (_ BitVec 64))

(assert (=> b!38661 (= lt!58932 (bvsub (bvsub (bvadd lt!58914 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38661 (= lt!58914 (bitIndex!0 (size!882 (buf!1210 (_2!1956 lt!58929))) (currentByte!2622 (_2!1956 lt!58929)) (currentBit!2617 (_2!1956 lt!58929))))))

(assert (=> b!38661 (= (size!882 (buf!1210 (_2!1956 lt!58923))) (size!882 (buf!1210 thiss!1379)))))

(declare-fun b!38662 () Bool)

(assert (=> b!38662 (= e!25380 e!25378)))

(declare-fun res!32792 () Bool)

(assert (=> b!38662 (=> res!32792 e!25378)))

(assert (=> b!38662 (= res!32792 (not (= (head!295 (byteArrayBitContentToList!0 (_2!1956 lt!58923) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!58917)))))

(assert (=> b!38662 (= lt!58917 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!38663 () Bool)

(assert (=> b!38663 (= e!25379 (array_inv!810 (buf!1210 thiss!1379)))))

(declare-fun b!38664 () Bool)

(declare-fun res!32798 () Bool)

(assert (=> b!38664 (=> res!32798 e!25387)))

(assert (=> b!38664 (= res!32798 (not (= (size!882 (buf!1210 thiss!1379)) (size!882 (buf!1210 (_2!1956 lt!58923))))))))

(declare-fun b!38665 () Bool)

(assert (=> b!38665 (= e!25386 e!25376)))

(declare-fun res!32808 () Bool)

(assert (=> b!38665 (=> res!32808 e!25376)))

(declare-fun lt!58920 () Bool)

(assert (=> b!38665 (= res!32808 (not (= lt!58920 lt!58917)))))

(assert (=> b!38665 (= lt!58912 lt!58920)))

(assert (=> b!38665 (= lt!58920 (bitAt!0 (buf!1210 (_2!1956 lt!58923)) lt!58922))))

(declare-fun lt!58913 () Unit!2785)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1959 array!1959 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2785)

(assert (=> b!38665 (= lt!58913 (arrayBitRangesEqImpliesEq!0 (buf!1210 (_2!1956 lt!58929)) (buf!1210 (_2!1956 lt!58923)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!58922 lt!58914))))

(assert (= (and start!7908 res!32799) b!38649))

(assert (= (and b!38649 res!32803) b!38648))

(assert (= (and b!38648 (not res!32804)) b!38659))

(assert (= (and b!38659 (not res!32794)) b!38650))

(assert (= (and b!38650 res!32791) b!38647))

(assert (= (and b!38650 (not res!32800)) b!38660))

(assert (= (and b!38660 (not res!32793)) b!38657))

(assert (= (and b!38657 (not res!32807)) b!38664))

(assert (= (and b!38664 (not res!32798)) b!38661))

(assert (= (and b!38661 (not res!32797)) b!38656))

(assert (= (and b!38656 (not res!32805)) b!38653))

(assert (= (and b!38653 (not res!32801)) b!38645))

(assert (= (and b!38645 (not res!32789)) b!38646))

(assert (= (and b!38646 (not res!32806)) b!38652))

(assert (= (and b!38652 (not res!32802)) b!38655))

(assert (= (and b!38655 (not res!32795)) b!38651))

(assert (= (and b!38651 (not res!32796)) b!38662))

(assert (= (and b!38662 (not res!32792)) b!38654))

(assert (= (and b!38654 (not res!32790)) b!38665))

(assert (= (and b!38665 (not res!32808)) b!38658))

(assert (= start!7908 b!38663))

(declare-fun m!58891 () Bool)

(assert (=> b!38654 m!58891))

(declare-fun m!58893 () Bool)

(assert (=> b!38658 m!58893))

(declare-fun m!58895 () Bool)

(assert (=> b!38665 m!58895))

(declare-fun m!58897 () Bool)

(assert (=> b!38665 m!58897))

(declare-fun m!58899 () Bool)

(assert (=> b!38662 m!58899))

(assert (=> b!38662 m!58899))

(declare-fun m!58901 () Bool)

(assert (=> b!38662 m!58901))

(declare-fun m!58903 () Bool)

(assert (=> b!38662 m!58903))

(declare-fun m!58905 () Bool)

(assert (=> b!38653 m!58905))

(declare-fun m!58907 () Bool)

(assert (=> b!38663 m!58907))

(declare-fun m!58909 () Bool)

(assert (=> b!38652 m!58909))

(declare-fun m!58911 () Bool)

(assert (=> b!38652 m!58911))

(declare-fun m!58913 () Bool)

(assert (=> start!7908 m!58913))

(declare-fun m!58915 () Bool)

(assert (=> start!7908 m!58915))

(declare-fun m!58917 () Bool)

(assert (=> b!38656 m!58917))

(declare-fun m!58919 () Bool)

(assert (=> b!38648 m!58919))

(declare-fun m!58921 () Bool)

(assert (=> b!38648 m!58921))

(declare-fun m!58923 () Bool)

(assert (=> b!38648 m!58923))

(declare-fun m!58925 () Bool)

(assert (=> b!38657 m!58925))

(declare-fun m!58927 () Bool)

(assert (=> b!38661 m!58927))

(declare-fun m!58929 () Bool)

(assert (=> b!38646 m!58929))

(declare-fun m!58931 () Bool)

(assert (=> b!38659 m!58931))

(declare-fun m!58933 () Bool)

(assert (=> b!38659 m!58933))

(declare-fun m!58935 () Bool)

(assert (=> b!38659 m!58935))

(declare-fun m!58937 () Bool)

(assert (=> b!38659 m!58937))

(assert (=> b!38659 m!58935))

(declare-fun m!58939 () Bool)

(assert (=> b!38659 m!58939))

(declare-fun m!58941 () Bool)

(assert (=> b!38650 m!58941))

(declare-fun m!58943 () Bool)

(assert (=> b!38650 m!58943))

(declare-fun m!58945 () Bool)

(assert (=> b!38650 m!58945))

(declare-fun m!58947 () Bool)

(assert (=> b!38650 m!58947))

(declare-fun m!58949 () Bool)

(assert (=> b!38650 m!58949))

(declare-fun m!58951 () Bool)

(assert (=> b!38650 m!58951))

(declare-fun m!58953 () Bool)

(assert (=> b!38650 m!58953))

(declare-fun m!58955 () Bool)

(assert (=> b!38660 m!58955))

(declare-fun m!58957 () Bool)

(assert (=> b!38645 m!58957))

(declare-fun m!58959 () Bool)

(assert (=> b!38645 m!58959))

(declare-fun m!58961 () Bool)

(assert (=> b!38645 m!58961))

(declare-fun m!58963 () Bool)

(assert (=> b!38645 m!58963))

(declare-fun m!58965 () Bool)

(assert (=> b!38645 m!58965))

(declare-fun m!58967 () Bool)

(assert (=> b!38645 m!58967))

(declare-fun m!58969 () Bool)

(assert (=> b!38645 m!58969))

(declare-fun m!58971 () Bool)

(assert (=> b!38645 m!58971))

(declare-fun m!58973 () Bool)

(assert (=> b!38649 m!58973))

(declare-fun m!58975 () Bool)

(assert (=> b!38647 m!58975))

(assert (=> b!38647 m!58975))

(declare-fun m!58977 () Bool)

(assert (=> b!38647 m!58977))

(declare-fun m!58979 () Bool)

(assert (=> b!38647 m!58979))

(assert (=> b!38647 m!58979))

(declare-fun m!58981 () Bool)

(assert (=> b!38647 m!58981))

(declare-fun m!58983 () Bool)

(assert (=> b!38655 m!58983))

(declare-fun m!58985 () Bool)

(assert (=> b!38655 m!58985))

(declare-fun m!58987 () Bool)

(assert (=> b!38651 m!58987))

(push 1)

(assert (not b!38645))

(assert (not b!38655))

(assert (not b!38649))

(assert (not b!38653))

(assert (not start!7908))

(assert (not b!38665))

(assert (not b!38660))

(assert (not b!38651))

(assert (not b!38654))

(assert (not b!38650))

(assert (not b!38652))

(assert (not b!38662))

(assert (not b!38663))

(assert (not b!38648))

