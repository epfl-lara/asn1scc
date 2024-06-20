; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10160 () Bool)

(assert start!10160)

(declare-datatypes ((array!2353 0))(
  ( (array!2354 (arr!1604 (Array (_ BitVec 32) (_ BitVec 8))) (size!1072 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1852 0))(
  ( (BitStream!1853 (buf!1427 array!2353) (currentByte!2956 (_ BitVec 32)) (currentBit!2951 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3543 0))(
  ( (Unit!3544) )
))
(declare-datatypes ((tuple2!4716 0))(
  ( (tuple2!4717 (_1!2463 Unit!3543) (_2!2463 BitStream!1852)) )
))
(declare-fun lt!79925 () tuple2!4716)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!51415 () Bool)

(declare-fun e!33943 () Bool)

(declare-fun srcBuffer!2 () array!2353)

(declare-datatypes ((tuple2!4718 0))(
  ( (tuple2!4719 (_1!2464 BitStream!1852) (_2!2464 BitStream!1852)) )
))
(declare-fun lt!79926 () tuple2!4718)

(declare-datatypes ((List!567 0))(
  ( (Nil!564) (Cons!563 (h!682 Bool) (t!1317 List!567)) )
))
(declare-fun head!386 (List!567) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1852 array!2353 (_ BitVec 64) (_ BitVec 64)) List!567)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1852 BitStream!1852 (_ BitVec 64)) List!567)

(assert (=> b!51415 (= e!33943 (= (head!386 (byteArrayBitContentToList!0 (_2!2463 lt!79925) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!386 (bitStreamReadBitsIntoList!0 (_2!2463 lt!79925) (_1!2464 lt!79926) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!51416 () Bool)

(declare-fun res!43034 () Bool)

(declare-fun e!33953 () Bool)

(assert (=> b!51416 (=> res!43034 e!33953)))

(declare-fun lt!79932 () tuple2!4718)

(declare-fun lt!79933 () Bool)

(declare-datatypes ((tuple2!4720 0))(
  ( (tuple2!4721 (_1!2465 BitStream!1852) (_2!2465 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1852) tuple2!4720)

(assert (=> b!51416 (= res!43034 (not (= (_2!2465 (readBitPure!0 (_1!2464 lt!79932))) lt!79933)))))

(declare-fun b!51417 () Bool)

(declare-fun e!33947 () Bool)

(declare-fun e!33946 () Bool)

(assert (=> b!51417 (= e!33947 e!33946)))

(declare-fun res!43044 () Bool)

(assert (=> b!51417 (=> res!43044 e!33946)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!51417 (= res!43044 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!79915 () List!567)

(declare-fun lt!79937 () tuple2!4718)

(declare-fun lt!79918 () tuple2!4716)

(declare-fun lt!79938 () (_ BitVec 64))

(assert (=> b!51417 (= lt!79915 (bitStreamReadBitsIntoList!0 (_2!2463 lt!79918) (_1!2464 lt!79937) lt!79938))))

(declare-fun lt!79922 () List!567)

(assert (=> b!51417 (= lt!79922 (bitStreamReadBitsIntoList!0 (_2!2463 lt!79918) (_1!2464 lt!79932) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51417 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79918)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79925))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79925))) lt!79938)))

(declare-fun lt!79939 () Unit!3543)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1852 array!2353 (_ BitVec 64)) Unit!3543)

(assert (=> b!51417 (= lt!79939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2463 lt!79925) (buf!1427 (_2!2463 lt!79918)) lt!79938))))

(declare-fun reader!0 (BitStream!1852 BitStream!1852) tuple2!4718)

(assert (=> b!51417 (= lt!79937 (reader!0 (_2!2463 lt!79925) (_2!2463 lt!79918)))))

(declare-fun thiss!1379 () BitStream!1852)

(assert (=> b!51417 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79918)))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!79934 () Unit!3543)

(assert (=> b!51417 (= lt!79934 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1427 (_2!2463 lt!79918)) (bvsub to!314 i!635)))))

(assert (=> b!51417 (= lt!79932 (reader!0 thiss!1379 (_2!2463 lt!79918)))))

(declare-fun res!43031 () Bool)

(declare-fun e!33940 () Bool)

(assert (=> start!10160 (=> (not res!43031) (not e!33940))))

(assert (=> start!10160 (= res!43031 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1072 srcBuffer!2))))))))

(assert (=> start!10160 e!33940))

(assert (=> start!10160 true))

(declare-fun array_inv!979 (array!2353) Bool)

(assert (=> start!10160 (array_inv!979 srcBuffer!2)))

(declare-fun e!33955 () Bool)

(declare-fun inv!12 (BitStream!1852) Bool)

(assert (=> start!10160 (and (inv!12 thiss!1379) e!33955)))

(declare-fun b!51418 () Bool)

(assert (=> b!51418 (= e!33955 (array_inv!979 (buf!1427 thiss!1379)))))

(declare-fun b!51419 () Bool)

(declare-fun e!33944 () Bool)

(declare-fun e!33948 () Bool)

(assert (=> b!51419 (= e!33944 e!33948)))

(declare-fun res!43030 () Bool)

(assert (=> b!51419 (=> res!43030 e!33948)))

(declare-fun lt!79921 () Bool)

(declare-fun lt!79931 () Bool)

(assert (=> b!51419 (= res!43030 (not (= lt!79921 lt!79931)))))

(assert (=> b!51419 (= lt!79921 (head!386 lt!79922))))

(declare-fun b!51420 () Bool)

(declare-fun e!33949 () Bool)

(assert (=> b!51420 (= e!33949 e!33953)))

(declare-fun res!43025 () Bool)

(assert (=> b!51420 (=> res!43025 e!33953)))

(declare-fun lt!79930 () Bool)

(assert (=> b!51420 (= res!43025 (not (= lt!79930 lt!79933)))))

(declare-fun lt!79936 () Bool)

(assert (=> b!51420 (= lt!79936 lt!79930)))

(declare-fun lt!79920 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2353 (_ BitVec 64)) Bool)

(assert (=> b!51420 (= lt!79930 (bitAt!0 (buf!1427 (_2!2463 lt!79918)) lt!79920))))

(declare-fun lt!79917 () (_ BitVec 64))

(declare-fun lt!79923 () Unit!3543)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2353 array!2353 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3543)

(assert (=> b!51420 (= lt!79923 (arrayBitRangesEqImpliesEq!0 (buf!1427 (_2!2463 lt!79925)) (buf!1427 (_2!2463 lt!79918)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79920 lt!79917))))

(declare-fun b!51421 () Bool)

(declare-fun e!33942 () Bool)

(declare-fun e!33951 () Bool)

(assert (=> b!51421 (= e!33942 e!33951)))

(declare-fun res!43029 () Bool)

(assert (=> b!51421 (=> res!43029 e!33951)))

(declare-fun lt!79914 () (_ BitVec 64))

(assert (=> b!51421 (= res!43029 (not (= lt!79914 (bvsub (bvadd lt!79920 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!51421 (= lt!79914 (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79918))) (currentByte!2956 (_2!2463 lt!79918)) (currentBit!2951 (_2!2463 lt!79918))))))

(declare-fun b!51422 () Bool)

(declare-fun res!43038 () Bool)

(assert (=> b!51422 (=> (not res!43038) (not e!33940))))

(assert (=> b!51422 (= res!43038 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 thiss!1379))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!51423 () Bool)

(declare-fun e!33945 () Bool)

(assert (=> b!51423 (= e!33948 e!33945)))

(declare-fun res!43040 () Bool)

(assert (=> b!51423 (=> res!43040 e!33945)))

(declare-fun lt!79927 () Bool)

(assert (=> b!51423 (= res!43040 (not (= lt!79927 lt!79933)))))

(assert (=> b!51423 (= lt!79933 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!51423 (= lt!79927 (head!386 (byteArrayBitContentToList!0 (_2!2463 lt!79918) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!51424 () Bool)

(declare-fun e!33954 () Bool)

(assert (=> b!51424 (= e!33946 e!33954)))

(declare-fun res!43037 () Bool)

(assert (=> b!51424 (=> res!43037 e!33954)))

(declare-fun lt!79929 () List!567)

(assert (=> b!51424 (= res!43037 (not (= lt!79929 lt!79915)))))

(assert (=> b!51424 (= lt!79915 lt!79929)))

(declare-fun tail!253 (List!567) List!567)

(assert (=> b!51424 (= lt!79929 (tail!253 lt!79922))))

(declare-fun lt!79919 () Unit!3543)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1852 BitStream!1852 BitStream!1852 BitStream!1852 (_ BitVec 64) List!567) Unit!3543)

(assert (=> b!51424 (= lt!79919 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2463 lt!79918) (_2!2463 lt!79918) (_1!2464 lt!79932) (_1!2464 lt!79937) (bvsub to!314 i!635) lt!79922))))

(declare-fun b!51425 () Bool)

(assert (=> b!51425 (= e!33951 e!33947)))

(declare-fun res!43028 () Bool)

(assert (=> b!51425 (=> res!43028 e!33947)))

(assert (=> b!51425 (= res!43028 (not (= (size!1072 (buf!1427 (_2!2463 lt!79925))) (size!1072 (buf!1427 (_2!2463 lt!79918))))))))

(assert (=> b!51425 (= lt!79914 (bvsub (bvsub (bvadd lt!79917 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51425 (= lt!79917 (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79925))) (currentByte!2956 (_2!2463 lt!79925)) (currentBit!2951 (_2!2463 lt!79925))))))

(assert (=> b!51425 (= (size!1072 (buf!1427 (_2!2463 lt!79918))) (size!1072 (buf!1427 thiss!1379)))))

(declare-fun b!51426 () Bool)

(declare-fun res!43041 () Bool)

(assert (=> b!51426 (=> res!43041 e!33947)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!51426 (= res!43041 (not (invariant!0 (currentBit!2951 (_2!2463 lt!79925)) (currentByte!2956 (_2!2463 lt!79925)) (size!1072 (buf!1427 (_2!2463 lt!79925))))))))

(declare-fun b!51427 () Bool)

(declare-fun res!43039 () Bool)

(assert (=> b!51427 (=> res!43039 e!33951)))

(assert (=> b!51427 (= res!43039 (not (invariant!0 (currentBit!2951 (_2!2463 lt!79918)) (currentByte!2956 (_2!2463 lt!79918)) (size!1072 (buf!1427 (_2!2463 lt!79918))))))))

(declare-fun b!51428 () Bool)

(declare-fun res!43033 () Bool)

(assert (=> b!51428 (=> res!43033 e!33946)))

(declare-fun length!262 (List!567) Int)

(assert (=> b!51428 (= res!43033 (<= (length!262 lt!79922) 0))))

(declare-fun b!51429 () Bool)

(assert (=> b!51429 (= e!33954 e!33944)))

(declare-fun res!43035 () Bool)

(assert (=> b!51429 (=> res!43035 e!33944)))

(assert (=> b!51429 (= res!43035 (not (= lt!79931 (bitAt!0 (buf!1427 (_1!2464 lt!79937)) lt!79920))))))

(assert (=> b!51429 (= lt!79931 (bitAt!0 (buf!1427 (_1!2464 lt!79932)) lt!79920))))

(declare-fun b!51430 () Bool)

(declare-fun res!43042 () Bool)

(assert (=> b!51430 (=> res!43042 e!33951)))

(assert (=> b!51430 (= res!43042 (not (= (size!1072 (buf!1427 thiss!1379)) (size!1072 (buf!1427 (_2!2463 lt!79918))))))))

(declare-fun b!51431 () Bool)

(assert (=> b!51431 (= e!33945 e!33949)))

(declare-fun res!43027 () Bool)

(assert (=> b!51431 (=> res!43027 e!33949)))

(assert (=> b!51431 (= res!43027 (not (= lt!79936 lt!79933)))))

(assert (=> b!51431 (= lt!79936 (bitAt!0 (buf!1427 (_2!2463 lt!79925)) lt!79920))))

(declare-fun b!51432 () Bool)

(declare-fun e!33950 () Bool)

(assert (=> b!51432 (= e!33940 (not e!33950))))

(declare-fun res!43032 () Bool)

(assert (=> b!51432 (=> res!43032 e!33950)))

(assert (=> b!51432 (= res!43032 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1852 BitStream!1852) Bool)

(assert (=> b!51432 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!79924 () Unit!3543)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1852) Unit!3543)

(assert (=> b!51432 (= lt!79924 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!51432 (= lt!79920 (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379)))))

(declare-fun b!51433 () Bool)

(assert (=> b!51433 (= e!33953 (= lt!79921 lt!79927))))

(declare-fun b!51434 () Bool)

(declare-fun e!33941 () Bool)

(assert (=> b!51434 (= e!33941 e!33942)))

(declare-fun res!43026 () Bool)

(assert (=> b!51434 (=> res!43026 e!33942)))

(assert (=> b!51434 (= res!43026 (not (isPrefixOf!0 (_2!2463 lt!79925) (_2!2463 lt!79918))))))

(assert (=> b!51434 (isPrefixOf!0 thiss!1379 (_2!2463 lt!79918))))

(declare-fun lt!79935 () Unit!3543)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1852 BitStream!1852 BitStream!1852) Unit!3543)

(assert (=> b!51434 (= lt!79935 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2463 lt!79925) (_2!2463 lt!79918)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1852 array!2353 (_ BitVec 64) (_ BitVec 64)) tuple2!4716)

(assert (=> b!51434 (= lt!79918 (appendBitsMSBFirstLoop!0 (_2!2463 lt!79925) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!51434 e!33943))

(declare-fun res!43043 () Bool)

(assert (=> b!51434 (=> (not res!43043) (not e!33943))))

(assert (=> b!51434 (= res!43043 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79925)))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79916 () Unit!3543)

(assert (=> b!51434 (= lt!79916 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1427 (_2!2463 lt!79925)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51434 (= lt!79926 (reader!0 thiss!1379 (_2!2463 lt!79925)))))

(declare-fun b!51435 () Bool)

(declare-fun res!43024 () Bool)

(assert (=> b!51435 (=> res!43024 e!33947)))

(assert (=> b!51435 (= res!43024 (not (invariant!0 (currentBit!2951 (_2!2463 lt!79925)) (currentByte!2956 (_2!2463 lt!79925)) (size!1072 (buf!1427 (_2!2463 lt!79918))))))))

(declare-fun b!51436 () Bool)

(assert (=> b!51436 (= e!33950 e!33941)))

(declare-fun res!43036 () Bool)

(assert (=> b!51436 (=> res!43036 e!33941)))

(assert (=> b!51436 (= res!43036 (not (isPrefixOf!0 thiss!1379 (_2!2463 lt!79925))))))

(assert (=> b!51436 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79925)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79925))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79925))) lt!79938)))

(assert (=> b!51436 (= lt!79938 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79928 () Unit!3543)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1852 BitStream!1852 (_ BitVec 64) (_ BitVec 64)) Unit!3543)

(assert (=> b!51436 (= lt!79928 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2463 lt!79925) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1852 (_ BitVec 8) (_ BitVec 32)) tuple2!4716)

(assert (=> b!51436 (= lt!79925 (appendBitFromByte!0 thiss!1379 (select (arr!1604 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!10160 res!43031) b!51422))

(assert (= (and b!51422 res!43038) b!51432))

(assert (= (and b!51432 (not res!43032)) b!51436))

(assert (= (and b!51436 (not res!43036)) b!51434))

(assert (= (and b!51434 res!43043) b!51415))

(assert (= (and b!51434 (not res!43026)) b!51421))

(assert (= (and b!51421 (not res!43029)) b!51427))

(assert (= (and b!51427 (not res!43039)) b!51430))

(assert (= (and b!51430 (not res!43042)) b!51425))

(assert (= (and b!51425 (not res!43028)) b!51426))

(assert (= (and b!51426 (not res!43041)) b!51435))

(assert (= (and b!51435 (not res!43024)) b!51417))

(assert (= (and b!51417 (not res!43044)) b!51428))

(assert (= (and b!51428 (not res!43033)) b!51424))

(assert (= (and b!51424 (not res!43037)) b!51429))

(assert (= (and b!51429 (not res!43035)) b!51419))

(assert (= (and b!51419 (not res!43030)) b!51423))

(assert (= (and b!51423 (not res!43040)) b!51431))

(assert (= (and b!51431 (not res!43027)) b!51420))

(assert (= (and b!51420 (not res!43025)) b!51416))

(assert (= (and b!51416 (not res!43034)) b!51433))

(assert (= start!10160 b!51418))

(declare-fun m!81051 () Bool)

(assert (=> b!51426 m!81051))

(declare-fun m!81053 () Bool)

(assert (=> b!51428 m!81053))

(declare-fun m!81055 () Bool)

(assert (=> b!51436 m!81055))

(declare-fun m!81057 () Bool)

(assert (=> b!51436 m!81057))

(declare-fun m!81059 () Bool)

(assert (=> b!51436 m!81059))

(declare-fun m!81061 () Bool)

(assert (=> b!51436 m!81061))

(assert (=> b!51436 m!81057))

(declare-fun m!81063 () Bool)

(assert (=> b!51436 m!81063))

(declare-fun m!81065 () Bool)

(assert (=> b!51419 m!81065))

(declare-fun m!81067 () Bool)

(assert (=> b!51422 m!81067))

(declare-fun m!81069 () Bool)

(assert (=> b!51425 m!81069))

(declare-fun m!81071 () Bool)

(assert (=> b!51421 m!81071))

(declare-fun m!81073 () Bool)

(assert (=> b!51423 m!81073))

(declare-fun m!81075 () Bool)

(assert (=> b!51423 m!81075))

(assert (=> b!51423 m!81075))

(declare-fun m!81077 () Bool)

(assert (=> b!51423 m!81077))

(declare-fun m!81079 () Bool)

(assert (=> b!51416 m!81079))

(declare-fun m!81081 () Bool)

(assert (=> b!51432 m!81081))

(declare-fun m!81083 () Bool)

(assert (=> b!51432 m!81083))

(declare-fun m!81085 () Bool)

(assert (=> b!51432 m!81085))

(declare-fun m!81087 () Bool)

(assert (=> start!10160 m!81087))

(declare-fun m!81089 () Bool)

(assert (=> start!10160 m!81089))

(declare-fun m!81091 () Bool)

(assert (=> b!51417 m!81091))

(declare-fun m!81093 () Bool)

(assert (=> b!51417 m!81093))

(declare-fun m!81095 () Bool)

(assert (=> b!51417 m!81095))

(declare-fun m!81097 () Bool)

(assert (=> b!51417 m!81097))

(declare-fun m!81099 () Bool)

(assert (=> b!51417 m!81099))

(declare-fun m!81101 () Bool)

(assert (=> b!51417 m!81101))

(declare-fun m!81103 () Bool)

(assert (=> b!51417 m!81103))

(declare-fun m!81105 () Bool)

(assert (=> b!51417 m!81105))

(declare-fun m!81107 () Bool)

(assert (=> b!51434 m!81107))

(declare-fun m!81109 () Bool)

(assert (=> b!51434 m!81109))

(declare-fun m!81111 () Bool)

(assert (=> b!51434 m!81111))

(declare-fun m!81113 () Bool)

(assert (=> b!51434 m!81113))

(declare-fun m!81115 () Bool)

(assert (=> b!51434 m!81115))

(declare-fun m!81117 () Bool)

(assert (=> b!51434 m!81117))

(declare-fun m!81119 () Bool)

(assert (=> b!51434 m!81119))

(declare-fun m!81121 () Bool)

(assert (=> b!51429 m!81121))

(declare-fun m!81123 () Bool)

(assert (=> b!51429 m!81123))

(declare-fun m!81125 () Bool)

(assert (=> b!51420 m!81125))

(declare-fun m!81127 () Bool)

(assert (=> b!51420 m!81127))

(declare-fun m!81129 () Bool)

(assert (=> b!51415 m!81129))

(assert (=> b!51415 m!81129))

(declare-fun m!81131 () Bool)

(assert (=> b!51415 m!81131))

(declare-fun m!81133 () Bool)

(assert (=> b!51415 m!81133))

(assert (=> b!51415 m!81133))

(declare-fun m!81135 () Bool)

(assert (=> b!51415 m!81135))

(declare-fun m!81137 () Bool)

(assert (=> b!51427 m!81137))

(declare-fun m!81139 () Bool)

(assert (=> b!51435 m!81139))

(declare-fun m!81141 () Bool)

(assert (=> b!51424 m!81141))

(declare-fun m!81143 () Bool)

(assert (=> b!51424 m!81143))

(declare-fun m!81145 () Bool)

(assert (=> b!51431 m!81145))

(declare-fun m!81147 () Bool)

(assert (=> b!51418 m!81147))

(push 1)

(assert (not b!51432))

(assert (not b!51421))

(assert (not b!51416))

(assert (not b!51426))

(assert (not b!51424))

(assert (not b!51429))

(assert (not b!51435))

(assert (not b!51423))

(assert (not b!51425))

(assert (not b!51427))

(assert (not b!51428))

(assert (not b!51418))

(assert (not b!51434))

(assert (not b!51420))

(assert (not b!51419))

(assert (not b!51415))

(assert (not b!51436))

(assert (not b!51417))

(assert (not start!10160))

(assert (not b!51422))

(assert (not b!51431))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16456 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16456 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 thiss!1379))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1072 (buf!1427 thiss!1379))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4118 () Bool)

(assert (= bs!4118 d!16456))

(declare-fun m!81885 () Bool)

(assert (=> bs!4118 m!81885))

(assert (=> b!51422 d!16456))

(declare-fun d!16458 () Bool)

(declare-fun res!43361 () Bool)

(declare-fun e!34199 () Bool)

(assert (=> d!16458 (=> (not res!43361) (not e!34199))))

(assert (=> d!16458 (= res!43361 (= (size!1072 (buf!1427 thiss!1379)) (size!1072 (buf!1427 thiss!1379))))))

(assert (=> d!16458 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!34199)))

(declare-fun b!51847 () Bool)

(declare-fun res!43359 () Bool)

(assert (=> b!51847 (=> (not res!43359) (not e!34199))))

(assert (=> b!51847 (= res!43359 (bvsle (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379)) (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379))))))

(declare-fun b!51848 () Bool)

(declare-fun e!34200 () Bool)

(assert (=> b!51848 (= e!34199 e!34200)))

(declare-fun res!43360 () Bool)

(assert (=> b!51848 (=> res!43360 e!34200)))

(assert (=> b!51848 (= res!43360 (= (size!1072 (buf!1427 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51849 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2353 array!2353 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51849 (= e!34200 (arrayBitRangesEq!0 (buf!1427 thiss!1379) (buf!1427 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379))))))

(assert (= (and d!16458 res!43361) b!51847))

(assert (= (and b!51847 res!43359) b!51848))

(assert (= (and b!51848 (not res!43360)) b!51849))

(assert (=> b!51847 m!81085))

(assert (=> b!51847 m!81085))

(assert (=> b!51849 m!81085))

(assert (=> b!51849 m!81085))

(declare-fun m!81887 () Bool)

(assert (=> b!51849 m!81887))

(assert (=> b!51432 d!16458))

(declare-fun d!16460 () Bool)

(assert (=> d!16460 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!80776 () Unit!3543)

(declare-fun choose!11 (BitStream!1852) Unit!3543)

(assert (=> d!16460 (= lt!80776 (choose!11 thiss!1379))))

(assert (=> d!16460 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!80776)))

(declare-fun bs!4120 () Bool)

(assert (= bs!4120 d!16460))

(assert (=> bs!4120 m!81081))

(declare-fun m!81889 () Bool)

(assert (=> bs!4120 m!81889))

(assert (=> b!51432 d!16460))

(declare-fun d!16462 () Bool)

(declare-fun e!34203 () Bool)

(assert (=> d!16462 e!34203))

(declare-fun res!43367 () Bool)

(assert (=> d!16462 (=> (not res!43367) (not e!34203))))

(declare-fun lt!80789 () (_ BitVec 64))

(declare-fun lt!80790 () (_ BitVec 64))

(declare-fun lt!80794 () (_ BitVec 64))

(assert (=> d!16462 (= res!43367 (= lt!80789 (bvsub lt!80790 lt!80794)))))

(assert (=> d!16462 (or (= (bvand lt!80790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80794 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80790 lt!80794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16462 (= lt!80794 (remainingBits!0 ((_ sign_extend 32) (size!1072 (buf!1427 thiss!1379))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379))))))

(declare-fun lt!80792 () (_ BitVec 64))

(declare-fun lt!80791 () (_ BitVec 64))

(assert (=> d!16462 (= lt!80790 (bvmul lt!80792 lt!80791))))

(assert (=> d!16462 (or (= lt!80792 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80791 (bvsdiv (bvmul lt!80792 lt!80791) lt!80792)))))

(assert (=> d!16462 (= lt!80791 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16462 (= lt!80792 ((_ sign_extend 32) (size!1072 (buf!1427 thiss!1379))))))

(assert (=> d!16462 (= lt!80789 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2956 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2951 thiss!1379))))))

(assert (=> d!16462 (invariant!0 (currentBit!2951 thiss!1379) (currentByte!2956 thiss!1379) (size!1072 (buf!1427 thiss!1379)))))

(assert (=> d!16462 (= (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379)) lt!80789)))

(declare-fun b!51854 () Bool)

(declare-fun res!43366 () Bool)

(assert (=> b!51854 (=> (not res!43366) (not e!34203))))

(assert (=> b!51854 (= res!43366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80789))))

(declare-fun b!51855 () Bool)

(declare-fun lt!80793 () (_ BitVec 64))

(assert (=> b!51855 (= e!34203 (bvsle lt!80789 (bvmul lt!80793 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51855 (or (= lt!80793 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80793 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80793)))))

(assert (=> b!51855 (= lt!80793 ((_ sign_extend 32) (size!1072 (buf!1427 thiss!1379))))))

(assert (= (and d!16462 res!43367) b!51854))

(assert (= (and b!51854 res!43366) b!51855))

(assert (=> d!16462 m!81885))

(declare-fun m!81891 () Bool)

(assert (=> d!16462 m!81891))

(assert (=> b!51432 d!16462))

(declare-fun d!16464 () Bool)

(assert (=> d!16464 (= (array_inv!979 srcBuffer!2) (bvsge (size!1072 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10160 d!16464))

(declare-fun d!16466 () Bool)

(assert (=> d!16466 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2951 thiss!1379) (currentByte!2956 thiss!1379) (size!1072 (buf!1427 thiss!1379))))))

(declare-fun bs!4121 () Bool)

(assert (= bs!4121 d!16466))

(assert (=> bs!4121 m!81891))

(assert (=> start!10160 d!16466))

(declare-fun d!16468 () Bool)

(declare-fun e!34204 () Bool)

(assert (=> d!16468 e!34204))

(declare-fun res!43369 () Bool)

(assert (=> d!16468 (=> (not res!43369) (not e!34204))))

(declare-fun lt!80796 () (_ BitVec 64))

(declare-fun lt!80795 () (_ BitVec 64))

(declare-fun lt!80800 () (_ BitVec 64))

(assert (=> d!16468 (= res!43369 (= lt!80795 (bvsub lt!80796 lt!80800)))))

(assert (=> d!16468 (or (= (bvand lt!80796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!80800 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80796 lt!80800) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16468 (= lt!80800 (remainingBits!0 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79918)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79918))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79918)))))))

(declare-fun lt!80798 () (_ BitVec 64))

(declare-fun lt!80797 () (_ BitVec 64))

(assert (=> d!16468 (= lt!80796 (bvmul lt!80798 lt!80797))))

(assert (=> d!16468 (or (= lt!80798 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!80797 (bvsdiv (bvmul lt!80798 lt!80797) lt!80798)))))

(assert (=> d!16468 (= lt!80797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16468 (= lt!80798 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79918)))))))

(assert (=> d!16468 (= lt!80795 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79918))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79918)))))))

(assert (=> d!16468 (invariant!0 (currentBit!2951 (_2!2463 lt!79918)) (currentByte!2956 (_2!2463 lt!79918)) (size!1072 (buf!1427 (_2!2463 lt!79918))))))

(assert (=> d!16468 (= (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79918))) (currentByte!2956 (_2!2463 lt!79918)) (currentBit!2951 (_2!2463 lt!79918))) lt!80795)))

(declare-fun b!51856 () Bool)

(declare-fun res!43368 () Bool)

(assert (=> b!51856 (=> (not res!43368) (not e!34204))))

(assert (=> b!51856 (= res!43368 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!80795))))

(declare-fun b!51857 () Bool)

(declare-fun lt!80799 () (_ BitVec 64))

(assert (=> b!51857 (= e!34204 (bvsle lt!80795 (bvmul lt!80799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51857 (or (= lt!80799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!80799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!80799)))))

(assert (=> b!51857 (= lt!80799 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79918)))))))

(assert (= (and d!16468 res!43369) b!51856))

(assert (= (and b!51856 res!43368) b!51857))

(declare-fun m!81893 () Bool)

(assert (=> d!16468 m!81893))

(assert (=> d!16468 m!81137))

(assert (=> b!51421 d!16468))

(declare-fun d!16470 () Bool)

(assert (=> d!16470 (isPrefixOf!0 thiss!1379 (_2!2463 lt!79918))))

(declare-fun lt!80803 () Unit!3543)

(declare-fun choose!30 (BitStream!1852 BitStream!1852 BitStream!1852) Unit!3543)

(assert (=> d!16470 (= lt!80803 (choose!30 thiss!1379 (_2!2463 lt!79925) (_2!2463 lt!79918)))))

(assert (=> d!16470 (isPrefixOf!0 thiss!1379 (_2!2463 lt!79925))))

(assert (=> d!16470 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2463 lt!79925) (_2!2463 lt!79918)) lt!80803)))

(declare-fun bs!4122 () Bool)

(assert (= bs!4122 d!16470))

(assert (=> bs!4122 m!81109))

(declare-fun m!81895 () Bool)

(assert (=> bs!4122 m!81895))

(assert (=> bs!4122 m!81059))

(assert (=> b!51434 d!16470))

(declare-fun lt!80931 () tuple2!4716)

(declare-fun c!3725 () Bool)

(declare-fun bm!664 () Bool)

(declare-fun call!667 () tuple2!4718)

(assert (=> bm!664 (= call!667 (reader!0 (_2!2463 lt!79925) (ite c!3725 (_2!2463 lt!80931) (_2!2463 lt!79925))))))

(declare-fun b!51874 () Bool)

(declare-fun res!43385 () Bool)

(declare-fun e!34212 () Bool)

(assert (=> b!51874 (=> (not res!43385) (not e!34212))))

(declare-fun lt!80935 () tuple2!4716)

(assert (=> b!51874 (= res!43385 (isPrefixOf!0 (_2!2463 lt!79925) (_2!2463 lt!80935)))))

(declare-fun b!51875 () Bool)

(declare-fun e!34211 () tuple2!4716)

(declare-fun Unit!3569 () Unit!3543)

(assert (=> b!51875 (= e!34211 (tuple2!4717 Unit!3569 (_2!2463 lt!80931)))))

(declare-fun lt!80899 () tuple2!4716)

(assert (=> b!51875 (= lt!80899 (appendBitFromByte!0 (_2!2463 lt!79925) (select (arr!1604 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!80912 () (_ BitVec 64))

(assert (=> b!51875 (= lt!80912 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80924 () (_ BitVec 64))

(assert (=> b!51875 (= lt!80924 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80933 () Unit!3543)

(assert (=> b!51875 (= lt!80933 (validateOffsetBitsIneqLemma!0 (_2!2463 lt!79925) (_2!2463 lt!80899) lt!80912 lt!80924))))

(assert (=> b!51875 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!80899)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!80899))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!80899))) (bvsub lt!80912 lt!80924))))

(declare-fun lt!80894 () Unit!3543)

(assert (=> b!51875 (= lt!80894 lt!80933)))

(declare-fun lt!80918 () tuple2!4718)

(assert (=> b!51875 (= lt!80918 (reader!0 (_2!2463 lt!79925) (_2!2463 lt!80899)))))

(declare-fun lt!80926 () (_ BitVec 64))

(assert (=> b!51875 (= lt!80926 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80929 () Unit!3543)

(assert (=> b!51875 (= lt!80929 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2463 lt!79925) (buf!1427 (_2!2463 lt!80899)) lt!80926))))

(assert (=> b!51875 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!80899)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79925))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79925))) lt!80926)))

(declare-fun lt!80897 () Unit!3543)

(assert (=> b!51875 (= lt!80897 lt!80929)))

(assert (=> b!51875 (= (head!386 (byteArrayBitContentToList!0 (_2!2463 lt!80899) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!386 (bitStreamReadBitsIntoList!0 (_2!2463 lt!80899) (_1!2464 lt!80918) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80921 () Unit!3543)

(declare-fun Unit!3570 () Unit!3543)

(assert (=> b!51875 (= lt!80921 Unit!3570)))

(assert (=> b!51875 (= lt!80931 (appendBitsMSBFirstLoop!0 (_2!2463 lt!80899) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!80919 () Unit!3543)

(assert (=> b!51875 (= lt!80919 (lemmaIsPrefixTransitive!0 (_2!2463 lt!79925) (_2!2463 lt!80899) (_2!2463 lt!80931)))))

(assert (=> b!51875 (isPrefixOf!0 (_2!2463 lt!79925) (_2!2463 lt!80931))))

(declare-fun lt!80896 () Unit!3543)

(assert (=> b!51875 (= lt!80896 lt!80919)))

(assert (=> b!51875 (= (size!1072 (buf!1427 (_2!2463 lt!80931))) (size!1072 (buf!1427 (_2!2463 lt!79925))))))

(declare-fun lt!80925 () Unit!3543)

(declare-fun Unit!3571 () Unit!3543)

(assert (=> b!51875 (= lt!80925 Unit!3571)))

(assert (=> b!51875 (= (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!80931))) (currentByte!2956 (_2!2463 lt!80931)) (currentBit!2951 (_2!2463 lt!80931))) (bvsub (bvadd (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79925))) (currentByte!2956 (_2!2463 lt!79925)) (currentBit!2951 (_2!2463 lt!79925))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80917 () Unit!3543)

(declare-fun Unit!3572 () Unit!3543)

(assert (=> b!51875 (= lt!80917 Unit!3572)))

(assert (=> b!51875 (= (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!80931))) (currentByte!2956 (_2!2463 lt!80931)) (currentBit!2951 (_2!2463 lt!80931))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!80899))) (currentByte!2956 (_2!2463 lt!80899)) (currentBit!2951 (_2!2463 lt!80899))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80909 () Unit!3543)

(declare-fun Unit!3573 () Unit!3543)

(assert (=> b!51875 (= lt!80909 Unit!3573)))

(declare-fun lt!80904 () tuple2!4718)

(assert (=> b!51875 (= lt!80904 call!667)))

(declare-fun lt!80900 () (_ BitVec 64))

(assert (=> b!51875 (= lt!80900 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80893 () Unit!3543)

(assert (=> b!51875 (= lt!80893 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2463 lt!79925) (buf!1427 (_2!2463 lt!80931)) lt!80900))))

(assert (=> b!51875 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!80931)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79925))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79925))) lt!80900)))

(declare-fun lt!80934 () Unit!3543)

(assert (=> b!51875 (= lt!80934 lt!80893)))

(declare-fun lt!80930 () tuple2!4718)

(assert (=> b!51875 (= lt!80930 (reader!0 (_2!2463 lt!80899) (_2!2463 lt!80931)))))

(declare-fun lt!80898 () (_ BitVec 64))

(assert (=> b!51875 (= lt!80898 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!80895 () Unit!3543)

(assert (=> b!51875 (= lt!80895 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2463 lt!80899) (buf!1427 (_2!2463 lt!80931)) lt!80898))))

(assert (=> b!51875 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!80931)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!80899))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!80899))) lt!80898)))

(declare-fun lt!80911 () Unit!3543)

(assert (=> b!51875 (= lt!80911 lt!80895)))

(declare-fun lt!80907 () List!567)

(assert (=> b!51875 (= lt!80907 (byteArrayBitContentToList!0 (_2!2463 lt!80931) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!80913 () List!567)

(assert (=> b!51875 (= lt!80913 (byteArrayBitContentToList!0 (_2!2463 lt!80931) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80916 () List!567)

(assert (=> b!51875 (= lt!80916 (bitStreamReadBitsIntoList!0 (_2!2463 lt!80931) (_1!2464 lt!80904) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!80892 () List!567)

(assert (=> b!51875 (= lt!80892 (bitStreamReadBitsIntoList!0 (_2!2463 lt!80931) (_1!2464 lt!80930) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!80906 () (_ BitVec 64))

(assert (=> b!51875 (= lt!80906 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!80932 () Unit!3543)

(assert (=> b!51875 (= lt!80932 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2463 lt!80931) (_2!2463 lt!80931) (_1!2464 lt!80904) (_1!2464 lt!80930) lt!80906 lt!80916))))

(assert (=> b!51875 (= (bitStreamReadBitsIntoList!0 (_2!2463 lt!80931) (_1!2464 lt!80930) (bvsub lt!80906 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!253 lt!80916))))

(declare-fun lt!80914 () Unit!3543)

(assert (=> b!51875 (= lt!80914 lt!80932)))

(declare-fun lt!80908 () (_ BitVec 64))

(declare-fun lt!80922 () Unit!3543)

(assert (=> b!51875 (= lt!80922 (arrayBitRangesEqImpliesEq!0 (buf!1427 (_2!2463 lt!80899)) (buf!1427 (_2!2463 lt!80931)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!80908 (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!80899))) (currentByte!2956 (_2!2463 lt!80899)) (currentBit!2951 (_2!2463 lt!80899)))))))

(assert (=> b!51875 (= (bitAt!0 (buf!1427 (_2!2463 lt!80899)) lt!80908) (bitAt!0 (buf!1427 (_2!2463 lt!80931)) lt!80908))))

(declare-fun lt!80927 () Unit!3543)

(assert (=> b!51875 (= lt!80927 lt!80922)))

(declare-fun d!16472 () Bool)

(assert (=> d!16472 e!34212))

(declare-fun res!43383 () Bool)

(assert (=> d!16472 (=> (not res!43383) (not e!34212))))

(declare-fun lt!80901 () (_ BitVec 64))

(assert (=> d!16472 (= res!43383 (= (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!80935))) (currentByte!2956 (_2!2463 lt!80935)) (currentBit!2951 (_2!2463 lt!80935))) (bvsub lt!80901 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!16472 (or (= (bvand lt!80901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!80901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!80901 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!80910 () (_ BitVec 64))

(assert (=> d!16472 (= lt!80901 (bvadd lt!80910 to!314))))

(assert (=> d!16472 (or (not (= (bvand lt!80910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!80910 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!80910 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16472 (= lt!80910 (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79925))) (currentByte!2956 (_2!2463 lt!79925)) (currentBit!2951 (_2!2463 lt!79925))))))

(assert (=> d!16472 (= lt!80935 e!34211)))

(assert (=> d!16472 (= c!3725 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!80905 () Unit!3543)

(declare-fun lt!80902 () Unit!3543)

(assert (=> d!16472 (= lt!80905 lt!80902)))

(assert (=> d!16472 (isPrefixOf!0 (_2!2463 lt!79925) (_2!2463 lt!79925))))

(assert (=> d!16472 (= lt!80902 (lemmaIsPrefixRefl!0 (_2!2463 lt!79925)))))

(assert (=> d!16472 (= lt!80908 (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79925))) (currentByte!2956 (_2!2463 lt!79925)) (currentBit!2951 (_2!2463 lt!79925))))))

(assert (=> d!16472 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16472 (= (appendBitsMSBFirstLoop!0 (_2!2463 lt!79925) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!80935)))

(declare-fun b!51876 () Bool)

(declare-fun Unit!3574 () Unit!3543)

(assert (=> b!51876 (= e!34211 (tuple2!4717 Unit!3574 (_2!2463 lt!79925)))))

(assert (=> b!51876 (= (size!1072 (buf!1427 (_2!2463 lt!79925))) (size!1072 (buf!1427 (_2!2463 lt!79925))))))

(declare-fun lt!80915 () Unit!3543)

(declare-fun Unit!3575 () Unit!3543)

(assert (=> b!51876 (= lt!80915 Unit!3575)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1852 array!2353 array!2353 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4746 0))(
  ( (tuple2!4747 (_1!2478 array!2353) (_2!2478 BitStream!1852)) )
))
(declare-fun readBits!0 (BitStream!1852 (_ BitVec 64)) tuple2!4746)

(assert (=> b!51876 (checkByteArrayBitContent!0 (_2!2463 lt!79925) srcBuffer!2 (_1!2478 (readBits!0 (_1!2464 call!667) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!51877 () Bool)

(declare-fun lt!80903 () tuple2!4718)

(assert (=> b!51877 (= e!34212 (= (bitStreamReadBitsIntoList!0 (_2!2463 lt!80935) (_1!2464 lt!80903) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2463 lt!80935) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!51877 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51877 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!80920 () Unit!3543)

(declare-fun lt!80928 () Unit!3543)

(assert (=> b!51877 (= lt!80920 lt!80928)))

(declare-fun lt!80923 () (_ BitVec 64))

(assert (=> b!51877 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!80935)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79925))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79925))) lt!80923)))

(assert (=> b!51877 (= lt!80928 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2463 lt!79925) (buf!1427 (_2!2463 lt!80935)) lt!80923))))

(declare-fun e!34213 () Bool)

(assert (=> b!51877 e!34213))

(declare-fun res!43384 () Bool)

(assert (=> b!51877 (=> (not res!43384) (not e!34213))))

(assert (=> b!51877 (= res!43384 (and (= (size!1072 (buf!1427 (_2!2463 lt!79925))) (size!1072 (buf!1427 (_2!2463 lt!80935)))) (bvsge lt!80923 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51877 (= lt!80923 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!51877 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51877 (= lt!80903 (reader!0 (_2!2463 lt!79925) (_2!2463 lt!80935)))))

(declare-fun b!51878 () Bool)

(declare-fun res!43387 () Bool)

(assert (=> b!51878 (=> (not res!43387) (not e!34212))))

(assert (=> b!51878 (= res!43387 (= (size!1072 (buf!1427 (_2!2463 lt!79925))) (size!1072 (buf!1427 (_2!2463 lt!80935)))))))

(declare-fun b!51879 () Bool)

(assert (=> b!51879 (= e!34213 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79925)))) ((_ sign_extend 32) (currentByte!2956 (_2!2463 lt!79925))) ((_ sign_extend 32) (currentBit!2951 (_2!2463 lt!79925))) lt!80923))))

(declare-fun b!51880 () Bool)

(declare-fun res!43386 () Bool)

(assert (=> b!51880 (=> (not res!43386) (not e!34212))))

(assert (=> b!51880 (= res!43386 (= (size!1072 (buf!1427 (_2!2463 lt!80935))) (size!1072 (buf!1427 (_2!2463 lt!79925)))))))

(declare-fun b!51881 () Bool)

(declare-fun res!43382 () Bool)

(assert (=> b!51881 (=> (not res!43382) (not e!34212))))

(assert (=> b!51881 (= res!43382 (invariant!0 (currentBit!2951 (_2!2463 lt!80935)) (currentByte!2956 (_2!2463 lt!80935)) (size!1072 (buf!1427 (_2!2463 lt!80935)))))))

(assert (= (and d!16472 c!3725) b!51875))

(assert (= (and d!16472 (not c!3725)) b!51876))

(assert (= (or b!51875 b!51876) bm!664))

(assert (= (and d!16472 res!43383) b!51881))

(assert (= (and b!51881 res!43382) b!51878))

(assert (= (and b!51878 res!43387) b!51874))

(assert (= (and b!51874 res!43385) b!51880))

(assert (= (and b!51880 res!43386) b!51877))

(assert (= (and b!51877 res!43384) b!51879))

(declare-fun m!81897 () Bool)

(assert (=> b!51876 m!81897))

(declare-fun m!81899 () Bool)

(assert (=> b!51876 m!81899))

(declare-fun m!81901 () Bool)

(assert (=> b!51877 m!81901))

(declare-fun m!81903 () Bool)

(assert (=> b!51877 m!81903))

(declare-fun m!81905 () Bool)

(assert (=> b!51877 m!81905))

(declare-fun m!81907 () Bool)

(assert (=> b!51877 m!81907))

(declare-fun m!81909 () Bool)

(assert (=> b!51877 m!81909))

(declare-fun m!81911 () Bool)

(assert (=> b!51881 m!81911))

(declare-fun m!81913 () Bool)

(assert (=> bm!664 m!81913))

(declare-fun m!81915 () Bool)

(assert (=> b!51875 m!81915))

(declare-fun m!81917 () Bool)

(assert (=> b!51875 m!81917))

(declare-fun m!81919 () Bool)

(assert (=> b!51875 m!81919))

(declare-fun m!81921 () Bool)

(assert (=> b!51875 m!81921))

(declare-fun m!81923 () Bool)

(assert (=> b!51875 m!81923))

(declare-fun m!81925 () Bool)

(assert (=> b!51875 m!81925))

(assert (=> b!51875 m!81925))

(declare-fun m!81927 () Bool)

(assert (=> b!51875 m!81927))

(declare-fun m!81929 () Bool)

(assert (=> b!51875 m!81929))

(declare-fun m!81931 () Bool)

(assert (=> b!51875 m!81931))

(declare-fun m!81933 () Bool)

(assert (=> b!51875 m!81933))

(assert (=> b!51875 m!81921))

(declare-fun m!81935 () Bool)

(assert (=> b!51875 m!81935))

(declare-fun m!81937 () Bool)

(assert (=> b!51875 m!81937))

(declare-fun m!81939 () Bool)

(assert (=> b!51875 m!81939))

(declare-fun m!81941 () Bool)

(assert (=> b!51875 m!81941))

(declare-fun m!81943 () Bool)

(assert (=> b!51875 m!81943))

(declare-fun m!81945 () Bool)

(assert (=> b!51875 m!81945))

(declare-fun m!81947 () Bool)

(assert (=> b!51875 m!81947))

(declare-fun m!81949 () Bool)

(assert (=> b!51875 m!81949))

(declare-fun m!81951 () Bool)

(assert (=> b!51875 m!81951))

(assert (=> b!51875 m!81069))

(declare-fun m!81953 () Bool)

(assert (=> b!51875 m!81953))

(declare-fun m!81955 () Bool)

(assert (=> b!51875 m!81955))

(declare-fun m!81957 () Bool)

(assert (=> b!51875 m!81957))

(declare-fun m!81959 () Bool)

(assert (=> b!51875 m!81959))

(declare-fun m!81961 () Bool)

(assert (=> b!51875 m!81961))

(declare-fun m!81963 () Bool)

(assert (=> b!51875 m!81963))

(declare-fun m!81965 () Bool)

(assert (=> b!51875 m!81965))

(assert (=> b!51875 m!81929))

(declare-fun m!81967 () Bool)

(assert (=> b!51875 m!81967))

(declare-fun m!81969 () Bool)

(assert (=> b!51875 m!81969))

(declare-fun m!81971 () Bool)

(assert (=> b!51875 m!81971))

(declare-fun m!81973 () Bool)

(assert (=> b!51875 m!81973))

(assert (=> b!51875 m!81939))

(declare-fun m!81975 () Bool)

(assert (=> b!51875 m!81975))

(declare-fun m!81977 () Bool)

(assert (=> d!16472 m!81977))

(assert (=> d!16472 m!81069))

(declare-fun m!81979 () Bool)

(assert (=> d!16472 m!81979))

(declare-fun m!81981 () Bool)

(assert (=> d!16472 m!81981))

(declare-fun m!81983 () Bool)

(assert (=> b!51879 m!81983))

(declare-fun m!81985 () Bool)

(assert (=> b!51874 m!81985))

(assert (=> b!51434 d!16472))

(declare-fun d!16474 () Bool)

(declare-fun res!43390 () Bool)

(declare-fun e!34214 () Bool)

(assert (=> d!16474 (=> (not res!43390) (not e!34214))))

(assert (=> d!16474 (= res!43390 (= (size!1072 (buf!1427 (_2!2463 lt!79925))) (size!1072 (buf!1427 (_2!2463 lt!79918)))))))

(assert (=> d!16474 (= (isPrefixOf!0 (_2!2463 lt!79925) (_2!2463 lt!79918)) e!34214)))

(declare-fun b!51882 () Bool)

(declare-fun res!43388 () Bool)

(assert (=> b!51882 (=> (not res!43388) (not e!34214))))

(assert (=> b!51882 (= res!43388 (bvsle (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79925))) (currentByte!2956 (_2!2463 lt!79925)) (currentBit!2951 (_2!2463 lt!79925))) (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79918))) (currentByte!2956 (_2!2463 lt!79918)) (currentBit!2951 (_2!2463 lt!79918)))))))

(declare-fun b!51883 () Bool)

(declare-fun e!34215 () Bool)

(assert (=> b!51883 (= e!34214 e!34215)))

(declare-fun res!43389 () Bool)

(assert (=> b!51883 (=> res!43389 e!34215)))

(assert (=> b!51883 (= res!43389 (= (size!1072 (buf!1427 (_2!2463 lt!79925))) #b00000000000000000000000000000000))))

(declare-fun b!51884 () Bool)

(assert (=> b!51884 (= e!34215 (arrayBitRangesEq!0 (buf!1427 (_2!2463 lt!79925)) (buf!1427 (_2!2463 lt!79918)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79925))) (currentByte!2956 (_2!2463 lt!79925)) (currentBit!2951 (_2!2463 lt!79925)))))))

(assert (= (and d!16474 res!43390) b!51882))

(assert (= (and b!51882 res!43388) b!51883))

(assert (= (and b!51883 (not res!43389)) b!51884))

(assert (=> b!51882 m!81069))

(assert (=> b!51882 m!81071))

(assert (=> b!51884 m!81069))

(assert (=> b!51884 m!81069))

(declare-fun m!81987 () Bool)

(assert (=> b!51884 m!81987))

(assert (=> b!51434 d!16474))

(declare-fun d!16476 () Bool)

(assert (=> d!16476 (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79925)))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!80938 () Unit!3543)

(declare-fun choose!9 (BitStream!1852 array!2353 (_ BitVec 64) BitStream!1852) Unit!3543)

(assert (=> d!16476 (= lt!80938 (choose!9 thiss!1379 (buf!1427 (_2!2463 lt!79925)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1853 (buf!1427 (_2!2463 lt!79925)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379))))))

(assert (=> d!16476 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1427 (_2!2463 lt!79925)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!80938)))

(declare-fun bs!4123 () Bool)

(assert (= bs!4123 d!16476))

(assert (=> bs!4123 m!81113))

(declare-fun m!81989 () Bool)

(assert (=> bs!4123 m!81989))

(assert (=> b!51434 d!16476))

(declare-fun d!16478 () Bool)

(declare-fun res!43393 () Bool)

(declare-fun e!34216 () Bool)

(assert (=> d!16478 (=> (not res!43393) (not e!34216))))

(assert (=> d!16478 (= res!43393 (= (size!1072 (buf!1427 thiss!1379)) (size!1072 (buf!1427 (_2!2463 lt!79918)))))))

(assert (=> d!16478 (= (isPrefixOf!0 thiss!1379 (_2!2463 lt!79918)) e!34216)))

(declare-fun b!51885 () Bool)

(declare-fun res!43391 () Bool)

(assert (=> b!51885 (=> (not res!43391) (not e!34216))))

(assert (=> b!51885 (= res!43391 (bvsle (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379)) (bitIndex!0 (size!1072 (buf!1427 (_2!2463 lt!79918))) (currentByte!2956 (_2!2463 lt!79918)) (currentBit!2951 (_2!2463 lt!79918)))))))

(declare-fun b!51886 () Bool)

(declare-fun e!34217 () Bool)

(assert (=> b!51886 (= e!34216 e!34217)))

(declare-fun res!43392 () Bool)

(assert (=> b!51886 (=> res!43392 e!34217)))

(assert (=> b!51886 (= res!43392 (= (size!1072 (buf!1427 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51887 () Bool)

(assert (=> b!51887 (= e!34217 (arrayBitRangesEq!0 (buf!1427 thiss!1379) (buf!1427 (_2!2463 lt!79918)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1072 (buf!1427 thiss!1379)) (currentByte!2956 thiss!1379) (currentBit!2951 thiss!1379))))))

(assert (= (and d!16478 res!43393) b!51885))

(assert (= (and b!51885 res!43391) b!51886))

(assert (= (and b!51886 (not res!43392)) b!51887))

(assert (=> b!51885 m!81085))

(assert (=> b!51885 m!81071))

(assert (=> b!51887 m!81085))

(assert (=> b!51887 m!81085))

(declare-fun m!81991 () Bool)

(assert (=> b!51887 m!81991))

(assert (=> b!51434 d!16478))

(declare-fun d!16480 () Bool)

(assert (=> d!16480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79925)))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1072 (buf!1427 (_2!2463 lt!79925)))) ((_ sign_extend 32) (currentByte!2956 thiss!1379)) ((_ sign_extend 32) (currentBit!2951 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4124 () Bool)

