; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5656 () Bool)

(assert start!5656)

(declare-fun b!23412 () Bool)

(declare-fun e!15855 () Bool)

(declare-fun e!15856 () Bool)

(assert (=> b!23412 (= e!15855 e!15856)))

(declare-fun res!20141 () Bool)

(assert (=> b!23412 (=> res!20141 e!15856)))

(declare-datatypes ((array!1579 0))(
  ( (array!1580 (arr!1131 (Array (_ BitVec 32) (_ BitVec 8))) (size!675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1182 0))(
  ( (BitStream!1183 (buf!996 array!1579) (currentByte!2309 (_ BitVec 32)) (currentBit!2304 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1993 0))(
  ( (Unit!1994) )
))
(declare-datatypes ((tuple2!2682 0))(
  ( (tuple2!2683 (_1!1428 Unit!1993) (_2!1428 BitStream!1182)) )
))
(declare-fun lt!33959 () tuple2!2682)

(declare-fun lt!33958 () tuple2!2682)

(declare-fun isPrefixOf!0 (BitStream!1182 BitStream!1182) Bool)

(assert (=> b!23412 (= res!20141 (not (isPrefixOf!0 (_2!1428 lt!33959) (_2!1428 lt!33958))))))

(declare-fun thiss!1379 () BitStream!1182)

(assert (=> b!23412 (isPrefixOf!0 thiss!1379 (_2!1428 lt!33958))))

(declare-fun lt!33960 () Unit!1993)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1182 BitStream!1182 BitStream!1182) Unit!1993)

(assert (=> b!23412 (= lt!33960 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1428 lt!33959) (_2!1428 lt!33958)))))

(declare-fun srcBuffer!2 () array!1579)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1182 array!1579 (_ BitVec 64) (_ BitVec 64)) tuple2!2682)

(assert (=> b!23412 (= lt!33958 (appendBitsMSBFirstLoop!0 (_2!1428 lt!33959) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15848 () Bool)

(assert (=> b!23412 e!15848))

(declare-fun res!20143 () Bool)

(assert (=> b!23412 (=> (not res!20143) (not e!15848))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23412 (= res!20143 (validate_offset_bits!1 ((_ sign_extend 32) (size!675 (buf!996 (_2!1428 lt!33959)))) ((_ sign_extend 32) (currentByte!2309 thiss!1379)) ((_ sign_extend 32) (currentBit!2304 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33954 () Unit!1993)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1182 array!1579 (_ BitVec 64)) Unit!1993)

(assert (=> b!23412 (= lt!33954 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!996 (_2!1428 lt!33959)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2684 0))(
  ( (tuple2!2685 (_1!1429 BitStream!1182) (_2!1429 BitStream!1182)) )
))
(declare-fun lt!33957 () tuple2!2684)

(declare-fun reader!0 (BitStream!1182 BitStream!1182) tuple2!2684)

(assert (=> b!23412 (= lt!33957 (reader!0 thiss!1379 (_2!1428 lt!33959)))))

(declare-fun b!23413 () Bool)

(declare-fun res!20146 () Bool)

(declare-fun e!15850 () Bool)

(assert (=> b!23413 (=> res!20146 e!15850)))

(assert (=> b!23413 (= res!20146 (not (= (size!675 (buf!996 thiss!1379)) (size!675 (buf!996 (_2!1428 lt!33958))))))))

(declare-fun b!23414 () Bool)

(declare-fun res!20137 () Bool)

(declare-fun e!15852 () Bool)

(assert (=> b!23414 (=> res!20137 e!15852)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23414 (= res!20137 (not (invariant!0 (currentBit!2304 (_2!1428 lt!33959)) (currentByte!2309 (_2!1428 lt!33959)) (size!675 (buf!996 (_2!1428 lt!33958))))))))

(declare-fun b!23415 () Bool)

(assert (=> b!23415 (= e!15852 true)))

(assert (=> b!23415 (validate_offset_bits!1 ((_ sign_extend 32) (size!675 (buf!996 (_2!1428 lt!33958)))) ((_ sign_extend 32) (currentByte!2309 thiss!1379)) ((_ sign_extend 32) (currentBit!2304 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!33963 () Unit!1993)

(assert (=> b!23415 (= lt!33963 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!996 (_2!1428 lt!33958)) (bvsub to!314 i!635)))))

(declare-fun lt!33962 () tuple2!2684)

(assert (=> b!23415 (= lt!33962 (reader!0 thiss!1379 (_2!1428 lt!33958)))))

(declare-fun b!23416 () Bool)

(declare-fun res!20138 () Bool)

(assert (=> b!23416 (=> res!20138 e!15850)))

(assert (=> b!23416 (= res!20138 (not (invariant!0 (currentBit!2304 (_2!1428 lt!33958)) (currentByte!2309 (_2!1428 lt!33958)) (size!675 (buf!996 (_2!1428 lt!33958))))))))

(declare-fun b!23417 () Bool)

(declare-datatypes ((List!292 0))(
  ( (Nil!289) (Cons!288 (h!407 Bool) (t!1042 List!292)) )
))
(declare-fun head!129 (List!292) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1182 array!1579 (_ BitVec 64) (_ BitVec 64)) List!292)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1182 BitStream!1182 (_ BitVec 64)) List!292)

(assert (=> b!23417 (= e!15848 (= (head!129 (byteArrayBitContentToList!0 (_2!1428 lt!33959) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!129 (bitStreamReadBitsIntoList!0 (_2!1428 lt!33959) (_1!1429 lt!33957) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23418 () Bool)

(declare-fun e!15851 () Bool)

(assert (=> b!23418 (= e!15851 e!15855)))

(declare-fun res!20145 () Bool)

(assert (=> b!23418 (=> res!20145 e!15855)))

(assert (=> b!23418 (= res!20145 (not (isPrefixOf!0 thiss!1379 (_2!1428 lt!33959))))))

(assert (=> b!23418 (validate_offset_bits!1 ((_ sign_extend 32) (size!675 (buf!996 (_2!1428 lt!33959)))) ((_ sign_extend 32) (currentByte!2309 (_2!1428 lt!33959))) ((_ sign_extend 32) (currentBit!2304 (_2!1428 lt!33959))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33956 () Unit!1993)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1182 BitStream!1182 (_ BitVec 64) (_ BitVec 64)) Unit!1993)

(assert (=> b!23418 (= lt!33956 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1428 lt!33959) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1182 (_ BitVec 8) (_ BitVec 32)) tuple2!2682)

(assert (=> b!23418 (= lt!33959 (appendBitFromByte!0 thiss!1379 (select (arr!1131 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23419 () Bool)

(declare-fun res!20148 () Bool)

(assert (=> b!23419 (=> res!20148 e!15852)))

(assert (=> b!23419 (= res!20148 (not (invariant!0 (currentBit!2304 (_2!1428 lt!33959)) (currentByte!2309 (_2!1428 lt!33959)) (size!675 (buf!996 (_2!1428 lt!33959))))))))

(declare-fun b!23420 () Bool)

(declare-fun e!15847 () Bool)

(declare-fun lt!33964 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23420 (= e!15847 (= lt!33964 (bvsub (bvsub (bvadd (bitIndex!0 (size!675 (buf!996 (_2!1428 lt!33959))) (currentByte!2309 (_2!1428 lt!33959)) (currentBit!2304 (_2!1428 lt!33959))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!20139 () Bool)

(declare-fun e!15854 () Bool)

(assert (=> start!5656 (=> (not res!20139) (not e!15854))))

(assert (=> start!5656 (= res!20139 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!675 srcBuffer!2))))))))

(assert (=> start!5656 e!15854))

(assert (=> start!5656 true))

(declare-fun array_inv!644 (array!1579) Bool)

(assert (=> start!5656 (array_inv!644 srcBuffer!2)))

(declare-fun e!15849 () Bool)

(declare-fun inv!12 (BitStream!1182) Bool)

(assert (=> start!5656 (and (inv!12 thiss!1379) e!15849)))

(declare-fun b!23421 () Bool)

(assert (=> b!23421 (= e!15849 (array_inv!644 (buf!996 thiss!1379)))))

(declare-fun b!23422 () Bool)

(assert (=> b!23422 (= e!15854 (not e!15851))))

(declare-fun res!20147 () Bool)

(assert (=> b!23422 (=> res!20147 e!15851)))

(assert (=> b!23422 (= res!20147 (bvsge i!635 to!314))))

(assert (=> b!23422 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33961 () Unit!1993)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1182) Unit!1993)

(assert (=> b!23422 (= lt!33961 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!33955 () (_ BitVec 64))

(assert (=> b!23422 (= lt!33955 (bitIndex!0 (size!675 (buf!996 thiss!1379)) (currentByte!2309 thiss!1379) (currentBit!2304 thiss!1379)))))

(declare-fun b!23423 () Bool)

(assert (=> b!23423 (= e!15856 e!15850)))

(declare-fun res!20144 () Bool)

(assert (=> b!23423 (=> res!20144 e!15850)))

(assert (=> b!23423 (= res!20144 (not (= lt!33964 (bvsub (bvadd lt!33955 to!314) i!635))))))

(assert (=> b!23423 (= lt!33964 (bitIndex!0 (size!675 (buf!996 (_2!1428 lt!33958))) (currentByte!2309 (_2!1428 lt!33958)) (currentBit!2304 (_2!1428 lt!33958))))))

(declare-fun b!23424 () Bool)

(declare-fun res!20140 () Bool)

(assert (=> b!23424 (=> (not res!20140) (not e!15854))))

(assert (=> b!23424 (= res!20140 (validate_offset_bits!1 ((_ sign_extend 32) (size!675 (buf!996 thiss!1379))) ((_ sign_extend 32) (currentByte!2309 thiss!1379)) ((_ sign_extend 32) (currentBit!2304 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23425 () Bool)

(assert (=> b!23425 (= e!15850 e!15852)))

(declare-fun res!20136 () Bool)

(assert (=> b!23425 (=> res!20136 e!15852)))

(assert (=> b!23425 (= res!20136 (not (= (size!675 (buf!996 (_2!1428 lt!33959))) (size!675 (buf!996 (_2!1428 lt!33958))))))))

(assert (=> b!23425 e!15847))

(declare-fun res!20142 () Bool)

(assert (=> b!23425 (=> (not res!20142) (not e!15847))))

(assert (=> b!23425 (= res!20142 (= (size!675 (buf!996 (_2!1428 lt!33958))) (size!675 (buf!996 thiss!1379))))))

(assert (= (and start!5656 res!20139) b!23424))

(assert (= (and b!23424 res!20140) b!23422))

(assert (= (and b!23422 (not res!20147)) b!23418))

(assert (= (and b!23418 (not res!20145)) b!23412))

(assert (= (and b!23412 res!20143) b!23417))

(assert (= (and b!23412 (not res!20141)) b!23423))

(assert (= (and b!23423 (not res!20144)) b!23416))

(assert (= (and b!23416 (not res!20138)) b!23413))

(assert (= (and b!23413 (not res!20146)) b!23425))

(assert (= (and b!23425 res!20142) b!23420))

(assert (= (and b!23425 (not res!20136)) b!23419))

(assert (= (and b!23419 (not res!20148)) b!23414))

(assert (= (and b!23414 (not res!20137)) b!23415))

(assert (= start!5656 b!23421))

(declare-fun m!32897 () Bool)

(assert (=> b!23419 m!32897))

(declare-fun m!32899 () Bool)

(assert (=> b!23423 m!32899))

(declare-fun m!32901 () Bool)

(assert (=> b!23420 m!32901))

(declare-fun m!32903 () Bool)

(assert (=> b!23424 m!32903))

(declare-fun m!32905 () Bool)

(assert (=> b!23418 m!32905))

(declare-fun m!32907 () Bool)

(assert (=> b!23418 m!32907))

(declare-fun m!32909 () Bool)

(assert (=> b!23418 m!32909))

(declare-fun m!32911 () Bool)

(assert (=> b!23418 m!32911))

(assert (=> b!23418 m!32909))

(declare-fun m!32913 () Bool)

(assert (=> b!23418 m!32913))

(declare-fun m!32915 () Bool)

(assert (=> b!23412 m!32915))

(declare-fun m!32917 () Bool)

(assert (=> b!23412 m!32917))

(declare-fun m!32919 () Bool)

(assert (=> b!23412 m!32919))

(declare-fun m!32921 () Bool)

(assert (=> b!23412 m!32921))

(declare-fun m!32923 () Bool)

(assert (=> b!23412 m!32923))

(declare-fun m!32925 () Bool)

(assert (=> b!23412 m!32925))

(declare-fun m!32927 () Bool)

(assert (=> b!23412 m!32927))

(declare-fun m!32929 () Bool)

(assert (=> start!5656 m!32929))

(declare-fun m!32931 () Bool)

(assert (=> start!5656 m!32931))

(declare-fun m!32933 () Bool)

(assert (=> b!23414 m!32933))

(declare-fun m!32935 () Bool)

(assert (=> b!23415 m!32935))

(declare-fun m!32937 () Bool)

(assert (=> b!23415 m!32937))

(declare-fun m!32939 () Bool)

(assert (=> b!23415 m!32939))

(declare-fun m!32941 () Bool)

(assert (=> b!23421 m!32941))

(declare-fun m!32943 () Bool)

(assert (=> b!23417 m!32943))

(assert (=> b!23417 m!32943))

(declare-fun m!32945 () Bool)

(assert (=> b!23417 m!32945))

(declare-fun m!32947 () Bool)

(assert (=> b!23417 m!32947))

(assert (=> b!23417 m!32947))

(declare-fun m!32949 () Bool)

(assert (=> b!23417 m!32949))

(declare-fun m!32951 () Bool)

(assert (=> b!23416 m!32951))

(declare-fun m!32953 () Bool)

(assert (=> b!23422 m!32953))

(declare-fun m!32955 () Bool)

(assert (=> b!23422 m!32955))

(declare-fun m!32957 () Bool)

(assert (=> b!23422 m!32957))

(check-sat (not b!23414) (not b!23424) (not b!23416) (not b!23423) (not start!5656) (not b!23421) (not b!23412) (not b!23417) (not b!23415) (not b!23418) (not b!23422) (not b!23420) (not b!23419))
