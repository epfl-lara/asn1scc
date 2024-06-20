; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5654 () Bool)

(assert start!5654)

(declare-fun b!23370 () Bool)

(declare-fun e!15822 () Bool)

(assert (=> b!23370 (= e!15822 true)))

(declare-datatypes ((array!1577 0))(
  ( (array!1578 (arr!1130 (Array (_ BitVec 32) (_ BitVec 8))) (size!674 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1180 0))(
  ( (BitStream!1181 (buf!995 array!1577) (currentByte!2308 (_ BitVec 32)) (currentBit!2303 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1180)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((Unit!1991 0))(
  ( (Unit!1992) )
))
(declare-datatypes ((tuple2!2678 0))(
  ( (tuple2!2679 (_1!1426 Unit!1991) (_2!1426 BitStream!1180)) )
))
(declare-fun lt!33925 () tuple2!2678)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23370 (validate_offset_bits!1 ((_ sign_extend 32) (size!674 (buf!995 (_2!1426 lt!33925)))) ((_ sign_extend 32) (currentByte!2308 thiss!1379)) ((_ sign_extend 32) (currentBit!2303 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!33921 () Unit!1991)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1180 array!1577 (_ BitVec 64)) Unit!1991)

(assert (=> b!23370 (= lt!33921 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!995 (_2!1426 lt!33925)) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!2680 0))(
  ( (tuple2!2681 (_1!1427 BitStream!1180) (_2!1427 BitStream!1180)) )
))
(declare-fun lt!33924 () tuple2!2680)

(declare-fun reader!0 (BitStream!1180 BitStream!1180) tuple2!2680)

(assert (=> b!23370 (= lt!33924 (reader!0 thiss!1379 (_2!1426 lt!33925)))))

(declare-fun b!23371 () Bool)

(declare-fun res!20103 () Bool)

(assert (=> b!23371 (=> res!20103 e!15822)))

(declare-fun lt!33930 () tuple2!2678)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23371 (= res!20103 (not (invariant!0 (currentBit!2303 (_2!1426 lt!33930)) (currentByte!2308 (_2!1426 lt!33930)) (size!674 (buf!995 (_2!1426 lt!33930))))))))

(declare-fun b!23372 () Bool)

(declare-fun res!20097 () Bool)

(declare-fun e!15815 () Bool)

(assert (=> b!23372 (=> res!20097 e!15815)))

(assert (=> b!23372 (= res!20097 (not (invariant!0 (currentBit!2303 (_2!1426 lt!33925)) (currentByte!2308 (_2!1426 lt!33925)) (size!674 (buf!995 (_2!1426 lt!33925))))))))

(declare-fun b!23373 () Bool)

(declare-fun e!15821 () Bool)

(declare-fun e!15813 () Bool)

(assert (=> b!23373 (= e!15821 e!15813)))

(declare-fun res!20105 () Bool)

(assert (=> b!23373 (=> res!20105 e!15813)))

(declare-fun isPrefixOf!0 (BitStream!1180 BitStream!1180) Bool)

(assert (=> b!23373 (= res!20105 (not (isPrefixOf!0 (_2!1426 lt!33930) (_2!1426 lt!33925))))))

(assert (=> b!23373 (isPrefixOf!0 thiss!1379 (_2!1426 lt!33925))))

(declare-fun lt!33922 () Unit!1991)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1180 BitStream!1180 BitStream!1180) Unit!1991)

(assert (=> b!23373 (= lt!33922 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1426 lt!33930) (_2!1426 lt!33925)))))

(declare-fun srcBuffer!2 () array!1577)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1180 array!1577 (_ BitVec 64) (_ BitVec 64)) tuple2!2678)

(assert (=> b!23373 (= lt!33925 (appendBitsMSBFirstLoop!0 (_2!1426 lt!33930) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15818 () Bool)

(assert (=> b!23373 e!15818))

(declare-fun res!20107 () Bool)

(assert (=> b!23373 (=> (not res!20107) (not e!15818))))

(assert (=> b!23373 (= res!20107 (validate_offset_bits!1 ((_ sign_extend 32) (size!674 (buf!995 (_2!1426 lt!33930)))) ((_ sign_extend 32) (currentByte!2308 thiss!1379)) ((_ sign_extend 32) (currentBit!2303 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33923 () Unit!1991)

(assert (=> b!23373 (= lt!33923 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!995 (_2!1426 lt!33930)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33926 () tuple2!2680)

(assert (=> b!23373 (= lt!33926 (reader!0 thiss!1379 (_2!1426 lt!33930)))))

(declare-fun b!23374 () Bool)

(assert (=> b!23374 (= e!15815 e!15822)))

(declare-fun res!20108 () Bool)

(assert (=> b!23374 (=> res!20108 e!15822)))

(assert (=> b!23374 (= res!20108 (not (= (size!674 (buf!995 (_2!1426 lt!33930))) (size!674 (buf!995 (_2!1426 lt!33925))))))))

(declare-fun e!15820 () Bool)

(assert (=> b!23374 e!15820))

(declare-fun res!20099 () Bool)

(assert (=> b!23374 (=> (not res!20099) (not e!15820))))

(assert (=> b!23374 (= res!20099 (= (size!674 (buf!995 (_2!1426 lt!33925))) (size!674 (buf!995 thiss!1379))))))

(declare-fun b!23375 () Bool)

(declare-fun res!20109 () Bool)

(declare-fun e!15819 () Bool)

(assert (=> b!23375 (=> (not res!20109) (not e!15819))))

(assert (=> b!23375 (= res!20109 (validate_offset_bits!1 ((_ sign_extend 32) (size!674 (buf!995 thiss!1379))) ((_ sign_extend 32) (currentByte!2308 thiss!1379)) ((_ sign_extend 32) (currentBit!2303 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23376 () Bool)

(assert (=> b!23376 (= e!15813 e!15815)))

(declare-fun res!20106 () Bool)

(assert (=> b!23376 (=> res!20106 e!15815)))

(declare-fun lt!33927 () (_ BitVec 64))

(declare-fun lt!33928 () (_ BitVec 64))

(assert (=> b!23376 (= res!20106 (not (= lt!33927 (bvsub (bvadd lt!33928 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23376 (= lt!33927 (bitIndex!0 (size!674 (buf!995 (_2!1426 lt!33925))) (currentByte!2308 (_2!1426 lt!33925)) (currentBit!2303 (_2!1426 lt!33925))))))

(declare-fun b!23377 () Bool)

(declare-fun res!20100 () Bool)

(assert (=> b!23377 (=> res!20100 e!15815)))

(assert (=> b!23377 (= res!20100 (not (= (size!674 (buf!995 thiss!1379)) (size!674 (buf!995 (_2!1426 lt!33925))))))))

(declare-fun b!23378 () Bool)

(declare-fun res!20101 () Bool)

(assert (=> b!23378 (=> res!20101 e!15822)))

(assert (=> b!23378 (= res!20101 (not (invariant!0 (currentBit!2303 (_2!1426 lt!33930)) (currentByte!2308 (_2!1426 lt!33930)) (size!674 (buf!995 (_2!1426 lt!33925))))))))

(declare-fun b!23379 () Bool)

(declare-datatypes ((List!291 0))(
  ( (Nil!288) (Cons!287 (h!406 Bool) (t!1041 List!291)) )
))
(declare-fun head!128 (List!291) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1180 array!1577 (_ BitVec 64) (_ BitVec 64)) List!291)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1180 BitStream!1180 (_ BitVec 64)) List!291)

(assert (=> b!23379 (= e!15818 (= (head!128 (byteArrayBitContentToList!0 (_2!1426 lt!33930) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!128 (bitStreamReadBitsIntoList!0 (_2!1426 lt!33930) (_1!1427 lt!33926) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!20098 () Bool)

(assert (=> start!5654 (=> (not res!20098) (not e!15819))))

(assert (=> start!5654 (= res!20098 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!674 srcBuffer!2))))))))

(assert (=> start!5654 e!15819))

(assert (=> start!5654 true))

(declare-fun array_inv!643 (array!1577) Bool)

(assert (=> start!5654 (array_inv!643 srcBuffer!2)))

(declare-fun e!15823 () Bool)

(declare-fun inv!12 (BitStream!1180) Bool)

(assert (=> start!5654 (and (inv!12 thiss!1379) e!15823)))

(declare-fun b!23380 () Bool)

(declare-fun e!15814 () Bool)

(assert (=> b!23380 (= e!15814 e!15821)))

(declare-fun res!20102 () Bool)

(assert (=> b!23380 (=> res!20102 e!15821)))

(assert (=> b!23380 (= res!20102 (not (isPrefixOf!0 thiss!1379 (_2!1426 lt!33930))))))

(assert (=> b!23380 (validate_offset_bits!1 ((_ sign_extend 32) (size!674 (buf!995 (_2!1426 lt!33930)))) ((_ sign_extend 32) (currentByte!2308 (_2!1426 lt!33930))) ((_ sign_extend 32) (currentBit!2303 (_2!1426 lt!33930))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33931 () Unit!1991)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1180 BitStream!1180 (_ BitVec 64) (_ BitVec 64)) Unit!1991)

(assert (=> b!23380 (= lt!33931 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1426 lt!33930) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1180 (_ BitVec 8) (_ BitVec 32)) tuple2!2678)

(assert (=> b!23380 (= lt!33930 (appendBitFromByte!0 thiss!1379 (select (arr!1130 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23381 () Bool)

(assert (=> b!23381 (= e!15820 (= lt!33927 (bvsub (bvsub (bvadd (bitIndex!0 (size!674 (buf!995 (_2!1426 lt!33930))) (currentByte!2308 (_2!1426 lt!33930)) (currentBit!2303 (_2!1426 lt!33930))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23382 () Bool)

(assert (=> b!23382 (= e!15819 (not e!15814))))

(declare-fun res!20104 () Bool)

(assert (=> b!23382 (=> res!20104 e!15814)))

(assert (=> b!23382 (= res!20104 (bvsge i!635 to!314))))

(assert (=> b!23382 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33929 () Unit!1991)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1180) Unit!1991)

(assert (=> b!23382 (= lt!33929 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23382 (= lt!33928 (bitIndex!0 (size!674 (buf!995 thiss!1379)) (currentByte!2308 thiss!1379) (currentBit!2303 thiss!1379)))))

(declare-fun b!23383 () Bool)

(assert (=> b!23383 (= e!15823 (array_inv!643 (buf!995 thiss!1379)))))

(assert (= (and start!5654 res!20098) b!23375))

(assert (= (and b!23375 res!20109) b!23382))

(assert (= (and b!23382 (not res!20104)) b!23380))

(assert (= (and b!23380 (not res!20102)) b!23373))

(assert (= (and b!23373 res!20107) b!23379))

(assert (= (and b!23373 (not res!20105)) b!23376))

(assert (= (and b!23376 (not res!20106)) b!23372))

(assert (= (and b!23372 (not res!20097)) b!23377))

(assert (= (and b!23377 (not res!20100)) b!23374))

(assert (= (and b!23374 res!20099) b!23381))

(assert (= (and b!23374 (not res!20108)) b!23371))

(assert (= (and b!23371 (not res!20103)) b!23378))

(assert (= (and b!23378 (not res!20101)) b!23370))

(assert (= start!5654 b!23383))

(declare-fun m!32835 () Bool)

(assert (=> b!23383 m!32835))

(declare-fun m!32837 () Bool)

(assert (=> b!23372 m!32837))

(declare-fun m!32839 () Bool)

(assert (=> b!23373 m!32839))

(declare-fun m!32841 () Bool)

(assert (=> b!23373 m!32841))

(declare-fun m!32843 () Bool)

(assert (=> b!23373 m!32843))

(declare-fun m!32845 () Bool)

(assert (=> b!23373 m!32845))

(declare-fun m!32847 () Bool)

(assert (=> b!23373 m!32847))

(declare-fun m!32849 () Bool)

(assert (=> b!23373 m!32849))

(declare-fun m!32851 () Bool)

(assert (=> b!23373 m!32851))

(declare-fun m!32853 () Bool)

(assert (=> b!23371 m!32853))

(declare-fun m!32855 () Bool)

(assert (=> b!23381 m!32855))

(declare-fun m!32857 () Bool)

(assert (=> b!23376 m!32857))

(declare-fun m!32859 () Bool)

(assert (=> b!23380 m!32859))

(declare-fun m!32861 () Bool)

(assert (=> b!23380 m!32861))

(declare-fun m!32863 () Bool)

(assert (=> b!23380 m!32863))

(declare-fun m!32865 () Bool)

(assert (=> b!23380 m!32865))

(assert (=> b!23380 m!32861))

(declare-fun m!32867 () Bool)

(assert (=> b!23380 m!32867))

(declare-fun m!32869 () Bool)

(assert (=> b!23378 m!32869))

(declare-fun m!32871 () Bool)

(assert (=> b!23379 m!32871))

(assert (=> b!23379 m!32871))

(declare-fun m!32873 () Bool)

(assert (=> b!23379 m!32873))

(declare-fun m!32875 () Bool)

(assert (=> b!23379 m!32875))

(assert (=> b!23379 m!32875))

(declare-fun m!32877 () Bool)

(assert (=> b!23379 m!32877))

(declare-fun m!32879 () Bool)

(assert (=> b!23370 m!32879))

(declare-fun m!32881 () Bool)

(assert (=> b!23370 m!32881))

(declare-fun m!32883 () Bool)

(assert (=> b!23370 m!32883))

(declare-fun m!32885 () Bool)

(assert (=> start!5654 m!32885))

(declare-fun m!32887 () Bool)

(assert (=> start!5654 m!32887))

(declare-fun m!32889 () Bool)

(assert (=> b!23375 m!32889))

(declare-fun m!32891 () Bool)

(assert (=> b!23382 m!32891))

(declare-fun m!32893 () Bool)

(assert (=> b!23382 m!32893))

(declare-fun m!32895 () Bool)

(assert (=> b!23382 m!32895))

(push 1)

