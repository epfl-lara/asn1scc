; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7484 () Bool)

(assert start!7484)

(declare-fun b!36505 () Bool)

(declare-fun e!24082 () Bool)

(declare-datatypes ((List!444 0))(
  ( (Nil!441) (Cons!440 (h!559 Bool) (t!1194 List!444)) )
))
(declare-fun lt!54811 () List!444)

(assert (=> b!36505 (= e!24082 (not (= lt!54811 Nil!441)))))

(declare-fun b!36506 () Bool)

(declare-fun res!31100 () Bool)

(assert (=> b!36506 (=> res!31100 e!24082)))

(declare-datatypes ((array!1922 0))(
  ( (array!1923 (arr!1346 (Array (_ BitVec 32) (_ BitVec 8))) (size!859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1486 0))(
  ( (BitStream!1487 (buf!1187 array!1922) (currentByte!2581 (_ BitVec 32)) (currentBit!2576 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3598 0))(
  ( (tuple2!3599 (_1!1886 BitStream!1486) (_2!1886 BitStream!1486)) )
))
(declare-fun lt!54825 () tuple2!3598)

(declare-fun lt!54819 () Bool)

(declare-datatypes ((tuple2!3600 0))(
  ( (tuple2!3601 (_1!1887 BitStream!1486) (_2!1887 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1486) tuple2!3600)

(assert (=> b!36506 (= res!31100 (not (= (_2!1887 (readBitPure!0 (_1!1886 lt!54825))) lt!54819)))))

(declare-fun b!36507 () Bool)

(declare-fun res!31110 () Bool)

(declare-fun e!24084 () Bool)

(assert (=> b!36507 (=> res!31110 e!24084)))

(declare-datatypes ((Unit!2669 0))(
  ( (Unit!2670) )
))
(declare-datatypes ((tuple2!3602 0))(
  ( (tuple2!3603 (_1!1888 Unit!2669) (_2!1888 BitStream!1486)) )
))
(declare-fun lt!54821 () tuple2!3602)

(declare-fun lt!54817 () tuple2!3602)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!36507 (= res!31110 (not (invariant!0 (currentBit!2576 (_2!1888 lt!54821)) (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54817))))))))

(declare-fun b!36508 () Bool)

(declare-fun e!24088 () Bool)

(assert (=> b!36508 (= e!24088 e!24084)))

(declare-fun res!31114 () Bool)

(assert (=> b!36508 (=> res!31114 e!24084)))

(assert (=> b!36508 (= res!31114 (not (= (size!859 (buf!1187 (_2!1888 lt!54821))) (size!859 (buf!1187 (_2!1888 lt!54817))))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!54810 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!54831 () (_ BitVec 64))

(assert (=> b!36508 (= lt!54810 (bvsub (bvsub (bvadd lt!54831 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!36508 (= lt!54831 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(declare-fun thiss!1379 () BitStream!1486)

(assert (=> b!36508 (= (size!859 (buf!1187 (_2!1888 lt!54817))) (size!859 (buf!1187 thiss!1379)))))

(declare-fun b!36509 () Bool)

(declare-fun e!24089 () Bool)

(declare-fun e!24094 () Bool)

(assert (=> b!36509 (= e!24089 e!24094)))

(declare-fun res!31098 () Bool)

(assert (=> b!36509 (=> res!31098 e!24094)))

(declare-fun lt!54814 () (_ BitVec 64))

(declare-fun lt!54832 () Bool)

(declare-fun lt!54828 () tuple2!3598)

(declare-fun bitAt!0 (array!1922 (_ BitVec 64)) Bool)

(assert (=> b!36509 (= res!31098 (not (= lt!54832 (bitAt!0 (buf!1187 (_1!1886 lt!54828)) lt!54814))))))

(assert (=> b!36509 (= lt!54832 (bitAt!0 (buf!1187 (_1!1886 lt!54825)) lt!54814))))

(declare-fun b!36510 () Bool)

(declare-fun e!24083 () Bool)

(declare-fun e!24081 () Bool)

(assert (=> b!36510 (= e!24083 e!24081)))

(declare-fun res!31104 () Bool)

(assert (=> b!36510 (=> res!31104 e!24081)))

(declare-fun lt!54820 () Bool)

(assert (=> b!36510 (= res!31104 (not (= lt!54820 lt!54819)))))

(assert (=> b!36510 (= lt!54820 (bitAt!0 (buf!1187 (_2!1888 lt!54821)) lt!54814))))

(declare-fun b!36511 () Bool)

(declare-fun e!24085 () Bool)

(declare-fun srcBuffer!2 () array!1922)

(declare-fun lt!54826 () tuple2!3598)

(declare-fun head!281 (List!444) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1486 array!1922 (_ BitVec 64) (_ BitVec 64)) List!444)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1486 BitStream!1486 (_ BitVec 64)) List!444)

(assert (=> b!36511 (= e!24085 (= (head!281 (byteArrayBitContentToList!0 (_2!1888 lt!54821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!281 (bitStreamReadBitsIntoList!0 (_2!1888 lt!54821) (_1!1886 lt!54826) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!36512 () Bool)

(declare-fun res!31102 () Bool)

(assert (=> b!36512 (=> res!31102 e!24088)))

(assert (=> b!36512 (= res!31102 (not (= (size!859 (buf!1187 thiss!1379)) (size!859 (buf!1187 (_2!1888 lt!54817))))))))

(declare-fun b!36513 () Bool)

(assert (=> b!36513 (= e!24094 e!24083)))

(declare-fun res!31116 () Bool)

(assert (=> b!36513 (=> res!31116 e!24083)))

(assert (=> b!36513 (= res!31116 (not (= (head!281 (byteArrayBitContentToList!0 (_2!1888 lt!54817) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!54819)))))

(assert (=> b!36513 (= lt!54819 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!36514 () Bool)

(assert (=> b!36514 (= e!24081 e!24082)))

(declare-fun res!31113 () Bool)

(assert (=> b!36514 (=> res!31113 e!24082)))

(declare-fun lt!54822 () Bool)

(assert (=> b!36514 (= res!31113 (not (= lt!54822 lt!54819)))))

(assert (=> b!36514 (= lt!54820 lt!54822)))

(assert (=> b!36514 (= lt!54822 (bitAt!0 (buf!1187 (_2!1888 lt!54817)) lt!54814))))

(declare-fun lt!54812 () Unit!2669)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1922 array!1922 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2669)

(assert (=> b!36514 (= lt!54812 (arrayBitRangesEqImpliesEq!0 (buf!1187 (_2!1888 lt!54821)) (buf!1187 (_2!1888 lt!54817)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54814 lt!54831))))

(declare-fun b!36515 () Bool)

(declare-fun res!31109 () Bool)

(declare-fun e!24087 () Bool)

(assert (=> b!36515 (=> res!31109 e!24087)))

(declare-fun length!170 (List!444) Int)

(assert (=> b!36515 (= res!31109 (<= (length!170 lt!54811) 0))))

(declare-fun res!31096 () Bool)

(declare-fun e!24080 () Bool)

(assert (=> start!7484 (=> (not res!31096) (not e!24080))))

(assert (=> start!7484 (= res!31096 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!859 srcBuffer!2))))))))

(assert (=> start!7484 e!24080))

(assert (=> start!7484 true))

(declare-fun array_inv!796 (array!1922) Bool)

(assert (=> start!7484 (array_inv!796 srcBuffer!2)))

(declare-fun e!24079 () Bool)

(declare-fun inv!12 (BitStream!1486) Bool)

(assert (=> start!7484 (and (inv!12 thiss!1379) e!24079)))

(declare-fun b!36516 () Bool)

(declare-fun e!24092 () Bool)

(assert (=> b!36516 (= e!24092 e!24088)))

(declare-fun res!31099 () Bool)

(assert (=> b!36516 (=> res!31099 e!24088)))

(assert (=> b!36516 (= res!31099 (not (= lt!54810 (bvsub (bvadd lt!54814 to!314) i!635))))))

(assert (=> b!36516 (= lt!54810 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54817))) (currentByte!2581 (_2!1888 lt!54817)) (currentBit!2576 (_2!1888 lt!54817))))))

(declare-fun b!36517 () Bool)

(declare-fun res!31112 () Bool)

(assert (=> b!36517 (=> res!31112 e!24084)))

(assert (=> b!36517 (= res!31112 (not (invariant!0 (currentBit!2576 (_2!1888 lt!54821)) (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54821))))))))

(declare-fun b!36518 () Bool)

(declare-fun e!24091 () Bool)

(assert (=> b!36518 (= e!24080 (not e!24091))))

(declare-fun res!31101 () Bool)

(assert (=> b!36518 (=> res!31101 e!24091)))

(assert (=> b!36518 (= res!31101 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1486 BitStream!1486) Bool)

(assert (=> b!36518 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54809 () Unit!2669)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1486) Unit!2669)

(assert (=> b!36518 (= lt!54809 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!36518 (= lt!54814 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(declare-fun b!36519 () Bool)

(assert (=> b!36519 (= e!24084 e!24087)))

(declare-fun res!31097 () Bool)

(assert (=> b!36519 (=> res!31097 e!24087)))

(assert (=> b!36519 (= res!31097 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54816 () (_ BitVec 64))

(declare-fun lt!54827 () List!444)

(assert (=> b!36519 (= lt!54827 (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_1!1886 lt!54828) lt!54816))))

(assert (=> b!36519 (= lt!54811 (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_1!1886 lt!54825) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36519 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!54816)))

(declare-fun lt!54823 () Unit!2669)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1486 array!1922 (_ BitVec 64)) Unit!2669)

(assert (=> b!36519 (= lt!54823 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1888 lt!54821) (buf!1187 (_2!1888 lt!54817)) lt!54816))))

(declare-fun reader!0 (BitStream!1486 BitStream!1486) tuple2!3598)

(assert (=> b!36519 (= lt!54828 (reader!0 (_2!1888 lt!54821) (_2!1888 lt!54817)))))

(assert (=> b!36519 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54824 () Unit!2669)

(assert (=> b!36519 (= lt!54824 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1187 (_2!1888 lt!54817)) (bvsub to!314 i!635)))))

(assert (=> b!36519 (= lt!54825 (reader!0 thiss!1379 (_2!1888 lt!54817)))))

(declare-fun b!36520 () Bool)

(declare-fun e!24093 () Bool)

(assert (=> b!36520 (= e!24093 e!24092)))

(declare-fun res!31105 () Bool)

(assert (=> b!36520 (=> res!31105 e!24092)))

(assert (=> b!36520 (= res!31105 (not (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!54817))))))

(assert (=> b!36520 (isPrefixOf!0 thiss!1379 (_2!1888 lt!54817))))

(declare-fun lt!54818 () Unit!2669)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1486 BitStream!1486 BitStream!1486) Unit!2669)

(assert (=> b!36520 (= lt!54818 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1888 lt!54821) (_2!1888 lt!54817)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1486 array!1922 (_ BitVec 64) (_ BitVec 64)) tuple2!3602)

(assert (=> b!36520 (= lt!54817 (appendBitsMSBFirstLoop!0 (_2!1888 lt!54821) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!36520 e!24085))

(declare-fun res!31103 () Bool)

(assert (=> b!36520 (=> (not res!31103) (not e!24085))))

(assert (=> b!36520 (= res!31103 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54815 () Unit!2669)

(assert (=> b!36520 (= lt!54815 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1187 (_2!1888 lt!54821)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36520 (= lt!54826 (reader!0 thiss!1379 (_2!1888 lt!54821)))))

(declare-fun b!36521 () Bool)

(declare-fun res!31107 () Bool)

(assert (=> b!36521 (=> res!31107 e!24094)))

(assert (=> b!36521 (= res!31107 (not (= (head!281 lt!54811) lt!54832)))))

(declare-fun b!36522 () Bool)

(declare-fun res!31108 () Bool)

(assert (=> b!36522 (=> (not res!31108) (not e!24080))))

(assert (=> b!36522 (= res!31108 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 thiss!1379))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!36523 () Bool)

(assert (=> b!36523 (= e!24091 e!24093)))

(declare-fun res!31111 () Bool)

(assert (=> b!36523 (=> res!31111 e!24093)))

(assert (=> b!36523 (= res!31111 (not (isPrefixOf!0 thiss!1379 (_2!1888 lt!54821))))))

(assert (=> b!36523 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!54816)))

(assert (=> b!36523 (= lt!54816 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54813 () Unit!2669)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1486 BitStream!1486 (_ BitVec 64) (_ BitVec 64)) Unit!2669)

(assert (=> b!36523 (= lt!54813 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1888 lt!54821) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1486 (_ BitVec 8) (_ BitVec 32)) tuple2!3602)

(assert (=> b!36523 (= lt!54821 (appendBitFromByte!0 thiss!1379 (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!36524 () Bool)

(assert (=> b!36524 (= e!24079 (array_inv!796 (buf!1187 thiss!1379)))))

(declare-fun b!36525 () Bool)

(declare-fun res!31106 () Bool)

(assert (=> b!36525 (=> res!31106 e!24088)))

(assert (=> b!36525 (= res!31106 (not (invariant!0 (currentBit!2576 (_2!1888 lt!54817)) (currentByte!2581 (_2!1888 lt!54817)) (size!859 (buf!1187 (_2!1888 lt!54817))))))))

(declare-fun b!36526 () Bool)

(assert (=> b!36526 (= e!24087 e!24089)))

(declare-fun res!31115 () Bool)

(assert (=> b!36526 (=> res!31115 e!24089)))

(declare-fun lt!54829 () List!444)

(assert (=> b!36526 (= res!31115 (not (= lt!54829 lt!54827)))))

(assert (=> b!36526 (= lt!54827 lt!54829)))

(declare-fun tail!161 (List!444) List!444)

(assert (=> b!36526 (= lt!54829 (tail!161 lt!54811))))

(declare-fun lt!54830 () Unit!2669)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1486 BitStream!1486 BitStream!1486 BitStream!1486 (_ BitVec 64) List!444) Unit!2669)

(assert (=> b!36526 (= lt!54830 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1888 lt!54817) (_2!1888 lt!54817) (_1!1886 lt!54825) (_1!1886 lt!54828) (bvsub to!314 i!635) lt!54811))))

(assert (= (and start!7484 res!31096) b!36522))

(assert (= (and b!36522 res!31108) b!36518))

(assert (= (and b!36518 (not res!31101)) b!36523))

(assert (= (and b!36523 (not res!31111)) b!36520))

(assert (= (and b!36520 res!31103) b!36511))

(assert (= (and b!36520 (not res!31105)) b!36516))

(assert (= (and b!36516 (not res!31099)) b!36525))

(assert (= (and b!36525 (not res!31106)) b!36512))

(assert (= (and b!36512 (not res!31102)) b!36508))

(assert (= (and b!36508 (not res!31114)) b!36517))

(assert (= (and b!36517 (not res!31112)) b!36507))

(assert (= (and b!36507 (not res!31110)) b!36519))

(assert (= (and b!36519 (not res!31097)) b!36515))

(assert (= (and b!36515 (not res!31109)) b!36526))

(assert (= (and b!36526 (not res!31115)) b!36509))

(assert (= (and b!36509 (not res!31098)) b!36521))

(assert (= (and b!36521 (not res!31107)) b!36513))

(assert (= (and b!36513 (not res!31116)) b!36510))

(assert (= (and b!36510 (not res!31104)) b!36514))

(assert (= (and b!36514 (not res!31113)) b!36506))

(assert (= (and b!36506 (not res!31100)) b!36505))

(assert (= start!7484 b!36524))

(declare-fun m!55089 () Bool)

(assert (=> b!36510 m!55089))

(declare-fun m!55091 () Bool)

(assert (=> b!36514 m!55091))

(declare-fun m!55093 () Bool)

(assert (=> b!36514 m!55093))

(declare-fun m!55095 () Bool)

(assert (=> b!36522 m!55095))

(declare-fun m!55097 () Bool)

(assert (=> b!36525 m!55097))

(declare-fun m!55099 () Bool)

(assert (=> b!36515 m!55099))

(declare-fun m!55101 () Bool)

(assert (=> b!36516 m!55101))

(declare-fun m!55103 () Bool)

(assert (=> b!36519 m!55103))

(declare-fun m!55105 () Bool)

(assert (=> b!36519 m!55105))

(declare-fun m!55107 () Bool)

(assert (=> b!36519 m!55107))

(declare-fun m!55109 () Bool)

(assert (=> b!36519 m!55109))

(declare-fun m!55111 () Bool)

(assert (=> b!36519 m!55111))

(declare-fun m!55113 () Bool)

(assert (=> b!36519 m!55113))

(declare-fun m!55115 () Bool)

(assert (=> b!36519 m!55115))

(declare-fun m!55117 () Bool)

(assert (=> b!36519 m!55117))

(declare-fun m!55119 () Bool)

(assert (=> b!36517 m!55119))

(declare-fun m!55121 () Bool)

(assert (=> b!36507 m!55121))

(declare-fun m!55123 () Bool)

(assert (=> b!36513 m!55123))

(assert (=> b!36513 m!55123))

(declare-fun m!55125 () Bool)

(assert (=> b!36513 m!55125))

(declare-fun m!55127 () Bool)

(assert (=> b!36513 m!55127))

(declare-fun m!55129 () Bool)

(assert (=> b!36518 m!55129))

(declare-fun m!55131 () Bool)

(assert (=> b!36518 m!55131))

(declare-fun m!55133 () Bool)

(assert (=> b!36518 m!55133))

(declare-fun m!55135 () Bool)

(assert (=> b!36520 m!55135))

(declare-fun m!55137 () Bool)

(assert (=> b!36520 m!55137))

(declare-fun m!55139 () Bool)

(assert (=> b!36520 m!55139))

(declare-fun m!55141 () Bool)

(assert (=> b!36520 m!55141))

(declare-fun m!55143 () Bool)

(assert (=> b!36520 m!55143))

(declare-fun m!55145 () Bool)

(assert (=> b!36520 m!55145))

(declare-fun m!55147 () Bool)

(assert (=> b!36520 m!55147))

(declare-fun m!55149 () Bool)

(assert (=> start!7484 m!55149))

(declare-fun m!55151 () Bool)

(assert (=> start!7484 m!55151))

(declare-fun m!55153 () Bool)

(assert (=> b!36521 m!55153))

(declare-fun m!55155 () Bool)

(assert (=> b!36524 m!55155))

(declare-fun m!55157 () Bool)

(assert (=> b!36511 m!55157))

(assert (=> b!36511 m!55157))

(declare-fun m!55159 () Bool)

(assert (=> b!36511 m!55159))

(declare-fun m!55161 () Bool)

(assert (=> b!36511 m!55161))

(assert (=> b!36511 m!55161))

(declare-fun m!55163 () Bool)

(assert (=> b!36511 m!55163))

(declare-fun m!55165 () Bool)

(assert (=> b!36509 m!55165))

(declare-fun m!55167 () Bool)

(assert (=> b!36509 m!55167))

(declare-fun m!55169 () Bool)

(assert (=> b!36506 m!55169))

(declare-fun m!55171 () Bool)

(assert (=> b!36526 m!55171))

(declare-fun m!55173 () Bool)

(assert (=> b!36526 m!55173))

(declare-fun m!55175 () Bool)

(assert (=> b!36523 m!55175))

(declare-fun m!55177 () Bool)

(assert (=> b!36523 m!55177))

(declare-fun m!55179 () Bool)

(assert (=> b!36523 m!55179))

(assert (=> b!36523 m!55175))

(declare-fun m!55181 () Bool)

(assert (=> b!36523 m!55181))

(declare-fun m!55183 () Bool)

(assert (=> b!36523 m!55183))

(declare-fun m!55185 () Bool)

(assert (=> b!36508 m!55185))

(push 1)

(assert (not b!36516))

(assert (not b!36513))

(assert (not b!36522))

(assert (not b!36517))

(assert (not b!36511))

(assert (not b!36519))

(assert (not b!36518))

(assert (not b!36506))

(assert (not b!36523))

(assert (not b!36508))

(assert (not b!36526))

(assert (not b!36520))

(assert (not b!36514))

(assert (not b!36515))

(assert (not b!36507))

(assert (not b!36509))

(assert (not b!36525))

(assert (not b!36510))

(assert (not b!36521))

(assert (not b!36524))

(assert (not start!7484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10758 () Bool)

(declare-fun e!24210 () Bool)

(assert (=> d!10758 e!24210))

(declare-fun res!31268 () Bool)

(assert (=> d!10758 (=> (not res!31268) (not e!24210))))

(declare-fun lt!55053 () (_ BitVec 64))

(declare-fun lt!55052 () (_ BitVec 64))

(declare-fun lt!55055 () (_ BitVec 64))

(assert (=> d!10758 (= res!31268 (= lt!55053 (bvsub lt!55052 lt!55055)))))

(assert (=> d!10758 (or (= (bvand lt!55052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55052 lt!55055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10758 (= lt!55055 (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54817))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54817)))))))

(declare-fun lt!55057 () (_ BitVec 64))

(declare-fun lt!55054 () (_ BitVec 64))

(assert (=> d!10758 (= lt!55052 (bvmul lt!55057 lt!55054))))

(assert (=> d!10758 (or (= lt!55057 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55054 (bvsdiv (bvmul lt!55057 lt!55054) lt!55057)))))

(assert (=> d!10758 (= lt!55054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10758 (= lt!55057 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))))))

(assert (=> d!10758 (= lt!55053 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54817))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54817)))))))

(assert (=> d!10758 (invariant!0 (currentBit!2576 (_2!1888 lt!54817)) (currentByte!2581 (_2!1888 lt!54817)) (size!859 (buf!1187 (_2!1888 lt!54817))))))

(assert (=> d!10758 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54817))) (currentByte!2581 (_2!1888 lt!54817)) (currentBit!2576 (_2!1888 lt!54817))) lt!55053)))

(declare-fun b!36696 () Bool)

(declare-fun res!31269 () Bool)

(assert (=> b!36696 (=> (not res!31269) (not e!24210))))

(assert (=> b!36696 (= res!31269 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55053))))

(declare-fun b!36697 () Bool)

(declare-fun lt!55056 () (_ BitVec 64))

(assert (=> b!36697 (= e!24210 (bvsle lt!55053 (bvmul lt!55056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36697 (or (= lt!55056 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55056 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55056)))))

(assert (=> b!36697 (= lt!55056 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))))))

(assert (= (and d!10758 res!31268) b!36696))

(assert (= (and b!36696 res!31269) b!36697))

(declare-fun m!55421 () Bool)

(assert (=> d!10758 m!55421))

(assert (=> d!10758 m!55097))

(assert (=> b!36516 d!10758))

(declare-fun d!10760 () Bool)

(declare-datatypes ((tuple2!3622 0))(
  ( (tuple2!3623 (_1!1898 Bool) (_2!1898 BitStream!1486)) )
))
(declare-fun lt!55060 () tuple2!3622)

(declare-fun readBit!0 (BitStream!1486) tuple2!3622)

(assert (=> d!10760 (= lt!55060 (readBit!0 (_1!1886 lt!54825)))))

(assert (=> d!10760 (= (readBitPure!0 (_1!1886 lt!54825)) (tuple2!3601 (_2!1898 lt!55060) (_1!1898 lt!55060)))))

(declare-fun bs!2891 () Bool)

(assert (= bs!2891 d!10760))

(declare-fun m!55423 () Bool)

(assert (=> bs!2891 m!55423))

(assert (=> b!36506 d!10760))

(declare-fun d!10762 () Bool)

(assert (=> d!10762 (= (invariant!0 (currentBit!2576 (_2!1888 lt!54821)) (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54821)))) (and (bvsge (currentBit!2576 (_2!1888 lt!54821)) #b00000000000000000000000000000000) (bvslt (currentBit!2576 (_2!1888 lt!54821)) #b00000000000000000000000000001000) (bvsge (currentByte!2581 (_2!1888 lt!54821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54821)))) (and (= (currentBit!2576 (_2!1888 lt!54821)) #b00000000000000000000000000000000) (= (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54821))))))))))

(assert (=> b!36517 d!10762))

(declare-fun d!10764 () Bool)

(assert (=> d!10764 (= (invariant!0 (currentBit!2576 (_2!1888 lt!54821)) (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54817)))) (and (bvsge (currentBit!2576 (_2!1888 lt!54821)) #b00000000000000000000000000000000) (bvslt (currentBit!2576 (_2!1888 lt!54821)) #b00000000000000000000000000001000) (bvsge (currentByte!2581 (_2!1888 lt!54821)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54817)))) (and (= (currentBit!2576 (_2!1888 lt!54821)) #b00000000000000000000000000000000) (= (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54817))))))))))

(assert (=> b!36507 d!10764))

(declare-fun d!10766 () Bool)

(declare-fun res!31278 () Bool)

(declare-fun e!24216 () Bool)

(assert (=> d!10766 (=> (not res!31278) (not e!24216))))

(assert (=> d!10766 (= res!31278 (= (size!859 (buf!1187 thiss!1379)) (size!859 (buf!1187 thiss!1379))))))

(assert (=> d!10766 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!24216)))

(declare-fun b!36704 () Bool)

(declare-fun res!31276 () Bool)

(assert (=> b!36704 (=> (not res!31276) (not e!24216))))

(assert (=> b!36704 (= res!31276 (bvsle (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)) (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379))))))

(declare-fun b!36705 () Bool)

(declare-fun e!24215 () Bool)

(assert (=> b!36705 (= e!24216 e!24215)))

(declare-fun res!31277 () Bool)

(assert (=> b!36705 (=> res!31277 e!24215)))

(assert (=> b!36705 (= res!31277 (= (size!859 (buf!1187 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36706 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1922 array!1922 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36706 (= e!24215 (arrayBitRangesEq!0 (buf!1187 thiss!1379) (buf!1187 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379))))))

(assert (= (and d!10766 res!31278) b!36704))

(assert (= (and b!36704 res!31276) b!36705))

(assert (= (and b!36705 (not res!31277)) b!36706))

(assert (=> b!36704 m!55133))

(assert (=> b!36704 m!55133))

(assert (=> b!36706 m!55133))

(assert (=> b!36706 m!55133))

(declare-fun m!55425 () Bool)

(assert (=> b!36706 m!55425))

(assert (=> b!36518 d!10766))

(declare-fun d!10768 () Bool)

(assert (=> d!10768 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!55063 () Unit!2669)

(declare-fun choose!11 (BitStream!1486) Unit!2669)

(assert (=> d!10768 (= lt!55063 (choose!11 thiss!1379))))

(assert (=> d!10768 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!55063)))

(declare-fun bs!2893 () Bool)

(assert (= bs!2893 d!10768))

(assert (=> bs!2893 m!55129))

(declare-fun m!55427 () Bool)

(assert (=> bs!2893 m!55427))

(assert (=> b!36518 d!10768))

(declare-fun d!10770 () Bool)

(declare-fun e!24217 () Bool)

(assert (=> d!10770 e!24217))

(declare-fun res!31279 () Bool)

(assert (=> d!10770 (=> (not res!31279) (not e!24217))))

(declare-fun lt!55065 () (_ BitVec 64))

(declare-fun lt!55067 () (_ BitVec 64))

(declare-fun lt!55064 () (_ BitVec 64))

(assert (=> d!10770 (= res!31279 (= lt!55065 (bvsub lt!55064 lt!55067)))))

(assert (=> d!10770 (or (= (bvand lt!55064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55064 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55064 lt!55067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10770 (= lt!55067 (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 thiss!1379))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379))))))

(declare-fun lt!55069 () (_ BitVec 64))

(declare-fun lt!55066 () (_ BitVec 64))

(assert (=> d!10770 (= lt!55064 (bvmul lt!55069 lt!55066))))

(assert (=> d!10770 (or (= lt!55069 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55066 (bvsdiv (bvmul lt!55069 lt!55066) lt!55069)))))

(assert (=> d!10770 (= lt!55066 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10770 (= lt!55069 ((_ sign_extend 32) (size!859 (buf!1187 thiss!1379))))))

(assert (=> d!10770 (= lt!55065 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2581 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2576 thiss!1379))))))

(assert (=> d!10770 (invariant!0 (currentBit!2576 thiss!1379) (currentByte!2581 thiss!1379) (size!859 (buf!1187 thiss!1379)))))

(assert (=> d!10770 (= (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)) lt!55065)))

(declare-fun b!36707 () Bool)

(declare-fun res!31280 () Bool)

(assert (=> b!36707 (=> (not res!31280) (not e!24217))))

(assert (=> b!36707 (= res!31280 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55065))))

(declare-fun b!36708 () Bool)

(declare-fun lt!55068 () (_ BitVec 64))

(assert (=> b!36708 (= e!24217 (bvsle lt!55065 (bvmul lt!55068 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36708 (or (= lt!55068 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55068 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55068)))))

(assert (=> b!36708 (= lt!55068 ((_ sign_extend 32) (size!859 (buf!1187 thiss!1379))))))

(assert (= (and d!10770 res!31279) b!36707))

(assert (= (and b!36707 res!31280) b!36708))

(declare-fun m!55429 () Bool)

(assert (=> d!10770 m!55429))

(declare-fun m!55431 () Bool)

(assert (=> d!10770 m!55431))

(assert (=> b!36518 d!10770))

(declare-fun d!10772 () Bool)

(assert (=> d!10772 (= (array_inv!796 (buf!1187 thiss!1379)) (bvsge (size!859 (buf!1187 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!36524 d!10772))

(declare-fun d!10774 () Bool)

(assert (=> d!10774 (= (bitAt!0 (buf!1187 (_2!1888 lt!54817)) lt!54814) (not (= (bvand ((_ sign_extend 24) (select (arr!1346 (buf!1187 (_2!1888 lt!54817))) ((_ extract 31 0) (bvsdiv lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2894 () Bool)

(assert (= bs!2894 d!10774))

(declare-fun m!55433 () Bool)

(assert (=> bs!2894 m!55433))

(declare-fun m!55435 () Bool)

(assert (=> bs!2894 m!55435))

(assert (=> b!36514 d!10774))

(declare-fun d!10776 () Bool)

(assert (=> d!10776 (= (bitAt!0 (buf!1187 (_2!1888 lt!54821)) lt!54814) (bitAt!0 (buf!1187 (_2!1888 lt!54817)) lt!54814))))

(declare-fun lt!55072 () Unit!2669)

(declare-fun choose!31 (array!1922 array!1922 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2669)

(assert (=> d!10776 (= lt!55072 (choose!31 (buf!1187 (_2!1888 lt!54821)) (buf!1187 (_2!1888 lt!54817)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54814 lt!54831))))

(assert (=> d!10776 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54831))))

(assert (=> d!10776 (= (arrayBitRangesEqImpliesEq!0 (buf!1187 (_2!1888 lt!54821)) (buf!1187 (_2!1888 lt!54817)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54814 lt!54831) lt!55072)))

(declare-fun bs!2895 () Bool)

(assert (= bs!2895 d!10776))

(assert (=> bs!2895 m!55089))

(assert (=> bs!2895 m!55091))

(declare-fun m!55437 () Bool)

(assert (=> bs!2895 m!55437))

(assert (=> b!36514 d!10776))

(declare-fun d!10778 () Bool)

(assert (=> d!10778 (= (invariant!0 (currentBit!2576 (_2!1888 lt!54817)) (currentByte!2581 (_2!1888 lt!54817)) (size!859 (buf!1187 (_2!1888 lt!54817)))) (and (bvsge (currentBit!2576 (_2!1888 lt!54817)) #b00000000000000000000000000000000) (bvslt (currentBit!2576 (_2!1888 lt!54817)) #b00000000000000000000000000001000) (bvsge (currentByte!2581 (_2!1888 lt!54817)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2581 (_2!1888 lt!54817)) (size!859 (buf!1187 (_2!1888 lt!54817)))) (and (= (currentBit!2576 (_2!1888 lt!54817)) #b00000000000000000000000000000000) (= (currentByte!2581 (_2!1888 lt!54817)) (size!859 (buf!1187 (_2!1888 lt!54817))))))))))

(assert (=> b!36525 d!10778))

(declare-fun d!10780 () Bool)

(declare-fun size!863 (List!444) Int)

(assert (=> d!10780 (= (length!170 lt!54811) (size!863 lt!54811))))

(declare-fun bs!2896 () Bool)

(assert (= bs!2896 d!10780))

(declare-fun m!55439 () Bool)

(assert (=> bs!2896 m!55439))

(assert (=> b!36515 d!10780))

(declare-fun d!10782 () Bool)

(assert (=> d!10782 (= (tail!161 lt!54811) (t!1194 lt!54811))))

(assert (=> b!36526 d!10782))

(declare-fun d!10784 () Bool)

(declare-fun e!24220 () Bool)

(assert (=> d!10784 e!24220))

(declare-fun res!31283 () Bool)

(assert (=> d!10784 (=> (not res!31283) (not e!24220))))

(declare-fun lt!55078 () (_ BitVec 64))

(assert (=> d!10784 (= res!31283 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!55078) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10784 (= lt!55078 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55077 () Unit!2669)

(declare-fun choose!42 (BitStream!1486 BitStream!1486 BitStream!1486 BitStream!1486 (_ BitVec 64) List!444) Unit!2669)

(assert (=> d!10784 (= lt!55077 (choose!42 (_2!1888 lt!54817) (_2!1888 lt!54817) (_1!1886 lt!54825) (_1!1886 lt!54828) (bvsub to!314 i!635) lt!54811))))

(assert (=> d!10784 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10784 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1888 lt!54817) (_2!1888 lt!54817) (_1!1886 lt!54825) (_1!1886 lt!54828) (bvsub to!314 i!635) lt!54811) lt!55077)))

(declare-fun b!36711 () Bool)

(assert (=> b!36711 (= e!24220 (= (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_1!1886 lt!54828) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!161 lt!54811)))))

(assert (= (and d!10784 res!31283) b!36711))

(declare-fun m!55441 () Bool)

(assert (=> d!10784 m!55441))

(declare-fun m!55443 () Bool)

(assert (=> b!36711 m!55443))

(assert (=> b!36711 m!55171))

(assert (=> b!36526 d!10784))

(declare-fun d!10786 () Bool)

(assert (=> d!10786 (= (head!281 (byteArrayBitContentToList!0 (_2!1888 lt!54821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!559 (byteArrayBitContentToList!0 (_2!1888 lt!54821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!36511 d!10786))

(declare-fun d!10788 () Bool)

(declare-fun c!2496 () Bool)

(assert (=> d!10788 (= c!2496 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24223 () List!444)

(assert (=> d!10788 (= (byteArrayBitContentToList!0 (_2!1888 lt!54821) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!24223)))

(declare-fun b!36716 () Bool)

(assert (=> b!36716 (= e!24223 Nil!441)))

(declare-fun b!36717 () Bool)

(assert (=> b!36717 (= e!24223 (Cons!440 (not (= (bvand ((_ sign_extend 24) (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1888 lt!54821) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10788 c!2496) b!36716))

(assert (= (and d!10788 (not c!2496)) b!36717))

(assert (=> b!36717 m!55175))

(declare-fun m!55445 () Bool)

(assert (=> b!36717 m!55445))

(declare-fun m!55447 () Bool)

(assert (=> b!36717 m!55447))

(assert (=> b!36511 d!10788))

(declare-fun d!10790 () Bool)

(assert (=> d!10790 (= (head!281 (bitStreamReadBitsIntoList!0 (_2!1888 lt!54821) (_1!1886 lt!54826) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!559 (bitStreamReadBitsIntoList!0 (_2!1888 lt!54821) (_1!1886 lt!54826) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!36511 d!10790))

(declare-fun b!36728 () Bool)

(declare-fun e!24228 () Bool)

(declare-fun lt!55087 () List!444)

(declare-fun isEmpty!103 (List!444) Bool)

(assert (=> b!36728 (= e!24228 (isEmpty!103 lt!55087))))

(declare-fun b!36729 () Bool)

(assert (=> b!36729 (= e!24228 (> (length!170 lt!55087) 0))))

(declare-fun lt!55085 () tuple2!3622)

(declare-datatypes ((tuple2!3624 0))(
  ( (tuple2!3625 (_1!1899 List!444) (_2!1899 BitStream!1486)) )
))
(declare-fun e!24229 () tuple2!3624)

(declare-fun lt!55086 () (_ BitVec 64))

(declare-fun b!36727 () Bool)

(assert (=> b!36727 (= e!24229 (tuple2!3625 (Cons!440 (_1!1898 lt!55085) (bitStreamReadBitsIntoList!0 (_2!1888 lt!54821) (_2!1898 lt!55085) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!55086))) (_2!1898 lt!55085)))))

(assert (=> b!36727 (= lt!55085 (readBit!0 (_1!1886 lt!54826)))))

(assert (=> b!36727 (= lt!55086 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10792 () Bool)

(assert (=> d!10792 e!24228))

(declare-fun c!2501 () Bool)

(assert (=> d!10792 (= c!2501 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10792 (= lt!55087 (_1!1899 e!24229))))

(declare-fun c!2502 () Bool)

(assert (=> d!10792 (= c!2502 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10792 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10792 (= (bitStreamReadBitsIntoList!0 (_2!1888 lt!54821) (_1!1886 lt!54826) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55087)))

(declare-fun b!36726 () Bool)

(assert (=> b!36726 (= e!24229 (tuple2!3625 Nil!441 (_1!1886 lt!54826)))))

(assert (= (and d!10792 c!2502) b!36726))

(assert (= (and d!10792 (not c!2502)) b!36727))

(assert (= (and d!10792 c!2501) b!36728))

(assert (= (and d!10792 (not c!2501)) b!36729))

(declare-fun m!55449 () Bool)

(assert (=> b!36728 m!55449))

(declare-fun m!55451 () Bool)

(assert (=> b!36729 m!55451))

(declare-fun m!55453 () Bool)

(assert (=> b!36727 m!55453))

(declare-fun m!55455 () Bool)

(assert (=> b!36727 m!55455))

(assert (=> b!36511 d!10792))

(declare-fun d!10800 () Bool)

(assert (=> d!10800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 thiss!1379))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 thiss!1379))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2898 () Bool)

(assert (= bs!2898 d!10800))

(assert (=> bs!2898 m!55429))

(assert (=> b!36522 d!10800))

(declare-fun d!10804 () Bool)

(assert (=> d!10804 (= (array_inv!796 srcBuffer!2) (bvsge (size!859 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7484 d!10804))

(declare-fun d!10806 () Bool)

(assert (=> d!10806 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2576 thiss!1379) (currentByte!2581 thiss!1379) (size!859 (buf!1187 thiss!1379))))))

(declare-fun bs!2899 () Bool)

(assert (= bs!2899 d!10806))

(assert (=> bs!2899 m!55431))

(assert (=> start!7484 d!10806))

(declare-fun d!10808 () Bool)

(declare-fun res!31286 () Bool)

(declare-fun e!24231 () Bool)

(assert (=> d!10808 (=> (not res!31286) (not e!24231))))

(assert (=> d!10808 (= res!31286 (= (size!859 (buf!1187 thiss!1379)) (size!859 (buf!1187 (_2!1888 lt!54821)))))))

(assert (=> d!10808 (= (isPrefixOf!0 thiss!1379 (_2!1888 lt!54821)) e!24231)))

(declare-fun b!36730 () Bool)

(declare-fun res!31284 () Bool)

(assert (=> b!36730 (=> (not res!31284) (not e!24231))))

(assert (=> b!36730 (= res!31284 (bvsle (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)) (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821)))))))

(declare-fun b!36731 () Bool)

(declare-fun e!24230 () Bool)

(assert (=> b!36731 (= e!24231 e!24230)))

(declare-fun res!31285 () Bool)

(assert (=> b!36731 (=> res!31285 e!24230)))

(assert (=> b!36731 (= res!31285 (= (size!859 (buf!1187 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36732 () Bool)

(assert (=> b!36732 (= e!24230 (arrayBitRangesEq!0 (buf!1187 thiss!1379) (buf!1187 (_2!1888 lt!54821)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379))))))

(assert (= (and d!10808 res!31286) b!36730))

(assert (= (and b!36730 res!31284) b!36731))

(assert (= (and b!36731 (not res!31285)) b!36732))

(assert (=> b!36730 m!55133))

(assert (=> b!36730 m!55185))

(assert (=> b!36732 m!55133))

(assert (=> b!36732 m!55133))

(declare-fun m!55459 () Bool)

(assert (=> b!36732 m!55459))

(assert (=> b!36523 d!10808))

(declare-fun d!10810 () Bool)

(assert (=> d!10810 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!54816) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821)))) lt!54816))))

(declare-fun bs!2900 () Bool)

(assert (= bs!2900 d!10810))

(declare-fun m!55461 () Bool)

(assert (=> bs!2900 m!55461))

(assert (=> b!36523 d!10810))

(declare-fun d!10812 () Bool)

(declare-fun e!24234 () Bool)

(assert (=> d!10812 e!24234))

(declare-fun res!31289 () Bool)

(assert (=> d!10812 (=> (not res!31289) (not e!24234))))

(assert (=> d!10812 (= res!31289 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!55093 () Unit!2669)

(declare-fun choose!27 (BitStream!1486 BitStream!1486 (_ BitVec 64) (_ BitVec 64)) Unit!2669)

(assert (=> d!10812 (= lt!55093 (choose!27 thiss!1379 (_2!1888 lt!54821) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10812 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10812 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1888 lt!54821) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55093)))

(declare-fun b!36735 () Bool)

(assert (=> b!36735 (= e!24234 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10812 res!31289) b!36735))

(declare-fun m!55465 () Bool)

(assert (=> d!10812 m!55465))

(declare-fun m!55467 () Bool)

(assert (=> b!36735 m!55467))

(assert (=> b!36523 d!10812))

(declare-fun b!36792 () Bool)

(declare-fun res!31324 () Bool)

(declare-fun e!24262 () Bool)

(assert (=> b!36792 (=> (not res!31324) (not e!24262))))

(declare-fun lt!55222 () tuple2!3602)

(declare-fun lt!55227 () (_ BitVec 64))

(declare-fun lt!55221 () (_ BitVec 64))

(assert (=> b!36792 (= res!31324 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55222))) (currentByte!2581 (_2!1888 lt!55222)) (currentBit!2576 (_2!1888 lt!55222))) (bvadd lt!55227 lt!55221)))))

(assert (=> b!36792 (or (not (= (bvand lt!55227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55221 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!55227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!55227 lt!55221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36792 (= lt!55221 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!36792 (= lt!55227 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(declare-fun b!36793 () Bool)

(declare-fun e!24265 () Bool)

(declare-fun lt!55231 () tuple2!3600)

(declare-fun lt!55226 () tuple2!3602)

(assert (=> b!36793 (= e!24265 (= (bitIndex!0 (size!859 (buf!1187 (_1!1887 lt!55231))) (currentByte!2581 (_1!1887 lt!55231)) (currentBit!2576 (_1!1887 lt!55231))) (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55226))) (currentByte!2581 (_2!1888 lt!55226)) (currentBit!2576 (_2!1888 lt!55226)))))))

(declare-fun b!36794 () Bool)

(declare-fun res!31323 () Bool)

(declare-fun e!24263 () Bool)

(assert (=> b!36794 (=> (not res!31323) (not e!24263))))

(assert (=> b!36794 (= res!31323 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55226))) (currentByte!2581 (_2!1888 lt!55226)) (currentBit!2576 (_2!1888 lt!55226))) (bvadd (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!36795 () Bool)

(declare-fun e!24264 () Bool)

(declare-fun lt!55223 () tuple2!3600)

(assert (=> b!36795 (= e!24264 (= (bitIndex!0 (size!859 (buf!1187 (_1!1887 lt!55223))) (currentByte!2581 (_1!1887 lt!55223)) (currentBit!2576 (_1!1887 lt!55223))) (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55222))) (currentByte!2581 (_2!1888 lt!55222)) (currentBit!2576 (_2!1888 lt!55222)))))))

(declare-fun b!36796 () Bool)

(declare-fun res!31322 () Bool)

(assert (=> b!36796 (=> (not res!31322) (not e!24262))))

(assert (=> b!36796 (= res!31322 (isPrefixOf!0 thiss!1379 (_2!1888 lt!55222)))))

(declare-fun b!36798 () Bool)

(assert (=> b!36798 (= e!24262 e!24264)))

(declare-fun res!31321 () Bool)

(assert (=> b!36798 (=> (not res!31321) (not e!24264))))

(declare-fun lt!55228 () (_ BitVec 8))

(assert (=> b!36798 (= res!31321 (and (= (_2!1887 lt!55223) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!55228)) #b00000000000000000000000000000000))) (= (_1!1887 lt!55223) (_2!1888 lt!55222))))))

(declare-datatypes ((tuple2!3626 0))(
  ( (tuple2!3627 (_1!1900 array!1922) (_2!1900 BitStream!1486)) )
))
(declare-fun lt!55230 () tuple2!3626)

(declare-fun lt!55229 () BitStream!1486)

(declare-fun readBits!0 (BitStream!1486 (_ BitVec 64)) tuple2!3626)

(assert (=> b!36798 (= lt!55230 (readBits!0 lt!55229 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36798 (= lt!55223 (readBitPure!0 lt!55229))))

(declare-fun readerFrom!0 (BitStream!1486 (_ BitVec 32) (_ BitVec 32)) BitStream!1486)

(assert (=> b!36798 (= lt!55229 (readerFrom!0 (_2!1888 lt!55222) (currentBit!2576 thiss!1379) (currentByte!2581 thiss!1379)))))

(declare-fun b!36799 () Bool)

(declare-fun res!31327 () Bool)

(assert (=> b!36799 (=> (not res!31327) (not e!24263))))

(assert (=> b!36799 (= res!31327 (isPrefixOf!0 thiss!1379 (_2!1888 lt!55226)))))

(declare-fun b!36797 () Bool)

(assert (=> b!36797 (= e!24263 e!24265)))

(declare-fun res!31328 () Bool)

(assert (=> b!36797 (=> (not res!31328) (not e!24265))))

(declare-fun lt!55225 () Bool)

(assert (=> b!36797 (= res!31328 (and (= (_2!1887 lt!55231) lt!55225) (= (_1!1887 lt!55231) (_2!1888 lt!55226))))))

(assert (=> b!36797 (= lt!55231 (readBitPure!0 (readerFrom!0 (_2!1888 lt!55226) (currentBit!2576 thiss!1379) (currentByte!2581 thiss!1379))))))

(declare-fun d!10816 () Bool)

(assert (=> d!10816 e!24262))

(declare-fun res!31326 () Bool)

(assert (=> d!10816 (=> (not res!31326) (not e!24262))))

(assert (=> d!10816 (= res!31326 (= (size!859 (buf!1187 (_2!1888 lt!55222))) (size!859 (buf!1187 thiss!1379))))))

(declare-fun lt!55220 () array!1922)

(assert (=> d!10816 (= lt!55228 (select (arr!1346 lt!55220) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10816 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!859 lt!55220)))))

(assert (=> d!10816 (= lt!55220 (array!1923 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!55224 () tuple2!3602)

(assert (=> d!10816 (= lt!55222 (tuple2!3603 (_1!1888 lt!55224) (_2!1888 lt!55224)))))

(assert (=> d!10816 (= lt!55224 lt!55226)))

(assert (=> d!10816 e!24263))

(declare-fun res!31325 () Bool)

(assert (=> d!10816 (=> (not res!31325) (not e!24263))))

(assert (=> d!10816 (= res!31325 (= (size!859 (buf!1187 thiss!1379)) (size!859 (buf!1187 (_2!1888 lt!55226)))))))

(declare-fun appendBit!0 (BitStream!1486 Bool) tuple2!3602)

(assert (=> d!10816 (= lt!55226 (appendBit!0 thiss!1379 lt!55225))))

(assert (=> d!10816 (= lt!55225 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10816 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10816 (= (appendBitFromByte!0 thiss!1379 (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!55222)))

(assert (= (and d!10816 res!31325) b!36794))

(assert (= (and b!36794 res!31323) b!36799))

(assert (= (and b!36799 res!31327) b!36797))

(assert (= (and b!36797 res!31328) b!36793))

(assert (= (and d!10816 res!31326) b!36792))

(assert (= (and b!36792 res!31324) b!36796))

(assert (= (and b!36796 res!31322) b!36798))

(assert (= (and b!36798 res!31321) b!36795))

(declare-fun m!55549 () Bool)

(assert (=> b!36793 m!55549))

(declare-fun m!55551 () Bool)

(assert (=> b!36793 m!55551))

(declare-fun m!55553 () Bool)

(assert (=> b!36797 m!55553))

(assert (=> b!36797 m!55553))

(declare-fun m!55555 () Bool)

(assert (=> b!36797 m!55555))

(declare-fun m!55557 () Bool)

(assert (=> b!36796 m!55557))

(assert (=> b!36794 m!55551))

(assert (=> b!36794 m!55133))

(declare-fun m!55559 () Bool)

(assert (=> b!36792 m!55559))

(assert (=> b!36792 m!55133))

(declare-fun m!55561 () Bool)

(assert (=> b!36798 m!55561))

(declare-fun m!55563 () Bool)

(assert (=> b!36798 m!55563))

(declare-fun m!55565 () Bool)

(assert (=> b!36798 m!55565))

(declare-fun m!55567 () Bool)

(assert (=> d!10816 m!55567))

(declare-fun m!55569 () Bool)

(assert (=> d!10816 m!55569))

(assert (=> d!10816 m!55445))

(declare-fun m!55571 () Bool)

(assert (=> b!36799 m!55571))

(declare-fun m!55573 () Bool)

(assert (=> b!36795 m!55573))

(assert (=> b!36795 m!55559))

(assert (=> b!36523 d!10816))

(declare-fun d!10842 () Bool)

(assert (=> d!10842 (= (head!281 (byteArrayBitContentToList!0 (_2!1888 lt!54817) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!559 (byteArrayBitContentToList!0 (_2!1888 lt!54817) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!36513 d!10842))

(declare-fun d!10844 () Bool)

(declare-fun c!2515 () Bool)

(assert (=> d!10844 (= c!2515 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24266 () List!444)

(assert (=> d!10844 (= (byteArrayBitContentToList!0 (_2!1888 lt!54817) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!24266)))

(declare-fun b!36800 () Bool)

(assert (=> b!36800 (= e!24266 Nil!441)))

(declare-fun b!36801 () Bool)

(assert (=> b!36801 (= e!24266 (Cons!440 (not (= (bvand ((_ sign_extend 24) (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1888 lt!54817) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10844 c!2515) b!36800))

(assert (= (and d!10844 (not c!2515)) b!36801))

(assert (=> b!36801 m!55175))

(assert (=> b!36801 m!55445))

(declare-fun m!55575 () Bool)

(assert (=> b!36801 m!55575))

(assert (=> b!36513 d!10844))

(declare-fun d!10846 () Bool)

(assert (=> d!10846 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2907 () Bool)

(assert (= bs!2907 d!10846))

(assert (=> bs!2907 m!55175))

(assert (=> bs!2907 m!55445))

(assert (=> b!36513 d!10846))

(declare-fun d!10848 () Bool)

(declare-fun e!24269 () Bool)

(assert (=> d!10848 e!24269))

(declare-fun res!31331 () Bool)

(assert (=> d!10848 (=> (not res!31331) (not e!24269))))

(declare-fun lt!55242 () (_ BitVec 64))

(declare-fun lt!55245 () (_ BitVec 64))

(declare-fun lt!55243 () (_ BitVec 64))

(assert (=> d!10848 (= res!31331 (= lt!55243 (bvsub lt!55242 lt!55245)))))

(assert (=> d!10848 (or (= (bvand lt!55242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55242 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55242 lt!55245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10848 (= lt!55245 (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821)))))))

(declare-fun lt!55247 () (_ BitVec 64))

(declare-fun lt!55244 () (_ BitVec 64))

(assert (=> d!10848 (= lt!55242 (bvmul lt!55247 lt!55244))))

(assert (=> d!10848 (or (= lt!55247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55244 (bvsdiv (bvmul lt!55247 lt!55244) lt!55247)))))

(assert (=> d!10848 (= lt!55244 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10848 (= lt!55247 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))))))

(assert (=> d!10848 (= lt!55243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821)))))))

(assert (=> d!10848 (invariant!0 (currentBit!2576 (_2!1888 lt!54821)) (currentByte!2581 (_2!1888 lt!54821)) (size!859 (buf!1187 (_2!1888 lt!54821))))))

(assert (=> d!10848 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))) lt!55243)))

(declare-fun b!36804 () Bool)

(declare-fun res!31332 () Bool)

(assert (=> b!36804 (=> (not res!31332) (not e!24269))))

(assert (=> b!36804 (= res!31332 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55243))))

(declare-fun b!36805 () Bool)

(declare-fun lt!55246 () (_ BitVec 64))

(assert (=> b!36805 (= e!24269 (bvsle lt!55243 (bvmul lt!55246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36805 (or (= lt!55246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55246)))))

(assert (=> b!36805 (= lt!55246 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))))))

(assert (= (and d!10848 res!31331) b!36804))

(assert (= (and b!36804 res!31332) b!36805))

(assert (=> d!10848 m!55461))

(assert (=> d!10848 m!55119))

(assert (=> b!36508 d!10848))

(declare-fun b!36839 () Bool)

(declare-fun res!31353 () Bool)

(declare-fun e!24286 () Bool)

(assert (=> b!36839 (=> (not res!31353) (not e!24286))))

(declare-fun lt!55315 () tuple2!3598)

(assert (=> b!36839 (= res!31353 (isPrefixOf!0 (_1!1886 lt!55315) thiss!1379))))

(declare-fun b!36840 () Bool)

(declare-fun e!24287 () Unit!2669)

(declare-fun lt!55318 () Unit!2669)

(assert (=> b!36840 (= e!24287 lt!55318)))

(declare-fun lt!55308 () (_ BitVec 64))

(assert (=> b!36840 (= lt!55308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55314 () (_ BitVec 64))

(assert (=> b!36840 (= lt!55314 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1922 array!1922 (_ BitVec 64) (_ BitVec 64)) Unit!2669)

(assert (=> b!36840 (= lt!55318 (arrayBitRangesEqSymmetric!0 (buf!1187 thiss!1379) (buf!1187 (_2!1888 lt!54817)) lt!55308 lt!55314))))

(assert (=> b!36840 (arrayBitRangesEq!0 (buf!1187 (_2!1888 lt!54817)) (buf!1187 thiss!1379) lt!55308 lt!55314)))

(declare-fun d!10850 () Bool)

(assert (=> d!10850 e!24286))

(declare-fun res!31352 () Bool)

(assert (=> d!10850 (=> (not res!31352) (not e!24286))))

(assert (=> d!10850 (= res!31352 (isPrefixOf!0 (_1!1886 lt!55315) (_2!1886 lt!55315)))))

(declare-fun lt!55310 () BitStream!1486)

(assert (=> d!10850 (= lt!55315 (tuple2!3599 lt!55310 (_2!1888 lt!54817)))))

(declare-fun lt!55303 () Unit!2669)

(declare-fun lt!55300 () Unit!2669)

(assert (=> d!10850 (= lt!55303 lt!55300)))

(assert (=> d!10850 (isPrefixOf!0 lt!55310 (_2!1888 lt!54817))))

(assert (=> d!10850 (= lt!55300 (lemmaIsPrefixTransitive!0 lt!55310 (_2!1888 lt!54817) (_2!1888 lt!54817)))))

(declare-fun lt!55305 () Unit!2669)

(declare-fun lt!55306 () Unit!2669)

(assert (=> d!10850 (= lt!55305 lt!55306)))

(assert (=> d!10850 (isPrefixOf!0 lt!55310 (_2!1888 lt!54817))))

(assert (=> d!10850 (= lt!55306 (lemmaIsPrefixTransitive!0 lt!55310 thiss!1379 (_2!1888 lt!54817)))))

(declare-fun lt!55317 () Unit!2669)

(assert (=> d!10850 (= lt!55317 e!24287)))

(declare-fun c!2523 () Bool)

(assert (=> d!10850 (= c!2523 (not (= (size!859 (buf!1187 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!55302 () Unit!2669)

(declare-fun lt!55307 () Unit!2669)

(assert (=> d!10850 (= lt!55302 lt!55307)))

(assert (=> d!10850 (isPrefixOf!0 (_2!1888 lt!54817) (_2!1888 lt!54817))))

(assert (=> d!10850 (= lt!55307 (lemmaIsPrefixRefl!0 (_2!1888 lt!54817)))))

(declare-fun lt!55304 () Unit!2669)

(declare-fun lt!55311 () Unit!2669)

(assert (=> d!10850 (= lt!55304 lt!55311)))

(assert (=> d!10850 (= lt!55311 (lemmaIsPrefixRefl!0 (_2!1888 lt!54817)))))

(declare-fun lt!55301 () Unit!2669)

(declare-fun lt!55299 () Unit!2669)

(assert (=> d!10850 (= lt!55301 lt!55299)))

(assert (=> d!10850 (isPrefixOf!0 lt!55310 lt!55310)))

(assert (=> d!10850 (= lt!55299 (lemmaIsPrefixRefl!0 lt!55310))))

(declare-fun lt!55312 () Unit!2669)

(declare-fun lt!55316 () Unit!2669)

(assert (=> d!10850 (= lt!55312 lt!55316)))

(assert (=> d!10850 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10850 (= lt!55316 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10850 (= lt!55310 (BitStream!1487 (buf!1187 (_2!1888 lt!54817)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(assert (=> d!10850 (isPrefixOf!0 thiss!1379 (_2!1888 lt!54817))))

(assert (=> d!10850 (= (reader!0 thiss!1379 (_2!1888 lt!54817)) lt!55315)))

(declare-fun b!36841 () Bool)

(declare-fun Unit!2685 () Unit!2669)

(assert (=> b!36841 (= e!24287 Unit!2685)))

(declare-fun lt!55309 () (_ BitVec 64))

(declare-fun b!36842 () Bool)

(declare-fun lt!55313 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1486 (_ BitVec 64)) BitStream!1486)

(assert (=> b!36842 (= e!24286 (= (_1!1886 lt!55315) (withMovedBitIndex!0 (_2!1886 lt!55315) (bvsub lt!55309 lt!55313))))))

(assert (=> b!36842 (or (= (bvand lt!55309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55309 lt!55313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36842 (= lt!55313 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54817))) (currentByte!2581 (_2!1888 lt!54817)) (currentBit!2576 (_2!1888 lt!54817))))))

(assert (=> b!36842 (= lt!55309 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(declare-fun b!36843 () Bool)

(declare-fun res!31354 () Bool)

(assert (=> b!36843 (=> (not res!31354) (not e!24286))))

(assert (=> b!36843 (= res!31354 (isPrefixOf!0 (_2!1886 lt!55315) (_2!1888 lt!54817)))))

(assert (= (and d!10850 c!2523) b!36840))

(assert (= (and d!10850 (not c!2523)) b!36841))

(assert (= (and d!10850 res!31352) b!36839))

(assert (= (and b!36839 res!31353) b!36843))

(assert (= (and b!36843 res!31354) b!36842))

(declare-fun m!55595 () Bool)

(assert (=> b!36843 m!55595))

(declare-fun m!55597 () Bool)

(assert (=> d!10850 m!55597))

(declare-fun m!55599 () Bool)

(assert (=> d!10850 m!55599))

(declare-fun m!55601 () Bool)

(assert (=> d!10850 m!55601))

(assert (=> d!10850 m!55129))

(declare-fun m!55603 () Bool)

(assert (=> d!10850 m!55603))

(declare-fun m!55605 () Bool)

(assert (=> d!10850 m!55605))

(declare-fun m!55607 () Bool)

(assert (=> d!10850 m!55607))

(assert (=> d!10850 m!55131))

(assert (=> d!10850 m!55141))

(declare-fun m!55609 () Bool)

(assert (=> d!10850 m!55609))

(declare-fun m!55611 () Bool)

(assert (=> d!10850 m!55611))

(declare-fun m!55613 () Bool)

(assert (=> b!36839 m!55613))

(declare-fun m!55615 () Bool)

(assert (=> b!36842 m!55615))

(assert (=> b!36842 m!55101))

(assert (=> b!36842 m!55133))

(assert (=> b!36840 m!55133))

(declare-fun m!55617 () Bool)

(assert (=> b!36840 m!55617))

(declare-fun m!55619 () Bool)

(assert (=> b!36840 m!55619))

(assert (=> b!36519 d!10850))

(declare-fun b!36846 () Bool)

(declare-fun e!24288 () Bool)

(declare-fun lt!55321 () List!444)

(assert (=> b!36846 (= e!24288 (isEmpty!103 lt!55321))))

(declare-fun b!36847 () Bool)

(assert (=> b!36847 (= e!24288 (> (length!170 lt!55321) 0))))

(declare-fun lt!55320 () (_ BitVec 64))

(declare-fun lt!55319 () tuple2!3622)

(declare-fun e!24289 () tuple2!3624)

(declare-fun b!36845 () Bool)

(assert (=> b!36845 (= e!24289 (tuple2!3625 (Cons!440 (_1!1898 lt!55319) (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_2!1898 lt!55319) (bvsub (bvsub to!314 i!635) lt!55320))) (_2!1898 lt!55319)))))

(assert (=> b!36845 (= lt!55319 (readBit!0 (_1!1886 lt!54825)))))

(assert (=> b!36845 (= lt!55320 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10866 () Bool)

(assert (=> d!10866 e!24288))

(declare-fun c!2524 () Bool)

(assert (=> d!10866 (= c!2524 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10866 (= lt!55321 (_1!1899 e!24289))))

(declare-fun c!2525 () Bool)

(assert (=> d!10866 (= c!2525 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10866 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10866 (= (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_1!1886 lt!54825) (bvsub to!314 i!635)) lt!55321)))

(declare-fun b!36844 () Bool)

(assert (=> b!36844 (= e!24289 (tuple2!3625 Nil!441 (_1!1886 lt!54825)))))

(assert (= (and d!10866 c!2525) b!36844))

(assert (= (and d!10866 (not c!2525)) b!36845))

(assert (= (and d!10866 c!2524) b!36846))

(assert (= (and d!10866 (not c!2524)) b!36847))

(declare-fun m!55621 () Bool)

(assert (=> b!36846 m!55621))

(declare-fun m!55623 () Bool)

(assert (=> b!36847 m!55623))

(declare-fun m!55625 () Bool)

(assert (=> b!36845 m!55625))

(assert (=> b!36845 m!55423))

(assert (=> b!36519 d!10866))

(declare-fun d!10868 () Bool)

(assert (=> d!10868 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!54816)))

(declare-fun lt!55324 () Unit!2669)

(declare-fun choose!9 (BitStream!1486 array!1922 (_ BitVec 64) BitStream!1486) Unit!2669)

(assert (=> d!10868 (= lt!55324 (choose!9 (_2!1888 lt!54821) (buf!1187 (_2!1888 lt!54817)) lt!54816 (BitStream!1487 (buf!1187 (_2!1888 lt!54817)) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821)))))))

(assert (=> d!10868 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1888 lt!54821) (buf!1187 (_2!1888 lt!54817)) lt!54816) lt!55324)))

(declare-fun bs!2909 () Bool)

(assert (= bs!2909 d!10868))

(assert (=> bs!2909 m!55111))

(declare-fun m!55627 () Bool)

(assert (=> bs!2909 m!55627))

(assert (=> b!36519 d!10868))

(declare-fun d!10870 () Bool)

(assert (=> d!10870 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!55325 () Unit!2669)

(assert (=> d!10870 (= lt!55325 (choose!9 thiss!1379 (buf!1187 (_2!1888 lt!54817)) (bvsub to!314 i!635) (BitStream!1487 (buf!1187 (_2!1888 lt!54817)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379))))))

(assert (=> d!10870 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1187 (_2!1888 lt!54817)) (bvsub to!314 i!635)) lt!55325)))

(declare-fun bs!2910 () Bool)

(assert (= bs!2910 d!10870))

(assert (=> bs!2910 m!55117))

(declare-fun m!55629 () Bool)

(assert (=> bs!2910 m!55629))

(assert (=> b!36519 d!10870))

(declare-fun d!10872 () Bool)

(assert (=> d!10872 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2911 () Bool)

(assert (= bs!2911 d!10872))

(declare-fun m!55631 () Bool)

(assert (=> bs!2911 m!55631))

(assert (=> b!36519 d!10872))

(declare-fun b!36850 () Bool)

(declare-fun e!24290 () Bool)

(declare-fun lt!55328 () List!444)

(assert (=> b!36850 (= e!24290 (isEmpty!103 lt!55328))))

(declare-fun b!36851 () Bool)

(assert (=> b!36851 (= e!24290 (> (length!170 lt!55328) 0))))

(declare-fun e!24291 () tuple2!3624)

(declare-fun b!36849 () Bool)

(declare-fun lt!55327 () (_ BitVec 64))

(declare-fun lt!55326 () tuple2!3622)

(assert (=> b!36849 (= e!24291 (tuple2!3625 (Cons!440 (_1!1898 lt!55326) (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_2!1898 lt!55326) (bvsub lt!54816 lt!55327))) (_2!1898 lt!55326)))))

(assert (=> b!36849 (= lt!55326 (readBit!0 (_1!1886 lt!54828)))))

(assert (=> b!36849 (= lt!55327 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10874 () Bool)

(assert (=> d!10874 e!24290))

(declare-fun c!2526 () Bool)

(assert (=> d!10874 (= c!2526 (= lt!54816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10874 (= lt!55328 (_1!1899 e!24291))))

(declare-fun c!2527 () Bool)

(assert (=> d!10874 (= c!2527 (= lt!54816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10874 (bvsge lt!54816 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10874 (= (bitStreamReadBitsIntoList!0 (_2!1888 lt!54817) (_1!1886 lt!54828) lt!54816) lt!55328)))

(declare-fun b!36848 () Bool)

(assert (=> b!36848 (= e!24291 (tuple2!3625 Nil!441 (_1!1886 lt!54828)))))

(assert (= (and d!10874 c!2527) b!36848))

(assert (= (and d!10874 (not c!2527)) b!36849))

(assert (= (and d!10874 c!2526) b!36850))

(assert (= (and d!10874 (not c!2526)) b!36851))

(declare-fun m!55633 () Bool)

(assert (=> b!36850 m!55633))

(declare-fun m!55635 () Bool)

(assert (=> b!36851 m!55635))

(declare-fun m!55637 () Bool)

(assert (=> b!36849 m!55637))

(declare-fun m!55639 () Bool)

(assert (=> b!36849 m!55639))

(assert (=> b!36519 d!10874))

(declare-fun b!36852 () Bool)

(declare-fun res!31356 () Bool)

(declare-fun e!24292 () Bool)

(assert (=> b!36852 (=> (not res!31356) (not e!24292))))

(declare-fun lt!55345 () tuple2!3598)

(assert (=> b!36852 (= res!31356 (isPrefixOf!0 (_1!1886 lt!55345) (_2!1888 lt!54821)))))

(declare-fun b!36853 () Bool)

(declare-fun e!24293 () Unit!2669)

(declare-fun lt!55348 () Unit!2669)

(assert (=> b!36853 (= e!24293 lt!55348)))

(declare-fun lt!55338 () (_ BitVec 64))

(assert (=> b!36853 (= lt!55338 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55344 () (_ BitVec 64))

(assert (=> b!36853 (= lt!55344 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(assert (=> b!36853 (= lt!55348 (arrayBitRangesEqSymmetric!0 (buf!1187 (_2!1888 lt!54821)) (buf!1187 (_2!1888 lt!54817)) lt!55338 lt!55344))))

(assert (=> b!36853 (arrayBitRangesEq!0 (buf!1187 (_2!1888 lt!54817)) (buf!1187 (_2!1888 lt!54821)) lt!55338 lt!55344)))

(declare-fun d!10876 () Bool)

(assert (=> d!10876 e!24292))

(declare-fun res!31355 () Bool)

(assert (=> d!10876 (=> (not res!31355) (not e!24292))))

(assert (=> d!10876 (= res!31355 (isPrefixOf!0 (_1!1886 lt!55345) (_2!1886 lt!55345)))))

(declare-fun lt!55340 () BitStream!1486)

(assert (=> d!10876 (= lt!55345 (tuple2!3599 lt!55340 (_2!1888 lt!54817)))))

(declare-fun lt!55333 () Unit!2669)

(declare-fun lt!55330 () Unit!2669)

(assert (=> d!10876 (= lt!55333 lt!55330)))

(assert (=> d!10876 (isPrefixOf!0 lt!55340 (_2!1888 lt!54817))))

(assert (=> d!10876 (= lt!55330 (lemmaIsPrefixTransitive!0 lt!55340 (_2!1888 lt!54817) (_2!1888 lt!54817)))))

(declare-fun lt!55335 () Unit!2669)

(declare-fun lt!55336 () Unit!2669)

(assert (=> d!10876 (= lt!55335 lt!55336)))

(assert (=> d!10876 (isPrefixOf!0 lt!55340 (_2!1888 lt!54817))))

(assert (=> d!10876 (= lt!55336 (lemmaIsPrefixTransitive!0 lt!55340 (_2!1888 lt!54821) (_2!1888 lt!54817)))))

(declare-fun lt!55347 () Unit!2669)

(assert (=> d!10876 (= lt!55347 e!24293)))

(declare-fun c!2528 () Bool)

(assert (=> d!10876 (= c!2528 (not (= (size!859 (buf!1187 (_2!1888 lt!54821))) #b00000000000000000000000000000000)))))

(declare-fun lt!55332 () Unit!2669)

(declare-fun lt!55337 () Unit!2669)

(assert (=> d!10876 (= lt!55332 lt!55337)))

(assert (=> d!10876 (isPrefixOf!0 (_2!1888 lt!54817) (_2!1888 lt!54817))))

(assert (=> d!10876 (= lt!55337 (lemmaIsPrefixRefl!0 (_2!1888 lt!54817)))))

(declare-fun lt!55334 () Unit!2669)

(declare-fun lt!55341 () Unit!2669)

(assert (=> d!10876 (= lt!55334 lt!55341)))

(assert (=> d!10876 (= lt!55341 (lemmaIsPrefixRefl!0 (_2!1888 lt!54817)))))

(declare-fun lt!55331 () Unit!2669)

(declare-fun lt!55329 () Unit!2669)

(assert (=> d!10876 (= lt!55331 lt!55329)))

(assert (=> d!10876 (isPrefixOf!0 lt!55340 lt!55340)))

(assert (=> d!10876 (= lt!55329 (lemmaIsPrefixRefl!0 lt!55340))))

(declare-fun lt!55342 () Unit!2669)

(declare-fun lt!55346 () Unit!2669)

(assert (=> d!10876 (= lt!55342 lt!55346)))

(assert (=> d!10876 (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!54821))))

(assert (=> d!10876 (= lt!55346 (lemmaIsPrefixRefl!0 (_2!1888 lt!54821)))))

(assert (=> d!10876 (= lt!55340 (BitStream!1487 (buf!1187 (_2!1888 lt!54817)) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(assert (=> d!10876 (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!54817))))

(assert (=> d!10876 (= (reader!0 (_2!1888 lt!54821) (_2!1888 lt!54817)) lt!55345)))

(declare-fun b!36854 () Bool)

(declare-fun Unit!2686 () Unit!2669)

(assert (=> b!36854 (= e!24293 Unit!2686)))

(declare-fun lt!55343 () (_ BitVec 64))

(declare-fun b!36855 () Bool)

(declare-fun lt!55339 () (_ BitVec 64))

(assert (=> b!36855 (= e!24292 (= (_1!1886 lt!55345) (withMovedBitIndex!0 (_2!1886 lt!55345) (bvsub lt!55339 lt!55343))))))

(assert (=> b!36855 (or (= (bvand lt!55339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55343 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55339 lt!55343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36855 (= lt!55343 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54817))) (currentByte!2581 (_2!1888 lt!54817)) (currentBit!2576 (_2!1888 lt!54817))))))

(assert (=> b!36855 (= lt!55339 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(declare-fun b!36856 () Bool)

(declare-fun res!31357 () Bool)

(assert (=> b!36856 (=> (not res!31357) (not e!24292))))

(assert (=> b!36856 (= res!31357 (isPrefixOf!0 (_2!1886 lt!55345) (_2!1888 lt!54817)))))

(assert (= (and d!10876 c!2528) b!36853))

(assert (= (and d!10876 (not c!2528)) b!36854))

(assert (= (and d!10876 res!31355) b!36852))

(assert (= (and b!36852 res!31356) b!36856))

(assert (= (and b!36856 res!31357) b!36855))

(declare-fun m!55641 () Bool)

(assert (=> b!36856 m!55641))

(assert (=> d!10876 m!55597))

(declare-fun m!55643 () Bool)

(assert (=> d!10876 m!55643))

(declare-fun m!55645 () Bool)

(assert (=> d!10876 m!55645))

(declare-fun m!55647 () Bool)

(assert (=> d!10876 m!55647))

(assert (=> d!10876 m!55603))

(declare-fun m!55649 () Bool)

(assert (=> d!10876 m!55649))

(declare-fun m!55651 () Bool)

(assert (=> d!10876 m!55651))

(declare-fun m!55653 () Bool)

(assert (=> d!10876 m!55653))

(assert (=> d!10876 m!55137))

(declare-fun m!55655 () Bool)

(assert (=> d!10876 m!55655))

(declare-fun m!55657 () Bool)

(assert (=> d!10876 m!55657))

(declare-fun m!55659 () Bool)

(assert (=> b!36852 m!55659))

(declare-fun m!55661 () Bool)

(assert (=> b!36855 m!55661))

(assert (=> b!36855 m!55101))

(assert (=> b!36855 m!55185))

(assert (=> b!36853 m!55185))

(declare-fun m!55663 () Bool)

(assert (=> b!36853 m!55663))

(declare-fun m!55665 () Bool)

(assert (=> b!36853 m!55665))

(assert (=> b!36519 d!10876))

(declare-fun d!10878 () Bool)

(assert (=> d!10878 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!54816) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54817)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821)))) lt!54816))))

(declare-fun bs!2912 () Bool)

(assert (= bs!2912 d!10878))

(declare-fun m!55667 () Bool)

(assert (=> bs!2912 m!55667))

(assert (=> b!36519 d!10878))

(declare-fun d!10880 () Bool)

(assert (=> d!10880 (= (bitAt!0 (buf!1187 (_1!1886 lt!54828)) lt!54814) (not (= (bvand ((_ sign_extend 24) (select (arr!1346 (buf!1187 (_1!1886 lt!54828))) ((_ extract 31 0) (bvsdiv lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2913 () Bool)

(assert (= bs!2913 d!10880))

(declare-fun m!55669 () Bool)

(assert (=> bs!2913 m!55669))

(assert (=> bs!2913 m!55435))

(assert (=> b!36509 d!10880))

(declare-fun d!10882 () Bool)

(assert (=> d!10882 (= (bitAt!0 (buf!1187 (_1!1886 lt!54825)) lt!54814) (not (= (bvand ((_ sign_extend 24) (select (arr!1346 (buf!1187 (_1!1886 lt!54825))) ((_ extract 31 0) (bvsdiv lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2914 () Bool)

(assert (= bs!2914 d!10882))

(declare-fun m!55671 () Bool)

(assert (=> bs!2914 m!55671))

(assert (=> bs!2914 m!55435))

(assert (=> b!36509 d!10882))

(declare-fun b!36976 () Bool)

(declare-fun lt!55743 () tuple2!3602)

(declare-fun e!24353 () Bool)

(declare-fun lt!55718 () tuple2!3598)

(assert (=> b!36976 (= e!24353 (= (bitStreamReadBitsIntoList!0 (_2!1888 lt!55743) (_1!1886 lt!55718) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1888 lt!55743) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!36976 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36976 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!55745 () Unit!2669)

(declare-fun lt!55748 () Unit!2669)

(assert (=> b!36976 (= lt!55745 lt!55748)))

(declare-fun lt!55739 () (_ BitVec 64))

(assert (=> b!36976 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!55743)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!55739)))

(assert (=> b!36976 (= lt!55748 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1888 lt!54821) (buf!1187 (_2!1888 lt!55743)) lt!55739))))

(declare-fun e!24352 () Bool)

(assert (=> b!36976 e!24352))

(declare-fun res!31442 () Bool)

(assert (=> b!36976 (=> (not res!31442) (not e!24352))))

(assert (=> b!36976 (= res!31442 (and (= (size!859 (buf!1187 (_2!1888 lt!54821))) (size!859 (buf!1187 (_2!1888 lt!55743)))) (bvsge lt!55739 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36976 (= lt!55739 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!36976 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36976 (= lt!55718 (reader!0 (_2!1888 lt!54821) (_2!1888 lt!55743)))))

(declare-fun b!36977 () Bool)

(declare-fun res!31445 () Bool)

(assert (=> b!36977 (=> (not res!31445) (not e!24353))))

(assert (=> b!36977 (= res!31445 (= (size!859 (buf!1187 (_2!1888 lt!55743))) (size!859 (buf!1187 (_2!1888 lt!54821)))))))

(declare-fun b!36978 () Bool)

(assert (=> b!36978 (= e!24352 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!55739))))

(declare-fun b!36979 () Bool)

(declare-fun e!24351 () tuple2!3602)

(declare-fun Unit!2687 () Unit!2669)

(assert (=> b!36979 (= e!24351 (tuple2!3603 Unit!2687 (_2!1888 lt!54821)))))

(assert (=> b!36979 (= (size!859 (buf!1187 (_2!1888 lt!54821))) (size!859 (buf!1187 (_2!1888 lt!54821))))))

(declare-fun lt!55738 () Unit!2669)

(declare-fun Unit!2688 () Unit!2669)

(assert (=> b!36979 (= lt!55738 Unit!2688)))

(declare-fun call!460 () tuple2!3598)

(declare-fun checkByteArrayBitContent!0 (BitStream!1486 array!1922 array!1922 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36979 (checkByteArrayBitContent!0 (_2!1888 lt!54821) srcBuffer!2 (_1!1900 (readBits!0 (_1!1886 call!460) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!36980 () Bool)

(declare-fun res!31440 () Bool)

(assert (=> b!36980 (=> (not res!31440) (not e!24353))))

(assert (=> b!36980 (= res!31440 (invariant!0 (currentBit!2576 (_2!1888 lt!55743)) (currentByte!2581 (_2!1888 lt!55743)) (size!859 (buf!1187 (_2!1888 lt!55743)))))))

(declare-fun b!36981 () Bool)

(declare-fun res!31441 () Bool)

(assert (=> b!36981 (=> (not res!31441) (not e!24353))))

(assert (=> b!36981 (= res!31441 (= (size!859 (buf!1187 (_2!1888 lt!54821))) (size!859 (buf!1187 (_2!1888 lt!55743)))))))

(declare-fun d!10884 () Bool)

(assert (=> d!10884 e!24353))

(declare-fun res!31444 () Bool)

(assert (=> d!10884 (=> (not res!31444) (not e!24353))))

(declare-fun lt!55713 () (_ BitVec 64))

(assert (=> d!10884 (= res!31444 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55743))) (currentByte!2581 (_2!1888 lt!55743)) (currentBit!2576 (_2!1888 lt!55743))) (bvsub lt!55713 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10884 (or (= (bvand lt!55713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55713 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!55730 () (_ BitVec 64))

(assert (=> d!10884 (= lt!55713 (bvadd lt!55730 to!314))))

(assert (=> d!10884 (or (not (= (bvand lt!55730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!55730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!55730 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10884 (= lt!55730 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(assert (=> d!10884 (= lt!55743 e!24351)))

(declare-fun c!2547 () Bool)

(assert (=> d!10884 (= c!2547 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!55736 () Unit!2669)

(declare-fun lt!55742 () Unit!2669)

(assert (=> d!10884 (= lt!55736 lt!55742)))

(assert (=> d!10884 (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!54821))))

(assert (=> d!10884 (= lt!55742 (lemmaIsPrefixRefl!0 (_2!1888 lt!54821)))))

(declare-fun lt!55751 () (_ BitVec 64))

(assert (=> d!10884 (= lt!55751 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(assert (=> d!10884 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10884 (= (appendBitsMSBFirstLoop!0 (_2!1888 lt!54821) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!55743)))

(declare-fun b!36982 () Bool)

(declare-fun lt!55727 () tuple2!3602)

(declare-fun Unit!2689 () Unit!2669)

(assert (=> b!36982 (= e!24351 (tuple2!3603 Unit!2689 (_2!1888 lt!55727)))))

(declare-fun lt!55755 () tuple2!3602)

(assert (=> b!36982 (= lt!55755 (appendBitFromByte!0 (_2!1888 lt!54821) (select (arr!1346 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!55750 () (_ BitVec 64))

(assert (=> b!36982 (= lt!55750 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55726 () (_ BitVec 64))

(assert (=> b!36982 (= lt!55726 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55753 () Unit!2669)

(assert (=> b!36982 (= lt!55753 (validateOffsetBitsIneqLemma!0 (_2!1888 lt!54821) (_2!1888 lt!55755) lt!55750 lt!55726))))

(assert (=> b!36982 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!55755)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!55755))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!55755))) (bvsub lt!55750 lt!55726))))

(declare-fun lt!55714 () Unit!2669)

(assert (=> b!36982 (= lt!55714 lt!55753)))

(declare-fun lt!55734 () tuple2!3598)

(assert (=> b!36982 (= lt!55734 (reader!0 (_2!1888 lt!54821) (_2!1888 lt!55755)))))

(declare-fun lt!55724 () (_ BitVec 64))

(assert (=> b!36982 (= lt!55724 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55722 () Unit!2669)

(assert (=> b!36982 (= lt!55722 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1888 lt!54821) (buf!1187 (_2!1888 lt!55755)) lt!55724))))

(assert (=> b!36982 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!55755)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!55724)))

(declare-fun lt!55749 () Unit!2669)

(assert (=> b!36982 (= lt!55749 lt!55722)))

(assert (=> b!36982 (= (head!281 (byteArrayBitContentToList!0 (_2!1888 lt!55755) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!281 (bitStreamReadBitsIntoList!0 (_2!1888 lt!55755) (_1!1886 lt!55734) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55756 () Unit!2669)

(declare-fun Unit!2690 () Unit!2669)

(assert (=> b!36982 (= lt!55756 Unit!2690)))

(assert (=> b!36982 (= lt!55727 (appendBitsMSBFirstLoop!0 (_2!1888 lt!55755) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!55729 () Unit!2669)

(assert (=> b!36982 (= lt!55729 (lemmaIsPrefixTransitive!0 (_2!1888 lt!54821) (_2!1888 lt!55755) (_2!1888 lt!55727)))))

(assert (=> b!36982 (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!55727))))

(declare-fun lt!55741 () Unit!2669)

(assert (=> b!36982 (= lt!55741 lt!55729)))

(assert (=> b!36982 (= (size!859 (buf!1187 (_2!1888 lt!55727))) (size!859 (buf!1187 (_2!1888 lt!54821))))))

(declare-fun lt!55733 () Unit!2669)

(declare-fun Unit!2691 () Unit!2669)

(assert (=> b!36982 (= lt!55733 Unit!2691)))

(assert (=> b!36982 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55727))) (currentByte!2581 (_2!1888 lt!55727)) (currentBit!2576 (_2!1888 lt!55727))) (bvsub (bvadd (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55735 () Unit!2669)

(declare-fun Unit!2692 () Unit!2669)

(assert (=> b!36982 (= lt!55735 Unit!2692)))

(assert (=> b!36982 (= (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55727))) (currentByte!2581 (_2!1888 lt!55727)) (currentBit!2576 (_2!1888 lt!55727))) (bvsub (bvsub (bvadd (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55755))) (currentByte!2581 (_2!1888 lt!55755)) (currentBit!2576 (_2!1888 lt!55755))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!55744 () Unit!2669)

(declare-fun Unit!2693 () Unit!2669)

(assert (=> b!36982 (= lt!55744 Unit!2693)))

(declare-fun lt!55728 () tuple2!3598)

(assert (=> b!36982 (= lt!55728 call!460)))

(declare-fun lt!55746 () (_ BitVec 64))

(assert (=> b!36982 (= lt!55746 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55732 () Unit!2669)

(assert (=> b!36982 (= lt!55732 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1888 lt!54821) (buf!1187 (_2!1888 lt!55727)) lt!55746))))

(assert (=> b!36982 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!55727)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!54821))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!54821))) lt!55746)))

(declare-fun lt!55754 () Unit!2669)

(assert (=> b!36982 (= lt!55754 lt!55732)))

(declare-fun lt!55723 () tuple2!3598)

(assert (=> b!36982 (= lt!55723 (reader!0 (_2!1888 lt!55755) (_2!1888 lt!55727)))))

(declare-fun lt!55752 () (_ BitVec 64))

(assert (=> b!36982 (= lt!55752 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!55725 () Unit!2669)

(assert (=> b!36982 (= lt!55725 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1888 lt!55755) (buf!1187 (_2!1888 lt!55727)) lt!55752))))

(assert (=> b!36982 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!55727)))) ((_ sign_extend 32) (currentByte!2581 (_2!1888 lt!55755))) ((_ sign_extend 32) (currentBit!2576 (_2!1888 lt!55755))) lt!55752)))

(declare-fun lt!55731 () Unit!2669)

(assert (=> b!36982 (= lt!55731 lt!55725)))

(declare-fun lt!55716 () List!444)

(assert (=> b!36982 (= lt!55716 (byteArrayBitContentToList!0 (_2!1888 lt!55727) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!55720 () List!444)

(assert (=> b!36982 (= lt!55720 (byteArrayBitContentToList!0 (_2!1888 lt!55727) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55721 () List!444)

(assert (=> b!36982 (= lt!55721 (bitStreamReadBitsIntoList!0 (_2!1888 lt!55727) (_1!1886 lt!55728) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!55747 () List!444)

(assert (=> b!36982 (= lt!55747 (bitStreamReadBitsIntoList!0 (_2!1888 lt!55727) (_1!1886 lt!55723) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55715 () (_ BitVec 64))

(assert (=> b!36982 (= lt!55715 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55740 () Unit!2669)

(assert (=> b!36982 (= lt!55740 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1888 lt!55727) (_2!1888 lt!55727) (_1!1886 lt!55728) (_1!1886 lt!55723) lt!55715 lt!55721))))

(assert (=> b!36982 (= (bitStreamReadBitsIntoList!0 (_2!1888 lt!55727) (_1!1886 lt!55723) (bvsub lt!55715 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!161 lt!55721))))

(declare-fun lt!55737 () Unit!2669)

(assert (=> b!36982 (= lt!55737 lt!55740)))

(declare-fun lt!55717 () Unit!2669)

(assert (=> b!36982 (= lt!55717 (arrayBitRangesEqImpliesEq!0 (buf!1187 (_2!1888 lt!55755)) (buf!1187 (_2!1888 lt!55727)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!55751 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!55755))) (currentByte!2581 (_2!1888 lt!55755)) (currentBit!2576 (_2!1888 lt!55755)))))))

(assert (=> b!36982 (= (bitAt!0 (buf!1187 (_2!1888 lt!55755)) lt!55751) (bitAt!0 (buf!1187 (_2!1888 lt!55727)) lt!55751))))

(declare-fun lt!55719 () Unit!2669)

(assert (=> b!36982 (= lt!55719 lt!55717)))

(declare-fun b!36983 () Bool)

(declare-fun res!31443 () Bool)

(assert (=> b!36983 (=> (not res!31443) (not e!24353))))

(assert (=> b!36983 (= res!31443 (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!55743)))))

(declare-fun bm!457 () Bool)

(assert (=> bm!457 (= call!460 (reader!0 (_2!1888 lt!54821) (ite c!2547 (_2!1888 lt!55727) (_2!1888 lt!54821))))))

(assert (= (and d!10884 c!2547) b!36982))

(assert (= (and d!10884 (not c!2547)) b!36979))

(assert (= (or b!36982 b!36979) bm!457))

(assert (= (and d!10884 res!31444) b!36980))

(assert (= (and b!36980 res!31440) b!36981))

(assert (= (and b!36981 res!31441) b!36983))

(assert (= (and b!36983 res!31443) b!36977))

(assert (= (and b!36977 res!31445) b!36976))

(assert (= (and b!36976 res!31442) b!36978))

(declare-fun m!55905 () Bool)

(assert (=> d!10884 m!55905))

(assert (=> d!10884 m!55185))

(assert (=> d!10884 m!55647))

(assert (=> d!10884 m!55653))

(declare-fun m!55907 () Bool)

(assert (=> b!36980 m!55907))

(declare-fun m!55909 () Bool)

(assert (=> bm!457 m!55909))

(assert (=> b!36982 m!55185))

(declare-fun m!55911 () Bool)

(assert (=> b!36982 m!55911))

(declare-fun m!55913 () Bool)

(assert (=> b!36982 m!55913))

(declare-fun m!55915 () Bool)

(assert (=> b!36982 m!55915))

(declare-fun m!55917 () Bool)

(assert (=> b!36982 m!55917))

(declare-fun m!55919 () Bool)

(assert (=> b!36982 m!55919))

(declare-fun m!55921 () Bool)

(assert (=> b!36982 m!55921))

(declare-fun m!55923 () Bool)

(assert (=> b!36982 m!55923))

(declare-fun m!55925 () Bool)

(assert (=> b!36982 m!55925))

(declare-fun m!55927 () Bool)

(assert (=> b!36982 m!55927))

(declare-fun m!55929 () Bool)

(assert (=> b!36982 m!55929))

(declare-fun m!55931 () Bool)

(assert (=> b!36982 m!55931))

(declare-fun m!55933 () Bool)

(assert (=> b!36982 m!55933))

(assert (=> b!36982 m!55921))

(declare-fun m!55935 () Bool)

(assert (=> b!36982 m!55935))

(declare-fun m!55937 () Bool)

(assert (=> b!36982 m!55937))

(declare-fun m!55939 () Bool)

(assert (=> b!36982 m!55939))

(declare-fun m!55941 () Bool)

(assert (=> b!36982 m!55941))

(declare-fun m!55943 () Bool)

(assert (=> b!36982 m!55943))

(declare-fun m!55945 () Bool)

(assert (=> b!36982 m!55945))

(declare-fun m!55947 () Bool)

(assert (=> b!36982 m!55947))

(declare-fun m!55949 () Bool)

(assert (=> b!36982 m!55949))

(declare-fun m!55951 () Bool)

(assert (=> b!36982 m!55951))

(declare-fun m!55953 () Bool)

(assert (=> b!36982 m!55953))

(assert (=> b!36982 m!55953))

(declare-fun m!55955 () Bool)

(assert (=> b!36982 m!55955))

(declare-fun m!55957 () Bool)

(assert (=> b!36982 m!55957))

(declare-fun m!55959 () Bool)

(assert (=> b!36982 m!55959))

(assert (=> b!36982 m!55959))

(declare-fun m!55961 () Bool)

(assert (=> b!36982 m!55961))

(declare-fun m!55963 () Bool)

(assert (=> b!36982 m!55963))

(assert (=> b!36982 m!55913))

(declare-fun m!55965 () Bool)

(assert (=> b!36982 m!55965))

(declare-fun m!55967 () Bool)

(assert (=> b!36982 m!55967))

(declare-fun m!55969 () Bool)

(assert (=> b!36982 m!55969))

(declare-fun m!55971 () Bool)

(assert (=> b!36982 m!55971))

(declare-fun m!55973 () Bool)

(assert (=> b!36983 m!55973))

(declare-fun m!55975 () Bool)

(assert (=> b!36979 m!55975))

(declare-fun m!55977 () Bool)

(assert (=> b!36979 m!55977))

(declare-fun m!55979 () Bool)

(assert (=> b!36978 m!55979))

(declare-fun m!55981 () Bool)

(assert (=> b!36976 m!55981))

(declare-fun m!55983 () Bool)

(assert (=> b!36976 m!55983))

(declare-fun m!55985 () Bool)

(assert (=> b!36976 m!55985))

(declare-fun m!55987 () Bool)

(assert (=> b!36976 m!55987))

(declare-fun m!55989 () Bool)

(assert (=> b!36976 m!55989))

(assert (=> b!36520 d!10884))

(declare-fun d!10964 () Bool)

(declare-fun res!31448 () Bool)

(declare-fun e!24355 () Bool)

(assert (=> d!10964 (=> (not res!31448) (not e!24355))))

(assert (=> d!10964 (= res!31448 (= (size!859 (buf!1187 thiss!1379)) (size!859 (buf!1187 (_2!1888 lt!54817)))))))

(assert (=> d!10964 (= (isPrefixOf!0 thiss!1379 (_2!1888 lt!54817)) e!24355)))

(declare-fun b!36984 () Bool)

(declare-fun res!31446 () Bool)

(assert (=> b!36984 (=> (not res!31446) (not e!24355))))

(assert (=> b!36984 (= res!31446 (bvsle (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)) (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54817))) (currentByte!2581 (_2!1888 lt!54817)) (currentBit!2576 (_2!1888 lt!54817)))))))

(declare-fun b!36985 () Bool)

(declare-fun e!24354 () Bool)

(assert (=> b!36985 (= e!24355 e!24354)))

(declare-fun res!31447 () Bool)

(assert (=> b!36985 (=> res!31447 e!24354)))

(assert (=> b!36985 (= res!31447 (= (size!859 (buf!1187 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36986 () Bool)

(assert (=> b!36986 (= e!24354 (arrayBitRangesEq!0 (buf!1187 thiss!1379) (buf!1187 (_2!1888 lt!54817)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379))))))

(assert (= (and d!10964 res!31448) b!36984))

(assert (= (and b!36984 res!31446) b!36985))

(assert (= (and b!36985 (not res!31447)) b!36986))

(assert (=> b!36984 m!55133))

(assert (=> b!36984 m!55101))

(assert (=> b!36986 m!55133))

(assert (=> b!36986 m!55133))

(declare-fun m!55991 () Bool)

(assert (=> b!36986 m!55991))

(assert (=> b!36520 d!10964))

(declare-fun b!36987 () Bool)

(declare-fun res!31450 () Bool)

(declare-fun e!24356 () Bool)

(assert (=> b!36987 (=> (not res!31450) (not e!24356))))

(declare-fun lt!55773 () tuple2!3598)

(assert (=> b!36987 (= res!31450 (isPrefixOf!0 (_1!1886 lt!55773) thiss!1379))))

(declare-fun b!36988 () Bool)

(declare-fun e!24357 () Unit!2669)

(declare-fun lt!55776 () Unit!2669)

(assert (=> b!36988 (= e!24357 lt!55776)))

(declare-fun lt!55766 () (_ BitVec 64))

(assert (=> b!36988 (= lt!55766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55772 () (_ BitVec 64))

(assert (=> b!36988 (= lt!55772 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(assert (=> b!36988 (= lt!55776 (arrayBitRangesEqSymmetric!0 (buf!1187 thiss!1379) (buf!1187 (_2!1888 lt!54821)) lt!55766 lt!55772))))

(assert (=> b!36988 (arrayBitRangesEq!0 (buf!1187 (_2!1888 lt!54821)) (buf!1187 thiss!1379) lt!55766 lt!55772)))

(declare-fun d!10966 () Bool)

(assert (=> d!10966 e!24356))

(declare-fun res!31449 () Bool)

(assert (=> d!10966 (=> (not res!31449) (not e!24356))))

(assert (=> d!10966 (= res!31449 (isPrefixOf!0 (_1!1886 lt!55773) (_2!1886 lt!55773)))))

(declare-fun lt!55768 () BitStream!1486)

(assert (=> d!10966 (= lt!55773 (tuple2!3599 lt!55768 (_2!1888 lt!54821)))))

(declare-fun lt!55761 () Unit!2669)

(declare-fun lt!55758 () Unit!2669)

(assert (=> d!10966 (= lt!55761 lt!55758)))

(assert (=> d!10966 (isPrefixOf!0 lt!55768 (_2!1888 lt!54821))))

(assert (=> d!10966 (= lt!55758 (lemmaIsPrefixTransitive!0 lt!55768 (_2!1888 lt!54821) (_2!1888 lt!54821)))))

(declare-fun lt!55763 () Unit!2669)

(declare-fun lt!55764 () Unit!2669)

(assert (=> d!10966 (= lt!55763 lt!55764)))

(assert (=> d!10966 (isPrefixOf!0 lt!55768 (_2!1888 lt!54821))))

(assert (=> d!10966 (= lt!55764 (lemmaIsPrefixTransitive!0 lt!55768 thiss!1379 (_2!1888 lt!54821)))))

(declare-fun lt!55775 () Unit!2669)

(assert (=> d!10966 (= lt!55775 e!24357)))

(declare-fun c!2548 () Bool)

(assert (=> d!10966 (= c!2548 (not (= (size!859 (buf!1187 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!55760 () Unit!2669)

(declare-fun lt!55765 () Unit!2669)

(assert (=> d!10966 (= lt!55760 lt!55765)))

(assert (=> d!10966 (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!54821))))

(assert (=> d!10966 (= lt!55765 (lemmaIsPrefixRefl!0 (_2!1888 lt!54821)))))

(declare-fun lt!55762 () Unit!2669)

(declare-fun lt!55769 () Unit!2669)

(assert (=> d!10966 (= lt!55762 lt!55769)))

(assert (=> d!10966 (= lt!55769 (lemmaIsPrefixRefl!0 (_2!1888 lt!54821)))))

(declare-fun lt!55759 () Unit!2669)

(declare-fun lt!55757 () Unit!2669)

(assert (=> d!10966 (= lt!55759 lt!55757)))

(assert (=> d!10966 (isPrefixOf!0 lt!55768 lt!55768)))

(assert (=> d!10966 (= lt!55757 (lemmaIsPrefixRefl!0 lt!55768))))

(declare-fun lt!55770 () Unit!2669)

(declare-fun lt!55774 () Unit!2669)

(assert (=> d!10966 (= lt!55770 lt!55774)))

(assert (=> d!10966 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10966 (= lt!55774 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10966 (= lt!55768 (BitStream!1487 (buf!1187 (_2!1888 lt!54821)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(assert (=> d!10966 (isPrefixOf!0 thiss!1379 (_2!1888 lt!54821))))

(assert (=> d!10966 (= (reader!0 thiss!1379 (_2!1888 lt!54821)) lt!55773)))

(declare-fun b!36989 () Bool)

(declare-fun Unit!2695 () Unit!2669)

(assert (=> b!36989 (= e!24357 Unit!2695)))

(declare-fun lt!55771 () (_ BitVec 64))

(declare-fun lt!55767 () (_ BitVec 64))

(declare-fun b!36990 () Bool)

(assert (=> b!36990 (= e!24356 (= (_1!1886 lt!55773) (withMovedBitIndex!0 (_2!1886 lt!55773) (bvsub lt!55767 lt!55771))))))

(assert (=> b!36990 (or (= (bvand lt!55767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55767 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55767 lt!55771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36990 (= lt!55771 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))))))

(assert (=> b!36990 (= lt!55767 (bitIndex!0 (size!859 (buf!1187 thiss!1379)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379)))))

(declare-fun b!36991 () Bool)

(declare-fun res!31451 () Bool)

(assert (=> b!36991 (=> (not res!31451) (not e!24356))))

(assert (=> b!36991 (= res!31451 (isPrefixOf!0 (_2!1886 lt!55773) (_2!1888 lt!54821)))))

(assert (= (and d!10966 c!2548) b!36988))

(assert (= (and d!10966 (not c!2548)) b!36989))

(assert (= (and d!10966 res!31449) b!36987))

(assert (= (and b!36987 res!31450) b!36991))

(assert (= (and b!36991 res!31451) b!36990))

(declare-fun m!55993 () Bool)

(assert (=> b!36991 m!55993))

(assert (=> d!10966 m!55647))

(declare-fun m!55995 () Bool)

(assert (=> d!10966 m!55995))

(declare-fun m!55997 () Bool)

(assert (=> d!10966 m!55997))

(assert (=> d!10966 m!55129))

(assert (=> d!10966 m!55653))

(declare-fun m!55999 () Bool)

(assert (=> d!10966 m!55999))

(declare-fun m!56001 () Bool)

(assert (=> d!10966 m!56001))

(assert (=> d!10966 m!55131))

(assert (=> d!10966 m!55183))

(declare-fun m!56003 () Bool)

(assert (=> d!10966 m!56003))

(declare-fun m!56005 () Bool)

(assert (=> d!10966 m!56005))

(declare-fun m!56007 () Bool)

(assert (=> b!36987 m!56007))

(declare-fun m!56009 () Bool)

(assert (=> b!36990 m!56009))

(assert (=> b!36990 m!55185))

(assert (=> b!36990 m!55133))

(assert (=> b!36988 m!55133))

(declare-fun m!56011 () Bool)

(assert (=> b!36988 m!56011))

(declare-fun m!56013 () Bool)

(assert (=> b!36988 m!56013))

(assert (=> b!36520 d!10966))

(declare-fun d!10968 () Bool)

(assert (=> d!10968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2932 () Bool)

(assert (= bs!2932 d!10968))

(declare-fun m!56015 () Bool)

(assert (=> bs!2932 m!56015))

(assert (=> b!36520 d!10968))

(declare-fun d!10970 () Bool)

(assert (=> d!10970 (validate_offset_bits!1 ((_ sign_extend 32) (size!859 (buf!1187 (_2!1888 lt!54821)))) ((_ sign_extend 32) (currentByte!2581 thiss!1379)) ((_ sign_extend 32) (currentBit!2576 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55777 () Unit!2669)

(assert (=> d!10970 (= lt!55777 (choose!9 thiss!1379 (buf!1187 (_2!1888 lt!54821)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1487 (buf!1187 (_2!1888 lt!54821)) (currentByte!2581 thiss!1379) (currentBit!2576 thiss!1379))))))

(assert (=> d!10970 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1187 (_2!1888 lt!54821)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55777)))

(declare-fun bs!2933 () Bool)

(assert (= bs!2933 d!10970))

(assert (=> bs!2933 m!55143))

(declare-fun m!56017 () Bool)

(assert (=> bs!2933 m!56017))

(assert (=> b!36520 d!10970))

(declare-fun d!10972 () Bool)

(declare-fun res!31454 () Bool)

(declare-fun e!24359 () Bool)

(assert (=> d!10972 (=> (not res!31454) (not e!24359))))

(assert (=> d!10972 (= res!31454 (= (size!859 (buf!1187 (_2!1888 lt!54821))) (size!859 (buf!1187 (_2!1888 lt!54817)))))))

(assert (=> d!10972 (= (isPrefixOf!0 (_2!1888 lt!54821) (_2!1888 lt!54817)) e!24359)))

(declare-fun b!36992 () Bool)

(declare-fun res!31452 () Bool)

(assert (=> b!36992 (=> (not res!31452) (not e!24359))))

(assert (=> b!36992 (= res!31452 (bvsle (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821))) (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54817))) (currentByte!2581 (_2!1888 lt!54817)) (currentBit!2576 (_2!1888 lt!54817)))))))

(declare-fun b!36993 () Bool)

(declare-fun e!24358 () Bool)

(assert (=> b!36993 (= e!24359 e!24358)))

(declare-fun res!31453 () Bool)

(assert (=> b!36993 (=> res!31453 e!24358)))

(assert (=> b!36993 (= res!31453 (= (size!859 (buf!1187 (_2!1888 lt!54821))) #b00000000000000000000000000000000))))

(declare-fun b!36994 () Bool)

(assert (=> b!36994 (= e!24358 (arrayBitRangesEq!0 (buf!1187 (_2!1888 lt!54821)) (buf!1187 (_2!1888 lt!54817)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!859 (buf!1187 (_2!1888 lt!54821))) (currentByte!2581 (_2!1888 lt!54821)) (currentBit!2576 (_2!1888 lt!54821)))))))

(assert (= (and d!10972 res!31454) b!36992))

(assert (= (and b!36992 res!31452) b!36993))

(assert (= (and b!36993 (not res!31453)) b!36994))

(assert (=> b!36992 m!55185))

(assert (=> b!36992 m!55101))

(assert (=> b!36994 m!55185))

(assert (=> b!36994 m!55185))

(declare-fun m!56019 () Bool)

(assert (=> b!36994 m!56019))

(assert (=> b!36520 d!10972))

(declare-fun d!10974 () Bool)

(assert (=> d!10974 (isPrefixOf!0 thiss!1379 (_2!1888 lt!54817))))

(declare-fun lt!55780 () Unit!2669)

(declare-fun choose!30 (BitStream!1486 BitStream!1486 BitStream!1486) Unit!2669)

(assert (=> d!10974 (= lt!55780 (choose!30 thiss!1379 (_2!1888 lt!54821) (_2!1888 lt!54817)))))

(assert (=> d!10974 (isPrefixOf!0 thiss!1379 (_2!1888 lt!54821))))

(assert (=> d!10974 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1888 lt!54821) (_2!1888 lt!54817)) lt!55780)))

(declare-fun bs!2934 () Bool)

(assert (= bs!2934 d!10974))

(assert (=> bs!2934 m!55141))

(declare-fun m!56021 () Bool)

(assert (=> bs!2934 m!56021))

(assert (=> bs!2934 m!55183))

(assert (=> b!36520 d!10974))

(declare-fun d!10976 () Bool)

(assert (=> d!10976 (= (bitAt!0 (buf!1187 (_2!1888 lt!54821)) lt!54814) (not (= (bvand ((_ sign_extend 24) (select (arr!1346 (buf!1187 (_2!1888 lt!54821))) ((_ extract 31 0) (bvsdiv lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54814 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2935 () Bool)

(assert (= bs!2935 d!10976))

(declare-fun m!56023 () Bool)

(assert (=> bs!2935 m!56023))

(assert (=> bs!2935 m!55435))

(assert (=> b!36510 d!10976))

(declare-fun d!10978 () Bool)

(assert (=> d!10978 (= (head!281 lt!54811) (h!559 lt!54811))))

(assert (=> b!36521 d!10978))

(push 1)

(assert (not d!10884))

(assert (not b!36797))

(assert (not b!36706))

(assert (not d!10868))

(assert (not d!10780))

(assert (not b!36801))

(assert (not b!36730))

(assert (not d!10770))

(assert (not d!10776))

(assert (not b!36851))

(assert (not b!36992))

(assert (not b!36735))

(assert (not d!10970))

(assert (not d!10800))

(assert (not d!10974))

(assert (not d!10806))

(assert (not b!36793))

(assert (not b!36795))

(assert (not d!10966))

(assert (not b!36979))

(assert (not d!10810))

(assert (not b!36729))

(assert (not b!36982))

(assert (not b!36994))

(assert (not b!36792))

(assert (not b!36711))

(assert (not b!36986))

(assert (not b!36850))

(assert (not b!36991))

(assert (not d!10816))

(assert (not b!36798))

(assert (not b!36839))

(assert (not b!36852))

(assert (not b!36855))

(assert (not bm!457))

(assert (not d!10878))

(assert (not b!36728))

(assert (not d!10850))

(assert (not b!36853))

(assert (not b!36978))

(assert (not b!36990))

(assert (not d!10768))

(assert (not b!36704))

(assert (not b!36849))

(assert (not d!10848))

(assert (not b!36988))

(assert (not b!36732))

(assert (not b!36845))

(assert (not b!36983))

(assert (not d!10812))

(assert (not d!10760))

(assert (not b!36984))

(assert (not b!36840))

(assert (not d!10870))

(assert (not b!36842))

(assert (not b!36717))

(assert (not b!36799))

(assert (not b!36980))

(assert (not b!36727))

(assert (not b!36976))

(assert (not d!10784))

(assert (not b!36987))

(assert (not b!36856))

(assert (not b!36794))

(assert (not b!36796))

(assert (not b!36843))

(assert (not d!10968))

(assert (not d!10872))

(assert (not b!36846))

(assert (not b!36847))

(assert (not d!10876))

(assert (not d!10758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

